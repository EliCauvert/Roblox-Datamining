local Parent = script.Parent.Parent
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.Parent.LuauPolyfill)
local IAPExperienceModule = require(Parent.Parent.IAPExperience)
local GetAssetInfoModule = require(Parent.Network.getAssetInfo)
local GetCreatorStoreProductInfoModule = require(Parent.Network.getCreatorStoreProductInfo)
local _ = require(Parent.Misc.Constants)
local IsCreatorStoreAssetTypeModule = require(Parent.Utils.isCreatorStoreAssetType)
local GetAssetInfoUtilModule = require(Parent.Utils.getAssetInfoUtil)
local GetCreatorStoreProductInfoUtilModule = require(Parent.Utils.getCreatorStoreProductInfoUtil)
local GetExperienceProductInfoUtilModule = require(Parent.Utils.getExperienceProductInfoUtil)
local GetExperienceProductImageUrlModule = require(Parent.Utils.getExperienceProductImageUrl)
local FFlagExperiencePurchaseFallbackToGameIconModule = require(Parent.Flags.FFlagExperiencePurchaseFallbackToGameIcon)
local HandleLooksProductInfoResultModule = require(Parent.Utils.handleLooksProductInfoResult)
local ProductTypeEnum = require(Parent.types).ProductTypeEnum
local FFlagEnableFetchCartPricingDuringInExperience = require(Parent.Parent.SharedFlags).FFlagEnableFetchCartPricingDuringInExperience
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule = require(Parent.Flags.FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsell)
local GetFFlagDiscountInfoForSubscriptionPurchaseModalLuaFunction = require(Parent.Parent.SharedFlags).GetFFlagDiscountInfoForSubscriptionPurchaseModalLua
local FFlagLuaAppsEnablePromptVIPServerPurchase = require(Parent.Parent.SharedFlags).FFlagLuaAppsEnablePromptVIPServerPurchase
local FFlagRefreshPriceOnRetryAfterUpsellModule = require(Parent.Flags.FFlagRefreshPriceOnRetryAfterUpsell)
local FFlagRefreshLookPriceOnRetryAfterUpsellModule = require(Parent.Flags.FFlagRefreshLookPriceOnRetryAfterUpsell)
local GetCatalogItemDetailsModule = require(Parent.Network.getCatalogItemDetails)
local GetResellersModule = require(Parent.Network.getResellers)
local GetUniversePrivateServerSettingsModule = require(Parent.Network.getUniversePrivateServerSettings)
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

return function(p1, p2, InfoType, p3, p4, Callback)
	-- upvalues: GetAssetInfoModule (copy), GetAssetInfoUtilModule (copy), PromiseModule (copy), PurchaseErrorModule (copy), IsCreatorStoreAssetTypeModule (copy), GetCreatorStoreProductInfoModule (copy), GetCreatorStoreProductInfoUtilModule (copy), FFlagEnableFetchCartPricingDuringInExperience (copy), FFlagRefreshPriceOnRetryAfterUpsellModule (copy), fetchRefreshedPrice (copy), FFlagFixTimedOptionRefreshModule (copy), ProductTypeEnum (copy), FFlagExperiencePurchaseFallbackToGameIconModule (copy), GetExperienceProductInfoUtilModule (copy), GetExperienceProductImageUrlModule (copy), FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule (copy), HandleLooksProductInfoResultModule (copy), FFlagRefreshLookPriceOnRetryAfterUpsellModule (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), GetFFlagDiscountInfoForSubscriptionPurchaseModalLuaFunction (copy), FFlagLuaAppsEnablePromptVIPServerPurchase (copy), GetUniversePrivateServerSettingsModule (copy), IAPExperienceModule (copy)
	if InfoType == Enum.InfoType.Asset then
		local ProductInfo = GetAssetInfoModule(p1, p2):andThen(function(Result)
			-- upvalues: GetAssetInfoUtilModule (upval), PromiseModule (upval), PurchaseErrorModule (upval), IsCreatorStoreAssetTypeModule (upval), GetCreatorStoreProductInfoModule (upval), p1 (copy), p2 (copy), GetCreatorStoreProductInfoUtilModule (upval), FFlagEnableFetchCartPricingDuringInExperience (upval), InfoType (copy), Callback (copy)
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
			end) elseif FFlagEnableFetchCartPricingDuringInExperience then p1.getProductInfo(p2, InfoType):andThen(function(Result)
				-- upvalues: Callback (upval)
				return if Result.CollectibleItemId and Callback then Callback(Result.CollectibleItemId):andThen(function()
					-- upvalues: Result (copy)
					return Result
				end):catch(function()
					-- upvalues: Result (copy)
					return Result
				end) else Result
			end):catch(function(_)
				-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
				return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
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
		return if InfoType == ProductTypeEnum.Experience then p1.getExperienceProductInfo(p2):andThen(function(Result)
			-- upvalues: p3 (copy), FFlagExperiencePurchaseFallbackToGameIconModule (upval), GetExperienceProductInfoUtilModule (upval), GetExperienceProductImageUrlModule (upval), p2 (copy), PromiseModule (upval), PurchaseErrorModule (upval)
			if Result and Result.data and Result.data[1] and p3.name and (FFlagExperiencePurchaseFallbackToGameIconModule or p3.imageUrl) then
				local FromProductResult = GetExperienceProductInfoUtilModule.fromProduct(Result.data[1])
				
				return {
					IsForSale = FromProductResult.isForSale,
					PriceInRobux = FromProductResult.price,
					ProductId = FromProductResult.productId,
					SellerId = FromProductResult.sellerId,
					Name = p3.name,
					ImageUrl = if FFlagExperiencePurchaseFallbackToGameIconModule then GetExperienceProductImageUrlModule(p3.imageUrl, p2) else p3.imageUrl
				}
			else
				return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
			end
		end):catch(function(_)
			-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
			return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
		end) elseif InfoType == ProductTypeEnum.Look then if FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule then p1.GetLookDetailsV2ProductInfo(p2):andThen(function(Result)
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
		end) elseif FFlagLuaAppsEnablePromptVIPServerPurchase and InfoType == ProductTypeEnum.VIPServer then GetUniversePrivateServerSettingsModule(p1, p2):andThen(function(Result)
			-- upvalues: IAPExperienceModule (upval), p1 (copy), GetExperienceProductImageUrlModule (upval), p2 (copy), PromiseModule (upval), PurchaseErrorModule (upval)
			local PrivateServerData = Result.privateServerData
			local NewRobux = 0
			local Discounts = PrivateServerData.discounts or {}
			for _, discount in Discounts do
				if discount.source == "RobloxSubscription" and discount.robux > 0 then
					NewRobux += discount.robux
				end
			end
			local Price = PrivateServerData.price or 0
			local IsNewRobuxAbove: boolean = Price == 0 and NewRobux > 0
			local UserBasePriceInRobux: number? = nil
			local PriceDiscountDetails = nil
			
			if NewRobux > 0 then
				local NewPrice = Price + NewRobux
				UserBasePriceInRobux = NewPrice
				PriceDiscountDetails = {
					{
						Type = IAPExperienceModule.DiscountType.RobloxPlusSubscription,
						AmountInRobux = NewRobux,
						Percent = math.floor(NewRobux * 100 / NewPrice)
					}
				}
			end
			return p1.getProductInfo(Result.rootPlaceId, Enum.InfoType.Asset):andThen(function(Result)
				-- upvalues: PrivateServerData (copy), UserBasePriceInRobux (ref), PriceDiscountDetails (ref), GetExperienceProductImageUrlModule (upval), p2 (upval), IsNewRobuxAbove (copy)
				return {
					IsForSale = true,
					IsMonthlyPrice = true,
					PriceInRobux = PrivateServerData.price,
					UserBasePriceInRobux = UserBasePriceInRobux,
					PriceDiscountDetails = PriceDiscountDetails,
					ProductId = PrivateServerData.privateServerProductId,
					Name = Result.Name,
					ImageUrl = GetExperienceProductImageUrlModule(nil, p2),
					IsFreeWithRobloxPlus = IsNewRobuxAbove,
					Creator = {
						CreatorType = if game.CreatorType == Enum.CreatorType.Group then "Group" else "User",
						CreatorTargetId = game.CreatorId
					}
				}
			end):catch(function()
				-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
				return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
			end)
		end) else p1.getProductInfo(p2, InfoType):catch(function(_)
			-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
			return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
		end)
	end
end