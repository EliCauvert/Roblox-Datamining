local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local userInputService = game:GetService("UserInputService")
local setPurchaseFlowModule = require(purchasePrompt.Actions.SetPurchaseFlow)
local setPromptStateModule = require(purchasePrompt.Actions.SetPromptState)
local productInfoReceivedModule = require(purchasePrompt.Actions.ProductInfoReceived)
local accountInfoReceivedModule = require(purchasePrompt.Actions.AccountInfoReceived)
local balanceInfoRecievedModule = require(purchasePrompt.Actions.BalanceInfoRecieved)
local promptNativeUpsellSuggestionsModule = require(purchasePrompt.Actions.PromptNativeUpsellSuggestions)
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local completeRequestModule = require(purchasePrompt.Actions.CompleteRequest)
local purchaseFlowModule = require(purchasePrompt.Enums.PurchaseFlow)
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local paymentPlatformModule = require(purchasePrompt.Enums.PaymentPlatform)
local requestTypeModule = require(purchasePrompt.Enums.RequestType)
local _ = require(purchasePrompt.Models.RobuxUpsell)
local getRobuxUpsellSuggestionsModule = require(purchasePrompt.Network.getRobuxUpsellSuggestions)
local ABTestModule = require(purchasePrompt.Services.ABTest)
local analyticsModule = require(purchasePrompt.Services.Analytics)
local externalSettingsModule = require(purchasePrompt.Services.ExternalSettings)
local networkModule = require(purchasePrompt.Services.Network)
local counterModule = require(purchasePrompt.Enums.Counter)
local sendCounterModule = require(purchasePrompt.Thunks.sendCounter)
local completeRequestModule_1 = require(purchasePrompt.Thunks.completeRequest)
local meetsPrerequisitesModule = require(purchasePrompt.Utils.meetsPrerequisites)
local getPlayerProductInfoPriceModule = require(purchasePrompt.Utils.getPlayerProductInfoPrice)
local getPaymentPlatformModule = require(purchasePrompt.Utils.getPaymentPlatform)
local _ = require(purchasePrompt.Utils.getPaymentFromPlatformLegacy)
local _ = require(purchasePrompt.Utils.getHasAmazonUserAgent)
local hasPendingRequestModule = require(purchasePrompt.Utils.hasPendingRequest)
local setPurchaseAnalyticsMetadataModule = require(purchasePrompt.Actions.SetPurchaseAnalyticsMetadata)
local getPurchaseSurfaceModule = require(purchasePrompt.Utils.getPurchaseSurface)
local thunkModule = require(purchasePrompt.Thunk)
local getProductTypeFromRequestTypeModule = require(purchasePrompt.Utils.getProductTypeFromRequestType)
local _ = require(purchasePrompt.Flags.GetFFlagEnableLuobuInGameUpsell)
local getFStringLargerRobuxUpsellIxpLayer = require(parent.SharedFlags).GetFStringLargerRobuxUpsellIxpLayer
local largerRobuxUpsellTestModule = require(purchasePrompt.Flags.LargerRobuxUpsellTest)
local fFlagEnableUnifiedProductPurchaseFlow = require(purchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local setIsUserEligibleForUnifiedPurchaseFlowModule = require(purchasePrompt.Actions.SetIsUserEligibleForUnifiedPurchaseFlow)
local setPostPurchaseActionsModule = require(purchasePrompt.Actions.SetPostPurchaseActions)
local fFlagUnifiedPurchaseGamepassAddProductUniverseId = require(parent.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId
local fFlagUpdatePriceTelemetry = require(parent.SharedFlags).FFlagUpdatePriceTelemetry
local selectPriceModule = require(purchasePrompt.Selectors.selectPrice)
local _ = require(parent.RobloxSubscriptionPurchaseApp)
local setRobloxSubscriptionProductsModule = require(purchasePrompt.Actions.SetRobloxSubscriptionProducts)
local fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal = require(purchasePrompt.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal
local fFlagAXFixRobuxUpsellSoftLockModule = require(purchasePrompt.Flags.FFlagAXFixRobuxUpsellSoftLock)
local fFlagPurchasePromptOfferMarginUpsellEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptOfferMarginUpsellEnabled)
local selectCartPricingOverrideModule = require(purchasePrompt.Selectors.selectCartPricingOverride)
local list = {
	ABTestModule,
	analyticsModule,
	externalSettingsModule,
	networkModule
}
local fFlagEnableUpsellSuggestionsAnalyticsId = require(parent.SharedFlags).FFlagEnableUpsellSuggestionsAnalyticsId

local function handleSuccessfulUpsellSuggestions(p0, p1) --[[ line: 73 ]]
	-- upvalues: hasPendingRequestModule (ref), promptNativeUpsellSuggestionsModule (ref), sendCounterModule (ref), counterModule (ref)
	if hasPendingRequestModule(p0:getState()) then
		p0:dispatch(promptNativeUpsellSuggestionsModule(p1.products, 1, p1.virtualItemBadgeType))
		p0:dispatch(sendCounterModule(counterModule.UpsellModalShown))
		
		return
	end
end

local function handleFailedUpsellProduct(p2, _) --[[ line: 83 ]]
	-- upvalues: hasPendingRequestModule (ref), purchaseFlowModule (ref), setPromptStateModule (ref), promptStateModule (ref), sendCounterModule (ref), counterModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref)
	if not hasPendingRequestModule(p2:getState()) then return end
	if p2:getState().purchaseFlow == purchaseFlowModule.LargeRobuxUpsell then
		p2:dispatch(setPromptStateModule(promptStateModule.LargeRobuxUpsell))
		p2:dispatch(sendCounterModule(counterModule.UpsellModalShown))
		
		return
	end
	p2:dispatch(errorOccurredModule(purchaseErrorModule.NotEnoughRobuxXbox))
	p2:dispatch(sendCounterModule(counterModule.UpsellGenericModalShown))
end

return function(p3, p4, p5, p6, p7, p8, p9, p10) --[[ line: 99 | named "resolvePromptState" ]]
	-- upvalues: thunkModule (ref), list (ref), ABTestModule (ref), analyticsModule (ref), externalSettingsModule (ref), networkModule (ref), productInfoReceivedModule (ref), accountInfoReceivedModule (ref), balanceInfoRecievedModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), setIsUserEligibleForUnifiedPurchaseFlowModule (ref), setPurchaseAnalyticsMetadataModule (ref), getPurchaseSurfaceModule (ref), getProductTypeFromRequestTypeModule (ref), fFlagUpdatePriceTelemetry (ref), selectPriceModule (ref), fFlagUnifiedPurchaseGamepassAddProductUniverseId (ref), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (ref), setRobloxSubscriptionProductsModule (ref), meetsPrerequisitesModule (ref), purchaseErrorModule (ref), completeRequestModule (ref), errorOccurredModule (ref), getPlayerProductInfoPriceModule (ref), userInputService (ref), fFlagPurchasePromptOfferMarginUpsellEnabledModule (ref), selectCartPricingOverrideModule (ref), getPaymentPlatformModule (ref), paymentPlatformModule (ref), setPurchaseFlowModule (ref), purchaseFlowModule (ref), setPostPurchaseActionsModule (ref), largerRobuxUpsellTestModule (ref), getFStringLargerRobuxUpsellIxpLayer (ref), fFlagEnableUpsellSuggestionsAnalyticsId (ref), getRobuxUpsellSuggestionsModule (ref), handleSuccessfulUpsellSuggestions (ref), handleFailedUpsellProduct (ref), fFlagAXFixRobuxUpsellSoftLockModule (ref), requestTypeModule (ref), completeRequestModule_1 (ref), setPromptStateModule (ref), promptStateModule (ref)
	return thunkModule.new(script.Name, list, function(p11, p12) --[[ line: 109 ]]
		-- upvalues: ABTestModule (copy), analyticsModule (copy), externalSettingsModule (copy), networkModule (copy), productInfoReceivedModule (copy), p3 (ref), accountInfoReceivedModule (copy), p4 (ref), balanceInfoRecievedModule (copy), p5 (ref), fFlagEnableUnifiedProductPurchaseFlow (copy), p9 (ref), setIsUserEligibleForUnifiedPurchaseFlowModule (copy), setPurchaseAnalyticsMetadataModule (copy), getPurchaseSurfaceModule (copy), getProductTypeFromRequestTypeModule (copy), fFlagUpdatePriceTelemetry (copy), selectPriceModule (copy), p8 (ref), fFlagUnifiedPurchaseGamepassAddProductUniverseId (copy), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), p10 (ref), setRobloxSubscriptionProductsModule (copy), p7 (ref), meetsPrerequisitesModule (copy), p6 (ref), purchaseErrorModule (copy), completeRequestModule (copy), errorOccurredModule (copy), getPlayerProductInfoPriceModule (copy), userInputService (copy), fFlagPurchasePromptOfferMarginUpsellEnabledModule (copy), selectCartPricingOverrideModule (copy), getPaymentPlatformModule (copy), paymentPlatformModule (copy), setPurchaseFlowModule (copy), purchaseFlowModule (copy), setPostPurchaseActionsModule (copy), largerRobuxUpsellTestModule (copy), getFStringLargerRobuxUpsellIxpLayer (copy), fFlagEnableUpsellSuggestionsAnalyticsId (copy), getRobuxUpsellSuggestionsModule (copy), handleSuccessfulUpsellSuggestions (copy), handleFailedUpsellProduct (copy), fFlagAXFixRobuxUpsellSoftLockModule (copy), requestTypeModule (copy), completeRequestModule_1 (copy), setPromptStateModule (copy), promptStateModule (copy)
		local state = p11:getState()
		local var43 = p12[ABTestModule]
		local var44 = p12[analyticsModule]
		local var45 = p12[externalSettingsModule]
		local _ = p12[networkModule]
		p11:dispatch(productInfoReceivedModule(p3))
		p11:dispatch(accountInfoReceivedModule(p4))
		p11:dispatch(balanceInfoRecievedModule(p5))
		
		if fFlagEnableUnifiedProductPurchaseFlow then
			if p9 then
				p11:dispatch(setIsUserEligibleForUnifiedPurchaseFlowModule(true))
				local state_1 = p11:getState()
				p11:dispatch(setPurchaseAnalyticsMetadataModule({
					purchaseFlowUUID = state_1.purchaseFlowUUID,
					surface = getPurchaseSurfaceModule(state_1.purchaseAnalyticsMetadata),
					productType = getProductTypeFromRequestTypeModule(state_1.promptRequest.requestType),
					productId = state_1.productInfo.productId,
					productTargetId = state_1.productInfo.productTargetId,
					saleLocationUniverseId = game.GameId or 0,
					price = if fFlagUpdatePriceTelemetry then selectPriceModule(state_1).priceInRobux elseif state_1.productInfo.price then state_1.productInfo.price else p8,
					productUniverseId = if fFlagUnifiedPurchaseGamepassAddProductUniverseId then state_1.purchaseAnalyticsMetadata.productUniverseId else nil,
					userRobuxBalance = state_1.accountInfo.balance
				}))
				
				if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal and p10 then
					p11:dispatch(setRobloxSubscriptionProductsModule(p10))
				end
			else
				p11:dispatch(setIsUserEligibleForUnifiedPurchaseFlowModule(false))
			end
		end
		local var47, var48 = meetsPrerequisitesModule(p3, p6, var45.getFlagBypassThirdPartySettingForRobloxPurchase() and (not p7 and (var45.getLuaUseThirdPartyPermissions() or var45.getFlagRestrictSales2())), var45, p8)
		
		if var47 then
			local var51
			local robux = p5.robux
			local hasFailed = p5.hasFailed
			local var49 = if p8 ~= nil then p8 else getPlayerProductInfoPriceModule(p3, p4.isPremium)
			local platform = userInputService:GetPlatform()
			local _ = nil
			
			if fFlagPurchasePromptOfferMarginUpsellEnabledModule then
				local var52 = selectCartPricingOverrideModule(p11:getState())
				var51 = if var52 ~= nil then var49 else var52.priceInRobux
			else
				var51 = var49
			end
			if hasFailed or robux >= var51 then
				if fFlagAXFixRobuxUpsellSoftLockModule and var49 <= robux and state.promptRequest.requestType == requestTypeModule.RobuxUpsell then
					return p11:dispatch(completeRequestModule_1())
				elseif state.requestType ~= requestTypeModule.AvatarCreationFee then
					var44.signalProductPurchaseShown(p3.productId, state.requestType)
				end
				return p11:dispatch(setPromptStateModule(promptStateModule.PromptPurchase))
			elseif var45.getFFlagDisableRobuxUpsell() then
				return p11:dispatch(errorOccurredModule(purchaseErrorModule.NotEnoughRobuxNoUpsell))
			end
			local var53 = getPaymentPlatformModule(platform)
			
			if fFlagEnableUnifiedProductPurchaseFlow and p9 or var53 ~= paymentPlatformModule.Web then
				p11:dispatch(setPurchaseFlowModule(purchaseFlowModule.RobuxUpsellV2))
			end
			if fFlagEnableUnifiedProductPurchaseFlow and p9 then
				p11:dispatch(setPostPurchaseActionsModule({}))
			end
			local _ = false
			
			if largerRobuxUpsellTestModule.isEnabled() then
				local var54 = getFStringLargerRobuxUpsellIxpLayer()
				local layerData = var43.getLayerData(var54)
				
				if layerData then
					var43.logUserLayerExposure(var54)
					
					if largerRobuxUpsellTestModule.isUserEnrolled(layerData) then
						p11:dispatch(setPurchaseFlowModule(purchaseFlowModule.LargeRobuxUpsell))
					end
				end
			end
			return getRobuxUpsellSuggestionsModule(var49, robux, var53, p3.ProductId, p3.DisplayName, game.GameId, if fFlagEnableUpsellSuggestionsAnalyticsId then state.purchaseFlowUUID else nil):andThen(function(p13) --[[ line: 242 ]]
				-- upvalues: handleSuccessfulUpsellSuggestions (copy), p11 (ref)
				return handleSuccessfulUpsellSuggestions(p11, p13)
			end, function() --[[ line: 246 ]]
				-- upvalues: handleFailedUpsellProduct (copy), p11 (ref), state (ref)
				return handleFailedUpsellProduct(p11, state)
			end)
		else
			return if var45.isStudio() or var48 ~= purchaseErrorModule.ThirdPartyDisabled then p11:dispatch(errorOccurredModule(var48)) else p11:dispatch(completeRequestModule())
		end
	end)
end