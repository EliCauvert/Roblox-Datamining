local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local PurchaseFlowModule = require(PurchasePrompt.Enums.PurchaseFlow)

return require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer(false, {
	[require(PurchasePrompt.Actions.CompleteRequest).name] = function(_, _)
		-- upvalues: PurchaseFlowModule (copy)
		return PurchaseFlowModule.None
	end,
	[require(PurchasePrompt.Actions.SetPurchaseFlow).name] = function(_, p1)
		return p1.purchaseFlow
	end
})