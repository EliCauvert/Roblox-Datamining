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

return function() --[[ line: 23 | named "useCancelUserSubscriptionRequestPromptProps" ]]
	-- upvalues: useSelector (ref), selectExpirationDateModule (ref), selectSubscriptionIdModule (ref), useDispatch (ref), reactModule (ref), cancelSubscriptionEndedModule (ref), cancelSubscriptionRequestedModule (ref), marketplaceService (ref), cancelSubscriptionSucceededModule (ref), cancelSubscriptionFailedModule (ref), errorStateEnumModule (ref)
	local var10 = useSelector(selectExpirationDateModule) or ""
	local var11 = useSelector(selectSubscriptionIdModule) or ""
	local var12 = useDispatch()
	
	return {
		onCancel = reactModule.useCallback(function() --[[ line: 28 ]]
			-- upvalues: var12 (ref), cancelSubscriptionEndedModule (copy)
			var12(cancelSubscriptionEndedModule())
		end, { var12 }),
		onConfirm = reactModule.useCallback(function() --[[ line: 32 ]]
			-- upvalues: var12 (ref), cancelSubscriptionRequestedModule (copy), marketplaceService (copy), var11 (ref), cancelSubscriptionSucceededModule (copy), cancelSubscriptionFailedModule (copy), errorStateEnumModule (copy)
			var12(cancelSubscriptionRequestedModule())
			local ok, _ = pcall(function() --[[ line: 34 ]]
				-- upvalues: marketplaceService (copy), var11 (copy)
				return marketplaceService:PerformCancelSubscription(var11)
			end)
			
			if ok then
				var12(cancelSubscriptionSucceededModule(var11))
				
				return
			end
			var12(cancelSubscriptionFailedModule(errorStateEnumModule.ErrorCancelling, var11))
		end, { var12 }),
		expirationDate = var10,
		subscriptionId = var11
	}
end