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
local upsellFlowModule = require(purchasePrompt.Enums.UpsellFlow)
local purchaseFlowModule = require(purchasePrompt.Enums.PurchaseFlow)
local _ = require(purchasePrompt.Models.RobuxUpsell)
local getUpsellFlowModule = require(purchasePrompt.NativeUpsell.getUpsellFlow)
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
local getFFlagEnableInsufficientRobuxForBundleUpsellFixModule = require(purchasePrompt.Flags.GetFFlagEnableInsufficientRobuxForBundleUpsellFix)
local fFlagEnableUnifiedProductPurchaseFlow = require(purchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local setIsUserEligibleForUnifiedPurchaseFlowModule = require(purchasePrompt.Actions.SetIsUserEligibleForUnifiedPurchaseFlow)
local setPurchaseAnalyticsMetadataModule = require(purchasePrompt.Actions.SetPurchaseAnalyticsMetadata)
local getFFlagUseCatalogItemDetailsToResolveBundlePurchaseModule = require(purchasePrompt.Flags.GetFFlagUseCatalogItemDetailsToResolveBundlePurchase)
local getProductTypeFromRequestTypeModule = require(purchasePrompt.Utils.getProductTypeFromRequestType)
local setPostPurchaseActionsModule = require(purchasePrompt.Actions.SetPostPurchaseActions)
local fFlagUnifiedPurchaseGamepassAddProductUniverseId = require(purchasePrompt.Parent.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId
local fFlagUpdatePriceTelemetry = require(purchasePrompt.Parent.SharedFlags).FFlagUpdatePriceTelemetry
local selectPriceModule = require(purchasePrompt.Selectors.selectPrice)
local _ = require(purchasePrompt.Parent.RobloxSubscriptionPurchaseApp)
local setRobloxSubscriptionProductsModule = require(purchasePrompt.Actions.SetRobloxSubscriptionProducts)
local fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal = require(purchasePrompt.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal

local function _(p0, p1) --[[ line: 60 | named "getBundlePriceFromProductInfo" ]]
	return if not (not p0 or p0.product == nil) then if p1 and p0.product.premiumPricing ~= nil then p0.product.premiumPricing.premiumPriceInRobux or 0 else p0.product.priceInRobux or 0 else 0
end

local function meetsBundlePrerequisitesV2(p2, p3, p4, p5) --[[ line: 73 ]]
	-- upvalues: purchaseErrorModule (ref)
	local owned = p2.owned
	local collectibleItemDetail = p3.collectibleItemDetail
	local var34 = collectibleItemDetail and collectibleItemDetail.collectibleItemType == "Limited"
	
	if collectibleItemDetail and (collectibleItemDetail.collectibleItemId ~= nil and collectibleItemDetail.collectibleItemId ~= "") then
		if not var34 and owned then
			return false, purchaseErrorModule.AlreadyOwn
		elseif not p2.isPurchasable then
			return false, purchaseErrorModule.NotForSale
		elseif p5 == nil or p4.robux == nil or p4.robux >= p5 then
			return true, nil
		end
		return false, purchaseErrorModule.NotEnoughRobux
	elseif owned then
		return false, purchaseErrorModule.AlreadyOwn
	end
end

local function meetsBundlePrerequisites(p6, p7, p8, p9) --[[ line: 110 ]]
	-- upvalues: purchaseErrorModule (ref), playersService (ref)
	local collectibleItemDetail = p6.collectibleItemDetail
	local var35 = collectibleItemDetail and (collectibleItemDetail.collectibleItemId ~= nil and collectibleItemDetail.collectibleItemId ~= "")
	local var36 = collectibleItemDetail and (collectibleItemDetail.collectibleItemType ~= nil and collectibleItemDetail.collectibleItemType == "Limited")
	
	if var35 then
		if not var36 and p9 then
			return false, purchaseErrorModule.AlreadyOwn
		end
	elseif p9 then
		return false, purchaseErrorModule.AlreadyOwn
	end
	local var37
	local _ = nil
	
	if var35 then
		local _ = collectibleItemDetail.saleStatus == "OnSale"
	else
		var37 = p6.product and p6.product.isForSale
	end
	if not var37 then
		return false, purchaseErrorModule.NotForSale
	elseif p8 ~= nil and p7.robux ~= nil and p7.robux < p8 then
		return false, purchaseErrorModule.NotEnoughRobux
	elseif p6.itemRestrictions ~= nil then
		for i, v in p6.itemRestrictions do
			if v == "ThirteenPlus" then
				if not playersService.LocalPlayer:GetUnder13() then break end
				return false, purchaseErrorModule.Under13
			end
		end
	end
	return true, nil
end

local list = { analyticsModule, networkModule }

return function(p10, p11, p12, p13, p14, p15, p16, p17) --[[ line: 171 | named "resolveBundlePromptState" ]]
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref), networkModule (ref), bundleProductInfoReceivedModule (ref), accountInfoReceivedModule (ref), balanceInfoRecievedModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), setIsUserEligibleForUnifiedPurchaseFlowModule (ref), setPurchaseAnalyticsMetadataModule (ref), getPurchaseSurfaceModule (ref), getProductTypeFromRequestTypeModule (ref), fFlagUpdatePriceTelemetry (ref), selectPriceModule (ref), fFlagUnifiedPurchaseGamepassAddProductUniverseId (ref), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (ref), setRobloxSubscriptionProductsModule (ref), getFFlagUseCatalogItemDetailsToResolveBundlePurchaseModule (ref), meetsBundlePrerequisitesV2 (ref), meetsBundlePrerequisites (ref), userInputService (ref), getUpsellFlowModule (ref), purchaseErrorModule (ref), runService (ref), getFFlagRespectBalanceInfoForBundleUpsellInStudioModule (ref), getFFlagEnableInsufficientRobuxForBundleUpsellFixModule (ref), upsellFlowModule (ref), setPromptStateModule (ref), promptStateModule (ref), setPurchaseFlowModule (ref), purchaseFlowModule (ref), setPostPurchaseActionsModule (ref), getPaymentPlatformModule (ref), getRobuxUpsellSuggestionsModule (ref), promptNativeUpsellSuggestionsModule (ref), errorOccurredModule (ref)
	return thunkModule.new(script.Name, list, function(p18, p19) --[[ line: 181 ]]
		-- upvalues: analyticsModule (copy), networkModule (copy), bundleProductInfoReceivedModule (copy), p11 (ref), accountInfoReceivedModule (copy), p12 (ref), balanceInfoRecievedModule (copy), p13 (ref), fFlagEnableUnifiedProductPurchaseFlow (copy), p16 (ref), setIsUserEligibleForUnifiedPurchaseFlowModule (copy), setPurchaseAnalyticsMetadataModule (copy), getPurchaseSurfaceModule (copy), getProductTypeFromRequestTypeModule (copy), fFlagUpdatePriceTelemetry (copy), selectPriceModule (copy), p14 (write), fFlagUnifiedPurchaseGamepassAddProductUniverseId (copy), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), p17 (ref), setRobloxSubscriptionProductsModule (copy), getFFlagUseCatalogItemDetailsToResolveBundlePurchaseModule (copy), meetsBundlePrerequisitesV2 (copy), p10 (ref), meetsBundlePrerequisites (copy), p15 (ref), userInputService (copy), getUpsellFlowModule (copy), purchaseErrorModule (copy), runService (copy), getFFlagRespectBalanceInfoForBundleUpsellInStudioModule (copy), getFFlagEnableInsufficientRobuxForBundleUpsellFixModule (copy), upsellFlowModule (copy), setPromptStateModule (copy), promptStateModule (copy), setPurchaseFlowModule (copy), purchaseFlowModule (copy), setPostPurchaseActionsModule (copy), getPaymentPlatformModule (copy), getRobuxUpsellSuggestionsModule (copy), promptNativeUpsellSuggestionsModule (copy), errorOccurredModule (copy)
		local _ = p18:getState()
		local _ = p19[analyticsModule]
		local _ = p19[networkModule]
		p18:dispatch(bundleProductInfoReceivedModule(p11))
		p18:dispatch(accountInfoReceivedModule(p12))
		p18:dispatch(balanceInfoRecievedModule(p13))
		
		if fFlagEnableUnifiedProductPurchaseFlow then
			if p16 then
				local isPremium, var39
				p18:dispatch(setIsUserEligibleForUnifiedPurchaseFlowModule(true))
				local state = p18:getState()
				p18:dispatch(setPurchaseAnalyticsMetadataModule({
					purchaseFlowUUID = state.purchaseFlowUUID,
					surface = getPurchaseSurfaceModule(state.purchaseAnalyticsMetadata),
					productType = getProductTypeFromRequestTypeModule(state.promptRequest.requestType),
					productId = state.productInfo.productId,
					productTargetId = state.productInfo.productTargetId,
					saleLocationUniverseId = game.GameId or 0,
					price = if fFlagUpdatePriceTelemetry then selectPriceModule(state).priceInRobux elseif state.productInfo.price then state.productInfo.price else p14,
					productUniverseId = if fFlagUnifiedPurchaseGamepassAddProductUniverseId then state.purchaseAnalyticsMetadata.productUniverseId else nil,
					userRobuxBalance = state.accountInfo.balance
				}))
				
				if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal and p17 then
					p18:dispatch(setRobloxSubscriptionProductsModule(p17))
				end
			else
				p18:dispatch(setIsUserEligibleForUnifiedPurchaseFlowModule(false))
			end
		end
		if p14 == nil then
			isPremium = p12.isPremium
			var39 = p11
			p14 = if not var39 or var39.product == nil then if isPremium and var39.product.premiumPricing ~= nil then var39.product.premiumPricing.premiumPriceInRobux or 0 else var39.product.priceInRobux or 0 else 0
		end
		local var41
		isPremium = nil
		local _ = nil
		
		if getFFlagUseCatalogItemDetailsToResolveBundlePurchaseModule() then
			var39, var40 = meetsBundlePrerequisitesV2(p10, p11, p13, p14)
			isPremium = var39
			var41 = var40
		else
			var39, var42 = meetsBundlePrerequisites(p11, p13, p14, p15)
			isPremium = var39
			var41 = var42
		end
		var39 = p14
		local platform = userInputService:GetPlatform()
		local var44 = getUpsellFlowModule(platform)
		local var45 = var41 == purchaseErrorModule.NotEnoughRobux
		
		if runService:IsStudio() and (getFFlagRespectBalanceInfoForBundleUpsellInStudioModule() and (var45 and (isPremium or not (if runService:IsStudio() then if getFFlagRespectBalanceInfoForBundleUpsellInStudioModule() then if var45 then p13.robux < var39 else nil else nil else nil)))) then
			return p18:dispatch(setPromptStateModule(promptStateModule.PromptPurchase))
		elseif not u520 then
			return p18:dispatch(errorOccurredModule(var41))
		elseif not getFFlagEnableInsufficientRobuxForBundleUpsellFixModule() and var44 == upsellFlowModule.Web then
			return p18:dispatch(setPromptStateModule(promptStateModule.RobuxUpsell))
		elseif fFlagEnableUnifiedProductPurchaseFlow and p16 then
			p18:dispatch(setPurchaseFlowModule(purchaseFlowModule.RobuxUpsellV2))
		end
		if fFlagEnableUnifiedProductPurchaseFlow and p16 then
			p18:dispatch(setPostPurchaseActionsModule({}))
		end
		local _ = var39 - p13.robux
		local _ = p12.isPremium
		
		return getRobuxUpsellSuggestionsModule(var39, p13.robux, getPaymentPlatformModule(platform)):andThen(function(p20) --[[ line: 278 ]]
			-- upvalues: p18 (ref), promptNativeUpsellSuggestionsModule (copy)
			p18:dispatch(promptNativeUpsellSuggestionsModule(p20.products, 1, p20.virtualItemBadgeType))
		end, function() --[[ line: 288 ]]
			-- upvalues: p18 (ref), errorOccurredModule (copy), purchaseErrorModule (copy)
			p18:dispatch(errorOccurredModule(purchaseErrorModule.NotEnoughRobuxXbox))
		end)
	end)
end