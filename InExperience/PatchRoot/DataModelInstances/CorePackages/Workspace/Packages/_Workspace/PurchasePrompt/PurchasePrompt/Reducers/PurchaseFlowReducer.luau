local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local purchaseFlowModule = require(purchasePrompt.Enums.PurchaseFlow)

return require(purchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(false, {
	[require(purchasePrompt.Actions.CompleteRequest).name] = function(_, _)
		-- upvalues: purchaseFlowModule (ref)
		return purchaseFlowModule.None
	end,
	[require(purchasePrompt.Actions.SetPurchaseFlow).name] = function(_, p0)
		return p0.purchaseFlow
	end
})