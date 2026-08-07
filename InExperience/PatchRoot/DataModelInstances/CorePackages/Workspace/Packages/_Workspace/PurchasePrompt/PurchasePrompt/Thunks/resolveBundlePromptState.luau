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
local getFFlagFixLimitedBundleResalePrerequisiteModule = require(purchasePrompt.Flags.GetFFlagFixLimitedBundleResalePrerequisite)
local getProductTypeFromRequestTypeModule = require(purchasePrompt.Utils.getProductTypeFromRequestType)
local meetsBundlePrerequisitesModule = require(purchasePrompt.Utils.meetsBundlePrerequisites)
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

local function meetsBundlePrerequisites(p2, p3, p4, p5) --[[ line: 73 ]]
	-- upvalues: purchaseErrorModule (ref), playersService (ref)
	local collectibleItemDetail = p2.collectibleItemDetail
	local var34 = collectibleItemDetail and (collectibleItemDetail.collectibleItemId ~= nil and collectibleItemDetail.collectibleItemId ~= "")
	local var35 = collectibleItemDetail and (collectibleItemDetail.collectibleItemType ~= nil and collectibleItemDetail.collectibleItemType == "Limited")
	
	if var34 then
		if not var35 and p5 then
			return false, purchaseErrorModule.AlreadyOwn
		end
	elseif p5 then
		return false, purchaseErrorModule.AlreadyOwn
	end
	local var36
	local _ = nil
	
	if var34 then
		local _ = collectibleItemDetail.saleStatus == "OnSale"
	else
		var36 = p2.product and p2.product.isForSale
	end
	if not var36 then
		return false, purchaseErrorModule.NotForSale
	elseif p4 ~= nil and p3.robux ~= nil and p3.robux < p4 then
		return false, purchaseErrorModule.NotEnoughRobux
	elseif p2.itemRestrictions ~= nil then
		for i, v in p2.itemRestrictions do
			if v == "ThirteenPlus" then
				if not playersService.LocalPlayer:GetUnder13() then break end
				return false, purchaseErrorModule.Under13
			end
		end
	end
	return true, nil
end

local list = { analyticsModule, networkModule }

return function(_, p6, p7, p8, p9, p10, p11, p12) --[[ line: 134 | named "resolveBundlePromptState" ]]
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref), networkModule (ref), bundleProductInfoReceivedModule (ref), accountInfoReceivedModule (ref), balanceInfoRecievedModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), setIsUserEligibleForUnifiedPurchaseFlowModule (ref), setPurchaseAnalyticsMetadataModule (ref), getPurchaseSurfaceModule (ref), getProductTypeFromRequestTypeModule (ref), fFlagUpdatePriceTelemetry (ref), selectPriceModule (ref), fFlagUnifiedPurchaseGamepassAddProductUniverseId (ref), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (ref), setRobloxSubscriptionProductsModule (ref), getFFlagFixLimitedBundleResalePrerequisiteModule (ref), meetsBundlePrerequisitesModule (ref), meetsBundlePrerequisites (ref), userInputService (ref), getUpsellFlowModule (ref), purchaseErrorModule (ref), runService (ref), getFFlagRespectBalanceInfoForBundleUpsellInStudioModule (ref), getFFlagEnableInsufficientRobuxForBundleUpsellFixModule (ref), upsellFlowModule (ref), setPromptStateModule (ref), promptStateModule (ref), setPurchaseFlowModule (ref), purchaseFlowModule (ref), setPostPurchaseActionsModule (ref), getPaymentPlatformModule (ref), getRobuxUpsellSuggestionsModule (ref), promptNativeUpsellSuggestionsModule (ref), errorOccurredModule (ref)
	return thunkModule.new(script.Name, list, function(p13, p14) --[[ line: 144 ]]
		-- upvalues: analyticsModule (copy), networkModule (copy), bundleProductInfoReceivedModule (copy), p6 (ref), accountInfoReceivedModule (copy), p7 (ref), balanceInfoRecievedModule (copy), p8 (ref), fFlagEnableUnifiedProductPurchaseFlow (copy), p11 (ref), setIsUserEligibleForUnifiedPurchaseFlowModule (copy), setPurchaseAnalyticsMetadataModule (copy), getPurchaseSurfaceModule (copy), getProductTypeFromRequestTypeModule (copy), fFlagUpdatePriceTelemetry (copy), selectPriceModule (copy), p9 (write), fFlagUnifiedPurchaseGamepassAddProductUniverseId (copy), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), p12 (ref), setRobloxSubscriptionProductsModule (copy), getFFlagFixLimitedBundleResalePrerequisiteModule (copy), meetsBundlePrerequisitesModule (copy), p10 (ref), meetsBundlePrerequisites (copy), userInputService (copy), getUpsellFlowModule (copy), purchaseErrorModule (copy), runService (copy), getFFlagRespectBalanceInfoForBundleUpsellInStudioModule (copy), getFFlagEnableInsufficientRobuxForBundleUpsellFixModule (copy), upsellFlowModule (copy), setPromptStateModule (copy), promptStateModule (copy), setPurchaseFlowModule (copy), purchaseFlowModule (copy), setPostPurchaseActionsModule (copy), getPaymentPlatformModule (copy), getRobuxUpsellSuggestionsModule (copy), promptNativeUpsellSuggestionsModule (copy), errorOccurredModule (copy)
		local _ = p13:getState()
		local _ = p14[analyticsModule]
		local _ = p14[networkModule]
		p13:dispatch(bundleProductInfoReceivedModule(p6))
		p13:dispatch(accountInfoReceivedModule(p7))
		p13:dispatch(balanceInfoRecievedModule(p8))
		
		if fFlagEnableUnifiedProductPurchaseFlow then
			if p11 then
				local isPremium, var38
				p13:dispatch(setIsUserEligibleForUnifiedPurchaseFlowModule(true))
				local state = p13:getState()
				p13:dispatch(setPurchaseAnalyticsMetadataModule({
					purchaseFlowUUID = state.purchaseFlowUUID,
					surface = getPurchaseSurfaceModule(state.purchaseAnalyticsMetadata),
					productType = getProductTypeFromRequestTypeModule(state.promptRequest.requestType),
					productId = state.productInfo.productId,
					productTargetId = state.productInfo.productTargetId,
					saleLocationUniverseId = game.GameId or 0,
					price = if fFlagUpdatePriceTelemetry then selectPriceModule(state).priceInRobux elseif state.productInfo.price then state.productInfo.price else p9,
					productUniverseId = if fFlagUnifiedPurchaseGamepassAddProductUniverseId then state.purchaseAnalyticsMetadata.productUniverseId else nil,
					userRobuxBalance = state.accountInfo.balance
				}))
				
				if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal and p12 then
					p13:dispatch(setRobloxSubscriptionProductsModule(p12))
				end
			else
				p13:dispatch(setIsUserEligibleForUnifiedPurchaseFlowModule(false))
			end
		end
		if p9 == nil then
			isPremium = p7.isPremium
			var38 = p6
			p9 = if not var38 or var38.product == nil then if isPremium and var38.product.premiumPricing ~= nil then var38.product.premiumPricing.premiumPriceInRobux or 0 else var38.product.priceInRobux or 0 else 0
		end
		local var40
		isPremium = nil
		local _ = nil
		
		if getFFlagFixLimitedBundleResalePrerequisiteModule() then
			var38, var39 = meetsBundlePrerequisitesModule(p6, p8, p9, p10)
			isPremium = var38
			var40 = var39
		else
			var38, var41 = meetsBundlePrerequisites(p6, p8, p9, p10)
			isPremium = var38
			var40 = var41
		end
		var38 = p9
		local platform = userInputService:GetPlatform()
		local var43 = getUpsellFlowModule(platform)
		local var44 = var40 == purchaseErrorModule.NotEnoughRobux
		
		if runService:IsStudio() and (getFFlagRespectBalanceInfoForBundleUpsellInStudioModule() and (var44 and (isPremium or not (if runService:IsStudio() then if getFFlagRespectBalanceInfoForBundleUpsellInStudioModule() then if var44 then p8.robux < var38 else nil else nil else nil)))) then
			return p13:dispatch(setPromptStateModule(promptStateModule.PromptPurchase))
		elseif not u472 then
			return p13:dispatch(errorOccurredModule(var40))
		elseif not getFFlagEnableInsufficientRobuxForBundleUpsellFixModule() and var43 == upsellFlowModule.Web then
			return p13:dispatch(setPromptStateModule(promptStateModule.RobuxUpsell))
		elseif fFlagEnableUnifiedProductPurchaseFlow and p11 then
			p13:dispatch(setPurchaseFlowModule(purchaseFlowModule.RobuxUpsellV2))
		end
		if fFlagEnableUnifiedProductPurchaseFlow and p11 then
			p13:dispatch(setPostPurchaseActionsModule({}))
		end
		local _ = var38 - p8.robux
		local _ = p7.isPremium
		
		return getRobuxUpsellSuggestionsModule(var38, p8.robux, getPaymentPlatformModule(platform)):andThen(function(p15) --[[ line: 241 ]]
			-- upvalues: p13 (ref), promptNativeUpsellSuggestionsModule (copy)
			p13:dispatch(promptNativeUpsellSuggestionsModule(p15.products, 1, p15.virtualItemBadgeType))
		end, function() --[[ line: 251 ]]
			-- upvalues: p13 (ref), errorOccurredModule (copy), purchaseErrorModule (copy)
			p13:dispatch(errorOccurredModule(purchaseErrorModule.NotEnoughRobuxXbox))
		end)
	end)
end