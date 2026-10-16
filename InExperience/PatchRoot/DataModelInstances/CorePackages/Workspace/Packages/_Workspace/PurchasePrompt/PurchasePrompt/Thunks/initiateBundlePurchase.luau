local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local ErrorOccurredModule = require(PurchasePrompt.Actions.ErrorOccurred)
local RequestBundlePurchaseModule = require(PurchasePrompt.Actions.RequestBundlePurchase)
local SetProductPayloadModule = require(PurchasePrompt.Actions.SetProductPayload)
local BuildProductPayloadFromInitiateArgsModule = require(PurchasePrompt.Utils.buildProductPayloadFromInitiateArgs)
local SetPurchaseFlowUUIDModule = require(PurchasePrompt.Actions.SetPurchaseFlowUUID)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local GetBundleDetailsModule = require(PurchasePrompt.Network.getBundleDetails)
local GetProductPurchasableDetailsModule = require(PurchasePrompt.Network.getProductPurchasableDetails)
local GetBalanceInfoModule = require(PurchasePrompt.Network.getBalanceInfo)
local GetIsAlreadyOwnedModule = require(PurchasePrompt.Network.getIsAlreadyOwned)
local NetworkModule = require(PurchasePrompt.Services.Network)
local ExternalSettingsModule = require(PurchasePrompt.Services.ExternalSettings)
local HasPendingRequestModule = require(PurchasePrompt.Utils.hasPendingRequest)
local PromiseModule = require(PurchasePrompt.Promise)
local ThunkModule = require(PurchasePrompt.Thunk)
local IXPServiceWrapper = require(Parent.IxpServiceWrapper).IXPServiceWrapper
local _ = require(Parent.AppCommonLib).Logging
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local FFlagEnableFetchCartPricingDuringInExperience = require(PurchasePrompt.Parent.SharedFlags).FFlagEnableFetchCartPricingDuringInExperience
local FFlagAXFetchCartPricingDuringInExperienceExposure = require(PurchasePrompt.Parent.SharedFlags).FFlagAXFetchCartPricingDuringInExperienceExposure
local FStringAXFetchCartPricingDuringInExperienceLayerName = require(PurchasePrompt.Parent.SharedFlags).FStringAXFetchCartPricingDuringInExperienceLayerName
local GetUnifiedPurchaseFlowEligibilityModule = require(PurchasePrompt.Network.getUnifiedPurchaseFlowEligibility)
local ResolveBundlePromptStateModule = require(script.Parent.resolveBundlePromptState)
local FetchCartPricingModule = require(script.Parent.fetchCartPricing)
local FFlagEnableInExperiencePurchaseModalMetricsModule = require(PurchasePrompt.Flags.FFlagEnableInExperiencePurchaseModalMetrics)
local TrackInExperiencePurchaseStartModule = require(PurchasePrompt.Utils.trackInExperiencePurchaseStart)
local FFlagEnablePurchaseFlowUUIDMigrationModule = require(PurchasePrompt.Flags.FFlagEnablePurchaseFlowUUIDMigration)
local FFlagUnifiedPurchaseOptimizeTTIMarketplace = require(PurchasePrompt.Parent.SharedFlags).FFlagUnifiedPurchaseOptimizeTTIMarketplace
local FFlagRefreshPriceOnRetryAfterUpsellModule = require(PurchasePrompt.Flags.FFlagRefreshPriceOnRetryAfterUpsell)
local ApplyRefreshedPriceModule = if FFlagRefreshPriceOnRetryAfterUpsellModule then require(PurchasePrompt.Utils.applyRefreshedPrice) else nil
local GetRobloxSubscriptionProductsFunction = require(Parent.RobloxSubscriptionPurchaseApp).Network.getRobloxSubscriptionProducts
local PurchaseFlowUUIDTelemetryModule = require(PurchasePrompt.Events.PurchaseFlowUUIDTelemetry)
local list = { NetworkModule, ExternalSettingsModule }

return function(p1, p2, p3, CollectibleItemId, CollectibleItemInstanceId, p4, p5, p6) --[[ Line: 57 | Named "initiateBundlePurchase" ]]
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), ExternalSettingsModule (copy), HasPendingRequestModule (copy), BuildProductPayloadFromInitiateArgsModule (copy), SetProductPayloadModule (copy), FFlagEnablePurchaseFlowUUIDMigrationModule (copy), HttpService (copy), SetPurchaseFlowUUIDModule (copy), LoggingProtocolModule (copy), PurchaseFlowUUIDTelemetryModule (copy), RequestBundlePurchaseModule (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy), FFlagEnableInExperiencePurchaseModalMetricsModule (copy), TrackInExperiencePurchaseStartModule (copy), FFlagUnifiedPurchaseOptimizeTTIMarketplace (copy), FFlagRefreshPriceOnRetryAfterUpsellModule (copy), FFlagEnableFetchCartPricingDuringInExperience (copy), FetchCartPricingModule (copy), FFlagAXFetchCartPricingDuringInExperienceExposure (copy), IXPServiceWrapper (copy), FStringAXFetchCartPricingDuringInExperienceLayerName (copy), PromiseModule (copy), GetBundleDetailsModule (copy), Players (copy), GetBalanceInfoModule (copy), GetIsAlreadyOwnedModule (copy), GetUnifiedPurchaseFlowEligibilityModule (copy), GetRobloxSubscriptionProductsFunction (copy), ApplyRefreshedPriceModule (copy), ResolveBundlePromptStateModule (copy), GetProductPurchasableDetailsModule (copy)
	return ThunkModule.new(script.Name, list, function(p7, p8) --[[ Line: 67 ]]
		-- upvalues: NetworkModule (upval), ExternalSettingsModule (upval), HasPendingRequestModule (upval), p6 (copy), BuildProductPayloadFromInitiateArgsModule (upval), p1 (copy), p2 (copy), p3 (copy), CollectibleItemId (copy), CollectibleItemInstanceId (copy), p4 (copy), p5 (copy), SetProductPayloadModule (upval), FFlagEnablePurchaseFlowUUIDMigrationModule (upval), HttpService (upval), SetPurchaseFlowUUIDModule (upval), LoggingProtocolModule (upval), PurchaseFlowUUIDTelemetryModule (upval), RequestBundlePurchaseModule (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval), FFlagEnableInExperiencePurchaseModalMetricsModule (upval), TrackInExperiencePurchaseStartModule (upval), FFlagUnifiedPurchaseOptimizeTTIMarketplace (upval), FFlagRefreshPriceOnRetryAfterUpsellModule (upval), FFlagEnableFetchCartPricingDuringInExperience (upval), FetchCartPricingModule (upval), FFlagAXFetchCartPricingDuringInExperienceExposure (upval), IXPServiceWrapper (upval), FStringAXFetchCartPricingDuringInExperienceLayerName (upval), PromiseModule (upval), GetBundleDetailsModule (upval), Players (upval), GetBalanceInfoModule (upval), GetIsAlreadyOwnedModule (upval), GetUnifiedPurchaseFlowEligibilityModule (upval), GetRobloxSubscriptionProductsFunction (upval), ApplyRefreshedPriceModule (upval), ResolveBundlePromptStateModule (upval), GetProductPurchasableDetailsModule (upval)
		local v1 = p8[NetworkModule]
		local v2 = p8[ExternalSettingsModule]
		
		if HasPendingRequestModule(p7:getState()) and not p6 then
			return nil
		end
		local ProductPayload = p7:getState().productPayload
		
		if not ProductPayload or not ProductPayload.kind then
			local ProductPayloadFromInitiateArgsModule = BuildProductPayloadFromInitiateArgsModule(p1, Enum.InfoType.Bundle, nil, nil, p2, p3, CollectibleItemId, CollectibleItemInstanceId, p4, p5, nil)
			
			if ProductPayloadFromInitiateArgsModule then
				p7:dispatch(SetProductPayloadModule(ProductPayloadFromInitiateArgsModule))
			end
		end
		if FFlagEnablePurchaseFlowUUIDMigrationModule then
			p7:dispatch(SetPurchaseFlowUUIDModule((HttpService:GenerateGUID(false))))
			LoggingProtocolModule.default:logRobloxTelemetryCounter(PurchaseFlowUUIDTelemetryModule.InitiatePurchaseCounter, 1, { method = "initiateBundlePurchase" })
		end
		p7:dispatch(RequestBundlePurchaseModule(p1, p2, p3, CollectibleItemId, CollectibleItemInstanceId, p4, p5))
		
		if v2.getFlagOrder66() then
			p7:dispatch(ErrorOccurredModule(PurchaseErrorModule.PurchaseDisabled))
			
			return nil
		end
		if FFlagEnableInExperiencePurchaseModalMetricsModule and not p6 then
			TrackInExperiencePurchaseStartModule(p7)
		end
		local Flag: boolean? = nil
		local ProvidedRobuxBalance = nil
		local FetchProductInfoFunction = nil
		
		if FFlagUnifiedPurchaseOptimizeTTIMarketplace then
			local State = p7:getState()
			local PurchaseOptions = State.purchaseOptions
			local PurchaseCallbacks = State.purchaseCallbacks
			
			if PurchaseOptions ~= nil and PurchaseOptions.shouldSkipOwnershipCheck == true then
				Flag = true
			end
			if PurchaseOptions ~= nil and PurchaseOptions.providedRobuxBalance ~= nil then
				ProvidedRobuxBalance = PurchaseOptions.providedRobuxBalance
			end
			if PurchaseCallbacks ~= nil and PurchaseCallbacks.fetchProductInfo ~= nil then
				FetchProductInfoFunction = PurchaseCallbacks.fetchProductInfo
			end
		end
		local v3 = nil
		
		if FFlagRefreshPriceOnRetryAfterUpsellModule and p6 then
			local ProductPayload1 = p7:getState().productPayload
			v3 = {
				collectibleItemId = CollectibleItemId,
				collectibleItemInstanceId = CollectibleItemInstanceId,
				timedOptionDays = if ProductPayload1 then ProductPayload1.timedOptionDays else nil
			}
		end
		local DispatchResult = if FFlagEnableFetchCartPricingDuringInExperience then if p7:getState().purchaseOptions.shouldFetchCartPricing then p7:dispatch(FetchCartPricingModule()) else nil else p7:dispatch(FetchCartPricingModule())
		
		if FFlagAXFetchCartPricingDuringInExperienceExposure and not p7:getState().purchaseOptions.shouldFetchCartPricing and not p6 then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringAXFetchCartPricingDuringInExperienceLayerName)
		end
		local v4 = if FFlagEnableFetchCartPricingDuringInExperience and not p7:getState().purchaseOptions.shouldFetchCartPricing and not p6 then function(p9) --[[ Line: 182 ]]
			-- upvalues: p7 (copy), FetchCartPricingModule (upval)
			return p7:dispatch(FetchCartPricingModule(nil, p9))
		end else nil
		
		return PromiseModule.all({
			bundleDetails = if FFlagUnifiedPurchaseOptimizeTTIMarketplace and FetchProductInfoFunction ~= nil and not p6 then FetchProductInfoFunction() else GetBundleDetailsModule(v1, p1, if FFlagRefreshPriceOnRetryAfterUpsellModule then v3 else nil, if FFlagEnableFetchCartPricingDuringInExperience then v4 else nil),
			accountInfo = PromiseModule.resolve({
				isPremium = Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium
			}),
			balanceInfo = GetBalanceInfoModule(v1, v2, false, nil, if FFlagUnifiedPurchaseOptimizeTTIMarketplace then ProvidedRobuxBalance else nil),
			alreadyOwned = GetIsAlreadyOwnedModule(v1, p1, Enum.InfoType.Bundle, if FFlagUnifiedPurchaseOptimizeTTIMarketplace then Flag else nil),
			isUserEligibleForUnifiedPurchaseFlow = GetUnifiedPurchaseFlowEligibilityModule(v1),
			robloxSubscriptionProducts = GetRobloxSubscriptionProductsFunction(v1):catch(function() --[[ Line: 215 ]]
				return nil
			end),
			cartPricingResponse = DispatchResult
		}):andThen(function(Result) --[[ Line: 221 ]]
			-- upvalues: p5 (upval), FFlagRefreshPriceOnRetryAfterUpsellModule (upval), p6 (upval), ApplyRefreshedPriceModule (upval), p7 (copy), FFlagUnifiedPurchaseOptimizeTTIMarketplace (upval), ResolveBundlePromptStateModule (upval), GetProductPurchasableDetailsModule (upval), v1 (copy), ErrorOccurredModule (upval), PurchaseErrorModule (upval)
			local v5 = p5
			
			if FFlagRefreshPriceOnRetryAfterUpsellModule and p6 then
				local RefreshedExpectedPrice = Result.bundleDetails.refreshedExpectedPrice
				
				if RefreshedExpectedPrice ~= nil then
					v5 = RefreshedExpectedPrice
					ApplyRefreshedPriceModule(p7, RefreshedExpectedPrice)
				end
			end
			if not Result.bundleDetails.product then
				p7:dispatch(ErrorOccurredModule(PurchaseErrorModule.NotForSale))
			elseif FFlagUnifiedPurchaseOptimizeTTIMarketplace then
				p7:dispatch(ResolveBundlePromptStateModule(nil, Result.bundleDetails, Result.accountInfo, Result.balanceInfo, v5, Result.alreadyOwned, Result.isUserEligibleForUnifiedPurchaseFlow, Result.robloxSubscriptionProducts))
				
				return
			else
				GetProductPurchasableDetailsModule(v1, Result.bundleDetails.product.id):andThen(function(Result1) --[[ Line: 249 ]]
					-- upvalues: p7 (upval), ResolveBundlePromptStateModule (upval), Result (copy), v5 (ref)
					p7:dispatch(ResolveBundlePromptStateModule(Result1, Result.bundleDetails, Result.accountInfo, Result.balanceInfo, v5, Result.alreadyOwned, Result.isUserEligibleForUnifiedPurchaseFlow, Result.robloxSubscriptionProducts))
				end)
			end
		end):catch(function(Err) --[[ Line: 268 ]]
			-- upvalues: p7 (copy), ErrorOccurredModule (upval)
			p7:dispatch(ErrorOccurredModule(Err))
		end)
	end)
end