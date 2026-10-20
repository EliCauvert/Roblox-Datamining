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
local GetAccountInfoModule = require(PurchasePrompt.Network.getAccountInfo)
local GetBalanceInfoModule = require(PurchasePrompt.Network.getBalanceInfo)
local GetIsAlreadyOwnedModule = require(PurchasePrompt.Network.getIsAlreadyOwned)
local NetworkModule = require(PurchasePrompt.Services.Network)
local ExternalSettingsModule = require(PurchasePrompt.Services.ExternalSettings)
local HasPendingRequestModule = require(PurchasePrompt.Utils.hasPendingRequest)
local PromiseModule = require(PurchasePrompt.Promise)
local ThunkModule = require(PurchasePrompt.Thunk)
local _ = require(Parent.AppCommonLib).Logging
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local FFlagEnableUnifiedProductPurchaseFlow = require(PurchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local GetUnifiedPurchaseFlowEligibilityModule = require(PurchasePrompt.Network.getUnifiedPurchaseFlowEligibility)
local FFlagRemoveAcountInfoFetchFromPurchaseModule = require(PurchasePrompt.Flags.FFlagRemoveAcountInfoFetchFromPurchase)
local ResolveBundlePromptStateModule = require(script.Parent.resolveBundlePromptState)
local FetchCartPricingModule = require(script.Parent.fetchCartPricing)
local FFlagPurchasePromptCartPricingEnabledModule = require(PurchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)

local function _(p1)
	-- upvalues: FFlagPurchasePromptCartPricingEnabledModule (copy), FetchCartPricingModule (copy)
	if FFlagPurchasePromptCartPricingEnabledModule then
		p1:dispatch(FetchCartPricingModule())
	end
end

local FFlagEnablePurchaseFlowUUIDMigrationModule = require(PurchasePrompt.Flags.FFlagEnablePurchaseFlowUUIDMigration)
local FFlagUnifiedPurchaseOptimizeTTIMarketplace = require(PurchasePrompt.Parent.SharedFlags).FFlagUnifiedPurchaseOptimizeTTIMarketplace
local FFlagRefreshPriceOnRetryAfterUpsellModule = require(PurchasePrompt.Flags.FFlagRefreshPriceOnRetryAfterUpsell)
local ApplyRefreshedPriceModule = if FFlagRefreshPriceOnRetryAfterUpsellModule then require(PurchasePrompt.Utils.applyRefreshedPrice) else nil
local GetRobloxSubscriptionProductsFunction = require(Parent.RobloxSubscriptionPurchaseApp).Network.getRobloxSubscriptionProducts
local FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal = require(PurchasePrompt.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal
local PurchaseFlowUUIDTelemetryModule = require(PurchasePrompt.Events.PurchaseFlowUUIDTelemetry)
local list = { NetworkModule, ExternalSettingsModule }

return function(p1, p2, p3, CollectibleItemId, CollectibleItemInstanceId, p4, p5, p6)
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), ExternalSettingsModule (copy), HasPendingRequestModule (copy), FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), BuildProductPayloadFromInitiateArgsModule (copy), SetProductPayloadModule (copy), FFlagEnablePurchaseFlowUUIDMigrationModule (copy), HttpService (copy), SetPurchaseFlowUUIDModule (copy), LoggingProtocolModule (copy), PurchaseFlowUUIDTelemetryModule (copy), RequestBundlePurchaseModule (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy), FFlagUnifiedPurchaseOptimizeTTIMarketplace (copy), FFlagRefreshPriceOnRetryAfterUpsellModule (copy), PromiseModule (copy), GetBundleDetailsModule (copy), FFlagRemoveAcountInfoFetchFromPurchaseModule (copy), Players (copy), GetAccountInfoModule (copy), GetBalanceInfoModule (copy), GetIsAlreadyOwnedModule (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), GetUnifiedPurchaseFlowEligibilityModule (copy), GetRobloxSubscriptionProductsFunction (copy), ApplyRefreshedPriceModule (copy), ResolveBundlePromptStateModule (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), FetchCartPricingModule (copy), GetProductPurchasableDetailsModule (copy)
	return ThunkModule.new(script.Name, list, function(p7, p8)
		-- upvalues: NetworkModule (upval), ExternalSettingsModule (upval), HasPendingRequestModule (upval), FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (upval), p6 (copy), BuildProductPayloadFromInitiateArgsModule (upval), p1 (copy), p2 (copy), p3 (copy), CollectibleItemId (copy), CollectibleItemInstanceId (copy), p4 (copy), p5 (copy), SetProductPayloadModule (upval), FFlagEnablePurchaseFlowUUIDMigrationModule (upval), HttpService (upval), SetPurchaseFlowUUIDModule (upval), LoggingProtocolModule (upval), PurchaseFlowUUIDTelemetryModule (upval), RequestBundlePurchaseModule (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval), FFlagUnifiedPurchaseOptimizeTTIMarketplace (upval), FFlagRefreshPriceOnRetryAfterUpsellModule (upval), PromiseModule (upval), GetBundleDetailsModule (upval), FFlagRemoveAcountInfoFetchFromPurchaseModule (upval), Players (upval), GetAccountInfoModule (upval), GetBalanceInfoModule (upval), GetIsAlreadyOwnedModule (upval), FFlagEnableUnifiedProductPurchaseFlow (upval), GetUnifiedPurchaseFlowEligibilityModule (upval), GetRobloxSubscriptionProductsFunction (upval), ApplyRefreshedPriceModule (upval), ResolveBundlePromptStateModule (upval), FFlagPurchasePromptCartPricingEnabledModule (upval), FetchCartPricingModule (upval), GetProductPurchasableDetailsModule (upval)
		local v1 = p8[NetworkModule]
		local v2 = p8[ExternalSettingsModule]
		
		if HasPendingRequestModule(p7:getState()) and (not FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal or not p6) then
			return nil
		end
		if FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then
			local ProductPayload = p7:getState().productPayload
			
			if not ProductPayload or not ProductPayload.kind then
				local ProductPayloadFromInitiateArgsModule = BuildProductPayloadFromInitiateArgsModule(p1, Enum.InfoType.Bundle, nil, nil, p2, p3, CollectibleItemId, CollectibleItemInstanceId, p4, p5, nil)
				
				if ProductPayloadFromInitiateArgsModule then
					p7:dispatch(SetProductPayloadModule(ProductPayloadFromInitiateArgsModule))
				end
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
			local ProductPayload = p7:getState().productPayload
			v3 = {
				collectibleItemId = CollectibleItemId,
				collectibleItemInstanceId = CollectibleItemInstanceId,
				timedOptionDays = if ProductPayload then ProductPayload.timedOptionDays else nil
			}
		end
		return PromiseModule.all({
			bundleDetails = if FFlagUnifiedPurchaseOptimizeTTIMarketplace and FetchProductInfoFunction ~= nil and (not FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal or not p6) then FetchProductInfoFunction() else GetBundleDetailsModule(v1, p1, if FFlagRefreshPriceOnRetryAfterUpsellModule then v3 else nil),
			accountInfo = if FFlagRemoveAcountInfoFetchFromPurchaseModule then PromiseModule.resolve({
				isPremium = Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium
			}) else GetAccountInfoModule(v1, v2),
			balanceInfo = GetBalanceInfoModule(v1, v2, false, nil, if FFlagUnifiedPurchaseOptimizeTTIMarketplace then ProvidedRobuxBalance else nil),
			alreadyOwned = GetIsAlreadyOwnedModule(v1, p1, Enum.InfoType.Bundle, if FFlagUnifiedPurchaseOptimizeTTIMarketplace then Flag else nil),
			isUserEligibleForUnifiedPurchaseFlow = if FFlagEnableUnifiedProductPurchaseFlow then GetUnifiedPurchaseFlowEligibilityModule(v1) else nil,
			robloxSubscriptionProducts = if FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then GetRobloxSubscriptionProductsFunction(v1):catch(function()
				return nil
			end) else nil
		}):andThen(function(Result)
			-- upvalues: p5 (upval), FFlagRefreshPriceOnRetryAfterUpsellModule (upval), p6 (upval), ApplyRefreshedPriceModule (upval), p7 (copy), FFlagUnifiedPurchaseOptimizeTTIMarketplace (upval), ResolveBundlePromptStateModule (upval), FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (upval), FFlagPurchasePromptCartPricingEnabledModule (upval), FetchCartPricingModule (upval), GetProductPurchasableDetailsModule (upval), v1 (copy), ErrorOccurredModule (upval), PurchaseErrorModule (upval)
			local v4 = p5
			
			if FFlagRefreshPriceOnRetryAfterUpsellModule and p6 then
				local RefreshedExpectedPrice = Result.bundleDetails.refreshedExpectedPrice
				
				if RefreshedExpectedPrice ~= nil then
					v4 = RefreshedExpectedPrice
					ApplyRefreshedPriceModule(p7, RefreshedExpectedPrice)
				end
			end
			if not Result.bundleDetails.product then
				p7:dispatch(ErrorOccurredModule(PurchaseErrorModule.NotForSale))
			elseif FFlagUnifiedPurchaseOptimizeTTIMarketplace then
				p7:dispatch(ResolveBundlePromptStateModule(nil, Result.bundleDetails, Result.accountInfo, Result.balanceInfo, v4, Result.alreadyOwned, Result.isUserEligibleForUnifiedPurchaseFlow, if FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then Result.robloxSubscriptionProducts else nil))
				
				if FFlagPurchasePromptCartPricingEnabledModule then
					p7:dispatch(FetchCartPricingModule())
				end
				return
			else
				GetProductPurchasableDetailsModule(v1, Result.bundleDetails.product.id):andThen(function(Result1)
					-- upvalues: p7 (upval), ResolveBundlePromptStateModule (upval), Result (copy), v4 (ref), FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (upval), FFlagPurchasePromptCartPricingEnabledModule (upval), FetchCartPricingModule (upval)
					p7:dispatch(ResolveBundlePromptStateModule(Result1, Result.bundleDetails, Result.accountInfo, Result.balanceInfo, v4, Result.alreadyOwned, Result.isUserEligibleForUnifiedPurchaseFlow, if FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then Result.robloxSubscriptionProducts else nil))
					
					if FFlagPurchasePromptCartPricingEnabledModule then
						p7:dispatch(FetchCartPricingModule())
					end
				end)
			end
		end):catch(function(Err)
			-- upvalues: p7 (copy), ErrorOccurredModule (upval)
			p7:dispatch(ErrorOccurredModule(Err))
		end)
	end)
end