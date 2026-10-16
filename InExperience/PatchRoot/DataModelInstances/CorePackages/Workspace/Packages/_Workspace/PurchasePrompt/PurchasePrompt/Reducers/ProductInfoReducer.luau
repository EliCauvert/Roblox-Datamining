local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local rodux = require(purchasePrompt.Parent.PurchasePromptDeps).Rodux
local constantsModule = require(purchasePrompt.Misc.Constants)
local completeRequestModule = require(purchasePrompt.Actions.CompleteRequest)
local productInfoReceivedModule = require(purchasePrompt.Actions.ProductInfoReceived)
local bundleProductInfoReceivedModule = require(purchasePrompt.Actions.BundleProductInfoReceived)
local itemTypeModule = require(purchasePrompt.Enums.ItemType)
local getPreviewImageUrlModule = require(purchasePrompt.getPreviewImageUrl)
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(purchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local fFlagUnifiedPurchaseOptimizeTTIMarketplace = require(purchasePrompt.Parent.SharedFlags).FFlagUnifiedPurchaseOptimizeTTIMarketplace
local fFlagAXFixMISUpsellDiscountSummary = require(purchasePrompt.Parent.SharedFlags).FFlagAXFixMISUpsellDiscountSummary
local getFFlagTranslateDevProductsModule = require(purchasePrompt.Flags.GetFFlagTranslateDevProducts)
local getFFlagFixBundlePromptThumbnailModule = require(purchasePrompt.Flags.GetFFlagFixBundlePromptThumbnail)
local getFFlagEnableCreatorStorePurchasingCutoverModule = require(purchasePrompt.Flags.GetFFlagEnableCreatorStorePurchasingCutover)
local productTypeEnum = require(purchasePrompt.types).ProductTypeEnum
local normalizePriceDiscountDetailsModule = require(purchasePrompt.Utils.normalizePriceDiscountDetails)
local fFlagPurchasePromptFetchCartPricingForLooks = require(purchasePrompt.Parent.SharedFlags).FFlagPurchasePromptFetchCartPricingForLooks

return rodux.createReducer({}, {
	[productInfoReceivedModule.name] = function(_, p1)
		-- upvalues: fFlagUnifiedPurchaseOptimizeTTIMarketplace (ref), constantsModule (ref), getFFlagTranslateDevProductsModule (ref), normalizePriceDiscountDetailsModule (ref), fFlagAXFixMISUpsellDiscountSummary (ref), getPreviewImageUrlModule (ref), getFFlagEnableCreatorStorePurchasingCutoverModule (ref), fFlagPurchasePromptFetchCartPricingForLooks (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), productTypeEnum (ref)
		local productInfo = p1.productInfo
		local var1 = ""
		local var2 = ""
		local var3 = nil
		
		if fFlagUnifiedPurchaseOptimizeTTIMarketplace then
			var3 = if productInfo.ProductType ~= constantsModule.ProductType.Asset then productInfo.ProductType == constantsModule.ProductType.Bundle else true
		end
		if productInfo.ProductType == constantsModule.ProductType.CollectibleItem or fFlagUnifiedPurchaseOptimizeTTIMarketplace and var3 then
			var1 = productInfo.CollectibleItemId
			var2 = productInfo.CollectibleProductId
		end
		return {
			name = getFFlagTranslateDevProductsModule() and (productInfo.DisplayName or (productInfo.Name or productInfo.Name)),
			description = productInfo.Description,
			basePrice = productInfo.UserBasePriceInRobux or (productInfo.BasePriceInRobux or (productInfo.PriceInRobux or 0)),
			price = productInfo.PriceInRobux or 0,
			priceDiscountDetails = if normalizePriceDiscountDetailsModule then normalizePriceDiscountDetailsModule(productInfo.PriceDiscountDetails) else nil,
			savingsSummaryOverride = if fFlagAXFixMISUpsellDiscountSummary then productInfo.SavingsSummaryOverride else nil,
			premiumPrice = productInfo.PremiumPriceInRobux,
			imageUrl = getPreviewImageUrlModule(productInfo),
			assetTypeId = productInfo.AssetTypeId,
			assetType = if getFFlagEnableCreatorStorePurchasingCutoverModule() then productInfo.AssetType else nil,
			productId = productInfo.ProductId,
			productType = productInfo.ProductType,
			membershipTypeRequired = productInfo.MinimumMembershipLevel,
			itemType = productInfo.AssetTypeId,
			collectibleItemId = var1,
			collectibleItemIds = if fFlagPurchasePromptFetchCartPricingForLooks then productInfo.CollectibleItemIds else nil,
			cartPricingRequestedItems = if fFlagPurchasePromptFetchCartPricingForLooks then productInfo.CartPricingRequestedItems else nil,
			collectibleProductId = var2,
			productTargetId = if productInfo.TargetId then productInfo.TargetId else nil,
			displayPrice = if fFlagEnableUnifiedPurchaseFlowForDevSubs and productInfo.ProductType == productTypeEnum.DeveloperSubscription then productInfo.DisplayPrice else nil
		}
	end,
	[bundleProductInfoReceivedModule.name] = function(_, p1)
		-- upvalues: getFFlagFixBundlePromptThumbnailModule (ref), itemTypeModule (ref), fFlagUnifiedPurchaseOptimizeTTIMarketplace (ref), normalizePriceDiscountDetailsModule (ref), getPreviewImageUrlModule (ref)
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
			basePrice = bundleProductInfo.UserBasePriceInRobux or (bundleProductInfo.BasePriceInRobux or (bundleProductInfo.PriceInRobux or 0)),
			price = bundleProductInfo.product.priceInRobux or ((if fFlagUnifiedPurchaseOptimizeTTIMarketplace then bundleProductInfo.PriceInRobux else nil) or 0),
			priceDiscountDetails = if normalizePriceDiscountDetailsModule then normalizePriceDiscountDetailsModule(bundleProductInfo.PriceDiscountDetails) else nil,
			imageUrl = getPreviewImageUrlModule(bundleProductInfo),
			productId = bundleProductInfo.product.id,
			itemType = bundleProductInfo.itemType
		}
	end,
	[completeRequestModule.name] = function(_, _)
		return {}
	end
})