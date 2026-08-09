local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local fFlagUnifiedPurchaseGamepassAddProductUniverseId = require(parent.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId

return require(parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(purchasePrompt.Actions.SetPurchaseAnalyticsMetadata).name] = function(_, p0) --[[ line: 14 ]]
		-- upvalues: fFlagUnifiedPurchaseGamepassAddProductUniverseId (ref)
		return {
			purchaseFlowUUID = p0.purchaseAnalyticsMetadata.purchaseFlowUUID,
			surface = p0.purchaseAnalyticsMetadata.surface,
			productId = p0.purchaseAnalyticsMetadata.productId,
			productType = p0.purchaseAnalyticsMetadata.productType,
			productTargetId = p0.purchaseAnalyticsMetadata.productTargetId,
			saleLocationUniverseId = p0.purchaseAnalyticsMetadata.saleLocationUniverseId,
			productUniverseId = if fFlagUnifiedPurchaseGamepassAddProductUniverseId then p0.purchaseAnalyticsMetadata.productUniverseId else nil,
			price = p0.purchaseAnalyticsMetadata.price,
			userRobuxBalance = p0.purchaseAnalyticsMetadata.userRobuxBalance,
			eventMetadata = p0.purchaseAnalyticsMetadata.eventMetadata
		}
	end
})