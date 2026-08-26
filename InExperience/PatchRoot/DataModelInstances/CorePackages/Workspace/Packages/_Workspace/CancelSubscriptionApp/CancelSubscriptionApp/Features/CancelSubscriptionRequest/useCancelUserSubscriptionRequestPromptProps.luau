local marketplaceService = game:GetService("MarketplaceService")
local cancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local parent = cancelSubscriptionApp.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local cancelSubscriptionEndedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionEnded)
local cancelSubscriptionSucceededModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionSucceeded)
local cancelSubscriptionFailedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionFailed)
local cancelSubscriptionRequestedModule = require(cancelSubscriptionApp.Store.Actions.CancelSubscriptionRequested)
local errorStateEnumModule = require(cancelSubscriptionApp.Enums.ErrorStateEnum)
local _ = require(cancelSubscriptionApp.Store.Types)
local selectExpirationDateModule = require(cancelSubscriptionApp.Store.Selectors.selectExpirationDate)
local selectSubscriptionIdModule = require(cancelSubscriptionApp.Store.Selectors.selectSubscriptionId)
local _ = require(script.Parent.CancelUserSubscriptionRequestPrompt)

return function()
	-- upvalues: useSelector (ref), selectExpirationDateModule (ref), selectSubscriptionIdModule (ref), useDispatch (ref), reactModule (ref), cancelSubscriptionEndedModule (ref), cancelSubscriptionRequestedModule (ref), marketplaceService (ref), cancelSubscriptionSucceededModule (ref), cancelSubscriptionFailedModule (ref), errorStateEnumModule (ref)
	local var1 = useSelector(selectExpirationDateModule) or ""
	local var2 = useSelector(selectSubscriptionIdModule) or ""
	local var3 = useDispatch()
	
	return {
		onCancel = reactModule.useCallback(function()
			-- upvalues: var3 (ref), cancelSubscriptionEndedModule (copy)
			var3(cancelSubscriptionEndedModule())
		end, { var3 }),
		onConfirm = reactModule.useCallback(function()
			-- upvalues: var3 (ref), cancelSubscriptionRequestedModule (copy), marketplaceService (copy), var2 (ref), cancelSubscriptionSucceededModule (copy), cancelSubscriptionFailedModule (copy), errorStateEnumModule (copy)
			var3(cancelSubscriptionRequestedModule())
			local ok, _ = pcall(function()
				-- upvalues: marketplaceService (copy), var2 (copy)
				return marketplaceService:PerformCancelSubscription(var2)
			end)
			
			if ok then
				var3(cancelSubscriptionSucceededModule(var2))
				
				return
			end
			var3(cancelSubscriptionFailedModule(errorStateEnumModule.ErrorCancelling, var2))
		end, { var3 }),
		expirationDate = var1,
		subscriptionId = var2
	}
end