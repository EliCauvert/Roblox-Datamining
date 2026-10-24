local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local ConstantsModule = require(PurchasePrompt.Misc.Constants)
local ItemTypeModule = require(PurchasePrompt.Enums.ItemType)
local GetPreviewImageUrlModule = require(PurchasePrompt.getPreviewImageUrl)
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(PurchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagUnifiedPurchaseOptimizeTTIMarketplace = require(PurchasePrompt.Parent.SharedFlags).FFlagUnifiedPurchaseOptimizeTTIMarketplace
local FFlagAXFixMISUpsellDiscountSummary = require(PurchasePrompt.Parent.SharedFlags).FFlagAXFixMISUpsellDiscountSummary
local GetFFlagFixBundlePromptThumbnailModule = require(PurchasePrompt.Flags.GetFFlagFixBundlePromptThumbnail)
local GetFFlagEnableCreatorStorePurchasingCutoverModule = require(PurchasePrompt.Flags.GetFFlagEnableCreatorStorePurchasingCutover)
local ProductTypeEnum = require(PurchasePrompt.types).ProductTypeEnum
local NormalizePriceDiscountDetailsModule = require(PurchasePrompt.Utils.normalizePriceDiscountDetails)
local FFlagPurchasePromptFetchCartPricingForLooks = require(PurchasePrompt.Parent.SharedFlags).FFlagPurchasePromptFetchCartPricingForLooks
local FFlagLuaAppsEnablePromptVIPServerPurchase = require(PurchasePrompt.Parent.SharedFlags).FFlagLuaAppsEnablePromptVIPServerPurchase

return (require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux.createReducer({}, {
	[require(PurchasePrompt.Actions.ProductInfoReceived).name] = function(_, p1)
		-- upvalues: FFlagUnifiedPurchaseOptimizeTTIMarketplace (copy), ConstantsModule (copy), NormalizePriceDiscountDetailsModule (copy), FFlagAXFixMISUpsellDiscountSummary (copy), GetPreviewImageUrlModule (copy), GetFFlagEnableCreatorStorePurchasingCutoverModule (copy), FFlagPurchasePromptFetchCartPricingForLooks (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), ProductTypeEnum (copy), FFlagLuaAppsEnablePromptVIPServerPurchase (copy)
		local ProductInfo = p1.productInfo
		local CollectibleItemId = ""
		local CollectibleProductId = ""
		local IsProductTypeMatch = if FFlagUnifiedPurchaseOptimizeTTIMarketplace then ProductInfo.ProductType == ConstantsModule.ProductType.Asset or ProductInfo.ProductType == ConstantsModule.ProductType.Bundle else nil
		
		if ProductInfo.ProductType == ConstantsModule.ProductType.CollectibleItem or FFlagUnifiedPurchaseOptimizeTTIMarketplace and IsProductTypeMatch then
			CollectibleItemId = ProductInfo.CollectibleItemId
			CollectibleProductId = ProductInfo.CollectibleProductId
		end
		return {
			name = ProductInfo.DisplayName or ProductInfo.Name,
			description = ProductInfo.Description,
			basePrice = ProductInfo.UserBasePriceInRobux or (ProductInfo.BasePriceInRobux or (ProductInfo.PriceInRobux or 0)),
			price = ProductInfo.PriceInRobux or 0,
			priceDiscountDetails = if NormalizePriceDiscountDetailsModule then NormalizePriceDiscountDetailsModule(ProductInfo.PriceDiscountDetails) else nil,
			savingsSummaryOverride = if FFlagAXFixMISUpsellDiscountSummary then ProductInfo.SavingsSummaryOverride else nil,
			premiumPrice = ProductInfo.PremiumPriceInRobux,
			imageUrl = GetPreviewImageUrlModule(ProductInfo),
			assetTypeId = ProductInfo.AssetTypeId,
			assetType = if GetFFlagEnableCreatorStorePurchasingCutoverModule() then ProductInfo.AssetType else nil,
			productId = ProductInfo.ProductId,
			productType = ProductInfo.ProductType,
			membershipTypeRequired = ProductInfo.MinimumMembershipLevel,
			itemType = ProductInfo.AssetTypeId,
			collectibleItemId = CollectibleItemId,
			collectibleItemIds = if FFlagPurchasePromptFetchCartPricingForLooks then ProductInfo.CollectibleItemIds else nil,
			cartPricingRequestedItems = if FFlagPurchasePromptFetchCartPricingForLooks then ProductInfo.CartPricingRequestedItems else nil,
			collectibleProductId = CollectibleProductId,
			productTargetId = if ProductInfo.TargetId then ProductInfo.TargetId else nil,
			displayPrice = if FFlagEnableUnifiedPurchaseFlowForDevSubs and ProductInfo.ProductType == ProductTypeEnum.DeveloperSubscription then ProductInfo.DisplayPrice else nil,
			isFreeWithRobloxPlus = if FFlagLuaAppsEnablePromptVIPServerPurchase then ProductInfo.IsFreeWithRobloxPlus else nil,
			isMonthlyPrice = if FFlagLuaAppsEnablePromptVIPServerPurchase then ProductInfo.IsMonthlyPrice else nil
		}
	end,
	[require(PurchasePrompt.Actions.BundleProductInfoReceived).name] = function(_, p1)
		-- upvalues: GetFFlagFixBundlePromptThumbnailModule (copy), ItemTypeModule (copy), FFlagUnifiedPurchaseOptimizeTTIMarketplace (copy), NormalizePriceDiscountDetailsModule (copy), GetPreviewImageUrlModule (copy)
		local BundleProductInfo = p1.bundleProductInfo
		local Id = nil
		
		for _, item in ipairs(BundleProductInfo.items) do
			if item.type == "UserOutfit" then
				Id = item.id
				
				if GetFFlagFixBundlePromptThumbnailModule() then break end
			end
		end
		BundleProductInfo.costumeId = Id
		BundleProductInfo.itemType = ItemTypeModule.Bundle
		
		return {
			assetTypeId = nil,
			membershipTypeRequired = nil,
			name = BundleProductInfo.name or (if FFlagUnifiedPurchaseOptimizeTTIMarketplace then BundleProductInfo.Name else nil),
			basePrice = BundleProductInfo.UserBasePriceInRobux or (BundleProductInfo.BasePriceInRobux or (BundleProductInfo.PriceInRobux or 0)),
			price = BundleProductInfo.product.priceInRobux or ((if FFlagUnifiedPurchaseOptimizeTTIMarketplace then BundleProductInfo.PriceInRobux else nil) or 0),
			priceDiscountDetails = if NormalizePriceDiscountDetailsModule then NormalizePriceDiscountDetailsModule(BundleProductInfo.PriceDiscountDetails) else nil,
			imageUrl = GetPreviewImageUrlModule(BundleProductInfo),
			productId = BundleProductInfo.product.id,
			itemType = BundleProductInfo.itemType
		}
	end,
	[require(PurchasePrompt.Actions.CompleteRequest).name] = function(_, _)
		return {}
	end
}))