local Parent = script.Parent.Parent
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local PromiseModule = require(Parent.Promise)
local GetAssetInfoModule = require(Parent.Network.getAssetInfo)
local GetCreatorStoreProductInfoModule = require(Parent.Network.getCreatorStoreProductInfo)
local _ = require(Parent.Misc.Constants)
local IsCreatorStoreAssetTypeModule = require(Parent.Utils.isCreatorStoreAssetType)
local GetAssetInfoUtilModule = require(Parent.Utils.getAssetInfoUtil)
local GetCreatorStoreProductInfoUtilModule = require(Parent.Utils.getCreatorStoreProductInfoUtil)
local GetExperienceProductInfoUtilModule = require(Parent.Utils.getExperienceProductInfoUtil)
local HandleLooksProductInfoResultModule = require(Parent.Utils.handleLooksProductInfoResult)
local ProductTypeEnum = require(Parent.types).ProductTypeEnum
local FFlagEnableUnifiedProductPurchaseFlow = require(Parent.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule = require(Parent.Flags.FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsell)
local GetFFlagDiscountInfoForSubscriptionPurchaseModalLuaFunction = require(Parent.Parent.SharedFlags).GetFFlagDiscountInfoForSubscriptionPurchaseModalLua
local FFlagRefreshPriceOnRetryAfterUpsellModule = require(Parent.Flags.FFlagRefreshPriceOnRetryAfterUpsell)
local FFlagRefreshLookPriceOnRetryAfterUpsellModule = require(Parent.Flags.FFlagRefreshLookPriceOnRetryAfterUpsell)
local GetCatalogItemDetailsModule = require(Parent.Network.getCatalogItemDetails)
local GetResellersModule = require(Parent.Network.getResellers)
local ResolveRefreshedExpectedPriceModule = require(Parent.Utils.resolveRefreshedExpectedPrice)
local FFlagFixTimedOptionRefreshModule = require(Parent.Flags.FFlagFixTimedOptionRefresh)
local ResolveRefreshedProductInfoModule = require(Parent.Utils.resolveRefreshedProductInfo)

local function fetchRefreshedPrice(p1, p2, p3, p4)
	-- upvalues: PromiseModule (copy), GetCatalogItemDetailsModule (copy), GetResellersModule (copy), FFlagFixTimedOptionRefreshModule (copy), ResolveRefreshedProductInfoModule (copy), ResolveRefreshedExpectedPriceModule (copy)
	local CollectibleItemId = p4.collectibleItemId
	local CollectibleItemInstanceId = p4.collectibleItemInstanceId
	
	return PromiseModule.all({
		catalogItemDetails = GetCatalogItemDetailsModule(p1, p2, p3):catch(function()
			return nil
		end),
		resellersData = if CollectibleItemInstanceId and CollectibleItemInstanceId ~= "" and CollectibleItemId and CollectibleItemId ~= "" then GetResellersModule(p1, CollectibleItemId, 10):catch(function()
			return nil
		end) else PromiseModule.resolve(nil)
	}):andThen(function(Result)
		-- upvalues: FFlagFixTimedOptionRefreshModule (upval), ResolveRefreshedProductInfoModule (upval), CollectibleItemInstanceId (copy), p4 (copy), ResolveRefreshedExpectedPriceModule (upval)
		return if FFlagFixTimedOptionRefreshModule then ResolveRefreshedProductInfoModule(Result.catalogItemDetails, Result.resellersData, CollectibleItemInstanceId, p4.timedOptionDays) else ResolveRefreshedExpectedPriceModule(Result.catalogItemDetails, Result.resellersData, CollectibleItemInstanceId, p4.timedOptionDays)
	end)
end

return function(p1, p2, InfoType, p3, p4)
	-- upvalues: GetAssetInfoModule (copy), GetAssetInfoUtilModule (copy), PromiseModule (copy), PurchaseErrorModule (copy), IsCreatorStoreAssetTypeModule (copy), GetCreatorStoreProductInfoModule (copy), GetCreatorStoreProductInfoUtilModule (copy), FFlagRefreshPriceOnRetryAfterUpsellModule (copy), fetchRefreshedPrice (copy), FFlagFixTimedOptionRefreshModule (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), ProductTypeEnum (copy), GetExperienceProductInfoUtilModule (copy), FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule (copy), HandleLooksProductInfoResultModule (copy), FFlagRefreshLookPriceOnRetryAfterUpsellModule (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), GetFFlagDiscountInfoForSubscriptionPurchaseModalLuaFunction (copy)
	if InfoType == Enum.InfoType.Asset then
		local ProductInfo = GetAssetInfoModule(p1, p2):andThen(function(Result)
			-- upvalues: GetAssetInfoUtilModule (upval), PromiseModule (upval), PurchaseErrorModule (upval), IsCreatorStoreAssetTypeModule (upval), GetCreatorStoreProductInfoModule (upval), p1 (copy), p2 (copy), GetCreatorStoreProductInfoUtilModule (upval), InfoType (copy)
			local FromAssetResult = nil
			
			if Result and Result.data and Result.data[1] then
				if not GetAssetInfoUtilModule.isAssetValid(Result.data[1]) then
					return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
				end
				FromAssetResult = GetAssetInfoUtilModule.fromAsset(Result.data[1])
			end
			local Type = FromAssetResult and FromAssetResult.type or ""
			
			return if IsCreatorStoreAssetTypeModule(Type) then GetCreatorStoreProductInfoModule(p1, p2, Type):andThen(function(Result)
				-- upvalues: GetCreatorStoreProductInfoUtilModule (upval), FromAssetResult (ref), Type (copy)
				local FromProductResult = GetCreatorStoreProductInfoUtilModule.fromProduct(Result)
				
				return {
					PriceInRobux = 0,
					AssetId = FromAssetResult.id,
					AssetType = Type,
					AssetTypeId = FromAssetResult.typeId,
					Creator = {
						CreatorTargetId = FromAssetResult.creator.targetId,
						CreatorType = FromAssetResult.creator.type
					},
					Description = FromAssetResult.description,
					IsFiatPriced = FromProductResult.basePrice and (FromProductResult.basePrice.quantity and FromProductResult.basePrice.quantity.significand ~= 0),
					IsForSale = FromProductResult.purchasable,
					IsPublicDomain = FromAssetResult.isPublicDomainEnabled,
					Name = FromAssetResult.name,
					ProductId = FromAssetResult.id
				}
			end) else p1.getProductInfo(p2, InfoType):catch(function(_)
				-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
				return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
			end)
		end):catch(function(_)
			-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
			return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
		end)
		
		return if FFlagRefreshPriceOnRetryAfterUpsellModule and p4 then PromiseModule.all({
			productInfo = ProductInfo,
			refreshedPrice = fetchRefreshedPrice(p1, p2, "asset", p4)
		}):andThen(function(Result)
			-- upvalues: FFlagFixTimedOptionRefreshModule (upval)
			local ProductInfo = Result.productInfo
			
			if FFlagFixTimedOptionRefreshModule then
				local RefreshedPrice = Result.refreshedPrice
				
				if RefreshedPrice ~= nil then
					for i, value in pairs(RefreshedPrice) do
						ProductInfo[i] = value
					end
					return ProductInfo
				end
			elseif Result.refreshedPrice ~= nil then
				ProductInfo.refreshedExpectedPrice = Result.refreshedPrice
			end
			return ProductInfo
		end) else ProductInfo
	else
		return if FFlagEnableUnifiedProductPurchaseFlow and InfoType == ProductTypeEnum.Experience then p1.getExperienceProductInfo(p2):andThen(function(Result)
			-- upvalues: p3 (copy), GetExperienceProductInfoUtilModule (upval), PromiseModule (upval), PurchaseErrorModule (upval)
			if Result and Result.data and Result.data[1] and p3.name and p3.imageUrl then
				local FromProductResult = GetExperienceProductInfoUtilModule.fromProduct(Result.data[1])
				
				return {
					IsForSale = FromProductResult.isForSale,
					PriceInRobux = FromProductResult.price,
					ProductId = FromProductResult.productId,
					SellerId = FromProductResult.sellerId,
					Name = p3.name,
					ImageUrl = p3.imageUrl
				}
			else
				return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
			end
		end):catch(function(_)
			-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
			return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
		end) elseif FFlagEnableUnifiedProductPurchaseFlow and InfoType == ProductTypeEnum.Look then if FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule then p1.GetLookDetailsV2ProductInfo(p2):andThen(function(Result)
			-- upvalues: HandleLooksProductInfoResultModule (upval), p3 (copy), PromiseModule (upval), PurchaseErrorModule (upval), FFlagRefreshLookPriceOnRetryAfterUpsellModule (upval)
			local HandleLooksProductInfoResultModuleResult = HandleLooksProductInfoResultModule(Result, p3)
			
			if not HandleLooksProductInfoResultModuleResult then
				return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
			end
			if FFlagRefreshLookPriceOnRetryAfterUpsellModule then
				HandleLooksProductInfoResultModuleResult.refreshedExpectedPrice = HandleLooksProductInfoResultModuleResult.PriceInRobux
			end
			return HandleLooksProductInfoResultModuleResult
		end):catch(function()
			-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
			return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
		end) else PromiseModule.resolve({
			IsForSale = true,
			Name = "Looks",
			PriceInRobux = p3.expectedPrice
		}) elseif FFlagEnableUnifiedPurchaseFlowForDevSubs and InfoType == ProductTypeEnum.DeveloperSubscription then p1.getSubscriptionProductInfo(p2):andThen(function(Result)
			-- upvalues: GetFFlagDiscountInfoForSubscriptionPurchaseModalLuaFunction (upval), ProductTypeEnum (upval), PromiseModule (upval), PurchaseErrorModule (upval)
			if Result and Result.Name then
				local FFlagDiscountInfoForSubscriptionPurchaseModalLua = GetFFlagDiscountInfoForSubscriptionPurchaseModalLuaFunction()
				
				return {
					Name = Result.Name,
					Description = Result.Description,
					IconImageAssetId = Result.IconImageAssetId,
					IsForSale = Result.IsForSale,
					DisplayPrice = Result.DisplayPrice,
					SubscriptionProviderName = Result.SubscriptionProviderName,
					PriceInRobux = Result.PriceInRobux,
					PriceTier = Result.PriceTier,
					ProductType = ProductTypeEnum.DeveloperSubscription,
					UserBasePriceInRobux = if FFlagDiscountInfoForSubscriptionPurchaseModalLua then Result.UserBasePriceInRobux else nil,
					PriceDiscountDetails = if FFlagDiscountInfoForSubscriptionPurchaseModalLua then Result.PriceDiscountDetails else nil
				}
			else
				return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
			end
		end):catch(function(_)
			-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
			return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
		end) else p1.getProductInfo(p2, InfoType):catch(function(_)
			-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
			return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
		end)
	end
end