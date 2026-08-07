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
	[setPurchaseAnalyticsMetadataModule.name] = function(_, p0) --[[ line: 18 ]]
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
	end,
	[completeRequestModule.name] = function(p1, _) --[[ line: 34 ]]
		-- upvalues: fFlagPassShopPurchaseSurfaceToBuyModal (ref), t (ref)
		return if fFlagPassShopPurchaseSurfaceToBuyModal then t else p1
	end
})