local guiService = game:GetService("GuiService")
local contextActionService = game:GetService("ContextActionService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local purchasePromptDepsModule = require(parent.PurchasePromptDeps)
local roact = purchasePromptDepsModule.Roact
local reactModule = require(parent.React)
local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local cachedPolicyServiceModule = require(parent.CachedPolicyService)
local robloxTranslatorModule = require(parent.RobloxTranslator)
local UIBlox = purchasePromptDepsModule.UIBlox
local interactiveAlert = UIBlox.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBlox.App.Button.Enum.ButtonType
local images = UIBlox.App.ImageSet.Images
local IAPExperienceModule = require(parent.IAPExperience)
local productPurchase = IAPExperienceModule.ProductPurchase
local productPurchaseRobuxUpsell = IAPExperienceModule.ProductPurchaseRobuxUpsell
local leaveRobloxAlert = IAPExperienceModule.LeaveRobloxAlert
local animator = IAPExperienceModule.Animator
local unifiedProductPurchaseModal = IAPExperienceModule.UnifiedProductPurchaseModal
local unifiedProductPurchaseModalV2 = IAPExperienceModule.UnifiedProductPurchaseModalV2
local robloxSubscriptionPurchaseAppModule = require(parent.RobloxSubscriptionPurchaseApp)
local getBlackbirdUpsellBannerProductInfoModule = require(purchasePrompt.Utils.getBlackbirdUpsellBannerProductInfo)
local robloxSubscriptionFlowCompleteReason = robloxSubscriptionPurchaseAppModule.RobloxSubscriptionFlowCompleteReason
local surfaceName = robloxSubscriptionPurchaseAppModule.SurfaceName
local surfaceContext = robloxSubscriptionPurchaseAppModule.SurfaceContext
local purchaseClientSessionIdType = robloxSubscriptionPurchaseAppModule.PurchaseClientSessionIdType
local setWindowStateModule = require(purchasePrompt.Actions.SetWindowState)
local purchaseFlowModule = require(purchasePrompt.Enums.PurchaseFlow)
local requestTypeModule = require(purchasePrompt.Enums.RequestType)
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local windowStateModule = require(purchasePrompt.Enums.WindowState)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local _ = require(purchasePrompt.types).ProductTypeEnum
local hideWindowModule = require(purchasePrompt.Thunks.hideWindow)
local retryPurchaseAfterUpsellModule = require(purchasePrompt.Thunks.retryPurchaseAfterUpsell)
local completeRequestModule = require(purchasePrompt.Thunks.completeRequest)
local purchaseItemModule = require(purchasePrompt.Thunks.purchaseItem)
local completePurchaseModule = require(purchasePrompt.Thunks.completePurchase)
local launchRobuxUpsellModule = require(purchasePrompt.Thunks.launchRobuxUpsell)
local openSecuritySettingsModule = require(purchasePrompt.Thunks.openSecuritySettings)
local isMockingPurchasesModule = require(purchasePrompt.Utils.isMockingPurchases)
local connectToStoreModule = require(purchasePrompt.connectToStore)
local sendEventModule = require(purchasePrompt.Thunks.sendEvent)
local publishAssetAnalyticsModule = require(purchasePrompt.Utils.PublishAssetAnalytics)
local externalEventConnectionModule = require(purchasePrompt.Components.Connection.ExternalEventConnection)
local localizationServiceModule = require(purchasePrompt.Localization.LocalizationService)
local getPlayerPriceModule = require(purchasePrompt.Utils.getPlayerPrice)
local isGenericChallengeResponseModule = require(purchasePrompt.Utils.isGenericChallengeResponse)
local selectedRobuxPackageModule = require(purchasePrompt.Utils.SelectedRobuxPackage)
local productPurchaseSurface = require(parent.PurchasePromptLite).Enums.ProductPurchaseSurface
local logUnifiedPurchaseTelemetryCounterModule = require(purchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local emitPerformanceMetricsModule = require(purchasePrompt.Utils.emitPerformanceMetrics)
local initiateUserPurchaseSettingsPrecheckModule = require(purchasePrompt.Thunks.initiateUserPurchaseSettingsPrecheck)
local verifiedParentalConsentDialog = require(parent.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog
local VPCModalTypeModule = require(purchasePrompt.Enums.VPCModalType)
local animatorModule = require(script.Parent.Animator)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAddCursorProviderToPurchasePromptApp = sharedFlagsModule.FFlagAddCursorProviderToPurchasePromptApp
local fFlagPurchasePromptPriceShouldUseProductInfoPriceModule = require(purchasePrompt.Flags.FFlagPurchasePromptPriceShouldUseProductInfoPrice)
local getUnifiedPurchaseModalTypeModule = require(purchasePrompt.Utils.getUnifiedPurchaseModalType)
local selectProductPriceModule = require(purchasePrompt.Selectors.selectProductPrice)
local fFlagEnableDiscountInfoInUnifiedPurchaseModal = sharedFlagsModule.FFlagEnableDiscountInfoInUnifiedPurchaseModal
local var43 = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then require(purchasePrompt.Selectors.selectPrice) else nil
local setPromptStateModule = require(purchasePrompt.Actions.SetPromptState)
local httpService = game:GetService("HttpService")
local setPurchaseFlowUUIDModule = require(purchasePrompt.Actions.SetPurchaseFlowUUID)
local setPostPurchaseActionsModule = require(purchasePrompt.Actions.SetPostPurchaseActions)
local sendUnifiedPurchaseEventLogModule = require(purchasePrompt.Utils.sendUnifiedPurchaseEventLog)
local unifiedPurchaseEventNameEnumModule = require(purchasePrompt.Enums.UnifiedPurchaseEventNameEnum)
local constantsModule = require(purchasePrompt.Misc.Constants)
local fFlagEnablePurchaseFlowUUIDMigrationModule = require(purchasePrompt.Flags.FFlagEnablePurchaseFlowUUIDMigration)
local loggingProtocolModule = require(parent.LoggingProtocol)
local purchaseFlowUUIDTelemetryModule = require(purchasePrompt.Events.PurchaseFlowUUIDTelemetry)
local unifiedPurchaseTelemetryModule = require(purchasePrompt.Events.UnifiedPurchaseTelemetry)
local appContextModule = require(purchasePrompt.Utils.AppContext)
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local fetchCartPricingModule = require(purchasePrompt.Thunks.fetchCartPricing)
local selectCartPricingResponseModule = require(purchasePrompt.Selectors.selectCartPricingResponse)
local selectIsCartPricingFetchingModule = require(purchasePrompt.Selectors.selectIsCartPricingFetching)
local fFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice = sharedFlagsModule.FFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice
local deriveCartPricingView = IAPExperienceModule.deriveCartPricingView
local desktopUpsellExperiment = IAPExperienceModule.Utility.DesktopUpsellExperiment
local productPurchaseModal = IAPExperienceModule.ProductPurchaseModal
local robuxUpsellModal = IAPExperienceModule.RobuxUpsellModal
local robuxUpsellModalTooExpensiveFallback = IAPExperienceModule.RobuxUpsellModalTooExpensiveFallback
local shouldShowBlackbirdUpsellModule = require(purchasePrompt.Utils.shouldShowBlackbirdUpsell)
local name = roact.Component:extend(script.Name)
local productPurchasePromptModule = require(script.Parent.ProductPurchasePrompt)
local sharedFlagsModule_1 = require(parent.SharedFlags)
local getFFlagOpenVngTosForVngRobuxUpsell = sharedFlagsModule_1.GetFFlagOpenVngTosForVngRobuxUpsell
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local fFlagEnableUnifiedProductPurchaseFlow = sharedFlagsModule_1.FFlagEnableUnifiedProductPurchaseFlow
local unifiedPurchaseModalTypeEnum = IAPExperienceModule.Enums.UnifiedPurchaseModalTypeEnum
local fFlagUnifiedPurchaseGamepassAddProductUniverseId = require(parent.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId
local fFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local fFlagAddPerformanceMetricsToUnifiedPurchaseModal = require(parent.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local fFlagAddCenterDialogForUnifiedPurchaseModal = require(parent.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal
local fFlagUnifiedPurchaseAddSkeleton = require(parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton
local fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal = require(parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal
local fFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry = require(parent.SharedFlags).FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry
local removeDelayedInputForUnifiedPurchaseModal = game:DefineFastFlag("RemoveDelayedInputForUnifiedPurchaseModal", true)
local fFlagPurchasePromptSubtitleForTimedOptions = require(parent.SharedFlags).FFlagPurchasePromptSubtitleForTimedOptions
local fFlagPurchaseModalTimedOptionExtension = require(parent.SharedFlags).FFlagPurchaseModalTimedOptionExtension
local fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal = require(parent.SharedFlags).FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal
local fFlagEnableBlackbirdUpsellImpressionGating = require(parent.SharedFlags).FFlagEnableBlackbirdUpsellImpressionGating
local blackbirdUpsellImpressionTrackerModule = require(purchasePrompt.Utils.BlackbirdUpsellImpressionTracker)
local fFlagBlackbirdUpsellGateResaleAndTimedOptionModule = require(purchasePrompt.Flags.FFlagBlackbirdUpsellGateResaleAndTimedOption)
local fFlagSetMenuOnPurchasePromptModule = require(purchasePrompt.Flags.FFlagSetMenuOnPurchasePrompt)
local fFlagSkipBuyDelayForExperienceShopModule = require(purchasePrompt.Flags.FFlagSkipBuyDelayForExperienceShop)

local function isRelevantRequestType(p0, p1, p2) --[[ line: 173 ]]
	-- upvalues: fFlagUnifiedPurchaseAddSkeleton (ref), promptStateModule (ref), purchaseFlowModule (ref), requestTypeModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref)
	return if fFlagUnifiedPurchaseAddSkeleton and p2 == promptStateModule.InitializingPurchase and p1 == purchaseFlowModule.RobuxUpsellV2 then true elseif p1 == purchaseFlowModule.RobuxUpsellV2 or p1 == purchaseFlowModule.LargeRobuxUpsell then false elseif p0 ~= requestTypeModule.Asset then if p0 ~= requestTypeModule.Bundle then if p0 ~= requestTypeModule.GamePass then if p0 ~= requestTypeModule.Product then if p0 ~= requestTypeModule.AvatarCreationFee then if fFlagEnableUnifiedProductPurchaseFlow then true elseif fFlagEnableUnifiedProductPurchaseFlow then true else fFlagEnableUnifiedPurchaseFlowForDevSubs and p0 == requestTypeModule.DeveloperSubscription else true else true else true else true else true
end

local function _(p3, p4, p5) --[[ line: 196 | named "getIsFiatProduct" ]]
	-- upvalues: fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), requestTypeModule (ref)
	return not (not fFlagEnableUnifiedPurchaseFlowForDevSubs or p3 ~= requestTypeModule.DeveloperSubscription) and (p4.displayPrice ~= nil and p5 == 0)
end

local _ = function(p6) --[[ line: 204 | named "promptStateToViewName" ]]
	-- upvalues: promptStateModule (ref)
	return ({
		[promptStateModule.RobuxUpsell] = "PurchaseModal",
		[promptStateModule.UpsellInProgress] = "RobuxPurchasePending"
	})[p6]
end

function name.init(p7) --[[ line: 212 ]]
	-- upvalues: httpService (ref), fFlagEnablePurchaseFlowUUIDMigrationModule (ref), loggingProtocolModule (ref), purchaseFlowUUIDTelemetryModule (ref), cachedPolicyServiceModule (ref), promptStateModule (ref), fFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice (ref), fFlagUnifiedPurchaseGamepassAddProductUniverseId (ref), sendUnifiedPurchaseEventLogModule (ref), removeDelayedInputForUnifiedPurchaseModal (ref), fFlagSkipBuyDelayForExperienceShopModule (ref), appContextModule (ref), playersService (ref), isRelevantRequestType (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), logUnifiedPurchaseTelemetryCounterModule (ref), unifiedPurchaseTelemetryModule (ref), unifiedPurchaseEventNameEnumModule (ref), purchaseErrorModule (ref), isGenericChallengeResponseModule (ref), requestTypeModule (ref), publishAssetAnalyticsModule (ref), windowStateModule (ref), contextActionService (ref), VPCModalTypeModule (ref), fFlagAddPerformanceMetricsToUnifiedPurchaseModal (ref), emitPerformanceMetricsModule (ref), constantsModule (ref)
	p7.state = {
		isLuobu = false,
		screenSize = Vector2.new(0, 0),
		analyticId = httpService:GenerateGUID(false)
	}
	
	if not fFlagEnablePurchaseFlowUUIDMigrationModule then
		p7.props.setPurchaseFlowUUID(httpService:GenerateGUID(false))
		loggingProtocolModule.default:logRobloxTelemetryCounter(purchaseFlowUUIDTelemetryModule.ProductPurchaseContainerMigrationCounter, 1, { method = "ProductPurchaseContainerInit" })
	end
	coroutine.wrap(function() --[[ line: 231 ]]
		-- upvalues: cachedPolicyServiceModule (copy), p7 (ref)
		if cachedPolicyServiceModule:IsSubjectToChinaPolicies() then
			p7:setState({ isLuobu = true })
		end
	end)()
	
	function p7.emitPurchaseFlowEvent(p8, p9) --[[ line: 242 ]]
		-- upvalues: p7 (ref), promptStateModule (copy), httpService (copy)
		local promptState = ({
			[promptStateModule.RobuxUpsell] = "PurchaseModal",
			[promptStateModule.UpsellInProgress] = "RobuxPurchasePending"
		})[p7.props.promptState]
		
		if promptState then
			p7.props.onAnalyticEvent("UserPurchaseFlow", {
				purchase_flow = "InGameRobuxUpsell",
				purchase_flow_uuid = p7.props.purchaseFlowUUID,
				view_name = promptState,
				purchase_event_type = p8,
				input_type = p9,
				event_metadata = httpService:JSONEncode({
					universe_id = tostring(game.GameId),
					item_product_id = tostring(p7.props.productInfo.productId),
					item_name = p7.props.productInfo.name,
					price = tostring(p7.props.productInfo.price),
					user_balance = tostring(p7.props.accountInfo.balance) or nil,
					package_robux_amount = tostring(p7.props.robuxPurchaseAmount) or nil
				})
			})
			
			return
		end
	end
	
	function p7.emitUnifiedProductPurchaseFlowEvent(p10) --[[ line: 266 ]]
		-- upvalues: p7 (ref), fFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice (copy), fFlagUnifiedPurchaseGamepassAddProductUniverseId (copy), sendUnifiedPurchaseEventLogModule (copy)
		local purchaseAnalyticsMetadata = p7.props.purchaseAnalyticsMetadata or {}
		sendUnifiedPurchaseEventLogModule({
			event_name = p10,
			purchase_flow_uuid = purchaseAnalyticsMetadata.purchaseFlowUUID,
			product_id = purchaseAnalyticsMetadata.productId,
			product_type = purchaseAnalyticsMetadata.productType,
			product_target_id = purchaseAnalyticsMetadata.productTargetId,
			robux_price = if fFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice and p7.props.productPrice ~= nil then p7.props.productPrice else purchaseAnalyticsMetadata.price,
			surface = purchaseAnalyticsMetadata.surface,
			user_roblox_balance = purchaseAnalyticsMetadata.userRobuxBalance,
			salelocation_universeid = purchaseAnalyticsMetadata.saleLocationUniverseId,
			product_universeid = if fFlagUnifiedPurchaseGamepassAddProductUniverseId then purchaseAnalyticsMetadata.productUniverseId else nil
		})
	end
	
	function p7.changeScreenSize(p11) --[[ line: 293 ]]
		-- upvalues: p7 (ref)
		if p7.state.screenSize ~= p11.AbsoluteSize then
			p7:setState({ screenSize = p11.AbsoluteSize })
		end
	end
	
	function p7.isFromShopSkip() --[[ line: 301 ]]
		-- upvalues: p7 (ref)
		return p7.props.productPayload ~= nil and p7.props.productPayload.isFromInExperienceShop == true
	end
	
	function p7.hasDelayedInput() --[[ line: 305 ]]
		-- upvalues: removeDelayedInputForUnifiedPurchaseModal (copy), p7 (ref), promptStateModule (copy), fFlagSkipBuyDelayForExperienceShopModule (copy)
		if not removeDelayedInputForUnifiedPurchaseModal and p7.props.isTestPurchase then
			return false
		end
		local promptState = p7.props.promptState
		
		return if promptState == promptStateModule.PromptPurchase and p7.buyButtonUsesFoundationInputDelay and (not fFlagSkipBuyDelayForExperienceShopModule or not p7.isFromShopSkip()) then true elseif removeDelayedInputForUnifiedPurchaseModal then if fFlagSkipBuyDelayForExperienceShopModule and p7.isFromShopSkip() and (promptState == promptStateModule.RobuxUpsell or promptState == promptStateModule.UpsellInProgress) then false elseif promptState ~= promptStateModule.PurchaseInProgress then if promptState ~= promptStateModule.RobuxUpsell then promptState == promptStateModule.UpsellInProgress else true else true elseif fFlagSkipBuyDelayForExperienceShopModule and p7.isFromShopSkip() and (promptState == promptStateModule.PromptPurchase or promptState == promptStateModule.RobuxUpsell or promptState == promptStateModule.UpsellInProgress) then false elseif promptState ~= promptStateModule.PromptPurchase then if promptState ~= promptStateModule.PurchaseInProgress then if promptState ~= promptStateModule.RobuxUpsell then promptState == promptStateModule.UpsellInProgress else true else true else true
	end
	
	function p7.isWindowShowAndDoneAnimating() --[[ line: 359 ]]
		-- upvalues: p7 (ref)
		return p7.state.isAnimating == false
	end
	
	p7.buyButtonUsesFoundationInputDelay = appContextModule.get() == appContextModule.Enum.IN_EXPERIENCE
	
	function p7.canConfirmInput() --[[ line: 368 ]]
		-- upvalues: playersService (copy), p7 (ref)
		if playersService.LocalPlayer.GameplayPaused then
			return false
		end
		local var71 = p7.isWindowShowAndDoneAnimating()
		
		return if p7.hasDelayedInput() then var71 and (if p7.state.doneAnimatingTime then os.clock() - p7.state.doneAnimatingTime > 2.5 else false) else var71
	end
	
	function p7.getConfirmButtonAction(p12, p13, p14) --[[ line: 393 ]]
		-- upvalues: promptStateModule (copy), isRelevantRequestType (copy), fFlagEnableUnifiedProductPurchaseFlow (copy), p7 (ref), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), unifiedPurchaseEventNameEnumModule (copy), purchaseErrorModule (copy), isGenericChallengeResponseModule (copy)
		if p12 == promptStateModule.None or not isRelevantRequestType(p13) then
			return nil
		elseif p12 == promptStateModule.PromptPurchase or p12 == promptStateModule.PurchaseInProgress then
			if fFlagEnableUnifiedProductPurchaseFlow and p7.props.isUserEligibleForUnifiedPurchaseFlow then
				local purchaseAnalyticsMetadata = p7.props.purchaseAnalyticsMetadata or {}
				logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedProductPurchaseModalBuyItemButtonClickedCounter, purchaseAnalyticsMetadata.surface, purchaseAnalyticsMetadata.productType)
				p7.emitUnifiedProductPurchaseFlowEvent(unifiedPurchaseEventNameEnumModule.BuyItemModalBuyClicked)
			end
			return p7.props.onBuy
		else
			return if p12 == promptStateModule.RobuxUpsell or p12 == promptStateModule.UpsellInProgress or p12 == promptStateModule.LeaveRobloxWarning then p7.props.onRobuxUpsell elseif p12 == promptStateModule.U13PaymentModal or p12 == promptStateModule.U13MonthlyThreshold1Modal or (p12 == promptStateModule.U13MonthlyThreshold2Modal or p12 == promptStateModule.ParentalConsentWarningPaymentModal13To17) then p7.props.onScaryModalConfirm elseif p12 == promptStateModule.Error and p14 == purchaseErrorModule.TwoFactorNeededSettings then p7.props.onOpenSecuritySettings elseif isGenericChallengeResponseModule(p14) then function() --[[ line: 425 ]]
				-- upvalues: p7 (copy), p14 (ref)
				p7.props.onOpenSecuritySettings(p14)
			end else p7.props.hideWindow
		end
	end
	
	function p7.getCancelButtonAction(p15, p16) --[[ line: 433 ]]
		-- upvalues: promptStateModule (copy), isRelevantRequestType (copy), p7 (ref)
		return if p15 == promptStateModule.None or not isRelevantRequestType(p16) then nil else p7.props.hideWindow
	end
	
	function p7.confirmButtonPressed() --[[ line: 441 ]]
		-- upvalues: p7 (ref), requestTypeModule (copy), promptStateModule (copy), publishAssetAnalyticsModule (copy)
		if p7.props.requestType == requestTypeModule.AvatarCreationFee and p7.props.promptState == promptStateModule.PromptPurchase then
			publishAssetAnalyticsModule.sendButtonClicked(publishAssetAnalyticsModule.Section.BuyItemModal, publishAssetAnalyticsModule.Element.Buy)
		end
		local confirmButtonAction = p7.getConfirmButtonAction(p7.props.promptState, p7.props.requestType, p7.props.purchaseError)
		
		if confirmButtonAction ~= nil and p7.canConfirmInput() then
			confirmButtonAction()
		end
	end
	
	function p7.cancelButtonPressed() --[[ line: 458 ]]
		-- upvalues: p7 (ref), requestTypeModule (copy), promptStateModule (copy), publishAssetAnalyticsModule (copy), fFlagEnableUnifiedProductPurchaseFlow (copy), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy)
		if p7.props.requestType == requestTypeModule.AvatarCreationFee and p7.props.promptState == promptStateModule.PromptPurchase then
			publishAssetAnalyticsModule.sendButtonClicked(publishAssetAnalyticsModule.Section.BuyItemModal, publishAssetAnalyticsModule.Element.Cancel)
		end
		if fFlagEnableUnifiedProductPurchaseFlow and p7.props.isUserEligibleForUnifiedPurchaseFlow then
			logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedProductPurchaseModalCancelButtonClickedCounter, p7.props.purchaseAnalyticsMetadata.surface, p7.props.purchaseAnalyticsMetadata.productType)
		end
		local cancelButtonAction = p7.getCancelButtonAction(p7.props.promptState, p7.props.requestType)
		
		if cancelButtonAction ~= nil then
			cancelButtonAction()
		end
	end
	
	function p7.configContextActionService(p17) --[[ line: 483 ]]
		-- upvalues: windowStateModule (copy), contextActionService (copy), p7 (ref)
		if p17 == windowStateModule.Shown then
			contextActionService:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, p18, _) --[[ line: 485 ]]
				-- upvalues: p7 (copy)
				if p18 == Enum.UserInputState.Begin then
					p7.confirmButtonPressed()
				end
			end, false, Enum.KeyCode.ButtonA)
			contextActionService:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, p19, _) --[[ line: 490 ]]
				-- upvalues: p7 (copy)
				if p19 == Enum.UserInputState.Begin then
					p7.cancelButtonPressed()
				end
			end, false, Enum.KeyCode.ButtonB)
			
			return
		end
		contextActionService:UnbindCoreAction("ProductPurchaseConfirmButtonBind")
		contextActionService:UnbindCoreAction("ProductPurchaseCancelButtonBind")
	end
	
	function p7.getVPCModalType(p20) --[[ line: 501 ]]
		-- upvalues: promptStateModule (copy), VPCModalTypeModule (copy)
		return if p20 == promptStateModule.EnablePurchaseVPCModal then VPCModalTypeModule.toRawValue(VPCModalTypeModule.EnablePurchase) else VPCModalTypeModule.toRawValue(VPCModalTypeModule.None)
	end
	
	function p7.onBuyItemButtonMounted(p21) --[[ line: 508 ]]
		-- upvalues: p7 (ref), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), unifiedPurchaseEventNameEnumModule (copy), fFlagAddPerformanceMetricsToUnifiedPurchaseModal (copy), emitPerformanceMetricsModule (copy), constantsModule (copy)
		local purchaseAnalyticsMetadata = p7.props.purchaseAnalyticsMetadata or {}
		logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedProductPurchaseModalShownCounter, purchaseAnalyticsMetadata.surface, purchaseAnalyticsMetadata.productType)
		p7.emitUnifiedProductPurchaseFlowEvent(unifiedPurchaseEventNameEnumModule.BuyItemModalShown)
		
		if fFlagAddPerformanceMetricsToUnifiedPurchaseModal and purchaseAnalyticsMetadata and purchaseAnalyticsMetadata.surface then
			emitPerformanceMetricsModule(constantsModule.PerformanceMetrics.IntervalName.ProductPurchaseContainerShown, purchaseAnalyticsMetadata.surface)
		end
		if p7.props.purchaseCallbacks and p7.props.purchaseCallbacks.onBuyItemButtonMounted then
			p7.props.purchaseCallbacks.onBuyItemButtonMounted(p21)
		end
	end
end

function name.didMount(p22) --[[ line: 534 ]]
	-- upvalues: windowStateModule (ref), isRelevantRequestType (ref), guiService (ref)
	if p22.props.windowState == windowStateModule.Shown and isRelevantRequestType(p22.props.requestType, p22.props.purchaseFlow) then
		p22:setState({ isAnimating = true })
		p22.configContextActionService(p22.props.windowState)
		guiService.SetPurchasePromptIsShown(true)
	end
end

function name.willUpdate(p23, p24) --[[ line: 548 ]]
	if p23.props.expectedPrice ~= p24.expectedPrice then
		p23:setState({})
	end
end

function name.didUpdate(p25, p26, _) --[[ line: 554 ]]
	-- upvalues: fFlagEnablePurchaseFlowUUIDMigrationModule (ref), promptStateModule (ref), httpService (ref), loggingProtocolModule (ref), purchaseFlowUUIDTelemetryModule (ref), playersService (ref), isRelevantRequestType (ref), guiService (ref), windowStateModule (ref), requestTypeModule (ref), publishAssetAnalyticsModule (ref)
	if not fFlagEnablePurchaseFlowUUIDMigrationModule and p25.props.promptState ~= p26.promptState and p25.props.promptState == promptStateModule.None then
		p25.props.setPurchaseFlowUUID(httpService:GenerateGUID(false))
		loggingProtocolModule.default:logRobloxTelemetryCounter(purchaseFlowUUIDTelemetryModule.ProductPurchaseContainerMigrationCounter, 1, { method = "ProductPurchaseContainerDidUpdate" })
	end
	if playersService.LocalPlayer.GameplayPaused then
		p25.props.onAnalyticEvent("PurchasePromptGamePausedDetected", { place_id = game.PlaceId })
		p25.props.hideWindow()
	end
	local requestType = p25.props.requestType
	
	if p26.windowState ~= p25.props.windowState and isRelevantRequestType(requestType, p25.props.purchaseFlow) then
		p25:setState({ isAnimating = true })
		p25.configContextActionService(p25.props.windowState)
		guiService:SetPurchasePromptIsShown(p25.props.windowState == windowStateModule.Shown)
		
		if p25.props.windowState == windowStateModule.Hidden then
			p25.props.completeRequest()
		end
	end
	if requestType == requestTypeModule.AvatarCreationFee and p25.props.promptState == promptStateModule.PurchaseComplete and p26.promptState ~= promptStateModule.PurchaseComplete then
		publishAssetAnalyticsModule.sendPageLoad(publishAssetAnalyticsModule.Section.ProcessCompleteModal)
	end
	if p26.promptState ~= p25.props.promptState then
		p25.emitPurchaseFlowEvent("ViewShown")
	end
end

function name.getMessageKeysFromPromptState(p27) --[[ line: 613 ]]
	-- upvalues: promptStateModule (ref), purchaseErrorModule (ref), localizationServiceModule (ref), isGenericChallengeResponseModule (ref)
	local promptState = p27.props.promptState
	local productInfo = p27.props.productInfo
	local purchaseError = p27.props.purchaseError
	
	if promptState == promptStateModule.PurchaseComplete then
		return {
			messageText = {
				key = "CoreScripts.PurchasePrompt.PurchaseMessage.Succeeded",
				params = { ITEM_NAME = productInfo.name }
			},
			okText = { key = "CoreScripts.PurchasePrompt.Button.OK" },
			titleText = { key = "CoreScripts.PurchasePrompt.Title.BuyItem" }
		}
	elseif promptState == promptStateModule.U13PaymentModal then
		return {
			messageText = {
				key = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalOne"
			},
			okText = { key = "CoreScripts.PurchasePrompt.Button.OK" },
			titleText = { key = "CoreScripts.PurchasePrompt.Title.BuyItem" }
		}
	elseif promptState == promptStateModule.U13MonthlyThreshold1Modal then
		return {
			messageText = {
				key = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalTwo"
			},
			okText = { key = "CoreScripts.PurchasePrompt.Button.OK" },
			titleText = { key = "CoreScripts.PurchasePrompt.Title.BuyItem" }
		}
	elseif promptState == promptStateModule.U13MonthlyThreshold2Modal then
		return {
			messageText = {
				key = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalParental"
			},
			okText = { key = "CoreScripts.PurchasePrompt.Button.OK" },
			titleText = { key = "CoreScripts.PurchasePrompt.Title.BuyItem" }
		}
	elseif promptState == promptStateModule.ParentalConsentWarningPaymentModal13To17 then
		return {
			messageText = {
				key = "CoreScripts.PurchasePrompt.PurchaseDetails.ParentalConsent"
			},
			okText = { key = "CoreScripts.PurchasePrompt.Button.OK" },
			titleText = { key = "CoreScripts.PurchasePrompt.Title.BuyItem" }
		}
	elseif promptState ~= promptStateModule.Error then return end
	return if purchaseError == purchaseErrorModule.UnknownFailure then {
		messageText = {
			key = localizationServiceModule.getErrorKey(purchaseError),
			params = { ITEM_NAME = productInfo.name }
		},
		okText = { key = "CoreScripts.PurchasePrompt.Button.OK" },
		titleText = { key = "CoreScripts.PremiumModal.Title.Error" }
	} elseif purchaseError == purchaseErrorModule.TwoFactorNeededSettings or isGenericChallengeResponseModule(purchaseError) then {
		messageText = {
			key = "CoreScripts.PurchasePrompt.PurchaseFailed.Enable2SVLogout"
		},
		okText = { key = "CoreScripts.PurchasePrompt.Button.Settings" },
		cancelText = { key = "CoreScripts.PurchasePrompt.CancelPurchase.Cancel" },
		titleText = {
			key = "CoreScripts.PurchasePrompt.Title.VerificationRequired"
		}
	} else {
		messageText = {
			key = localizationServiceModule.getErrorKey(purchaseError)
		},
		okText = { key = "CoreScripts.PurchasePrompt.Button.OK" },
		titleText = { key = "CoreScripts.PremiumModal.Title.Error" }
	}
end

function name.determinePrompt(a) --[[ line: 682 ]]
	-- upvalues: fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (ref), windowStateModule (ref), promptStateModule (ref), isRelevantRequestType (ref), fFlagUnifiedPurchaseAddSkeleton (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), requestTypeModule (ref), purchaseClientSessionIdType (ref), robloxSubscriptionPurchaseAppModule (ref), robloxSubscriptionFlowCompleteReason (ref), fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (ref), surfaceName (ref), appContextModule (ref), surfaceContext (ref), fFlagEnableDiscountInfoInUnifiedPurchaseModal (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), deriveCartPricingView (ref), getUnifiedPurchaseModalTypeModule (ref), unifiedPurchaseModalTypeEnum (ref), shouldShowBlackbirdUpsellModule (ref), fFlagBlackbirdUpsellGateResaleAndTimedOptionModule (ref), getBlackbirdUpsellBannerProductInfoModule (ref), fFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry (ref), unifiedPurchaseEventNameEnumModule (ref), fFlagEnableBlackbirdUpsellImpressionGating (ref), blackbirdUpsellImpressionTrackerModule (ref), fFlagAddCenterDialogForUnifiedPurchaseModal (ref), roact (ref), unifiedProductPurchaseModalV2 (ref), fFlagPurchasePromptSubtitleForTimedOptions (ref), fFlagSkipBuyDelayForExperienceShopModule (ref), unifiedProductPurchaseModal (ref), fFlagPurchasePromptPriceShouldUseProductInfoPriceModule (ref), getPlayerPriceModule (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), productPurchaseSurface (ref), desktopUpsellExperiment (ref), productPurchaseModal (ref), productPurchase (ref), robuxUpsellModal (ref), productPurchaseRobuxUpsell (ref), getFFlagOpenVngTosForVngRobuxUpsell (ref), getAppFeaturePolicies (ref), leaveRobloxAlert (ref), interactiveAlert (ref), robloxTranslatorModule (ref), buttonType (ref), purchaseErrorModule (ref), isGenericChallengeResponseModule (ref), reactModule (ref), productPurchasePromptModule (ref), images (ref), animator (ref), verifiedParentalConsentDialog (ref), robuxUpsellModalTooExpensiveFallback (ref), fFlagPurchaseModalTimedOptionExtension (ref)
	local var79
	local purchaseFlow = a.props.purchaseFlow
	local promptState = a.props.promptState
	local expectedPrice = a.props.expectedPrice
	local requestType = a.props.requestType
	local purchaseError = a.props.purchaseError
	local productInfo = a.props.productInfo
	local accountInfo = a.props.accountInfo
	local isTestPurchase = a.props.isTestPurchase
	
	if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal and a.props.windowState ~= windowStateModule.Shown then
		return nil
	elseif promptState == promptStateModule.None or not isRelevantRequestType(requestType, purchaseFlow, if fFlagUnifiedPurchaseAddSkeleton then promptState else nil) then
		return nil
	elseif promptState == promptStateModule.PromptPurchase or promptState == promptStateModule.PurchaseInProgress or fFlagUnifiedPurchaseAddSkeleton and promptState == promptStateModule.InitializingPurchase then
		if fFlagEnableUnifiedProductPurchaseFlow and a.props.isUserEligibleForUnifiedPurchaseFlow then
			local var83
			local productPrice = a.props.productPrice
			
			if fFlagEnableUnifiedPurchaseFlowForDevSubs and requestType == requestTypeModule.DeveloperSubscription then
				var83 = false
				
				if productInfo.displayPrice ~= nil then
					local _ = productPrice == 0
				end
			else
				var83 = false
			end
			local var84 = function() --[[ line: 722 ]]
				-- upvalues: a (ref), promptStateModule (copy), windowStateModule (copy), purchaseClientSessionIdType (copy), robloxSubscriptionPurchaseAppModule (copy), robloxSubscriptionFlowCompleteReason (copy), fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (copy), surfaceName (copy), appContextModule (copy), surfaceContext (copy)
				a.props.setPromptState(promptStateModule.BlackbirdUpsellInProgress)
				a.props.setWindowState(windowStateModule.Suspended)
				local purchaseFlowUUID = a.props.purchaseFlowUUID
				local var101 = if purchaseFlowUUID and purchaseFlowUUID ~= "" then purchaseFlowUUID else nil
				local var102 = if var101 then {
					clientSessionIdType = purchaseClientSessionIdType.PurchaseFlowUUID,
					clientSessionId = var101
				} else nil
				robloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase({ showBackButton = true }, {
					onFlowComplete = function(p28) --[[ line: 741 ]]
						-- upvalues: robloxSubscriptionFlowCompleteReason (copy), fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (copy), a (copy)
						if p28 == robloxSubscriptionFlowCompleteReason.UpsellPurchaseSucceeded then
							if fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal and a.props.purchaseCallbacks and a.props.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess then
								a.props.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess()
							end
							a.props.retryPurchaseAfterUpsell()
							
							return
						elseif p28 == robloxSubscriptionFlowCompleteReason.UpsellDismissed then
							a.props.completeRequest()
							
							return
						elseif p28 == robloxSubscriptionFlowCompleteReason.UpsellPurchaseFailed then
							a.props.completeRequest()
							
							return
						end
						a.props.completeRequest()
					end,
					onBackButtonActivated = function() --[[ line: 763 ]]
						-- upvalues: a (copy), promptStateModule (copy), windowStateModule (copy)
						a.props.setPromptState(promptStateModule.PromptPurchase)
						a.props.setWindowState(windowStateModule.Shown)
					end
				}, nil, surfaceName.UnifiedProductPurchaseModal, if appContextModule.get() == appContextModule.Enum.IN_APP then surfaceContext.InApp else surfaceContext.InGame, nil, if var102 then { clientSessionId = var102 } else nil)
			end
			
			local var85 = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then if var83 then nil else a.props.price else nil
			local var86 = nil
			
			if fFlagPurchasePromptCartPricingEnabledModule then
				local var87 = deriveCartPricingView(a.props.cartPricingResponse)
				var86 = if not (var83 or var87 == nil or getUnifiedPurchaseModalTypeModule(requestType) ~= unifiedPurchaseModalTypeEnum.MultiItem) then var87.priceAfterDiscount else a.props.productPrice
			end
			var79 = if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then shouldShowBlackbirdUpsellModule(var85, a.props.requestType, var83, if fFlagBlackbirdUpsellGateResaleAndTimedOptionModule then a.props.productPayload else nil) else nil
			local var88 = if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal and var79 and a.props.robloxSubscriptionProducts then getBlackbirdUpsellBannerProductInfoModule(a.props.robloxSubscriptionProducts) else nil
			local var89 = if fFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry or fFlagEnableBlackbirdUpsellImpressionGating then function(p29) --[[ line: 816 ]]
				-- upvalues: a (ref), fFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry (copy), var88 (ref), unifiedPurchaseEventNameEnumModule (copy), fFlagEnableBlackbirdUpsellImpressionGating (copy), blackbirdUpsellImpressionTrackerModule (copy)
				a.onBuyItemButtonMounted(p29)
				
				if fFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry and var88 then
					a.emitUnifiedProductPurchaseFlowEvent(unifiedPurchaseEventNameEnumModule.SubscriptionUpsellBannerShown)
				end
				if fFlagEnableBlackbirdUpsellImpressionGating and var88 then
					blackbirdUpsellImpressionTrackerModule.incrementImpressionCount()
				end
			end else a.onBuyItemButtonMounted
			local var90 = if fFlagPurchasePromptCartPricingEnabledModule then function(_, p30) --[[ line: 833 ]]
				-- upvalues: a (ref)
				if p30 ~= nil then
					a.props.fetchCartPricing(p30)
				end
			end else nil
			
			if fFlagAddCenterDialogForUnifiedPurchaseModal and appContextModule.get() == appContextModule.Enum.IN_APP then
				local createElement = roact.createElement
				local var91 = unifiedProductPurchaseModalV2
				local t = {
					product = {
						itemIcon = productInfo.imageUrl,
						itemName = productInfo.name,
						itemRobuxCost = if var83 then nil elseif fFlagPurchasePromptCartPricingEnabledModule then var86 else a.props.productPrice,
						itemDisplayPrice = if var83 then productInfo.displayPrice else nil,
						itemPrice = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then var85 else nil,
						model = a.props.humanoidModel
					},
					subtitleView = if fFlagPurchasePromptSubtitleForTimedOptions then a.props.subtitleView else nil
				}
				local t_1 = { buyItemActivated = a.confirmButtonPressed }
				local var94 = a.isWindowShowAndDoneAnimating()
				
				if var94 then
					var94 = a.buyButtonUsesFoundationInputDelay
					
					if var94 then
						var94 = not (fFlagSkipBuyDelayForExperienceShopModule and a.isFromShopSkip())
					end
				end
				local var95
				t_1.buyItemEnableInputDelayed = var94
				t_1.cancelActivated = a.cancelButtonPressed
				t_1.isDisabled = promptState == promptStateModule.PurchaseInProgress
				t.buttons = t_1
				t.postPurchaseActions = a.props.postPurchaseActions
				t.setPostPurchaseActions = a.props.setPostPurchaseActions
				t.onBuyItemButtonMounted = var89
				t.purchaseModalType = getUnifiedPurchaseModalTypeModule(a.props.requestType)
				t.robuxBalanceAmount = accountInfo.balance
				t.isTestPurchase = isTestPurchase
				
				if fFlagUnifiedPurchaseAddSkeleton then
					var95 = promptState == promptStateModule.InitializingPurchase
					var95 = nil
				else
					var95 = nil
				end
				t.isLoading = var95
				t.isCartPricingLoading = if fFlagPurchasePromptCartPricingEnabledModule then a.props.isCartPricingLoading else nil
				t.onBlackbirdUpsellActivated = if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then var84 else nil
				t.BlackbirdUpsellBannerProductInfo = var88
				t.cartPricingResponse = if fFlagPurchasePromptCartPricingEnabledModule then a.props.cartPricingResponse else nil
				t.onCartOfferAppliedChanged = if fFlagPurchasePromptCartPricingEnabledModule then var90 else nil
				
				return createElement(var91, t)
			else
				local createElement = roact.createElement
				local var96 = unifiedProductPurchaseModal
				local t = {
					product = {
						itemIcon = productInfo.imageUrl,
						itemName = productInfo.name,
						itemRobuxCost = if var83 then nil elseif fFlagPurchasePromptPriceShouldUseProductInfoPriceModule then a.props.productPrice else getPlayerPriceModule(productInfo, accountInfo.membershipType == 4, expectedPrice),
						itemDisplayPrice = if var83 then productInfo.displayPrice else nil,
						itemPrice = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then var85 else nil,
						model = a.props.humanoidModel
					}
				}
				local t_1 = { buyItemActivated = a.confirmButtonPressed }
				local var99 = a.isWindowShowAndDoneAnimating()
				
				if var99 then
					var99 = a.buyButtonUsesFoundationInputDelay
					
					if var99 then
						var99 = not (fFlagSkipBuyDelayForExperienceShopModule and a.isFromShopSkip())
					end
				end
				t_1.buyItemEnableInputDelayed = var99
				t_1.cancelActivated = a.cancelButtonPressed
				t_1.isDisabled = promptState == promptStateModule.PurchaseInProgress
				t.buttons = t_1
				t.postPurchaseActions = a.props.postPurchaseActions
				t.setPostPurchaseActions = a.props.setPostPurchaseActions
				t.onBuyItemButtonMounted = var89
				t.purchaseModalType = getUnifiedPurchaseModalTypeModule(a.props.requestType)
				t.robuxBalanceAmount = accountInfo.balance
				t.isTestPurchase = isTestPurchase
				t.onBlackbirdUpsellActivated = if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then var84 else nil
				t.BlackbirdUpsellBannerProductInfo = var88
				local var100 = var83
				
				if not var100 then
					if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
						var100 = a.props.purchaseAnalyticsMetadata
						
						if var100 then
							var100 = a.props.purchaseAnalyticsMetadata.surface == productPurchaseSurface.Catalog
							var100 = nil
						end
					else
						var100 = nil
					end
				end
				t.hideUserRobuxBalance = var100
				
				return createElement(var96, t)
			end
		else
			return if desktopUpsellExperiment.shouldShowNewModal() then roact.createElement(productPurchaseModal, {
				screenSize = a.state.screenSize,
				product = {
					itemIcon = productInfo.imageUrl,
					itemName = productInfo.name,
					itemRobuxCost = if fFlagPurchasePromptPriceShouldUseProductInfoPriceModule then a.props.productPrice else getPlayerPriceModule(productInfo, accountInfo.membershipType == 4, expectedPrice)
				},
				balanceAmount = accountInfo.balance,
				balanceAmountValid = game:DefineFastFlag("BalanceNotShowingInExperimentIssueFix", false) and not accountInfo.hasFailed,
				buttons = {
					isDisabled = promptState == promptStateModule.PurchaseInProgress,
					buyItemActivated = a.confirmButtonPressed,
					buyItemControllerIcon = if a.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil,
					buyItemIsDelayedInput = a.hasDelayedInput(),
					buyItemEnableInputDelayed = a.isWindowShowAndDoneAnimating(),
					cancelActivated = a.cancelButtonPressed
				}
			}) else roact.createElement(productPurchase, {
				screenSize = a.state.screenSize,
				isDisabled = promptState == promptStateModule.PurchaseInProgress,
				model = a.props.humanoidModel,
				itemIcon = productInfo.imageUrl,
				itemName = productInfo.name,
				itemRobuxCost = if fFlagPurchasePromptPriceShouldUseProductInfoPriceModule then a.props.productPrice else getPlayerPriceModule(productInfo, accountInfo.membershipType == 4, expectedPrice),
				currentBalance = accountInfo.balance,
				currentBalanceValid = not accountInfo.hasFailed,
				testPurchase = isTestPurchase,
				isDelayedInput = a.hasDelayedInput(),
				enableInputDelayed = a.isWindowShowAndDoneAnimating(),
				buyItemControllerIcon = if a.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil,
				cancelControllerIcon = if a.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" else nil,
				buyItemActivated = a.confirmButtonPressed,
				cancelPurchaseActivated = a.cancelButtonPressed,
				isLuobu = a.state.isLuobu
			})
		end
	elseif promptState == promptStateModule.RobuxUpsell or promptState == promptStateModule.UpsellInProgress then
		if desktopUpsellExperiment.shouldShowNewModal() then
			local createElement = roact.createElement
			local var76 = robuxUpsellModal
			local t = {
				screenSize = a.state.screenSize,
				product = {
					model = a.props.humanoidModel,
					itemIcon = productInfo.imageUrl,
					itemName = productInfo.name,
					itemRobuxCost = if fFlagPurchasePromptPriceShouldUseProductInfoPriceModule then a.props.productPrice else getPlayerPriceModule(productInfo, accountInfo.membershipType == 4, expectedPrice)
				},
				upsell = {
					balanceAmount = accountInfo.balance,
					robuxPurchaseAmount = a.props.robuxPurchaseAmount,
					robuxPurchaseAmountBeforeBonus = a.props.robuxAmountBeforeBonus,
					robuxPurchaseCost = a.props.robuxPurchaseCost
				}
			}
			local t_1 = {
				buyItemActivated = function() --[[ line: 1001 ]]
					-- upvalues: a (ref)
					a.confirmButtonPressed()
					a.emitPurchaseFlowEvent("UserInput", "Buy")
				end,
				buyItemDisabled = promptState == promptStateModule.UpsellInProgress,
				buyItemControllerIcon = if a.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil,
				buyItemisDelayedInput = a.hasDelayedInput()
			}
			var79 = a.isWindowShowAndDoneAnimating()
			
			if var79 then
				var79 = not (fFlagSkipBuyDelayForExperienceShopModule and a.isFromShopSkip())
			end
			t_1.buyItemEnableInputDelayed = var79
			
			function t_1.cancelPurchaseActivated() --[[ line: 1011 ]]
				-- upvalues: a (ref)
				a.cancelButtonPressed()
				a.emitPurchaseFlowEvent("UserInput", "Cancel")
			end
			
			t_1.cancelControllerIcon = if a.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" else nil
			t_1.opensBuyRobuxPage = desktopUpsellExperiment.getVariant() == desktopUpsellExperiment.variants.OpenRobuxStore
			t.buttons = t_1
			
			return createElement(var76, t)
		else
			local createElement = roact.createElement
			local var80 = productPurchaseRobuxUpsell
			local t = {
				screenSize = a.state.screenSize,
				isDisabled = promptState == promptStateModule.UpsellInProgress,
				model = a.props.humanoidModel,
				itemIcon = productInfo.imageUrl,
				itemName = productInfo.name,
				itemRobuxCost = if fFlagPurchasePromptPriceShouldUseProductInfoPriceModule then a.props.productPrice else getPlayerPriceModule(productInfo, accountInfo.membershipType == 4, expectedPrice),
				robuxPurchaseAmount = a.props.robuxPurchaseAmount,
				robuxPurchaseAmountBeforeBonus = a.props.robuxAmountBeforeBonus,
				balanceAmount = accountInfo.balance,
				isDelayedInput = a.hasDelayedInput()
			}
			local var82 = a.isWindowShowAndDoneAnimating()
			
			if var82 then
				var79 = fFlagSkipBuyDelayForExperienceShopModule and a.isFromShopSkip()
				var82 = not var79
			end
			t.enableInputDelayed = var82
			t.buyItemControllerIcon = if a.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil
			t.cancelControllerIcon = if a.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" else nil
			
			function t.buyItemActivated() --[[ line: 1042 ]]
				-- upvalues: a (ref)
				a.confirmButtonPressed()
				a.emitPurchaseFlowEvent("UserInput", "Buy")
			end
			
			function t.cancelPurchaseActivated() --[[ line: 1046 ]]
				-- upvalues: a (ref)
				a.cancelButtonPressed()
				a.emitPurchaseFlowEvent("UserInput", "Cancel")
			end
			
			t.isLuobu = a.state.isLuobu
			t.isVng = getFFlagOpenVngTosForVngRobuxUpsell() and getAppFeaturePolicies().getShowVNGTosForRobuxUpsell()
			
			return createElement(var80, t)
		end
	else
		return if promptState == promptStateModule.LeaveRobloxWarning then roact.createElement(leaveRobloxAlert, {
			screenSize = a.state.screenSize,
			cancelActivated = a.cancelButtonPressed,
			continueActivated = a.confirmButtonPressed
		}) elseif promptState == promptStateModule.PurchaseComplete and requestType == requestTypeModule.AvatarCreationFee then roact.createElement(interactiveAlert, {
			bodyText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.PurchaseCompleteDescription"),
			buttonStackInfo = {
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = a.confirmButtonPressed,
							text = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.ResultModalOk"),
							inputIcon = if a.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil
						}
					}
				}
			},
			screenSize = a.state.screenSize,
			title = robloxTranslatorModule:FormatByKey("CoreScripts.BulkPurchasePrompt.CompletedPrompt.SuccessHeading")
		}) elseif promptState == promptStateModule.Error and purchaseError == purchaseErrorModule.TwoFactorNeededSettings or isGenericChallengeResponseModule(purchaseError) then reactModule.createElement(productPurchasePromptModule, {
			includeCancelButton = true,
			screenSize = a.state.screenSize,
			titleIcon = images["icons/status/error_large"],
			promptState = promptState,
			productInfo = productInfo,
			purchaseError = purchaseError,
			economicRestrictionError = a.props.economicRestrictionError or {},
			isGamepadEnabled = a.props.isGamepadEnabled,
			cancelButtonPressed = a.cancelButtonPressed,
			confirmButtonPressed = a.confirmButtonPressed,
			isGenericChallengeResponse = isGenericChallengeResponseModule,
			useUnifiedPurchaseCompletionModal = if fFlagEnableUnifiedProductPurchaseFlow then a.props.isUserEligibleForUnifiedPurchaseFlow else nil
		}) elseif promptState == promptStateModule.EnablePurchaseVPCModal then roact.createElement(animator, {
			shouldAnimate = true,
			shouldShow = promptState == promptStateModule.EnablePurchaseVPCModal,
			renderChildren = function() --[[ line: 1102 ]]
				-- upvalues: roact (copy), verifiedParentalConsentDialog (copy), a (ref), promptState (ref)
				return roact.createElement(verifiedParentalConsentDialog, {
					isActionable = false,
					screenSize = a.state.screenSize,
					modalType = a.getVPCModalType(promptState),
					onDismiss = function() --[[ line: 1107 ]]
						-- upvalues: a (copy)
						a.confirmButtonPressed()
					end
				})
			end
		}) elseif promptState == promptStateModule.Error and purchaseError == purchaseErrorModule.NotEnoughRobuxXbox and desktopUpsellExperiment.shouldShowNewModal() then roact.createElement(robuxUpsellModalTooExpensiveFallback, {
			screenSize = a.state.screenSize,
			product = {
				itemIcon = productInfo.imageUrl,
				itemName = productInfo.name,
				itemRobuxCost = if fFlagPurchasePromptPriceShouldUseProductInfoPriceModule then a.props.productPrice else getPlayerPriceModule(productInfo, accountInfo.membershipType == 4, expectedPrice)
			},
			balanceAmount = accountInfo.balance,
			doneActivated = function() --[[ line: 1130 ]]
				-- upvalues: a (ref)
				a.cancelButtonPressed()
				a.emitPurchaseFlowEvent("UserInput", "Cancel")
			end
		}) else reactModule.createElement(productPurchasePromptModule, {
			includeCancelButton = false,
			screenSize = a.state.screenSize,
			promptState = promptState,
			productInfo = productInfo,
			purchaseError = purchaseError,
			economicRestrictionError = a.props.economicRestrictionError or {},
			isGamepadEnabled = a.props.isGamepadEnabled,
			cancelButtonPressed = a.cancelButtonPressed,
			confirmButtonPressed = a.confirmButtonPressed,
			isGenericChallengeResponse = isGenericChallengeResponseModule,
			useUnifiedPurchaseCompletionModal = if fFlagEnableUnifiedProductPurchaseFlow then a.props.isUserEligibleForUnifiedPurchaseFlow else nil,
			isMultiItem = getUnifiedPurchaseModalTypeModule(a.props.requestType) == unifiedPurchaseModalTypeEnum.MultiItem,
			timedOptionDays = if fFlagPurchasePromptSubtitleForTimedOptions then a.props.timedOptionDays else nil,
			completionMessage = if fFlagPurchaseModalTimedOptionExtension then a.props.completionMessage else nil
		})
	end
end

function name.render(p31) --[[ line: 1158 ]]
	-- upvalues: fFlagSetMenuOnPurchasePromptModule (ref), guiService (ref), roact (ref), animatorModule (ref), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (ref), windowStateModule (ref), requestTypeModule (ref), promptStateModule (ref), publishAssetAnalyticsModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), externalEventConnectionModule (ref), coreGuiService (ref)
	local promptState = p31.props.promptState
	local var103 = p31:determinePrompt()
	
	if fFlagSetMenuOnPurchasePromptModule then
		if var103 ~= nil then
			p31.menuOpenedBySelf = true
		end
		guiService:SetMenuIsOpen(var103 ~= nil, "ProductPurchaseContainer")
	end
	local var108
	local createElement = roact.createElement
	local var104 = "Frame"
	local t = {
		Size = UDim2.new(1, 0, 1, 0),
		[roact.Change.AbsoluteSize] = p31.changeScreenSize,
		BackgroundTransparency = 1
	}
	local t_1 = {}
	local createElement_1 = roact.createElement
	local t_2 = {}
	
	if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then
		var108 = p31.props.windowState == windowStateModule.Shown
		var108 = nil
	else
		var108 = p31.props.windowState ~= windowStateModule.Hidden
	end
	t_2.shouldShow = var108
	
	function t_2.onShown() --[[ line: 1178 ]]
		-- upvalues: p31 (ref), requestTypeModule (copy), promptState (ref), promptStateModule (copy), publishAssetAnalyticsModule (copy)
		if p31.props.requestType == requestTypeModule.AvatarCreationFee and promptState == promptStateModule.PromptPurchase then
			publishAssetAnalyticsModule.sendPageLoad(publishAssetAnalyticsModule.Section.BuyItemModal)
		end
		p31:setState({ isAnimating = false, doneAnimatingTime = os.clock() })
	end
	
	function t_2.onHidden() --[[ line: 1190 ]]
		-- upvalues: p31 (ref)
		p31:setState({ isAnimating = nil, doneAnimatingTime = nil })
	end
	
	t_2.skipAnimation = if fFlagEnableUnifiedProductPurchaseFlow then p31.props.isUserEligibleForUnifiedPurchaseFlow else nil
	t_2[roact.Ref] = p31.animatorRef
	t_1.Animator = createElement_1(animatorModule, t_2, {
		Prompt = var103,
		ModalFix = var103 ~= nil and roact.createElement("ImageButton", {
			BackgroundTransparency = 0,
			Modal = true,
			Size = UDim2.new(0, 0, 0, 0)
		}) or nil
	})
	t_1.OnCoreGuiMenuOpened = roact.createElement(externalEventConnectionModule, {
		event = guiService.MenuOpened,
		callback = function() --[[ line: 1211 ]]
			-- upvalues: fFlagSetMenuOnPurchasePromptModule (copy), p31 (ref)
			if fFlagSetMenuOnPurchasePromptModule and p31.menuOpenedBySelf then
				p31.menuOpenedBySelf = false
				
				return
			elseif p31.props.hideWindow then
				p31.props.hideWindow()
			end
		end
	})
	t_1.OnUserGuiRenderingChanged = roact.createElement(externalEventConnectionModule, {
		event = coreGuiService.UserGuiRenderingChanged,
		callback = function(p32, p33) --[[ line: 1223 ]]
			-- upvalues: p31 (ref)
			if not p32 or not p33 then
				p31.props.hideWindow()
			end
		end
	})
	
	return createElement(var104, t, t_1)
end

return connectToStoreModule(function(p34) --[[ line: 1233 | named "mapStateToProps" ]]
	-- upvalues: isMockingPurchasesModule (ref), selectedRobuxPackageModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagPurchasePromptPriceShouldUseProductInfoPriceModule (ref), selectProductPriceModule (ref), var43 (ref), fFlagPurchasePromptSubtitleForTimedOptions (ref), fFlagPurchaseModalTimedOptionExtension (ref), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (ref), fFlagBlackbirdUpsellGateResaleAndTimedOptionModule (ref), fFlagSkipBuyDelayForExperienceShopModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), selectCartPricingResponseModule (ref), selectIsCartPricingFetchingModule (ref)
	return {
		purchaseFlowUUID = p34.purchaseFlowUUID,
		purchaseFlow = p34.purchaseFlow,
		promptState = p34.promptState,
		requestType = p34.promptRequest.requestType,
		humanoidModel = p34.promptRequest.humanoidModel,
		expectedPrice = p34.promptRequest.expectedPrice,
		windowState = p34.windowState,
		purchaseError = p34.purchaseError,
		economicRestrictionError = p34.economicRestrictionError,
		productInfo = p34.productInfo,
		accountInfo = p34.accountInfo,
		robuxPurchaseAmount = selectedRobuxPackageModule.getRobuxPurchaseAmount(p34),
		robuxAmountBeforeBonus = selectedRobuxPackageModule.getRobuxAmountBeforeBonus(p34),
		robuxPurchaseCost = selectedRobuxPackageModule.getPrice(p34),
		isTestPurchase = isMockingPurchasesModule(p34.promptRequest.requestType),
		isGamepadEnabled = p34.gamepadEnabled,
		desktopUpsellExpVariant = if p34.abVariations then p34.abVariations.DesktopUpsellExpVariant else nil,
		postPurchaseActions = if fFlagEnableUnifiedProductPurchaseFlow then p34.postPurchaseActions else nil,
		purchaseCallbacks = if fFlagEnableUnifiedProductPurchaseFlow then p34.purchaseCallbacks else nil,
		isUserEligibleForUnifiedPurchaseFlow = if fFlagEnableUnifiedProductPurchaseFlow then p34.isUserEligibleForUnifiedPurchaseFlow else nil,
		purchaseAnalyticsMetadata = if fFlagEnableUnifiedProductPurchaseFlow then p34.purchaseAnalyticsMetadata else nil,
		productPrice = if fFlagPurchasePromptPriceShouldUseProductInfoPriceModule then selectProductPriceModule(p34) else nil,
		price = if var43 then var43(p34) else nil,
		timedOptionDays = if fFlagPurchasePromptSubtitleForTimedOptions and p34.productPayload then p34.productPayload.timedOptionDays else nil,
		completionMessage = if fFlagPurchaseModalTimedOptionExtension and p34.purchaseOptions then p34.purchaseOptions.completionMessage else nil,
		robloxSubscriptionProducts = if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then p34.robloxSubscriptionProducts else nil,
		productPayload = if fFlagBlackbirdUpsellGateResaleAndTimedOptionModule or fFlagSkipBuyDelayForExperienceShopModule then p34.productPayload else nil,
		cartPricingResponse = if fFlagPurchasePromptCartPricingEnabledModule then selectCartPricingResponseModule(p34) else nil,
		isCartPricingLoading = if fFlagPurchasePromptCartPricingEnabledModule then selectIsCartPricingFetchingModule(p34) else nil
	}
end, function(p35) --[[ line: 1285 | named "mapDispatchToProps" ]]
	-- upvalues: setPurchaseFlowUUIDModule (ref), purchaseItemModule (ref), completePurchaseModule (ref), launchRobuxUpsellModule (ref), openSecuritySettingsModule (ref), initiateUserPurchaseSettingsPrecheckModule (ref), hideWindowModule (ref), retryPurchaseAfterUpsellModule (ref), setWindowStateModule (ref), fFlagAddCursorProviderToPurchasePromptApp (ref), guiService (ref), completeRequestModule (ref), sendEventModule (ref), setPostPurchaseActionsModule (ref), setPromptStateModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), fetchCartPricingModule (ref)
	return {
		setPurchaseFlowUUID = function(value) --[[ line: 1287 ]]
			-- upvalues: p35 (ref), setPurchaseFlowUUIDModule (copy)
			p35(setPurchaseFlowUUIDModule(value))
		end,
		onBuy = function() --[[ line: 1290 ]]
			-- upvalues: p35 (ref), purchaseItemModule (copy)
			p35(purchaseItemModule())
		end,
		completePurchase = function() --[[ line: 1293 ]]
			-- upvalues: p35 (ref), completePurchaseModule (copy)
			p35(completePurchaseModule())
		end,
		onScaryModalConfirm = function() --[[ line: 1296 ]]
			-- upvalues: p35 (ref), launchRobuxUpsellModule (copy)
			p35(launchRobuxUpsellModule())
		end,
		onOpenSecuritySettings = function(value) --[[ line: 1299 ]]
			-- upvalues: p35 (ref), openSecuritySettingsModule (copy)
			if value then
				p35(openSecuritySettingsModule(value))
				
				return
			end
			p35(openSecuritySettingsModule())
		end,
		onRobuxUpsell = function() --[[ line: 1306 ]]
			-- upvalues: p35 (ref), initiateUserPurchaseSettingsPrecheckModule (copy)
			p35(initiateUserPurchaseSettingsPrecheckModule())
		end,
		hideWindow = function() --[[ line: 1309 ]]
			-- upvalues: p35 (ref), hideWindowModule (copy)
			p35(hideWindowModule())
		end,
		retryPurchaseAfterUpsell = function() --[[ line: 1312 ]]
			-- upvalues: p35 (ref), retryPurchaseAfterUpsellModule (copy)
			p35(retryPurchaseAfterUpsellModule())
		end,
		setWindowState = function(value) --[[ line: 1315 ]]
			-- upvalues: p35 (ref), setWindowStateModule (copy)
			p35(setWindowStateModule(value))
		end,
		completeRequest = function() --[[ line: 1318 ]]
			-- upvalues: fFlagAddCursorProviderToPurchasePromptApp (copy), guiService (copy), p35 (ref), completeRequestModule (copy)
			if fFlagAddCursorProviderToPurchasePromptApp then
				guiService.SelectedCoreObject = nil
			end
			p35(completeRequestModule())
		end,
		onAnalyticEvent = function(p36, p37) --[[ line: 1324 ]]
			-- upvalues: p35 (ref), sendEventModule (copy)
			p35(sendEventModule(p36, p37))
		end,
		setPostPurchaseActions = function(value) --[[ line: 1327 ]]
			-- upvalues: p35 (ref), setPostPurchaseActionsModule (copy)
			p35(setPostPurchaseActionsModule(value))
		end,
		setPromptState = function(value) --[[ line: 1330 ]]
			-- upvalues: p35 (ref), setPromptStateModule (copy)
			p35(setPromptStateModule(value))
		end,
		fetchCartPricing = if fFlagPurchasePromptCartPricingEnabledModule then function(p38) --[[ line: 1334 ]]
			-- upvalues: p35 (ref), fetchCartPricingModule (copy)
			p35(fetchCartPricingModule(p38))
		end else nil
	}
end)(name)