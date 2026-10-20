local HttpService = game:GetService("HttpService")
local ContextActionService = game:GetService("ContextActionService")
local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local RobuxUpsellFlowStateModule = require(Parent.RobuxUpsellFlowState)
local _ = require(Parent1.Enums.VirtualItemBadgeType)
local AnimatorModule = require(Parent1.Generic.Animator)
local ConstantsModule = require(Parent1.Generic.Constants)
local LoadingOverlayModule = require(Parent1.Generic.LoadingOverlay)
local LoadingOverlayStateModule = require(Parent1.Generic.LoadingOverlayState)
local PurchaseErrorPromptModule = require(Parent1.Generic.PurchaseErrorPrompt)
local PurchaseErrorTypeModule = require(Parent1.Enums.PurchaseErrorType)
local U13ConfirmPromptModule = require(Parent1.Generic.U13ConfirmPrompt)
local TwoStepReqPromptModule = require(Parent1.Generic.TwoStepReqPrompt)
local InsufficientRobuxPromptModule = require(Parent1.Generic.InsufficientRobuxPrompt)
local InsufficientRobuxProductPromptModule = require(Parent1.ProductPurchaseRobuxUpsell.InsufficientRobuxProductPrompt)
local LeaveRobloxPromptModule = require(Parent1.Generic.LeaveRobloxPrompt)
local RobuxUpsellSuccessPromptModule = require(Parent1.ProductPurchaseRobuxUpsell.RobuxUpsellSuccessPrompt)
local RobuxUpsellPromptModule = require(Parent1.ProductPurchaseRobuxUpsell.RobuxUpsellPrompt)
local RobuxUpsellModalModule = require(Parent1.ProductPurchaseRobuxUpsell.v2.RobuxUpsellModal)
local RobuxUpsellModalMultiplePackageModule = require(Parent1.ProductPurchaseRobuxUpsell.v2.RobuxUpsellModalMultiplePackage)
local RobuxUpsellModalTooExpensiveModule = require(Parent1.ProductPurchaseRobuxUpsell.v2.RobuxUpsellModalTooExpensive)
local RobuxUpsellModalTooExpensiveFallbackModule = require(Parent1.ProductPurchaseRobuxUpsell.v2.RobuxUpsellModalTooExpensiveFallback)
local UnifiedRobuxUpsellModalModule = require(Parent1.ProductPurchaseRobuxUpsell.v3.UnifiedRobuxUpsellModal)
local UnifiedRobuxUpsellModalTooExpensiveModule = require(Parent1.ProductPurchaseRobuxUpsell.v3.UnifiedRobuxUpsellModalTooExpensive)
local PurchasePromptLiteModule = require(Parent2.PurchasePromptLite)
local GetTTIEventNameFunction = PurchasePromptLiteModule.getTTIEventName
local TimeToInteractiveTracker = require(Parent2.TimeToInteractiveTracker).TimeToInteractiveTracker
local ProductPurchaseSurface = PurchasePromptLiteModule.Enums.ProductPurchaseSurface
local GetModalShownEventDataModule = require(Parent1.Utility.getModalShownEventData)
local GetUserInputEventDataModule = require(Parent1.Utility.getUserInputEventData)
local ShouldShowNewUpsellModalExperimentModule = require(Parent1.Utility.Experiments.shouldShowNewUpsellModalExperiment)
local OverlayInGameMenuModule = require(Parent1.Utility.overlayInGameMenu)
local DesktopUpsellExperimentModule = require(Parent1.Utility.Experiments.DesktopUpsellExperiment)
local GetEnableCentralOverlayForUpsellPromptModule = require(Parent1.Flags.getEnableCentralOverlayForUpsellPrompt)
local GetAppContextModule = require(Parent1.Utility.getAppContext)
local FFlagMobilePopularItemBadgingExperimentEnabledModule = require(Parent1.Flags.FFlagMobilePopularItemBadgingExperimentEnabled)
local UnifiedPurchaseCompletionModalV2Module = require(Parent1.Generic.UnifiedPurchaseCompletionModalV2)
local ExtendResult = RoactModule.Component:extend(script.Name)
local Default = require(Parent2.LoggingProtocol).default
local InGameRobuxUpsellEventModule = require(Parent.Events.InGameRobuxUpsellEvent)
local Players = game:GetService("Players")
local IntervalPerformanceTracker = require(Parent2.IntervalPerformanceTracker).IntervalPerformanceTracker
local VerifiedParentalConsentDialog = require(Parent2.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog
local UnifiedRobuxUpsellModalV2Module = require(Parent1.ProductPurchaseRobuxUpsell.v4.UnifiedRobuxUpsellModalV2)
local UnifiedRobuxUpsellModalTooExpensiveV2Module = require(Parent1.ProductPurchaseRobuxUpsell.v4.UnifiedRobuxUpsellModalTooExpensiveV2)
local _ = require(Parent1.ProductPurchase.v4.cartPricingResponseLineItem)
local UnifiedPurchaseModalTypeEnumModule = require(Parent1.Enums.UnifiedPurchaseModalTypeEnum)
local UnifiedPurchaseCompletionModalModule = require(Parent1.Generic.UnifiedPurchaseCompletionModal)
local FFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(Parent2.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local FFlagLuaAppsEnablePromptVIPServerPurchase = require(Parent2.SharedFlags).FFlagLuaAppsEnablePromptVIPServerPurchase
local FFlagAddPerformanceMetricsToUnifiedPurchaseModal = require(Parent2.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal
local FIntLegacyPurchaseFPSTrackingTimeout = require(Parent2.SharedFlags).FIntLegacyPurchaseFPSTrackingTimeout
local FIntTTIUnifiedPurchaseSamplingRate = require(Parent2.SharedFlags).FIntTTIUnifiedPurchaseSamplingRate
local FFlagAddCenterDialogForUnifiedPurchaseModal = require(Parent2.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal
game:DefineFastFlag("DisableNonSchematizedInGameRobuxUpsellEvent", false)
local FixUnifiedUpsellCompletionModal = game:DefineFastFlag("FixUnifiedUpsellCompletionModal", false)
local _ = require(Parent1.ProductPurchase.PricingTypes)
local _ = require(Parent1.ProductPurchase.v3.UnifiedProductPurchaseModalTypes)
local _ = require(Parent1.Api.PaymentsGateway.GetUpsellSuggestionsTypes)

function ExtendResult.init(p1) --[[ Line: 181 ]]
	-- upvalues: HttpService (copy)
	local Props = p1.props
	p1.state = {
		enableInputDelayed = false,
		analyticId = if Props.analyticId then Props.analyticId else HttpService:GenerateGUID(false),
		isDelayedInput = Props.isDelayedInput
	}
	
	function p1.closeModal() --[[ Line: 191 ]]
		-- upvalues: p1 (copy)
		local Props = p1.props
		p1:reportUserInput("Cancel")
		Props.cancelPurchase()
		p1:closeCentralOverlay()
		p1:UnbindActions()
	end
end

function ExtendResult.didMount(p1) --[[ Line: 201 ]]
	-- upvalues: FFlagAddPerformanceMetricsToUnifiedPurchaseModal (copy), IntervalPerformanceTracker (copy), FIntLegacyPurchaseFPSTrackingTimeout (copy), GetTTIEventNameFunction (copy), ProductPurchaseSurface (copy), TimeToInteractiveTracker (copy), FIntTTIUnifiedPurchaseSamplingRate (copy)
	if FFlagAddPerformanceMetricsToUnifiedPurchaseModal and (p1.props or {}).eventPrefix == "UACatalog" then
		IntervalPerformanceTracker:startTracking("PurchaseModal_RobuxUpsellModalShown_Catalog", FIntLegacyPurchaseFPSTrackingTimeout, nil, true, true)
		IntervalPerformanceTracker:startTracking("PurchaseModal_LegacyFlowRobuxUpsellModalShown_Catalog", FIntLegacyPurchaseFPSTrackingTimeout, nil, true, true)
		TimeToInteractiveTracker.trackEnd(GetTTIEventNameFunction(ProductPurchaseSurface.Catalog), {
			samplingRateOverride = FIntTTIUnifiedPurchaseSamplingRate
		})
	end
end

function ExtendResult.didUpdate(p1, p2, _) --[[ Line: 230 ]]
	local Props = p1.props
	
	if p2.purchaseState ~= Props.purchaseState then
		p1:reportModalShown()
		p1:dispatchCentralOverlayAndRenderModal(Props)
	end
end

function ExtendResult.UnbindActions(p1) --[[ Line: 239 ]]
	-- upvalues: GetEnableCentralOverlayForUpsellPromptModule (copy), ContextActionService (copy), ConstantsModule (copy)
	if GetEnableCentralOverlayForUpsellPromptModule() and p1.props.dispatchCentralOverlay then
		ContextActionService:UnbindAction(ConstantsModule.CLOSE_MODAL_ACTION)
	end
end

function ExtendResult.BindCancelAction(p1) --[[ Line: 245 ]]
	-- upvalues: GetEnableCentralOverlayForUpsellPromptModule (copy), ContextActionService (copy), ConstantsModule (copy)
	if GetEnableCentralOverlayForUpsellPromptModule() and p1.props.dispatchCentralOverlay then
		ContextActionService:BindAction(ConstantsModule.CLOSE_MODAL_ACTION, p1.closeModal, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
	end
end

function ExtendResult.closeCentralOverlay(p1) --[[ Line: 261 ]]
	-- upvalues: GetEnableCentralOverlayForUpsellPromptModule (copy)
	local Props = p1.props
	
	if GetEnableCentralOverlayForUpsellPromptModule() and Props.dispatchCentralOverlay then
		Props.dispatchCentralOverlay()
	end
end

function ExtendResult.constructRobuxUpsellPromptAnimatorObj(p1) --[[ Line: 269 ]]
	-- upvalues: RobuxUpsellFlowStateModule (copy), FFlagAddCenterDialogForUnifiedPurchaseModal (copy), GetAppContextModule (copy), RoactModule (copy), UnifiedRobuxUpsellModalV2Module (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), UnifiedRobuxUpsellModalModule (copy), FFlagLuaAppsEnablePromptVIPServerPurchase (copy), OverlayInGameMenuModule (copy), RobuxUpsellModalMultiplePackageModule (copy), ShouldShowNewUpsellModalExperimentModule (copy), DesktopUpsellExperimentModule (copy), RobuxUpsellModalModule (copy), RobuxUpsellPromptModule (copy), FFlagMobilePopularItemBadgingExperimentEnabledModule (copy)
	local Props = p1.props
	local State = p1.state
	p1:BindCancelAction()
	
	return {
		shouldAnimate = Props.shouldAnimate,
		shouldShow = Props.purchaseState == RobuxUpsellFlowStateModule.PurchaseModal,
		skipAnimation = Props.useUnifiedProductPurchaseModal,
		onShown = Props.isDelayedInput and function() --[[ Line: 281 ]]
			-- upvalues: p1 (copy), Props (copy)
			p1:setState({ enableInputDelayed = true })
			delay(3, function() --[[ Line: 285 ]]
				-- upvalues: p1 (upval), Props (upval)
				p1:setState({ isDelayedInput = false, enableInputDelayed = false })
				
				if Props.onDelayedInputComplete then
					Props.onDelayedInputComplete()
				end
			end)
		end or nil,
		onHidden = Props.isDelayedInput and function() --[[ Line: 295 ]]
			-- upvalues: p1 (copy), Props (copy)
			p1:setState({
				enableInputDelayed = false,
				isDelayedInput = Props.isDelayedInput
			})
		end or nil,
		renderChildren = function() --[[ Line: 301 ]]
			-- upvalues: Props (copy), FFlagAddCenterDialogForUnifiedPurchaseModal (upval), GetAppContextModule (upval), RoactModule (upval), UnifiedRobuxUpsellModalV2Module (upval), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (upval), p1 (copy), State (copy), UnifiedRobuxUpsellModalModule (upval), FFlagLuaAppsEnablePromptVIPServerPurchase (upval), OverlayInGameMenuModule (upval), RobuxUpsellModalMultiplePackageModule (upval), ShouldShowNewUpsellModalExperimentModule (upval), DesktopUpsellExperimentModule (upval), RobuxUpsellModalModule (upval), RobuxUpsellPromptModule (upval), FFlagMobilePopularItemBadgingExperimentEnabledModule (upval)
			return if Props.useUnifiedProductPurchaseModal then if FFlagAddCenterDialogForUnifiedPurchaseModal and GetAppContextModule() == "UA" then RoactModule.createElement(UnifiedRobuxUpsellModalV2Module, {
				product = {
					model = Props.model,
					itemIcon = Props.itemIcon,
					itemName = Props.itemName,
					itemRobuxCost = Props.itemRobuxCost,
					badgeType = Props.virtualItemBadgeType,
					itemPrice = Props.virtualItemPrice
				},
				userBalance = Props.beforeRobuxBalance,
				upsellSuggestions = Props.upsellSuggestions,
				selectedUpsellIndex = Props.selectedUpsellIndex,
				onUpsellSuggestionsSelected = Props.onUpsellSuggestionsSelected,
				purchaseModalType = Props.unifiedProductPurchaseModalType,
				onBuyItemButtonMounted = Props.onBuyItemButtonMounted,
				hideUserRobuxBalance = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then Props.hideUserRobuxBalance else nil,
				cartPricingResponse = Props.cartPricingResponse,
				collectibleItemId = Props.collectibleItemId,
				isCartPricingLoading = Props.isCartPricingLoading,
				onCartOfferAppliedChanged = Props.onCartOfferAppliedChanged,
				postPurchaseActions = Props.postPurchaseActions,
				setPostPurchaseActions = Props.setPostPurchaseActions,
				onRobloxPlusButtonActivated = Props.onRobloxPlusButtonActivated,
				robloxPlusDiscountPercentage = Props.robloxPlusDiscountPercentage,
				buttons = {
					buyItemActivated = function() --[[ Line: 331 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Buy")
						Props.purchaseRobux()
						p1:closeCentralOverlay()
					end,
					buyItemControllerIcon = Props.acceptControllerIcon,
					buyItemisDelayedInput = State.isDelayedInput,
					buyItemEnableInputDelayed = State.enableInputDelayed and GetAppContextModule() == "IN_EXPERIENCE",
					cancelPurchaseActivated = function() --[[ Line: 339 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Cancel")
						Props.cancelPurchase()
						p1:closeCentralOverlay()
					end,
					cancelControllerIcon = Props.cancelControllerIcon
				},
				termsOfUseActivated = Props.showTermsOfUse and function() --[[ Line: 346 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("TermsOfService")
					Props.showTermsOfUse()
					Props.flowComplete()
				end or nil,
				screenSize = Props.screenSize
			}) else RoactModule.createElement(UnifiedRobuxUpsellModalModule, {
				product = {
					model = Props.model,
					itemIcon = Props.itemIcon,
					itemName = Props.itemName,
					itemRobuxCost = Props.itemRobuxCost,
					badgeType = Props.virtualItemBadgeType,
					itemPrice = Props.virtualItemPrice
				},
				userBalance = Props.beforeRobuxBalance,
				upsellSuggestions = Props.upsellSuggestions,
				selectedUpsellIndex = Props.selectedUpsellIndex,
				onUpsellSuggestionsSelected = Props.onUpsellSuggestionsSelected,
				purchaseModalType = Props.unifiedProductPurchaseModalType,
				onBuyItemButtonMounted = Props.onBuyItemButtonMounted,
				hideUserRobuxBalance = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then Props.hideUserRobuxBalance else nil,
				cartPricingResponse = Props.cartPricingResponse,
				isCartPricingLoading = Props.isCartPricingLoading,
				onCartOfferAppliedChanged = Props.onCartOfferAppliedChanged,
				onRobloxPlusButtonActivated = Props.onRobloxPlusButtonActivated,
				robloxPlusDiscountPercentage = Props.robloxPlusDiscountPercentage,
				isMonthlyPrice = if FFlagLuaAppsEnablePromptVIPServerPurchase then Props.isMonthlyPrice else nil,
				buttons = {
					buyItemActivated = function() --[[ Line: 379 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Buy")
						Props.purchaseRobux()
						p1:closeCentralOverlay()
					end,
					buyItemControllerIcon = Props.acceptControllerIcon,
					buyItemisDelayedInput = State.isDelayedInput,
					buyItemEnableInputDelayed = State.enableInputDelayed and GetAppContextModule() == "IN_EXPERIENCE",
					cancelPurchaseActivated = function() --[[ Line: 389 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Cancel")
						Props.cancelPurchase()
						p1:closeCentralOverlay()
					end,
					cancelControllerIcon = Props.cancelControllerIcon
				},
				termsOfUseActivated = Props.showTermsOfUse and function() --[[ Line: 396 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("TermsOfService")
					Props.showTermsOfUse()
					Props.flowComplete()
				end or nil,
				screenSize = Props.screenSize
			}) elseif Props.useUpsellSuggestions then OverlayInGameMenuModule(RoactModule.createElement(RobuxUpsellModalMultiplePackageModule, {
				product = {
					model = Props.model,
					itemIcon = Props.itemIcon,
					itemName = Props.itemName,
					itemRobuxCost = Props.itemRobuxCost,
					badgeType = Props.virtualItemBadgeType
				},
				userBalance = Props.beforeRobuxBalance,
				upsellSuggestions = Props.upsellSuggestions,
				selectedUpsellIndex = Props.selectedUpsellIndex,
				onUpsellSuggestionsSelected = Props.onUpsellSuggestionsSelected,
				buttons = {
					buyItemActivated = function() --[[ Line: 418 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Buy")
						Props.purchaseRobux()
						p1:closeCentralOverlay()
					end,
					buyItemControllerIcon = Props.acceptControllerIcon,
					buyItemisDelayedInput = State.isDelayedInput,
					buyItemEnableInputDelayed = State.enableInputDelayed,
					cancelPurchaseActivated = function() --[[ Line: 428 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Cancel")
						Props.cancelPurchase()
						p1:closeCentralOverlay()
					end,
					cancelControllerIcon = Props.cancelControllerIcon
				},
				isQuest = Props.isQuest,
				isVng = Props.isVng,
				screenSize = Props.screenSize
			})) elseif ShouldShowNewUpsellModalExperimentModule() or DesktopUpsellExperimentModule.shouldShowNewModal() then OverlayInGameMenuModule(RoactModule.createElement(RobuxUpsellModalModule, {
				product = {
					model = Props.model,
					itemIcon = Props.itemIcon,
					itemName = Props.itemName,
					itemRobuxCost = Props.itemRobuxCost,
					badgeType = Props.virtualItemBadgeType
				},
				upsell = {
					balanceAmount = Props.beforeRobuxBalance,
					robuxPurchaseAmount = Props.iapRobuxAmount,
					robuxPurchaseCost = Props.iapCostStr,
					robuxPurchaseAmountBeforeBonus = Props.iapRobuxAmountBeforeBonus
				},
				buttons = {
					buyItemActivated = function() --[[ Line: 456 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Buy")
						Props.purchaseRobux()
						p1:closeCentralOverlay()
					end,
					buyItemControllerIcon = Props.acceptControllerIcon,
					buyItemisDelayedInput = State.isDelayedInput,
					buyItemEnableInputDelayed = State.enableInputDelayed,
					cancelPurchaseActivated = function() --[[ Line: 466 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Cancel")
						Props.cancelPurchase()
						p1:closeCentralOverlay()
					end,
					cancelControllerIcon = Props.cancelControllerIcon,
					opensBuyRobuxPage = DesktopUpsellExperimentModule.getVariant() == DesktopUpsellExperimentModule.variants.OpenRobuxStore
				},
				isQuest = Props.isQuest,
				isVng = Props.isVng,
				termsOfUseActivated = Props.showTermsOfUse and function() --[[ Line: 477 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("TermsOfService")
					Props.showTermsOfUse()
				end or nil,
				screenSize = Props.screenSize
			})) else RoactModule.createElement(RobuxUpsellPromptModule, {
				screenSize = Props.screenSize,
				isDelayedInput = State.isDelayedInput,
				enableInputDelayed = State.enableInputDelayed,
				model = Props.model,
				itemIcon = Props.itemIcon,
				itemName = Props.itemName,
				itemRobuxCost = Props.itemRobuxCost,
				robuxPurchaseAmount = Props.iapRobuxAmount,
				robuxPurchaseAmountBeforeBonus = Props.iapRobuxAmountBeforeBonus,
				balanceAmount = Props.beforeRobuxBalance,
				buyItemControllerIcon = Props.acceptControllerIcon,
				cancelControllerIcon = Props.cancelControllerIcon,
				itemProductId = FFlagMobilePopularItemBadgingExperimentEnabledModule and tostring(Props.itemProductId) or nil,
				buyItemActivated = function() --[[ Line: 501 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("Buy")
					Props.purchaseRobux()
					p1:closeCentralOverlay()
				end,
				cancelPurchaseActivated = function() --[[ Line: 506 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("Cancel")
					Props.cancelPurchase()
					p1:closeCentralOverlay()
				end,
				termsOfUseActivated = Props.showTermsOfUse and function() --[[ Line: 511 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("TermsOfService")
					Props.showTermsOfUse()
				end or nil,
				isQuest = p1.props.isQuest,
				isVng = p1.props.isVng
			})
		end
	}
end

function ExtendResult.constructU13ConfirmPromptAnimatorObj(p1) --[[ Line: 522 ]]
	-- upvalues: RobuxUpsellFlowStateModule (copy), RoactModule (copy), U13ConfirmPromptModule (copy)
	local Props = p1.props
	p1:BindCancelAction()
	
	return {
		shouldAnimate = Props.shouldAnimate,
		shouldShow = Props.purchaseState == RobuxUpsellFlowStateModule.PurchaseWarning,
		renderChildren = function() --[[ Line: 530 ]]
			-- upvalues: RoactModule (upval), U13ConfirmPromptModule (upval), Props (copy), p1 (copy)
			return RoactModule.createElement(U13ConfirmPromptModule, {
				screenSize = Props.screenSize,
				modalType = Props.u13ConfirmType,
				doneControllerIcon = Props.acceptControllerIcon,
				cancelControllerIcon = Props.cancelControllerIcon,
				doneActivated = function() --[[ Line: 539 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("Confirm")
					Props.acceptPurchaseWarning()
					p1:closeCentralOverlay()
				end,
				cancelActivated = function() --[[ Line: 544 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("Cancel")
					Props.cancelPurchase()
					p1:closeCentralOverlay()
				end
			})
		end
	}
end

function ExtendResult.constructPurchaseErrorPromptAnimatorObj(p1) --[[ Line: 554 ]]
	-- upvalues: RobuxUpsellFlowStateModule (copy), PurchaseErrorTypeModule (copy), FFlagAddCenterDialogForUnifiedPurchaseModal (copy), RoactModule (copy), UnifiedRobuxUpsellModalTooExpensiveV2Module (copy), UnifiedRobuxUpsellModalTooExpensiveModule (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), ShouldShowNewUpsellModalExperimentModule (copy), DesktopUpsellExperimentModule (copy), RobuxUpsellModalTooExpensiveFallbackModule (copy), PurchaseErrorPromptModule (copy)
	local Props = p1.props
	p1:BindCancelAction()
	
	return {
		shouldAnimate = Props.shouldAnimate,
		shouldShow = Props.purchaseState == RobuxUpsellFlowStateModule.Error,
		renderChildren = function() --[[ Line: 562 ]]
			-- upvalues: Props (copy), PurchaseErrorTypeModule (upval), FFlagAddCenterDialogForUnifiedPurchaseModal (upval), RoactModule (upval), UnifiedRobuxUpsellModalTooExpensiveV2Module (upval), p1 (copy), UnifiedRobuxUpsellModalTooExpensiveModule (upval), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (upval), ShouldShowNewUpsellModalExperimentModule (upval), DesktopUpsellExperimentModule (upval), RobuxUpsellModalTooExpensiveFallbackModule (upval), PurchaseErrorPromptModule (upval)
			return if Props.errorType == PurchaseErrorTypeModule.NotEnoughRobuxInApp then if FFlagAddCenterDialogForUnifiedPurchaseModal then RoactModule.createElement(UnifiedRobuxUpsellModalTooExpensiveV2Module, {
				product = {
					model = Props.model,
					itemIcon = Props.itemIcon,
					itemName = Props.itemName,
					itemRobuxCost = Props.itemRobuxCost
				},
				balanceAmount = Props.beforeRobuxBalance,
				buttons = {
					buyItemActivated = function() --[[ Line: 576 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Buy Robux")
						Props.openBuyRobux()
						Props.flowComplete()
						p1:closeCentralOverlay()
					end,
					cancelPurchaseActivated = function() --[[ Line: 582 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Cancel")
						Props.flowComplete()
						p1:closeCentralOverlay()
					end
				},
				purchaseModalType = Props.unifiedProductPurchaseModalType,
				screenSize = Props.screenSize
			}) else RoactModule.createElement(UnifiedRobuxUpsellModalTooExpensiveModule, {
				product = {
					model = Props.model,
					itemIcon = Props.itemIcon,
					itemName = Props.itemName,
					itemRobuxCost = Props.itemRobuxCost
				},
				balanceAmount = Props.beforeRobuxBalance,
				hideUserRobuxBalance = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then Props.hideUserRobuxBalance else nil,
				buttons = {
					buyItemActivated = function() --[[ Line: 607 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Buy Robux")
						Props.openBuyRobux()
						Props.flowComplete()
						p1:closeCentralOverlay()
					end,
					cancelPurchaseActivated = function() --[[ Line: 614 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Cancel")
						Props.flowComplete()
						p1:closeCentralOverlay()
					end
				},
				isQuest = Props.isQuest,
				screenSize = Props.screenSize,
				purchaseModalType = Props.unifiedProductPurchaseModalType
			}) elseif Props.errorType == PurchaseErrorTypeModule.NotEnoughRobux and (ShouldShowNewUpsellModalExperimentModule() or DesktopUpsellExperimentModule.shouldShowNewModal()) then RoactModule.createElement(RobuxUpsellModalTooExpensiveFallbackModule, {
				product = {
					model = Props.model,
					itemIcon = Props.itemIcon,
					itemName = Props.itemName,
					itemRobuxCost = Props.itemRobuxCost
				},
				balanceAmount = Props.beforeRobuxBalance,
				doneActivated = function() --[[ Line: 639 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("Done")
					Props.flowComplete()
					p1:closeCentralOverlay()
				end,
				doneControllerIcon = Props.acceptControllerIcon,
				isQuest = Props.isQuest,
				screenSize = Props.screenSize
			}) else RoactModule.createElement(PurchaseErrorPromptModule, {
				screenSize = Props.screenSize,
				errorType = Props.errorType,
				economicRestrictionError = Props.economicRestrictionError,
				doneControllerIcon = Props.acceptControllerIcon,
				doneActivated = function() --[[ Line: 657 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("Done")
					Props.flowComplete()
					p1:closeCentralOverlay()
				end
			})
		end
	}
end

function ExtendResult.constructTwoStepRequiredAnimatorObj(p1) --[[ Line: 667 ]]
	-- upvalues: RobuxUpsellFlowStateModule (copy), RoactModule (copy), TwoStepReqPromptModule (copy)
	local Props = p1.props
	p1:BindCancelAction()
	
	return {
		shouldAnimate = Props.shouldAnimate,
		shouldShow = Props.purchaseState == RobuxUpsellFlowStateModule.TwoStepRequired,
		renderChildren = function() --[[ Line: 675 ]]
			-- upvalues: RoactModule (upval), TwoStepReqPromptModule (upval), Props (copy), p1 (copy)
			return RoactModule.createElement(TwoStepReqPromptModule, {
				screenSize = Props.screenSize,
				doneControllerIcon = Props.acceptControllerIcon,
				openSecuritySettings = function() --[[ Line: 681 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("GoToSecuritySettings")
					Props.openSecuritySettings()
					Props.flowComplete()
					p1:closeCentralOverlay()
				end,
				closePrompt = function() --[[ Line: 687 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("Cancel")
					Props.flowComplete()
					p1:closeCentralOverlay()
				end
			})
		end
	}
end

function ExtendResult.constructRobuxUpsellSuccessPromptAnimatorObj(p1) --[[ Line: 697 ]]
	-- upvalues: RobuxUpsellFlowStateModule (copy), FixUnifiedUpsellCompletionModal (copy), GetAppContextModule (copy), RoactModule (copy), UnifiedPurchaseCompletionModalV2Module (copy), UnifiedPurchaseModalTypeEnumModule (copy), UnifiedPurchaseCompletionModalModule (copy), RobuxUpsellSuccessPromptModule (copy)
	local Props = p1.props
	p1:BindCancelAction()
	
	return {
		shouldAnimate = Props.shouldAnimate,
		shouldShow = Props.purchaseState == RobuxUpsellFlowStateModule.Success,
		renderChildren = function() --[[ Line: 705 ]]
			-- upvalues: Props (copy), FixUnifiedUpsellCompletionModal (upval), GetAppContextModule (upval), RoactModule (upval), UnifiedPurchaseCompletionModalV2Module (upval), p1 (copy), UnifiedPurchaseModalTypeEnumModule (upval), UnifiedPurchaseCompletionModalModule (upval), RobuxUpsellSuccessPromptModule (upval)
			local BeforeRobuxBalanceDelta = Props.beforeRobuxBalance - Props.itemRobuxCost
			local NewBeforeRobuxBalanceDelta = if BeforeRobuxBalanceDelta < 0 then BeforeRobuxBalanceDelta + Props.iapRobuxAmount else BeforeRobuxBalanceDelta
			
			return if Props.useUnifiedProductPurchaseModal then if FixUnifiedUpsellCompletionModal and GetAppContextModule() == "UA" then RoactModule.createElement(UnifiedPurchaseCompletionModalV2Module, {
				buttons = {
					onActivated = function() --[[ Line: 716 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Done")
						Props.flowComplete()
						p1:closeCentralOverlay()
					end
				},
				isMultiItem = Props.unifiedProductPurchaseModalType == UnifiedPurchaseModalTypeEnumModule.MultiItem,
				itemName = Props.itemName
			}) else RoactModule.createElement(UnifiedPurchaseCompletionModalModule, {
				buttons = {
					onActivated = function() --[[ Line: 728 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Done")
						Props.flowComplete()
						p1:closeCentralOverlay()
					end
				},
				isMultiItem = Props.unifiedProductPurchaseModalType == UnifiedPurchaseModalTypeEnumModule.MultiItem,
				itemName = Props.itemName
			}) else RoactModule.createElement(RobuxUpsellSuccessPromptModule, {
				screenSize = Props.screenSize,
				model = Props.model,
				itemIcon = Props.itemIcon,
				itemName = Props.itemName,
				balance = NewBeforeRobuxBalanceDelta,
				confirmControllerIcon = Props.acceptControllerIcon,
				cancelControllerIcon = Props.cancelControllerIcon,
				doneActivated = function() --[[ Line: 747 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("Done")
					Props.flowComplete()
					p1:closeCentralOverlay()
				end,
				equipActivated = Props.equipItem and function() --[[ Line: 752 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("Equip")
					Props.equipItem()
					p1:closeCentralOverlay()
				end or nil
			})
		end
	}
end

function ExtendResult.constructInsufficientRobuxAnimatorObj(p1) --[[ Line: 762 ]]
	-- upvalues: RobuxUpsellFlowStateModule (copy), ShouldShowNewUpsellModalExperimentModule (copy), DesktopUpsellExperimentModule (copy), RoactModule (copy), RobuxUpsellModalTooExpensiveModule (copy), InsufficientRobuxPromptModule (copy)
	local Props = p1.props
	p1:BindCancelAction()
	
	return {
		shouldAnimate = Props.shouldAnimate,
		shouldShow = Props.purchaseState == RobuxUpsellFlowStateModule.GenericPurchaseModal,
		renderChildren = function() --[[ Line: 770 ]]
			-- upvalues: ShouldShowNewUpsellModalExperimentModule (upval), DesktopUpsellExperimentModule (upval), RoactModule (upval), RobuxUpsellModalTooExpensiveModule (upval), Props (copy), p1 (copy), InsufficientRobuxPromptModule (upval)
			return if ShouldShowNewUpsellModalExperimentModule() or DesktopUpsellExperimentModule.shouldShowNewModal() then RoactModule.createElement(RobuxUpsellModalTooExpensiveModule, {
				product = {
					model = Props.model,
					itemIcon = Props.itemIcon,
					itemName = Props.itemName,
					itemRobuxCost = Props.itemRobuxCost
				},
				balanceAmount = Props.beforeRobuxBalance,
				buttons = {
					buyItemActivated = function() --[[ Line: 782 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Buy Robux")
						Props.openBuyRobux()
						Props.flowComplete()
						p1:closeCentralOverlay()
					end,
					buyItemControllerIcon = Props.acceptControllerIcon,
					cancelPurchaseActivated = function() --[[ Line: 790 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Cancel")
						Props.flowComplete()
						p1:closeCentralOverlay()
					end,
					cancelControllerIcon = Props.cancelControllerIcon
				},
				isQuest = Props.isQuest,
				screenSize = Props.screenSize
			}) else RoactModule.createElement(InsufficientRobuxPromptModule, {
				screenSize = Props.screenSize,
				robuxBalance = Props.beforeRobuxBalance,
				buyRobux = function() --[[ Line: 806 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("Buy Robux")
					Props.openBuyRobux()
					Props.flowComplete()
					p1:closeCentralOverlay()
				end,
				closePrompt = function() --[[ Line: 812 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("Cancel")
					Props.flowComplete()
					p1:closeCentralOverlay()
				end
			})
		end
	}
end

function ExtendResult.constructInsufficientRobuxProductAnimatorObj(p1) --[[ Line: 822 ]]
	-- upvalues: RobuxUpsellFlowStateModule (copy), RoactModule (copy), InsufficientRobuxProductPromptModule (copy)
	local Props = p1.props
	p1:BindCancelAction()
	
	return {
		shouldAnimate = Props.shouldAnimate,
		shouldShow = Props.purchaseState == RobuxUpsellFlowStateModule.LargeRobuxPurchaseModal,
		renderChildren = function() --[[ Line: 830 ]]
			-- upvalues: RoactModule (upval), InsufficientRobuxProductPromptModule (upval), Props (copy), p1 (copy)
			return RoactModule.createElement(InsufficientRobuxProductPromptModule, {
				screenSize = Props.screenSize,
				model = Props.model,
				itemIcon = Props.itemIcon,
				itemName = Props.itemName,
				itemRobuxCost = Props.itemRobuxCost,
				balanceAmount = Props.beforeRobuxBalance,
				acceptControllerIcon = Props.acceptControllerIcon,
				cancelControllerIcon = Props.cancelControllerIcon,
				robuxStoreActivated = function() --[[ Line: 843 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("Go to Robux store")
					Props.openBuyRobux()
					p1:closeCentralOverlay()
				end,
				cancelPurchaseActivated = function() --[[ Line: 848 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("Cancel")
					Props.flowComplete()
					p1:closeCentralOverlay()
				end
			})
		end
	}
end

function ExtendResult.constructLeaveRobloxPromptAnimatorObj(p1) --[[ Line: 858 ]]
	-- upvalues: RobuxUpsellFlowStateModule (copy), RoactModule (copy), LeaveRobloxPromptModule (copy)
	local Props = p1.props
	p1:BindCancelAction()
	
	return {
		shouldAnimate = Props.shouldAnimate,
		shouldShow = Props.purchaseState == RobuxUpsellFlowStateModule.LeaveRobloxWarning,
		renderChildren = function() --[[ Line: 866 ]]
			-- upvalues: RoactModule (upval), LeaveRobloxPromptModule (upval), Props (copy), p1 (copy)
			return RoactModule.createElement(LeaveRobloxPromptModule, {
				screenSize = Props.screenSize,
				cancelActivated = function() --[[ Line: 870 ]]
					-- upvalues: p1 (upval)
					p1:closeCentralOverlay()
				end,
				continueActivated = function() --[[ Line: 873 ]]
					-- upvalues: Props (upval)
					Props.openVngShop()
				end
			})
		end
	}
end

function ExtendResult.constructPurchaseVPCPromptAnimatorObj(p1) --[[ Line: 881 ]]
	-- upvalues: RobuxUpsellFlowStateModule (copy), RoactModule (copy), VerifiedParentalConsentDialog (copy)
	local Props = p1.props
	p1:BindCancelAction()
	
	return {
		shouldAnimate = Props.shouldAnimate,
		shouldShow = Props.purchaseState == RobuxUpsellFlowStateModule.PurchaseVPCModal,
		renderChildren = function() --[[ Line: 889 ]]
			-- upvalues: RoactModule (upval), VerifiedParentalConsentDialog (upval), Props (copy), p1 (copy)
			return RoactModule.createElement(VerifiedParentalConsentDialog, {
				screenSize = Props.screenSize,
				isActionable = Props.openSettingsPage ~= nil,
				modalType = Props.purchaseVPCType,
				onAction = Props.openSettingsPage and function() --[[ Line: 894 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("Confirm")
					Props.openSettingsPage()
					Props.flowComplete()
				end,
				onDismiss = function() --[[ Line: 899 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("Cancel")
					Props.cancelPurchase()
					p1:closeCentralOverlay()
				end
			})
		end
	}
end

function ExtendResult.dispatchCentralOverlayAndRenderModal(p1, Props) --[[ Line: 911 ]]
	-- upvalues: GetEnableCentralOverlayForUpsellPromptModule (copy), RobuxUpsellFlowStateModule (copy), ConstantsModule (copy)
	if not GetEnableCentralOverlayForUpsellPromptModule() or not Props.dispatchCentralOverlay then return end
	local PurchaseState = Props.purchaseState
	
	if PurchaseState == RobuxUpsellFlowStateModule.PurchaseModal then
		Props.dispatchCentralOverlay(ConstantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructRobuxUpsellPromptAnimatorObj())
		
		return
	end
	if PurchaseState == RobuxUpsellFlowStateModule.PurchaseWarning then
		Props.dispatchCentralOverlay(ConstantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructU13ConfirmPromptAnimatorObj())
	end
	if PurchaseState == RobuxUpsellFlowStateModule.Error then
		Props.dispatchCentralOverlay(ConstantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructPurchaseErrorPromptAnimatorObj())
	end
	if PurchaseState == RobuxUpsellFlowStateModule.TwoStepRequired then
		Props.dispatchCentralOverlay(ConstantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructTwoStepRequiredAnimatorObj())
	end
	if PurchaseState == RobuxUpsellFlowStateModule.Success then
		Props.dispatchCentralOverlay(ConstantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructRobuxUpsellSuccessPromptAnimatorObj())
	end
	if PurchaseState == RobuxUpsellFlowStateModule.GenericPurchaseModal then
		Props.dispatchCentralOverlay(ConstantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructInsufficientRobuxAnimatorObj())
	end
	if PurchaseState == RobuxUpsellFlowStateModule.LargeRobuxPurchaseModal then
		Props.dispatchCentralOverlay(ConstantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructInsufficientRobuxProductAnimatorObj())
	end
	if PurchaseState == RobuxUpsellFlowStateModule.LeaveRobloxWarning then
		Props.dispatchCentralOverlay(ConstantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructLeaveRobloxPromptAnimatorObj())
	end
	if PurchaseState == RobuxUpsellFlowStateModule.PurchaseVPCModal then
		Props.dispatchCentralOverlay(ConstantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructPurchaseVPCPromptAnimatorObj())
	end
end

function ExtendResult.reportModalShown(p1) --[[ Line: 992 ]]
	-- upvalues: GetModalShownEventDataModule (copy), RobuxUpsellFlowStateModule (copy), HttpService (copy)
	local Props = p1.props
	local State = p1.state
	
	if p1.props.onAnalyticEvent then
		Props.onAnalyticEvent("UserPurchaseFlow", (GetModalShownEventDataModule(State.analyticId, Props.eventPrefix, "RobuxUpsell", RobuxUpsellFlowStateModule.toRawValue(Props.purchaseState), HttpService:JSONEncode({
			universe_id = tostring(game.GameId),
			item_product_id = tostring(Props.itemProductId),
			item_name = Props.itemName,
			price = tostring(Props.itemRobuxCost),
			user_balance = tostring(Props.beforeRobuxBalance) or nil,
			package_robux_amount = tostring(Props.iapRobuxAmount) or nil,
			package_cost = Props.iapCostStr or nil
		}))))
		
		return
	end
end

function ExtendResult.reportUserInput(p1, Input_type) --[[ Line: 1021 ]]
	-- upvalues: GetUserInputEventDataModule (copy), RobuxUpsellFlowStateModule (copy), HttpService (copy), Players (copy), Default (copy), InGameRobuxUpsellEventModule (copy)
	local Props = p1.props
	local RobuxUpsell = GetUserInputEventDataModule(p1.state.analyticId, Props.eventPrefix, "RobuxUpsell", RobuxUpsellFlowStateModule.toRawValue(Props.purchaseState), Input_type, HttpService:JSONEncode({
		universe_id = tostring(game.GameId),
		item_product_id = tostring(Props.itemProductId),
		item_name = Props.itemName,
		price = tostring(Props.itemRobuxCost),
		user_balance = tostring(Props.beforeRobuxBalance) or nil,
		package_robux_amount = tostring(Props.iapRobuxAmount) or nil,
		package_cost = Props.iapCostStr or nil
	}))
	
	if not game:GetFastFlag("DisableNonSchematizedInGameRobuxUpsellEvent") and p1.props.onAnalyticEvent then
		Props.onAnalyticEvent("UserPurchaseFlow", RobuxUpsell)
	end
	Default:logRobloxTelemetryEvent(InGameRobuxUpsellEventModule, {
		Default.StandardizedFields.addOsInfo,
		Default.StandardizedFields.addSessionId
	}, {
		universe_id = game.GameId,
		price = Props.itemRobuxCost,
		view_name = RobuxUpsell.view_name,
		purchase_event_type = RobuxUpsell.purchase_event_type,
		input_type = Input_type,
		user_id = tostring(if Players.LocalPlayer and Players.LocalPlayer.UserId > 0 then Players.LocalPlayer.UserId else nil)
	})
end

function ExtendResult:purchaseStateToOverlayState(PurchaseState) --[[ Line: 1065 ]]
	-- upvalues: RobuxUpsellFlowStateModule (copy), LoadingOverlayStateModule (copy)
	return if PurchaseState == RobuxUpsellFlowStateModule.Loading then LoadingOverlayStateModule.Loading elseif PurchaseState == RobuxUpsellFlowStateModule.RobuxPurchasePending then LoadingOverlayStateModule.PurchasingRobux elseif PurchaseState == RobuxUpsellFlowStateModule.RobuxGrantPending then LoadingOverlayStateModule.WaitingForRobux elseif PurchaseState == RobuxUpsellFlowStateModule.ItemPurchasePending then LoadingOverlayStateModule.PurchasingItem elseif PurchaseState == RobuxUpsellFlowStateModule.None then nil else LoadingOverlayStateModule.None
end

function ExtendResult.getChildrenElements(p1) --[[ Line: 1082 ]]
	-- upvalues: RoactModule (copy), AnimatorModule (copy)
	return {
		RobuxUpsellPromptAnimator = RoactModule.createElement(AnimatorModule, p1:constructRobuxUpsellPromptAnimatorObj()),
		U13ConfirmPromptAnimator = RoactModule.createElement(AnimatorModule, p1:constructU13ConfirmPromptAnimatorObj()),
		PurchaseErrorPromptAnimator = RoactModule.createElement(AnimatorModule, p1:constructPurchaseErrorPromptAnimatorObj()),
		TwoStepRequiredAnimator = RoactModule.createElement(AnimatorModule, p1:constructTwoStepRequiredAnimatorObj()),
		RobuxUpsellSuccessPromptAnimator = RoactModule.createElement(AnimatorModule, p1:constructRobuxUpsellSuccessPromptAnimatorObj()),
		InsufficientRobuxAnimator = RoactModule.createElement(AnimatorModule, p1:constructInsufficientRobuxAnimatorObj()),
		InsufficientRobuxProductAnimator = RoactModule.createElement(AnimatorModule, p1:constructInsufficientRobuxProductAnimatorObj()),
		PurchaseVPCPromptAnimator = RoactModule.createElement(AnimatorModule, p1:constructPurchaseVPCPromptAnimatorObj())
	}
end

function ExtendResult.render(p1) --[[ Line: 1101 ]]
	-- upvalues: GetEnableCentralOverlayForUpsellPromptModule (copy), RoactModule (copy), LoadingOverlayModule (copy)
	local Props = p1.props
	
	return RoactModule.createElement(LoadingOverlayModule, {
		shouldAnimate = Props.shouldAnimate,
		loadingState = p1:purchaseStateToOverlayState(Props.purchaseState)
	}, if GetEnableCentralOverlayForUpsellPromptModule() and Props.dispatchCentralOverlay then {} else p1:getChildrenElements())
end

return ExtendResult