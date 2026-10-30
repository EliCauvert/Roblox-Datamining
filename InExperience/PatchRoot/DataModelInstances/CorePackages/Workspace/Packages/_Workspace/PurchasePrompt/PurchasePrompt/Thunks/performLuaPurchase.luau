local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Parent = PurchasePrompt.Parent
local IAPExperienceModule = require(Parent.IAPExperience)
local IsEconomicRestrictionResponseFunction = IAPExperienceModule.Utility.isEconomicRestrictionResponse
local ErrorOccurredModule = require(PurchasePrompt.Actions.ErrorOccurred)
local SetEconomicRestrictionErrorModule = require(PurchasePrompt.Actions.SetEconomicRestrictionError)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local NetworkModule = require(PurchasePrompt.Services.Network)
local AnalyticsModule = require(PurchasePrompt.Services.Analytics)
local ThunkModule = require(PurchasePrompt.Thunk)
local PromiseModule = require(PurchasePrompt.Promise)
local ConstantsModule = require(PurchasePrompt.Misc.Constants)
local _ = require(PurchasePrompt.types)
local ProductTypeEnum = require(PurchasePrompt.types).ProductTypeEnum
local CompletePurchaseModule = require(script.Parent.completePurchase)
local HandlePriceChangedErrorModule = require(PurchasePrompt.Utils.handlePriceChangedError)
local PerformDevProductEdpPurchaseModule = require(PurchasePrompt.Network.performDevProductEdpPurchase)
local PerformExperiencePurchaseModule = require(PurchasePrompt.Network.performExperiencePurchase)
local PerformLookPurchaseModule = require(PurchasePrompt.Network.performLookPurchase)
local PerformDeveloperSubscriptionRobuxPurchaseModule = require(PurchasePrompt.Network.performDeveloperSubscriptionRobuxPurchase)
local PerformDeveloperSubscriptionFiatPurchaseModule = require(PurchasePrompt.Network.performDeveloperSubscriptionFiatPurchase)
local PerformVIPServerPurchaseModule = require(PurchasePrompt.Network.performVIPServerPurchase)
local DeriveSelectedOfferIdsFromCartPricingModule = require(PurchasePrompt.Utils.deriveSelectedOfferIdsFromCartPricing)
local ApplyCartPricingOffersToLineItemsModule = require(PurchasePrompt.Utils.applyCartPricingOffersToLineItems)
local SelectProductPriceModule = require(PurchasePrompt.Selectors.selectProductPrice)
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagPurchasePromptFetchCartPricingForLooks = require(Parent.SharedFlags).FFlagPurchasePromptFetchCartPricingForLooks
local FFlagEnablePriceChangedErrorHandlingModule = require(PurchasePrompt.Flags.FFlagEnablePriceChangedErrorHandling)
local FFlagEnableRequestLocationTypeForSduiPurchaseModule = require(PurchasePrompt.Flags.FFlagEnableRequestLocationTypeForSduiPurchase)
local FFlagEnableSearchGameItemOwnershipUpdate = require(Parent.SharedFlags).FFlagEnableSearchGameItemOwnershipUpdate
local FFlagLuaAppsEnablePromptVIPServerPurchase = require(Parent.SharedFlags).FFlagLuaAppsEnablePromptVIPServerPurchase
local RobloxTranslatorModule = require(Parent.RobloxTranslator)
local ProductPurchaseSurface = require(Parent.PurchasePromptLite).Enums.ProductPurchaseSurface
local config = {
	[ProductPurchaseSurface.EDP] = "ExperienceDetailPage",
	[ProductPurchaseSurface.EDPPreview] = if require(Parent.SharedFlags).FFlagEnableEdpPreviewPurchaseSurface then "ExperienceDetailPagePreview" else nil,
	[ProductPurchaseSurface.HomePageGameItemShop] = "HomePageGameItemShop",
	[ProductPurchaseSurface.SearchPageGameItemShop] = if FFlagEnableSearchGameItemOwnershipUpdate then "SearchPageGameItemShop" else nil
}

local function _(p1)
	-- upvalues: HttpService (copy)
	if type(p1) == "string" and p1 ~= "" then
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, p1)
		
		return if Success and type(Result) == "table" and type(Result.surface) == "table" then Result else nil
	else
		return nil
	end
end

local ParseEconomicRestrictionsFailureReasonFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsFailureReason
local ParseEconomicRestrictionsExpirationTimeInMinutesFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsExpirationTimeInMinutes
local list = { NetworkModule, AnalyticsModule }

local function handleGenericPurchaseError(p1, p2, Kind)
	-- upvalues: IsEconomicRestrictionResponseFunction (copy), ParseEconomicRestrictionsFailureReasonFunction (copy), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (copy), SetEconomicRestrictionErrorModule (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy), HandlePriceChangedErrorModule (copy)
	if IsEconomicRestrictionResponseFunction(p2) then
		p1:dispatch(SetEconomicRestrictionErrorModule(ParseEconomicRestrictionsFailureReasonFunction(p2), (ParseEconomicRestrictionsExpirationTimeInMinutesFunction(p2))))
		p1:dispatch(ErrorOccurredModule(PurchaseErrorModule.EconomicRestriction))
		
		return
	end
	if HandlePriceChangedErrorModule(p1, p2, Kind) then return end
	if PurchaseErrorModule.isMember(p2) then
		p1:dispatch(ErrorOccurredModule(p2))
		
		return
	else
		p1:dispatch(ErrorOccurredModule(PurchaseErrorModule.UnknownFailure))
	end
end

return function()
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), AnalyticsModule (copy), ConstantsModule (copy), FFlagEnableRequestLocationTypeForSduiPurchaseModule (copy), config (copy), HttpService (copy), PerformDevProductEdpPurchaseModule (copy), CompletePurchaseModule (copy), PromiseModule (copy), handleGenericPurchaseError (copy), FFlagEnablePriceChangedErrorHandlingModule (copy), ProductTypeEnum (copy), PerformExperiencePurchaseModule (copy), FFlagPurchasePromptFetchCartPricingForLooks (copy), SelectProductPriceModule (copy), DeriveSelectedOfferIdsFromCartPricingModule (copy), ApplyCartPricingOffersToLineItemsModule (copy), PerformLookPurchaseModule (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), PerformDeveloperSubscriptionRobuxPurchaseModule (copy), PerformDeveloperSubscriptionFiatPurchaseModule (copy), FFlagLuaAppsEnablePromptVIPServerPurchase (copy), RobloxTranslatorModule (copy), Players (copy), PerformVIPServerPurchaseModule (copy)
	return ThunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: NetworkModule (upval), AnalyticsModule (upval), ConstantsModule (upval), FFlagEnableRequestLocationTypeForSduiPurchaseModule (upval), config (upval), HttpService (upval), PerformDevProductEdpPurchaseModule (upval), CompletePurchaseModule (upval), PromiseModule (upval), handleGenericPurchaseError (upval), FFlagEnablePriceChangedErrorHandlingModule (upval), ProductTypeEnum (upval), PerformExperiencePurchaseModule (upval), FFlagPurchasePromptFetchCartPricingForLooks (upval), SelectProductPriceModule (upval), DeriveSelectedOfferIdsFromCartPricingModule (upval), ApplyCartPricingOffersToLineItemsModule (upval), PerformLookPurchaseModule (upval), FFlagEnableUnifiedPurchaseFlowForDevSubs (upval), PerformDeveloperSubscriptionRobuxPurchaseModule (upval), PerformDeveloperSubscriptionFiatPurchaseModule (upval), FFlagLuaAppsEnablePromptVIPServerPurchase (upval), RobloxTranslatorModule (upval), Players (upval), PerformVIPServerPurchaseModule (upval)
		local v1 = p2[NetworkModule]
		local v2 = p2[AnalyticsModule]
		local State = p1:getState()
		local ProductInfo = State.productInfo
		local Price = ProductInfo.price
		local ProductId = ProductInfo.productId
		local PromptRequest = State.promptRequest
		local Id = State.promptRequest.id
		local ProductPayload = State.productPayload
		
		if ProductPayload.kind == "Product" then
			local config1 = {
				expectedCurrency = ConstantsModule.Currency.Robux,
				expectedPrice = Price,
				saleLocationId = ProductPayload.universeId
			}
			
			if FFlagEnableRequestLocationTypeForSduiPurchaseModule then
				local Surface = State.purchaseAnalyticsMetadata and State.purchaseAnalyticsMetadata.surface
				config1.requestLocationType = if Surface == nil then "" else config[Surface] or ""
			end
			local PurchasePayload = ProductPayload.purchasePayload
			local PurchasePayload1 = nil
			
			if type(PurchasePayload) == "string" and PurchasePayload ~= "" then
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, PurchasePayload)
				PurchasePayload1 = if Success and type(Result) == "table" and type(Result.surface) == "table" then Result else nil
			else
				PurchasePayload1 = nil
			end
			config1.purchasePayload = PurchasePayload1
			
			return PerformDevProductEdpPurchaseModule(v1, ProductId, config1):andThen(function(Result)
				-- upvalues: p1 (copy), CompletePurchaseModule (upval), v2 (copy), Id (copy), PromiseModule (upval)
				p1:dispatch(CompletePurchaseModule(Result))
				v2.signalPurchaseSuccess(Id, Enum.InfoType.Product, nil, Result)
				
				return PromiseModule.resolve(Result)
			end):catch(function(Err)
				-- upvalues: handleGenericPurchaseError (upval), p1 (copy), FFlagEnablePriceChangedErrorHandlingModule (upval), ProductPayload (copy)
				handleGenericPurchaseError(p1, Err, if FFlagEnablePriceChangedErrorHandlingModule then ProductPayload.kind else nil)
			end)
		else
			if ProductPayload.kind == ProductTypeEnum.Experience then
				return PerformExperiencePurchaseModule(v1, ProductId, {
					expectedCurrency = ConstantsModule.Currency.Robux,
					expectedPrice = Price,
					sellerId = ProductInfo.sellerId
				}):andThen(function(Result)
					-- upvalues: p1 (copy), CompletePurchaseModule (upval), PromiseModule (upval)
					p1:dispatch(CompletePurchaseModule(Result))
					
					return PromiseModule.resolve(Result)
				end):catch(function(Err)
					-- upvalues: handleGenericPurchaseError (upval), p1 (copy), FFlagEnablePriceChangedErrorHandlingModule (upval), ProductPayload (copy)
					handleGenericPurchaseError(p1, Err, if FFlagEnablePriceChangedErrorHandlingModule then ProductPayload.kind else nil)
				end)
			end
			if ProductPayload.kind == ProductTypeEnum.Look then
				local ExpectedPrice = ProductPayload.expectedPrice
				local SelectedOfferIds = nil
				local BulkPurchaseLineItems = nil
				
				if FFlagPurchasePromptFetchCartPricingForLooks then
					BulkPurchaseLineItems = ProductPayload.bulkPurchaseLineItems
					local CartPricing = State.cartPricing
					local Response = CartPricing and CartPricing.response
					
					if Response == nil then
						SelectedOfferIds = {}
					else
						ExpectedPrice = SelectProductPriceModule(State) or ExpectedPrice
						SelectedOfferIds = DeriveSelectedOfferIdsFromCartPricingModule(Response)
						
						if BulkPurchaseLineItems ~= nil then
							BulkPurchaseLineItems = ApplyCartPricingOffersToLineItemsModule(BulkPurchaseLineItems, Response, SelectedOfferIds)
						end
					end
				end
				return PerformLookPurchaseModule(v1, ProductPayload.id, {
					lookId = ProductPayload.id,
					idempotencyKey = HttpService:GenerateGUID(false),
					expectedPrice = ExpectedPrice,
					salesLocationId = ProductPayload.salesLocationId,
					excludedAssets = ProductPayload.excludedAssetIds,
					excludedBundles = ProductPayload.excludedBundleIds,
					timedOptions = ProductPayload.timedOptions,
					selectedOfferIds = SelectedOfferIds,
					bulkPurchaseLineItems = if FFlagPurchasePromptFetchCartPricingForLooks then BulkPurchaseLineItems else nil
				}):andThen(function(Result)
					-- upvalues: p1 (copy), CompletePurchaseModule (upval), PromiseModule (upval)
					p1:dispatch(CompletePurchaseModule(Result))
					
					return PromiseModule.resolve(Result)
				end):catch(function(Err)
					-- upvalues: handleGenericPurchaseError (upval), p1 (copy), FFlagEnablePriceChangedErrorHandlingModule (upval), ProductPayload (copy)
					handleGenericPurchaseError(p1, Err, if FFlagEnablePriceChangedErrorHandlingModule then ProductPayload.kind else nil)
				end)
			elseif FFlagEnableUnifiedPurchaseFlowForDevSubs and ProductPayload.kind == ProductTypeEnum.DeveloperSubscription then
				local SubscriptionId = ProductPayload.subscriptionId
				
				return (if ProductPayload.isSubscriptionInRobux then PerformDeveloperSubscriptionRobuxPurchaseModule(v1, SubscriptionId, ProductPayload.expectedPrice) else PerformDeveloperSubscriptionFiatPurchaseModule(v1, SubscriptionId)):andThen(function()
					-- upvalues: p1 (copy), CompletePurchaseModule (upval), PromiseModule (upval)
					p1:dispatch(CompletePurchaseModule())
					
					return PromiseModule.resolve()
				end):catch(function(Err)
					-- upvalues: handleGenericPurchaseError (upval), p1 (copy), FFlagEnablePriceChangedErrorHandlingModule (upval), ProductPayload (copy)
					handleGenericPurchaseError(p1, Err, if FFlagEnablePriceChangedErrorHandlingModule then ProductPayload.kind else nil)
				end)
			elseif not FFlagLuaAppsEnablePromptVIPServerPurchase or ProductPayload.kind ~= ProductTypeEnum.VIPServer then return end
			return PerformVIPServerPurchaseModule(v1, ProductPayload.universeId, {
				name = RobloxTranslatorModule:FormatByKey("Feature.PrivateServers.Label.OwnersServer", { displayName = Players.LocalPlayer.DisplayName }),
				expectedPrice = Price,
				idempotencyKey = PromptRequest.idempotencyKey
			}):andThen(function(Result)
				-- upvalues: p1 (copy), CompletePurchaseModule (upval), PromiseModule (upval)
				p1:dispatch(CompletePurchaseModule(Result))
				
				return PromiseModule.resolve(Result)
			end):catch(function(Err)
				-- upvalues: handleGenericPurchaseError (upval), p1 (copy), FFlagEnablePriceChangedErrorHandlingModule (upval), ProductPayload (copy)
				handleGenericPurchaseError(p1, Err, if FFlagEnablePriceChangedErrorHandlingModule then ProductPayload.kind else nil)
			end)
		end
	end)
end