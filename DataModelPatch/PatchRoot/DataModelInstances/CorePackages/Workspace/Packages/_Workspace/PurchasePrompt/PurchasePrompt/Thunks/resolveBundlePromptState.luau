local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SetPromptStateModule = require(PurchasePrompt.Actions.SetPromptState)
local ErrorOccurredModule = require(PurchasePrompt.Actions.ErrorOccurred)
local BundleProductInfoReceivedModule = require(PurchasePrompt.Actions.BundleProductInfoReceived)
local AccountInfoReceivedModule = require(PurchasePrompt.Actions.AccountInfoReceived)
local BalanceInfoRecievedModule = require(PurchasePrompt.Actions.BalanceInfoRecieved)
local PromptNativeUpsellSuggestionsModule = require(PurchasePrompt.Actions.PromptNativeUpsellSuggestions)
local SetPurchaseFlowModule = require(PurchasePrompt.Actions.SetPurchaseFlow)
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local UpsellFlowModule = require(PurchasePrompt.Enums.UpsellFlow)
local PurchaseFlowModule = require(PurchasePrompt.Enums.PurchaseFlow)
local _ = require(PurchasePrompt.Models.RobuxUpsell)
local GetUpsellFlowModule = require(PurchasePrompt.NativeUpsell.getUpsellFlow)
local GetRobuxUpsellSuggestionsModule = require(PurchasePrompt.Network.getRobuxUpsellSuggestions)
local AnalyticsModule = require(PurchasePrompt.Services.Analytics)
local NetworkModule = require(PurchasePrompt.Services.Network)
local GetPaymentPlatformModule = require(PurchasePrompt.Utils.getPaymentPlatform)
local _ = require(PurchasePrompt.Utils.getPaymentFromPlatformLegacy)
local _ = require(PurchasePrompt.Utils.getHasAmazonUserAgent)
local GetFFlagRespectBalanceInfoForBundleUpsellInStudioModule = require(PurchasePrompt.Flags.GetFFlagRespectBalanceInfoForBundleUpsellInStudio)
local ThunkModule = require(PurchasePrompt.Thunk)
local GetPurchaseSurfaceModule = require(PurchasePrompt.Utils.getPurchaseSurface)
local _ = require(PurchasePrompt.Flags.GetFFlagEnableLuobuInGameUpsell)
local GetFFlagEnableInsufficientRobuxForBundleUpsellFixModule = require(PurchasePrompt.Flags.GetFFlagEnableInsufficientRobuxForBundleUpsellFix)
local FFlagEnableUnifiedProductPurchaseFlow = require(PurchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local SetIsUserEligibleForUnifiedPurchaseFlowModule = require(PurchasePrompt.Actions.SetIsUserEligibleForUnifiedPurchaseFlow)
local SetPurchaseAnalyticsMetadataModule = require(PurchasePrompt.Actions.SetPurchaseAnalyticsMetadata)
local GetFFlagFixLimitedBundleResalePrerequisiteModule = require(PurchasePrompt.Flags.GetFFlagFixLimitedBundleResalePrerequisite)
local GetProductTypeFromRequestTypeModule = require(PurchasePrompt.Utils.getProductTypeFromRequestType)
local MeetsBundlePrerequisitesModule = require(PurchasePrompt.Utils.meetsBundlePrerequisites)
local SetPostPurchaseActionsModule = require(PurchasePrompt.Actions.SetPostPurchaseActions)
local FFlagUnifiedPurchaseGamepassAddProductUniverseId = require(PurchasePrompt.Parent.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId
local FFlagUpdatePriceTelemetry = require(PurchasePrompt.Parent.SharedFlags).FFlagUpdatePriceTelemetry
local SelectPriceModule = require(PurchasePrompt.Selectors.selectPrice)
local _ = require(PurchasePrompt.Parent.RobloxSubscriptionPurchaseApp)
local SetRobloxSubscriptionProductsModule = require(PurchasePrompt.Actions.SetRobloxSubscriptionProducts)
local FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal = require(PurchasePrompt.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal

local function _(p1, p2)
	return p1 and p1.product ~= nil and (if p2 and p1.product.premiumPricing ~= nil then p1.product.premiumPricing.premiumPriceInRobux else p1.product.priceInRobux) or 0
end

local function meetsBundlePrerequisites(p1, p2, p3, p4)
	-- upvalues: PurchaseErrorModule (copy), Players (copy)
	local CollectibleItemDetail = p1.collectibleItemDetail
	local IsNotCollectibleItemIdMatch: boolean = CollectibleItemDetail and (CollectibleItemDetail.collectibleItemId ~= nil and CollectibleItemDetail.collectibleItemId ~= "")
	local IsLimited: boolean = CollectibleItemDetail and (CollectibleItemDetail.collectibleItemType ~= nil and CollectibleItemDetail.collectibleItemType == "Limited")
	
	if IsNotCollectibleItemIdMatch then
		if not IsLimited and p4 then
			return false, PurchaseErrorModule.AlreadyOwn
		end
	elseif p4 then
		return false, PurchaseErrorModule.AlreadyOwn
	end
	if not (if IsNotCollectibleItemIdMatch then CollectibleItemDetail.saleStatus == "OnSale" else p1.product and p1.product.isForSale) then
		return false, PurchaseErrorModule.NotForSale
	end
	if p3 ~= nil and p2.robux ~= nil and p2.robux < p3 then
		return false, PurchaseErrorModule.NotEnoughRobux
	end
	if p1.itemRestrictions ~= nil then
		for _, itemRestriction in p1.itemRestrictions do
			if itemRestriction == "ThirteenPlus" then
				if not Players.LocalPlayer:GetUnder13() then break end
				return false, PurchaseErrorModule.Under13
			else
				continue
			end
		end
	end
	return true, nil
end

local list = { AnalyticsModule, NetworkModule }

return function(_, p5, p6, p7, p8, p9, p10, p11)
	-- upvalues: ThunkModule (copy), list (copy), AnalyticsModule (copy), NetworkModule (copy), BundleProductInfoReceivedModule (copy), AccountInfoReceivedModule (copy), BalanceInfoRecievedModule (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), SetIsUserEligibleForUnifiedPurchaseFlowModule (copy), SetPurchaseAnalyticsMetadataModule (copy), GetPurchaseSurfaceModule (copy), GetProductTypeFromRequestTypeModule (copy), FFlagUpdatePriceTelemetry (copy), SelectPriceModule (copy), FFlagUnifiedPurchaseGamepassAddProductUniverseId (copy), FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), SetRobloxSubscriptionProductsModule (copy), GetFFlagFixLimitedBundleResalePrerequisiteModule (copy), MeetsBundlePrerequisitesModule (copy), meetsBundlePrerequisites (copy), UserInputService (copy), GetUpsellFlowModule (copy), PurchaseErrorModule (copy), RunService (copy), GetFFlagRespectBalanceInfoForBundleUpsellInStudioModule (copy), GetFFlagEnableInsufficientRobuxForBundleUpsellFixModule (copy), UpsellFlowModule (copy), SetPromptStateModule (copy), PromptStateModule (copy), SetPurchaseFlowModule (copy), PurchaseFlowModule (copy), SetPostPurchaseActionsModule (copy), GetPaymentPlatformModule (copy), GetRobuxUpsellSuggestionsModule (copy), PromptNativeUpsellSuggestionsModule (copy), ErrorOccurredModule (copy)
	return ThunkModule.new(script.Name, list, function(p12, p13)
		-- upvalues: AnalyticsModule (upval), NetworkModule (upval), BundleProductInfoReceivedModule (upval), p5 (copy), AccountInfoReceivedModule (upval), p6 (copy), BalanceInfoRecievedModule (upval), p7 (copy), FFlagEnableUnifiedProductPurchaseFlow (upval), p10 (copy), SetIsUserEligibleForUnifiedPurchaseFlowModule (upval), SetPurchaseAnalyticsMetadataModule (upval), GetPurchaseSurfaceModule (upval), GetProductTypeFromRequestTypeModule (upval), FFlagUpdatePriceTelemetry (upval), SelectPriceModule (upval), p8 (ref), FFlagUnifiedPurchaseGamepassAddProductUniverseId (upval), FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (upval), p11 (copy), SetRobloxSubscriptionProductsModule (upval), GetFFlagFixLimitedBundleResalePrerequisiteModule (upval), MeetsBundlePrerequisitesModule (upval), p9 (copy), meetsBundlePrerequisites (upval), UserInputService (upval), GetUpsellFlowModule (upval), PurchaseErrorModule (upval), RunService (upval), GetFFlagRespectBalanceInfoForBundleUpsellInStudioModule (upval), GetFFlagEnableInsufficientRobuxForBundleUpsellFixModule (upval), UpsellFlowModule (upval), SetPromptStateModule (upval), PromptStateModule (upval), SetPurchaseFlowModule (upval), PurchaseFlowModule (upval), SetPostPurchaseActionsModule (upval), GetPaymentPlatformModule (upval), GetRobuxUpsellSuggestionsModule (upval), PromptNativeUpsellSuggestionsModule (upval), ErrorOccurredModule (upval)
		local _ = p12:getState()
		local _ = p13[AnalyticsModule]
		local _ = p13[NetworkModule]
		p12:dispatch(BundleProductInfoReceivedModule(p5))
		p12:dispatch(AccountInfoReceivedModule(p6))
		p12:dispatch(BalanceInfoRecievedModule(p7))
		
		if FFlagEnableUnifiedProductPurchaseFlow then
			if p10 then
				p12:dispatch(SetIsUserEligibleForUnifiedPurchaseFlowModule(true))
				local State = p12:getState()
				p12:dispatch(SetPurchaseAnalyticsMetadataModule({
					purchaseFlowUUID = State.purchaseFlowUUID,
					surface = GetPurchaseSurfaceModule(State.purchaseAnalyticsMetadata),
					productType = GetProductTypeFromRequestTypeModule(State.promptRequest.requestType),
					productId = State.productInfo.productId,
					productTargetId = State.productInfo.productTargetId,
					saleLocationUniverseId = game.GameId or 0,
					price = if FFlagUpdatePriceTelemetry then SelectPriceModule(State).priceInRobux elseif State.productInfo.price then State.productInfo.price else p8,
					productUniverseId = if FFlagUnifiedPurchaseGamepassAddProductUniverseId then State.purchaseAnalyticsMetadata.productUniverseId else nil,
					userRobuxBalance = State.accountInfo.balance
				}))
				
				if FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal and p11 then
					p12:dispatch(SetRobloxSubscriptionProductsModule(p11))
				end
			else
				p12:dispatch(SetIsUserEligibleForUnifiedPurchaseFlowModule(false))
			end
		end
		if p8 == nil then
			local IsPremium = p6.isPremium
			p8 = p5 and p5.product ~= nil and (if IsPremium and p5.product.premiumPricing ~= nil then p5.product.premiumPricing.premiumPriceInRobux else p5.product.priceInRobux) or 0
		end
		local MeetsBundlePrerequisitesModuleResult = nil
		local MeetsBundlePrerequisitesModuleResult2 = nil
		if GetFFlagFixLimitedBundleResalePrerequisiteModule() then
			MeetsBundlePrerequisitesModuleResult, MeetsBundlePrerequisitesModuleResult2 = MeetsBundlePrerequisitesModule(p5, p7, p8, p9)
		else
			MeetsBundlePrerequisitesModuleResult, MeetsBundlePrerequisitesModuleResult2 = meetsBundlePrerequisites(p5, p7, p8, p9)
		end
		local v1 = p8
		local Platform = UserInputService:GetPlatform()
		local UpsellFlowModule1 = GetUpsellFlowModule(Platform)
		local IsMeetsBundlePrerequisitesModuleResultMatch = MeetsBundlePrerequisitesModuleResult2 == PurchaseErrorModule.NotEnoughRobux
		
		if RunService:IsStudio() and GetFFlagRespectBalanceInfoForBundleUpsellInStudioModule() and IsMeetsBundlePrerequisitesModuleResultMatch then
			IsMeetsBundlePrerequisitesModuleResultMatch = v1 > p7.robux
			
			if not MeetsBundlePrerequisitesModuleResult then
				MeetsBundlePrerequisitesModuleResult = not IsMeetsBundlePrerequisitesModuleResultMatch
			end
		end
		if MeetsBundlePrerequisitesModuleResult then
			return p12:dispatch(SetPromptStateModule(PromptStateModule.PromptPurchase))
		end
		if not IsMeetsBundlePrerequisitesModuleResultMatch then
			return p12:dispatch(ErrorOccurredModule(MeetsBundlePrerequisitesModuleResult2))
		end
		if not GetFFlagEnableInsufficientRobuxForBundleUpsellFixModule() and UpsellFlowModule1 == UpsellFlowModule.Web then
			return p12:dispatch(SetPromptStateModule(PromptStateModule.RobuxUpsell))
		end
		if FFlagEnableUnifiedProductPurchaseFlow and p10 then
			p12:dispatch(SetPurchaseFlowModule(PurchaseFlowModule.RobuxUpsellV2))
		end
		if FFlagEnableUnifiedProductPurchaseFlow and p10 then
			p12:dispatch(SetPostPurchaseActionsModule({}))
		end
		local _ = v1 - p7.robux
		local _ = p6.isPremium
		
		return GetRobuxUpsellSuggestionsModule(v1, p7.robux, (GetPaymentPlatformModule(Platform))):andThen(function(Result)
			-- upvalues: p12 (copy), PromptNativeUpsellSuggestionsModule (upval)
			p12:dispatch(PromptNativeUpsellSuggestionsModule(Result.products, 1, Result.virtualItemBadgeType))
		end, function()
			-- upvalues: p12 (copy), ErrorOccurredModule (upval), PurchaseErrorModule (upval)
			p12:dispatch(ErrorOccurredModule(PurchaseErrorModule.NotEnoughRobuxXbox))
		end)
	end)
end