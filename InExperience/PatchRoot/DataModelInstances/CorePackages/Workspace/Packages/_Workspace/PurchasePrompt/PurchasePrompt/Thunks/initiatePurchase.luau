local playersService = game:GetService("Players")
local httpService = game:GetService("HttpService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(purchasePrompt.Actions.SetABVariation)
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local requestAssetPurchaseModule = require(purchasePrompt.Actions.RequestAssetPurchase)
local requestGamepassPurchaseModule = require(purchasePrompt.Actions.RequestGamepassPurchase)
local requestProductPurchaseModule = require(purchasePrompt.Actions.RequestProductPurchase)
local setPurchaseFlowUUIDModule = require(purchasePrompt.Actions.SetPurchaseFlowUUID)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local _ = require(purchasePrompt.Misc.Constants)
local networkModule = require(purchasePrompt.Services.Network)
local deprecatedGetProductInfoModule = require(purchasePrompt.Network.deprecated_GetProductInfo)
local getProductInfoModule = require(purchasePrompt.Network.getProductInfo)
local getBalanceInfoModule = require(purchasePrompt.Network.getBalanceInfo)
local getIsAlreadyOwnedModule = require(purchasePrompt.Network.getIsAlreadyOwned)
local getAccountInfoModule = require(purchasePrompt.Network.getAccountInfo)
local externalSettingsModule = require(purchasePrompt.Services.ExternalSettings)
local hasPendingRequestModule = require(purchasePrompt.Utils.hasPendingRequest)
local promiseModule = require(purchasePrompt.Promise)
local thunkModule = require(purchasePrompt.Thunk)
local IXPServiceWrapper = require(parent.IxpServiceWrapper).IXPServiceWrapper
local _ = require(parent.AppCommonLib).Logging
local loggingProtocolModule = require(parent.LoggingProtocol)
local productTypeEnum = require(purchasePrompt.types).ProductTypeEnum
local requestExperiencePurchaseModule = require(purchasePrompt.Actions.RequestExperiencePurchase)
local requestLookPurchaseModule = require(purchasePrompt.Actions.RequestLookPurchase)
local requestRobuxUpsellPurchaseModule = require(purchasePrompt.Actions.RequestRobuxUpsellPurchase)
local requestDeveloperSubscriptionPurchaseModule = require(purchasePrompt.Actions.RequestDeveloperSubscriptionPurchase)
local fFlagEnableUnifiedProductPurchaseFlow = require(purchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(purchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local fFlagRemoveAcountInfoFetchFromPurchaseModule = require(purchasePrompt.Flags.FFlagRemoveAcountInfoFetchFromPurchase)
local setIsUserEligibleForUnifiedPurchaseFlowModule = require(purchasePrompt.Actions.SetIsUserEligibleForUnifiedPurchaseFlow)
local setPromptStateModule = require(purchasePrompt.Actions.SetPromptState)
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local setProductPayloadModule = require(purchasePrompt.Actions.SetProductPayload)
local resolvePromptStateModule = require(script.Parent.resolvePromptState)
local fetchCartPricingModule = require(script.Parent.fetchCartPricing)
local fetchInGameItemCartPricingModule = require(script.Parent.fetchInGameItemCartPricing)
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local fFlagPurchasePromptOfferMarginUpsellEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptOfferMarginUpsellEnabled)
local fFlagMockCartPricingResponseInStudioModule = require(purchasePrompt.Flags.FFlagMockCartPricingResponseInStudio)
local buildProductPayloadFromInitiateArgsModule = require(purchasePrompt.Utils.buildProductPayloadFromInitiateArgs)
local fFlagAddFetchProductInfoAsACallback = require(purchasePrompt.Parent.SharedFlags).FFlagAddFetchProductInfoAsACallback
local fFlagEnableFetchCartPricingDuringInExperience = require(purchasePrompt.Parent.SharedFlags).FFlagEnableFetchCartPricingDuringInExperience
local fFlagEnableInExperienceOffersPurchaseFlow = require(purchasePrompt.Parent.SharedFlags).FFlagEnableInExperienceOffersPurchaseFlow
local fFlagAXFetchCartPricingDuringInExperienceExposure = require(purchasePrompt.Parent.SharedFlags).FFlagAXFetchCartPricingDuringInExperienceExposure
local fStringAXFetchCartPricingDuringInExperienceLayerName = require(purchasePrompt.Parent.SharedFlags).FStringAXFetchCartPricingDuringInExperienceLayerName
local getFFlagEnableCreatorStorePurchasingCutoverModule = require(purchasePrompt.Flags.GetFFlagEnableCreatorStorePurchasingCutover)
local fFlagEnablePurchaseFlowUUIDMigrationModule = require(purchasePrompt.Flags.FFlagEnablePurchaseFlowUUIDMigration)
local getUnifiedPurchaseFlowEligibilityModule = require(purchasePrompt.Network.getUnifiedPurchaseFlowEligibility)
local fFlagFixPurchasingErrorCounterModule = require(purchasePrompt.Flags.FFlagFixPurchasingErrorCounter)
local fFlagRefreshPriceOnRetryAfterUpsellModule = require(purchasePrompt.Flags.FFlagRefreshPriceOnRetryAfterUpsell)
local refreshDevSubPriceOnRetryAfterUpsell2 = game:DefineFastFlag("RefreshDevSubPriceOnRetryAfterUpsell2", false)
local fFlagRefreshLookPriceOnRetryAfterUpsellModule = require(purchasePrompt.Flags.FFlagRefreshLookPriceOnRetryAfterUpsell)
local var1 = if fFlagRefreshPriceOnRetryAfterUpsellModule or fFlagRefreshLookPriceOnRetryAfterUpsellModule then require(purchasePrompt.Utils.applyRefreshedPrice) else nil
local fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = require(purchasePrompt.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local fFlagAddPurchaseOptionForProvidingBalance = require(purchasePrompt.Parent.SharedFlags).FFlagAddPurchaseOptionForProvidingBalance
local fFlagUnifiedPurchaseAddSkeleton = require(purchasePrompt.Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton
local fFlagAXMISWithBlackbird = sharedFlagsModule.FFlagAXMISWithBlackbird
local fFlagEnableInExperiencePurchaseModalMetricsModule = require(purchasePrompt.Flags.FFlagEnableInExperiencePurchaseModalMetrics)
local trackInExperiencePurchaseStartModule = require(purchasePrompt.Utils.trackInExperiencePurchaseStart)
local appContextModule = require(purchasePrompt.Utils.AppContext)
local getRobloxSubscriptionProducts = require(parent.RobloxSubscriptionPurchaseApp).Network.getRobloxSubscriptionProducts
local fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal = require(purchasePrompt.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal
local purchaseFlowUUIDTelemetryModule = require(purchasePrompt.Events.PurchaseFlowUUIDTelemetry)
local list = { networkModule, externalSettingsModule }

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), externalSettingsModule (ref), hasPendingRequestModule (ref), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (ref), fFlagEnablePurchaseFlowUUIDMigrationModule (ref), httpService (ref), setPurchaseFlowUUIDModule (ref), loggingProtocolModule (ref), purchaseFlowUUIDTelemetryModule (ref), requestAssetPurchaseModule (ref), requestGamepassPurchaseModule (ref), requestProductPurchaseModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), productTypeEnum (ref), requestExperiencePurchaseModule (ref), requestLookPurchaseModule (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), requestDeveloperSubscriptionPurchaseModule (ref), fFlagAXMISWithBlackbird (ref), requestRobuxUpsellPurchaseModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref), fFlagEnableInExperiencePurchaseModalMetricsModule (ref), trackInExperiencePurchaseStartModule (ref), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (ref), fFlagAddPurchaseOptionForProvidingBalance (ref), fFlagUnifiedPurchaseAddSkeleton (ref), fFlagAddFetchProductInfoAsACallback (ref), setIsUserEligibleForUnifiedPurchaseFlowModule (ref), setPromptStateModule (ref), promptStateModule (ref), fFlagRefreshPriceOnRetryAfterUpsellModule (ref), fFlagPurchasePromptOfferMarginUpsellEnabledModule (ref), fFlagEnableFetchCartPricingDuringInExperience (ref), fetchCartPricingModule (ref), fFlagAXFetchCartPricingDuringInExperienceExposure (ref), IXPServiceWrapper (ref), fStringAXFetchCartPricingDuringInExperienceLayerName (ref), fFlagMockCartPricingResponseInStudioModule (ref), appContextModule (ref), fFlagEnableInExperienceOffersPurchaseFlow (ref), fetchInGameItemCartPricingModule (ref), promiseModule (ref), getFFlagEnableCreatorStorePurchasingCutoverModule (ref), getProductInfoModule (ref), deprecatedGetProductInfoModule (ref), fFlagRemoveAcountInfoFetchFromPurchaseModule (ref), playersService (ref), getAccountInfoModule (ref), getIsAlreadyOwnedModule (ref), getBalanceInfoModule (ref), getUnifiedPurchaseFlowEligibilityModule (ref), getRobloxSubscriptionProducts (ref), setProductPayloadModule (ref), buildProductPayloadFromInitiateArgsModule (ref), fFlagRefreshLookPriceOnRetryAfterUpsellModule (ref), refreshDevSubPriceOnRetryAfterUpsell2 (ref), var1 (ref), resolvePromptStateModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), fFlagFixPurchasingErrorCounterModule (ref)
	return thunkModule.new(script.Name, list, function(p13, p14)
		-- upvalues: networkModule (copy), externalSettingsModule (copy), hasPendingRequestModule (copy), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), p12 (ref), fFlagEnablePurchaseFlowUUIDMigrationModule (copy), httpService (copy), setPurchaseFlowUUIDModule (copy), loggingProtocolModule (copy), purchaseFlowUUIDTelemetryModule (copy), p2 (ref), requestAssetPurchaseModule (copy), p1 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref), p7 (ref), p8 (ref), p9 (ref), p10 (ref), requestGamepassPurchaseModule (copy), requestProductPurchaseModule (copy), fFlagEnableUnifiedProductPurchaseFlow (copy), productTypeEnum (copy), requestExperiencePurchaseModule (copy), requestLookPurchaseModule (copy), fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), requestDeveloperSubscriptionPurchaseModule (copy), fFlagAXMISWithBlackbird (copy), requestRobuxUpsellPurchaseModule (copy), errorOccurredModule (copy), purchaseErrorModule (copy), fFlagEnableInExperiencePurchaseModalMetricsModule (copy), trackInExperiencePurchaseStartModule (copy), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), fFlagAddPurchaseOptionForProvidingBalance (copy), fFlagUnifiedPurchaseAddSkeleton (copy), fFlagAddFetchProductInfoAsACallback (copy), p11 (ref), setIsUserEligibleForUnifiedPurchaseFlowModule (copy), setPromptStateModule (copy), promptStateModule (copy), fFlagRefreshPriceOnRetryAfterUpsellModule (copy), fFlagPurchasePromptOfferMarginUpsellEnabledModule (copy), fFlagEnableFetchCartPricingDuringInExperience (copy), fetchCartPricingModule (copy), fFlagAXFetchCartPricingDuringInExperienceExposure (copy), IXPServiceWrapper (copy), fStringAXFetchCartPricingDuringInExperienceLayerName (copy), fFlagMockCartPricingResponseInStudioModule (copy), appContextModule (copy), fFlagEnableInExperienceOffersPurchaseFlow (copy), fetchInGameItemCartPricingModule (copy), promiseModule (copy), getFFlagEnableCreatorStorePurchasingCutoverModule (copy), getProductInfoModule (copy), deprecatedGetProductInfoModule (copy), fFlagRemoveAcountInfoFetchFromPurchaseModule (copy), playersService (copy), getAccountInfoModule (copy), getIsAlreadyOwnedModule (copy), getBalanceInfoModule (copy), getUnifiedPurchaseFlowEligibilityModule (copy), getRobloxSubscriptionProducts (copy), setProductPayloadModule (copy), buildProductPayloadFromInitiateArgsModule (copy), fFlagRefreshLookPriceOnRetryAfterUpsellModule (copy), refreshDevSubPriceOnRetryAfterUpsell2 (copy), var1 (copy), resolvePromptStateModule (copy), fFlagPurchasePromptCartPricingEnabledModule (copy), fFlagFixPurchasingErrorCounterModule (copy)
		local var2 = p14[networkModule]
		local var3 = p14[externalSettingsModule]
		
		if hasPendingRequestModule(p13:getState()) and (not fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal or not p12) then
			return nil
		elseif fFlagEnablePurchaseFlowUUIDMigrationModule then
			p13:dispatch(setPurchaseFlowUUIDModule(httpService:GenerateGUID(false)))
			loggingProtocolModule.default:logRobloxTelemetryCounter(purchaseFlowUUIDTelemetryModule.InitiatePurchaseCounter, 1, { method = "initiatePurchase" })
		end
		if p2 == Enum.InfoType.Asset then
			p13:dispatch(requestAssetPurchaseModule(p1, p3, p4, p5, p6, p7, p8, p9, p10))
		elseif p2 == Enum.InfoType.GamePass then
			p13:dispatch(requestGamepassPurchaseModule(p1))
		elseif p2 == Enum.InfoType.Product then
			p13:dispatch(requestProductPurchaseModule(p1, p3))
		elseif fFlagEnableUnifiedProductPurchaseFlow and p2 == productTypeEnum.Experience then
			p13:dispatch(requestExperiencePurchaseModule(p1))
		elseif fFlagEnableUnifiedProductPurchaseFlow and p2 == productTypeEnum.Look then
			p13:dispatch(requestLookPurchaseModule(p1))
		elseif fFlagEnableUnifiedPurchaseFlowForDevSubs and p2 == productTypeEnum.DeveloperSubscription then
			p13:dispatch(requestDeveloperSubscriptionPurchaseModule(p1, p10))
		elseif fFlagAXMISWithBlackbird and p2 == productTypeEnum.RobuxUpsell then
			p13:dispatch(requestRobuxUpsellPurchaseModule())
		else
			assert(false, "Invalid product type")
			
			return nil
		end
		if var3.getFlagOrder66() then
			p13:dispatch(errorOccurredModule(purchaseErrorModule.PurchaseDisabled))
			
			return nil
		elseif fFlagEnableInExperiencePurchaseModalMetricsModule and not p12 then
			trackInExperiencePurchaseStartModule(p13)
		end
		local var4 = nil
		local providedRobuxBalance = nil
		local var5 = nil
		
		if fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then
			local purchaseOptions = p13:getState().purchaseOptions
			
			if purchaseOptions ~= nil and purchaseOptions.shouldSkipOwnershipCheck == true then
				var4 = true
			end
			if fFlagAddPurchaseOptionForProvidingBalance and purchaseOptions ~= nil and purchaseOptions.providedRobuxBalance ~= nil then
				providedRobuxBalance = purchaseOptions.providedRobuxBalance
			end
			if fFlagUnifiedPurchaseAddSkeleton and purchaseOptions ~= nil and purchaseOptions.enablePreloadedPurchaseUI == true then
				var5 = true
			end
		end
		local fetchProductInfo = nil
		
		if fFlagAddFetchProductInfoAsACallback then
			local purchaseCallbacks = p13:getState().purchaseCallbacks
			
			if purchaseCallbacks ~= nil and purchaseCallbacks.fetchProductInfo ~= nil then
				fetchProductInfo = purchaseCallbacks.fetchProductInfo
			end
		end
		local var6 = if fFlagEnableUnifiedProductPurchaseFlow then p11 else nil
		
		if fFlagEnableUnifiedProductPurchaseFlow and fFlagUnifiedPurchaseAddSkeleton and var5 then
			p13:dispatch(setIsUserEligibleForUnifiedPurchaseFlowModule(true))
			p13:dispatch(setPromptStateModule(promptStateModule.InitializingPurchase))
		end
		local t = nil
		
		if fFlagRefreshPriceOnRetryAfterUpsellModule and p12 then
			local productPayload = p13:getState().productPayload
			t = {
				collectibleItemId = p7,
				collectibleItemInstanceId = p8,
				timedOptionDays = if productPayload then productPayload.timedOptionDays else nil
			}
		end
		local var7 = if fFlagPurchasePromptOfferMarginUpsellEnabledModule then if fFlagEnableFetchCartPricingDuringInExperience then if p13:getState().purchaseOptions.shouldFetchCartPricing then p13:dispatch(fetchCartPricingModule()) else nil else p13:dispatch(fetchCartPricingModule()) else nil
		
		if fFlagAXFetchCartPricingDuringInExperienceExposure and p2 == Enum.InfoType.Asset and (not p13:getState().purchaseOptions.shouldFetchCartPricing and not p12) then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(fStringAXFetchCartPricingDuringInExperienceLayerName)
		end
		return promiseModule.all({
			productInfo = if not getFFlagEnableCreatorStorePurchasingCutoverModule() then if fFlagAddFetchProductInfoAsACallback and fetchProductInfo ~= nil and (not fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal or not p12) then fetchProductInfo() else getProductInfoModule(var2, p1, p2, var6, if fFlagRefreshPriceOnRetryAfterUpsellModule then t else nil, if fFlagEnableFetchCartPricingDuringInExperience then if fFlagEnableFetchCartPricingDuringInExperience and p2 == Enum.InfoType.Asset and (not p13:getState().purchaseOptions.shouldFetchCartPricing and not p12) then function(p15)
				-- upvalues: p13 (ref), fetchCartPricingModule (copy)
				return p13:dispatch(fetchCartPricingModule(nil, p15))
			end else nil else nil) else deprecatedGetProductInfoModule(var2, p1, p2),
			accountInfo = if fFlagRemoveAcountInfoFetchFromPurchaseModule then promiseModule.resolve({
				isPremium = playersService.LocalPlayer.MembershipType == Enum.MembershipType.Premium
			}) else getAccountInfoModule(var2, var3),
			alreadyOwned = getIsAlreadyOwnedModule(var2, p1, p2, var4),
			balanceInfo = getBalanceInfoModule(var2, var3, false, true, providedRobuxBalance),
			isUserEligibleForUnifiedPurchaseFlow = if fFlagEnableUnifiedProductPurchaseFlow then getUnifiedPurchaseFlowEligibilityModule(var2, p2) else nil,
			robloxSubscriptionProducts = if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then getRobloxSubscriptionProducts():catch(function()
				return nil
			end) else nil,
			cartPricingResponse = if fFlagPurchasePromptOfferMarginUpsellEnabledModule then var7 else nil,
			inGameItemCartPricingResponse = if fFlagEnableInExperienceOffersPurchaseFlow then if fFlagEnableInExperienceOffersPurchaseFlow and fFlagPurchasePromptOfferMarginUpsellEnabledModule and (p2 == Enum.InfoType.GamePass or p2 == Enum.InfoType.Product) and (fFlagMockCartPricingResponseInStudioModule and var3.isStudio() or appContextModule.get() == appContextModule.Enum.IN_EXPERIENCE) then p13:dispatch(fetchInGameItemCartPricingModule()) else nil else nil
		}):andThen(function(p15)
			-- upvalues: fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), productTypeEnum (copy), p13 (ref), setProductPayloadModule (copy), p1 (copy), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), buildProductPayloadFromInitiateArgsModule (copy), p2 (copy), p3 (copy), p4 (copy), p5 (copy), p6 (copy), p7 (copy), p8 (copy), p9 (copy), p10 (copy), var6 (ref), fFlagRefreshPriceOnRetryAfterUpsellModule (copy), fFlagRefreshLookPriceOnRetryAfterUpsellModule (copy), p12 (copy), refreshDevSubPriceOnRetryAfterUpsell2 (copy), var1 (copy), resolvePromptStateModule (copy), fFlagPurchasePromptCartPricingEnabledModule (copy), fFlagPurchasePromptOfferMarginUpsellEnabledModule (copy), fetchCartPricingModule (copy)
			local productPayload
			if fFlagEnableUnifiedPurchaseFlowForDevSubs and p15.productInfo.ProductType == productTypeEnum.DeveloperSubscription and (p13:getState().productPayload == nil or p13:getState().productPayload.kind == nil) then
				p13:dispatch(setProductPayloadModule({
					subscriptionId = p1,
					kind = productTypeEnum.DeveloperSubscription,
					expectedPrice = p15.productInfo.PriceInRobux,
					iconImageAssetId = p15.productInfo.IconImageAssetId,
					isSubscriptionInRobux = p15.productInfo.PriceInRobux ~= nil and p15.productInfo.PriceInRobux > 0
				}))
			end
			if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then
				productPayload = p13:getState().productPayload
				
				if not productPayload or not productPayload.kind then
					local var8 = buildProductPayloadFromInitiateArgsModule(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, var6)
					
					if var8 then
						p13:dispatch(setProductPayloadModule(var8))
					end
				end
			end
			productPayload = p10
			
			if (fFlagRefreshPriceOnRetryAfterUpsellModule or fFlagRefreshLookPriceOnRetryAfterUpsellModule) and p12 then
				local var9 = if refreshDevSubPriceOnRetryAfterUpsell2 and fFlagEnableUnifiedPurchaseFlowForDevSubs and p15.productInfo.ProductType == productTypeEnum.DeveloperSubscription then p15.productInfo.PriceInRobux else p15.productInfo.refreshedExpectedPrice
				
				if var9 ~= nil then
					productPayload = var9
					var1(p13, var9)
				end
			end
			p13:dispatch(resolvePromptStateModule(p15.productInfo, p15.accountInfo, p15.balanceInfo, p15.alreadyOwned, p4, productPayload, p15.isUserEligibleForUnifiedPurchaseFlow, if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then p15.robloxSubscriptionProducts else nil))
			
			if fFlagPurchasePromptCartPricingEnabledModule and not fFlagPurchasePromptOfferMarginUpsellEnabledModule then
				p13:dispatch(fetchCartPricingModule())
			end
		end):catch(function(p15)
			-- upvalues: fFlagFixPurchasingErrorCounterModule (copy), purchaseErrorModule (copy), p13 (ref), errorOccurredModule (copy)
			if not fFlagFixPurchasingErrorCounterModule then
				p13:dispatch(errorOccurredModule(p15))
				
				return
			elseif purchaseErrorModule.isMember(p15) then
				p13:dispatch(errorOccurredModule(p15))
				
				return
			end
			p13:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
		end)
	end)
end