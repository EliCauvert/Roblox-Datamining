local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local rodux = require(parent.PurchasePromptDeps).Rodux
local setPurchaseOptionsModule = require(purchasePrompt.Actions.SetPurchaseOptions)
local _ = require(parent.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId
local _ = require(purchasePrompt.types)

return rodux.createReducer({
	shouldSkipOwnershipCheck = false,
	shouldFetchCartPricing = false
}, {
	[setPurchaseOptionsModule.name] = function(_, p0)
		return p0.purchaseOptions
	end
})