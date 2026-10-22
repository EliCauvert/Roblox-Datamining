local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = require(PurchasePrompt.types)

return (require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({
	shouldSkipOwnershipCheck = false,
	shouldFetchCartPricing = false
}, {
	[require(PurchasePrompt.Actions.SetPurchaseOptions).name] = function(_, p1)
		return p1.purchaseOptions
	end
}))