local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local playersService = game:GetService("Players")
local httpService = game:GetService("HttpService")
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local requestBundlePurchaseModule = require(purchasePrompt.Actions.RequestBundlePurchase)
local setProductPayloadModule = require(purchasePrompt.Actions.SetProductPayload)
local buildProductPayloadFromInitiateArgsModule = require(purchasePrompt.Utils.buildProductPayloadFromInitiateArgs)
local setPurchaseFlowUUIDModule = require(purchasePrompt.Actions.SetPurchaseFlowUUID)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local getBundleDetailsModule = require(purchasePrompt.Network.getBundleDetails)
local getProductPurchasableDetailsModule = require(purchasePrompt.Network.getProductPurchasableDetails)
local getAccountInfoModule = require(purchasePrompt.Network.getAccountInfo)
local getBalanceInfoModule = require(purchasePrompt.Network.getBalanceInfo)
local getIsAlreadyOwnedModule = require(purchasePrompt.Network.getIsAlreadyOwned)
local networkModule = require(purchasePrompt.Services.Network)
local externalSettingsModule = require(purchasePrompt.Services.ExternalSettings)
local hasPendingRequestModule = require(purchasePrompt.Utils.hasPendingRequest)
local promiseModule = require(purchasePrompt.Promise)
local thunkModule = require(purchasePrompt.Thunk)
local IXPServiceWrapper = require(parent.IxpServiceWrapper).IXPServiceWrapper
local _ = require(parent.AppCommonLib).Logging
local loggingProtocolModule = require(parent.LoggingProtocol)
local fFlagEnableUnifiedProductPurchaseFlow = require(purchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local fFlagEnableFetchCartPricingDuringInExperience = require(purchasePrompt.Parent.SharedFlags).FFlagEnableFetchCartPricingDuringInExperience
local fFlagAXFetchCartPricingDuringInExperienceExposure = require(purchasePrompt.Parent.SharedFlags).FFlagAXFetchCartPricingDuringInExperienceExposure
local fStringAXFetchCartPricingDuringInExperienceLayerName = require(purchasePrompt.Parent.SharedFlags).FStringAXFetchCartPricingDuringInExperienceLayerName
local getUnifiedPurchaseFlowEligibilityModule = require(purchasePrompt.Network.getUnifiedPurchaseFlowEligibility)
local fFlagRemoveAcountInfoFetchFromPurchaseModule = require(purchasePrompt.Flags.FFlagRemoveAcountInfoFetchFromPurchase)
local resolveBundlePromptStateModule = require(script.Parent.resolveBundlePromptState)
local fetchCartPricingModule = require(script.Parent.fetchCartPricing)
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local fFlagPurchasePromptOfferMarginUpsellEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptOfferMarginUpsellEnabled)

local function _(p0) --[[ line: 44 | named "maybeDispatchCartPricingFetch" ]]
	-- upvalues: fFlagPurchasePromptCartPricingEnabledModule (ref), fFlagPurchasePromptOfferMarginUpsellEnabledModule (ref), fetchCartPricingModule (ref)
	if fFlagPurchasePromptCartPricingEnabledModule and not fFlagPurchasePromptOfferMarginUpsellEnabledModule then
		p0:dispatch(fetchCartPricingModule())
	end
end

local fFlagEnablePurchaseFlowUUIDMigrationModule = require(purchasePrompt.Flags.FFlagEnablePurchaseFlowUUIDMigration)
local fFlagUnifiedPurchaseOptimizeTTIMarketplace = require(purchasePrompt.Parent.SharedFlags).FFlagUnifiedPurchaseOptimizeTTIMarketplace
local fFlagRefreshPriceOnRetryAfterUpsellModule = require(purchasePrompt.Flags.FFlagRefreshPriceOnRetryAfterUpsell)
local var28 = if fFlagRefreshPriceOnRetryAfterUpsellModule then require(purchasePrompt.Utils.applyRefreshedPrice) else nil
local getRobloxSubscriptionProducts = require(parent.RobloxSubscriptionPurchaseApp).Network.getRobloxSubscriptionProducts
local fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal = require(purchasePrompt.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal
local purchaseFlowUUIDTelemetryModule = require(purchasePrompt.Events.PurchaseFlowUUIDTelemetry)
local list = { networkModule, externalSettingsModule }

return function(p1, p2, p3, p4, p5, p6, p7, p8) --[[ line: 71 | named "initiateBundlePurchase" ]]
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), externalSettingsModule (ref), hasPendingRequestModule (ref), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (ref), buildProductPayloadFromInitiateArgsModule (ref), setProductPayloadModule (ref), fFlagEnablePurchaseFlowUUIDMigrationModule (ref), httpService (ref), setPurchaseFlowUUIDModule (ref), loggingProtocolModule (ref), purchaseFlowUUIDTelemetryModule (ref), requestBundlePurchaseModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref), fFlagUnifiedPurchaseOptimizeTTIMarketplace (ref), fFlagRefreshPriceOnRetryAfterUpsellModule (ref), fFlagPurchasePromptOfferMarginUpsellEnabledModule (ref), fFlagEnableFetchCartPricingDuringInExperience (ref), fetchCartPricingModule (ref), fFlagAXFetchCartPricingDuringInExperienceExposure (ref), IXPServiceWrapper (ref), fStringAXFetchCartPricingDuringInExperienceLayerName (ref), promiseModule (ref), getBundleDetailsModule (ref), fFlagRemoveAcountInfoFetchFromPurchaseModule (ref), playersService (ref), getAccountInfoModule (ref), getBalanceInfoModule (ref), getIsAlreadyOwnedModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), getUnifiedPurchaseFlowEligibilityModule (ref), getRobloxSubscriptionProducts (ref), var28 (ref), resolveBundlePromptStateModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), getProductPurchasableDetailsModule (ref)
	return thunkModule.new(script.Name, list, function(p9, p10) --[[ line: 81 ]]
		-- upvalues: networkModule (copy), externalSettingsModule (copy), hasPendingRequestModule (copy), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), p8 (ref), buildProductPayloadFromInitiateArgsModule (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref), p7 (ref), setProductPayloadModule (copy), fFlagEnablePurchaseFlowUUIDMigrationModule (copy), httpService (copy), setPurchaseFlowUUIDModule (copy), loggingProtocolModule (copy), purchaseFlowUUIDTelemetryModule (copy), requestBundlePurchaseModule (copy), errorOccurredModule (copy), purchaseErrorModule (copy), fFlagUnifiedPurchaseOptimizeTTIMarketplace (copy), fFlagRefreshPriceOnRetryAfterUpsellModule (copy), fFlagPurchasePromptOfferMarginUpsellEnabledModule (copy), fFlagEnableFetchCartPricingDuringInExperience (copy), fetchCartPricingModule (copy), fFlagAXFetchCartPricingDuringInExperienceExposure (copy), IXPServiceWrapper (copy), fStringAXFetchCartPricingDuringInExperienceLayerName (copy), promiseModule (copy), getBundleDetailsModule (copy), fFlagRemoveAcountInfoFetchFromPurchaseModule (copy), playersService (copy), getAccountInfoModule (copy), getBalanceInfoModule (copy), getIsAlreadyOwnedModule (copy), fFlagEnableUnifiedProductPurchaseFlow (copy), getUnifiedPurchaseFlowEligibilityModule (copy), getRobloxSubscriptionProducts (copy), var28 (copy), resolveBundlePromptStateModule (copy), fFlagPurchasePromptCartPricingEnabledModule (copy), getProductPurchasableDetailsModule (copy)
		local productPayload
		local var31 = p10[networkModule]
		local var32 = p10[externalSettingsModule]
		
		if hasPendingRequestModule(p9:getState()) and (not fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal or not p8) then
			return nil
		elseif fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then
			productPayload = p9:getState().productPayload
			
			if not productPayload or not productPayload.kind then
				local var33 = buildProductPayloadFromInitiateArgsModule(p1, Enum.InfoType.Bundle, nil, nil, p2, p3, p4, p5, p6, p7, nil)
				
				if var33 then
					p9:dispatch(setProductPayloadModule(var33))
				end
			end
		end
		if fFlagEnablePurchaseFlowUUIDMigrationModule then
			p9:dispatch(setPurchaseFlowUUIDModule(httpService:GenerateGUID(false)))
			loggingProtocolModule.default:logRobloxTelemetryCounter(purchaseFlowUUIDTelemetryModule.InitiatePurchaseCounter, 1, { method = "initiateBundlePurchase" })
		end
		p9:dispatch(requestBundlePurchaseModule(p1, p2, p3, p4, p5, p6, p7))
		
		if var32.getFlagOrder66() then
			p9:dispatch(errorOccurredModule(purchaseErrorModule.PurchaseDisabled))
			
			return nil
		end
		productPayload = nil
		local providedRobuxBalance = nil
		local fetchProductInfo = nil
		
		if fFlagUnifiedPurchaseOptimizeTTIMarketplace then
			local state = p9:getState()
			local purchaseOptions = state.purchaseOptions
			local purchaseCallbacks = state.purchaseCallbacks
			
			if purchaseOptions ~= nil and purchaseOptions.shouldSkipOwnershipCheck == true then
				productPayload = true
			end
			if purchaseOptions ~= nil and purchaseOptions.providedRobuxBalance ~= nil then
				providedRobuxBalance = purchaseOptions.providedRobuxBalance
			end
			if purchaseCallbacks ~= nil and purchaseCallbacks.fetchProductInfo ~= nil then
				fetchProductInfo = purchaseCallbacks.fetchProductInfo
			end
		end
		local t = nil
		
		if fFlagRefreshPriceOnRetryAfterUpsellModule and p8 then
			local productPayload_1 = p9:getState().productPayload
			t = {
				collectibleItemId = p4,
				collectibleItemInstanceId = p5,
				timedOptionDays = if productPayload_1 then productPayload_1.timedOptionDays else nil
			}
		end
		local var36 = if fFlagPurchasePromptOfferMarginUpsellEnabledModule then if fFlagEnableFetchCartPricingDuringInExperience then if p9:getState().purchaseOptions.shouldFetchCartPricing then p9:dispatch(fetchCartPricingModule()) else nil else p9:dispatch(fetchCartPricingModule()) else nil
		
		if fFlagAXFetchCartPricingDuringInExperienceExposure and not p9:getState().purchaseOptions.shouldFetchCartPricing and not p8 then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(fStringAXFetchCartPricingDuringInExperienceLayerName)
		end
		return promiseModule.all({
			bundleDetails = if fFlagUnifiedPurchaseOptimizeTTIMarketplace and fetchProductInfo ~= nil and (not fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal or not p8) then fetchProductInfo() else getBundleDetailsModule(var31, p1, if fFlagRefreshPriceOnRetryAfterUpsellModule then t else nil, if fFlagEnableFetchCartPricingDuringInExperience then if fFlagEnableFetchCartPricingDuringInExperience and not p9:getState().purchaseOptions.shouldFetchCartPricing and not p8 then function(p14) --[[ line: 199 ]]
				-- upvalues: p9 (ref), fetchCartPricingModule (copy)
				return p9:dispatch(fetchCartPricingModule(nil, p14))
			end else nil else nil),
			accountInfo = if fFlagRemoveAcountInfoFetchFromPurchaseModule then promiseModule.resolve({
				isPremium = playersService.LocalPlayer.MembershipType == Enum.MembershipType.Premium
			}) else getAccountInfoModule(var31, var32),
			balanceInfo = getBalanceInfoModule(var31, var32, false, nil, if fFlagUnifiedPurchaseOptimizeTTIMarketplace then providedRobuxBalance else nil),
			alreadyOwned = getIsAlreadyOwnedModule(var31, p1, Enum.InfoType.Bundle, if fFlagUnifiedPurchaseOptimizeTTIMarketplace then productPayload else nil),
			isUserEligibleForUnifiedPurchaseFlow = if fFlagEnableUnifiedProductPurchaseFlow then getUnifiedPurchaseFlowEligibilityModule(var31) else nil,
			robloxSubscriptionProducts = if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then getRobloxSubscriptionProducts(var31):catch(function() --[[ line: 237 ]]
				return nil
			end) else nil,
			cartPricingResponse = if fFlagPurchasePromptOfferMarginUpsellEnabledModule then var36 else nil
		}):andThen(function(p12) --[[ line: 246 ]]
			-- upvalues: p7 (copy), fFlagRefreshPriceOnRetryAfterUpsellModule (copy), p8 (copy), var28 (copy), p9 (ref), fFlagUnifiedPurchaseOptimizeTTIMarketplace (copy), resolveBundlePromptStateModule (copy), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), fFlagPurchasePromptCartPricingEnabledModule (copy), fFlagPurchasePromptOfferMarginUpsellEnabledModule (copy), fetchCartPricingModule (copy), getProductPurchasableDetailsModule (copy), var31 (ref), errorOccurredModule (copy), purchaseErrorModule (copy)
			local var37 = p7
			
			if fFlagRefreshPriceOnRetryAfterUpsellModule and p8 then
				local refreshedExpectedPrice = p12.bundleDetails.refreshedExpectedPrice
				
				if refreshedExpectedPrice ~= nil then
					var37 = refreshedExpectedPrice
					var28(p9, refreshedExpectedPrice)
				end
			end
			if p12.bundleDetails.product then
				if fFlagUnifiedPurchaseOptimizeTTIMarketplace then
					p9:dispatch(resolveBundlePromptStateModule(nil, p12.bundleDetails, p12.accountInfo, p12.balanceInfo, var37, p12.alreadyOwned, p12.isUserEligibleForUnifiedPurchaseFlow, if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then p12.robloxSubscriptionProducts else nil))
					local var38 = p9
					
					if fFlagPurchasePromptCartPricingEnabledModule and not fFlagPurchasePromptOfferMarginUpsellEnabledModule then
						var38:dispatch(fetchCartPricingModule())
					end
					return
				else
					getProductPurchasableDetailsModule(var31, p12.bundleDetails.product.id):andThen(function(p13) --[[ line: 277 ]]
						-- upvalues: p9 (copy), resolveBundlePromptStateModule (copy), p12 (ref), var37 (write), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), fFlagPurchasePromptCartPricingEnabledModule (copy), fFlagPurchasePromptOfferMarginUpsellEnabledModule (copy), fetchCartPricingModule (copy)
						p9:dispatch(resolveBundlePromptStateModule(p13, p12.bundleDetails, p12.accountInfo, p12.balanceInfo, var37, p12.alreadyOwned, p12.isUserEligibleForUnifiedPurchaseFlow, if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then p12.robloxSubscriptionProducts else nil))
						
						if fFlagPurchasePromptCartPricingEnabledModule and not fFlagPurchasePromptOfferMarginUpsellEnabledModule then
							p9:dispatch(fetchCartPricingModule())
						end
					end)
				end
			else
				p9:dispatch(errorOccurredModule(purchaseErrorModule.NotForSale))
			end
		end):catch(function(p11) --[[ line: 299 ]]
			-- upvalues: p9 (ref), errorOccurredModule (copy)
			p9:dispatch(errorOccurredModule(p11))
		end)
	end)
end