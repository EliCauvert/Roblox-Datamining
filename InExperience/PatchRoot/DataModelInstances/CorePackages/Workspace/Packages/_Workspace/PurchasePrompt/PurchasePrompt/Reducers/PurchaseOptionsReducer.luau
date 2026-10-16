local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local _ = require(Parent.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId
local _ = require(PurchasePrompt.types)

return (require(Parent.PurchasePromptDeps).Rodux.createReducer({
	shouldSkipOwnershipCheck = false,
	shouldFetchCartPricing = false
}, {
	[require(PurchasePrompt.Actions.SetPurchaseOptions).name] = function(_, p1) --[[ Line: 18 ]]
		return p1.purchaseOptions
	end
}))