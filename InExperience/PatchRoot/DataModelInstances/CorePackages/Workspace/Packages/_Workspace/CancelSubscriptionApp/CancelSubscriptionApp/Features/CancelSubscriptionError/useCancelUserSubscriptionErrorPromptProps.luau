local MarketplaceService = game:GetService("MarketplaceService")
local CancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local Parent = CancelSubscriptionApp.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local CancelSubscriptionEndedModule = require(CancelSubscriptionApp.Store.Actions.CancelSubscriptionEnded)
local SelectErrorStateModule = require(CancelSubscriptionApp.Store.Selectors.selectErrorState)
local ErrorStateEnumModule = require(CancelSubscriptionApp.Enums.ErrorStateEnum)
local SelectSubscriptionIdModule = require(CancelSubscriptionApp.Store.Selectors.selectSubscriptionId)
local _ = require(script.Parent.CancelUserSubscriptionErrorPrompt)

return function() --[[ Line: 15 | Named "useCancelUserSubscriptionErrorPromptProps" ]]
	-- upvalues: UseSelectorFunction (copy), SelectErrorStateModule (copy), UseDispatchFunction (copy), SelectSubscriptionIdModule (copy), ReactModule (copy), ErrorStateEnumModule (copy), MarketplaceService (copy), CancelSubscriptionEndedModule (copy)
	local UseSelectorResult = UseSelectorFunction(SelectErrorStateModule)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult1 = UseSelectorFunction(SelectSubscriptionIdModule) or ""
	
	return {
		onDismiss = ReactModule.useCallback(function() --[[ Line: 20 ]]
			-- upvalues: UseSelectorResult (copy), ErrorStateEnumModule (upval), MarketplaceService (upval), UseSelectorResult1 (copy), UseDispatchResult (copy), CancelSubscriptionEndedModule (upval)
			if UseSelectorResult == ErrorStateEnumModule.Expiring then
				MarketplaceService:SignalUserSubscriptionStatusChanged(UseSelectorResult1)
			end
			UseDispatchResult(CancelSubscriptionEndedModule())
		end, { UseSelectorResult, UseDispatchResult }),
		errorState = UseSelectorResult
	}
end