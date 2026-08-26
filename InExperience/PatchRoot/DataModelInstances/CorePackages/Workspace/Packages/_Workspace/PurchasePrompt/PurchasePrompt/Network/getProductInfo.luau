local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)
local _ = require(parent.Parent.LuauPolyfill)
local getAssetInfoModule = require(parent.Network.getAssetInfo)
local getCreatorStoreProductInfoModule = require(parent.Network.getCreatorStoreProductInfo)
local _ = require(parent.Misc.Constants)
local isCreatorStoreAssetTypeModule = require(parent.Utils.isCreatorStoreAssetType)
local getAssetInfoUtilModule = require(parent.Utils.getAssetInfoUtil)
local getCreatorStoreProductInfoUtilModule = require(parent.Utils.getCreatorStoreProductInfoUtil)
local getExperienceProductInfoUtilModule = require(parent.Utils.getExperienceProductInfoUtil)
local getExperienceProductImageUrlModule = require(parent.Utils.getExperienceProductImageUrl)
local fFlagExperiencePurchaseFallbackToGameIconModule = require(parent.Flags.FFlagExperiencePurchaseFallbackToGameIcon)
local handleLooksProductInfoResultModule = require(parent.Utils.handleLooksProductInfoResult)
local productTypeEnum = require(parent.types).ProductTypeEnum
local fFlagEnableUnifiedProductPurchaseFlow = require(parent.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local fFlagEnableFetchCartPricingDuringInExperience = require(parent.Parent.SharedFlags).FFlagEnableFetchCartPricingDuringInExperience
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(parent.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule = require(parent.Flags.FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsell)
local getFFlagDiscountInfoForSubscriptionPurchaseModalLua = require(parent.Parent.SharedFlags).GetFFlagDiscountInfoForSubscriptionPurchaseModalLua
local fFlagRefreshPriceOnRetryAfterUpsellModule = require(parent.Flags.FFlagRefreshPriceOnRetryAfterUpsell)
local fFlagRefreshLookPriceOnRetryAfterUpsellModule = require(parent.Flags.FFlagRefreshLookPriceOnRetryAfterUpsell)
local getCatalogItemDetailsModule = require(parent.Network.getCatalogItemDetails)
local getResellersModule = require(parent.Network.getResellers)
local resolveRefreshedExpectedPriceModule = require(parent.Utils.resolveRefreshedExpectedPrice)
local fFlagFixTimedOptionRefreshModule = require(parent.Flags.FFlagFixTimedOptionRefresh)
local resolveRefreshedProductInfoModule = require(parent.Utils.resolveRefreshedProductInfo)

local function fetchRefreshedPrice(p1, p2, p3, p4)
	-- upvalues: promiseModule (ref), getCatalogItemDetailsModule (ref), getResellersModule (ref), fFlagFixTimedOptionRefreshModule (ref), resolveRefreshedProductInfoModule (ref), resolveRefreshedExpectedPriceModule (ref)
	local collectibleItemId = p4.collectibleItemId
	local collectibleItemInstanceId = p4.collectibleItemInstanceId
	
	return promiseModule.all({
		catalogItemDetails = getCatalogItemDetailsModule(p1, p2, p3):catch(function()
			return nil
		end),
		resellersData = if collectibleItemInstanceId and collectibleItemInstanceId ~= "" and (collectibleItemId and collectibleItemId ~= "") then getResellersModule(p1, collectibleItemId, 10):catch(function()
			return nil
		end) else promiseModule.resolve(nil)
	}):andThen(function(p5)
		-- upvalues: fFlagFixTimedOptionRefreshModule (copy), resolveRefreshedProductInfoModule (copy), collectibleItemInstanceId (ref), p4 (ref), resolveRefreshedExpectedPriceModule (copy)
		return if fFlagFixTimedOptionRefreshModule then resolveRefreshedProductInfoModule(p5.catalogItemDetails, p5.resellersData, collectibleItemInstanceId, p4.timedOptionDays) else resolveRefreshedExpectedPriceModule(p5.catalogItemDetails, p5.resellersData, collectibleItemInstanceId, p4.timedOptionDays)
	end)
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: getAssetInfoModule (ref), getAssetInfoUtilModule (ref), promiseModule (ref), purchaseErrorModule (ref), isCreatorStoreAssetTypeModule (ref), getCreatorStoreProductInfoModule (ref), getCreatorStoreProductInfoUtilModule (ref), fFlagEnableFetchCartPricingDuringInExperience (ref), fFlagRefreshPriceOnRetryAfterUpsellModule (ref), fetchRefreshedPrice (ref), fFlagFixTimedOptionRefreshModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), productTypeEnum (ref), fFlagExperiencePurchaseFallbackToGameIconModule (ref), getExperienceProductInfoUtilModule (ref), getExperienceProductImageUrlModule (ref), fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule (ref), handleLooksProductInfoResultModule (ref), fFlagRefreshLookPriceOnRetryAfterUpsellModule (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), getFFlagDiscountInfoForSubscriptionPurchaseModalLua (ref)
	if p3 == Enum.InfoType.Asset then
		local var1 = getAssetInfoModule(p1, p2):andThen(function(p7)
			-- upvalues: getAssetInfoUtilModule (copy), promiseModule (copy), purchaseErrorModule (copy), isCreatorStoreAssetTypeModule (copy), getCreatorStoreProductInfoModule (copy), p1 (ref), p2 (ref), getCreatorStoreProductInfoUtilModule (copy), fFlagEnableFetchCartPricingDuringInExperience (copy), p3 (ref), p6 (ref)
			local var2 = nil
			
			if p7 and p7.data and p7.data[1] then
				if not getAssetInfoUtilModule.isAssetValid(p7.data[1]) then
					return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
				end
				var2 = getAssetInfoUtilModule.fromAsset(p7.data[1])
			end
			local var3 = if var2 then var2.type else ""
			
			return if isCreatorStoreAssetTypeModule(var3) then getCreatorStoreProductInfoModule(p1, p2, var3):andThen(function(p8)
				-- upvalues: getCreatorStoreProductInfoUtilModule (copy), var2 (write), var3 (ref)
				local var4 = getCreatorStoreProductInfoUtilModule.fromProduct(p8)
				
				return {
					PriceInRobux = 0,
					AssetId = var2.id,
					AssetType = var3,
					AssetTypeId = var2.typeId,
					Creator = {
						CreatorTargetId = var2.creator.targetId,
						CreatorType = var2.creator.type
					},
					Description = var2.description,
					IsFiatPriced = var4.basePrice and (var4.basePrice.quantity and var4.basePrice.quantity.significand ~= 0),
					IsForSale = var4.purchasable,
					IsPublicDomain = var2.isPublicDomainEnabled,
					Name = var2.name,
					ProductId = var2.id
				}
			end) elseif fFlagEnableFetchCartPricingDuringInExperience then p1.getProductInfo(p2, p3):andThen(function(p8)
				-- upvalues: p6 (copy)
				return if p8.CollectibleItemId and p6 then p6(p8.CollectibleItemId):andThen(function()
					-- upvalues: p8 (ref)
					return p8
				end):catch(function()
					-- upvalues: p8 (ref)
					return p8
				end) else p8
			end):catch(function(_)
				-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
				return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
			end) else p1.getProductInfo(p2, p3):catch(function(_)
				-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
				return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
			end)
		end):catch(function(_)
			-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
			return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
		end)
		
		return if fFlagRefreshPriceOnRetryAfterUpsellModule and p5 then promiseModule.all({
			productInfo = var1,
			refreshedPrice = fetchRefreshedPrice(p1, p2, "asset", p5)
		}):andThen(function(p7)
			-- upvalues: fFlagFixTimedOptionRefreshModule (copy)
			local productInfo = p7.productInfo
			
			if fFlagFixTimedOptionRefreshModule then
				local refreshedPrice = p7.refreshedPrice
				
				if refreshedPrice == nil then
					return productInfo
				end
				for i, v in pairs(refreshedPrice) do
					productInfo[i] = v
				end
				return productInfo
			elseif p7.refreshedPrice ~= nil then
				productInfo.refreshedExpectedPrice = p7.refreshedPrice
			end
		end) else var1
	end
	return if fFlagEnableUnifiedProductPurchaseFlow and p3 == productTypeEnum.Experience then p1.getExperienceProductInfo(p2):andThen(function(p7)
		-- upvalues: p4 (ref), fFlagExperiencePurchaseFallbackToGameIconModule (copy), getExperienceProductInfoUtilModule (copy), getExperienceProductImageUrlModule (copy), p2 (ref), promiseModule (copy), purchaseErrorModule (copy)
		if p7 and p7.data and (p7.data[1] and p4.name) and (fFlagExperiencePurchaseFallbackToGameIconModule or p4.imageUrl) then
			local var2 = getExperienceProductInfoUtilModule.fromProduct(p7.data[1])
			
			return {
				IsForSale = var2.isForSale,
				PriceInRobux = var2.price,
				ProductId = var2.productId,
				SellerId = var2.sellerId,
				Name = p4.name,
				ImageUrl = if fFlagExperiencePurchaseFallbackToGameIconModule then getExperienceProductImageUrlModule(p4.imageUrl, p2) else p4.imageUrl
			}
		end
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end):catch(function(_)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end) elseif fFlagEnableUnifiedProductPurchaseFlow and p3 == productTypeEnum.Look then if fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule then p1.GetLookDetailsV2ProductInfo(p2):andThen(function(p7)
		-- upvalues: handleLooksProductInfoResultModule (copy), p4 (ref), promiseModule (copy), purchaseErrorModule (copy), fFlagRefreshLookPriceOnRetryAfterUpsellModule (copy)
		local var2 = handleLooksProductInfoResultModule(p7, p4)
		
		if not var2 then
			return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
		elseif fFlagRefreshLookPriceOnRetryAfterUpsellModule then
			var2.refreshedExpectedPrice = var2.PriceInRobux
		end
		return var2
	end):catch(function()
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end) else promiseModule.resolve({
		IsForSale = true,
		Name = "Looks",
		PriceInRobux = p4.expectedPrice
	}) elseif fFlagEnableUnifiedPurchaseFlowForDevSubs and p3 == productTypeEnum.DeveloperSubscription then p1.getSubscriptionProductInfo(p2):andThen(function(p7)
		-- upvalues: getFFlagDiscountInfoForSubscriptionPurchaseModalLua (copy), productTypeEnum (copy), promiseModule (copy), purchaseErrorModule (copy)
		if p7 and p7.Name then
			local var2 = getFFlagDiscountInfoForSubscriptionPurchaseModalLua()
			
			return {
				Name = p7.Name,
				Description = p7.Description,
				IconImageAssetId = p7.IconImageAssetId,
				IsForSale = p7.IsForSale,
				DisplayPrice = p7.DisplayPrice,
				SubscriptionProviderName = p7.SubscriptionProviderName,
				PriceInRobux = p7.PriceInRobux,
				PriceTier = p7.PriceTier,
				ProductType = productTypeEnum.DeveloperSubscription,
				UserBasePriceInRobux = if var2 then p7.UserBasePriceInRobux else nil,
				PriceDiscountDetails = if var2 then p7.PriceDiscountDetails else nil
			}
		end
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end):catch(function(_)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end) else p1.getProductInfo(p2, p3):catch(function(_)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end)
end