local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local Rodux = require(Parent.PurchasePromptDeps).Rodux
local SetPurchaseAnalyticsMetadataModule = require(PurchasePrompt.Actions.SetPurchaseAnalyticsMetadata)
local CompleteRequestModule = require(PurchasePrompt.Actions.CompleteRequest)
local FFlagPassShopPurchaseSurfaceToBuyModal = require(Parent.SharedFlags).FFlagPassShopPurchaseSurfaceToBuyModal
local t = {}

return (Rodux.createReducer(t, {
	[SetPurchaseAnalyticsMetadataModule.name] = function(_, p1)
		return {
			purchaseFlowUUID = p1.purchaseAnalyticsMetadata.purchaseFlowUUID,
			surface = p1.purchaseAnalyticsMetadata.surface,
			productId = p1.purchaseAnalyticsMetadata.productId,
			productType = p1.purchaseAnalyticsMetadata.productType,
			productTargetId = p1.purchaseAnalyticsMetadata.productTargetId,
			saleLocationUniverseId = p1.purchaseAnalyticsMetadata.saleLocationUniverseId,
			productUniverseId = p1.purchaseAnalyticsMetadata.productUniverseId,
			price = p1.purchaseAnalyticsMetadata.price,
			userRobuxBalance = p1.purchaseAnalyticsMetadata.userRobuxBalance,
			eventMetadata = p1.purchaseAnalyticsMetadata.eventMetadata
		}
	end,
	[CompleteRequestModule.name] = function(p1, _)
		-- upvalues: FFlagPassShopPurchaseSurfaceToBuyModal (copy), t (copy)
		return if FFlagPassShopPurchaseSurfaceToBuyModal then t else p1
	end
}))