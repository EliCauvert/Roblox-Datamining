local cancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local getUserSubscriptionDetailsModule = require(cancelSubscriptionApp.NetworkRequests.getUserSubscriptionDetails)
local cancelSubscriptionRequestedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionRequested)
local cancelSubscriptionStartedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionStarted)
local cancelSubscriptionFailedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionFailed)
local errorStateEnumModule = require(cancelSubscriptionApp.Enums.ErrorStateEnum)
local localizationService = game:GetService("LocalizationService")

return function(p0, p1) --[[ line: 9 | named "InitiateCancelUserSubscriptionFlow" ]]
	-- upvalues: cancelSubscriptionRequestedModule (ref), localizationService (ref), errorStateEnumModule (ref), getUserSubscriptionDetailsModule (ref), cancelSubscriptionStartedModule (ref), cancelSubscriptionFailedModule (ref)
	return function(p2) --[[ line: 10 ]]
		-- upvalues: cancelSubscriptionRequestedModule (copy), p1 (ref), localizationService (copy), errorStateEnumModule (copy), getUserSubscriptionDetailsModule (copy), p0 (ref), cancelSubscriptionStartedModule (copy), cancelSubscriptionFailedModule (copy)
		p2:dispatch(cancelSubscriptionRequestedModule(p1))
		local robloxLocaleId = localizationService.RobloxLocaleId
		local errorCancelling = errorStateEnumModule.ErrorCancelling
		
		return getUserSubscriptionDetailsModule(p0, p1):andThen(function(p3) --[[ line: 16 ]]
			-- upvalues: robloxLocaleId (ref), p2 (ref), cancelSubscriptionStartedModule (copy), p1 (copy), errorCancelling (write), errorStateEnumModule (copy), cancelSubscriptionFailedModule (copy)
			if p3.SubscriptionState == Enum.SubscriptionState.SubscribedWillRenew or p3.SubscriptionState == Enum.SubscriptionState.SubscribedRenewalPaymentPending then
				p2:dispatch(cancelSubscriptionStartedModule(p1, p3.NextRenewTime:FormatLocalTime("LL", robloxLocaleId)))
				
				return
			elseif p3.SubscriptionState == Enum.SubscriptionState.NeverSubscribed or p3.SubscriptionState == Enum.SubscriptionState.Expired then
				errorCancelling = errorStateEnumModule.Unsubscribed
			elseif p3.SubscriptionState == Enum.SubscriptionState.SubscribedWillNotRenew then
				errorCancelling = errorStateEnumModule.Expiring
			end
			p2:dispatch(cancelSubscriptionFailedModule(errorCancelling, p1))
		end):catch(function(_) --[[ line: 35 ]]
			-- upvalues: p2 (ref), cancelSubscriptionFailedModule (copy), errorStateEnumModule (copy), p1 (copy)
			p2:dispatch(cancelSubscriptionFailedModule(errorStateEnumModule.ErrorCancelling, p1))
		end)
	end
end