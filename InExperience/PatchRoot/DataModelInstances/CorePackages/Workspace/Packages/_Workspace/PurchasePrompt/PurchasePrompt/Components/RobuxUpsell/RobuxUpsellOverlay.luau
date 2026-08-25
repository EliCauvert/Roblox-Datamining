local playersService = game:GetService("Players")
local contextActionService = game:GetService("ContextActionService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local purchasePromptDepsModule = require(parent.PurchasePromptDeps)
local roact = purchasePromptDepsModule.Roact
local IAPExperience = purchasePromptDepsModule.IAPExperience
local robuxUpsellFlow = IAPExperience.PurchaseFlow.RobuxUpsellFlow
local robuxUpsellFlowState = IAPExperience.PurchaseFlow.RobuxUpsellFlowState
local u13ConfirmType = IAPExperience.PurchaseFlow.U13ConfirmType
local purchaseErrorType = IAPExperience.PurchaseFlow.PurchaseErrorType
local _ = require(purchasePrompt.Models.RobuxUpsell)
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local VPCModalTypeModule = require(purchasePrompt.Enums.VPCModalType)
local appContextModule = require(purchasePrompt.Utils.AppContext)
local name = roact.PureComponent:extend(script.Name)
local getFFlagDisablePurchasePromptFunctionForMaquettesModule = require(purchasePrompt.Flags.GetFFlagDisablePurchasePromptFunctionForMaquettes)
local paymentPlatformModule = require(purchasePrompt.Enums.PaymentPlatform)
local getPaymentPlatformModule = require(purchasePrompt.Utils.getPaymentPlatform)
local getUnifiedPurchaseModalTypeModule = require(purchasePrompt.Utils.getUnifiedPurchaseModalType)
local emitPerformanceMetricsModule = require(purchasePrompt.Utils.emitPerformanceMetrics)
local fFlagEnableUnifiedProductPurchaseFlow = require(parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local externalSettingsModule = require(purchasePrompt.Services.ExternalSettings)
local unifiedPurchaseTelemetryModule = require(purchasePrompt.Events.UnifiedPurchaseTelemetry)
local logUnifiedPurchaseTelemetryCounterModule = require(purchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local sendUnifiedPurchaseEventLogModule = require(purchasePrompt.Utils.sendUnifiedPurchaseEventLog)
local deriveUnifiedPurchaseEventRobuxPriceModule = require(purchasePrompt.Utils.deriveUnifiedPurchaseEventRobuxPrice)
local unifiedPurchaseEventNameEnumModule = require(purchasePrompt.Enums.UnifiedPurchaseEventNameEnum)
local constantsModule = require(purchasePrompt.Misc.Constants)
local httpService = game:GetService("HttpService")
local fFlagFixCountersForUpsellModalShownModule = require(purchasePrompt.Flags.FFlagFixCountersForUpsellModalShown)
local fFlagUnifiedPurchaseGamepassAddProductUniverseId = require(parent.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId
local fFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local fFlagAddPerformanceMetricsToUnifiedPurchaseModal = require(parent.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal
local fFlagEnableDiscountInfoInUnifiedPurchaseModal = require(parent.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local fFlagSkipBuyDelayForExperienceShopModule = require(purchasePrompt.Flags.FFlagSkipBuyDelayForExperienceShop)
local _ = require(parent.IAPExperience)

function name.init(p0)
	-- upvalues: fFlagSkipBuyDelayForExperienceShopModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), logUnifiedPurchaseTelemetryCounterModule (ref), unifiedPurchaseTelemetryModule (ref), unifiedPurchaseEventNameEnumModule (ref), playersService (ref), promptStateModule (ref), purchaseErrorModule (ref), fFlagFixCountersForUpsellModalShownModule (ref), fFlagAddPerformanceMetricsToUnifiedPurchaseModal (ref), emitPerformanceMetricsModule (ref), constantsModule (ref)
	function p0.shouldUseDelayedInput()
		-- upvalues: fFlagSkipBuyDelayForExperienceShopModule (copy), p0 (ref)
		return fFlagSkipBuyDelayForExperienceShopModule and p0.props.isFromInExperienceShop
	end
	
	p0.state = { canAcceptInput = not p0.shouldUseDelayedInput() }
	
	function p0.dispatchFetchPurchaseWarning()
		-- upvalues: p0 (ref), fFlagEnableUnifiedProductPurchaseFlow (copy), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), unifiedPurchaseEventNameEnumModule (copy)
		local props = p0.props
		
		if fFlagEnableUnifiedProductPurchaseFlow and p0.props.useUnifiedProductPurchaseModal then
			local purchaseAnalyticsMetadata = p0.props.purchaseAnalyticsMetadata or {}
			logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedRobuxUpsellModalBuyButtonClickedCounter, purchaseAnalyticsMetadata.surface, purchaseAnalyticsMetadata.productType)
			p0:emitUnifiedPurchaseTelemetry(unifiedPurchaseEventNameEnumModule.RobuxUpsellModalBuyClicked)
		end
		return p0.props.dispatchFetchPurchaseWarning(props.robuxProviderId)
	end
	
	function p0.promptRobuxPurchase()
		-- upvalues: p0 (ref)
		local props = p0.props
		p0.props.promptRobuxPurchase(p0.props.networking, props.robuxProviderId, props.robuxProductId)
	end
	
	function p0.onDelayedInputComplete()
		-- upvalues: p0 (ref)
		p0:setState({ canAcceptInput = true })
	end
	
	function p0.canAcceptInput()
		-- upvalues: p0 (ref), playersService (copy)
		return if playersService and playersService.LocalPlayer and playersService.LocalPlayer.GameplayPaused then false else p0.state.canAcceptInput
	end
	
	function p0.confirmButtonPressed()
		-- upvalues: p0 (ref), promptStateModule (copy), purchaseErrorModule (copy)
		local props = p0.props
		local promptState = props.promptState
		local purchaseError = props.purchaseError
		
		if not p0.canAcceptInput() then return end
		if promptState == promptStateModule.RobuxUpsell then
			props.dispatchFetchPurchaseWarning()
			
			return
		elseif promptState == promptStateModule.LargeRobuxUpsell then
			props.openRobuxStore()
			
			return
		elseif promptState == promptStateModule.U13PaymentModal or promptState == promptStateModule.U13MonthlyThreshold1Modal or (promptState == promptStateModule.U13MonthlyThreshold2Modal or promptState == promptStateModule.ParentalConsentWarningPaymentModal13To17) then
			props.promptRobuxPurchase()
			
			return
		elseif promptState == promptStateModule.PurchaseComplete then
			props.endPurchase()
			
			return
		elseif promptState ~= promptStateModule.Error then return end
		if purchaseError == purchaseErrorModule.TwoFactorNeeded or purchaseError == purchaseErrorModule.TwoFactorNeededSettings then
			props.openSecuritySettings()
			
			return
		end
		props.endPurchase()
	end
	
	function p0.cancelButtonPressed()
		-- upvalues: p0 (ref)
		p0.props.endPurchase()
	end
	
	function p0.onBuyItemButtonMounted(_)
		-- upvalues: p0 (ref), fFlagFixCountersForUpsellModalShownModule (copy), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), unifiedPurchaseEventNameEnumModule (copy), fFlagAddPerformanceMetricsToUnifiedPurchaseModal (copy), emitPerformanceMetricsModule (copy), constantsModule (copy)
		local purchaseAnalyticsMetadata = p0.props.purchaseAnalyticsMetadata or {}
		
		if fFlagFixCountersForUpsellModalShownModule then
			logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedRobuxUpsellModalShownCounter, purchaseAnalyticsMetadata.surface, purchaseAnalyticsMetadata.productType)
		else
			logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedRobuxUpsellModalBuyButtonClickedCounter, purchaseAnalyticsMetadata.surface, purchaseAnalyticsMetadata.productType)
		end
		p0:emitUnifiedPurchaseTelemetry(unifiedPurchaseEventNameEnumModule.RobuxUpsellModalShown)
		
		if fFlagAddPerformanceMetricsToUnifiedPurchaseModal and purchaseAnalyticsMetadata and purchaseAnalyticsMetadata.surface then
			emitPerformanceMetricsModule(constantsModule.PerformanceMetrics.IntervalName.RobuxUpsellModalShown, purchaseAnalyticsMetadata.surface)
		end
	end
end

function name.didMount(p1)
	-- upvalues: contextActionService (ref)
	contextActionService:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, p2, _)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.Begin then
			p1.confirmButtonPressed()
		end
	end, false, Enum.KeyCode.ButtonA)
	contextActionService:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, p3, _)
		-- upvalues: p1 (ref)
		if p3 == Enum.UserInputState.Begin then
			p1.cancelButtonPressed()
		end
	end, false, Enum.KeyCode.ButtonB)
end

function name.willUnmount(_)
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("ProductPurchaseConfirmButtonBind")
	contextActionService:UnbindCoreAction("ProductPurchaseCancelButtonBind")
end

function name.getFlowState(p4)
	-- upvalues: promptStateModule (ref), robuxUpsellFlowState (ref), purchaseErrorModule (ref)
	local props = p4.props
	local promptState = props.promptState
	local purchaseError = props.purchaseError
	
	return if promptState == promptStateModule.RobuxUpsell then robuxUpsellFlowState.PurchaseModal elseif promptState == promptStateModule.LargeRobuxUpsell then robuxUpsellFlowState.LargeRobuxPurchaseModal elseif promptState == promptStateModule.PurchaseInProgress then robuxUpsellFlowState.ItemPurchasePending elseif promptState == promptStateModule.UpsellInProgress then robuxUpsellFlowState.RobuxPurchasePending elseif promptState == promptStateModule.PollingBalance then robuxUpsellFlowState.RobuxGrantPending elseif promptState == promptStateModule.U13PaymentModal then robuxUpsellFlowState.PurchaseWarning elseif promptState == promptStateModule.U13MonthlyThreshold1Modal then robuxUpsellFlowState.PurchaseWarning elseif promptState == promptStateModule.U13MonthlyThreshold2Modal then robuxUpsellFlowState.PurchaseWarning elseif promptState == promptStateModule.PurchaseComplete then robuxUpsellFlowState.Success elseif promptState == promptStateModule.LeaveRobloxWarning then robuxUpsellFlowState.LeaveRobloxWarning elseif promptState == promptStateModule.EnablePurchaseVPCModal then robuxUpsellFlowState.PurchaseVPCModal elseif promptState == promptStateModule.Error then if purchaseError == purchaseErrorModule.TwoFactorNeeded or purchaseError == purchaseErrorModule.TwoFactorNeededSettings then robuxUpsellFlowState.TwoStepRequired else robuxUpsellFlowState.Error else robuxUpsellFlowState.None
end

function name.getU13ConfirmType(p5)
	-- upvalues: promptStateModule (ref), u13ConfirmType (ref)
	local promptState = p5.props.promptState
	
	return if promptState == promptStateModule.U13PaymentModal then u13ConfirmType.U13PaymentModal elseif promptState == promptStateModule.U13MonthlyThreshold1Modal then u13ConfirmType.U13MonthlyThreshold1Modal elseif promptState == promptStateModule.U13MonthlyThreshold2Modal then u13ConfirmType.U13MonthlyThreshold2Modal elseif promptState == promptStateModule.ParentalConsentWarningPaymentModal13To17 then u13ConfirmType.ParentalConsentWarningPaymentModal13To17 else u13ConfirmType.None
end

function name.getErrorType(p6)
	-- upvalues: purchaseErrorModule (ref), purchaseErrorType (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), appContextModule (ref)
	local props = p6.props
	
	return if props.purchaseError == purchaseErrorModule.AlreadyOwn then purchaseErrorType.AlreadyOwn elseif props.purchaseError == purchaseErrorModule.NotEnoughRobux or props.purchaseError == purchaseErrorModule.NotEnoughRobuxXbox or props.purchaseError == purchaseErrorModule.NotEnoughRobuxNoUpsell then if fFlagEnableUnifiedProductPurchaseFlow and props.useUnifiedProductPurchaseModal and appContextModule.get() == appContextModule.Enum.IN_APP then purchaseErrorType.NotEnoughRobuxInApp else purchaseErrorType.NotEnoughRobux elseif props.purchaseError == purchaseErrorModule.Limited then purchaseErrorType.Limited elseif props.purchaseError == purchaseErrorModule.NotForSale then purchaseErrorType.NotForSale elseif props.purchaseError == purchaseErrorModule.NotForSaleHere then purchaseErrorType.NotForSaleExperience elseif props.purchaseError == purchaseErrorModule.PremiumOnly then purchaseErrorType.PremiumOnly elseif props.purchaseError == purchaseErrorModule.ThirdPartyDisabled then purchaseErrorType.ThirdPartyDisabled elseif props.purchaseError == purchaseErrorModule.Under13 then purchaseErrorType.Under13 elseif props.purchaseError == purchaseErrorModule.InvalidFunds then purchaseErrorType.FailedGrant elseif props.purchaseError == purchaseErrorModule.InvalidFundsUnknown then purchaseErrorType.FailedGrantUnknown elseif props.purchaseError == purchaseErrorModule.EconomicRestriction then purchaseErrorType.EconomicRestriction else purchaseErrorType.Unknown
end

function name.getVPCModalType(p7)
	-- upvalues: promptStateModule (ref), VPCModalTypeModule (ref)
	return if p7.props.promptState == promptStateModule.EnablePurchaseVPCModal then VPCModalTypeModule.toRawValue(VPCModalTypeModule.EnablePurchase) else VPCModalTypeModule.toRawValue(VPCModalTypeModule.None)
end

function name.emitUnifiedPurchaseTelemetry(value, p8)
	-- upvalues: fFlagPurchasePromptCartPricingEnabledModule (ref), deriveUnifiedPurchaseEventRobuxPriceModule (ref), fFlagUnifiedPurchaseGamepassAddProductUniverseId (ref), httpService (ref), sendUnifiedPurchaseEventLogModule (ref)
	local props = value.props
	local purchaseAnalyticsMetadata = props.purchaseAnalyticsMetadata or {}
	sendUnifiedPurchaseEventLogModule({
		event_name = p8,
		purchase_flow_uuid = purchaseAnalyticsMetadata.purchaseFlowUUID,
		product_id = purchaseAnalyticsMetadata.productId,
		product_type = purchaseAnalyticsMetadata.productType,
		product_target_id = purchaseAnalyticsMetadata.productTargetId,
		robux_price = if fFlagPurchasePromptCartPricingEnabledModule then deriveUnifiedPurchaseEventRobuxPriceModule(props.cartPricingResponse, purchaseAnalyticsMetadata.price) else purchaseAnalyticsMetadata.price,
		surface = purchaseAnalyticsMetadata.surface,
		user_roblox_balance = purchaseAnalyticsMetadata.userRobuxBalance,
		salelocation_universeid = purchaseAnalyticsMetadata.saleLocationUniverseId,
		product_universeid = if fFlagUnifiedPurchaseGamepassAddProductUniverseId then purchaseAnalyticsMetadata.productUniverseId else nil,
		event_metadata = httpService:JSONEncode({
			upsell_robux_package_id = props.robuxProductId,
			upsell_robux_package_amount = props.iapRobuxAmount
		})
	})
end

function name.render(p9)
	-- upvalues: externalSettingsModule (ref), roact (ref), robuxUpsellFlow (ref), fFlagEnableDiscountInfoInUnifiedPurchaseModal (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), getUnifiedPurchaseModalTypeModule (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), getFFlagDisablePurchasePromptFunctionForMaquettesModule (ref), getPaymentPlatformModule (ref), paymentPlatformModule (ref)
	local isCatalog
	local props = p9.props
	local var28 = externalSettingsModule.new()
	local createElement = roact.createElement
	local t = {
		screenSize = props.screenSize,
		shouldAnimate = true,
		isDelayedInput = p9.shouldUseDelayedInput(),
		onDelayedInputComplete = p9.onDelayedInputComplete,
		model = props.humanoidModel,
		itemIcon = props.itemIcon,
		itemProductId = props.itemProductId,
		itemName = props.itemName,
		itemRobuxCost = props.itemRobuxCost,
		virtualItemPrice = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then props.virtualItemPrice else nil,
		iapCostStr = props.iapCostStr,
		iapRobuxAmount = props.iapRobuxAmount,
		beforeRobuxBalance = props.beforeRobuxBalance,
		useUpsellSuggestions = props.useUpsellSuggestions,
		upsellSuggestions = props.upsellSuggestions,
		selectedUpsellIndex = props.selectedUpsellIndex,
		onUpsellSuggestionsSelected = props.onUpsellSuggestionsSelected,
		virtualItemBadgeType = props.virtualItemBadgeType,
		useUnifiedProductPurchaseModal = if fFlagEnableUnifiedProductPurchaseFlow then props.useUnifiedProductPurchaseModal else nil,
		unifiedProductPurchaseModalType = if fFlagEnableUnifiedProductPurchaseFlow then getUnifiedPurchaseModalTypeModule(props.requestType) else nil,
		onBuyItemButtonMounted = if fFlagEnableUnifiedProductPurchaseFlow then p9.onBuyItemButtonMounted else nil
	}
	
	if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
		isCatalog = props.purchaseAnalyticsMetadata
		
		if isCatalog then
			isCatalog = props.purchaseAnalyticsMetadata.surface == "Catalog"
			isCatalog = nil
		end
	else
		isCatalog = nil
	end
	t.hideUserRobuxBalance = isCatalog
	t.cartPricingResponse = if fFlagPurchasePromptCartPricingEnabledModule then props.cartPricingResponse else nil
	t.collectibleItemId = if fFlagPurchasePromptCartPricingEnabledModule then props.collectibleItemId else nil
	t.isCartPricingLoading = if fFlagPurchasePromptCartPricingEnabledModule then props.isCartPricingLoading else nil
	t.onCartOfferAppliedChanged = if fFlagPurchasePromptCartPricingEnabledModule then props.onCartOfferAppliedChanged else nil
	t.postPurchaseActions = if fFlagPurchasePromptCartPricingEnabledModule then props.postPurchaseActions else nil
	t.setPostPurchaseActions = if fFlagPurchasePromptCartPricingEnabledModule then props.setPostPurchaseActions else nil
	t.purchaseState = p9:getFlowState()
	t.errorType = p9:getErrorType()
	t.economicRestrictionError = props.economicRestrictionError
	t.u13ConfirmType = p9:getU13ConfirmType()
	t.purchaseVPCType = p9:getVPCModalType()
	t.acceptControllerIcon = if props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil
	t.cancelControllerIcon = if props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" else nil
	t.purchaseRobux = p9.dispatchFetchPurchaseWarning
	t.acceptPurchaseWarning = p9.promptRobuxPurchase
	t.openBuyRobux = props.openRobuxStore
	t.showTermsOfUse = props.openTermsOfUse
	t.openSecuritySettings = props.openSecuritySettings
	t.cancelPurchase = props.endPurchase
	t.flowComplete = props.endPurchase
	t.onAnalyticEvent = props.onAnalyticEvent
	t.eventPrefix = "InGame"
	t.isQuest = getFFlagDisablePurchasePromptFunctionForMaquettesModule() and getPaymentPlatformModule(var28.getPlatform()) == paymentPlatformModule.Maquettes
	
	return createElement(robuxUpsellFlow, t)
end

return name