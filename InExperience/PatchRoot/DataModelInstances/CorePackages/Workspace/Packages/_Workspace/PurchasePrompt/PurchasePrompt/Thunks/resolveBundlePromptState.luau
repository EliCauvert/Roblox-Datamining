local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local setPromptStateModule = require(purchasePrompt.Actions.SetPromptState)
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local bundleProductInfoReceivedModule = require(purchasePrompt.Actions.BundleProductInfoReceived)
local accountInfoReceivedModule = require(purchasePrompt.Actions.AccountInfoReceived)
local balanceInfoRecievedModule = require(purchasePrompt.Actions.BalanceInfoRecieved)
local promptNativeUpsellSuggestionsModule = require(purchasePrompt.Actions.PromptNativeUpsellSuggestions)
local setPurchaseFlowModule = require(purchasePrompt.Actions.SetPurchaseFlow)
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local purchaseFlowModule = require(purchasePrompt.Enums.PurchaseFlow)
local _ = require(purchasePrompt.Models.RobuxUpsell)
local getRobuxUpsellSuggestionsModule = require(purchasePrompt.Network.getRobuxUpsellSuggestions)
local analyticsModule = require(purchasePrompt.Services.Analytics)
local networkModule = require(purchasePrompt.Services.Network)
local getPaymentPlatformModule = require(purchasePrompt.Utils.getPaymentPlatform)
local _ = require(purchasePrompt.Utils.getPaymentFromPlatformLegacy)
local _ = require(purchasePrompt.Utils.getHasAmazonUserAgent)
local isEligibleForRobuxUpsellPlusButtonModule = require(purchasePrompt.Utils.isEligibleForRobuxUpsellPlusButton)
local getFFlagRespectBalanceInfoForBundleUpsellInStudioModule = require(purchasePrompt.Flags.GetFFlagRespectBalanceInfoForBundleUpsellInStudio)
local thunkModule = require(purchasePrompt.Thunk)
local getPurchaseSurfaceModule = require(purchasePrompt.Utils.getPurchaseSurface)
local _ = require(purchasePrompt.Flags.GetFFlagEnableLuobuInGameUpsell)
local setIsUserEligibleForUnifiedPurchaseFlowModule = require(purchasePrompt.Actions.SetIsUserEligibleForUnifiedPurchaseFlow)
local setPurchaseAnalyticsMetadataModule = require(purchasePrompt.Actions.SetPurchaseAnalyticsMetadata)
local getProductTypeFromRequestTypeModule = require(purchasePrompt.Utils.getProductTypeFromRequestType)
local meetsBundlePrerequisitesModule = require(purchasePrompt.Utils.meetsBundlePrerequisites)
local setPostPurchaseActionsModule = require(purchasePrompt.Actions.SetPostPurchaseActions)
local fFlagUnifiedPurchaseGamepassAddProductUniverseId = require(purchasePrompt.Parent.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId
local fFlagUpdatePriceTelemetry = require(purchasePrompt.Parent.SharedFlags).FFlagUpdatePriceTelemetry
local selectPriceModule = require(purchasePrompt.Selectors.selectPrice)
local selectCartPricingOverrideModule = require(purchasePrompt.Selectors.selectCartPricingOverride)
local _ = require(purchasePrompt.Parent.RobloxSubscriptionPurchaseApp)
local setRobloxSubscriptionProductsModule = require(purchasePrompt.Actions.SetRobloxSubscriptionProducts)
local fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal = require(purchasePrompt.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal

local function _(p1, p2)
	return if not (not p1 or p1.product == nil) then if p2 and p1.product.premiumPricing ~= nil then p1.product.premiumPricing.premiumPriceInRobux or 0 else p1.product.priceInRobux or 0 else 0
end

local list = { analyticsModule, networkModule }

return function(_, p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref), networkModule (ref), bundleProductInfoReceivedModule (ref), accountInfoReceivedModule (ref), balanceInfoRecievedModule (ref), setIsUserEligibleForUnifiedPurchaseFlowModule (ref), setPurchaseAnalyticsMetadataModule (ref), getPurchaseSurfaceModule (ref), getProductTypeFromRequestTypeModule (ref), fFlagUpdatePriceTelemetry (ref), selectPriceModule (ref), fFlagUnifiedPurchaseGamepassAddProductUniverseId (ref), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (ref), setRobloxSubscriptionProductsModule (ref), selectCartPricingOverrideModule (ref), meetsBundlePrerequisitesModule (ref), userInputService (ref), purchaseErrorModule (ref), runService (ref), getFFlagRespectBalanceInfoForBundleUpsellInStudioModule (ref), setPurchaseFlowModule (ref), purchaseFlowModule (ref), setPostPurchaseActionsModule (ref), getPaymentPlatformModule (ref), getRobuxUpsellSuggestionsModule (ref), isEligibleForRobuxUpsellPlusButtonModule (ref), promptNativeUpsellSuggestionsModule (ref), errorOccurredModule (ref), setPromptStateModule (ref), promptStateModule (ref)
	return thunkModule.new(script.Name, list, function(p8, p9)
		-- upvalues: analyticsModule (copy), networkModule (copy), bundleProductInfoReceivedModule (copy), p1 (ref), accountInfoReceivedModule (copy), p2 (ref), balanceInfoRecievedModule (copy), p3 (ref), p6 (ref), setIsUserEligibleForUnifiedPurchaseFlowModule (copy), setPurchaseAnalyticsMetadataModule (copy), getPurchaseSurfaceModule (copy), getProductTypeFromRequestTypeModule (copy), fFlagUpdatePriceTelemetry (copy), selectPriceModule (copy), p4 (write), fFlagUnifiedPurchaseGamepassAddProductUniverseId (copy), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), p7 (ref), setRobloxSubscriptionProductsModule (copy), selectCartPricingOverrideModule (copy), meetsBundlePrerequisitesModule (copy), p5 (ref), userInputService (copy), purchaseErrorModule (copy), runService (copy), getFFlagRespectBalanceInfoForBundleUpsellInStudioModule (copy), setPurchaseFlowModule (copy), purchaseFlowModule (copy), setPostPurchaseActionsModule (copy), getPaymentPlatformModule (copy), getRobuxUpsellSuggestionsModule (copy), isEligibleForRobuxUpsellPlusButtonModule (copy), promptNativeUpsellSuggestionsModule (copy), errorOccurredModule (copy), setPromptStateModule (copy), promptStateModule (copy)
		local _ = p8:getState()
		local _ = p9[analyticsModule]
		local _ = p9[networkModule]
		p8:dispatch(bundleProductInfoReceivedModule(p1))
		p8:dispatch(accountInfoReceivedModule(p2))
		p8:dispatch(balanceInfoRecievedModule(p3))
		
		if p6 then
			local isPremium, var1
			p8:dispatch(setIsUserEligibleForUnifiedPurchaseFlowModule(true))
			local state = p8:getState()
			p8:dispatch(setPurchaseAnalyticsMetadataModule({
				purchaseFlowUUID = state.purchaseFlowUUID,
				surface = getPurchaseSurfaceModule(state.purchaseAnalyticsMetadata),
				productType = getProductTypeFromRequestTypeModule(state.promptRequest.requestType),
				productId = state.productInfo.productId,
				productTargetId = state.productInfo.productTargetId,
				saleLocationUniverseId = game.GameId or 0,
				price = if fFlagUpdatePriceTelemetry then selectPriceModule(state).priceInRobux elseif state.productInfo.price then state.productInfo.price else p4,
				productUniverseId = if fFlagUnifiedPurchaseGamepassAddProductUniverseId then state.purchaseAnalyticsMetadata.productUniverseId else nil,
				userRobuxBalance = state.accountInfo.balance
			}))
			
			if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal and p7 then
				p8:dispatch(setRobloxSubscriptionProductsModule(p7))
			end
		else
			p8:dispatch(setIsUserEligibleForUnifiedPurchaseFlowModule(false))
		end
		if p4 == nil then
			isPremium = p2.isPremium
			var1 = p1
			p4 = if not var1 or var1.product == nil then if isPremium and var1.product.premiumPricing ~= nil then var1.product.premiumPricing.premiumPriceInRobux or 0 else var1.product.priceInRobux or 0 else 0
		end
		isPremium = selectCartPricingOverrideModule(p8:getState())
		var1, var32 = meetsBundlePrerequisitesModule(p1, p3, if isPremium ~= nil then p4 else isPremium.priceInRobux, p5)
		local var2 = p4
		local platform = userInputService:GetPlatform()
		local var3 = var32 == purchaseErrorModule.NotEnoughRobux
		
		if runService:IsStudio() and (getFFlagRespectBalanceInfoForBundleUpsellInStudioModule() and (var3 and (var1 or not (if runService:IsStudio() then if getFFlagRespectBalanceInfoForBundleUpsellInStudioModule() then if var3 then p3.robux < var2 else nil else nil else nil)))) then
			return p8:dispatch(setPromptStateModule(promptStateModule.PromptPurchase))
		elseif not u360 then
			return p8:dispatch(errorOccurredModule(var32))
		elseif p6 then
			p8:dispatch(setPurchaseFlowModule(purchaseFlowModule.RobuxUpsellV2))
		end
		if p6 then
			p8:dispatch(setPostPurchaseActionsModule({}))
		end
		local _ = var2 - p3.robux
		local _ = p2.isPremium
		local state = p8:getState()
		
		return getRobuxUpsellSuggestionsModule(var2, p3.robux, getPaymentPlatformModule(platform), isEligibleForRobuxUpsellPlusButtonModule(state.isUserEligibleForUnifiedPurchaseFlow, state.robloxSubscriptionProducts, state.productPayload, selectPriceModule(state), state.promptRequest.requestType)):andThen(function(p10)
			-- upvalues: p8 (ref), promptNativeUpsellSuggestionsModule (copy)
			p8:dispatch(promptNativeUpsellSuggestionsModule(p10.products, 1, p10.virtualItemBadgeType, p10.experimentVariant))
		end, function()
			-- upvalues: p8 (ref), errorOccurredModule (copy), purchaseErrorModule (copy)
			p8:dispatch(errorOccurredModule(purchaseErrorModule.NotEnoughRobuxXbox))
		end)
	end)
end