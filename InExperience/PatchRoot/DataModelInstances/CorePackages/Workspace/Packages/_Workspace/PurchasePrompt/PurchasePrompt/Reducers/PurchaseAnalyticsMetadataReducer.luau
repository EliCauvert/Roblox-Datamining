local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local rodux = require(parent.PurchasePromptDeps).Rodux
local setPurchaseAnalyticsMetadataModule = require(purchasePrompt.Actions.SetPurchaseAnalyticsMetadata)
local completeRequestModule = require(purchasePrompt.Actions.CompleteRequest)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagUnifiedPurchaseGamepassAddProductUniverseId = sharedFlagsModule.FFlagUnifiedPurchaseGamepassAddProductUniverseId
local fFlagPassShopPurchaseSurfaceToBuyModal = sharedFlagsModule.FFlagPassShopPurchaseSurfaceToBuyModal
local t = {}

return rodux.createReducer(t, {
	[setPurchaseAnalyticsMetadataModule.name] = function(_, p1)
		-- upvalues: fFlagUnifiedPurchaseGamepassAddProductUniverseId (ref)
		return {
			purchaseFlowUUID = p1.purchaseAnalyticsMetadata.purchaseFlowUUID,
			surface = p1.purchaseAnalyticsMetadata.surface,
			productId = p1.purchaseAnalyticsMetadata.productId,
			productType = p1.purchaseAnalyticsMetadata.productType,
			productTargetId = p1.purchaseAnalyticsMetadata.productTargetId,
			saleLocationUniverseId = p1.purchaseAnalyticsMetadata.saleLocationUniverseId,
			productUniverseId = if fFlagUnifiedPurchaseGamepassAddProductUniverseId then p1.purchaseAnalyticsMetadata.productUniverseId else nil,
			price = p1.purchaseAnalyticsMetadata.price,
			userRobuxBalance = p1.purchaseAnalyticsMetadata.userRobuxBalance,
			eventMetadata = p1.purchaseAnalyticsMetadata.eventMetadata
		}
	end,
	[completeRequestModule.name] = function(p1, _)
		-- upvalues: fFlagPassShopPurchaseSurfaceToBuyModal (ref), t (ref)
		return if fFlagPassShopPurchaseSurfaceToBuyModal then t else p1
	end
})