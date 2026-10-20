local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local UserInputService = game:GetService("UserInputService")
local SetPurchaseFlowModule = require(PurchasePrompt.Actions.SetPurchaseFlow)
local SetPromptStateModule = require(PurchasePrompt.Actions.SetPromptState)
local ProductInfoReceivedModule = require(PurchasePrompt.Actions.ProductInfoReceived)
local AccountInfoReceivedModule = require(PurchasePrompt.Actions.AccountInfoReceived)
local BalanceInfoRecievedModule = require(PurchasePrompt.Actions.BalanceInfoRecieved)
local PromptNativeUpsellSuggestionsModule = require(PurchasePrompt.Actions.PromptNativeUpsellSuggestions)
local ErrorOccurredModule = require(PurchasePrompt.Actions.ErrorOccurred)
local CompleteRequestModule = require(PurchasePrompt.Actions.CompleteRequest)
local PurchaseFlowModule = require(PurchasePrompt.Enums.PurchaseFlow)
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local PaymentPlatformModule = require(PurchasePrompt.Enums.PaymentPlatform)
local RequestTypeModule = require(PurchasePrompt.Enums.RequestType)
local _ = require(PurchasePrompt.Models.RobuxUpsell)
local GetRobuxUpsellSuggestionsModule = require(PurchasePrompt.Network.getRobuxUpsellSuggestions)
local ABTestModule = require(PurchasePrompt.Services.ABTest)
local AnalyticsModule = require(PurchasePrompt.Services.Analytics)
local ExternalSettingsModule = require(PurchasePrompt.Services.ExternalSettings)
local NetworkModule = require(PurchasePrompt.Services.Network)
local CounterModule = require(PurchasePrompt.Enums.Counter)
local SendCounterModule = require(PurchasePrompt.Thunks.sendCounter)
local CompleteRequestModule1 = require(PurchasePrompt.Thunks.completeRequest)
local MeetsPrerequisitesModule = require(PurchasePrompt.Utils.meetsPrerequisites)
local IsEligibleForRobuxUpsellPlusButtonModule = require(PurchasePrompt.Utils.isEligibleForRobuxUpsellPlusButton)
local GetPlayerProductInfoPriceModule = require(PurchasePrompt.Utils.getPlayerProductInfoPrice)
local GetPaymentPlatformModule = require(PurchasePrompt.Utils.getPaymentPlatform)
local _ = require(PurchasePrompt.Utils.getPaymentFromPlatformLegacy)
local _ = require(PurchasePrompt.Utils.getHasAmazonUserAgent)
local HasPendingRequestModule = require(PurchasePrompt.Utils.hasPendingRequest)
local SetPurchaseAnalyticsMetadataModule = require(PurchasePrompt.Actions.SetPurchaseAnalyticsMetadata)
local GetPurchaseSurfaceModule = require(PurchasePrompt.Utils.getPurchaseSurface)
local ThunkModule = require(PurchasePrompt.Thunk)
local GetProductTypeFromRequestTypeModule = require(PurchasePrompt.Utils.getProductTypeFromRequestType)
local _ = require(PurchasePrompt.Flags.GetFFlagEnableLuobuInGameUpsell)
local GetFStringLargerRobuxUpsellIxpLayerFunction = require(Parent.SharedFlags).GetFStringLargerRobuxUpsellIxpLayer
local LargerRobuxUpsellTestModule = require(PurchasePrompt.Flags.LargerRobuxUpsellTest)
local SetIsUserEligibleForUnifiedPurchaseFlowModule = require(PurchasePrompt.Actions.SetIsUserEligibleForUnifiedPurchaseFlow)
local SetPostPurchaseActionsModule = require(PurchasePrompt.Actions.SetPostPurchaseActions)
local FFlagUnifiedPurchaseGamepassAddProductUniverseId = require(Parent.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId
local FFlagUpdatePriceTelemetry = require(Parent.SharedFlags).FFlagUpdatePriceTelemetry
local SelectPriceModule = require(PurchasePrompt.Selectors.selectPrice)
local _ = require(Parent.RobloxSubscriptionPurchaseApp)
local SetRobloxSubscriptionProductsModule = require(PurchasePrompt.Actions.SetRobloxSubscriptionProducts)
local SelectCartPricingOverrideModule = require(PurchasePrompt.Selectors.selectCartPricingOverride)
local list = {
	ABTestModule,
	AnalyticsModule,
	ExternalSettingsModule,
	NetworkModule
}
local FFlagEnableUpsellSuggestionsAnalyticsId = require(Parent.SharedFlags).FFlagEnableUpsellSuggestionsAnalyticsId

local function handleSuccessfulUpsellSuggestions(p1, p2)
	-- upvalues: HasPendingRequestModule (copy), PromptNativeUpsellSuggestionsModule (copy), SendCounterModule (copy), CounterModule (copy)
	if HasPendingRequestModule(p1:getState()) then
		p1:dispatch(PromptNativeUpsellSuggestionsModule(p2.products, 1, p2.virtualItemBadgeType, p2.experimentVariant))
		p1:dispatch(SendCounterModule(CounterModule.UpsellModalShown))
		
		return
	end
end

local function handleFailedUpsellProduct(p1, _)
	-- upvalues: HasPendingRequestModule (copy), PurchaseFlowModule (copy), SetPromptStateModule (copy), PromptStateModule (copy), SendCounterModule (copy), CounterModule (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy)
	if not HasPendingRequestModule(p1:getState()) then return end
	if p1:getState().purchaseFlow == PurchaseFlowModule.LargeRobuxUpsell then
		p1:dispatch(SetPromptStateModule(PromptStateModule.LargeRobuxUpsell))
		p1:dispatch(SendCounterModule(CounterModule.UpsellModalShown))
		
		return
	else
		p1:dispatch(ErrorOccurredModule(PurchaseErrorModule.NotEnoughRobuxXbox))
		p1:dispatch(SendCounterModule(CounterModule.UpsellGenericModalShown))
	end
end

return function(Player, p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: ThunkModule (copy), list (copy), ABTestModule (copy), AnalyticsModule (copy), ExternalSettingsModule (copy), NetworkModule (copy), ProductInfoReceivedModule (copy), AccountInfoReceivedModule (copy), BalanceInfoRecievedModule (copy), SetIsUserEligibleForUnifiedPurchaseFlowModule (copy), SetPurchaseAnalyticsMetadataModule (copy), GetPurchaseSurfaceModule (copy), GetProductTypeFromRequestTypeModule (copy), FFlagUpdatePriceTelemetry (copy), SelectPriceModule (copy), FFlagUnifiedPurchaseGamepassAddProductUniverseId (copy), SetRobloxSubscriptionProductsModule (copy), MeetsPrerequisitesModule (copy), PurchaseErrorModule (copy), CompleteRequestModule (copy), ErrorOccurredModule (copy), GetPlayerProductInfoPriceModule (copy), UserInputService (copy), SelectCartPricingOverrideModule (copy), GetPaymentPlatformModule (copy), PaymentPlatformModule (copy), SetPurchaseFlowModule (copy), PurchaseFlowModule (copy), SetPostPurchaseActionsModule (copy), LargerRobuxUpsellTestModule (copy), GetFStringLargerRobuxUpsellIxpLayerFunction (copy), FFlagEnableUpsellSuggestionsAnalyticsId (copy), GetRobuxUpsellSuggestionsModule (copy), IsEligibleForRobuxUpsellPlusButtonModule (copy), handleSuccessfulUpsellSuggestions (copy), handleFailedUpsellProduct (copy), RequestTypeModule (copy), CompleteRequestModule1 (copy), SetPromptStateModule (copy), PromptStateModule (copy)
	return ThunkModule.new(script.Name, list, function(p8, p9)
		-- upvalues: ABTestModule (upval), AnalyticsModule (upval), ExternalSettingsModule (upval), NetworkModule (upval), ProductInfoReceivedModule (upval), Player (copy), AccountInfoReceivedModule (upval), p1 (copy), BalanceInfoRecievedModule (upval), p2 (copy), p6 (copy), SetIsUserEligibleForUnifiedPurchaseFlowModule (upval), SetPurchaseAnalyticsMetadataModule (upval), GetPurchaseSurfaceModule (upval), GetProductTypeFromRequestTypeModule (upval), FFlagUpdatePriceTelemetry (upval), SelectPriceModule (upval), p5 (copy), FFlagUnifiedPurchaseGamepassAddProductUniverseId (upval), p7 (copy), SetRobloxSubscriptionProductsModule (upval), p4 (copy), MeetsPrerequisitesModule (upval), p3 (copy), PurchaseErrorModule (upval), CompleteRequestModule (upval), ErrorOccurredModule (upval), GetPlayerProductInfoPriceModule (upval), UserInputService (upval), SelectCartPricingOverrideModule (upval), GetPaymentPlatformModule (upval), PaymentPlatformModule (upval), SetPurchaseFlowModule (upval), PurchaseFlowModule (upval), SetPostPurchaseActionsModule (upval), LargerRobuxUpsellTestModule (upval), GetFStringLargerRobuxUpsellIxpLayerFunction (upval), FFlagEnableUpsellSuggestionsAnalyticsId (upval), GetRobuxUpsellSuggestionsModule (upval), IsEligibleForRobuxUpsellPlusButtonModule (upval), handleSuccessfulUpsellSuggestions (upval), handleFailedUpsellProduct (upval), RequestTypeModule (upval), CompleteRequestModule1 (upval), SetPromptStateModule (upval), PromptStateModule (upval)
		local State = p8:getState()
		local v1 = p9[ABTestModule]
		local v2 = p9[AnalyticsModule]
		local v3 = p9[ExternalSettingsModule]
		local _ = p9[NetworkModule]
		p8:dispatch(ProductInfoReceivedModule(Player))
		p8:dispatch(AccountInfoReceivedModule(p1))
		p8:dispatch(BalanceInfoRecievedModule(p2))
		
		if p6 then
			p8:dispatch(SetIsUserEligibleForUnifiedPurchaseFlowModule(true))
			local State1 = p8:getState()
			p8:dispatch(SetPurchaseAnalyticsMetadataModule({
				purchaseFlowUUID = State1.purchaseFlowUUID,
				surface = GetPurchaseSurfaceModule(State1.purchaseAnalyticsMetadata),
				productType = GetProductTypeFromRequestTypeModule(State1.promptRequest.requestType),
				productId = State1.productInfo.productId,
				productTargetId = State1.productInfo.productTargetId,
				saleLocationUniverseId = game.GameId or 0,
				price = if FFlagUpdatePriceTelemetry then SelectPriceModule(State1).priceInRobux elseif State1.productInfo.price then State1.productInfo.price else p5,
				productUniverseId = if FFlagUnifiedPurchaseGamepassAddProductUniverseId then State1.purchaseAnalyticsMetadata.productUniverseId else nil,
				userRobuxBalance = State1.accountInfo.balance
			}))
			
			if p7 then
				p8:dispatch(SetRobloxSubscriptionProductsModule(p7))
			end
		else
			p8:dispatch(SetIsUserEligibleForUnifiedPurchaseFlowModule(false))
		end
		local MeetsPrerequisitesModuleResult, MeetsPrerequisitesModuleResult2 = MeetsPrerequisitesModule(Player, p3, if v3.getFlagBypassThirdPartySettingForRobloxPurchase() then not p4 and (v3.getLuaUseThirdPartyPermissions() or v3.getFlagRestrictSales2()) else v3.getLuaUseThirdPartyPermissions() or v3.getFlagRestrictSales2(), v3, p5)
		
		if not MeetsPrerequisitesModuleResult then
			return if v3.isStudio() or MeetsPrerequisitesModuleResult2 ~= PurchaseErrorModule.ThirdPartyDisabled then p8:dispatch(ErrorOccurredModule(MeetsPrerequisitesModuleResult2)) else p8:dispatch(CompleteRequestModule())
		end
		local Robux = p2.robux
		local HasFailed = p2.hasFailed
		local PlayerProductInfoPriceModule = if p5 == nil then GetPlayerProductInfoPriceModule(Player, p1.isPremium) else p5
		local Platform = UserInputService:GetPlatform()
		local SelectCartPricingOverrideModuleResult = SelectCartPricingOverrideModule((p8:getState()))
		local PlayerProductInfoPriceModule1 = if SelectCartPricingOverrideModuleResult == nil then PlayerProductInfoPriceModule else SelectCartPricingOverrideModuleResult.priceInRobux
		
		if HasFailed or Robux >= PlayerProductInfoPriceModule1 then
			if PlayerProductInfoPriceModule <= Robux and State.promptRequest.requestType == RequestTypeModule.RobuxUpsell then
				return p8:dispatch(CompleteRequestModule1())
			end
			if State.requestType ~= RequestTypeModule.AvatarCreationFee then
				v2.signalProductPurchaseShown(Player.productId, State.requestType)
			end
			return p8:dispatch(SetPromptStateModule(PromptStateModule.PromptPurchase))
		else
			if v3.getFFlagDisableRobuxUpsell() then
				return p8:dispatch(ErrorOccurredModule(PurchaseErrorModule.NotEnoughRobuxNoUpsell))
			end
			local PaymentPlatformModule1 = GetPaymentPlatformModule(Platform)
			
			if p6 or PaymentPlatformModule1 ~= PaymentPlatformModule.Web then
				p8:dispatch(SetPurchaseFlowModule(PurchaseFlowModule.RobuxUpsellV2))
			end
			if p6 then
				p8:dispatch(SetPostPurchaseActionsModule({}))
			end
			if LargerRobuxUpsellTestModule.isEnabled() then
				local FStringLargerRobuxUpsellIxpLayer = GetFStringLargerRobuxUpsellIxpLayerFunction()
				local LayerData = v1.getLayerData(FStringLargerRobuxUpsellIxpLayer)
				
				if LayerData then
					v1.logUserLayerExposure(FStringLargerRobuxUpsellIxpLayer)
					
					if LargerRobuxUpsellTestModule.isUserEnrolled(LayerData) then
						p8:dispatch(SetPurchaseFlowModule(PurchaseFlowModule.LargeRobuxUpsell))
					end
				end
			end
			local State2 = p8:getState()
			
			return GetRobuxUpsellSuggestionsModule(PlayerProductInfoPriceModule, Robux, PaymentPlatformModule1, IsEligibleForRobuxUpsellPlusButtonModule(State2.isUserEligibleForUnifiedPurchaseFlow, State2.robloxSubscriptionProducts, State2.productPayload, SelectPriceModule(State2), State2.promptRequest.requestType), Player.ProductId, Player.DisplayName, game.GameId, FFlagEnableUpsellSuggestionsAnalyticsId and State.purchaseFlowUUID or nil):andThen(function(Result)
				-- upvalues: handleSuccessfulUpsellSuggestions (upval), p8 (copy)
				return handleSuccessfulUpsellSuggestions(p8, Result)
			end, function()
				-- upvalues: handleFailedUpsellProduct (upval), p8 (copy), State (copy)
				return handleFailedUpsellProduct(p8, State)
			end)
		end
	end)
end