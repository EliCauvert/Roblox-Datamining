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
	local var5 = useDispatch()
	local var6 = useSelector(selectSubscriptionIdModule) or ""
	
	return {
		onDismissed = reactModule.useCallback(function()
			-- upvalues: marketplaceService (copy), var6 (ref), var5 (ref), cancelSubscriptionEndedModule (copy)
			marketplaceService:SignalUserSubscriptionStatusChanged(var6)
			var5(cancelSubscriptionEndedModule())
		end, { var5 })
	}
end