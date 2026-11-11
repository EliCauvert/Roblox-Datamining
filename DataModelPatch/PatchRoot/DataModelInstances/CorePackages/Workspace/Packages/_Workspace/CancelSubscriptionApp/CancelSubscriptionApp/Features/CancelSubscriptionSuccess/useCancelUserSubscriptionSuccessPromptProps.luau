local CancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local Parent = CancelSubscriptionApp.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local MarketplaceService = game:GetService("MarketplaceService")
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local SelectSubscriptionIdModule = require(CancelSubscriptionApp.Store.Selectors.selectSubscriptionId)
local CancelSubscriptionEndedModule = require(CancelSubscriptionApp.Store.Actions.CancelSubscriptionEnded)
local _ = require(CancelSubscriptionApp.Store.Types)
local _ = require(script.Parent.CancelUserSubscriptionSuccessPrompt)

return function()
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), SelectSubscriptionIdModule (copy), ReactModule (copy), MarketplaceService (copy), CancelSubscriptionEndedModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(SelectSubscriptionIdModule) or ""
	
	return {
		onDismissed = ReactModule.useCallback(function()
			-- upvalues: MarketplaceService (upval), UseSelectorResult (copy), UseDispatchResult (copy), CancelSubscriptionEndedModule (upval)
			MarketplaceService:SignalUserSubscriptionStatusChanged(UseSelectorResult)
			UseDispatchResult(CancelSubscriptionEndedModule())
		end, { UseDispatchResult })
	}
end