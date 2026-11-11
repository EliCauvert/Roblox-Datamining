local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local _ = require(PurchasePrompt.Actions.SetABVariation)
local ErrorOccurredModule = require(PurchasePrompt.Actions.ErrorOccurred)
local RequestAssetPurchaseModule = require(PurchasePrompt.Actions.RequestAssetPurchase)
local RequestGamepassPurchaseModule = require(PurchasePrompt.Actions.RequestGamepassPurchase)
local RequestProductPurchaseModule = require(PurchasePrompt.Actions.RequestProductPurchase)
local SetPurchaseFlowUUIDModule = require(PurchasePrompt.Actions.SetPurchaseFlowUUID)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local _ = require(PurchasePrompt.Misc.Constants)
local NetworkModule = require(PurchasePrompt.Services.Network)
local DeprecatedGetProductInfoModule = require(PurchasePrompt.Network.deprecated_GetProductInfo)
local GetProductInfoModule = require(PurchasePrompt.Network.getProductInfo)
local GetBalanceInfoModule = require(PurchasePrompt.Network.getBalanceInfo)
local GetIsAlreadyOwnedModule = require(PurchasePrompt.Network.getIsAlreadyOwned)
local GetAccountInfoModule = require(PurchasePrompt.Network.getAccountInfo)
local ExternalSettingsModule = require(PurchasePrompt.Services.ExternalSettings)
local HasPendingRequestModule = require(PurchasePrompt.Utils.hasPendingRequest)
local PromiseModule = require(PurchasePrompt.Promise)
local ThunkModule = require(PurchasePrompt.Thunk)
local _ = require(Parent.AppCommonLib).Logging
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local ProductTypeEnum = require(PurchasePrompt.types).ProductTypeEnum
local RequestExperiencePurchaseModule = require(PurchasePrompt.Actions.RequestExperiencePurchase)
local RequestLookPurchaseModule = require(PurchasePrompt.Actions.RequestLookPurchase)
local RequestRobuxUpsellPurchaseModule = require(PurchasePrompt.Actions.RequestRobuxUpsellPurchase)
local RequestDeveloperSubscriptionPurchaseModule = require(PurchasePrompt.Actions.RequestDeveloperSubscriptionPurchase)
local FFlagEnableUnifiedProductPurchaseFlow = require(PurchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(PurchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagRemoveAcountInfoFetchFromPurchaseModule = require(PurchasePrompt.Flags.FFlagRemoveAcountInfoFetchFromPurchase)
local SetIsUserEligibleForUnifiedPurchaseFlowModule = require(PurchasePrompt.Actions.SetIsUserEligibleForUnifiedPurchaseFlow)
local SetPromptStateModule = require(PurchasePrompt.Actions.SetPromptState)
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local SetProductPayloadModule = require(PurchasePrompt.Actions.SetProductPayload)
local ResolvePromptStateModule = require(script.Parent.resolvePromptState)
local FetchCartPricingModule = require(script.Parent.fetchCartPricing)
local FFlagPurchasePromptCartPricingEnabledModule = require(PurchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local BuildProductPayloadFromInitiateArgsModule = require(PurchasePrompt.Utils.buildProductPayloadFromInitiateArgs)
local FFlagAddFetchProductInfoAsACallback = require(PurchasePrompt.Parent.SharedFlags).FFlagAddFetchProductInfoAsACallback
local GetFFlagEnableCreatorStorePurchasingCutoverModule = require(PurchasePrompt.Flags.GetFFlagEnableCreatorStorePurchasingCutover)
local FFlagEnablePurchaseFlowUUIDMigrationModule = require(PurchasePrompt.Flags.FFlagEnablePurchaseFlowUUIDMigration)
local GetUnifiedPurchaseFlowEligibilityModule = require(PurchasePrompt.Network.getUnifiedPurchaseFlowEligibility)
local FFlagFixPurchasingErrorCounterModule = require(PurchasePrompt.Flags.FFlagFixPurchasingErrorCounter)
local FFlagRefreshPriceOnRetryAfterUpsellModule = require(PurchasePrompt.Flags.FFlagRefreshPriceOnRetryAfterUpsell)
local RefreshDevSubPriceOnRetryAfterUpsell2 = game:DefineFastFlag("RefreshDevSubPriceOnRetryAfterUpsell2", false)
local FFlagRefreshLookPriceOnRetryAfterUpsellModule = require(PurchasePrompt.Flags.FFlagRefreshLookPriceOnRetryAfterUpsell)
local ApplyRefreshedPriceModule = if FFlagRefreshPriceOnRetryAfterUpsellModule or FFlagRefreshLookPriceOnRetryAfterUpsellModule then require(PurchasePrompt.Utils.applyRefreshedPrice) else nil
local FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = require(PurchasePrompt.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local FFlagAddPurchaseOptionForProvidingBalance = require(PurchasePrompt.Parent.SharedFlags).FFlagAddPurchaseOptionForProvidingBalance
local FFlagUnifiedPurchaseAddSkeleton = require(PurchasePrompt.Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton
local FFlagAXMISWithBlackbird = require(Parent.SharedFlags).FFlagAXMISWithBlackbird
local GetRobloxSubscriptionProductsFunction = require(Parent.RobloxSubscriptionPurchaseApp).Network.getRobloxSubscriptionProducts
local FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal = require(PurchasePrompt.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal
local PurchaseFlowUUIDTelemetryModule = require(PurchasePrompt.Events.PurchaseFlowUUIDTelemetry)
local list = { NetworkModule, ExternalSettingsModule }

return function(SubscriptionId, InfoType, p1, p2, p3, p4, CollectibleItemId, CollectibleItemInstanceId, p5, p6, p7, p8)
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), ExternalSettingsModule (copy), HasPendingRequestModule (copy), FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), FFlagEnablePurchaseFlowUUIDMigrationModule (copy), HttpService (copy), SetPurchaseFlowUUIDModule (copy), LoggingProtocolModule (copy), PurchaseFlowUUIDTelemetryModule (copy), RequestAssetPurchaseModule (copy), RequestGamepassPurchaseModule (copy), RequestProductPurchaseModule (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), ProductTypeEnum (copy), RequestExperiencePurchaseModule (copy), RequestLookPurchaseModule (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), RequestDeveloperSubscriptionPurchaseModule (copy), FFlagAXMISWithBlackbird (copy), RequestRobuxUpsellPurchaseModule (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), FFlagAddPurchaseOptionForProvidingBalance (copy), FFlagUnifiedPurchaseAddSkeleton (copy), FFlagAddFetchProductInfoAsACallback (copy), SetIsUserEligibleForUnifiedPurchaseFlowModule (copy), SetPromptStateModule (copy), PromptStateModule (copy), FFlagRefreshPriceOnRetryAfterUpsellModule (copy), PromiseModule (copy), GetFFlagEnableCreatorStorePurchasingCutoverModule (copy), GetProductInfoModule (copy), DeprecatedGetProductInfoModule (copy), FFlagRemoveAcountInfoFetchFromPurchaseModule (copy), Players (copy), GetAccountInfoModule (copy), GetIsAlreadyOwnedModule (copy), GetBalanceInfoModule (copy), GetUnifiedPurchaseFlowEligibilityModule (copy), GetRobloxSubscriptionProductsFunction (copy), SetProductPayloadModule (copy), BuildProductPayloadFromInitiateArgsModule (copy), FFlagRefreshLookPriceOnRetryAfterUpsellModule (copy), RefreshDevSubPriceOnRetryAfterUpsell2 (copy), ApplyRefreshedPriceModule (copy), ResolvePromptStateModule (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), FetchCartPricingModule (copy), FFlagFixPurchasingErrorCounterModule (copy)
	return ThunkModule.new(script.Name, list, function(p9, p10)
		-- upvalues: NetworkModule (upval), ExternalSettingsModule (upval), HasPendingRequestModule (upval), FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (upval), p8 (copy), FFlagEnablePurchaseFlowUUIDMigrationModule (upval), HttpService (upval), SetPurchaseFlowUUIDModule (upval), LoggingProtocolModule (upval), PurchaseFlowUUIDTelemetryModule (upval), InfoType (copy), RequestAssetPurchaseModule (upval), SubscriptionId (copy), p1 (copy), p2 (copy), p3 (copy), p4 (copy), CollectibleItemId (copy), CollectibleItemInstanceId (copy), p5 (copy), p6 (copy), RequestGamepassPurchaseModule (upval), RequestProductPurchaseModule (upval), FFlagEnableUnifiedProductPurchaseFlow (upval), ProductTypeEnum (upval), RequestExperiencePurchaseModule (upval), RequestLookPurchaseModule (upval), FFlagEnableUnifiedPurchaseFlowForDevSubs (upval), RequestDeveloperSubscriptionPurchaseModule (upval), FFlagAXMISWithBlackbird (upval), RequestRobuxUpsellPurchaseModule (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (upval), FFlagAddPurchaseOptionForProvidingBalance (upval), FFlagUnifiedPurchaseAddSkeleton (upval), FFlagAddFetchProductInfoAsACallback (upval), p7 (copy), SetIsUserEligibleForUnifiedPurchaseFlowModule (upval), SetPromptStateModule (upval), PromptStateModule (upval), FFlagRefreshPriceOnRetryAfterUpsellModule (upval), PromiseModule (upval), GetFFlagEnableCreatorStorePurchasingCutoverModule (upval), GetProductInfoModule (upval), DeprecatedGetProductInfoModule (upval), FFlagRemoveAcountInfoFetchFromPurchaseModule (upval), Players (upval), GetAccountInfoModule (upval), GetIsAlreadyOwnedModule (upval), GetBalanceInfoModule (upval), GetUnifiedPurchaseFlowEligibilityModule (upval), GetRobloxSubscriptionProductsFunction (upval), SetProductPayloadModule (upval), BuildProductPayloadFromInitiateArgsModule (upval), FFlagRefreshLookPriceOnRetryAfterUpsellModule (upval), RefreshDevSubPriceOnRetryAfterUpsell2 (upval), ApplyRefreshedPriceModule (upval), ResolvePromptStateModule (upval), FFlagPurchasePromptCartPricingEnabledModule (upval), FetchCartPricingModule (upval), FFlagFixPurchasingErrorCounterModule (upval)
		local v1 = p10[NetworkModule]
		local v2 = p10[ExternalSettingsModule]
		
		if HasPendingRequestModule(p9:getState()) and (not FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal or not p8) then
			return nil
		end
		if FFlagEnablePurchaseFlowUUIDMigrationModule then
			p9:dispatch(SetPurchaseFlowUUIDModule((HttpService:GenerateGUID(false))))
			LoggingProtocolModule.default:logRobloxTelemetryCounter(PurchaseFlowUUIDTelemetryModule.InitiatePurchaseCounter, 1, { method = "initiatePurchase" })
		end
		if InfoType == Enum.InfoType.Asset then
			p9:dispatch(RequestAssetPurchaseModule(SubscriptionId, p1, p2, p3, p4, CollectibleItemId, CollectibleItemInstanceId, p5, p6))
		elseif InfoType == Enum.InfoType.GamePass then
			p9:dispatch(RequestGamepassPurchaseModule(SubscriptionId))
		elseif InfoType == Enum.InfoType.Product then
			p9:dispatch(RequestProductPurchaseModule(SubscriptionId, p1))
		elseif FFlagEnableUnifiedProductPurchaseFlow and InfoType == ProductTypeEnum.Experience then
			p9:dispatch(RequestExperiencePurchaseModule(SubscriptionId))
		elseif FFlagEnableUnifiedProductPurchaseFlow and InfoType == ProductTypeEnum.Look then
			p9:dispatch(RequestLookPurchaseModule(SubscriptionId))
		elseif FFlagEnableUnifiedPurchaseFlowForDevSubs and InfoType == ProductTypeEnum.DeveloperSubscription then
			p9:dispatch(RequestDeveloperSubscriptionPurchaseModule(SubscriptionId, p6))
		else
			if not FFlagAXMISWithBlackbird or InfoType ~= ProductTypeEnum.RobuxUpsell then
				assert(false, "Invalid product type")
				
				return nil
			end
			p9:dispatch(RequestRobuxUpsellPurchaseModule())
		end
		if v2.getFlagOrder66() then
			p9:dispatch(ErrorOccurredModule(PurchaseErrorModule.PurchaseDisabled))
			
			return nil
		end
		local Flag: boolean? = nil
		local ProvidedRobuxBalance = nil
		local Flag1: boolean? = nil
		
		if FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then
			local PurchaseOptions = p9:getState().purchaseOptions
			
			if PurchaseOptions ~= nil and PurchaseOptions.shouldSkipOwnershipCheck == true then
				Flag = true
			end
			if FFlagAddPurchaseOptionForProvidingBalance and PurchaseOptions ~= nil and PurchaseOptions.providedRobuxBalance ~= nil then
				ProvidedRobuxBalance = PurchaseOptions.providedRobuxBalance
			end
			if FFlagUnifiedPurchaseAddSkeleton and PurchaseOptions ~= nil and PurchaseOptions.enablePreloadedPurchaseUI == true then
				Flag1 = true
			end
		end
		local FetchProductInfoFunction = nil
		
		if FFlagAddFetchProductInfoAsACallback then
			local PurchaseCallbacks = p9:getState().purchaseCallbacks
			
			if PurchaseCallbacks ~= nil and PurchaseCallbacks.fetchProductInfo ~= nil then
				FetchProductInfoFunction = PurchaseCallbacks.fetchProductInfo
			end
		end
		local v3 = if FFlagEnableUnifiedProductPurchaseFlow then p7 else nil
		
		if FFlagEnableUnifiedProductPurchaseFlow and FFlagUnifiedPurchaseAddSkeleton and Flag1 then
			p9:dispatch(SetIsUserEligibleForUnifiedPurchaseFlowModule(true))
			p9:dispatch(SetPromptStateModule(PromptStateModule.InitializingPurchase))
		end
		local v4 = nil
		
		if FFlagRefreshPriceOnRetryAfterUpsellModule and p8 then
			local ProductPayload = p9:getState().productPayload
			v4 = {
				collectibleItemId = CollectibleItemId,
				collectibleItemInstanceId = CollectibleItemInstanceId,
				timedOptionDays = if ProductPayload then ProductPayload.timedOptionDays else nil
			}
		end
		return PromiseModule.all({
			productInfo = if GetFFlagEnableCreatorStorePurchasingCutoverModule() then if FFlagAddFetchProductInfoAsACallback and FetchProductInfoFunction ~= nil and (not FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal or not p8) then FetchProductInfoFunction() else GetProductInfoModule(v1, SubscriptionId, InfoType, v3, if FFlagRefreshPriceOnRetryAfterUpsellModule then v4 else nil) else DeprecatedGetProductInfoModule(v1, SubscriptionId, InfoType),
			accountInfo = if FFlagRemoveAcountInfoFetchFromPurchaseModule then PromiseModule.resolve({
				isPremium = Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium
			}) else GetAccountInfoModule(v1, v2),
			alreadyOwned = GetIsAlreadyOwnedModule(v1, SubscriptionId, InfoType, Flag),
			balanceInfo = GetBalanceInfoModule(v1, v2, false, true, ProvidedRobuxBalance),
			isUserEligibleForUnifiedPurchaseFlow = if FFlagEnableUnifiedProductPurchaseFlow then GetUnifiedPurchaseFlowEligibilityModule(v1, InfoType) else nil,
			robloxSubscriptionProducts = if FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then GetRobloxSubscriptionProductsFunction():catch(function()
				return nil
			end) else nil
		}):andThen(function(Result)
			-- upvalues: FFlagEnableUnifiedPurchaseFlowForDevSubs (upval), ProductTypeEnum (upval), p9 (copy), SetProductPayloadModule (upval), SubscriptionId (upval), FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (upval), BuildProductPayloadFromInitiateArgsModule (upval), InfoType (upval), p1 (upval), p2 (upval), p3 (upval), p4 (upval), CollectibleItemId (upval), CollectibleItemInstanceId (upval), p5 (upval), p6 (upval), v3 (copy), FFlagRefreshPriceOnRetryAfterUpsellModule (upval), FFlagRefreshLookPriceOnRetryAfterUpsellModule (upval), p8 (upval), RefreshDevSubPriceOnRetryAfterUpsell2 (upval), ApplyRefreshedPriceModule (upval), ResolvePromptStateModule (upval), FFlagPurchasePromptCartPricingEnabledModule (upval), FetchCartPricingModule (upval)
			if FFlagEnableUnifiedPurchaseFlowForDevSubs and Result.productInfo.ProductType == ProductTypeEnum.DeveloperSubscription and (p9:getState().productPayload == nil or p9:getState().productPayload.kind == nil) then
				p9:dispatch(SetProductPayloadModule({
					subscriptionId = SubscriptionId,
					kind = ProductTypeEnum.DeveloperSubscription,
					expectedPrice = Result.productInfo.PriceInRobux,
					iconImageAssetId = Result.productInfo.IconImageAssetId,
					isSubscriptionInRobux = Result.productInfo.PriceInRobux ~= nil and Result.productInfo.PriceInRobux > 0
				}))
			end
			if FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then
				local ProductPayload = p9:getState().productPayload
				
				if not ProductPayload or not ProductPayload.kind then
					local ProductPayloadFromInitiateArgsModule = BuildProductPayloadFromInitiateArgsModule(SubscriptionId, InfoType, p1, p2, p3, p4, CollectibleItemId, CollectibleItemInstanceId, p5, p6, v3)
					
					if ProductPayloadFromInitiateArgsModule then
						p9:dispatch(SetProductPayloadModule(ProductPayloadFromInitiateArgsModule))
					end
				end
			end
			local v5 = p6
			
			if (FFlagRefreshPriceOnRetryAfterUpsellModule or FFlagRefreshLookPriceOnRetryAfterUpsellModule) and p8 then
				local PriceInRobux = if RefreshDevSubPriceOnRetryAfterUpsell2 and FFlagEnableUnifiedPurchaseFlowForDevSubs and Result.productInfo.ProductType == ProductTypeEnum.DeveloperSubscription then Result.productInfo.PriceInRobux else Result.productInfo.refreshedExpectedPrice
				
				if PriceInRobux ~= nil then
					v5 = PriceInRobux
					ApplyRefreshedPriceModule(p9, PriceInRobux)
				end
			end
			p9:dispatch(ResolvePromptStateModule(Result.productInfo, Result.accountInfo, Result.balanceInfo, Result.alreadyOwned, p2, v5, Result.isUserEligibleForUnifiedPurchaseFlow, if FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then Result.robloxSubscriptionProducts else nil))
			
			if FFlagPurchasePromptCartPricingEnabledModule then
				p9:dispatch(FetchCartPricingModule())
			end
		end):catch(function(Err)
			-- upvalues: FFlagFixPurchasingErrorCounterModule (upval), PurchaseErrorModule (upval), p9 (copy), ErrorOccurredModule (upval)
			if not FFlagFixPurchasingErrorCounterModule then
				p9:dispatch(ErrorOccurredModule(Err))
				
				return
			end
			if PurchaseErrorModule.isMember(Err) then
				p9:dispatch(ErrorOccurredModule(Err))
				
				return
			else
				p9:dispatch(ErrorOccurredModule(PurchaseErrorModule.UnknownFailure))
			end
		end)
	end)
end