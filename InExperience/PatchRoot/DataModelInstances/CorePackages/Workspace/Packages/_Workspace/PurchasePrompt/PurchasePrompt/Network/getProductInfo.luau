local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)
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

local function fetchRefreshedPrice(p0, p1, p2, p3) --[[ line: 37 ]]
	-- upvalues: promiseModule (ref), getCatalogItemDetailsModule (ref), getResellersModule (ref), fFlagFixTimedOptionRefreshModule (ref), resolveRefreshedProductInfoModule (ref), resolveRefreshedExpectedPriceModule (ref)
	local collectibleItemId = p3.collectibleItemId
	local collectibleItemInstanceId = p3.collectibleItemInstanceId
	
	return promiseModule.all({
		catalogItemDetails = getCatalogItemDetailsModule(p0, p1, p2):catch(function() --[[ line: 41 ]]
			return nil
		end),
		resellersData = if collectibleItemInstanceId and collectibleItemInstanceId ~= "" and (collectibleItemId and collectibleItemId ~= "") then getResellersModule(p0, collectibleItemId, 10):catch(function() --[[ line: 48 ]]
			return nil
		end) else promiseModule.resolve(nil)
	}):andThen(function(p4) --[[ line: 52 ]]
		-- upvalues: fFlagFixTimedOptionRefreshModule (copy), resolveRefreshedProductInfoModule (copy), collectibleItemInstanceId (ref), p3 (ref), resolveRefreshedExpectedPriceModule (copy)
		return if fFlagFixTimedOptionRefreshModule then resolveRefreshedProductInfoModule(p4.catalogItemDetails, p4.resellersData, collectibleItemInstanceId, p3.timedOptionDays) else resolveRefreshedExpectedPriceModule(p4.catalogItemDetails, p4.resellersData, collectibleItemInstanceId, p3.timedOptionDays)
	end)
end

return function(p5, p6, p7, p8, p9) --[[ line: 70 | named "getProductInfo" ]]
	-- upvalues: getAssetInfoModule (ref), getAssetInfoUtilModule (ref), promiseModule (ref), purchaseErrorModule (ref), isCreatorStoreAssetTypeModule (ref), getCreatorStoreProductInfoModule (ref), getCreatorStoreProductInfoUtilModule (ref), fFlagRefreshPriceOnRetryAfterUpsellModule (ref), fetchRefreshedPrice (ref), fFlagFixTimedOptionRefreshModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), productTypeEnum (ref), getExperienceProductInfoUtilModule (ref), fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule (ref), handleLooksProductInfoResultModule (ref), fFlagRefreshLookPriceOnRetryAfterUpsellModule (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), getFFlagDiscountInfoForSubscriptionPurchaseModalLua (ref)
	if p7 == Enum.InfoType.Asset then
		local var18 = getAssetInfoModule(p5, p6):andThen(function(p10) --[[ line: 73 ]]
			-- upvalues: getAssetInfoUtilModule (copy), promiseModule (copy), purchaseErrorModule (copy), isCreatorStoreAssetTypeModule (copy), getCreatorStoreProductInfoModule (copy), p5 (ref), p6 (ref), getCreatorStoreProductInfoUtilModule (copy), p7 (ref)
			local var19 = nil
			
			if p10 and p10.data and p10.data[1] then
				if not getAssetInfoUtilModule.isAssetValid(p10.data[1]) then
					return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
				end
				var19 = getAssetInfoUtilModule.fromAsset(p10.data[1])
			end
			local var20 = if var19 then var19.type else ""
			
			return if isCreatorStoreAssetTypeModule(var20) then getCreatorStoreProductInfoModule(p5, p6, var20):andThen(function(p11) --[[ line: 84 ]]
				-- upvalues: getCreatorStoreProductInfoUtilModule (copy), var19 (write), var20 (ref)
				local var21 = getCreatorStoreProductInfoUtilModule.fromProduct(p11)
				
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
			end) else p5.getProductInfo(p6, p7):catch(function(_) --[[ line: 108 ]]
				-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
				return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
			end)
		end):catch(function(_) --[[ line: 113 ]]
			-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
			return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
		end)
		
		return if fFlagRefreshPriceOnRetryAfterUpsellModule and p9 then promiseModule.all({
			productInfo = var18,
			refreshedPrice = fetchRefreshedPrice(p5, p6, "asset", p9)
		}):andThen(function(p12) --[[ line: 127 ]]
			-- upvalues: fFlagFixTimedOptionRefreshModule (copy)
			local productInfo = p12.productInfo
			
			if fFlagFixTimedOptionRefreshModule then
				local refreshedPrice = p12.refreshedPrice
				
				if refreshedPrice == nil then
					return productInfo
				end
				for i, v in pairs(refreshedPrice) do
					productInfo[i] = v
				end
				return productInfo
			elseif p12.refreshedPrice ~= nil then
				productInfo.refreshedExpectedPrice = p12.refreshedPrice
			end
		end) else var18
	end
	return if fFlagEnableUnifiedProductPurchaseFlow and p7 == productTypeEnum.Experience then p5.getExperienceProductInfo(p6):andThen(function(p15) --[[ line: 149 ]]
		-- upvalues: p8 (ref), getExperienceProductInfoUtilModule (copy), promiseModule (copy), purchaseErrorModule (copy)
		if p15 and p15.data and (p15.data[1] and p8.name) and p8.imageUrl then
			local var24 = getExperienceProductInfoUtilModule.fromProduct(p15.data[1])
			
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
	end):catch(function(_) --[[ line: 169 ]]
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end) elseif fFlagEnableUnifiedProductPurchaseFlow and p7 == productTypeEnum.Look then if fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule then p5.GetLookDetailsV2ProductInfo(p6):andThen(function(p14) --[[ line: 176 ]]
		-- upvalues: handleLooksProductInfoResultModule (copy), p8 (ref), promiseModule (copy), purchaseErrorModule (copy), fFlagRefreshLookPriceOnRetryAfterUpsellModule (copy)
		local var23 = handleLooksProductInfoResultModule(p14, p8)
		
		if not var23 then
			return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
		elseif fFlagRefreshLookPriceOnRetryAfterUpsellModule then
			var23.refreshedExpectedPrice = var23.PriceInRobux
		end
		return var23
	end):catch(function() --[[ line: 187 ]]
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end) else promiseModule.resolve({
		IsForSale = true,
		Name = "Looks",
		PriceInRobux = p8.expectedPrice
	}) elseif fFlagEnableUnifiedPurchaseFlowForDevSubs and p7 == productTypeEnum.DeveloperSubscription then p5.getSubscriptionProductInfo(p6):andThen(function(p13) --[[ line: 199 ]]
		-- upvalues: getFFlagDiscountInfoForSubscriptionPurchaseModalLua (copy), productTypeEnum (copy), promiseModule (copy), purchaseErrorModule (copy)
		if p13 and p13.Name then
			local var22 = getFFlagDiscountInfoForSubscriptionPurchaseModalLua()
			
			return {
				Name = p13.Name,
				Description = p13.Description,
				IconImageAssetId = p13.IconImageAssetId,
				IsForSale = p13.IsForSale,
				DisplayPrice = p13.DisplayPrice,
				SubscriptionProviderName = p13.SubscriptionProviderName,
				PriceInRobux = p13.PriceInRobux,
				PriceTier = p13.PriceTier,
				ProductType = productTypeEnum.DeveloperSubscription,
				UserBasePriceInRobux = if var22 then p13.UserBasePriceInRobux else nil,
				PriceDiscountDetails = if var22 then p13.PriceDiscountDetails else nil
			}
		end
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end):catch(function(_) --[[ line: 220 ]]
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end) else p5.getProductInfo(p6, p7):catch(function(_) --[[ line: 224 ]]
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end)
end