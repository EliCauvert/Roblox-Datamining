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
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local fFlagPurchasePromptOfferMarginUpsellEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptOfferMarginUpsellEnabled)
local buildProductPayloadFromInitiateArgsModule = require(purchasePrompt.Utils.buildProductPayloadFromInitiateArgs)
local fFlagAddFetchProductInfoAsACallback = require(purchasePrompt.Parent.SharedFlags).FFlagAddFetchProductInfoAsACallback
local fFlagEnableFetchCartPricingDuringInExperience = require(purchasePrompt.Parent.SharedFlags).FFlagEnableFetchCartPricingDuringInExperience
local fFlagAXFetchCartPricingDuringInExperienceExposure = require(purchasePrompt.Parent.SharedFlags).FFlagAXFetchCartPricingDuringInExperienceExposure
local fStringAXFetchCartPricingDuringInExperienceLayerName = require(purchasePrompt.Parent.SharedFlags).FStringAXFetchCartPricingDuringInExperienceLayerName
local getFFlagEnableCreatorStorePurchasingCutoverModule = require(purchasePrompt.Flags.GetFFlagEnableCreatorStorePurchasingCutover)
local fFlagEnablePurchaseFlowUUIDMigrationModule = require(purchasePrompt.Flags.FFlagEnablePurchaseFlowUUIDMigration)
local getUnifiedPurchaseFlowEligibilityModule = require(purchasePrompt.Network.getUnifiedPurchaseFlowEligibility)
local fFlagFixPurchasingErrorCounterModule = require(purchasePrompt.Flags.FFlagFixPurchasingErrorCounter)
local fFlagRefreshPriceOnRetryAfterUpsellModule = require(purchasePrompt.Flags.FFlagRefreshPriceOnRetryAfterUpsell)
local refreshDevSubPriceOnRetryAfterUpsell2 = game:DefineFastFlag("RefreshDevSubPriceOnRetryAfterUpsell2", false)
local fFlagRefreshLookPriceOnRetryAfterUpsellModule = require(purchasePrompt.Flags.FFlagRefreshLookPriceOnRetryAfterUpsell)
local var42 = if fFlagRefreshPriceOnRetryAfterUpsellModule or fFlagRefreshLookPriceOnRetryAfterUpsellModule then require(purchasePrompt.Utils.applyRefreshedPrice) else nil
local fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = require(purchasePrompt.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local fFlagAddPurchaseOptionForProvidingBalance = require(purchasePrompt.Parent.SharedFlags).FFlagAddPurchaseOptionForProvidingBalance
local fFlagUnifiedPurchaseAddSkeleton = require(purchasePrompt.Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton
local fFlagAXMISWithBlackbird = sharedFlagsModule.FFlagAXMISWithBlackbird
local getRobloxSubscriptionProducts = require(parent.RobloxSubscriptionPurchaseApp).Network.getRobloxSubscriptionProducts
local fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal = require(purchasePrompt.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal
local purchaseFlowUUIDTelemetryModule = require(purchasePrompt.Events.PurchaseFlowUUIDTelemetry)
local list = { networkModule, externalSettingsModule }

return function(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11) --[[ line: 93 | named "initiatePurchase" ]]
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), externalSettingsModule (ref), hasPendingRequestModule (ref), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (ref), fFlagEnablePurchaseFlowUUIDMigrationModule (ref), httpService (ref), setPurchaseFlowUUIDModule (ref), loggingProtocolModule (ref), purchaseFlowUUIDTelemetryModule (ref), requestAssetPurchaseModule (ref), requestGamepassPurchaseModule (ref), requestProductPurchaseModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), productTypeEnum (ref), requestExperiencePurchaseModule (ref), requestLookPurchaseModule (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), requestDeveloperSubscriptionPurchaseModule (ref), fFlagAXMISWithBlackbird (ref), requestRobuxUpsellPurchaseModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (ref), fFlagAddPurchaseOptionForProvidingBalance (ref), fFlagUnifiedPurchaseAddSkeleton (ref), fFlagAddFetchProductInfoAsACallback (ref), setIsUserEligibleForUnifiedPurchaseFlowModule (ref), setPromptStateModule (ref), promptStateModule (ref), fFlagRefreshPriceOnRetryAfterUpsellModule (ref), fFlagPurchasePromptOfferMarginUpsellEnabledModule (ref), fFlagEnableFetchCartPricingDuringInExperience (ref), fetchCartPricingModule (ref), fFlagAXFetchCartPricingDuringInExperienceExposure (ref), IXPServiceWrapper (ref), fStringAXFetchCartPricingDuringInExperienceLayerName (ref), promiseModule (ref), getFFlagEnableCreatorStorePurchasingCutoverModule (ref), getProductInfoModule (ref), deprecatedGetProductInfoModule (ref), fFlagRemoveAcountInfoFetchFromPurchaseModule (ref), playersService (ref), getAccountInfoModule (ref), getIsAlreadyOwnedModule (ref), getBalanceInfoModule (ref), getUnifiedPurchaseFlowEligibilityModule (ref), getRobloxSubscriptionProducts (ref), setProductPayloadModule (ref), buildProductPayloadFromInitiateArgsModule (ref), fFlagRefreshLookPriceOnRetryAfterUpsellModule (ref), refreshDevSubPriceOnRetryAfterUpsell2 (ref), var42 (ref), resolvePromptStateModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), fFlagFixPurchasingErrorCounterModule (ref)
	return thunkModule.new(script.Name, list, function(p12, p13) --[[ line: 107 ]]
		-- upvalues: networkModule (copy), externalSettingsModule (copy), hasPendingRequestModule (copy), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), p11 (ref), fFlagEnablePurchaseFlowUUIDMigrationModule (copy), httpService (copy), setPurchaseFlowUUIDModule (copy), loggingProtocolModule (copy), purchaseFlowUUIDTelemetryModule (copy), p1 (ref), requestAssetPurchaseModule (copy), p0 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref), p7 (ref), p8 (ref), p9 (ref), requestGamepassPurchaseModule (copy), requestProductPurchaseModule (copy), fFlagEnableUnifiedProductPurchaseFlow (copy), productTypeEnum (copy), requestExperiencePurchaseModule (copy), requestLookPurchaseModule (copy), fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), requestDeveloperSubscriptionPurchaseModule (copy), fFlagAXMISWithBlackbird (copy), requestRobuxUpsellPurchaseModule (copy), errorOccurredModule (copy), purchaseErrorModule (copy), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), fFlagAddPurchaseOptionForProvidingBalance (copy), fFlagUnifiedPurchaseAddSkeleton (copy), fFlagAddFetchProductInfoAsACallback (copy), p10 (ref), setIsUserEligibleForUnifiedPurchaseFlowModule (copy), setPromptStateModule (copy), promptStateModule (copy), fFlagRefreshPriceOnRetryAfterUpsellModule (copy), fFlagPurchasePromptOfferMarginUpsellEnabledModule (copy), fFlagEnableFetchCartPricingDuringInExperience (copy), fetchCartPricingModule (copy), fFlagAXFetchCartPricingDuringInExperienceExposure (copy), IXPServiceWrapper (copy), fStringAXFetchCartPricingDuringInExperienceLayerName (copy), promiseModule (copy), getFFlagEnableCreatorStorePurchasingCutoverModule (copy), getProductInfoModule (copy), deprecatedGetProductInfoModule (copy), fFlagRemoveAcountInfoFetchFromPurchaseModule (copy), playersService (copy), getAccountInfoModule (copy), getIsAlreadyOwnedModule (copy), getBalanceInfoModule (copy), getUnifiedPurchaseFlowEligibilityModule (copy), getRobloxSubscriptionProducts (copy), setProductPayloadModule (copy), buildProductPayloadFromInitiateArgsModule (copy), fFlagRefreshLookPriceOnRetryAfterUpsellModule (copy), refreshDevSubPriceOnRetryAfterUpsell2 (copy), var42 (copy), resolvePromptStateModule (copy), fFlagPurchasePromptCartPricingEnabledModule (copy), fFlagFixPurchasingErrorCounterModule (copy)
		local var45 = p13[networkModule]
		local var46 = p13[externalSettingsModule]
		
		if hasPendingRequestModule(p12:getState()) and (not fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal or not p11) then
			return nil
		elseif fFlagEnablePurchaseFlowUUIDMigrationModule then
			p12:dispatch(setPurchaseFlowUUIDModule(httpService:GenerateGUID(false)))
			loggingProtocolModule.default:logRobloxTelemetryCounter(purchaseFlowUUIDTelemetryModule.InitiatePurchaseCounter, 1, { method = "initiatePurchase" })
		end
		if p1 == Enum.InfoType.Asset then
			p12:dispatch(requestAssetPurchaseModule(p0, p2, p3, p4, p5, p6, p7, p8, p9))
		elseif p1 == Enum.InfoType.GamePass then
			p12:dispatch(requestGamepassPurchaseModule(p0))
		elseif p1 == Enum.InfoType.Product then
			p12:dispatch(requestProductPurchaseModule(p0, p2))
		elseif fFlagEnableUnifiedProductPurchaseFlow and p1 == productTypeEnum.Experience then
			p12:dispatch(requestExperiencePurchaseModule(p0))
		elseif fFlagEnableUnifiedProductPurchaseFlow and p1 == productTypeEnum.Look then
			p12:dispatch(requestLookPurchaseModule(p0))
		elseif fFlagEnableUnifiedPurchaseFlowForDevSubs and p1 == productTypeEnum.DeveloperSubscription then
			p12:dispatch(requestDeveloperSubscriptionPurchaseModule(p0, p9))
		elseif fFlagAXMISWithBlackbird and p1 == productTypeEnum.RobuxUpsell then
			p12:dispatch(requestRobuxUpsellPurchaseModule())
		else
			assert(false, "Invalid product type")
			
			return nil
		end
		if var46.getFlagOrder66() then
			p12:dispatch(errorOccurredModule(purchaseErrorModule.PurchaseDisabled))
			
			return nil
		end
		local var47 = nil
		local providedRobuxBalance = nil
		local var48 = nil
		
		if fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then
			local purchaseOptions = p12:getState().purchaseOptions
			
			if purchaseOptions ~= nil and purchaseOptions.shouldSkipOwnershipCheck == true then
				var47 = true
			end
			if fFlagAddPurchaseOptionForProvidingBalance and purchaseOptions ~= nil and purchaseOptions.providedRobuxBalance ~= nil then
				providedRobuxBalance = purchaseOptions.providedRobuxBalance
			end
			if fFlagUnifiedPurchaseAddSkeleton and purchaseOptions ~= nil and purchaseOptions.enablePreloadedPurchaseUI == true then
				var48 = true
			end
		end
		local fetchProductInfo = nil
		
		if fFlagAddFetchProductInfoAsACallback then
			local purchaseCallbacks = p12:getState().purchaseCallbacks
			
			if purchaseCallbacks ~= nil and purchaseCallbacks.fetchProductInfo ~= nil then
				fetchProductInfo = purchaseCallbacks.fetchProductInfo
			end
		end
		local var49 = if fFlagEnableUnifiedProductPurchaseFlow then p10 else nil
		
		if fFlagEnableUnifiedProductPurchaseFlow and fFlagUnifiedPurchaseAddSkeleton and var48 then
			p12:dispatch(setIsUserEligibleForUnifiedPurchaseFlowModule(true))
			p12:dispatch(setPromptStateModule(promptStateModule.InitializingPurchase))
		end
		local t = nil
		
		if fFlagRefreshPriceOnRetryAfterUpsellModule and p11 then
			local productPayload = p12:getState().productPayload
			t = {
				collectibleItemId = p6,
				collectibleItemInstanceId = p7,
				timedOptionDays = if productPayload then productPayload.timedOptionDays else nil
			}
		end
		local var51 = if fFlagPurchasePromptOfferMarginUpsellEnabledModule then if fFlagEnableFetchCartPricingDuringInExperience then if p12:getState().purchaseOptions.shouldFetchCartPricing then p12:dispatch(fetchCartPricingModule()) else nil else p12:dispatch(fetchCartPricingModule()) else nil
		
		if fFlagAXFetchCartPricingDuringInExperienceExposure and p1 == Enum.InfoType.Asset and (not p12:getState().purchaseOptions.shouldFetchCartPricing and not p11) then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(fStringAXFetchCartPricingDuringInExperienceLayerName)
		end
		return promiseModule.all({
			productInfo = if not getFFlagEnableCreatorStorePurchasingCutoverModule() then if fFlagAddFetchProductInfoAsACallback and fetchProductInfo ~= nil and (not fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal or not p11) then fetchProductInfo() else getProductInfoModule(var45, p0, p1, var49, if fFlagRefreshPriceOnRetryAfterUpsellModule then t else nil, if fFlagEnableFetchCartPricingDuringInExperience then if fFlagEnableFetchCartPricingDuringInExperience and p1 == Enum.InfoType.Asset and (not p12:getState().purchaseOptions.shouldFetchCartPricing and not p11) then function(p16) --[[ line: 247 ]]
				-- upvalues: p12 (ref), fetchCartPricingModule (copy)
				return p12:dispatch(fetchCartPricingModule(nil, p16))
			end else nil else nil) else deprecatedGetProductInfoModule(var45, p0, p1),
			accountInfo = if fFlagRemoveAcountInfoFetchFromPurchaseModule then promiseModule.resolve({
				isPremium = playersService.LocalPlayer.MembershipType == Enum.MembershipType.Premium
			}) else getAccountInfoModule(var45, var46),
			alreadyOwned = getIsAlreadyOwnedModule(var45, p0, p1, var47),
			balanceInfo = getBalanceInfoModule(var45, var46, false, true, providedRobuxBalance),
			isUserEligibleForUnifiedPurchaseFlow = if fFlagEnableUnifiedProductPurchaseFlow then getUnifiedPurchaseFlowEligibilityModule(var45, p1) else nil,
			robloxSubscriptionProducts = if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then getRobloxSubscriptionProducts():catch(function() --[[ line: 286 ]]
				return nil
			end) else nil,
			cartPricingResponse = if fFlagPurchasePromptOfferMarginUpsellEnabledModule then var51 else nil
		}):andThen(function(p15) --[[ line: 295 ]]
			-- upvalues: fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), productTypeEnum (copy), p12 (ref), setProductPayloadModule (copy), p0 (copy), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), buildProductPayloadFromInitiateArgsModule (copy), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p5 (copy), p6 (copy), p7 (copy), p8 (copy), p9 (copy), var49 (ref), fFlagRefreshPriceOnRetryAfterUpsellModule (copy), fFlagRefreshLookPriceOnRetryAfterUpsellModule (copy), p11 (copy), refreshDevSubPriceOnRetryAfterUpsell2 (copy), var42 (copy), resolvePromptStateModule (copy), fFlagPurchasePromptCartPricingEnabledModule (copy), fFlagPurchasePromptOfferMarginUpsellEnabledModule (copy), fetchCartPricingModule (copy)
			local productPayload
			if fFlagEnableUnifiedPurchaseFlowForDevSubs and p15.productInfo.ProductType == productTypeEnum.DeveloperSubscription and (p12:getState().productPayload == nil or p12:getState().productPayload.kind == nil) then
				p12:dispatch(setProductPayloadModule({
					subscriptionId = p0,
					kind = productTypeEnum.DeveloperSubscription,
					expectedPrice = p15.productInfo.PriceInRobux,
					iconImageAssetId = p15.productInfo.IconImageAssetId,
					isSubscriptionInRobux = p15.productInfo.PriceInRobux ~= nil and p15.productInfo.PriceInRobux > 0
				}))
			end
			if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then
				productPayload = p12:getState().productPayload
				
				if not productPayload or not productPayload.kind then
					local var52 = buildProductPayloadFromInitiateArgsModule(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, var49)
					
					if var52 then
						p12:dispatch(setProductPayloadModule(var52))
					end
				end
			end
			productPayload = p9
			
			if (fFlagRefreshPriceOnRetryAfterUpsellModule or fFlagRefreshLookPriceOnRetryAfterUpsellModule) and p11 then
				local var53 = if refreshDevSubPriceOnRetryAfterUpsell2 and fFlagEnableUnifiedPurchaseFlowForDevSubs and p15.productInfo.ProductType == productTypeEnum.DeveloperSubscription then p15.productInfo.PriceInRobux else p15.productInfo.refreshedExpectedPrice
				
				if var53 ~= nil then
					productPayload = var53
					var42(p12, var53)
				end
			end
			p12:dispatch(resolvePromptStateModule(p15.productInfo, p15.accountInfo, p15.balanceInfo, p15.alreadyOwned, p3, productPayload, p15.isUserEligibleForUnifiedPurchaseFlow, if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then p15.robloxSubscriptionProducts else nil))
			
			if fFlagPurchasePromptCartPricingEnabledModule and not fFlagPurchasePromptOfferMarginUpsellEnabledModule then
				p12:dispatch(fetchCartPricingModule())
			end
		end):catch(function(p14) --[[ line: 378 ]]
			-- upvalues: fFlagFixPurchasingErrorCounterModule (copy), purchaseErrorModule (copy), p12 (ref), errorOccurredModule (copy)
			if not fFlagFixPurchasingErrorCounterModule then
				p12:dispatch(errorOccurredModule(p14))
				
				return
			elseif purchaseErrorModule.isMember(p14) then
				p12:dispatch(errorOccurredModule(p14))
				
				return
			end
			p12:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
		end)
	end)
end