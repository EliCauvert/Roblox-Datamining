local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagUnifiedPurchaseGamepassAddProductUniverseId = SharedFlagsModule.FFlagUnifiedPurchaseGamepassAddProductUniverseId
local FFlagPassShopPurchaseSurfaceToBuyModal = SharedFlagsModule.FFlagPassShopPurchaseSurfaceToBuyModal
local t = {}

return (require(Parent.PurchasePromptDeps).Rodux.createReducer(t, {
	[require(PurchasePrompt.Actions.SetPurchaseAnalyticsMetadata).name] = function(_, p1)
		-- upvalues: FFlagUnifiedPurchaseGamepassAddProductUniverseId (copy)
		return {
			purchaseFlowUUID = p1.purchaseAnalyticsMetadata.purchaseFlowUUID,
			surface = p1.purchaseAnalyticsMetadata.surface,
			productId = p1.purchaseAnalyticsMetadata.productId,
			productType = p1.purchaseAnalyticsMetadata.productType,
			productTargetId = p1.purchaseAnalyticsMetadata.productTargetId,
			saleLocationUniverseId = p1.purchaseAnalyticsMetadata.saleLocationUniverseId,
			productUniverseId = if FFlagUnifiedPurchaseGamepassAddProductUniverseId then p1.purchaseAnalyticsMetadata.productUniverseId else nil,
			price = p1.purchaseAnalyticsMetadata.price,
			userRobuxBalance = p1.purchaseAnalyticsMetadata.userRobuxBalance,
			eventMetadata = p1.purchaseAnalyticsMetadata.eventMetadata
		}
	end,
	[require(PurchasePrompt.Actions.CompleteRequest).name] = function(p1, _)
		-- upvalues: FFlagPassShopPurchaseSurfaceToBuyModal (copy), t (copy)
		return if FFlagPassShopPurchaseSurfaceToBuyModal then t else p1
	end
}))