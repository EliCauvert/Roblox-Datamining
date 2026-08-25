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

local function fetchRefreshedPrice(p0, p1, p2, p3)
	-- upvalues: promiseModule (ref), getCatalogItemDetailsModule (ref), getResellersModule (ref), fFlagFixTimedOptionRefreshModule (ref), resolveRefreshedProductInfoModule (ref), resolveRefreshedExpectedPriceModule (ref)
	local collectibleItemId = p3.collectibleItemId
	local collectibleItemInstanceId = p3.collectibleItemInstanceId
	
	return promiseModule.all({
		catalogItemDetails = getCatalogItemDetailsModule(p0, p1, p2):catch(function()
			return nil
		end),
		resellersData = if collectibleItemInstanceId and collectibleItemInstanceId ~= "" and (collectibleItemId and collectibleItemId ~= "") then getResellersModule(p0, collectibleItemId, 10):catch(function()
			return nil
		end) else promiseModule.resolve(nil)
	}):andThen(function(p4)
		-- upvalues: fFlagFixTimedOptionRefreshModule (copy), resolveRefreshedProductInfoModule (copy), collectibleItemInstanceId (ref), p3 (ref), resolveRefreshedExpectedPriceModule (copy)
		return if fFlagFixTimedOptionRefreshModule then resolveRefreshedProductInfoModule(p4.catalogItemDetails, p4.resellersData, collectibleItemInstanceId, p3.timedOptionDays) else resolveRefreshedExpectedPriceModule(p4.catalogItemDetails, p4.resellersData, collectibleItemInstanceId, p3.timedOptionDays)
	end)
end

return function(p5, p6, p7, p8, p9, p10)
	-- upvalues: getAssetInfoModule (ref), getAssetInfoUtilModule (ref), promiseModule (ref), purchaseErrorModule (ref), isCreatorStoreAssetTypeModule (ref), getCreatorStoreProductInfoModule (ref), getCreatorStoreProductInfoUtilModule (ref), fFlagEnableFetchCartPricingDuringInExperience (ref), fFlagRefreshPriceOnRetryAfterUpsellModule (ref), fetchRefreshedPrice (ref), fFlagFixTimedOptionRefreshModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), productTypeEnum (ref), getExperienceProductInfoUtilModule (ref), fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule (ref), handleLooksProductInfoResultModule (ref), fFlagRefreshLookPriceOnRetryAfterUpsellModule (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), getFFlagDiscountInfoForSubscriptionPurchaseModalLua (ref)
	if p7 == Enum.InfoType.Asset then
		local var18 = getAssetInfoModule(p5, p6):andThen(function(p11)
			-- upvalues: getAssetInfoUtilModule (copy), promiseModule (copy), purchaseErrorModule (copy), isCreatorStoreAssetTypeModule (copy), getCreatorStoreProductInfoModule (copy), p5 (ref), p6 (ref), getCreatorStoreProductInfoUtilModule (copy), fFlagEnableFetchCartPricingDuringInExperience (copy), p7 (ref), p10 (ref)
			local var19 = nil
			
			if p11 and p11.data and p11.data[1] then
				if not getAssetInfoUtilModule.isAssetValid(p11.data[1]) then
					return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
				end
				var19 = getAssetInfoUtilModule.fromAsset(p11.data[1])
			end
			local var20 = if var19 then var19.type else ""
			
			return if isCreatorStoreAssetTypeModule(var20) then getCreatorStoreProductInfoModule(p5, p6, var20):andThen(function(p13)
				-- upvalues: getCreatorStoreProductInfoUtilModule (copy), var19 (write), var20 (ref)
				local var21 = getCreatorStoreProductInfoUtilModule.fromProduct(p13)
				
				return {
					PriceInRobux = 0,
					AssetId = var19.id,
					AssetType = var20,
					AssetTypeId = var19.typeId,
					Creator = {
						CreatorTargetId = var19.creator.targetId,
						CreatorType = var19.creator.type
					},
					Description = var19.description,
					IsFiatPriced = var21.basePrice and (var21.basePrice.quantity and var21.basePrice.quantity.significand ~= 0),
					IsForSale = var21.purchasable,
					IsPublicDomain = var19.isPublicDomainEnabled,
					Name = var19.name,
					ProductId = var19.id
				}
			end) elseif fFlagEnableFetchCartPricingDuringInExperience then p5.getProductInfo(p6, p7):andThen(function(p12)
				-- upvalues: p10 (copy)
				return if p12.CollectibleItemId and p10 then p10(p12.CollectibleItemId):andThen(function()
					-- upvalues: p12 (ref)
					return p12
				end):catch(function()
					-- upvalues: p12 (ref)
					return p12
				end) else p12
			end):catch(function(_)
				-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
				return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
			end) else p5.getProductInfo(p6, p7):catch(function(_)
				-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
				return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
			end)
		end):catch(function(_)
			-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
			return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
		end)
		
		return if fFlagRefreshPriceOnRetryAfterUpsellModule and p9 then promiseModule.all({
			productInfo = var18,
			refreshedPrice = fetchRefreshedPrice(p5, p6, "asset", p9)
		}):andThen(function(p14)
			-- upvalues: fFlagFixTimedOptionRefreshModule (copy)
			local productInfo = p14.productInfo
			
			if fFlagFixTimedOptionRefreshModule then
				local refreshedPrice = p14.refreshedPrice
				
				if refreshedPrice == nil then
					return productInfo
				end
				for i, v in pairs(refreshedPrice) do
					productInfo[i] = v
				end
				return productInfo
			elseif p14.refreshedPrice ~= nil then
				productInfo.refreshedExpectedPrice = p14.refreshedPrice
			end
		end) else var18
	end
	return if fFlagEnableUnifiedProductPurchaseFlow and p7 == productTypeEnum.Experience then p5.getExperienceProductInfo(p6):andThen(function(p17)
		-- upvalues: p8 (ref), getExperienceProductInfoUtilModule (copy), promiseModule (copy), purchaseErrorModule (copy)
		if p17 and p17.data and (p17.data[1] and p8.name) and p8.imageUrl then
			local var24 = getExperienceProductInfoUtilModule.fromProduct(p17.data[1])
			
			return {
				IsForSale = var24.isForSale,
				PriceInRobux = var24.price,
				ProductId = var24.productId,
				SellerId = var24.sellerId,
				Name = p8.name,
				ImageUrl = p8.imageUrl
			}
		end
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end):catch(function(_)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end) elseif fFlagEnableUnifiedProductPurchaseFlow and p7 == productTypeEnum.Look then if fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule then p5.GetLookDetailsV2ProductInfo(p6):andThen(function(p16)
		-- upvalues: handleLooksProductInfoResultModule (copy), p8 (ref), promiseModule (copy), purchaseErrorModule (copy), fFlagRefreshLookPriceOnRetryAfterUpsellModule (copy)
		local var23 = handleLooksProductInfoResultModule(p16, p8)
		
		if not var23 then
			return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
		elseif fFlagRefreshLookPriceOnRetryAfterUpsellModule then
			var23.refreshedExpectedPrice = var23.PriceInRobux
		end
		return var23
	end):catch(function()
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end) else promiseModule.resolve({
		IsForSale = true,
		Name = "Looks",
		PriceInRobux = p8.expectedPrice
	}) elseif fFlagEnableUnifiedPurchaseFlowForDevSubs and p7 == productTypeEnum.DeveloperSubscription then p5.getSubscriptionProductInfo(p6):andThen(function(p15)
		-- upvalues: getFFlagDiscountInfoForSubscriptionPurchaseModalLua (copy), productTypeEnum (copy), promiseModule (copy), purchaseErrorModule (copy)
		if p15 and p15.Name then
			local var22 = getFFlagDiscountInfoForSubscriptionPurchaseModalLua()
			
			return {
				Name = p15.Name,
				Description = p15.Description,
				IconImageAssetId = p15.IconImageAssetId,
				IsForSale = p15.IsForSale,
				DisplayPrice = p15.DisplayPrice,
				SubscriptionProviderName = p15.SubscriptionProviderName,
				PriceInRobux = p15.PriceInRobux,
				PriceTier = p15.PriceTier,
				ProductType = productTypeEnum.DeveloperSubscription,
				UserBasePriceInRobux = if var22 then p15.UserBasePriceInRobux else nil,
				PriceDiscountDetails = if var22 then p15.PriceDiscountDetails else nil
			}
		end
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end):catch(function(_)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end) else p5.getProductInfo(p6, p7):catch(function(_)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end)
end