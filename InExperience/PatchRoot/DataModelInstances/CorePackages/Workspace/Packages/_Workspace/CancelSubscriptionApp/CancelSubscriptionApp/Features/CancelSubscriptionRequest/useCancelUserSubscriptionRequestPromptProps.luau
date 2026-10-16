local MarketplaceService = game:GetService("MarketplaceService")
local CancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local Parent = CancelSubscriptionApp.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local CancelSubscriptionEndedModule = require(CancelSubscriptionApp.Store.Actions.CancelSubscriptionEnded)
local CancelSubscriptionSucceededModule = require(CancelSubscriptionApp.Store.Actions.CancelSubscriptionSucceeded)
local CancelSubscriptionFailedModule = require(CancelSubscriptionApp.Store.Actions.CancelSubscriptionFailed)
local CancelSubscriptionRequestedModule = require(CancelSubscriptionApp.Store.Actions.CancelSubscriptionRequested)
local ErrorStateEnumModule = require(CancelSubscriptionApp.Enums.ErrorStateEnum)
local _ = require(CancelSubscriptionApp.Store.Types)
local SelectExpirationDateModule = require(CancelSubscriptionApp.Store.Selectors.selectExpirationDate)
local SelectSubscriptionIdModule = require(CancelSubscriptionApp.Store.Selectors.selectSubscriptionId)
local _ = require(script.Parent.CancelUserSubscriptionRequestPrompt)

return function() --[[ Line: 23 | Named "useCancelUserSubscriptionRequestPromptProps" ]]
	-- upvalues: UseSelectorFunction (copy), SelectExpirationDateModule (copy), SelectSubscriptionIdModule (copy), UseDispatchFunction (copy), ReactModule (copy), CancelSubscriptionEndedModule (copy), CancelSubscriptionRequestedModule (copy), MarketplaceService (copy), CancelSubscriptionSucceededModule (copy), CancelSubscriptionFailedModule (copy), ErrorStateEnumModule (copy)
	local UseSelectorResult = UseSelectorFunction(SelectExpirationDateModule) or ""
	local UseSelectorResult1 = UseSelectorFunction(SelectSubscriptionIdModule) or ""
	local UseDispatchResult = UseDispatchFunction()
	
	return {
		onCancel = ReactModule.useCallback(function() --[[ Line: 28 ]]
			-- upvalues: UseDispatchResult (copy), CancelSubscriptionEndedModule (upval)
			UseDispatchResult(CancelSubscriptionEndedModule())
		end, { UseDispatchResult }),
		onConfirm = ReactModule.useCallback(function() --[[ Line: 32 ]]
			-- upvalues: UseDispatchResult (copy), CancelSubscriptionRequestedModule (upval), MarketplaceService (upval), UseSelectorResult1 (copy), CancelSubscriptionSucceededModule (upval), CancelSubscriptionFailedModule (upval), ErrorStateEnumModule (upval)
			UseDispatchResult(CancelSubscriptionRequestedModule())
			local Success, _ = pcall(function() --[[ Line: 34 ]]
				-- upvalues: MarketplaceService (upval), UseSelectorResult1 (upval)
				return MarketplaceService:PerformCancelSubscription(UseSelectorResult1)
			end)
			
			if Success then
				UseDispatchResult(CancelSubscriptionSucceededModule(UseSelectorResult1))
				
				return
			else
				UseDispatchResult(CancelSubscriptionFailedModule(ErrorStateEnumModule.ErrorCancelling, UseSelectorResult1))
			end
		end, { UseDispatchResult }),
		expirationDate = UseSelectorResult,
		subscriptionId = UseSelectorResult1
	}
end