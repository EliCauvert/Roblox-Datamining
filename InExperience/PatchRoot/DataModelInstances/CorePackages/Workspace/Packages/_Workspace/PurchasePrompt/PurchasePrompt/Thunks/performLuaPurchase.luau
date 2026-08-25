local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local httpService = game:GetService("HttpService")
local parent = purchasePrompt.Parent
local IAPExperienceModule = require(parent.IAPExperience)
local isEconomicRestrictionResponse = IAPExperienceModule.Utility.isEconomicRestrictionResponse
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local setEconomicRestrictionErrorModule = require(purchasePrompt.Actions.SetEconomicRestrictionError)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local networkModule = require(purchasePrompt.Services.Network)
local analyticsModule = require(purchasePrompt.Services.Analytics)
local thunkModule = require(purchasePrompt.Thunk)
local promiseModule = require(purchasePrompt.Promise)
local constantsModule = require(purchasePrompt.Misc.Constants)
local _ = require(purchasePrompt.types)
local productTypeEnum = require(purchasePrompt.types).ProductTypeEnum
local completePurchaseModule = require(script.Parent.completePurchase)
local handlePriceChangedErrorModule = require(purchasePrompt.Utils.handlePriceChangedError)
local performDevProductEdpPurchaseModule = require(purchasePrompt.Network.performDevProductEdpPurchase)
local performExperiencePurchaseModule = require(purchasePrompt.Network.performExperiencePurchase)
local performLookPurchaseModule = require(purchasePrompt.Network.performLookPurchase)
local performDeveloperSubscriptionRobuxPurchaseModule = require(purchasePrompt.Network.performDeveloperSubscriptionRobuxPurchase)
local performDeveloperSubscriptionFiatPurchaseModule = require(purchasePrompt.Network.performDeveloperSubscriptionFiatPurchase)
local deriveSelectedOfferIdsFromCartPricingModule = require(purchasePrompt.Utils.deriveSelectedOfferIdsFromCartPricing)
local selectProductPriceModule = require(purchasePrompt.Selectors.selectProductPrice)
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local fFlagPurchasePromptFetchCartPricingForLooks = require(parent.SharedFlags).FFlagPurchasePromptFetchCartPricingForLooks
local fFlagEnablePriceChangedErrorHandlingModule = require(purchasePrompt.Flags.FFlagEnablePriceChangedErrorHandling)
local fFlagEnableRequestLocationTypeForSduiPurchaseModule = require(purchasePrompt.Flags.FFlagEnableRequestLocationTypeForSduiPurchase)
local productPurchaseSurface = require(parent.PurchasePromptLite).Enums.ProductPurchaseSurface
local t = {
	[productPurchaseSurface.EDP] = "ExperienceDetailPage",
	[productPurchaseSurface.HomePageGameItemShop] = "HomePageGameItemShop"
}
local parseEconomicRestrictionsFailureReason = IAPExperienceModule.Utility.parseEconomicRestrictionsFailureReason
local parseEconomicRestrictionsExpirationTimeInMinutes = IAPExperienceModule.Utility.parseEconomicRestrictionsExpirationTimeInMinutes
local list = { networkModule, analyticsModule }

local function handleGenericPurchaseError(p0, p1, p2)
	-- upvalues: isEconomicRestrictionResponse (ref), parseEconomicRestrictionsFailureReason (ref), parseEconomicRestrictionsExpirationTimeInMinutes (ref), setEconomicRestrictionErrorModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref), handlePriceChangedErrorModule (ref)
	if isEconomicRestrictionResponse(p1) then
		p0:dispatch(setEconomicRestrictionErrorModule(parseEconomicRestrictionsFailureReason(p1), parseEconomicRestrictionsExpirationTimeInMinutes(p1)))
		p0:dispatch(errorOccurredModule(purchaseErrorModule.EconomicRestriction))
		
		return
	elseif handlePriceChangedErrorModule(p0, p1, p2) then return end
	if purchaseErrorModule.isMember(p1) then
		p0:dispatch(errorOccurredModule(p1))
		
		return
	end
	p0:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
end

return function()
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), analyticsModule (ref), constantsModule (ref), fFlagEnableRequestLocationTypeForSduiPurchaseModule (ref), t (ref), performDevProductEdpPurchaseModule (ref), completePurchaseModule (ref), promiseModule (ref), handleGenericPurchaseError (ref), fFlagEnablePriceChangedErrorHandlingModule (ref), productTypeEnum (ref), performExperiencePurchaseModule (ref), fFlagPurchasePromptFetchCartPricingForLooks (ref), selectProductPriceModule (ref), deriveSelectedOfferIdsFromCartPricingModule (ref), httpService (ref), performLookPurchaseModule (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), performDeveloperSubscriptionRobuxPurchaseModule (ref), performDeveloperSubscriptionFiatPurchaseModule (ref)
	return thunkModule.new(script.Name, list, function(p3, p4)
		-- upvalues: networkModule (copy), analyticsModule (copy), constantsModule (copy), fFlagEnableRequestLocationTypeForSduiPurchaseModule (copy), t (copy), performDevProductEdpPurchaseModule (copy), completePurchaseModule (copy), promiseModule (copy), handleGenericPurchaseError (copy), fFlagEnablePriceChangedErrorHandlingModule (copy), productTypeEnum (copy), performExperiencePurchaseModule (copy), fFlagPurchasePromptFetchCartPricingForLooks (copy), selectProductPriceModule (copy), deriveSelectedOfferIdsFromCartPricingModule (copy), httpService (copy), performLookPurchaseModule (copy), fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), performDeveloperSubscriptionRobuxPurchaseModule (copy), performDeveloperSubscriptionFiatPurchaseModule (copy)
		local var25 = p4[networkModule]
		local var26 = p4[analyticsModule]
		local state = p3:getState()
		local productInfo = state.productInfo
		local price = productInfo.price
		local productId = productInfo.productId
		local _ = state.promptRequest
		local id = state.promptRequest.id
		local productPayload = state.productPayload
		
		if productPayload.kind == "Product" then
			local t_1 = {
				expectedCurrency = constantsModule.Currency.Robux,
				expectedPrice = price,
				saleLocationId = productPayload.universeId
			}
			
			if fFlagEnableRequestLocationTypeForSduiPurchaseModule then
				local surface = state.purchaseAnalyticsMetadata and state.purchaseAnalyticsMetadata.surface
				t_1.requestLocationType = if surface ~= nil then t[surface] else ""
			end
			return performDevProductEdpPurchaseModule(var25, productId, t_1):andThen(function(p6)
				-- upvalues: p3 (ref), completePurchaseModule (copy), var26 (ref), id (ref), promiseModule (copy)
				p3:dispatch(completePurchaseModule(p6))
				var26.signalPurchaseSuccess(id, Enum.InfoType.Product, nil, p6)
				
				return promiseModule.resolve(p6)
			end):catch(function(p5)
				-- upvalues: handleGenericPurchaseError (copy), p3 (ref), fFlagEnablePriceChangedErrorHandlingModule (copy), productPayload (ref)
				handleGenericPurchaseError(p3, p5, if fFlagEnablePriceChangedErrorHandlingModule then productPayload.kind else nil)
			end)
		elseif productPayload.kind == productTypeEnum.Experience then
			return performExperiencePurchaseModule(var25, productId, {
				expectedCurrency = constantsModule.Currency.Robux,
				expectedPrice = price,
				sellerId = productInfo.sellerId
			}):andThen(function(p8)
				-- upvalues: p3 (ref), completePurchaseModule (copy), promiseModule (copy)
				p3:dispatch(completePurchaseModule(p8))
				
				return promiseModule.resolve(p8)
			end):catch(function(p7)
				-- upvalues: handleGenericPurchaseError (copy), p3 (ref), fFlagEnablePriceChangedErrorHandlingModule (copy), productPayload (ref)
				handleGenericPurchaseError(p3, p7, if fFlagEnablePriceChangedErrorHandlingModule then productPayload.kind else nil)
			end)
		elseif productPayload.kind == productTypeEnum.Look then
			local expectedPrice = productPayload.expectedPrice
			local t_1 = nil
			
			if fFlagPurchasePromptFetchCartPricingForLooks then
				local cartPricing = state.cartPricing
				local response = cartPricing and cartPricing.response
				
				if response == nil then
					t_1 = {}
				else
					expectedPrice = selectProductPriceModule(state) or expectedPrice
					t_1 = deriveSelectedOfferIdsFromCartPricingModule(response)
				end
			end
			return performLookPurchaseModule(var25, productPayload.id, {
				lookId = productPayload.id,
				idempotencyKey = httpService:GenerateGUID(false),
				expectedPrice = expectedPrice,
				salesLocationId = productPayload.salesLocationId,
				excludedAssets = productPayload.excludedAssetIds,
				excludedBundles = productPayload.excludedBundleIds,
				timedOptions = productPayload.timedOptions,
				selectedOfferIds = t_1
			}):andThen(function(p10)
				-- upvalues: p3 (ref), completePurchaseModule (copy), promiseModule (copy)
				p3:dispatch(completePurchaseModule(p10))
				
				return promiseModule.resolve(p10)
			end):catch(function(p9)
				-- upvalues: handleGenericPurchaseError (copy), p3 (ref), fFlagEnablePriceChangedErrorHandlingModule (copy), productPayload (ref)
				handleGenericPurchaseError(p3, p9, if fFlagEnablePriceChangedErrorHandlingModule then productPayload.kind else nil)
			end)
		elseif fFlagEnableUnifiedPurchaseFlowForDevSubs and productPayload.kind == productTypeEnum.DeveloperSubscription then
			local subscriptionId = productPayload.subscriptionId
			
			return (if productPayload.isSubscriptionInRobux then performDeveloperSubscriptionRobuxPurchaseModule(var25, subscriptionId, productPayload.expectedPrice) else performDeveloperSubscriptionFiatPurchaseModule(var25, subscriptionId)):andThen(function()
				-- upvalues: p3 (ref), completePurchaseModule (copy), promiseModule (copy)
				p3:dispatch(completePurchaseModule())
				
				return promiseModule.resolve()
			end):catch(function(p11)
				-- upvalues: handleGenericPurchaseError (copy), p3 (ref), fFlagEnablePriceChangedErrorHandlingModule (copy), productPayload (ref)
				handleGenericPurchaseError(p3, p11, if fFlagEnablePriceChangedErrorHandlingModule then productPayload.kind else nil)
			end)
		end
	end)
end