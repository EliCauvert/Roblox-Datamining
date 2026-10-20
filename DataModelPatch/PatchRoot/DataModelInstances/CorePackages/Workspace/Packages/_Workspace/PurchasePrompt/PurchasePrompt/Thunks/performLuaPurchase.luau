local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local HttpService = game:GetService("HttpService")
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
local DeriveSelectedOfferIdsFromCartPricingModule = require(PurchasePrompt.Utils.deriveSelectedOfferIdsFromCartPricing)
local SelectProductPriceModule = require(PurchasePrompt.Selectors.selectProductPrice)
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagPurchasePromptFetchCartPricingForLooks = require(Parent.SharedFlags).FFlagPurchasePromptFetchCartPricingForLooks
local FFlagEnablePriceChangedErrorHandlingModule = require(PurchasePrompt.Flags.FFlagEnablePriceChangedErrorHandling)
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
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), AnalyticsModule (copy), ConstantsModule (copy), PerformDevProductEdpPurchaseModule (copy), CompletePurchaseModule (copy), PromiseModule (copy), handleGenericPurchaseError (copy), FFlagEnablePriceChangedErrorHandlingModule (copy), ProductTypeEnum (copy), PerformExperiencePurchaseModule (copy), FFlagPurchasePromptFetchCartPricingForLooks (copy), SelectProductPriceModule (copy), DeriveSelectedOfferIdsFromCartPricingModule (copy), HttpService (copy), PerformLookPurchaseModule (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), PerformDeveloperSubscriptionRobuxPurchaseModule (copy), PerformDeveloperSubscriptionFiatPurchaseModule (copy)
	return ThunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: NetworkModule (upval), AnalyticsModule (upval), ConstantsModule (upval), PerformDevProductEdpPurchaseModule (upval), CompletePurchaseModule (upval), PromiseModule (upval), handleGenericPurchaseError (upval), FFlagEnablePriceChangedErrorHandlingModule (upval), ProductTypeEnum (upval), PerformExperiencePurchaseModule (upval), FFlagPurchasePromptFetchCartPricingForLooks (upval), SelectProductPriceModule (upval), DeriveSelectedOfferIdsFromCartPricingModule (upval), HttpService (upval), PerformLookPurchaseModule (upval), FFlagEnableUnifiedPurchaseFlowForDevSubs (upval), PerformDeveloperSubscriptionRobuxPurchaseModule (upval), PerformDeveloperSubscriptionFiatPurchaseModule (upval)
		local v1 = p2[NetworkModule]
		local v2 = p2[AnalyticsModule]
		local State = p1:getState()
		local ProductInfo = State.productInfo
		local Price = ProductInfo.price
		local ProductId = ProductInfo.productId
		local _ = State.promptRequest
		local Id = State.promptRequest.id
		local ProductPayload = State.productPayload
		
		if ProductPayload.kind == "Product" then
			return PerformDevProductEdpPurchaseModule(v1, ProductId, {
				expectedCurrency = ConstantsModule.Currency.Robux,
				expectedPrice = Price,
				saleLocationId = ProductPayload.universeId
			}):andThen(function(Result)
				-- upvalues: p1 (copy), CompletePurchaseModule (upval), v2 (copy), Id (copy), PromiseModule (upval)
				p1:dispatch(CompletePurchaseModule(Result))
				v2.signalPurchaseSuccess(Id, Enum.InfoType.Product, nil, Result)
				
				return PromiseModule.resolve(Result)
			end):catch(function(Err)
				-- upvalues: handleGenericPurchaseError (upval), p1 (copy), FFlagEnablePriceChangedErrorHandlingModule (upval), ProductPayload (copy)
				handleGenericPurchaseError(p1, Err, if FFlagEnablePriceChangedErrorHandlingModule then ProductPayload.kind else nil)
			end)
		end
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
			
			if FFlagPurchasePromptFetchCartPricingForLooks then
				local CartPricing = State.cartPricing
				local Response = CartPricing and CartPricing.response
				
				if Response == nil then
					SelectedOfferIds = {}
				else
					ExpectedPrice = SelectProductPriceModule(State) or ExpectedPrice
					SelectedOfferIds = DeriveSelectedOfferIdsFromCartPricingModule(Response)
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
				selectedOfferIds = SelectedOfferIds
			}):andThen(function(Result)
				-- upvalues: p1 (copy), CompletePurchaseModule (upval), PromiseModule (upval)
				p1:dispatch(CompletePurchaseModule(Result))
				
				return PromiseModule.resolve(Result)
			end):catch(function(Err)
				-- upvalues: handleGenericPurchaseError (upval), p1 (copy), FFlagEnablePriceChangedErrorHandlingModule (upval), ProductPayload (copy)
				handleGenericPurchaseError(p1, Err, if FFlagEnablePriceChangedErrorHandlingModule then ProductPayload.kind else nil)
			end)
		elseif not FFlagEnableUnifiedPurchaseFlowForDevSubs or ProductPayload.kind ~= ProductTypeEnum.DeveloperSubscription then return end
		local SubscriptionId = ProductPayload.subscriptionId
		
		return (if ProductPayload.isSubscriptionInRobux then PerformDeveloperSubscriptionRobuxPurchaseModule(v1, SubscriptionId, ProductPayload.expectedPrice) else PerformDeveloperSubscriptionFiatPurchaseModule(v1, SubscriptionId)):andThen(function()
			-- upvalues: p1 (copy), CompletePurchaseModule (upval), PromiseModule (upval)
			p1:dispatch(CompletePurchaseModule())
			
			return PromiseModule.resolve()
		end):catch(function(Err)
			-- upvalues: handleGenericPurchaseError (upval), p1 (copy), FFlagEnablePriceChangedErrorHandlingModule (upval), ProductPayload (copy)
			handleGenericPurchaseError(p1, Err, if FFlagEnablePriceChangedErrorHandlingModule then ProductPayload.kind else nil)
		end)
	end)
end