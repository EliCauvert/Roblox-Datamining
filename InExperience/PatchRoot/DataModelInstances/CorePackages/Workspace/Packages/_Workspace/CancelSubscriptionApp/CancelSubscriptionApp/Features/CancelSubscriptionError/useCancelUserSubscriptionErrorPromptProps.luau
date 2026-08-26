local marketplaceService = game:GetService("MarketplaceService")
local cancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local parent = cancelSubscriptionApp.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local cancelSubscriptionEndedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionEnded)
local selectErrorStateModule = require(cancelSubscriptionApp.Store.Selectors.selectErrorState)
local errorStateEnumModule = require(cancelSubscriptionApp.Enums.ErrorStateEnum)
local selectSubscriptionIdModule = require(cancelSubscriptionApp.Store.Selectors.selectSubscriptionId)
local _ = require(script.Parent.CancelUserSubscriptionErrorPrompt)

return function()
	-- upvalues: useSelector (ref), selectErrorStateModule (ref), useDispatch (ref), selectSubscriptionIdModule (ref), reactModule (ref), errorStateEnumModule (ref), marketplaceService (ref), cancelSubscriptionEndedModule (ref)
	local var1 = useSelector(selectErrorStateModule)
	local var2 = useDispatch()
	local var3 = useSelector(selectSubscriptionIdModule) or ""
	
	return {
		onDismiss = reactModule.useCallback(function()
			-- upvalues: var1 (ref), errorStateEnumModule (copy), marketplaceService (copy), var3 (ref), var2 (ref), cancelSubscriptionEndedModule (copy)
			if var1 == errorStateEnumModule.Expiring then
				marketplaceService:SignalUserSubscriptionStatusChanged(var3)
			end
			var2(cancelSubscriptionEndedModule())
		end, { var1, var2 }),
		errorState = var1
	}
end