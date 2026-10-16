local CancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local GetUserSubscriptionDetailsModule = require(CancelSubscriptionApp.NetworkRequests.getUserSubscriptionDetails)
local CancelSubscriptionRequestedModule = require(CancelSubscriptionApp.Store.Actions.CancelSubscriptionRequested)
local CancelSubscriptionStartedModule = require(CancelSubscriptionApp.Store.Actions.CancelSubscriptionStarted)
local CancelSubscriptionFailedModule = require(CancelSubscriptionApp.Store.Actions.CancelSubscriptionFailed)
local ErrorStateEnumModule = require(CancelSubscriptionApp.Enums.ErrorStateEnum)
local LocalizationService = game:GetService("LocalizationService")

return function(p1, p2) --[[ Line: 9 | Named "InitiateCancelUserSubscriptionFlow" ]]
	-- upvalues: CancelSubscriptionRequestedModule (copy), LocalizationService (copy), ErrorStateEnumModule (copy), GetUserSubscriptionDetailsModule (copy), CancelSubscriptionStartedModule (copy), CancelSubscriptionFailedModule (copy)
	return function(p3) --[[ Line: 10 ]]
		-- upvalues: CancelSubscriptionRequestedModule (upval), p2 (copy), LocalizationService (upval), ErrorStateEnumModule (upval), GetUserSubscriptionDetailsModule (upval), p1 (copy), CancelSubscriptionStartedModule (upval), CancelSubscriptionFailedModule (upval)
		p3:dispatch(CancelSubscriptionRequestedModule(p2))
		local RobloxLocaleId = LocalizationService.RobloxLocaleId
		local ErrorCancelling = ErrorStateEnumModule.ErrorCancelling
		
		return GetUserSubscriptionDetailsModule(p1, p2):andThen(function(Result) --[[ Line: 16 ]]
			-- upvalues: RobloxLocaleId (copy), p3 (copy), CancelSubscriptionStartedModule (upval), p2 (upval), ErrorCancelling (ref), ErrorStateEnumModule (upval), CancelSubscriptionFailedModule (upval)
			if Result.SubscriptionState == Enum.SubscriptionState.SubscribedWillRenew or Result.SubscriptionState == Enum.SubscriptionState.SubscribedRenewalPaymentPending then
				p3:dispatch(CancelSubscriptionStartedModule(p2, (Result.NextRenewTime:FormatLocalTime("LL", RobloxLocaleId))))
				
				return
			end
			if Result.SubscriptionState == Enum.SubscriptionState.NeverSubscribed or Result.SubscriptionState == Enum.SubscriptionState.Expired then
				ErrorCancelling = ErrorStateEnumModule.Unsubscribed
			elseif Result.SubscriptionState == Enum.SubscriptionState.SubscribedWillNotRenew then
				ErrorCancelling = ErrorStateEnumModule.Expiring
			end
			p3:dispatch(CancelSubscriptionFailedModule(ErrorCancelling, p2))
		end):catch(function(_) --[[ Line: 35 ]]
			-- upvalues: p3 (copy), CancelSubscriptionFailedModule (upval), ErrorStateEnumModule (upval), p2 (upval)
			p3:dispatch(CancelSubscriptionFailedModule(ErrorStateEnumModule.ErrorCancelling, p2))
		end)
	end
end