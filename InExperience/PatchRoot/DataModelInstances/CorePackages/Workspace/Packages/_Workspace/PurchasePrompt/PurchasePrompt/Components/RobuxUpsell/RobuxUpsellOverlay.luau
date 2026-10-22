local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local PurchasePromptDepsModule = require(Parent.PurchasePromptDeps)
local Roact = PurchasePromptDepsModule.Roact
local IAPExperience = PurchasePromptDepsModule.IAPExperience
local RobuxUpsellFlow = IAPExperience.PurchaseFlow.RobuxUpsellFlow
local RobuxUpsellFlowState = IAPExperience.PurchaseFlow.RobuxUpsellFlowState
local U13ConfirmType = IAPExperience.PurchaseFlow.U13ConfirmType
local PurchaseErrorType = IAPExperience.PurchaseFlow.PurchaseErrorType
local _ = require(PurchasePrompt.Models.RobuxUpsell)
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local VPCModalTypeModule = require(PurchasePrompt.Enums.VPCModalType)
local AppContextModule = require(PurchasePrompt.Utils.AppContext)
local ExtendResult = Roact.PureComponent:extend(script.Name)
local GetFFlagDisablePurchasePromptFunctionForMaquettesModule = require(PurchasePrompt.Flags.GetFFlagDisablePurchasePromptFunctionForMaquettes)
local PaymentPlatformModule = require(PurchasePrompt.Enums.PaymentPlatform)
local GetPaymentPlatformModule = require(PurchasePrompt.Utils.getPaymentPlatform)
local GetUnifiedPurchaseModalTypeModule = require(PurchasePrompt.Utils.getUnifiedPurchaseModalType)
local EmitPerformanceMetricsModule = require(PurchasePrompt.Utils.emitPerformanceMetrics)
local ExternalSettingsModule = require(PurchasePrompt.Services.ExternalSettings)
local UnifiedPurchaseTelemetryModule = require(PurchasePrompt.Events.UnifiedPurchaseTelemetry)
local LogUnifiedPurchaseTelemetryCounterModule = require(PurchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local SendUnifiedPurchaseEventLogModule = require(PurchasePrompt.Utils.sendUnifiedPurchaseEventLog)
local DeriveUnifiedPurchaseEventRobuxPriceModule = require(PurchasePrompt.Utils.deriveUnifiedPurchaseEventRobuxPrice)
local UnifiedPurchaseEventNameEnumModule = require(PurchasePrompt.Enums.UnifiedPurchaseEventNameEnum)
local ConstantsModule = require(PurchasePrompt.Misc.Constants)
local HttpService = game:GetService("HttpService")
local FFlagFixCountersForUpsellModalShownModule = require(PurchasePrompt.Flags.FFlagFixCountersForUpsellModalShown)
local FFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local FFlagAddPerformanceMetricsToUnifiedPurchaseModal = require(Parent.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal
local FFlagSkipBuyDelayForExperienceShopModule = require(PurchasePrompt.Flags.FFlagSkipBuyDelayForExperienceShop)
local FFlagLuaAppsEnablePromptVIPServerPurchase = require(Parent.SharedFlags).FFlagLuaAppsEnablePromptVIPServerPurchase
local _ = require(Parent.IAPExperience)

function ExtendResult.init(p1)
	-- upvalues: FFlagSkipBuyDelayForExperienceShopModule (copy), LogUnifiedPurchaseTelemetryCounterModule (copy), UnifiedPurchaseTelemetryModule (copy), UnifiedPurchaseEventNameEnumModule (copy), Players (copy), PromptStateModule (copy), PurchaseErrorModule (copy), FFlagFixCountersForUpsellModalShownModule (copy), FFlagAddPerformanceMetricsToUnifiedPurchaseModal (copy), EmitPerformanceMetricsModule (copy), ConstantsModule (copy)
	function p1.shouldUseDelayedInput(): boolean
		-- upvalues: FFlagSkipBuyDelayForExperienceShopModule (upval), p1 (copy)
		return not FFlagSkipBuyDelayForExperienceShopModule or not p1.props.isFromInExperienceShop
	end
	
	p1.state = { canAcceptInput = not p1.shouldUseDelayedInput() }
	
	function p1.dispatchFetchPurchaseWarning()
		-- upvalues: p1 (copy), LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), UnifiedPurchaseEventNameEnumModule (upval)
		local Props = p1.props
		
		if p1.props.useUnifiedProductPurchaseModal then
			local PurchaseAnalyticsMetadata = p1.props.purchaseAnalyticsMetadata or {}
			LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedRobuxUpsellModalBuyButtonClickedCounter, PurchaseAnalyticsMetadata.surface, PurchaseAnalyticsMetadata.productType)
			p1:emitUnifiedPurchaseTelemetry(UnifiedPurchaseEventNameEnumModule.RobuxUpsellModalBuyClicked)
		end
		return p1.props.dispatchFetchPurchaseWarning(Props.robuxProviderId)
	end
	
	function p1.promptRobuxPurchase()
		-- upvalues: p1 (copy)
		local Props = p1.props
		p1.props.promptRobuxPurchase(p1.props.networking, Props.robuxProviderId, Props.robuxProductId)
	end
	
	function p1.onDelayedInputComplete()
		-- upvalues: p1 (copy)
		p1:setState({ canAcceptInput = true })
	end
	
	function p1.canAcceptInput()
		-- upvalues: p1 (copy), Players (upval)
		local State = p1.state
		
		return (not Players or not Players.LocalPlayer or not Players.LocalPlayer.GameplayPaused) and State.canAcceptInput
	end
	
	function p1.confirmButtonPressed()
		-- upvalues: p1 (copy), PromptStateModule (upval), PurchaseErrorModule (upval)
		local Props = p1.props
		local PromptState = Props.promptState
		local PurchaseError = Props.purchaseError
		
		if not p1.canAcceptInput() then return end
		if PromptState == PromptStateModule.RobuxUpsell then
			Props.dispatchFetchPurchaseWarning()
			
			return
		end
		if PromptState == PromptStateModule.LargeRobuxUpsell then
			Props.openRobuxStore()
			
			return
		end
		if PromptState == PromptStateModule.U13PaymentModal or PromptState == PromptStateModule.U13MonthlyThreshold1Modal or PromptState == PromptStateModule.U13MonthlyThreshold2Modal or PromptState == PromptStateModule.ParentalConsentWarningPaymentModal13To17 then
			Props.promptRobuxPurchase()
			
			return
		end
		if PromptState == PromptStateModule.PurchaseComplete then
			Props.endPurchase()
			
			return
		end
		if PromptState ~= PromptStateModule.Error then return end
		if PurchaseError == PurchaseErrorModule.TwoFactorNeeded or PurchaseError == PurchaseErrorModule.TwoFactorNeededSettings then
			Props.openSecuritySettings()
			
			return
		else
			Props.endPurchase()
		end
	end
	
	function p1.cancelButtonPressed()
		-- upvalues: p1 (copy)
		p1.props.endPurchase()
	end
	
	function p1:onBuyItemButtonMounted()
		-- upvalues: p1 (copy), FFlagFixCountersForUpsellModalShownModule (upval), LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), UnifiedPurchaseEventNameEnumModule (upval), FFlagAddPerformanceMetricsToUnifiedPurchaseModal (upval), EmitPerformanceMetricsModule (upval), ConstantsModule (upval)
		local PurchaseAnalyticsMetadata = p1.props.purchaseAnalyticsMetadata or {}
		
		if FFlagFixCountersForUpsellModalShownModule then
			LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedRobuxUpsellModalShownCounter, PurchaseAnalyticsMetadata.surface, PurchaseAnalyticsMetadata.productType)
		else
			LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedRobuxUpsellModalBuyButtonClickedCounter, PurchaseAnalyticsMetadata.surface, PurchaseAnalyticsMetadata.productType)
		end
		p1:emitUnifiedPurchaseTelemetry(UnifiedPurchaseEventNameEnumModule.RobuxUpsellModalShown)
		
		if FFlagAddPerformanceMetricsToUnifiedPurchaseModal and PurchaseAnalyticsMetadata and PurchaseAnalyticsMetadata.surface then
			EmitPerformanceMetricsModule(ConstantsModule.PerformanceMetrics.IntervalName.RobuxUpsellModalShown, PurchaseAnalyticsMetadata.surface)
		end
	end
end

function ExtendResult.didMount(p1)
	-- upvalues: ContextActionService (copy)
	ContextActionService:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, UserInputState, _)
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			p1.confirmButtonPressed()
		end
	end, false, Enum.KeyCode.ButtonA)
	ContextActionService:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, UserInputState, _)
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			p1.cancelButtonPressed()
		end
	end, false, Enum.KeyCode.ButtonB)
end

function ExtendResult:willUnmount()
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction("ProductPurchaseConfirmButtonBind")
	ContextActionService:UnbindCoreAction("ProductPurchaseCancelButtonBind")
end

function ExtendResult.getFlowState(p1)
	-- upvalues: PromptStateModule (copy), RobuxUpsellFlowState (copy), PurchaseErrorModule (copy)
	local Props = p1.props
	local PromptState = Props.promptState
	local PurchaseError = Props.purchaseError
	
	return if PromptState == PromptStateModule.RobuxUpsell then RobuxUpsellFlowState.PurchaseModal elseif PromptState == PromptStateModule.LargeRobuxUpsell then RobuxUpsellFlowState.LargeRobuxPurchaseModal elseif PromptState == PromptStateModule.PurchaseInProgress then RobuxUpsellFlowState.ItemPurchasePending elseif PromptState == PromptStateModule.UpsellInProgress then RobuxUpsellFlowState.RobuxPurchasePending elseif PromptState == PromptStateModule.PollingBalance then RobuxUpsellFlowState.RobuxGrantPending elseif PromptState == PromptStateModule.U13PaymentModal then RobuxUpsellFlowState.PurchaseWarning elseif PromptState == PromptStateModule.U13MonthlyThreshold1Modal then RobuxUpsellFlowState.PurchaseWarning elseif PromptState == PromptStateModule.U13MonthlyThreshold2Modal then RobuxUpsellFlowState.PurchaseWarning elseif PromptState == PromptStateModule.PurchaseComplete then RobuxUpsellFlowState.Success elseif PromptState == PromptStateModule.LeaveRobloxWarning then RobuxUpsellFlowState.LeaveRobloxWarning elseif PromptState == PromptStateModule.EnablePurchaseVPCModal then RobuxUpsellFlowState.PurchaseVPCModal elseif PromptState == PromptStateModule.Error then if PurchaseError == PurchaseErrorModule.TwoFactorNeeded or PurchaseError == PurchaseErrorModule.TwoFactorNeededSettings then RobuxUpsellFlowState.TwoStepRequired else RobuxUpsellFlowState.Error else RobuxUpsellFlowState.None
end

function ExtendResult.getU13ConfirmType(p1)
	-- upvalues: PromptStateModule (copy), U13ConfirmType (copy)
	local PromptState = p1.props.promptState
	
	return if PromptState == PromptStateModule.U13PaymentModal then U13ConfirmType.U13PaymentModal elseif PromptState == PromptStateModule.U13MonthlyThreshold1Modal then U13ConfirmType.U13MonthlyThreshold1Modal elseif PromptState == PromptStateModule.U13MonthlyThreshold2Modal then U13ConfirmType.U13MonthlyThreshold2Modal elseif PromptState == PromptStateModule.ParentalConsentWarningPaymentModal13To17 then U13ConfirmType.ParentalConsentWarningPaymentModal13To17 else U13ConfirmType.None
end

function ExtendResult.getErrorType(p1)
	-- upvalues: PurchaseErrorModule (copy), PurchaseErrorType (copy), AppContextModule (copy)
	local Props = p1.props
	
	return if Props.purchaseError == PurchaseErrorModule.AlreadyOwn then PurchaseErrorType.AlreadyOwn elseif Props.purchaseError == PurchaseErrorModule.NotEnoughRobux or Props.purchaseError == PurchaseErrorModule.NotEnoughRobuxXbox or Props.purchaseError == PurchaseErrorModule.NotEnoughRobuxNoUpsell then if Props.useUnifiedProductPurchaseModal and AppContextModule.get() == AppContextModule.Enum.IN_APP then PurchaseErrorType.NotEnoughRobuxInApp else PurchaseErrorType.NotEnoughRobux elseif Props.purchaseError == PurchaseErrorModule.Limited then PurchaseErrorType.Limited elseif Props.purchaseError == PurchaseErrorModule.NotForSale then PurchaseErrorType.NotForSale elseif Props.purchaseError == PurchaseErrorModule.NotForSaleHere then PurchaseErrorType.NotForSaleExperience elseif Props.purchaseError == PurchaseErrorModule.PremiumOnly then PurchaseErrorType.PremiumOnly elseif Props.purchaseError == PurchaseErrorModule.ThirdPartyDisabled then PurchaseErrorType.ThirdPartyDisabled elseif Props.purchaseError == PurchaseErrorModule.Under13 then PurchaseErrorType.Under13 elseif Props.purchaseError == PurchaseErrorModule.InvalidFunds then PurchaseErrorType.FailedGrant elseif Props.purchaseError == PurchaseErrorModule.InvalidFundsUnknown then PurchaseErrorType.FailedGrantUnknown elseif Props.purchaseError == PurchaseErrorModule.EconomicRestriction then PurchaseErrorType.EconomicRestriction else PurchaseErrorType.Unknown
end

function ExtendResult.getVPCModalType(p1)
	-- upvalues: PromptStateModule (copy), VPCModalTypeModule (copy)
	return if p1.props.promptState == PromptStateModule.EnablePurchaseVPCModal then VPCModalTypeModule.toRawValue(VPCModalTypeModule.EnablePurchase) else VPCModalTypeModule.toRawValue(VPCModalTypeModule.None)
end

function ExtendResult.emitUnifiedPurchaseTelemetry(p1, Event_name)
	-- upvalues: DeriveUnifiedPurchaseEventRobuxPriceModule (copy), HttpService (copy), SendUnifiedPurchaseEventLogModule (copy)
	local Props = p1.props
	local PurchaseAnalyticsMetadata = Props.purchaseAnalyticsMetadata or {}
	SendUnifiedPurchaseEventLogModule({
		event_name = Event_name,
		purchase_flow_uuid = PurchaseAnalyticsMetadata.purchaseFlowUUID,
		product_id = PurchaseAnalyticsMetadata.productId,
		product_type = PurchaseAnalyticsMetadata.productType,
		product_target_id = PurchaseAnalyticsMetadata.productTargetId,
		robux_price = DeriveUnifiedPurchaseEventRobuxPriceModule(Props.cartPricingResponse, PurchaseAnalyticsMetadata.price),
		surface = PurchaseAnalyticsMetadata.surface,
		user_roblox_balance = PurchaseAnalyticsMetadata.userRobuxBalance,
		salelocation_universeid = PurchaseAnalyticsMetadata.saleLocationUniverseId,
		product_universeid = PurchaseAnalyticsMetadata.productUniverseId,
		event_metadata = HttpService:JSONEncode({
			upsell_robux_package_id = Props.robuxProductId,
			upsell_robux_package_amount = Props.iapRobuxAmount
		})
	})
end

function ExtendResult.render(p1)
	-- upvalues: ExternalSettingsModule (copy), Roact (copy), RobuxUpsellFlow (copy), GetUnifiedPurchaseModalTypeModule (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), FFlagLuaAppsEnablePromptVIPServerPurchase (copy), GetFFlagDisablePurchasePromptFunctionForMaquettesModule (copy), GetPaymentPlatformModule (copy), PaymentPlatformModule (copy)
	local Props = p1.props
	local NewExternalSettings = ExternalSettingsModule.new()
	
	return Roact.createElement(RobuxUpsellFlow, {
		screenSize = Props.screenSize,
		shouldAnimate = true,
		isDelayedInput = p1.shouldUseDelayedInput(),
		onDelayedInputComplete = p1.onDelayedInputComplete,
		model = Props.humanoidModel,
		itemIcon = Props.itemIcon,
		itemProductId = Props.itemProductId,
		itemName = Props.itemName,
		itemRobuxCost = Props.itemRobuxCost,
		virtualItemPrice = Props.virtualItemPrice,
		iapCostStr = Props.iapCostStr,
		iapRobuxAmount = Props.iapRobuxAmount,
		beforeRobuxBalance = Props.beforeRobuxBalance,
		useUpsellSuggestions = Props.useUpsellSuggestions,
		upsellSuggestions = Props.upsellSuggestions,
		selectedUpsellIndex = Props.selectedUpsellIndex,
		onUpsellSuggestionsSelected = Props.onUpsellSuggestionsSelected,
		virtualItemBadgeType = Props.virtualItemBadgeType,
		useUnifiedProductPurchaseModal = Props.useUnifiedProductPurchaseModal,
		unifiedProductPurchaseModalType = GetUnifiedPurchaseModalTypeModule(Props.requestType),
		onBuyItemButtonMounted = p1.onBuyItemButtonMounted,
		hideUserRobuxBalance = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then Props.purchaseAnalyticsMetadata and Props.purchaseAnalyticsMetadata.surface == "Catalog" else nil,
		cartPricingResponse = Props.cartPricingResponse,
		collectibleItemId = Props.collectibleItemId,
		isCartPricingLoading = Props.isCartPricingLoading,
		onCartOfferAppliedChanged = Props.onCartOfferAppliedChanged,
		postPurchaseActions = Props.postPurchaseActions,
		setPostPurchaseActions = Props.setPostPurchaseActions,
		onRobloxPlusButtonActivated = Props.onRobloxPlusButtonActivated,
		robloxPlusDiscountPercentage = Props.robloxPlusDiscountPercentage,
		isMonthlyPrice = if FFlagLuaAppsEnablePromptVIPServerPurchase then Props.isMonthlyPrice else nil,
		purchaseState = p1:getFlowState(),
		errorType = p1:getErrorType(),
		economicRestrictionError = Props.economicRestrictionError,
		u13ConfirmType = p1:getU13ConfirmType(),
		purchaseVPCType = p1:getVPCModalType(),
		acceptControllerIcon = if Props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil,
		cancelControllerIcon = if Props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" else nil,
		purchaseRobux = p1.dispatchFetchPurchaseWarning,
		acceptPurchaseWarning = p1.promptRobuxPurchase,
		openBuyRobux = Props.openRobuxStore,
		showTermsOfUse = Props.openTermsOfUse,
		openSecuritySettings = Props.openSecuritySettings,
		cancelPurchase = Props.endPurchase,
		flowComplete = Props.endPurchase,
		onAnalyticEvent = Props.onAnalyticEvent,
		eventPrefix = "InGame",
		isQuest = GetFFlagDisablePurchasePromptFunctionForMaquettesModule() and GetPaymentPlatformModule(NewExternalSettings.getPlatform()) == PaymentPlatformModule.Maquettes
	})
end

return ExtendResult