local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
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
local PurchaseFlowModule = require(PurchasePrompt.Enums.PurchaseFlow)
local _ = require(PurchasePrompt.Models.RobuxUpsell)
local GetRobuxUpsellSuggestionsModule = require(PurchasePrompt.Network.getRobuxUpsellSuggestions)
local AnalyticsModule = require(PurchasePrompt.Services.Analytics)
local NetworkModule = require(PurchasePrompt.Services.Network)
local GetPaymentPlatformModule = require(PurchasePrompt.Utils.getPaymentPlatform)
local _ = require(PurchasePrompt.Utils.getPaymentFromPlatformLegacy)
local _ = require(PurchasePrompt.Utils.getHasAmazonUserAgent)
local IsEligibleForRobuxUpsellPlusButtonModule = require(PurchasePrompt.Utils.isEligibleForRobuxUpsellPlusButton)
local GetFFlagRespectBalanceInfoForBundleUpsellInStudioModule = require(PurchasePrompt.Flags.GetFFlagRespectBalanceInfoForBundleUpsellInStudio)
local ThunkModule = require(PurchasePrompt.Thunk)
local GetPurchaseSurfaceModule = require(PurchasePrompt.Utils.getPurchaseSurface)
local _ = require(PurchasePrompt.Flags.GetFFlagEnableLuobuInGameUpsell)
local SetIsUserEligibleForUnifiedPurchaseFlowModule = require(PurchasePrompt.Actions.SetIsUserEligibleForUnifiedPurchaseFlow)
local SetPurchaseAnalyticsMetadataModule = require(PurchasePrompt.Actions.SetPurchaseAnalyticsMetadata)
local GetProductTypeFromRequestTypeModule = require(PurchasePrompt.Utils.getProductTypeFromRequestType)
local MeetsBundlePrerequisitesModule = require(PurchasePrompt.Utils.meetsBundlePrerequisites)
local SetPostPurchaseActionsModule = require(PurchasePrompt.Actions.SetPostPurchaseActions)
local FFlagUpdatePriceTelemetry = require(PurchasePrompt.Parent.SharedFlags).FFlagUpdatePriceTelemetry
local SelectPriceModule = require(PurchasePrompt.Selectors.selectPrice)
local SelectCartPricingOverrideModule = require(PurchasePrompt.Selectors.selectCartPricingOverride)
local _ = require(PurchasePrompt.Parent.RobloxSubscriptionPurchaseApp)
local SetRobloxSubscriptionProductsModule = require(PurchasePrompt.Actions.SetRobloxSubscriptionProducts)

local function _(p1, p2)
	return p1 and p1.product ~= nil and (if p2 and p1.product.premiumPricing ~= nil then p1.product.premiumPricing.premiumPriceInRobux else p1.product.priceInRobux) or 0
end

local list = { AnalyticsModule, NetworkModule }

return function(_, p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: ThunkModule (copy), list (copy), AnalyticsModule (copy), NetworkModule (copy), BundleProductInfoReceivedModule (copy), AccountInfoReceivedModule (copy), BalanceInfoRecievedModule (copy), SetIsUserEligibleForUnifiedPurchaseFlowModule (copy), SetPurchaseAnalyticsMetadataModule (copy), GetPurchaseSurfaceModule (copy), GetProductTypeFromRequestTypeModule (copy), FFlagUpdatePriceTelemetry (copy), SelectPriceModule (copy), SetRobloxSubscriptionProductsModule (copy), SelectCartPricingOverrideModule (copy), MeetsBundlePrerequisitesModule (copy), UserInputService (copy), PurchaseErrorModule (copy), RunService (copy), GetFFlagRespectBalanceInfoForBundleUpsellInStudioModule (copy), SetPurchaseFlowModule (copy), PurchaseFlowModule (copy), SetPostPurchaseActionsModule (copy), GetPaymentPlatformModule (copy), GetRobuxUpsellSuggestionsModule (copy), IsEligibleForRobuxUpsellPlusButtonModule (copy), PromptNativeUpsellSuggestionsModule (copy), ErrorOccurredModule (copy), SetPromptStateModule (copy), PromptStateModule (copy)
	return ThunkModule.new(script.Name, list, function(p8, p9)
		-- upvalues: AnalyticsModule (upval), NetworkModule (upval), BundleProductInfoReceivedModule (upval), p1 (copy), AccountInfoReceivedModule (upval), p2 (copy), BalanceInfoRecievedModule (upval), p3 (copy), p6 (copy), SetIsUserEligibleForUnifiedPurchaseFlowModule (upval), SetPurchaseAnalyticsMetadataModule (upval), GetPurchaseSurfaceModule (upval), GetProductTypeFromRequestTypeModule (upval), FFlagUpdatePriceTelemetry (upval), SelectPriceModule (upval), p4 (ref), p7 (copy), SetRobloxSubscriptionProductsModule (upval), SelectCartPricingOverrideModule (upval), MeetsBundlePrerequisitesModule (upval), p5 (copy), UserInputService (upval), PurchaseErrorModule (upval), RunService (upval), GetFFlagRespectBalanceInfoForBundleUpsellInStudioModule (upval), SetPurchaseFlowModule (upval), PurchaseFlowModule (upval), SetPostPurchaseActionsModule (upval), GetPaymentPlatformModule (upval), GetRobuxUpsellSuggestionsModule (upval), IsEligibleForRobuxUpsellPlusButtonModule (upval), PromptNativeUpsellSuggestionsModule (upval), ErrorOccurredModule (upval), SetPromptStateModule (upval), PromptStateModule (upval)
		local _ = p8:getState()
		local _ = p9[AnalyticsModule]
		local _ = p9[NetworkModule]
		p8:dispatch(BundleProductInfoReceivedModule(p1))
		p8:dispatch(AccountInfoReceivedModule(p2))
		p8:dispatch(BalanceInfoRecievedModule(p3))
		
		if p6 then
			p8:dispatch(SetIsUserEligibleForUnifiedPurchaseFlowModule(true))
			local State = p8:getState()
			p8:dispatch(SetPurchaseAnalyticsMetadataModule({
				purchaseFlowUUID = State.purchaseFlowUUID,
				surface = GetPurchaseSurfaceModule(State.purchaseAnalyticsMetadata),
				productType = GetProductTypeFromRequestTypeModule(State.promptRequest.requestType),
				productId = State.productInfo.productId,
				productTargetId = State.productInfo.productTargetId,
				saleLocationUniverseId = game.GameId or 0,
				price = if FFlagUpdatePriceTelemetry then SelectPriceModule(State).priceInRobux elseif State.productInfo.price then State.productInfo.price else p4,
				productUniverseId = State.purchaseAnalyticsMetadata.productUniverseId,
				userRobuxBalance = State.accountInfo.balance
			}))
			
			if p7 then
				p8:dispatch(SetRobloxSubscriptionProductsModule(p7))
			end
		else
			p8:dispatch(SetIsUserEligibleForUnifiedPurchaseFlowModule(false))
		end
		if p4 == nil then
			local IsPremium = p2.isPremium
			p4 = p1 and p1.product ~= nil and (if IsPremium and p1.product.premiumPricing ~= nil then p1.product.premiumPricing.premiumPriceInRobux else p1.product.priceInRobux) or 0
		end
		local SelectCartPricingOverrideModuleResult = SelectCartPricingOverrideModule(p8:getState())
		local MeetsBundlePrerequisitesModuleResult, MeetsBundlePrerequisitesModuleResult2 = MeetsBundlePrerequisitesModule(p1, p3, if SelectCartPricingOverrideModuleResult == nil then p4 else SelectCartPricingOverrideModuleResult.priceInRobux, p5)
		local v1 = p4
		local Platform = UserInputService:GetPlatform()
		local IsMeetsBundlePrerequisitesModuleResultMatch = MeetsBundlePrerequisitesModuleResult2 == PurchaseErrorModule.NotEnoughRobux
		
		if RunService:IsStudio() and GetFFlagRespectBalanceInfoForBundleUpsellInStudioModule() and IsMeetsBundlePrerequisitesModuleResultMatch then
			IsMeetsBundlePrerequisitesModuleResultMatch = v1 > p3.robux
			
			if not MeetsBundlePrerequisitesModuleResult then
				MeetsBundlePrerequisitesModuleResult = not IsMeetsBundlePrerequisitesModuleResultMatch
			end
		end
		if MeetsBundlePrerequisitesModuleResult then
			return p8:dispatch(SetPromptStateModule(PromptStateModule.PromptPurchase))
		end
		if not IsMeetsBundlePrerequisitesModuleResultMatch then
			return p8:dispatch(ErrorOccurredModule(MeetsBundlePrerequisitesModuleResult2))
		end
		if p6 then
			p8:dispatch(SetPurchaseFlowModule(PurchaseFlowModule.RobuxUpsellV2))
		end
		if p6 then
			p8:dispatch(SetPostPurchaseActionsModule({}))
		end
		local _ = v1 - p3.robux
		local _ = p2.isPremium
		local State = p8:getState()
		
		return GetRobuxUpsellSuggestionsModule(v1, p3.robux, GetPaymentPlatformModule(Platform), IsEligibleForRobuxUpsellPlusButtonModule(State.isUserEligibleForUnifiedPurchaseFlow, State.robloxSubscriptionProducts, State.productPayload, SelectPriceModule(State), State.promptRequest.requestType)):andThen(function(Result)
			-- upvalues: p8 (copy), PromptNativeUpsellSuggestionsModule (upval)
			p8:dispatch(PromptNativeUpsellSuggestionsModule(Result.products, 1, Result.virtualItemBadgeType, Result.experimentVariant))
		end, function()
			-- upvalues: p8 (copy), ErrorOccurredModule (upval), PurchaseErrorModule (upval)
			p8:dispatch(ErrorOccurredModule(PurchaseErrorModule.NotEnoughRobuxXbox))
		end)
	end)
end