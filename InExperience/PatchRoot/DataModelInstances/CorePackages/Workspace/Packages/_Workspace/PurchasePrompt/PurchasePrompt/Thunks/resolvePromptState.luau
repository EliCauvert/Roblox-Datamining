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
local setIsUserEligibleForUnifiedPurchaseFlowModule = require(purchasePrompt.Actions.SetIsUserEligibleForUnifiedPurchaseFlow)
local setPostPurchaseActionsModule = require(purchasePrompt.Actions.SetPostPurchaseActions)
local fFlagUnifiedPurchaseGamepassAddProductUniverseId = require(parent.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId
local fFlagUpdatePriceTelemetry = require(parent.SharedFlags).FFlagUpdatePriceTelemetry
local selectPriceModule = require(purchasePrompt.Selectors.selectPrice)
local _ = require(parent.RobloxSubscriptionPurchaseApp)
local setRobloxSubscriptionProductsModule = require(purchasePrompt.Actions.SetRobloxSubscriptionProducts)
local fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal = require(purchasePrompt.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal
local fFlagPurchasePromptOfferMarginUpsellEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptOfferMarginUpsellEnabled)
local selectCartPricingOverrideModule = require(purchasePrompt.Selectors.selectCartPricingOverride)
local list = {
	ABTestModule,
	analyticsModule,
	externalSettingsModule,
	networkModule
}
local fFlagEnableUpsellSuggestionsAnalyticsId = require(parent.SharedFlags).FFlagEnableUpsellSuggestionsAnalyticsId

local function handleSuccessfulUpsellSuggestions(p1, p2)
	-- upvalues: hasPendingRequestModule (ref), promptNativeUpsellSuggestionsModule (ref), sendCounterModule (ref), counterModule (ref)
	if hasPendingRequestModule(p1:getState()) then
		p1:dispatch(promptNativeUpsellSuggestionsModule(p2.products, 1, p2.virtualItemBadgeType))
		p1:dispatch(sendCounterModule(counterModule.UpsellModalShown))
		
		return
	end
end

local function handleFailedUpsellProduct(p1, _)
	-- upvalues: hasPendingRequestModule (ref), purchaseFlowModule (ref), setPromptStateModule (ref), promptStateModule (ref), sendCounterModule (ref), counterModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref)
	if not hasPendingRequestModule(p1:getState()) then return end
	if p1:getState().purchaseFlow == purchaseFlowModule.LargeRobuxUpsell then
		p1:dispatch(setPromptStateModule(promptStateModule.LargeRobuxUpsell))
		p1:dispatch(sendCounterModule(counterModule.UpsellModalShown))
		
		return
	end
	p1:dispatch(errorOccurredModule(purchaseErrorModule.NotEnoughRobuxXbox))
	p1:dispatch(sendCounterModule(counterModule.UpsellGenericModalShown))
end

return function(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: thunkModule (ref), list (ref), ABTestModule (ref), analyticsModule (ref), externalSettingsModule (ref), networkModule (ref), productInfoReceivedModule (ref), accountInfoReceivedModule (ref), balanceInfoRecievedModule (ref), setIsUserEligibleForUnifiedPurchaseFlowModule (ref), setPurchaseAnalyticsMetadataModule (ref), getPurchaseSurfaceModule (ref), getProductTypeFromRequestTypeModule (ref), fFlagUpdatePriceTelemetry (ref), selectPriceModule (ref), fFlagUnifiedPurchaseGamepassAddProductUniverseId (ref), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (ref), setRobloxSubscriptionProductsModule (ref), meetsPrerequisitesModule (ref), purchaseErrorModule (ref), completeRequestModule (ref), errorOccurredModule (ref), getPlayerProductInfoPriceModule (ref), userInputService (ref), fFlagPurchasePromptOfferMarginUpsellEnabledModule (ref), selectCartPricingOverrideModule (ref), getPaymentPlatformModule (ref), paymentPlatformModule (ref), setPurchaseFlowModule (ref), purchaseFlowModule (ref), setPostPurchaseActionsModule (ref), largerRobuxUpsellTestModule (ref), getFStringLargerRobuxUpsellIxpLayer (ref), fFlagEnableUpsellSuggestionsAnalyticsId (ref), getRobuxUpsellSuggestionsModule (ref), handleSuccessfulUpsellSuggestions (ref), handleFailedUpsellProduct (ref), requestTypeModule (ref), completeRequestModule_1 (ref), setPromptStateModule (ref), promptStateModule (ref)
	return thunkModule.new(script.Name, list, function(p9, p10)
		-- upvalues: ABTestModule (copy), analyticsModule (copy), externalSettingsModule (copy), networkModule (copy), productInfoReceivedModule (copy), p1 (ref), accountInfoReceivedModule (copy), p2 (ref), balanceInfoRecievedModule (copy), p3 (ref), p7 (ref), setIsUserEligibleForUnifiedPurchaseFlowModule (copy), setPurchaseAnalyticsMetadataModule (copy), getPurchaseSurfaceModule (copy), getProductTypeFromRequestTypeModule (copy), fFlagUpdatePriceTelemetry (copy), selectPriceModule (copy), p6 (ref), fFlagUnifiedPurchaseGamepassAddProductUniverseId (copy), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), p8 (ref), setRobloxSubscriptionProductsModule (copy), p5 (ref), meetsPrerequisitesModule (copy), p4 (ref), purchaseErrorModule (copy), completeRequestModule (copy), errorOccurredModule (copy), getPlayerProductInfoPriceModule (copy), userInputService (copy), fFlagPurchasePromptOfferMarginUpsellEnabledModule (copy), selectCartPricingOverrideModule (copy), getPaymentPlatformModule (copy), paymentPlatformModule (copy), setPurchaseFlowModule (copy), purchaseFlowModule (copy), setPostPurchaseActionsModule (copy), largerRobuxUpsellTestModule (copy), getFStringLargerRobuxUpsellIxpLayer (copy), fFlagEnableUpsellSuggestionsAnalyticsId (copy), getRobuxUpsellSuggestionsModule (copy), handleSuccessfulUpsellSuggestions (copy), handleFailedUpsellProduct (copy), requestTypeModule (copy), completeRequestModule_1 (copy), setPromptStateModule (copy), promptStateModule (copy)
		local state = p9:getState()
		local var1 = p10[ABTestModule]
		local var2 = p10[analyticsModule]
		local var3 = p10[externalSettingsModule]
		local _ = p10[networkModule]
		p9:dispatch(productInfoReceivedModule(p1))
		p9:dispatch(accountInfoReceivedModule(p2))
		p9:dispatch(balanceInfoRecievedModule(p3))
		
		if p7 then
			p9:dispatch(setIsUserEligibleForUnifiedPurchaseFlowModule(true))
			local state_1 = p9:getState()
			p9:dispatch(setPurchaseAnalyticsMetadataModule({
				purchaseFlowUUID = state_1.purchaseFlowUUID,
				surface = getPurchaseSurfaceModule(state_1.purchaseAnalyticsMetadata),
				productType = getProductTypeFromRequestTypeModule(state_1.promptRequest.requestType),
				productId = state_1.productInfo.productId,
				productTargetId = state_1.productInfo.productTargetId,
				saleLocationUniverseId = game.GameId or 0,
				price = if fFlagUpdatePriceTelemetry then selectPriceModule(state_1).priceInRobux elseif state_1.productInfo.price then state_1.productInfo.price else p6,
				productUniverseId = if fFlagUnifiedPurchaseGamepassAddProductUniverseId then state_1.purchaseAnalyticsMetadata.productUniverseId else nil,
				userRobuxBalance = state_1.accountInfo.balance
			}))
			
			if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal and p8 then
				p9:dispatch(setRobloxSubscriptionProductsModule(p8))
			end
		else
			p9:dispatch(setIsUserEligibleForUnifiedPurchaseFlowModule(false))
		end
		local var4, var5 = meetsPrerequisitesModule(p1, p4, var3.getFlagBypassThirdPartySettingForRobloxPurchase() and (not p5 and (var3.getLuaUseThirdPartyPermissions() or var3.getFlagRestrictSales2())), var3, p6)
		
		if var4 then
			local var6
			local robux = p3.robux
			local hasFailed = p3.hasFailed
			local var7 = if p6 ~= nil then p6 else getPlayerProductInfoPriceModule(p1, p2.isPremium)
			local platform = userInputService:GetPlatform()
			local _ = nil
			
			if fFlagPurchasePromptOfferMarginUpsellEnabledModule then
				local var8 = selectCartPricingOverrideModule(p9:getState())
				var6 = if var8 ~= nil then var7 else var8.priceInRobux
			else
				var6 = var7
			end
			if hasFailed or robux >= var6 then
				if var7 <= robux and state.promptRequest.requestType == requestTypeModule.RobuxUpsell then
					return p9:dispatch(completeRequestModule_1())
				elseif state.requestType ~= requestTypeModule.AvatarCreationFee then
					var2.signalProductPurchaseShown(p1.productId, state.requestType)
				end
				return p9:dispatch(setPromptStateModule(promptStateModule.PromptPurchase))
			elseif var3.getFFlagDisableRobuxUpsell() then
				return p9:dispatch(errorOccurredModule(purchaseErrorModule.NotEnoughRobuxNoUpsell))
			end
			local var9 = getPaymentPlatformModule(platform)
			
			if p7 or var9 ~= paymentPlatformModule.Web then
				p9:dispatch(setPurchaseFlowModule(purchaseFlowModule.RobuxUpsellV2))
			end
			if p7 then
				p9:dispatch(setPostPurchaseActionsModule({}))
			end
			local _ = false
			
			if largerRobuxUpsellTestModule.isEnabled() then
				local var10 = getFStringLargerRobuxUpsellIxpLayer()
				local layerData = var1.getLayerData(var10)
				
				if layerData then
					var1.logUserLayerExposure(var10)
					
					if largerRobuxUpsellTestModule.isUserEnrolled(layerData) then
						p9:dispatch(setPurchaseFlowModule(purchaseFlowModule.LargeRobuxUpsell))
					end
				end
			end
			return getRobuxUpsellSuggestionsModule(var7, robux, var9, p1.ProductId, p1.DisplayName, game.GameId, if fFlagEnableUpsellSuggestionsAnalyticsId then state.purchaseFlowUUID else nil):andThen(function(p11)
				-- upvalues: handleSuccessfulUpsellSuggestions (copy), p9 (ref)
				return handleSuccessfulUpsellSuggestions(p9, p11)
			end, function()
				-- upvalues: handleFailedUpsellProduct (copy), p9 (ref), state (ref)
				return handleFailedUpsellProduct(p9, state)
			end)
		else
			return if var3.isStudio() or var5 ~= purchaseErrorModule.ThirdPartyDisabled then p9:dispatch(errorOccurredModule(var5)) else p9:dispatch(completeRequestModule())
		end
	end)
end