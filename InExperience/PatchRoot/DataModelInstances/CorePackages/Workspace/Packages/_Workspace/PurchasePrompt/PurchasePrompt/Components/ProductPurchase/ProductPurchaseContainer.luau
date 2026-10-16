local GuiService = game:GetService("GuiService")
local ContextActionService = game:GetService("ContextActionService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local PurchasePromptDepsModule = require(Parent.PurchasePromptDeps)
local Roact = PurchasePromptDepsModule.Roact
local ReactModule = require(Parent.React)
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local CachedPolicyServiceModule = require(Parent.CachedPolicyService)
local RobloxTranslatorModule = require(Parent.RobloxTranslator)
local UIBlox = PurchasePromptDepsModule.UIBlox
local InteractiveAlert = UIBlox.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local Images = UIBlox.App.ImageSet.Images
local IAPExperienceModule = require(Parent.IAPExperience)
local ProductPurchase = IAPExperienceModule.ProductPurchase
local ProductPurchaseRobuxUpsell = IAPExperienceModule.ProductPurchaseRobuxUpsell
local LeaveRobloxAlert = IAPExperienceModule.LeaveRobloxAlert
local Animator = IAPExperienceModule.Animator
local UnifiedProductPurchaseModal = IAPExperienceModule.UnifiedProductPurchaseModal
local UnifiedProductPurchaseModalV2 = IAPExperienceModule.UnifiedProductPurchaseModalV2
local RobloxSubscriptionPurchaseAppModule = require(Parent.RobloxSubscriptionPurchaseApp)
local GetBlackbirdUpsellBannerProductInfoModule = require(PurchasePrompt.Utils.getBlackbirdUpsellBannerProductInfo)
local RobloxSubscriptionFlowCompleteReason = RobloxSubscriptionPurchaseAppModule.RobloxSubscriptionFlowCompleteReason
local SurfaceName = RobloxSubscriptionPurchaseAppModule.SurfaceName
local SurfaceContext = RobloxSubscriptionPurchaseAppModule.SurfaceContext
local PurchaseClientSessionIdType = RobloxSubscriptionPurchaseAppModule.PurchaseClientSessionIdType
local SetWindowStateModule = require(PurchasePrompt.Actions.SetWindowState)
local PurchaseFlowModule = require(PurchasePrompt.Enums.PurchaseFlow)
local RequestTypeModule = require(PurchasePrompt.Enums.RequestType)
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local WindowStateModule = require(PurchasePrompt.Enums.WindowState)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local HideWindowModule = require(PurchasePrompt.Thunks.hideWindow)
local RetryPurchaseAfterUpsellModule = require(PurchasePrompt.Thunks.retryPurchaseAfterUpsell)
local CompleteRequestModule = require(PurchasePrompt.Thunks.completeRequest)
local PurchaseItemModule = require(PurchasePrompt.Thunks.purchaseItem)
local CompletePurchaseModule = require(PurchasePrompt.Thunks.completePurchase)
local LaunchRobuxUpsellModule = require(PurchasePrompt.Thunks.launchRobuxUpsell)
local OpenSecuritySettingsModule = require(PurchasePrompt.Thunks.openSecuritySettings)
local IsMockingPurchasesModule = require(PurchasePrompt.Utils.isMockingPurchases)
local ConnectToStoreModule = require(PurchasePrompt.connectToStore)
local SendEventModule = require(PurchasePrompt.Thunks.sendEvent)
local PublishAssetAnalyticsModule = require(PurchasePrompt.Utils.PublishAssetAnalytics)
local ExternalEventConnectionModule = require(PurchasePrompt.Components.Connection.ExternalEventConnection)
local LocalizationServiceModule = require(PurchasePrompt.Localization.LocalizationService)
local IsGenericChallengeResponseModule = require(PurchasePrompt.Utils.isGenericChallengeResponse)
local SelectedRobuxPackageModule = require(PurchasePrompt.Utils.SelectedRobuxPackage)
local ProductPurchaseSurface = require(Parent.PurchasePromptLite).Enums.ProductPurchaseSurface
local LogUnifiedPurchaseTelemetryCounterModule = require(PurchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local EmitPerformanceMetricsModule = require(PurchasePrompt.Utils.emitPerformanceMetrics)
local InitiateUserPurchaseSettingsPrecheckModule = require(PurchasePrompt.Thunks.initiateUserPurchaseSettingsPrecheck)
local VerifiedParentalConsentDialog = require(Parent.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog
local VPCModalTypeModule = require(PurchasePrompt.Enums.VPCModalType)
local AnimatorModule = require(script.Parent.Animator)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAddCursorProviderToPurchasePromptApp = SharedFlagsModule.FFlagAddCursorProviderToPurchasePromptApp
local GetUnifiedPurchaseModalTypeModule = require(PurchasePrompt.Utils.getUnifiedPurchaseModalType)
local SelectProductPriceModule = require(PurchasePrompt.Selectors.selectProductPrice)
local SelectPriceModule = require(PurchasePrompt.Selectors.selectPrice)
local SetPromptStateModule = require(PurchasePrompt.Actions.SetPromptState)
local FFlagAddSurfaceAndProductTypeToPromptCounterModule = require(PurchasePrompt.Flags.FFlagAddSurfaceAndProductTypeToPromptCounter)
local HttpService = game:GetService("HttpService")
local SetPurchaseFlowUUIDModule = require(PurchasePrompt.Actions.SetPurchaseFlowUUID)
local SetPostPurchaseActionsModule = require(PurchasePrompt.Actions.SetPostPurchaseActions)
local SendUnifiedPurchaseEventLogModule = require(PurchasePrompt.Utils.sendUnifiedPurchaseEventLog)
local UnifiedPurchaseEventNameEnumModule = require(PurchasePrompt.Enums.UnifiedPurchaseEventNameEnum)
local ConstantsModule = require(PurchasePrompt.Misc.Constants)
local FFlagEnablePurchaseFlowUUIDMigrationModule = require(PurchasePrompt.Flags.FFlagEnablePurchaseFlowUUIDMigration)
local FFlagEnableLaunchAfterPurchase = require(Parent.SharedFlags).FFlagEnableLaunchAfterPurchase
local ExperienceService = if FFlagEnableLaunchAfterPurchase then require(Parent.ExperienceService).ExperienceService else nil
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local PurchaseFlowUUIDTelemetryModule = require(PurchasePrompt.Events.PurchaseFlowUUIDTelemetry)
local UnifiedPurchaseTelemetryModule = require(PurchasePrompt.Events.UnifiedPurchaseTelemetry)
local AppContextModule = require(PurchasePrompt.Utils.AppContext)
local FFlagPurchasePromptCartPricingEnabledModule = require(PurchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local FFlagEnableInExperienceOffersPurchaseFlow = SharedFlagsModule.FFlagEnableInExperienceOffersPurchaseFlow
local FetchCartPricingModule = require(PurchasePrompt.Thunks.fetchCartPricing)
local FetchInGameItemCartPricingModule = require(PurchasePrompt.Thunks.fetchInGameItemCartPricing)
local SelectCartPricingResponseModule = require(PurchasePrompt.Selectors.selectCartPricingResponse)
local SelectIsCartPricingFetchingModule = require(PurchasePrompt.Selectors.selectIsCartPricingFetching)
local FFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice = SharedFlagsModule.FFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice
local FFlagPurchasePromptGamePausedOnlyHideShownWindowModule = require(PurchasePrompt.Flags.FFlagPurchasePromptGamePausedOnlyHideShownWindow)
local DeriveCartPricingViewFunction = IAPExperienceModule.deriveCartPricingView
local DesktopUpsellExperiment = IAPExperienceModule.Utility.DesktopUpsellExperiment
local ProductPurchaseModal = IAPExperienceModule.ProductPurchaseModal
local RobuxUpsellModal = IAPExperienceModule.RobuxUpsellModal
local RobuxUpsellModalTooExpensiveFallback = IAPExperienceModule.RobuxUpsellModalTooExpensiveFallback
local ShouldShowBlackbirdUpsellModule = require(PurchasePrompt.Utils.shouldShowBlackbirdUpsell)
local ExtendResult = Roact.Component:extend(script.Name)
local ProductPurchasePromptModule = require(script.Parent.ProductPurchasePrompt)
local GetFFlagOpenVngTosForVngRobuxUpsellFunction = require(Parent.SharedFlags).GetFFlagOpenVngTosForVngRobuxUpsell
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local UnifiedPurchaseModalTypeEnum = IAPExperienceModule.Enums.UnifiedPurchaseModalTypeEnum
local FFlagUnifiedPurchaseGamepassAddProductUniverseId = require(Parent.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId
local FFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local FFlagAddPerformanceMetricsToUnifiedPurchaseModal = require(Parent.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagAddCenterDialogForUnifiedPurchaseModal = require(Parent.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal
local FFlagUnifiedPurchaseAddSkeleton = require(Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton
local FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry = require(Parent.SharedFlags).FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry
local RemoveDelayedInputForUnifiedPurchaseModal = game:DefineFastFlag("RemoveDelayedInputForUnifiedPurchaseModal", true)
local FFlagPurchasePromptSubtitleForTimedOptions = require(Parent.SharedFlags).FFlagPurchasePromptSubtitleForTimedOptions
local FFlagPurchaseModalTimedOptionExtension = require(Parent.SharedFlags).FFlagPurchaseModalTimedOptionExtension
local FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal = require(Parent.SharedFlags).FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal
local FFlagEnableBlackbirdUpsellImpressionGating = require(Parent.SharedFlags).FFlagEnableBlackbirdUpsellImpressionGating
local BlackbirdUpsellImpressionTrackerModule = require(PurchasePrompt.Utils.BlackbirdUpsellImpressionTracker)
local FFlagBlackbirdUpsellGateResaleAndTimedOptionModule = require(PurchasePrompt.Flags.FFlagBlackbirdUpsellGateResaleAndTimedOption)
local FFlagSetMenuOnPurchasePromptModule = require(PurchasePrompt.Flags.FFlagSetMenuOnPurchasePrompt)
local FFlagSkipBuyDelayForExperienceShopModule = require(PurchasePrompt.Flags.FFlagSkipBuyDelayForExperienceShop)
local FFlagLuaAppsEnablePromptVIPServerPurchase = require(Parent.SharedFlags).FFlagLuaAppsEnablePromptVIPServerPurchase

local function isRelevantRequestType(RequestType, PurchaseFlow, InitializingPurchase): boolean --[[ Line: 176 ]]
	-- upvalues: FFlagUnifiedPurchaseAddSkeleton (copy), PromptStateModule (copy), PurchaseFlowModule (copy), RequestTypeModule (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), FFlagLuaAppsEnablePromptVIPServerPurchase (copy)
	return FFlagUnifiedPurchaseAddSkeleton and InitializingPurchase == PromptStateModule.InitializingPurchase and PurchaseFlow == PurchaseFlowModule.RobuxUpsellV2 or PurchaseFlow ~= PurchaseFlowModule.RobuxUpsellV2 and PurchaseFlow ~= PurchaseFlowModule.LargeRobuxUpsell and (RequestType == RequestTypeModule.Asset or (RequestType == RequestTypeModule.Bundle or (RequestType == RequestTypeModule.GamePass or (RequestType == RequestTypeModule.Product or (RequestType == RequestTypeModule.AvatarCreationFee or (RequestType == RequestTypeModule.Experience or (RequestType == RequestTypeModule.Look or (FFlagEnableUnifiedPurchaseFlowForDevSubs and RequestType == RequestTypeModule.DeveloperSubscription or FFlagLuaAppsEnablePromptVIPServerPurchase and RequestType == RequestTypeModule.VIPServer))))))))
end

local function _(DeveloperSubscription, p1, p2): boolean --[[ Line: 200 | Named "getIsFiatProduct" ]]
	-- upvalues: FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), RequestTypeModule (copy)
	return if FFlagEnableUnifiedPurchaseFlowForDevSubs and DeveloperSubscription == RequestTypeModule.DeveloperSubscription then p1.displayPrice ~= nil and p2 == 0 else false
end

local _ = function(p1) --[[ Line: 208 | Named "promptStateToViewName" ]]
	-- upvalues: PromptStateModule (copy)
	return ({
		[PromptStateModule.RobuxUpsell] = "PurchaseModal",
		[PromptStateModule.UpsellInProgress] = "RobuxPurchasePending"
	})[p1]
end

function ExtendResult.init(p1) --[[ Line: 216 ]]
	-- upvalues: HttpService (copy), FFlagEnablePurchaseFlowUUIDMigrationModule (copy), LoggingProtocolModule (copy), PurchaseFlowUUIDTelemetryModule (copy), CachedPolicyServiceModule (copy), PromptStateModule (copy), FFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice (copy), FFlagUnifiedPurchaseGamepassAddProductUniverseId (copy), SendUnifiedPurchaseEventLogModule (copy), RemoveDelayedInputForUnifiedPurchaseModal (copy), FFlagSkipBuyDelayForExperienceShopModule (copy), AppContextModule (copy), Players (copy), isRelevantRequestType (copy), LogUnifiedPurchaseTelemetryCounterModule (copy), UnifiedPurchaseTelemetryModule (copy), UnifiedPurchaseEventNameEnumModule (copy), PurchaseErrorModule (copy), IsGenericChallengeResponseModule (copy), RequestTypeModule (copy), PublishAssetAnalyticsModule (copy), FFlagEnableLaunchAfterPurchase (copy), ExperienceService (copy), WindowStateModule (copy), ContextActionService (copy), VPCModalTypeModule (copy), FFlagAddPerformanceMetricsToUnifiedPurchaseModal (copy), EmitPerformanceMetricsModule (copy), ConstantsModule (copy)
	p1.state = {
		isLuobu = false,
		screenSize = Vector2.new(0, 0),
		analyticId = HttpService:GenerateGUID(false)
	}
	
	if not FFlagEnablePurchaseFlowUUIDMigrationModule then
		p1.props.setPurchaseFlowUUID(HttpService:GenerateGUID(false))
		LoggingProtocolModule.default:logRobloxTelemetryCounter(PurchaseFlowUUIDTelemetryModule.ProductPurchaseContainerMigrationCounter, 1, { method = "ProductPurchaseContainerInit" })
	end
	coroutine.wrap(function() --[[ Line: 235 ]]
		-- upvalues: CachedPolicyServiceModule (upval), p1 (copy)
		if CachedPolicyServiceModule:IsSubjectToChinaPolicies() then
			p1:setState({ isLuobu = true })
		end
	end)()
	
	function p1.emitPurchaseFlowEvent(Purchase_event_type, Input_type) --[[ Line: 246 ]]
		-- upvalues: p1 (copy), PromptStateModule (upval), HttpService (upval)
		local Entry = ({
			[PromptStateModule.RobuxUpsell] = "PurchaseModal",
			[PromptStateModule.UpsellInProgress] = "RobuxPurchasePending"
		})[p1.props.promptState]
		
		if Entry then
			p1.props.onAnalyticEvent("UserPurchaseFlow", {
				purchase_flow = "InGameRobuxUpsell",
				purchase_flow_uuid = p1.props.purchaseFlowUUID,
				view_name = Entry,
				purchase_event_type = Purchase_event_type,
				input_type = Input_type,
				event_metadata = HttpService:JSONEncode({
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
	
	function p1.emitUnifiedProductPurchaseFlowEvent(Event_name) --[[ Line: 270 ]]
		-- upvalues: p1 (copy), FFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice (upval), FFlagUnifiedPurchaseGamepassAddProductUniverseId (upval), SendUnifiedPurchaseEventLogModule (upval)
		local PurchaseAnalyticsMetadata = p1.props.purchaseAnalyticsMetadata or {}
		SendUnifiedPurchaseEventLogModule({
			event_name = Event_name,
			purchase_flow_uuid = PurchaseAnalyticsMetadata.purchaseFlowUUID,
			product_id = PurchaseAnalyticsMetadata.productId,
			product_type = PurchaseAnalyticsMetadata.productType,
			product_target_id = PurchaseAnalyticsMetadata.productTargetId,
			robux_price = if FFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice and p1.props.productPrice ~= nil then p1.props.productPrice else PurchaseAnalyticsMetadata.price,
			surface = PurchaseAnalyticsMetadata.surface,
			user_roblox_balance = PurchaseAnalyticsMetadata.userRobuxBalance,
			salelocation_universeid = PurchaseAnalyticsMetadata.saleLocationUniverseId,
			product_universeid = if FFlagUnifiedPurchaseGamepassAddProductUniverseId then PurchaseAnalyticsMetadata.productUniverseId else nil
		})
	end
	
	function p1.changeScreenSize(Frame: Frame) --[[ Line: 297 ]]
		-- upvalues: p1 (copy)
		if p1.state.screenSize ~= Frame.AbsoluteSize then
			p1:setState({ screenSize = Frame.AbsoluteSize })
		end
	end
	
	function p1.isFromShopSkip(): boolean --[[ Line: 305 ]]
		-- upvalues: p1 (copy)
		return p1.props.productPayload ~= nil and p1.props.productPayload.isFromInExperienceShop == true
	end
	
	function p1.hasDelayedInput(): boolean --[[ Line: 309 ]]
		-- upvalues: RemoveDelayedInputForUnifiedPurchaseModal (upval), p1 (copy), PromptStateModule (upval), FFlagSkipBuyDelayForExperienceShopModule (upval)
		if RemoveDelayedInputForUnifiedPurchaseModal or not p1.props.isTestPurchase then
			local PromptState = p1.props.promptState
			
			return PromptState == PromptStateModule.PromptPurchase and p1.buyButtonUsesFoundationInputDelay and (not FFlagSkipBuyDelayForExperienceShopModule or not p1.isFromShopSkip()) or (if RemoveDelayedInputForUnifiedPurchaseModal then (not FFlagSkipBuyDelayForExperienceShopModule or not p1.isFromShopSkip() or PromptState ~= PromptStateModule.RobuxUpsell and PromptState ~= PromptStateModule.UpsellInProgress) and (PromptState == PromptStateModule.PurchaseInProgress or (PromptState == PromptStateModule.RobuxUpsell or PromptState == PromptStateModule.UpsellInProgress)) else (not FFlagSkipBuyDelayForExperienceShopModule or not p1.isFromShopSkip() or PromptState ~= PromptStateModule.PromptPurchase and PromptState ~= PromptStateModule.RobuxUpsell and PromptState ~= PromptStateModule.UpsellInProgress) and (PromptState == PromptStateModule.PromptPurchase or (PromptState == PromptStateModule.PurchaseInProgress or (PromptState == PromptStateModule.RobuxUpsell or PromptState == PromptStateModule.UpsellInProgress))))
		else
			return false
		end
	end
	
	function p1.isWindowShowAndDoneAnimating(): boolean --[[ Line: 363 ]]
		-- upvalues: p1 (copy)
		return p1.state.isAnimating == false
	end
	
	p1.buyButtonUsesFoundationInputDelay = AppContextModule.get() == AppContextModule.Enum.IN_EXPERIENCE
	
	function p1.canConfirmInput() --[[ Line: 372 ]]
		-- upvalues: Players (upval), p1 (copy)
		if Players.LocalPlayer.GameplayPaused then
			return false
		end
		local IsWindowShowAndDoneAnimating = p1.isWindowShowAndDoneAnimating()
		
		if p1.hasDelayedInput() then
			local IsClockTimeAbove: boolean = if p1.state.doneAnimatingTime then os.clock() - p1.state.doneAnimatingTime > 2.5 else false
			
			return IsWindowShowAndDoneAnimating and IsClockTimeAbove
		else
			return IsWindowShowAndDoneAnimating
		end
	end
	
	function p1.getConfirmButtonAction(PromptState, RequestType, PurchaseError) --[[ Line: 397 ]]
		-- upvalues: PromptStateModule (upval), isRelevantRequestType (upval), p1 (copy), LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), UnifiedPurchaseEventNameEnumModule (upval), PurchaseErrorModule (upval), IsGenericChallengeResponseModule (upval)
		if PromptState == PromptStateModule.None or not isRelevantRequestType(RequestType) then
			return nil
		end
		if PromptState ~= PromptStateModule.PromptPurchase and PromptState ~= PromptStateModule.PurchaseInProgress then
			return if PromptState == PromptStateModule.RobuxUpsell or PromptState == PromptStateModule.UpsellInProgress or PromptState == PromptStateModule.LeaveRobloxWarning then p1.props.onRobuxUpsell elseif PromptState == PromptStateModule.U13PaymentModal or PromptState == PromptStateModule.U13MonthlyThreshold1Modal or PromptState == PromptStateModule.U13MonthlyThreshold2Modal or PromptState == PromptStateModule.ParentalConsentWarningPaymentModal13To17 then p1.props.onScaryModalConfirm elseif PromptState == PromptStateModule.Error and PurchaseError == PurchaseErrorModule.TwoFactorNeededSettings then p1.props.onOpenSecuritySettings elseif IsGenericChallengeResponseModule(PurchaseError) then function() --[[ Line: 429 ]]
				-- upvalues: p1 (upval), PurchaseError (copy)
				p1.props.onOpenSecuritySettings(PurchaseError)
			end else p1.props.hideWindow
		end
		if p1.props.isUserEligibleForUnifiedPurchaseFlow then
			local PurchaseAnalyticsMetadata = p1.props.purchaseAnalyticsMetadata or {}
			LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedProductPurchaseModalBuyItemButtonClickedCounter, PurchaseAnalyticsMetadata.surface, PurchaseAnalyticsMetadata.productType)
			p1.emitUnifiedProductPurchaseFlowEvent(UnifiedPurchaseEventNameEnumModule.BuyItemModalBuyClicked)
		end
		return p1.props.onBuy
	end
	
	function p1.getCancelButtonAction(PromptState, RequestType) --[[ Line: 437 ]]
		-- upvalues: PromptStateModule (upval), isRelevantRequestType (upval), p1 (copy)
		return if PromptState == PromptStateModule.None or not isRelevantRequestType(RequestType) then nil else p1.props.hideWindow
	end
	
	function p1.confirmButtonPressed() --[[ Line: 445 ]]
		-- upvalues: p1 (copy), RequestTypeModule (upval), PromptStateModule (upval), PublishAssetAnalyticsModule (upval)
		if p1.props.requestType == RequestTypeModule.AvatarCreationFee and p1.props.promptState == PromptStateModule.PromptPurchase then
			PublishAssetAnalyticsModule.sendButtonClicked(PublishAssetAnalyticsModule.Section.BuyItemModal, PublishAssetAnalyticsModule.Element.Buy)
		end
		local ConfirmButtonAction: () -> () = p1.getConfirmButtonAction(p1.props.promptState, p1.props.requestType, p1.props.purchaseError)
		
		if ConfirmButtonAction ~= nil and p1.canConfirmInput() then
			ConfirmButtonAction()
		end
	end
	
	function p1.launchAfterPurchaseButtonShown() --[[ Line: 463 ]]
		-- upvalues: p1 (copy), UnifiedPurchaseEventNameEnumModule (upval)
		p1.emitUnifiedProductPurchaseFlowEvent(UnifiedPurchaseEventNameEnumModule.LaunchAfterPurchaseButtonShown)
	end
	
	function p1.launchAfterPurchaseButtonPressed() --[[ Line: 470 ]]
		-- upvalues: p1 (copy), UnifiedPurchaseEventNameEnumModule (upval), FFlagEnableLaunchAfterPurchase (upval), ExperienceService (upval)
		p1.emitUnifiedProductPurchaseFlowEvent(UnifiedPurchaseEventNameEnumModule.LaunchAfterPurchaseButtonClicked)
		local LaunchAfterPurchaseRootPlaceId = p1.props.launchAfterPurchaseRootPlaceId
		local OnLaunchAfterPurchase = if FFlagEnableLaunchAfterPurchase then p1.props.purchaseCallbacks and p1.props.purchaseCallbacks.onLaunchAfterPurchase else nil
		p1.confirmButtonPressed()
		task.defer(function() --[[ Line: 479 ]]
			-- upvalues: LaunchAfterPurchaseRootPlaceId (copy), ExperienceService (upval), p1 (upval), UnifiedPurchaseEventNameEnumModule (upval), OnLaunchAfterPurchase (copy)
			local Number: number? = tonumber(LaunchAfterPurchaseRootPlaceId)
			
			if Number == nil or ExperienceService == nil then return end
			p1.emitUnifiedProductPurchaseFlowEvent(UnifiedPurchaseEventNameEnumModule.ExperienceLaunchedAfterPurchase)
			
			if OnLaunchAfterPurchase then
				OnLaunchAfterPurchase()
			end
			ExperienceService:LaunchExperience({ placeId = Number }, "PurchaseCompletionPlayButton")
		end)
	end
	
	function p1.cancelButtonPressed() --[[ Line: 494 ]]
		-- upvalues: p1 (copy), RequestTypeModule (upval), PromptStateModule (upval), PublishAssetAnalyticsModule (upval), LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval)
		if p1.props.requestType == RequestTypeModule.AvatarCreationFee and p1.props.promptState == PromptStateModule.PromptPurchase then
			PublishAssetAnalyticsModule.sendButtonClicked(PublishAssetAnalyticsModule.Section.BuyItemModal, PublishAssetAnalyticsModule.Element.Cancel)
		end
		if p1.props.isUserEligibleForUnifiedPurchaseFlow then
			LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedProductPurchaseModalCancelButtonClickedCounter, p1.props.purchaseAnalyticsMetadata.surface, p1.props.purchaseAnalyticsMetadata.productType)
		end
		local CancelButtonAction: () -> () = p1.getCancelButtonAction(p1.props.promptState, p1.props.requestType)
		
		if CancelButtonAction ~= nil then
			CancelButtonAction()
		end
	end
	
	function p1.configContextActionService(WindowState) --[[ Line: 519 ]]
		-- upvalues: WindowStateModule (upval), ContextActionService (upval), p1 (copy)
		if WindowState == WindowStateModule.Shown then
			ContextActionService:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, UserInputState, _) --[[ Line: 521 ]]
				-- upvalues: p1 (upval)
				if UserInputState == Enum.UserInputState.Begin then
					p1.confirmButtonPressed()
				end
			end, false, Enum.KeyCode.ButtonA)
			ContextActionService:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, UserInputState, _) --[[ Line: 526 ]]
				-- upvalues: p1 (upval)
				if UserInputState == Enum.UserInputState.Begin then
					p1.cancelButtonPressed()
				end
			end, false, Enum.KeyCode.ButtonB)
			
			return
		else
			ContextActionService:UnbindCoreAction("ProductPurchaseConfirmButtonBind")
			ContextActionService:UnbindCoreAction("ProductPurchaseCancelButtonBind")
		end
	end
	
	function p1.getVPCModalType(PromptState) --[[ Line: 537 ]]
		-- upvalues: PromptStateModule (upval), VPCModalTypeModule (upval)
		return if PromptState == PromptStateModule.EnablePurchaseVPCModal then VPCModalTypeModule.toRawValue(VPCModalTypeModule.EnablePurchase) else VPCModalTypeModule.toRawValue(VPCModalTypeModule.None)
	end
	
	function p1.onBuyItemButtonMounted(p2) --[[ Line: 544 ]]
		-- upvalues: p1 (copy), LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), UnifiedPurchaseEventNameEnumModule (upval), FFlagAddPerformanceMetricsToUnifiedPurchaseModal (upval), EmitPerformanceMetricsModule (upval), ConstantsModule (upval)
		local PurchaseAnalyticsMetadata = p1.props.purchaseAnalyticsMetadata or {}
		LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedProductPurchaseModalShownCounter, PurchaseAnalyticsMetadata.surface, PurchaseAnalyticsMetadata.productType)
		p1.emitUnifiedProductPurchaseFlowEvent(UnifiedPurchaseEventNameEnumModule.BuyItemModalShown)
		
		if FFlagAddPerformanceMetricsToUnifiedPurchaseModal and PurchaseAnalyticsMetadata and PurchaseAnalyticsMetadata.surface then
			EmitPerformanceMetricsModule(ConstantsModule.PerformanceMetrics.IntervalName.ProductPurchaseContainerShown, PurchaseAnalyticsMetadata.surface)
		end
		if p1.props.purchaseCallbacks and p1.props.purchaseCallbacks.onBuyItemButtonMounted then
			p1.props.purchaseCallbacks.onBuyItemButtonMounted(p2)
		end
	end
end

function ExtendResult.didMount(p1) --[[ Line: 570 ]]
	-- upvalues: WindowStateModule (copy), isRelevantRequestType (copy), GuiService (copy)
	local PurchaseFlow = p1.props.purchaseFlow
	local RequestType = p1.props.requestType
	
	if p1.props.windowState == WindowStateModule.Shown and isRelevantRequestType(RequestType, PurchaseFlow) then
		p1:setState({ isAnimating = true })
		p1.configContextActionService(p1.props.windowState)
		GuiService.SetPurchasePromptIsShown(true)
	end
end

function ExtendResult.willUpdate(p1, p2) --[[ Line: 584 ]]
	if p1.props.expectedPrice ~= p2.expectedPrice then
		p1:setState({})
	end
end

function ExtendResult.didUpdate(p1, p2, _) --[[ Line: 590 ]]
	-- upvalues: FFlagEnablePurchaseFlowUUIDMigrationModule (copy), PromptStateModule (copy), HttpService (copy), LoggingProtocolModule (copy), PurchaseFlowUUIDTelemetryModule (copy), FFlagPurchasePromptGamePausedOnlyHideShownWindowModule (copy), Players (copy), WindowStateModule (copy), isRelevantRequestType (copy), GuiService (copy), RequestTypeModule (copy), PublishAssetAnalyticsModule (copy)
	if not FFlagEnablePurchaseFlowUUIDMigrationModule and p1.props.promptState ~= p2.promptState and p1.props.promptState == PromptStateModule.None then
		p1.props.setPurchaseFlowUUID((HttpService:GenerateGUID(false)))
		LoggingProtocolModule.default:logRobloxTelemetryCounter(PurchaseFlowUUIDTelemetryModule.ProductPurchaseContainerMigrationCounter, 1, { method = "ProductPurchaseContainerDidUpdate" })
	end
	if FFlagPurchasePromptGamePausedOnlyHideShownWindowModule then
		if Players.LocalPlayer.GameplayPaused and p1.props.windowState == WindowStateModule.Shown then
			p1.props.onAnalyticEvent("PurchasePromptGamePausedDetected", { place_id = game.PlaceId })
			p1.props.hideWindow()
		end
	elseif Players.LocalPlayer.GameplayPaused then
		p1.props.onAnalyticEvent("PurchasePromptGamePausedDetected", { place_id = game.PlaceId })
		p1.props.hideWindow()
	end
	local PurchaseFlow = p1.props.purchaseFlow
	local RequestType = p1.props.requestType
	
	if p2.windowState ~= p1.props.windowState and isRelevantRequestType(RequestType, PurchaseFlow) then
		p1:setState({ isAnimating = true })
		p1.configContextActionService(p1.props.windowState)
		GuiService:SetPurchasePromptIsShown(p1.props.windowState == WindowStateModule.Shown)
		
		if p1.props.windowState == WindowStateModule.Hidden then
			p1.props.completeRequest()
		end
	end
	if RequestType == RequestTypeModule.AvatarCreationFee and p1.props.promptState == PromptStateModule.PurchaseComplete and p2.promptState ~= PromptStateModule.PurchaseComplete then
		PublishAssetAnalyticsModule.sendPageLoad(PublishAssetAnalyticsModule.Section.ProcessCompleteModal)
	end
	if p2.promptState ~= p1.props.promptState then
		p1.emitPurchaseFlowEvent("ViewShown")
	end
end

function ExtendResult.getMessageKeysFromPromptState(p1) --[[ Line: 656 ]]
	-- upvalues: PromptStateModule (copy), PurchaseErrorModule (copy), LocalizationServiceModule (copy), IsGenericChallengeResponseModule (copy)
	local PromptState = p1.props.promptState
	local ProductInfo = p1.props.productInfo
	local PurchaseError = p1.props.purchaseError
	
	if PromptState == PromptStateModule.PurchaseComplete then
		return {
			messageText = {
				key = "CoreScripts.PurchasePrompt.PurchaseMessage.Succeeded",
				params = { ITEM_NAME = ProductInfo.name }
			},
			okText = { key = "CoreScripts.PurchasePrompt.Button.OK" },
			titleText = { key = "CoreScripts.PurchasePrompt.Title.BuyItem" }
		}
	elseif PromptState == PromptStateModule.U13PaymentModal then
		return {
			messageText = {
				key = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalOne"
			},
			okText = { key = "CoreScripts.PurchasePrompt.Button.OK" },
			titleText = { key = "CoreScripts.PurchasePrompt.Title.BuyItem" }
		}
	elseif PromptState == PromptStateModule.U13MonthlyThreshold1Modal then
		return {
			messageText = {
				key = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalTwo"
			},
			okText = { key = "CoreScripts.PurchasePrompt.Button.OK" },
			titleText = { key = "CoreScripts.PurchasePrompt.Title.BuyItem" }
		}
	elseif PromptState == PromptStateModule.U13MonthlyThreshold2Modal then
		return {
			messageText = {
				key = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalParental"
			},
			okText = { key = "CoreScripts.PurchasePrompt.Button.OK" },
			titleText = { key = "CoreScripts.PurchasePrompt.Title.BuyItem" }
		}
	elseif PromptState == PromptStateModule.ParentalConsentWarningPaymentModal13To17 then
		return {
			messageText = {
				key = "CoreScripts.PurchasePrompt.PurchaseDetails.ParentalConsent"
			},
			okText = { key = "CoreScripts.PurchasePrompt.Button.OK" },
			titleText = { key = "CoreScripts.PurchasePrompt.Title.BuyItem" }
		}
	elseif PromptState ~= PromptStateModule.Error then return end
	return if PurchaseError == PurchaseErrorModule.UnknownFailure then {
		messageText = {
			key = LocalizationServiceModule.getErrorKey(PurchaseError),
			params = { ITEM_NAME = ProductInfo.name }
		},
		okText = { key = "CoreScripts.PurchasePrompt.Button.OK" },
		titleText = { key = "CoreScripts.PremiumModal.Title.Error" }
	} elseif PurchaseError == PurchaseErrorModule.TwoFactorNeededSettings or IsGenericChallengeResponseModule(PurchaseError) then {
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
			key = LocalizationServiceModule.getErrorKey(PurchaseError)
		},
		okText = { key = "CoreScripts.PurchasePrompt.Button.OK" },
		titleText = { key = "CoreScripts.PremiumModal.Title.Error" }
	}
end

function ExtendResult.determinePrompt(p1) --[[ Line: 725 ]]
	-- upvalues: WindowStateModule (copy), PromptStateModule (copy), isRelevantRequestType (copy), FFlagUnifiedPurchaseAddSkeleton (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), RequestTypeModule (copy), PurchaseClientSessionIdType (copy), RobloxSubscriptionPurchaseAppModule (copy), RobloxSubscriptionFlowCompleteReason (copy), FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (copy), SurfaceName (copy), AppContextModule (copy), SurfaceContext (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), DeriveCartPricingViewFunction (copy), GetUnifiedPurchaseModalTypeModule (copy), UnifiedPurchaseModalTypeEnum (copy), ShouldShowBlackbirdUpsellModule (copy), FFlagBlackbirdUpsellGateResaleAndTimedOptionModule (copy), GetBlackbirdUpsellBannerProductInfoModule (copy), FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry (copy), UnifiedPurchaseEventNameEnumModule (copy), FFlagEnableBlackbirdUpsellImpressionGating (copy), BlackbirdUpsellImpressionTrackerModule (copy), FFlagEnableInExperienceOffersPurchaseFlow (copy), FFlagAddCenterDialogForUnifiedPurchaseModal (copy), Roact (copy), UnifiedProductPurchaseModalV2 (copy), FFlagPurchasePromptSubtitleForTimedOptions (copy), FFlagSkipBuyDelayForExperienceShopModule (copy), UnifiedProductPurchaseModal (copy), FFlagLuaAppsEnablePromptVIPServerPurchase (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), ProductPurchaseSurface (copy), DesktopUpsellExperiment (copy), ProductPurchaseModal (copy), ProductPurchase (copy), RobuxUpsellModal (copy), ProductPurchaseRobuxUpsell (copy), GetFFlagOpenVngTosForVngRobuxUpsellFunction (copy), GetAppFeaturePoliciesFunction (copy), LeaveRobloxAlert (copy), InteractiveAlert (copy), RobloxTranslatorModule (copy), ButtonType (copy), PurchaseErrorModule (copy), IsGenericChallengeResponseModule (copy), ReactModule (copy), ProductPurchasePromptModule (copy), Images (copy), FFlagAddSurfaceAndProductTypeToPromptCounterModule (copy), Animator (copy), VerifiedParentalConsentDialog (copy), RobuxUpsellModalTooExpensiveFallback (copy), FFlagEnableLaunchAfterPurchase (copy), FFlagPurchaseModalTimedOptionExtension (copy)
	local PurchaseFlow = p1.props.purchaseFlow
	local PromptState = p1.props.promptState
	local RequestType = p1.props.requestType
	local PurchaseError = p1.props.purchaseError
	local ProductInfo = p1.props.productInfo
	local AccountInfo = p1.props.accountInfo
	local IsTestPurchase = p1.props.isTestPurchase
	
	if p1.props.windowState ~= WindowStateModule.Shown then
		return nil
	end
	if PromptState == PromptStateModule.None or not isRelevantRequestType(RequestType, PurchaseFlow, if FFlagUnifiedPurchaseAddSkeleton then PromptState else nil) then
		return nil
	end
	if PromptState == PromptStateModule.PromptPurchase or PromptState == PromptStateModule.PurchaseInProgress or FFlagUnifiedPurchaseAddSkeleton and PromptState == PromptStateModule.InitializingPurchase then
		if not p1.props.isUserEligibleForUnifiedPurchaseFlow then
			return if DesktopUpsellExperiment.shouldShowNewModal() then Roact.createElement(ProductPurchaseModal, {
				screenSize = p1.state.screenSize,
				product = {
					itemIcon = ProductInfo.imageUrl,
					itemName = ProductInfo.name,
					itemRobuxCost = p1.props.productPrice
				},
				balanceAmount = AccountInfo.balance,
				balanceAmountValid = game:DefineFastFlag("BalanceNotShowingInExperimentIssueFix", false) and not AccountInfo.hasFailed,
				buttons = {
					isDisabled = PromptState == PromptStateModule.PurchaseInProgress,
					buyItemActivated = p1.confirmButtonPressed,
					buyItemControllerIcon = if p1.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil,
					buyItemIsDelayedInput = p1.hasDelayedInput(),
					buyItemEnableInputDelayed = p1.isWindowShowAndDoneAnimating(),
					cancelActivated = p1.cancelButtonPressed
				}
			}) else Roact.createElement(ProductPurchase, {
				screenSize = p1.state.screenSize,
				isDisabled = PromptState == PromptStateModule.PurchaseInProgress,
				model = p1.props.humanoidModel,
				itemIcon = ProductInfo.imageUrl,
				itemName = ProductInfo.name,
				itemRobuxCost = p1.props.productPrice,
				currentBalance = AccountInfo.balance,
				currentBalanceValid = not AccountInfo.hasFailed,
				testPurchase = IsTestPurchase,
				isDelayedInput = p1.hasDelayedInput(),
				enableInputDelayed = p1.isWindowShowAndDoneAnimating(),
				buyItemControllerIcon = if p1.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil,
				cancelControllerIcon = if p1.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" else nil,
				buyItemActivated = p1.confirmButtonPressed,
				cancelPurchaseActivated = p1.cancelButtonPressed,
				isLuobu = p1.state.isLuobu
			})
		end
		local ProductPrice = p1.props.productPrice
		local IsProductPriceMatch: boolean = if FFlagEnableUnifiedPurchaseFlowForDevSubs and RequestType == RequestTypeModule.DeveloperSubscription then ProductInfo.displayPrice ~= nil and ProductPrice == 0 else false
		
		local function OnBlackbirdUpsellActivated() --[[ Line: 764 ]]
			-- upvalues: p1 (copy), PromptStateModule (upval), WindowStateModule (upval), PurchaseClientSessionIdType (upval), RobloxSubscriptionPurchaseAppModule (upval), RobloxSubscriptionFlowCompleteReason (upval), FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (upval), SurfaceName (upval), AppContextModule (upval), SurfaceContext (upval)
			p1.props.setPromptState(PromptStateModule.BlackbirdUpsellInProgress)
			p1.props.setWindowState(WindowStateModule.Suspended)
			local PurchaseFlowUUID = p1.props.purchaseFlowUUID
			local PurchaseFlowUUID1 = if PurchaseFlowUUID and PurchaseFlowUUID ~= "" then PurchaseFlowUUID else nil
			local Config = if PurchaseFlowUUID1 then {
				clientSessionIdType = PurchaseClientSessionIdType.PurchaseFlowUUID,
				clientSessionId = PurchaseFlowUUID1
			} else nil
			RobloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase({ showBackButton = true }, {
				onFlowComplete = function(UpsellDismissed) --[[ Line: 783 ]]
					-- upvalues: RobloxSubscriptionFlowCompleteReason (upval), FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (upval), p1 (upval)
					if UpsellDismissed == RobloxSubscriptionFlowCompleteReason.UpsellPurchaseSucceeded then
						if FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal and p1.props.purchaseCallbacks and p1.props.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess then
							p1.props.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess()
						end
						p1.props.retryPurchaseAfterUpsell()
						
						return
					elseif UpsellDismissed == RobloxSubscriptionFlowCompleteReason.UpsellDismissed then
						p1.props.completeRequest()
						
						return
					else
						if UpsellDismissed == RobloxSubscriptionFlowCompleteReason.UpsellPurchaseFailed then
							p1.props.completeRequest()
							
							return
						else
							p1.props.completeRequest()
						end
					end
				end,
				onBackButtonActivated = function() --[[ Line: 805 ]]
					-- upvalues: p1 (upval), PromptStateModule (upval), WindowStateModule (upval)
					p1.props.setPromptState(PromptStateModule.PromptPurchase)
					p1.props.setWindowState(WindowStateModule.Shown)
				end
			}, nil, SurfaceName.UnifiedProductPurchaseModal, if AppContextModule.get() == AppContextModule.Enum.IN_APP then SurfaceContext.InApp else SurfaceContext.InGame, nil, if Config then { clientSessionId = Config } else nil)
		end
		
		local Price = if IsProductPriceMatch then nil else p1.props.price
		local ProductPrice1 = nil
		
		if FFlagPurchasePromptCartPricingEnabledModule then
			local DeriveCartPricingViewResult = DeriveCartPricingViewFunction(p1.props.cartPricingResponse)
			local UnifiedPurchaseModalTypeModule = GetUnifiedPurchaseModalTypeModule(RequestType)
			ProductPrice1 = if IsProductPriceMatch or DeriveCartPricingViewResult == nil or UnifiedPurchaseModalTypeModule ~= UnifiedPurchaseModalTypeEnum.MultiItem then p1.props.productPrice else DeriveCartPricingViewResult.priceAfterDiscount
		end
		local BlackbirdUpsellBannerProductInfoModule = if ShouldShowBlackbirdUpsellModule(Price, p1.props.requestType, IsProductPriceMatch, if FFlagBlackbirdUpsellGateResaleAndTimedOptionModule then p1.props.productPayload else nil) and p1.props.robloxSubscriptionProducts then GetBlackbirdUpsellBannerProductInfoModule(p1.props.robloxSubscriptionProducts) else nil
		
		local function v146(p2) --[[ Line: 852 ]]
			-- upvalues: p1 (copy), FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry (upval), BlackbirdUpsellBannerProductInfoModule (copy), UnifiedPurchaseEventNameEnumModule (upval), FFlagEnableBlackbirdUpsellImpressionGating (upval), BlackbirdUpsellImpressionTrackerModule (upval)
			p1.onBuyItemButtonMounted(p2)
			
			if FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry and BlackbirdUpsellBannerProductInfoModule then
				p1.emitUnifiedProductPurchaseFlowEvent(UnifiedPurchaseEventNameEnumModule.SubscriptionUpsellBannerShown)
			end
			if FFlagEnableBlackbirdUpsellImpressionGating and BlackbirdUpsellBannerProductInfoModule then
				BlackbirdUpsellImpressionTrackerModule.incrementImpressionCount()
			end
		end
		
		local OnBuyItemButtonMounted = if FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry or FFlagEnableBlackbirdUpsellImpressionGating then v146 else p1.onBuyItemButtonMounted
		local OnCartOfferAppliedChanged = if FFlagPurchasePromptCartPricingEnabledModule then function(_, p2) --[[ Line: 869 ]]
			-- upvalues: p1 (copy), FFlagEnableInExperienceOffersPurchaseFlow (upval), RequestTypeModule (upval)
			if p2 ~= nil then
				local RequestType = p1.props.requestType
				
				if FFlagEnableInExperienceOffersPurchaseFlow and (RequestType == RequestTypeModule.GamePass or RequestType == RequestTypeModule.Product) then
					p1.props.fetchInGameItemCartPricing(p2)
					
					return
				end
				p1.props.fetchCartPricing(p2)
			end
		end else nil
		
		return if FFlagAddCenterDialogForUnifiedPurchaseModal and AppContextModule.get() == AppContextModule.Enum.IN_APP then Roact.createElement(UnifiedProductPurchaseModalV2, {
			product = {
				itemIcon = ProductInfo.imageUrl,
				itemName = ProductInfo.name,
				itemRobuxCost = if IsProductPriceMatch then nil elseif FFlagPurchasePromptCartPricingEnabledModule then ProductPrice1 else p1.props.productPrice,
				itemDisplayPrice = if IsProductPriceMatch then ProductInfo.displayPrice else nil,
				itemPrice = Price,
				model = p1.props.humanoidModel
			},
			subtitleView = if FFlagPurchasePromptSubtitleForTimedOptions then p1.props.subtitleView else nil,
			buttons = {
				buyItemActivated = p1.confirmButtonPressed,
				buyItemEnableInputDelayed = p1.isWindowShowAndDoneAnimating() and (p1.buyButtonUsesFoundationInputDelay and not (FFlagSkipBuyDelayForExperienceShopModule and p1.isFromShopSkip())),
				cancelActivated = p1.cancelButtonPressed,
				isDisabled = PromptState == PromptStateModule.PurchaseInProgress
			},
			postPurchaseActions = p1.props.postPurchaseActions,
			setPostPurchaseActions = p1.props.setPostPurchaseActions,
			onBuyItemButtonMounted = OnBuyItemButtonMounted,
			purchaseModalType = GetUnifiedPurchaseModalTypeModule(p1.props.requestType),
			robuxBalanceAmount = AccountInfo.balance,
			isTestPurchase = IsTestPurchase,
			isLoading = if FFlagUnifiedPurchaseAddSkeleton then PromptState == PromptStateModule.InitializingPurchase else nil,
			isCartPricingLoading = if FFlagPurchasePromptCartPricingEnabledModule then p1.props.isCartPricingLoading else nil,
			onBlackbirdUpsellActivated = OnBlackbirdUpsellActivated,
			BlackbirdUpsellBannerProductInfo = BlackbirdUpsellBannerProductInfoModule,
			cartPricingResponse = if FFlagPurchasePromptCartPricingEnabledModule then p1.props.cartPricingResponse else nil,
			onCartOfferAppliedChanged = if FFlagPurchasePromptCartPricingEnabledModule then OnCartOfferAppliedChanged else nil
		}) else Roact.createElement(UnifiedProductPurchaseModal, {
			product = {
				itemIcon = ProductInfo.imageUrl,
				itemName = ProductInfo.name,
				itemRobuxCost = if IsProductPriceMatch then nil else p1.props.productPrice,
				itemDisplayPrice = if IsProductPriceMatch then ProductInfo.displayPrice else nil,
				itemPrice = Price,
				model = p1.props.humanoidModel
			},
			buttons = {
				buyItemActivated = p1.confirmButtonPressed,
				buyItemEnableInputDelayed = p1.isWindowShowAndDoneAnimating() and (p1.buyButtonUsesFoundationInputDelay and not (FFlagSkipBuyDelayForExperienceShopModule and p1.isFromShopSkip())),
				cancelActivated = p1.cancelButtonPressed,
				isDisabled = PromptState == PromptStateModule.PurchaseInProgress
			},
			postPurchaseActions = p1.props.postPurchaseActions,
			setPostPurchaseActions = p1.props.setPostPurchaseActions,
			onBuyItemButtonMounted = OnBuyItemButtonMounted,
			purchaseModalType = GetUnifiedPurchaseModalTypeModule(p1.props.requestType),
			robuxBalanceAmount = AccountInfo.balance,
			isTestPurchase = IsTestPurchase,
			isMonthlyPrice = if FFlagLuaAppsEnablePromptVIPServerPurchase then ProductInfo.isMonthlyPrice else nil,
			isFreeWithRobloxPlus = if FFlagLuaAppsEnablePromptVIPServerPurchase then ProductInfo.isFreeWithRobloxPlus else nil,
			isCartPricingLoading = p1.props.isCartPricingLoading,
			onBlackbirdUpsellActivated = OnBlackbirdUpsellActivated,
			BlackbirdUpsellBannerProductInfo = BlackbirdUpsellBannerProductInfoModule,
			cartPricingResponse = p1.props.cartPricingResponse,
			onCartOfferAppliedChanged = OnCartOfferAppliedChanged,
			hideUserRobuxBalance = IsProductPriceMatch or (if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then p1.props.purchaseAnalyticsMetadata and p1.props.purchaseAnalyticsMetadata.surface == ProductPurchaseSurface.Catalog else nil)
		})
	elseif PromptState == PromptStateModule.RobuxUpsell or PromptState == PromptStateModule.UpsellInProgress then
		return if DesktopUpsellExperiment.shouldShowNewModal() then Roact.createElement(RobuxUpsellModal, {
			screenSize = p1.state.screenSize,
			product = {
				model = p1.props.humanoidModel,
				itemIcon = ProductInfo.imageUrl,
				itemName = ProductInfo.name,
				itemRobuxCost = p1.props.productPrice
			},
			upsell = {
				balanceAmount = AccountInfo.balance,
				robuxPurchaseAmount = p1.props.robuxPurchaseAmount,
				robuxPurchaseAmountBeforeBonus = p1.props.robuxAmountBeforeBonus,
				robuxPurchaseCost = p1.props.robuxPurchaseCost
			},
			buttons = {
				buyItemActivated = function() --[[ Line: 1041 ]]
					-- upvalues: p1 (copy)
					p1.confirmButtonPressed()
					p1.emitPurchaseFlowEvent("UserInput", "Buy")
				end,
				buyItemDisabled = PromptState == PromptStateModule.UpsellInProgress,
				buyItemControllerIcon = if p1.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil,
				buyItemisDelayedInput = p1.hasDelayedInput(),
				buyItemEnableInputDelayed = p1.isWindowShowAndDoneAnimating() and not (FFlagSkipBuyDelayForExperienceShopModule and p1.isFromShopSkip()),
				cancelPurchaseActivated = function() --[[ Line: 1051 ]]
					-- upvalues: p1 (copy)
					p1.cancelButtonPressed()
					p1.emitPurchaseFlowEvent("UserInput", "Cancel")
				end,
				cancelControllerIcon = if p1.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" else nil,
				opensBuyRobuxPage = DesktopUpsellExperiment.getVariant() == DesktopUpsellExperiment.variants.OpenRobuxStore
			}
		}) else Roact.createElement(ProductPurchaseRobuxUpsell, {
			screenSize = p1.state.screenSize,
			isDisabled = PromptState == PromptStateModule.UpsellInProgress,
			model = p1.props.humanoidModel,
			itemIcon = ProductInfo.imageUrl,
			itemName = ProductInfo.name,
			itemRobuxCost = p1.props.productPrice,
			robuxPurchaseAmount = p1.props.robuxPurchaseAmount,
			robuxPurchaseAmountBeforeBonus = p1.props.robuxAmountBeforeBonus,
			balanceAmount = AccountInfo.balance,
			isDelayedInput = p1.hasDelayedInput(),
			enableInputDelayed = p1.isWindowShowAndDoneAnimating() and not (FFlagSkipBuyDelayForExperienceShopModule and p1.isFromShopSkip()),
			buyItemControllerIcon = if p1.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil,
			cancelControllerIcon = if p1.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" else nil,
			buyItemActivated = function() --[[ Line: 1080 ]]
				-- upvalues: p1 (copy)
				p1.confirmButtonPressed()
				p1.emitPurchaseFlowEvent("UserInput", "Buy")
			end,
			cancelPurchaseActivated = function() --[[ Line: 1084 ]]
				-- upvalues: p1 (copy)
				p1.cancelButtonPressed()
				p1.emitPurchaseFlowEvent("UserInput", "Cancel")
			end,
			isLuobu = p1.state.isLuobu,
			isVng = GetFFlagOpenVngTosForVngRobuxUpsellFunction() and GetAppFeaturePoliciesFunction().getShowVNGTosForRobuxUpsell()
		})
	elseif PromptState == PromptStateModule.LeaveRobloxWarning then
		return Roact.createElement(LeaveRobloxAlert, {
			screenSize = p1.state.screenSize,
			cancelActivated = p1.cancelButtonPressed,
			continueActivated = p1.confirmButtonPressed
		})
	elseif PromptState == PromptStateModule.PurchaseComplete and RequestType == RequestTypeModule.AvatarCreationFee then
		return Roact.createElement(InteractiveAlert, {
			bodyText = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.PurchaseCompleteDescription"),
			buttonStackInfo = {
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = p1.confirmButtonPressed,
							text = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.ResultModalOk"),
							inputIcon = if p1.props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil
						}
					}
				}
			},
			screenSize = p1.state.screenSize,
			title = RobloxTranslatorModule:FormatByKey("CoreScripts.BulkPurchasePrompt.CompletedPrompt.SuccessHeading")
		})
	elseif PromptState == PromptStateModule.Error and PurchaseError == PurchaseErrorModule.TwoFactorNeededSettings or IsGenericChallengeResponseModule(PurchaseError) then
		return ReactModule.createElement(ProductPurchasePromptModule, {
			includeCancelButton = true,
			screenSize = p1.state.screenSize,
			titleIcon = Images["icons/status/error_large"],
			promptState = PromptState,
			productInfo = ProductInfo,
			purchaseError = PurchaseError,
			economicRestrictionError = p1.props.economicRestrictionError or {},
			isGamepadEnabled = p1.props.isGamepadEnabled,
			cancelButtonPressed = p1.cancelButtonPressed,
			confirmButtonPressed = p1.confirmButtonPressed,
			isGenericChallengeResponse = IsGenericChallengeResponseModule,
			useUnifiedPurchaseCompletionModal = p1.props.isUserEligibleForUnifiedPurchaseFlow,
			surface = if FFlagAddSurfaceAndProductTypeToPromptCounterModule then p1.props.purchaseAnalyticsMetadata and p1.props.purchaseAnalyticsMetadata.surface else nil,
			productType = if FFlagAddSurfaceAndProductTypeToPromptCounterModule then p1.props.purchaseAnalyticsMetadata and p1.props.purchaseAnalyticsMetadata.productType else nil
		})
	elseif PromptState == PromptStateModule.EnablePurchaseVPCModal then
		return Roact.createElement(Animator, {
			shouldAnimate = true,
			shouldShow = PromptState == PromptStateModule.EnablePurchaseVPCModal,
			renderChildren = function() --[[ Line: 1144 ]]
				-- upvalues: Roact (upval), VerifiedParentalConsentDialog (upval), p1 (copy), PromptState (copy)
				return Roact.createElement(VerifiedParentalConsentDialog, {
					isActionable = false,
					screenSize = p1.state.screenSize,
					modalType = p1.getVPCModalType(PromptState),
					onDismiss = function() --[[ Line: 1149 ]]
						-- upvalues: p1 (upval)
						p1.confirmButtonPressed()
					end
				})
			end
		})
	elseif PromptState == PromptStateModule.Error and (PurchaseError == PurchaseErrorModule.NotEnoughRobuxXbox and DesktopUpsellExperiment.shouldShowNewModal()) then
		return Roact.createElement(RobuxUpsellModalTooExpensiveFallback, {
			screenSize = p1.state.screenSize,
			product = {
				itemIcon = ProductInfo.imageUrl,
				itemName = ProductInfo.name,
				itemRobuxCost = p1.props.productPrice
			},
			balanceAmount = AccountInfo.balance,
			doneActivated = function() --[[ Line: 1170 ]]
				-- upvalues: p1 (copy)
				p1.cancelButtonPressed()
				p1.emitPurchaseFlowEvent("UserInput", "Cancel")
			end
		})
	else
		local HasLaunchAfterPurchaseRootPlaceId: boolean = FFlagEnableLaunchAfterPurchase and (PromptState == PromptStateModule.PurchaseComplete and p1.props.launchAfterPurchaseRootPlaceId ~= nil)
		
		return ReactModule.createElement(ProductPurchasePromptModule, {
			includeCancelButton = false,
			screenSize = p1.state.screenSize,
			promptState = PromptState,
			productInfo = ProductInfo,
			purchaseError = PurchaseError,
			economicRestrictionError = p1.props.economicRestrictionError or {},
			isGamepadEnabled = p1.props.isGamepadEnabled,
			cancelButtonPressed = p1.cancelButtonPressed,
			confirmButtonPressed = p1.confirmButtonPressed,
			isGenericChallengeResponse = IsGenericChallengeResponseModule,
			useUnifiedPurchaseCompletionModal = p1.props.isUserEligibleForUnifiedPurchaseFlow,
			isMultiItem = GetUnifiedPurchaseModalTypeModule(p1.props.requestType) == UnifiedPurchaseModalTypeEnum.MultiItem,
			timedOptionDays = if FFlagPurchasePromptSubtitleForTimedOptions then p1.props.timedOptionDays else nil,
			completionMessage = if FFlagPurchaseModalTimedOptionExtension then p1.props.completionMessage else nil,
			launchAfterPurchaseButtonPressed = if HasLaunchAfterPurchaseRootPlaceId then p1.launchAfterPurchaseButtonPressed else nil,
			launchAfterPurchaseButtonShown = if HasLaunchAfterPurchaseRootPlaceId then p1.launchAfterPurchaseButtonShown else nil,
			surface = if FFlagAddSurfaceAndProductTypeToPromptCounterModule then p1.props.purchaseAnalyticsMetadata and p1.props.purchaseAnalyticsMetadata.surface else nil,
			productType = if FFlagAddSurfaceAndProductTypeToPromptCounterModule then p1.props.purchaseAnalyticsMetadata and p1.props.purchaseAnalyticsMetadata.productType else nil
		})
	end
end

function ExtendResult.render(p1) --[[ Line: 1220 ]]
	-- upvalues: FFlagSetMenuOnPurchasePromptModule (copy), GuiService (copy), Roact (copy), AnimatorModule (copy), WindowStateModule (copy), RequestTypeModule (copy), PromptStateModule (copy), PublishAssetAnalyticsModule (copy), ExternalEventConnectionModule (copy), CoreGui (copy)
	local PromptState = p1.props.promptState
	local DeterminePromptResult = p1:determinePrompt()
	
	if FFlagSetMenuOnPurchasePromptModule then
		if DeterminePromptResult ~= nil then
			p1.menuOpenedBySelf = true
		end
		GuiService:SetMenuIsOpen(DeterminePromptResult ~= nil, "ProductPurchaseContainer")
	end
	return Roact.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		[Roact.Change.AbsoluteSize] = p1.changeScreenSize,
		BackgroundTransparency = 1
	}, {
		Animator = Roact.createElement(AnimatorModule, {
			shouldShow = p1.props.windowState == WindowStateModule.Shown,
			onShown = function() --[[ Line: 1238 ]]
				-- upvalues: p1 (copy), RequestTypeModule (upval), PromptState (copy), PromptStateModule (upval), PublishAssetAnalyticsModule (upval)
				if p1.props.requestType == RequestTypeModule.AvatarCreationFee and PromptState == PromptStateModule.PromptPurchase then
					PublishAssetAnalyticsModule.sendPageLoad(PublishAssetAnalyticsModule.Section.BuyItemModal)
				end
				p1:setState({ isAnimating = false, doneAnimatingTime = os.clock() })
			end,
			onHidden = function() --[[ Line: 1250 ]]
				-- upvalues: p1 (copy)
				p1:setState({ isAnimating = nil, doneAnimatingTime = nil })
			end,
			skipAnimation = p1.props.isUserEligibleForUnifiedPurchaseFlow,
			[Roact.Ref] = p1.animatorRef
		}, {
			Prompt = DeterminePromptResult,
			ModalFix = if DeterminePromptResult == nil then nil else Roact.createElement("ImageButton", {
				BackgroundTransparency = 0,
				Modal = true,
				Size = UDim2.new(0, 0, 0, 0)
			}) or nil
		}),
		OnCoreGuiMenuOpened = Roact.createElement(ExternalEventConnectionModule, {
			event = GuiService.MenuOpened,
			callback = function() --[[ Line: 1269 ]]
				-- upvalues: FFlagSetMenuOnPurchasePromptModule (upval), p1 (copy)
				if FFlagSetMenuOnPurchasePromptModule and p1.menuOpenedBySelf then
					p1.menuOpenedBySelf = false
					
					return
				end
				if p1.props.hideWindow then
					p1.props.hideWindow()
				end
			end
		}),
		OnUserGuiRenderingChanged = Roact.createElement(ExternalEventConnectionModule, {
			event = CoreGui.UserGuiRenderingChanged,
			callback = function(p2, p3) --[[ Line: 1281 ]]
				-- upvalues: p1 (copy)
				if not p2 or not p3 then
					p1.props.hideWindow()
				end
			end
		})
	})
end

return (ConnectToStoreModule(function(p1) --[[ Line: 1291 | Named "mapStateToProps" ]]
	-- upvalues: IsMockingPurchasesModule (copy), SelectedRobuxPackageModule (copy), SelectProductPriceModule (copy), SelectPriceModule (copy), FFlagPurchasePromptSubtitleForTimedOptions (copy), FFlagPurchaseModalTimedOptionExtension (copy), FFlagEnableLaunchAfterPurchase (copy), FFlagBlackbirdUpsellGateResaleAndTimedOptionModule (copy), FFlagSkipBuyDelayForExperienceShopModule (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), SelectCartPricingResponseModule (copy), SelectIsCartPricingFetchingModule (copy)
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
		robuxPurchaseAmount = SelectedRobuxPackageModule.getRobuxPurchaseAmount(p1),
		robuxAmountBeforeBonus = SelectedRobuxPackageModule.getRobuxAmountBeforeBonus(p1),
		robuxPurchaseCost = SelectedRobuxPackageModule.getPrice(p1),
		isTestPurchase = IsMockingPurchasesModule(p1.promptRequest.requestType),
		isGamepadEnabled = p1.gamepadEnabled,
		desktopUpsellExpVariant = if p1.abVariations then p1.abVariations.DesktopUpsellExpVariant else nil,
		postPurchaseActions = p1.postPurchaseActions,
		purchaseCallbacks = p1.purchaseCallbacks,
		isUserEligibleForUnifiedPurchaseFlow = p1.isUserEligibleForUnifiedPurchaseFlow,
		purchaseAnalyticsMetadata = p1.purchaseAnalyticsMetadata,
		productPrice = SelectProductPriceModule(p1),
		price = if SelectPriceModule then SelectPriceModule(p1) else nil,
		timedOptionDays = if FFlagPurchasePromptSubtitleForTimedOptions and p1.productPayload then p1.productPayload.timedOptionDays else nil,
		completionMessage = if FFlagPurchaseModalTimedOptionExtension and p1.purchaseOptions then p1.purchaseOptions.completionMessage else nil,
		launchAfterPurchaseRootPlaceId = if FFlagEnableLaunchAfterPurchase and p1.purchaseOptions and p1.purchaseOptions.launchAfterPurchaseRootPlaceId ~= nil and p1.purchaseOptions.launchAfterPurchaseRootPlaceId ~= "" then p1.purchaseOptions.launchAfterPurchaseRootPlaceId else nil,
		robloxSubscriptionProducts = p1.robloxSubscriptionProducts,
		productPayload = if FFlagBlackbirdUpsellGateResaleAndTimedOptionModule or FFlagSkipBuyDelayForExperienceShopModule then p1.productPayload else nil,
		cartPricingResponse = if FFlagPurchasePromptCartPricingEnabledModule then SelectCartPricingResponseModule(p1) else nil,
		isCartPricingLoading = if FFlagPurchasePromptCartPricingEnabledModule then SelectIsCartPricingFetchingModule(p1) else nil
	}
end, function(Callback) --[[ Line: 1343 | Named "mapDispatchToProps" ]]
	-- upvalues: SetPurchaseFlowUUIDModule (copy), PurchaseItemModule (copy), CompletePurchaseModule (copy), LaunchRobuxUpsellModule (copy), OpenSecuritySettingsModule (copy), InitiateUserPurchaseSettingsPrecheckModule (copy), HideWindowModule (copy), RetryPurchaseAfterUpsellModule (copy), SetWindowStateModule (copy), FFlagAddCursorProviderToPurchasePromptApp (copy), GuiService (copy), CompleteRequestModule (copy), SendEventModule (copy), SetPostPurchaseActionsModule (copy), SetPromptStateModule (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), FetchCartPricingModule (copy), FFlagEnableInExperienceOffersPurchaseFlow (copy), FetchInGameItemCartPricingModule (copy)
	return {
		setPurchaseFlowUUID = function(p1) --[[ Line: 1345 ]]
			-- upvalues: Callback (copy), SetPurchaseFlowUUIDModule (upval)
			Callback(SetPurchaseFlowUUIDModule(p1))
		end,
		onBuy = function() --[[ Line: 1348 ]]
			-- upvalues: Callback (copy), PurchaseItemModule (upval)
			Callback(PurchaseItemModule())
		end,
		completePurchase = function() --[[ Line: 1351 ]]
			-- upvalues: Callback (copy), CompletePurchaseModule (upval)
			Callback(CompletePurchaseModule())
		end,
		onScaryModalConfirm = function() --[[ Line: 1354 ]]
			-- upvalues: Callback (copy), LaunchRobuxUpsellModule (upval)
			Callback(LaunchRobuxUpsellModule())
		end,
		onOpenSecuritySettings = function(p1) --[[ Line: 1357 ]]
			-- upvalues: Callback (copy), OpenSecuritySettingsModule (upval)
			if p1 then
				Callback(OpenSecuritySettingsModule(p1))
				
				return
			else
				Callback(OpenSecuritySettingsModule())
			end
		end,
		onRobuxUpsell = function() --[[ Line: 1364 ]]
			-- upvalues: Callback (copy), InitiateUserPurchaseSettingsPrecheckModule (upval)
			Callback(InitiateUserPurchaseSettingsPrecheckModule())
		end,
		hideWindow = function() --[[ Line: 1367 ]]
			-- upvalues: Callback (copy), HideWindowModule (upval)
			Callback(HideWindowModule())
		end,
		retryPurchaseAfterUpsell = function() --[[ Line: 1370 ]]
			-- upvalues: Callback (copy), RetryPurchaseAfterUpsellModule (upval)
			Callback(RetryPurchaseAfterUpsellModule())
		end,
		setWindowState = function(p1) --[[ Line: 1373 ]]
			-- upvalues: Callback (copy), SetWindowStateModule (upval)
			Callback(SetWindowStateModule(p1))
		end,
		completeRequest = function() --[[ Line: 1376 ]]
			-- upvalues: FFlagAddCursorProviderToPurchasePromptApp (upval), GuiService (upval), Callback (copy), CompleteRequestModule (upval)
			if FFlagAddCursorProviderToPurchasePromptApp then
				GuiService.SelectedCoreObject = nil
			end
			Callback(CompleteRequestModule())
		end,
		onAnalyticEvent = function(p1, p2) --[[ Line: 1382 ]]
			-- upvalues: Callback (copy), SendEventModule (upval)
			Callback(SendEventModule(p1, p2))
		end,
		setPostPurchaseActions = function(p1) --[[ Line: 1385 ]]
			-- upvalues: Callback (copy), SetPostPurchaseActionsModule (upval)
			Callback(SetPostPurchaseActionsModule(p1))
		end,
		setPromptState = function(p1) --[[ Line: 1388 ]]
			-- upvalues: Callback (copy), SetPromptStateModule (upval)
			Callback(SetPromptStateModule(p1))
		end,
		fetchCartPricing = if FFlagPurchasePromptCartPricingEnabledModule then function(p1) --[[ Line: 1392 ]]
			-- upvalues: Callback (copy), FetchCartPricingModule (upval)
			Callback(FetchCartPricingModule(p1))
		end else nil,
		fetchInGameItemCartPricing = if FFlagEnableInExperienceOffersPurchaseFlow then function(p1) --[[ Line: 1397 ]]
			-- upvalues: Callback (copy), FetchInGameItemCartPricingModule (upval)
			Callback(FetchInGameItemCartPricingModule(p1))
		end else nil
	}
end)(ExtendResult))