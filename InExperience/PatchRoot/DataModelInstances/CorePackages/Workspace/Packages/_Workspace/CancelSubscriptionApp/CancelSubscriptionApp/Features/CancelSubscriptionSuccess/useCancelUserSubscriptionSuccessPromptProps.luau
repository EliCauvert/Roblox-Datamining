local cancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local parent = cancelSubscriptionApp.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local marketplaceService = game:GetService("MarketplaceService")
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local selectSubscriptionIdModule = require(cancelSubscriptionApp.Store.Selectors.selectSubscriptionId)
local cancelSubscriptionEndedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionEnded)
local _ = require(cancelSubscriptionApp.Store.Types)
local _ = require(script.Parent.CancelUserSubscriptionSuccessPrompt)

return function()
	-- upvalues: useDispatch (ref), useSelector (ref), selectSubscriptionIdModule (ref), reactModule (ref), marketplaceService (ref), cancelSubscriptionEndedModule (ref)
	local var1 = useDispatch()
	local var2 = useSelector(selectSubscriptionIdModule) or ""
	
	return {
		onDismissed = reactModule.useCallback(function()
			-- upvalues: marketplaceService (copy), var2 (ref), var1 (ref), cancelSubscriptionEndedModule (copy)
			marketplaceService:SignalUserSubscriptionStatusChanged(var2)
			var1(cancelSubscriptionEndedModule())
		end, { var1 })
	}
end