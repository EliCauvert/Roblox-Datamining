local cancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local getUserSubscriptionDetailsModule = require(cancelSubscriptionApp.NetworkRequests.getUserSubscriptionDetails)
local cancelSubscriptionRequestedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionRequested)
local cancelSubscriptionStartedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionStarted)
local cancelSubscriptionFailedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionFailed)
local errorStateEnumModule = require(cancelSubscriptionApp.Enums.ErrorStateEnum)
local localizationService = game:GetService("LocalizationService")

return function(p1, p2)
	-- upvalues: cancelSubscriptionRequestedModule (ref), localizationService (ref), errorStateEnumModule (ref), getUserSubscriptionDetailsModule (ref), cancelSubscriptionStartedModule (ref), cancelSubscriptionFailedModule (ref)
	return function(p3)
		-- upvalues: cancelSubscriptionRequestedModule (copy), p2 (ref), localizationService (copy), errorStateEnumModule (copy), getUserSubscriptionDetailsModule (copy), p1 (ref), cancelSubscriptionStartedModule (copy), cancelSubscriptionFailedModule (copy)
		p3:dispatch(cancelSubscriptionRequestedModule(p2))
		local robloxLocaleId = localizationService.RobloxLocaleId
		local errorCancelling = errorStateEnumModule.ErrorCancelling
		
		return getUserSubscriptionDetailsModule(p1, p2):andThen(function(p4)
			-- upvalues: robloxLocaleId (ref), p3 (ref), cancelSubscriptionStartedModule (copy), p2 (copy), errorCancelling (write), errorStateEnumModule (copy), cancelSubscriptionFailedModule (copy)
			if p4.SubscriptionState == Enum.SubscriptionState.SubscribedWillRenew or p4.SubscriptionState == Enum.SubscriptionState.SubscribedRenewalPaymentPending then
				p3:dispatch(cancelSubscriptionStartedModule(p2, p4.NextRenewTime:FormatLocalTime("LL", robloxLocaleId)))
				
				return
			elseif p4.SubscriptionState == Enum.SubscriptionState.NeverSubscribed or p4.SubscriptionState == Enum.SubscriptionState.Expired then
				errorCancelling = errorStateEnumModule.Unsubscribed
			elseif p4.SubscriptionState == Enum.SubscriptionState.SubscribedWillNotRenew then
				errorCancelling = errorStateEnumModule.Expiring
			end
			p3:dispatch(cancelSubscriptionFailedModule(errorCancelling, p2))
		end):catch(function(_)
			-- upvalues: p3 (ref), cancelSubscriptionFailedModule (copy), errorStateEnumModule (copy), p2 (copy)
			p3:dispatch(cancelSubscriptionFailedModule(errorStateEnumModule.ErrorCancelling, p2))
		end)
	end
end