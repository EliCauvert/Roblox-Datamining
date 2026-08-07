local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local rodux = require(purchasePrompt.Parent.PurchasePromptDeps).Rodux
local constantsModule = require(purchasePrompt.Misc.Constants)
local completeRequestModule = require(purchasePrompt.Actions.CompleteRequest)
local productInfoReceivedModule = require(purchasePrompt.Actions.ProductInfoReceived)
local bundleProductInfoReceivedModule = require(purchasePrompt.Actions.BundleProductInfoReceived)
local itemTypeModule = require(purchasePrompt.Enums.ItemType)
local getPreviewImageUrlModule = require(purchasePrompt.getPreviewImageUrl)
local fFlagEnableUnifiedProductPurchaseFlow = require(purchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(purchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local fFlagUnifiedPurchaseOptimizeTTIMarketplace = require(purchasePrompt.Parent.SharedFlags).FFlagUnifiedPurchaseOptimizeTTIMarketplace
local getFFlagTranslateDevProductsModule = require(purchasePrompt.Flags.GetFFlagTranslateDevProducts)
local getFFlagFixBundlePromptThumbnailModule = require(purchasePrompt.Flags.GetFFlagFixBundlePromptThumbnail)
local getFFlagEnableCreatorStorePurchasingCutoverModule = require(purchasePrompt.Flags.GetFFlagEnableCreatorStorePurchasingCutover)
local productTypeEnum = require(purchasePrompt.types).ProductTypeEnum
local fFlagEnableDiscountInfoInUnifiedPurchaseModal = require(purchasePrompt.Parent.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal
local var10 = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then require(purchasePrompt.Utils.normalizePriceDiscountDetails) else nil
local fFlagPurchasePromptFetchCartPricingForLooks = require(purchasePrompt.Parent.SharedFlags).FFlagPurchasePromptFetchCartPricingForLooks

return rodux.createReducer({}, {
	[productInfoReceivedModule.name] = function(_, p0) --[[ line: 35 ]]
		-- upvalues: fFlagUnifiedPurchaseOptimizeTTIMarketplace (ref), constantsModule (ref), getFFlagTranslateDevProductsModule (ref), fFlagEnableDiscountInfoInUnifiedPurchaseModal (ref), var10 (ref), getPreviewImageUrlModule (ref), getFFlagEnableCreatorStorePurchasingCutoverModule (ref), fFlagPurchasePromptFetchCartPricingForLooks (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), productTypeEnum (ref)
		local productInfo = p0.productInfo
		local var11 = ""
		local var12 = ""
		local var13 = nil
		
		if fFlagUnifiedPurchaseOptimizeTTIMarketplace then
			var13 = if productInfo.ProductType ~= constantsModule.ProductType.Asset then productInfo.ProductType == constantsModule.ProductType.Bundle else true
		end
		if productInfo.ProductType == constantsModule.ProductType.CollectibleItem or fFlagUnifiedPurchaseOptimizeTTIMarketplace and var13 then
			var11 = productInfo.CollectibleItemId
			var12 = productInfo.CollectibleProductId
		end
		return {
			name = getFFlagTranslateDevProductsModule() and (productInfo.DisplayName or (productInfo.Name or productInfo.Name)),
			description = productInfo.Description,
			basePrice = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then productInfo.UserBasePriceInRobux or (productInfo.BasePriceInRobux or (productInfo.PriceInRobux or 0)) else nil,
			price = productInfo.PriceInRobux or 0,
			priceDiscountDetails = if var10 then var10(productInfo.PriceDiscountDetails) else nil,
			premiumPrice = productInfo.PremiumPriceInRobux,
			imageUrl = getPreviewImageUrlModule(productInfo),
			assetTypeId = productInfo.AssetTypeId,
			assetType = if getFFlagEnableCreatorStorePurchasingCutoverModule() then productInfo.AssetType else nil,
			productId = productInfo.ProductId,
			productType = productInfo.ProductType,
			membershipTypeRequired = productInfo.MinimumMembershipLevel,
			itemType = productInfo.AssetTypeId,
			collectibleItemId = var11,
			collectibleItemIds = if fFlagPurchasePromptFetchCartPricingForLooks then productInfo.CollectibleItemIds else nil,
			cartPricingRequestedItems = if fFlagPurchasePromptFetchCartPricingForLooks then productInfo.CartPricingRequestedItems else nil,
			collectibleProductId = var12,
			productTargetId = if fFlagEnableUnifiedProductPurchaseFlow and productInfo.TargetId then productInfo.TargetId else nil,
			displayPrice = if fFlagEnableUnifiedPurchaseFlowForDevSubs and productInfo.ProductType == productTypeEnum.DeveloperSubscription then productInfo.DisplayPrice else nil
		}
	end,
	[bundleProductInfoReceivedModule.name] = function(_, p1) --[[ line: 93 ]]
		-- upvalues: getFFlagFixBundlePromptThumbnailModule (ref), itemTypeModule (ref), fFlagUnifiedPurchaseOptimizeTTIMarketplace (ref), fFlagEnableDiscountInfoInUnifiedPurchaseModal (ref), var10 (ref), getPreviewImageUrlModule (ref)
		local bundleProductInfo = p1.bundleProductInfo
		local id = nil
		
		for i, v in ipairs(bundleProductInfo.items) do
			if v.type == "UserOutfit" then
				id = v.id
				
				if getFFlagFixBundlePromptThumbnailModule() then break end
			end
		end
		bundleProductInfo.costumeId = id
		bundleProductInfo.itemType = itemTypeModule.Bundle
		
		return {
			assetTypeId = nil,
			membershipTypeRequired = nil,
			name = bundleProductInfo.name or (if fFlagUnifiedPurchaseOptimizeTTIMarketplace then bundleProductInfo.Name else nil),
			basePrice = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then bundleProductInfo.UserBasePriceInRobux or (bundleProductInfo.BasePriceInRobux or (bundleProductInfo.PriceInRobux or 0)) else nil,
			price = bundleProductInfo.product.priceInRobux or ((if fFlagUnifiedPurchaseOptimizeTTIMarketplace then bundleProductInfo.PriceInRobux else nil) or 0),
			priceDiscountDetails = if fFlagEnableDiscountInfoInUnifiedPurchaseModal and var10 then var10(bundleProductInfo.PriceDiscountDetails) else nil,
			imageUrl = getPreviewImageUrlModule(bundleProductInfo),
			productId = bundleProductInfo.product.id,
			itemType = bundleProductInfo.itemType
		}
	end,
	[completeRequestModule.name] = function(_, _) --[[ line: 133 ]]
		return {}
	end
})