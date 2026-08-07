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

return function() --[[ line: 15 | named "useCancelUserSubscriptionErrorPromptProps" ]]
	-- upvalues: useSelector (ref), selectErrorStateModule (ref), useDispatch (ref), selectSubscriptionIdModule (ref), reactModule (ref), errorStateEnumModule (ref), marketplaceService (ref), cancelSubscriptionEndedModule (ref)
	local var7 = useSelector(selectErrorStateModule)
	local var8 = useDispatch()
	local var9 = useSelector(selectSubscriptionIdModule) or ""
	
	return {
		onDismiss = reactModule.useCallback(function() --[[ line: 20 ]]
			-- upvalues: var7 (ref), errorStateEnumModule (copy), marketplaceService (copy), var9 (ref), var8 (ref), cancelSubscriptionEndedModule (copy)
			if var7 == errorStateEnumModule.Expiring then
				marketplaceService:SignalUserSubscriptionStatusChanged(var9)
			end
			var8(cancelSubscriptionEndedModule())
		end, { var7, var8 }),
		errorState = var7
	}
end