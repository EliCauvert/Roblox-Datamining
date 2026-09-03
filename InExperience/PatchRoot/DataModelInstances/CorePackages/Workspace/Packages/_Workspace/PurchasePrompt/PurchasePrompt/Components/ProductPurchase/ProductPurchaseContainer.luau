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
local fFlagEnableOffersOnInExperienceSurface = sharedFlagsModule.FFlagEnableOffersOnInExperienceSurface
local selectPriceModule = require(purchasePrompt.Selectors.selectPrice)
local setPromptStateModule = require(purchasePrompt.Actions.SetPromptState)
local httpService = game:GetService("HttpService")
local setPurchaseFlowUUIDModule = require(purchasePrompt.Actions.SetPurchaseFlowUUID)
local setPostPurchaseActionsModule = require(purchasePrompt.Actions.SetPostPurchaseActions)
local sendUnifiedPurchaseEventLogModule = require(purchasePrompt.Utils.sendUnifiedPurchaseEventLog)
local unifiedPurchaseEventNameEnumModule = require(purchasePrompt.Enums.UnifiedPurchaseEventNameEnum)
local constantsModule = require(purchasePrompt.Misc.Constants)
local fFlagEnablePurchaseFlowUUIDMigrationModule = require(purchasePrompt.Flags.FFlagEnablePurchaseFlowUUIDMigration)
local fFlagEnableLaunchAfterPurchase = require(parent.SharedFlags).FFlagEnableLaunchAfterPurchase
local var1 = if fFlagEnableLaunchAfterPurchase then require(parent.ExperienceService).ExperienceService else nil
local loggingProtocolModule = require(parent.LoggingProtocol)
local purchaseFlowUUIDTelemetryModule = require(purchasePrompt.Events.PurchaseFlowUUIDTelemetry)
local unifiedPurchaseTelemetryModule = require(purchasePrompt.Events.UnifiedPurchaseTelemetry)
local appContextModule = require(purchasePrompt.Utils.AppContext)
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local fFlagEnableInExperienceOffersPurchaseFlow = sharedFlagsModule.FFlagEnableInExperienceOffersPurchaseFlow
local fetchCartPricingModule = require(purchasePrompt.Thunks.fetchCartPricing)
local fetchInGameItemCartPricingModule = require(purchasePrompt.Thunks.fetchInGameItemCartPricing)
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
local getFFlagOpenVngTosForVngRobuxUpsell = require(parent.SharedFlags).GetFFlagOpenVngTosForVngRobuxUpsell
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
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

local function isRelevantRequestType(p1, p2, p3)
	-- upvalues: fFlagUnifiedPurchaseAddSkeleton (ref), promptStateModule (ref), purchaseFlowModule (ref), requestTypeModule (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref)
	return if fFlagUnifiedPurchaseAddSkeleton and p3 == promptStateModule.InitializingPurchase and p2 == purchaseFlowModule.RobuxUpsellV2 then true elseif p2 == purchaseFlowModule.RobuxUpsellV2 or p2 == purchaseFlowModule.LargeRobuxUpsell then false elseif p1 ~= requestTypeModule.Asset then if p1 ~= requestTypeModule.Bundle then if p1 ~= requestTypeModule.GamePass then if p1 ~= requestTypeModule.Product then if p1 ~= requestTypeModule.AvatarCreationFee then if p1 ~= requestTypeModule.Experience then if p1 ~= requestTypeModule.Look then fFlagEnableUnifiedPurchaseFlowForDevSubs and p1 == requestTypeModule.DeveloperSubscription else true else true else true else true else true else true else true
end

local function _(p1, p2, p3)
	-- upvalues: fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), requestTypeModule (ref)
	return not (not fFlagEnableUnifiedPurchaseFlowForDevSubs or p1 ~= requestTypeModule.DeveloperSubscription) and (p2.displayPrice ~= nil and p3 == 0)
end

local _ = function(p1)
	-- upvalues: promptStateModule (ref)
	return ({
		[promptStateModule.RobuxUpsell] = "PurchaseModal",
		[promptStateModule.UpsellInProgress] = "RobuxPurchasePending"
	})[p1]
end

function name.init(p1)
	-- upvalues: httpService (ref), fFlagEnablePurchaseFlowUUIDMigrationModule (ref), loggingProtocolModule (ref), purchaseFlowUUIDTelemetryModule (ref), cachedPolicyServiceModule (ref), promptStateModule (ref), fFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice (ref), fFlagUnifiedPurchaseGamepassAddProductUniverseId (ref), sendUnifiedPurchaseEventLogModule (ref), removeDelayedInputForUnifiedPurchaseModal (ref), fFlagSkipBuyDelayForExperienceShopModule (ref), appContextModule (ref), playersService (ref), isRelevantRequestType (ref), logUnifiedPurchaseTelemetryCounterModule (ref), unifiedPurchaseTelemetryModule (ref), unifiedPurchaseEventNameEnumModule (ref), purchaseErrorModule (ref), isGenericChallengeResponseModule (ref), requestTypeModule (ref), publishAssetAnalyticsModule (ref), fFlagEnableLaunchAfterPurchase (ref), var1 (ref), windowStateModule (ref), contextActionService (ref), VPCModalTypeModule (ref), fFlagAddPerformanceMetricsToUnifiedPurchaseModal (ref), emitPerformanceMetricsModule (ref), constantsModule (ref)
	p1.state = {
		isLuobu = false,
		screenSize = Vector2.new(0, 0),
		analyticId = httpService:GenerateGUID(false)
	}
	
	if not fFlagEnablePurchaseFlowUUIDMigrationModule then
		p1.props.setPurchaseFlowUUID(httpService:GenerateGUID(false))
		loggingProtocolModule.default:logRobloxTelemetryCounter(purchaseFlowUUIDTelemetryModule.ProductPurchaseContainerMigrationCounter, 1, { method = "ProductPurchaseContainerInit" })
	end
	coroutine.wrap(function()
		-- upvalues: cachedPolicyServiceModule (copy), p1 (ref)
		if cachedPolicyServiceModule:IsSubjectToChinaPolicies() then
			p1:setState({ isLuobu = true })
		end
	end)()
	
	function p7.emitPurchaseFlowEvent(p2, p3)
		-- upvalues: p1 (ref), promptStateModule (copy), httpService (copy)
		local promptState = ({
			[promptStateModule.RobuxUpsell] = "PurchaseModal",
			[promptStateModule.UpsellInProgress] = "RobuxPurchasePending"
		})[p1.props.promptState]
		
		if promptState then
			p1.props.onAnalyticEvent("UserPurchaseFlow", {
				purchase_flow = "InGameRobuxUpsell",
				purchase_flow_uuid = p1.props.purchaseFlowUUID,
				view_name = promptState,
				purchase_event_type = p2,
				input_type = p3,
				event_metadata = httpService:JSONEncode({
					universe_id = tostring(game.GameId),
					item_product_id = tostring(p1.props.productInfo.productId),
					item_name = p1.props.productInfo.name,
					price = tostring(p1.props.productInfo.price),
					user_balance = tostring(p1.props.accountInfo.balance) or nil,
					package_robux_amount = tostring(p1.props.robuxPurchaseAmount) or nil
				})
			})
			
			return
		end
	end
	
	function p7.emitUnifiedProductPurchaseFlowEvent(p2)
		-- upvalues: p1 (ref), fFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice (copy), fFlagUnifiedPurchaseGamepassAddProductUniverseId (copy), sendUnifiedPurchaseEventLogModule (copy)
		local purchaseAnalyticsMetadata = p1.props.purchaseAnalyticsMetadata or {}
		sendUnifiedPurchaseEventLogModule({
			event_name = p2,
			purchase_flow_uuid = purchaseAnalyticsMetadata.purchaseFlowUUID,
			product_id = purchaseAnalyticsMetadata.productId,
			product_type = purchaseAnalyticsMetadata.productType,
			product_target_id = purchaseAnalyticsMetadata.productTargetId,
			robux_price = if fFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice and p1.props.productPrice ~= nil then p1.props.productPrice else purchaseAnalyticsMetadata.price,
			surface = purchaseAnalyticsMetadata.surface,
			user_roblox_balance = purchaseAnalyticsMetadata.userRobuxBalance,
			salelocation_universeid = purchaseAnalyticsMetadata.saleLocationUniverseId,
			product_universeid = if fFlagUnifiedPurchaseGamepassAddProductUniverseId then purchaseAnalyticsMetadata.productUniverseId else nil
		})
	end
	
	function p7.changeScreenSize(p2)
		-- upvalues: p1 (ref)
		if p1.state.screenSize ~= p2.AbsoluteSize then
			p1:setState({ screenSize = p2.AbsoluteSize })
		end
	end
	
	function p7.isFromShopSkip()
		-- upvalues: p1 (ref)
		return p1.props.productPayload ~= nil and p1.props.productPayload.isFromInExperienceShop == true
	end
	
	function p7.hasDelayedInput()
		-- upvalues: removeDelayedInputForUnifiedPurchaseModal (copy), p1 (ref), promptStateModule (copy), fFlagSkipBuyDelayForExperienceShopModule (copy)
		if not removeDelayedInputForUnifiedPurchaseModal and p1.props.isTestPurchase then
			return false
		end
		local promptState = p1.props.promptState
		
		return if promptState == promptStateModule.PromptPurchase and p1.buyButtonUsesFoundationInputDelay and (not fFlagSkipBuyDelayForExperienceShopModule or not p1.isFromShopSkip()) then true elseif removeDelayedInputForUnifiedPurchaseModal then if fFlagSkipBuyDelayForExperienceShopModule and p1.isFromShopSkip() and (promptState == promptStateModule.RobuxUpsell or promptState == promptStateModule.UpsellInProgress) then false elseif promptState ~= promptStateModule.PurchaseInProgress then if promptState ~= promptStateModule.RobuxUpsell then promptState == promptStateModule.UpsellInProgress else true else true elseif fFlagSkipBuyDelayForExperienceShopModule and p1.isFromShopSkip() and (promptState == promptStateModule.PromptPurchase or promptState == promptStateModule.RobuxUpsell or promptState == promptStateModule.UpsellInProgress) then false elseif promptState ~= promptStateModule.PromptPurchase then if promptState ~= promptStateModule.PurchaseInProgress then if promptState ~= promptStateModule.RobuxUpsell then promptState == promptStateModule.UpsellInProgress else true else true else true
	end
	
	function p7.isWindowShowAndDoneAnimating()
		-- upvalues: p1 (ref)
		return p1.state.isAnimating == false
	end
	
	p1.buyButtonUsesFoundationInputDelay = appContextModule.get() == appContextModule.Enum.IN_EXPERIENCE
	
	function p7.canConfirmInput()
		-- upvalues: playersService (copy), p1 (ref)
		if playersService.LocalPlayer.GameplayPaused then
			return false
		end
		local var2 = p1.isWindowShowAndDoneAnimating()
		
		return if p1.hasDelayedInput() then var2 and (if p1.state.doneAnimatingTime then os.clock() - p1.state.doneAnimatingTime > 2.5 else false) else var2
	end
	
	function p7.getConfirmButtonAction(p2, p3, p4)
		-- upvalues: promptStateModule (copy), isRelevantRequestType (copy), p1 (ref), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), unifiedPurchaseEventNameEnumModule (copy), purchaseErrorModule (copy), isGenericChallengeResponseModule (copy)
		if p2 == promptStateModule.None or not isRelevantRequestType(p3) then
			return nil
		elseif p2 == promptStateModule.PromptPurchase or p2 == promptStateModule.PurchaseInProgress then
			if p1.props.isUserEligibleForUnifiedPurchaseFlow then
				local purchaseAnalyticsMetadata = p1.props.purchaseAnalyticsMetadata or {}
				logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedProductPurchaseModalBuyItemButtonClickedCounter, purchaseAnalyticsMetadata.surface, purchaseAnalyticsMetadata.productType)
				p1.emitUnifiedProductPurchaseFlowEvent(unifiedPurchaseEventNameEnumModule.BuyItemModalBuyClicked)
			end
			return p1.props.onBuy
		else
			return if p2 == promptStateModule.RobuxUpsell or p2 == promptStateModule.UpsellInProgress or p2 == promptStateModule.LeaveRobloxWarning then p1.props.onRobuxUpsell elseif p2 == promptStateModule.U13PaymentModal or p2 == promptStateModule.U13MonthlyThreshold1Modal or (p2 == promptStateModule.U13MonthlyThreshold2Modal or p2 == promptStateModule.ParentalConsentWarningPaymentModal13To17) then p1.props.onScaryModalConfirm elseif p2 == promptStateModule.Error and p4 == purchaseErrorModule.TwoFactorNeededSettings then p1.props.onOpenSecuritySettings elseif isGenericChallengeResponseModule(p4) then function()
				-- upvalues: p1 (copy), p4 (ref)
				p1.props.onOpenSecuritySettings(p4)
			end else p1.props.hideWindow
		end
	end
	
	function p7.getCancelButtonAction(p2, p3)
		-- upvalues: promptStateModule (copy), isRelevantRequestType (copy), p1 (ref)
		return if p2 == promptStateModule.None or not isRelevantRequestType(p3) then nil else p1.props.hideWindow
	end
	
	function p7.confirmButtonPressed()
		-- upvalues: p1 (ref), requestTypeModule (copy), promptStateModule (copy), publishAssetAnalyticsModule (copy)
		if p1.props.requestType == requestTypeModule.AvatarCreationFee and p1.props.promptState == promptStateModule.PromptPurchase then
			publishAssetAnalyticsModule.sendButtonClicked(publishAssetAnalyticsModule.Section.BuyItemModal, publishAssetAnalyticsModule.Element.Buy)
		end
		local confirmButtonAction = p1.getConfirmButtonAction(p1.props.promptState, p1.props.requestType, p1.props.purchaseError)
		
		if confirmButtonAction ~= nil and p1.canConfirmInput() then
			confirmButtonAction()
		end
	end
	
	function p7.launchAfterPurchaseButtonShown()
		-- upvalues: p1 (ref), unifiedPurchaseEventNameEnumModule (copy)
		p1.emitUnifiedProductPurchaseFlowEvent(unifiedPurchaseEventNameEnumModule.LaunchAfterPurchaseButtonShown)
	end
	
	function p7.launchAfterPurchaseButtonPressed()
		-- upvalues: p1 (ref), unifiedPurchaseEventNameEnumModule (copy), fFlagEnableLaunchAfterPurchase (copy), var1 (copy)
		p1.emitUnifiedProductPurchaseFlowEvent(unifiedPurchaseEventNameEnumModule.LaunchAfterPurchaseButtonClicked)
		local launchAfterPurchaseRootPlaceId = p1.props.launchAfterPurchaseRootPlaceId
		local var2 = if fFlagEnableLaunchAfterPurchase then p1.props.purchaseCallbacks and p1.props.purchaseCallbacks.onLaunchAfterPurchase else nil
		p1.confirmButtonPressed()
		task.defer(function()
			-- upvalues: launchAfterPurchaseRootPlaceId (ref), var1 (copy), p1 (copy), unifiedPurchaseEventNameEnumModule (copy), var2 (ref)
			local var3 = tonumber(launchAfterPurchaseRootPlaceId)
			
			if var3 == nil or var1 == nil then return end
			p1.emitUnifiedProductPurchaseFlowEvent(unifiedPurchaseEventNameEnumModule.ExperienceLaunchedAfterPurchase)
			
			if var2 then
				var2()
			end
			var1:LaunchExperience({ placeId = var3 }, "PurchaseCompletionPlayButton")
		end)
	end
	
	function p7.BalanceNotShowingInExperimentIssueFix()
		-- upvalues: p1 (ref), requestTypeModule (copy), promptStateModule (copy), publishAssetAnalyticsModule (copy), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy)
		if p1.props.requestType == requestTypeModule.AvatarCreationFee and p1.props.promptState == promptStateModule.PromptPurchase then
			publishAssetAnalyticsModule.sendButtonClicked(publishAssetAnalyticsModule.Section.BuyItemModal, publishAssetAnalyticsModule.Element.Cancel)
		end
		if p1.props.isUserEligibleForUnifiedPurchaseFlow then
			logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedProductPurchaseModalCancelButtonClickedCounter, p1.props.purchaseAnalyticsMetadata.surface, p1.props.purchaseAnalyticsMetadata.productType)
		end
		local cancelButtonAction = p1.getCancelButtonAction(p1.props.promptState, p1.props.requestType)
		
		if cancelButtonAction ~= nil then
			cancelButtonAction()
		end
	end
	
	function p7.configContextActionService(p2)
		-- upvalues: windowStateModule (copy), contextActionService (copy), p1 (ref)
		if p2 == windowStateModule.Shown then
			contextActionService:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, p3, _)
				-- upvalues: p1 (copy)
				if p3 == Enum.UserInputState.Begin then
					p1.confirmButtonPressed()
				end
			end, false, Enum.KeyCode.ButtonA)
			contextActionService:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, p3, _)
				-- upvalues: p1 (copy)
				if p3 == Enum.UserInputState.Begin then
					p1.cancelButtonPressed()
				end
			end, false, Enum.KeyCode.ButtonB)
			
			return
		end
		contextActionService:UnbindCoreAction("ProductPurchaseConfirmButtonBind")
		contextActionService:UnbindCoreAction("ProductPurchaseCancelButtonBind")
	end
	
	function p7.getVPCModalType(p2)
		-- upvalues: promptStateModule (copy), VPCModalTypeModule (copy)
		return if p2 == promptStateModule.EnablePurchaseVPCModal then VPCModalTypeModule.toRawValue(VPCModalTypeModule.EnablePurchase) else VPCModalTypeModule.toRawValue(VPCModalTypeModule.None)
	end
	
	function p7.onBuyItemButtonMounted(p2)
		-- upvalues: p1 (ref), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), unifiedPurchaseEventNameEnumModule (copy), fFlagAddPerformanceMetricsToUnifiedPurchaseModal (copy), emitPerformanceMetricsModule (copy), constantsModule (copy)
		local purchaseAnalyticsMetadata = p1.props.purchaseAnalyticsMetadata or {}
		logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedProductPurchaseModalShownCounter, purchaseAnalyticsMetadata.surface, purchaseAnalyticsMetadata.productType)
		p1.emitUnifiedProductPurchaseFlowEvent(unifiedPurchaseEventNameEnumModule.BuyItemModalShown)
		
		if fFlagAddPerformanceMetricsToUnifiedPurchaseModal and purchaseAnalyticsMetadata and purchaseAnalyticsMetadata.surface then
			emitPerformanceMetricsModule(constantsModule.PerformanceMetrics.IntervalName.ProductPurchaseContainerShown, purchaseAnalyticsMetadata.surface)
		end
		if p1.props.purchaseCallbacks and p1.props.purchaseCallbacks.onBuyItemButtonMounted then
			p1.props.purchaseCallbacks.onBuyItemButtonMounted(p2)
		end
	end
end

function name.didMount(p1)
	-- upvalues: windowStateModule (ref), isRelevantRequestType (ref), guiService (ref)
	if p1.props.windowState == windowStateModule.Shown and isRelevantRequestType(p1.props.requestType, p1.props.purchaseFlow) then
		p1:setState({ isAnimating = true })
		p1.configContextActionService(p1.props.windowState)
		guiService.SetPurchasePromptIsShown(true)
	end
end

function name.willUpdate(p1, p2)
	if p1.props.expectedPrice ~= p2.expectedPrice then
		p1:setState({})
	end
end

function name.didUpdate(p1, p2, _)
	-- upvalues: fFlagEnablePurchaseFlowUUIDMigrationModule (ref), promptStateModule (ref), httpService (ref), loggingProtocolModule (ref), purchaseFlowUUIDTelemetryModule (ref), playersService (ref), isRelevantRequestType (ref), guiService (ref), windowStateModule (ref), requestTypeModule (ref), publishAssetAnalyticsModule (ref)
	if not fFlagEnablePurchaseFlowUUIDMigrationModule and p1.props.promptState ~= p2.promptState and p1.props.promptState == promptStateModule.None then
		p1.props.setPurchaseFlowUUID(httpService:GenerateGUID(false))
		loggingProtocolModule.default:logRobloxTelemetryCounter(purchaseFlowUUIDTelemetryModule.ProductPurchaseContainerMigrationCounter, 1, { method = "ProductPurchaseContainerDidUpdate" })
	end
	if playersService.LocalPlayer.GameplayPaused then
		p1.props.onAnalyticEvent("PurchasePromptGamePausedDetected", { place_id = game.PlaceId })
		p1.props.hideWindow()
	end
	local requestType = p1.props.requestType
	
	if p2.windowState ~= p1.props.windowState and isRelevantRequestType(requestType, p1.props.purchaseFlow) then
		p1:setState({ isAnimating = true })
		p1.configContextActionService(p1.props.windowState)
		guiService:SetPurchasePromptIsShown(p1.props.windowState == windowStateModule.Shown)
		
		if p1.props.windowState == windowStateModule.Hidden then
			p1.props.completeRequest()
		end
	end
	if requestType == requestTypeModule.AvatarCreationFee and p1.props.promptState == promptStateModule.PurchaseComplete and p2.promptState ~= promptStateModule.PurchaseComplete then
		publishAssetAnalyticsModule.sendPageLoad(publishAssetAnalyticsModule.Section.ProcessCompleteModal)
	end
	if p2.promptState ~= p1.props.promptState then
		p1.emitPurchaseFlowEvent("ViewShown")
	end
end

function name.getMessageKeysFromPromptState(p1)
	-- upvalues: promptStateModule (ref), purchaseErrorModule (ref), localizationServiceModule (ref), isGenericChallengeResponseModule (ref)
	local promptState = p1.props.promptState
	local productInfo = p1.props.productInfo
	local purchaseError = p1.props.purchaseError
	
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

function name.determinePrompt(a)
	-- upvalues: fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (ref), windowStateModule (ref), promptStateModule (ref), isRelevantRequestType (ref), fFlagUnifiedPurchaseAddSkeleton (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), requestTypeModule (ref), purchaseClientSessionIdType (ref), robloxSubscriptionPurchaseAppModule (ref), robloxSubscriptionFlowCompleteReason (ref), fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (ref), surfaceName (ref), appContextModule (ref), surfaceContext (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), deriveCartPricingView (ref), getUnifiedPurchaseModalTypeModule (ref), unifiedPurchaseModalTypeEnum (ref), shouldShowBlackbirdUpsellModule (ref), fFlagBlackbirdUpsellGateResaleAndTimedOptionModule (ref), getBlackbirdUpsellBannerProductInfoModule (ref), fFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry (ref), unifiedPurchaseEventNameEnumModule (ref), fFlagEnableBlackbirdUpsellImpressionGating (ref), blackbirdUpsellImpressionTrackerModule (ref), fFlagEnableInExperienceOffersPurchaseFlow (ref), fFlagAddCenterDialogForUnifiedPurchaseModal (ref), roact (ref), unifiedProductPurchaseModalV2 (ref), fFlagPurchasePromptSubtitleForTimedOptions (ref), fFlagSkipBuyDelayForExperienceShopModule (ref), unifiedProductPurchaseModal (ref), fFlagPurchasePromptPriceShouldUseProductInfoPriceModule (ref), getPlayerPriceModule (ref), fFlagEnableOffersOnInExperienceSurface (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), productPurchaseSurface (ref), desktopUpsellExperiment (ref), productPurchaseModal (ref), productPurchase (ref), robuxUpsellModal (ref), productPurchaseRobuxUpsell (ref), getFFlagOpenVngTosForVngRobuxUpsell (ref), getAppFeaturePolicies (ref), leaveRobloxAlert (ref), interactiveAlert (ref), robloxTranslatorModule (ref), buttonType (ref), purchaseErrorModule (ref), isGenericChallengeResponseModule (ref), reactModule (ref), productPurchasePromptModule (ref), images (ref), animator (ref), verifiedParentalConsentDialog (ref), robuxUpsellModalTooExpensiveFallback (ref), fFlagEnableLaunchAfterPurchase (ref), fFlagPurchaseModalTimedOptionExtension (ref)
	local var2
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
		if a.props.isUserEligibleForUnifiedPurchaseFlow then
			local var3
			local productPrice = a.props.productPrice
			
			if fFlagEnableUnifiedPurchaseFlowForDevSubs and requestType == requestTypeModule.DeveloperSubscription then
				var3 = false
				
				if productInfo.displayPrice ~= nil then
					local _ = productPrice == 0
				end
			else
				var3 = false
			end
			local var4 = function()
				-- upvalues: a (ref), promptStateModule (copy), windowStateModule (copy), purchaseClientSessionIdType (copy), robloxSubscriptionPurchaseAppModule (copy), robloxSubscriptionFlowCompleteReason (copy), fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (copy), surfaceName (copy), appContextModule (copy), surfaceContext (copy)
				a.props.setPromptState(promptStateModule.BlackbirdUpsellInProgress)
				a.props.setWindowState(windowStateModule.Suspended)
				local purchaseFlowUUID = a.props.purchaseFlowUUID
				local var5 = if purchaseFlowUUID and purchaseFlowUUID ~= "" then purchaseFlowUUID else nil
				local var6 = if var5 then {
					clientSessionIdType = purchaseClientSessionIdType.PurchaseFlowUUID,
					clientSessionId = var5
				} else nil
				robloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase({ showBackButton = true }, {
					onFlowComplete = function(p1)
						-- upvalues: robloxSubscriptionFlowCompleteReason (copy), fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (copy), a (copy)
						if p1 == robloxSubscriptionFlowCompleteReason.UpsellPurchaseSucceeded then
							if fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal and a.props.purchaseCallbacks and a.props.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess then
								a.props.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess()
							end
							a.props.retryPurchaseAfterUpsell()
							
							return
						elseif p1 == robloxSubscriptionFlowCompleteReason.UpsellDismissed then
							a.props.completeRequest()
							
							return
						elseif p1 == robloxSubscriptionFlowCompleteReason.UpsellPurchaseFailed then
							a.props.completeRequest()
							
							return
						end
						a.props.completeRequest()
					end,
					onBackButtonActivated = function()
						-- upvalues: a (copy), promptStateModule (copy), windowStateModule (copy)
						a.props.setPromptState(promptStateModule.PromptPurchase)
						a.props.setWindowState(windowStateModule.Shown)
					end
				}, nil, surfaceName.UnifiedProductPurchaseModal, if appContextModule.get() == appContextModule.Enum.IN_APP then surfaceContext.InApp else surfaceContext.InGame, nil, if var6 then { clientSessionId = var6 } else nil)
			end
			
			local var5 = if var3 then nil else a.props.price
			local var6 = nil
			
			if fFlagPurchasePromptCartPricingEnabledModule then
				local var7 = deriveCartPricingView(a.props.cartPricingResponse)
				var6 = if not (var3 or var7 == nil or getUnifiedPurchaseModalTypeModule(requestType) ~= unifiedPurchaseModalTypeEnum.MultiItem) then var7.priceAfterDiscount else a.props.productPrice
			end
			var2 = if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then shouldShowBlackbirdUpsellModule(var5, a.props.requestType, var3, if fFlagBlackbirdUpsellGateResaleAndTimedOptionModule then a.props.productPayload else nil) else nil
			local var8 = if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal and var2 and a.props.robloxSubscriptionProducts then getBlackbirdUpsellBannerProductInfoModule(a.props.robloxSubscriptionProducts) else nil
			local var9 = if fFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry or fFlagEnableBlackbirdUpsellImpressionGating then function(p1)
				-- upvalues: a (ref), fFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry (copy), var8 (ref), unifiedPurchaseEventNameEnumModule (copy), fFlagEnableBlackbirdUpsellImpressionGating (copy), blackbirdUpsellImpressionTrackerModule (copy)
				a.onBuyItemButtonMounted(p1)
				
				if fFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry and var8 then
					a.emitUnifiedProductPurchaseFlowEvent(unifiedPurchaseEventNameEnumModule.SubscriptionUpsellBannerShown)
				end
				if fFlagEnableBlackbirdUpsellImpressionGating and var8 then
					blackbirdUpsellImpressionTrackerModule.incrementImpressionCount()
				end
			end else a.onBuyItemButtonMounted
			local var10 = if fFlagPurchasePromptCartPricingEnabledModule then function(_, p1)
				-- upvalues: a (ref), fFlagEnableInExperienceOffersPurchaseFlow (copy), requestTypeModule (copy)
				if p1 ~= nil then
					local requestType = a.props.requestType
					
					if fFlagEnableInExperienceOffersPurchaseFlow and (requestType == requestTypeModule.GamePass or requestType == requestTypeModule.Product) then
						a.props.fetchInGameItemCartPricing(p1)
						
						return
					end
					a.props.fetchCartPricing(p1)
				end
			end else nil
			
			if fFlagAddCenterDialogForUnifiedPurchaseModal and appContextModule.get() == appContextModule.Enum.IN_APP then
				local createElement = roact.createElement
				local var11 = unifiedProductPurchaseModalV2
				local t = {
					product = {
						itemIcon = productInfo.imageUrl,
						itemName = productInfo.name,
						itemRobuxCost = if var3 then nil elseif fFlagPurchasePromptCartPricingEnabledModule then var6 else a.props.productPrice,
						itemDisplayPrice = if var3 then productInfo.displayPrice else nil,
						itemPrice = var5,
						model = a.props.humanoidModel
					},
					subtitleView = if fFlagPurchasePromptSubtitleForTimedOptions then a.props.subtitleView else nil
				}
				local t_1 = { buyItemActivated = a.confirmButtonPressed }
				local var12 = a.isWindowShowAndDoneAnimating()
				
				if var12 then
					var12 = a.buyButtonUsesFoundationInputDelay
					
					if var12 then
						var12 = not (fFlagSkipBuyDelayForExperienceShopModule and a.isFromShopSkip())
					end
				end
				local var13
				t_1.buyItemEnableInputDelayed = var12
				t_1.cancelActivated = a.cancelButtonPressed
				t_1.isDisabled = promptState == promptStateModule.PurchaseInProgress
				t.buttons = t_1
				t.postPurchaseActions = a.props.postPurchaseActions
				t.setPostPurchaseActions = a.props.setPostPurchaseActions
				t.onBuyItemButtonMounted = var9
				t.purchaseModalType = getUnifiedPurchaseModalTypeModule(a.props.requestType)
				t.robuxBalanceAmount = accountInfo.balance
				t.isTestPurchase = isTestPurchase
				
				if fFlagUnifiedPurchaseAddSkeleton then
					var13 = promptState == promptStateModule.InitializingPurchase
					var13 = nil
				else
					var13 = nil
				end
				t.isLoading = var13
				t.isCartPricingLoading = if fFlagPurchasePromptCartPricingEnabledModule then a.props.isCartPricingLoading else nil
				t.onBlackbirdUpsellActivated = if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then var4 else nil
				t.BlackbirdUpsellBannerProductInfo = var8
				t.cartPricingResponse = if fFlagPurchasePromptCartPricingEnabledModule then a.props.cartPricingResponse else nil
				t.onCartOfferAppliedChanged = if fFlagPurchasePromptCartPricingEnabledModule then var10 else nil
				
				return createElement(var11, t)
			else
				local createElement = roact.createElement
				local var14 = unifiedProductPurchaseModal
				local t = {
					product = {
						itemIcon = productInfo.imageUrl,
						itemName = productInfo.name,
						itemRobuxCost = if var3 then nil elseif fFlagPurchasePromptPriceShouldUseProductInfoPriceModule then a.props.productPrice else getPlayerPriceModule(productInfo, accountInfo.membershipType == 4, expectedPrice),
						itemDisplayPrice = if var3 then productInfo.displayPrice else nil,
						itemPrice = var5,
						model = a.props.humanoidModel
					}
				}
				local t_1 = { buyItemActivated = a.confirmButtonPressed }
				local var15 = a.isWindowShowAndDoneAnimating()
				
				if var15 then
					var15 = a.buyButtonUsesFoundationInputDelay
					
					if var15 then
						var15 = not (fFlagSkipBuyDelayForExperienceShopModule and a.isFromShopSkip())
					end
				end
				t_1.buyItemEnableInputDelayed = var15
				t_1.cancelActivated = a.cancelButtonPressed
				t_1.isDisabled = promptState == promptStateModule.PurchaseInProgress
				t.buttons = t_1
				t.postPurchaseActions = a.props.postPurchaseActions
				t.setPostPurchaseActions = a.props.setPostPurchaseActions
				t.onBuyItemButtonMounted = var9
				t.purchaseModalType = getUnifiedPurchaseModalTypeModule(a.props.requestType)
				t.robuxBalanceAmount = accountInfo.balance
				t.isTestPurchase = isTestPurchase
				t.isCartPricingLoading = if fFlagEnableOffersOnInExperienceSurface then a.props.isCartPricingLoading else nil
				t.onBlackbirdUpsellActivated = if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then var4 else nil
				t.BlackbirdUpsellBannerProductInfo = var8
				t.cartPricingResponse = if fFlagEnableOffersOnInExperienceSurface then a.props.cartPricingResponse else nil
				t.onCartOfferAppliedChanged = if fFlagEnableOffersOnInExperienceSurface then var10 else nil
				local var16 = var3
				
				if not var16 then
					if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
						var16 = a.props.purchaseAnalyticsMetadata
						
						if var16 then
							var16 = a.props.purchaseAnalyticsMetadata.surface == productPurchaseSurface.Catalog
							var16 = nil
						end
					else
						var16 = nil
					end
				end
				t.hideUserRobuxBalance = var16
				
				return createElement(var14, t)
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
			local var17 = robuxUpsellModal
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
				buyItemActivated = function()
					-- upvalues: a (ref)
					a.confirmButtonPressed()
					a.emitPurchaseFlowEvent("UserInput", "Buy")
				end,
				buyItemDisabled = promptState == promptStateModule.UpsellInProgress,
				buyItemControllerIcon = if a.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil,
				buyItemisDelayedInput = a.hasDelayedInput()
			}
			var2 = a.isWindowShowAndDoneAnimating()
			
			if var2 then
				var2 = not (fFlagSkipBuyDelayForExperienceShopModule and a.isFromShopSkip())
			end
			t_1.buyItemEnableInputDelayed = var2
			
			function t_1.cancelPurchaseActivated()
				-- upvalues: a (ref)
				a.cancelButtonPressed()
				a.emitPurchaseFlowEvent("UserInput", "Cancel")
			end
			
			t_1.cancelControllerIcon = if a.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" else nil
			t_1.opensBuyRobuxPage = desktopUpsellExperiment.getVariant() == desktopUpsellExperiment.variants.OpenRobuxStore
			t.buttons = t_1
			
			return createElement(var17, t)
		else
			local createElement = roact.createElement
			local var18 = productPurchaseRobuxUpsell
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
			local var19 = a.isWindowShowAndDoneAnimating()
			
			if var19 then
				var2 = fFlagSkipBuyDelayForExperienceShopModule and a.isFromShopSkip()
				var19 = not var2
			end
			t.enableInputDelayed = var19
			t.buyItemControllerIcon = if a.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil
			t.cancelControllerIcon = if a.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" else nil
			
			function t.buyItemActivated()
				-- upvalues: a (ref)
				a.confirmButtonPressed()
				a.emitPurchaseFlowEvent("UserInput", "Buy")
			end
			
			function t.cancelPurchaseActivated()
				-- upvalues: a (ref)
				a.cancelButtonPressed()
				a.emitPurchaseFlowEvent("UserInput", "Cancel")
			end
			
			t.isLuobu = a.state.isLuobu
			t.isVng = getFFlagOpenVngTosForVngRobuxUpsell() and getAppFeaturePolicies().getShowVNGTosForRobuxUpsell()
			
			return createElement(var18, t)
		end
	elseif promptState == promptStateModule.LeaveRobloxWarning then
		return roact.createElement(leaveRobloxAlert, {
			screenSize = a.state.screenSize,
			cancelActivated = a.cancelButtonPressed,
			continueActivated = a.confirmButtonPressed
		})
	elseif promptState == promptStateModule.PurchaseComplete and requestType == requestTypeModule.AvatarCreationFee then
		return roact.createElement(interactiveAlert, {
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
		})
	elseif promptState == promptStateModule.Error and purchaseError == purchaseErrorModule.TwoFactorNeededSettings or isGenericChallengeResponseModule(purchaseError) then
		return reactModule.createElement(productPurchasePromptModule, {
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
			useUnifiedPurchaseCompletionModal = a.props.isUserEligibleForUnifiedPurchaseFlow
		})
	elseif promptState == promptStateModule.EnablePurchaseVPCModal then
		return roact.createElement(animator, {
			shouldAnimate = true,
			shouldShow = promptState == promptStateModule.EnablePurchaseVPCModal,
			renderChildren = function()
				-- upvalues: roact (copy), verifiedParentalConsentDialog (copy), a (ref), promptState (ref)
				return roact.createElement(verifiedParentalConsentDialog, {
					isActionable = false,
					screenSize = a.state.screenSize,
					modalType = a.getVPCModalType(promptState),
					onDismiss = function()
						-- upvalues: a (copy)
						a.confirmButtonPressed()
					end
				})
			end
		})
	elseif promptState == promptStateModule.Error and purchaseError == purchaseErrorModule.NotEnoughRobuxXbox and desktopUpsellExperiment.shouldShowNewModal() then
		return roact.createElement(robuxUpsellModalTooExpensiveFallback, {
			screenSize = a.state.screenSize,
			product = {
				itemIcon = productInfo.imageUrl,
				itemName = productInfo.name,
				itemRobuxCost = if fFlagPurchasePromptPriceShouldUseProductInfoPriceModule then a.props.productPrice else getPlayerPriceModule(productInfo, accountInfo.membershipType == 4, expectedPrice)
			},
			balanceAmount = accountInfo.balance,
			doneActivated = function()
				-- upvalues: a (ref)
				a.cancelButtonPressed()
				a.emitPurchaseFlowEvent("UserInput", "Cancel")
			end
		})
	end
	local var20 = fFlagEnableLaunchAfterPurchase and (promptState == promptStateModule.PurchaseComplete and a.props.launchAfterPurchaseRootPlaceId ~= nil)
	
	return reactModule.createElement(productPurchasePromptModule, {
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
		useUnifiedPurchaseCompletionModal = a.props.isUserEligibleForUnifiedPurchaseFlow,
		isMultiItem = getUnifiedPurchaseModalTypeModule(a.props.requestType) == unifiedPurchaseModalTypeEnum.MultiItem,
		timedOptionDays = if fFlagPurchasePromptSubtitleForTimedOptions then a.props.timedOptionDays else nil,
		completionMessage = if fFlagPurchaseModalTimedOptionExtension then a.props.completionMessage else nil,
		launchAfterPurchaseButtonPressed = if var20 then a.launchAfterPurchaseButtonPressed else nil,
		launchAfterPurchaseButtonShown = if var20 then a.launchAfterPurchaseButtonShown else nil
	})
end

function name.render(p1)
	-- upvalues: fFlagSetMenuOnPurchasePromptModule (ref), guiService (ref), roact (ref), animatorModule (ref), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (ref), windowStateModule (ref), requestTypeModule (ref), promptStateModule (ref), publishAssetAnalyticsModule (ref), externalEventConnectionModule (ref), coreGuiService (ref)
	local promptState = p1.props.promptState
	local var2 = p1:determinePrompt()
	
	if fFlagSetMenuOnPurchasePromptModule then
		if var2 ~= nil then
			p1.menuOpenedBySelf = true
		end
		guiService:SetMenuIsOpen(var2 ~= nil, "ProductPurchaseContainer")
	end
	local var3
	local createElement = roact.createElement
	local var4 = "Frame"
	local t = {
		Size = UDim2.new(1, 0, 1, 0),
		[roact.Change.AbsoluteSize] = p1.changeScreenSize,
		BackgroundTransparency = 1
	}
	local t_1 = {}
	local createElement_1 = roact.createElement
	local t_2 = {}
	
	if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then
		var3 = p1.props.windowState == windowStateModule.Shown
		var3 = nil
	else
		var3 = p1.props.windowState ~= windowStateModule.Hidden
	end
	t_2.shouldShow = var3
	
	function t_2.onShown()
		-- upvalues: p1 (ref), requestTypeModule (copy), promptState (ref), promptStateModule (copy), publishAssetAnalyticsModule (copy)
		if p1.props.requestType == requestTypeModule.AvatarCreationFee and promptState == promptStateModule.PromptPurchase then
			publishAssetAnalyticsModule.sendPageLoad(publishAssetAnalyticsModule.Section.BuyItemModal)
		end
		p1:setState({ isAnimating = false, doneAnimatingTime = os.clock() })
	end
	
	function t_2.onHidden()
		-- upvalues: p1 (ref)
		p1:setState({ isAnimating = nil, doneAnimatingTime = nil })
	end
	
	t_2.skipAnimation = p1.props.isUserEligibleForUnifiedPurchaseFlow
	t_2[roact.Ref] = p1.animatorRef
	t_1.Animator = createElement_1(animatorModule, t_2, {
		Prompt = var2,
		ModalFix = var2 ~= nil and roact.createElement("ImageButton", {
			BackgroundTransparency = 0,
			Modal = true,
			Size = UDim2.new(0, 0, 0, 0)
		}) or nil
	})
	t_1.OnCoreGuiMenuOpened = roact.createElement(externalEventConnectionModule, {
		event = guiService.MenuOpened,
		callback = function()
			-- upvalues: fFlagSetMenuOnPurchasePromptModule (copy), p1 (ref)
			if fFlagSetMenuOnPurchasePromptModule and p1.menuOpenedBySelf then
				p1.menuOpenedBySelf = false
				
				return
			elseif p1.props.hideWindow then
				p1.props.hideWindow()
			end
		end
	})
	t_1.OnUserGuiRenderingChanged = roact.createElement(externalEventConnectionModule, {
		event = coreGuiService.UserGuiRenderingChanged,
		callback = function(p2, p3)
			-- upvalues: p1 (ref)
			if not p2 or not p3 then
				p1.props.hideWindow()
			end
		end
	})
	
	return createElement(var4, t, t_1)
end

return connectToStoreModule(function(p1)
	-- upvalues: isMockingPurchasesModule (ref), selectedRobuxPackageModule (ref), fFlagPurchasePromptPriceShouldUseProductInfoPriceModule (ref), selectProductPriceModule (ref), selectPriceModule (ref), fFlagPurchasePromptSubtitleForTimedOptions (ref), fFlagPurchaseModalTimedOptionExtension (ref), fFlagEnableLaunchAfterPurchase (ref), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (ref), fFlagBlackbirdUpsellGateResaleAndTimedOptionModule (ref), fFlagSkipBuyDelayForExperienceShopModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), selectCartPricingResponseModule (ref), selectIsCartPricingFetchingModule (ref)
	return {
		purchaseFlowUUID = p1.purchaseFlowUUID,
		purchaseFlow = p1.purchaseFlow,
		promptState = p1.promptState,
		requestType = p1.promptRequest.requestType,
		humanoidModel = p1.promptRequest.humanoidModel,
		expectedPrice = p1.promptRequest.expectedPrice,
		windowState = p1.windowState,
		purchaseError = p1.purchaseError,
		economicRestrictionError = p1.economicRestrictionError,
		productInfo = p1.productInfo,
		accountInfo = p1.accountInfo,
		robuxPurchaseAmount = selectedRobuxPackageModule.getRobuxPurchaseAmount(p1),
		robuxAmountBeforeBonus = selectedRobuxPackageModule.getRobuxAmountBeforeBonus(p1),
		robuxPurchaseCost = selectedRobuxPackageModule.getPrice(p1),
		isTestPurchase = isMockingPurchasesModule(p1.promptRequest.requestType),
		isGamepadEnabled = p1.gamepadEnabled,
		desktopUpsellExpVariant = if p1.abVariations then p1.abVariations.DesktopUpsellExpVariant else nil,
		postPurchaseActions = p1.postPurchaseActions,
		purchaseCallbacks = p1.purchaseCallbacks,
		isUserEligibleForUnifiedPurchaseFlow = p1.isUserEligibleForUnifiedPurchaseFlow,
		purchaseAnalyticsMetadata = p1.purchaseAnalyticsMetadata,
		productPrice = if fFlagPurchasePromptPriceShouldUseProductInfoPriceModule then selectProductPriceModule(p1) else nil,
		price = if selectPriceModule then selectPriceModule(p1) else nil,
		timedOptionDays = if fFlagPurchasePromptSubtitleForTimedOptions and p1.productPayload then p1.productPayload.timedOptionDays else nil,
		completionMessage = if fFlagPurchaseModalTimedOptionExtension and p1.purchaseOptions then p1.purchaseOptions.completionMessage else nil,
		launchAfterPurchaseRootPlaceId = if fFlagEnableLaunchAfterPurchase and p1.purchaseOptions and (p1.purchaseOptions.launchAfterPurchaseRootPlaceId ~= nil and p1.purchaseOptions.launchAfterPurchaseRootPlaceId ~= "") then p1.purchaseOptions.launchAfterPurchaseRootPlaceId else nil,
		robloxSubscriptionProducts = if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then p1.robloxSubscriptionProducts else nil,
		productPayload = if fFlagBlackbirdUpsellGateResaleAndTimedOptionModule or fFlagSkipBuyDelayForExperienceShopModule then p1.productPayload else nil,
		cartPricingResponse = if fFlagPurchasePromptCartPricingEnabledModule then selectCartPricingResponseModule(p1) else nil,
		isCartPricingLoading = if fFlagPurchasePromptCartPricingEnabledModule then selectIsCartPricingFetchingModule(p1) else nil
	}
end, function(p1)
	-- upvalues: setPurchaseFlowUUIDModule (ref), purchaseItemModule (ref), completePurchaseModule (ref), launchRobuxUpsellModule (ref), openSecuritySettingsModule (ref), initiateUserPurchaseSettingsPrecheckModule (ref), hideWindowModule (ref), retryPurchaseAfterUpsellModule (ref), setWindowStateModule (ref), fFlagAddCursorProviderToPurchasePromptApp (ref), guiService (ref), completeRequestModule (ref), sendEventModule (ref), setPostPurchaseActionsModule (ref), setPromptStateModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), fetchCartPricingModule (ref), fFlagEnableInExperienceOffersPurchaseFlow (ref), fetchInGameItemCartPricingModule (ref)
	return {
		setPurchaseFlowUUID = function(value)
			-- upvalues: p1 (ref), setPurchaseFlowUUIDModule (copy)
			p1(setPurchaseFlowUUIDModule(value))
		end,
		onBuy = function()
			-- upvalues: p1 (ref), purchaseItemModule (copy)
			p1(purchaseItemModule())
		end,
		completePurchase = function()
			-- upvalues: p1 (ref), completePurchaseModule (copy)
			p1(completePurchaseModule())
		end,
		onScaryModalConfirm = function()
			-- upvalues: p1 (ref), launchRobuxUpsellModule (copy)
			p1(launchRobuxUpsellModule())
		end,
		onOpenSecuritySettings = function(value)
			-- upvalues: p1 (ref), openSecuritySettingsModule (copy)
			if value then
				p1(openSecuritySettingsModule(value))
				
				return
			end
			p1(openSecuritySettingsModule())
		end,
		onRobuxUpsell = function()
			-- upvalues: p1 (ref), initiateUserPurchaseSettingsPrecheckModule (copy)
			p1(initiateUserPurchaseSettingsPrecheckModule())
		end,
		hideWindow = function()
			-- upvalues: p1 (ref), hideWindowModule (copy)
			p1(hideWindowModule())
		end,
		retryPurchaseAfterUpsell = function()
			-- upvalues: p1 (ref), retryPurchaseAfterUpsellModule (copy)
			p1(retryPurchaseAfterUpsellModule())
		end,
		setWindowState = function(value)
			-- upvalues: p1 (ref), setWindowStateModule (copy)
			p1(setWindowStateModule(value))
		end,
		completeRequest = function()
			-- upvalues: fFlagAddCursorProviderToPurchasePromptApp (copy), guiService (copy), p1 (ref), completeRequestModule (copy)
			if fFlagAddCursorProviderToPurchasePromptApp then
				guiService.SelectedCoreObject = nil
			end
			p1(completeRequestModule())
		end,
		onAnalyticEvent = function(p2, p3)
			-- upvalues: p1 (ref), sendEventModule (copy)
			p1(sendEventModule(p2, p3))
		end,
		setPostPurchaseActions = function(value)
			-- upvalues: p1 (ref), setPostPurchaseActionsModule (copy)
			p1(setPostPurchaseActionsModule(value))
		end,
		setPromptState = function(value)
			-- upvalues: p1 (ref), setPromptStateModule (copy)
			p1(setPromptStateModule(value))
		end,
		fetchCartPricing = if fFlagPurchasePromptCartPricingEnabledModule then function(p2)
			-- upvalues: p1 (ref), fetchCartPricingModule (copy)
			p1(fetchCartPricingModule(p2))
		end else nil,
		fetchInGameItemCartPricing = if fFlagEnableInExperienceOffersPurchaseFlow then function(p2)
			-- upvalues: p1 (ref), fetchInGameItemCartPricingModule (copy)
			p1(fetchInGameItemCartPricingModule(p2))
		end else nil
	}
end)(name)