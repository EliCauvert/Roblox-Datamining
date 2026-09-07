local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local playersService = game:GetService("Players")
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
local getFFlagRespectBalanceInfoForBundleUpsellInStudioModule = require(purchasePrompt.Flags.GetFFlagRespectBalanceInfoForBundleUpsellInStudio)
local thunkModule = require(purchasePrompt.Thunk)
local getPurchaseSurfaceModule = require(purchasePrompt.Utils.getPurchaseSurface)
local _ = require(purchasePrompt.Flags.GetFFlagEnableLuobuInGameUpsell)
local fFlagEnableUnifiedProductPurchaseFlow = require(purchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local setIsUserEligibleForUnifiedPurchaseFlowModule = require(purchasePrompt.Actions.SetIsUserEligibleForUnifiedPurchaseFlow)
local setPurchaseAnalyticsMetadataModule = require(purchasePrompt.Actions.SetPurchaseAnalyticsMetadata)
local getFFlagFixLimitedBundleResalePrerequisiteModule = require(purchasePrompt.Flags.GetFFlagFixLimitedBundleResalePrerequisite)
local getProductTypeFromRequestTypeModule = require(purchasePrompt.Utils.getProductTypeFromRequestType)
local meetsBundlePrerequisitesModule = require(purchasePrompt.Utils.meetsBundlePrerequisites)
local setPostPurchaseActionsModule = require(purchasePrompt.Actions.SetPostPurchaseActions)
local fFlagUnifiedPurchaseGamepassAddProductUniverseId = require(purchasePrompt.Parent.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId
local fFlagUpdatePriceTelemetry = require(purchasePrompt.Parent.SharedFlags).FFlagUpdatePriceTelemetry
local selectPriceModule = require(purchasePrompt.Selectors.selectPrice)
local fFlagPurchasePromptOfferMarginUpsellEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptOfferMarginUpsellEnabled)
local selectCartPricingOverrideModule = require(purchasePrompt.Selectors.selectCartPricingOverride)
local _ = require(purchasePrompt.Parent.RobloxSubscriptionPurchaseApp)
local setRobloxSubscriptionProductsModule = require(purchasePrompt.Actions.SetRobloxSubscriptionProducts)
local fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal = require(purchasePrompt.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal

local function _(p1, p2)
	return if not (not p1 or p1.product == nil) then if p2 and p1.product.premiumPricing ~= nil then p1.product.premiumPricing.premiumPriceInRobux or 0 else p1.product.priceInRobux or 0 else 0
end

local function meetsBundlePrerequisites(p1, p2, p3, p4)
	-- upvalues: purchaseErrorModule (ref), playersService (ref)
	local collectibleItemDetail = p1.collectibleItemDetail
	local var1 = collectibleItemDetail and (collectibleItemDetail.collectibleItemId ~= nil and collectibleItemDetail.collectibleItemId ~= "")
	local var2 = collectibleItemDetail and (collectibleItemDetail.collectibleItemType ~= nil and collectibleItemDetail.collectibleItemType == "Limited")
	
	if var1 then
		if not var2 and p4 then
			return false, purchaseErrorModule.AlreadyOwn
		end
	elseif p4 then
		return false, purchaseErrorModule.AlreadyOwn
	end
	local var3
	local _ = nil
	
	if var1 then
		local _ = collectibleItemDetail.saleStatus == "OnSale"
	else
		var3 = p1.product and p1.product.isForSale
	end
	if not var3 then
		return false, purchaseErrorModule.NotForSale
	elseif p3 ~= nil and p2.robux ~= nil and p2.robux < p3 then
		return false, purchaseErrorModule.NotEnoughRobux
	elseif p1.itemRestrictions ~= nil then
		for i, v in p1.itemRestrictions do
			if v == "ThirteenPlus" then
				if not playersService.LocalPlayer:GetUnder13() then break end
				return false, purchaseErrorModule.Under13
			end
		end
	end
	return true, nil
end

local list = { analyticsModule, networkModule }

return function(_, p5, p6, p7, p8, p9, p10, p11)
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref), networkModule (ref), bundleProductInfoReceivedModule (ref), accountInfoReceivedModule (ref), balanceInfoRecievedModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), setIsUserEligibleForUnifiedPurchaseFlowModule (ref), setPurchaseAnalyticsMetadataModule (ref), getPurchaseSurfaceModule (ref), getProductTypeFromRequestTypeModule (ref), fFlagUpdatePriceTelemetry (ref), selectPriceModule (ref), fFlagUnifiedPurchaseGamepassAddProductUniverseId (ref), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (ref), setRobloxSubscriptionProductsModule (ref), fFlagPurchasePromptOfferMarginUpsellEnabledModule (ref), selectCartPricingOverrideModule (ref), getFFlagFixLimitedBundleResalePrerequisiteModule (ref), meetsBundlePrerequisitesModule (ref), meetsBundlePrerequisites (ref), userInputService (ref), purchaseErrorModule (ref), runService (ref), getFFlagRespectBalanceInfoForBundleUpsellInStudioModule (ref), setPurchaseFlowModule (ref), purchaseFlowModule (ref), setPostPurchaseActionsModule (ref), getPaymentPlatformModule (ref), getRobuxUpsellSuggestionsModule (ref), promptNativeUpsellSuggestionsModule (ref), errorOccurredModule (ref), setPromptStateModule (ref), promptStateModule (ref)
	return thunkModule.new(script.Name, list, function(p12, p13)
		-- upvalues: analyticsModule (copy), networkModule (copy), bundleProductInfoReceivedModule (copy), p5 (ref), accountInfoReceivedModule (copy), p6 (ref), balanceInfoRecievedModule (copy), p7 (ref), fFlagEnableUnifiedProductPurchaseFlow (copy), p10 (ref), setIsUserEligibleForUnifiedPurchaseFlowModule (copy), setPurchaseAnalyticsMetadataModule (copy), getPurchaseSurfaceModule (copy), getProductTypeFromRequestTypeModule (copy), fFlagUpdatePriceTelemetry (copy), selectPriceModule (copy), p8 (write), fFlagUnifiedPurchaseGamepassAddProductUniverseId (copy), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), p11 (ref), setRobloxSubscriptionProductsModule (copy), fFlagPurchasePromptOfferMarginUpsellEnabledModule (copy), selectCartPricingOverrideModule (copy), getFFlagFixLimitedBundleResalePrerequisiteModule (copy), meetsBundlePrerequisitesModule (copy), p9 (ref), meetsBundlePrerequisites (copy), userInputService (copy), purchaseErrorModule (copy), runService (copy), getFFlagRespectBalanceInfoForBundleUpsellInStudioModule (copy), setPurchaseFlowModule (copy), purchaseFlowModule (copy), setPostPurchaseActionsModule (copy), getPaymentPlatformModule (copy), getRobuxUpsellSuggestionsModule (copy), promptNativeUpsellSuggestionsModule (copy), errorOccurredModule (copy), setPromptStateModule (copy), promptStateModule (copy)
		local _ = p12:getState()
		local _ = p13[analyticsModule]
		local _ = p13[networkModule]
		p12:dispatch(bundleProductInfoReceivedModule(p5))
		p12:dispatch(accountInfoReceivedModule(p6))
		p12:dispatch(balanceInfoRecievedModule(p7))
		
		if fFlagEnableUnifiedProductPurchaseFlow then
			if p10 then
				local isPremium, var4
				p12:dispatch(setIsUserEligibleForUnifiedPurchaseFlowModule(true))
				local state = p12:getState()
				p12:dispatch(setPurchaseAnalyticsMetadataModule({
					purchaseFlowUUID = state.purchaseFlowUUID,
					surface = getPurchaseSurfaceModule(state.purchaseAnalyticsMetadata),
					productType = getProductTypeFromRequestTypeModule(state.promptRequest.requestType),
					productId = state.productInfo.productId,
					productTargetId = state.productInfo.productTargetId,
					saleLocationUniverseId = game.GameId or 0,
					price = if fFlagUpdatePriceTelemetry then selectPriceModule(state).priceInRobux elseif state.productInfo.price then state.productInfo.price else p8,
					productUniverseId = if fFlagUnifiedPurchaseGamepassAddProductUniverseId then state.purchaseAnalyticsMetadata.productUniverseId else nil,
					userRobuxBalance = state.accountInfo.balance
				}))
				
				if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal and p11 then
					p12:dispatch(setRobloxSubscriptionProductsModule(p11))
				end
			else
				p12:dispatch(setIsUserEligibleForUnifiedPurchaseFlowModule(false))
			end
		end
		if p8 == nil then
			isPremium = p6.isPremium
			var4 = p5
			p8 = if not var4 or var4.product == nil then if isPremium and var4.product.premiumPricing ~= nil then var4.product.premiumPricing.premiumPriceInRobux or 0 else var4.product.priceInRobux or 0 else 0
		end
		isPremium = nil
		
		if fFlagPurchasePromptOfferMarginUpsellEnabledModule then
			local var5 = selectCartPricingOverrideModule(p12:getState())
			isPremium = if var5 ~= nil then p8 else var5.priceInRobux
		else
			isPremium = p8
		end
		local var6
		local _ = nil
		var4 = nil
		
		if getFFlagFixLimitedBundleResalePrerequisiteModule() then
			local var7, var8 = meetsBundlePrerequisitesModule(p5, p7, isPremium, p9)
			var6 = var7
			var4 = var8
		else
			local var9, var10 = meetsBundlePrerequisites(p5, p7, isPremium, p9)
			var6 = var9
			var4 = var10
		end
		local var11 = p8
		local platform = userInputService:GetPlatform()
		local var12 = var4 == purchaseErrorModule.NotEnoughRobux
		
		if runService:IsStudio() and (getFFlagRespectBalanceInfoForBundleUpsellInStudioModule() and (var12 and (var6 or not (if runService:IsStudio() then if getFFlagRespectBalanceInfoForBundleUpsellInStudioModule() then if var12 then p7.robux < var11 else nil else nil else nil)))) then
			return p12:dispatch(setPromptStateModule(promptStateModule.PromptPurchase))
		elseif not u464 then
			return p12:dispatch(errorOccurredModule(var4))
		elseif fFlagEnableUnifiedProductPurchaseFlow and p10 then
			p12:dispatch(setPurchaseFlowModule(purchaseFlowModule.RobuxUpsellV2))
		end
		if fFlagEnableUnifiedProductPurchaseFlow and p10 then
			p12:dispatch(setPostPurchaseActionsModule({}))
		end
		local _ = var11 - p7.robux
		local _ = p6.isPremium
		
		return getRobuxUpsellSuggestionsModule(var11, p7.robux, getPaymentPlatformModule(platform)):andThen(function(p14)
			-- upvalues: p12 (ref), promptNativeUpsellSuggestionsModule (copy)
			p12:dispatch(promptNativeUpsellSuggestionsModule(p14.products, 1, p14.virtualItemBadgeType))
		end, function()
			-- upvalues: p12 (ref), errorOccurredModule (copy), purchaseErrorModule (copy)
			p12:dispatch(errorOccurredModule(purchaseErrorModule.NotEnoughRobuxXbox))
		end)
	end)
end