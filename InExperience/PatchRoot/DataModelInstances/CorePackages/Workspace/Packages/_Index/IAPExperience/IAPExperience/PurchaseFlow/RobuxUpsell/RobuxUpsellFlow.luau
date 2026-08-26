local httpService = game:GetService("HttpService")
local contextActionService = game:GetService("ContextActionService")
local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local robuxUpsellFlowStateModule = require(parent.RobuxUpsellFlowState)
local _ = require(parent_1.Enums.VirtualItemBadgeType)
local animatorModule = require(parent_1.Generic.Animator)
local constantsModule = require(parent_1.Generic.Constants)
local loadingOverlayModule = require(parent_1.Generic.LoadingOverlay)
local loadingOverlayStateModule = require(parent_1.Generic.LoadingOverlayState)
local purchaseErrorPromptModule = require(parent_1.Generic.PurchaseErrorPrompt)
local purchaseErrorTypeModule = require(parent_1.Enums.PurchaseErrorType)
local u13ConfirmPromptModule = require(parent_1.Generic.U13ConfirmPrompt)
local twoStepReqPromptModule = require(parent_1.Generic.TwoStepReqPrompt)
local insufficientRobuxPromptModule = require(parent_1.Generic.InsufficientRobuxPrompt)
local insufficientRobuxProductPromptModule = require(parent_1.ProductPurchaseRobuxUpsell.InsufficientRobuxProductPrompt)
local leaveRobloxPromptModule = require(parent_1.Generic.LeaveRobloxPrompt)
local robuxUpsellSuccessPromptModule = require(parent_1.ProductPurchaseRobuxUpsell.RobuxUpsellSuccessPrompt)
local robuxUpsellPromptModule = require(parent_1.ProductPurchaseRobuxUpsell.RobuxUpsellPrompt)
local robuxUpsellModalModule = require(parent_1.ProductPurchaseRobuxUpsell.v2.RobuxUpsellModal)
local robuxUpsellModalMultiplePackageModule = require(parent_1.ProductPurchaseRobuxUpsell.v2.RobuxUpsellModalMultiplePackage)
local robuxUpsellModalTooExpensiveModule = require(parent_1.ProductPurchaseRobuxUpsell.v2.RobuxUpsellModalTooExpensive)
local robuxUpsellModalTooExpensiveFallbackModule = require(parent_1.ProductPurchaseRobuxUpsell.v2.RobuxUpsellModalTooExpensiveFallback)
local unifiedRobuxUpsellModalModule = require(parent_1.ProductPurchaseRobuxUpsell.v3.UnifiedRobuxUpsellModal)
local unifiedRobuxUpsellModalTooExpensiveModule = require(parent_1.ProductPurchaseRobuxUpsell.v3.UnifiedRobuxUpsellModalTooExpensive)
local purchasePromptLiteModule = require(parent_2.PurchasePromptLite)
local getTTIEventName = purchasePromptLiteModule.getTTIEventName
local timeToInteractiveTracker = require(parent_2.TimeToInteractiveTracker).TimeToInteractiveTracker
local productPurchaseSurface = purchasePromptLiteModule.Enums.ProductPurchaseSurface
local getModalShownEventDataModule = require(parent_1.Utility.getModalShownEventData)
local getUserInputEventDataModule = require(parent_1.Utility.getUserInputEventData)
local shouldShowNewUpsellModalExperimentModule = require(parent_1.Utility.Experiments.shouldShowNewUpsellModalExperiment)
local overlayInGameMenuModule = require(parent_1.Utility.overlayInGameMenu)
local desktopUpsellExperimentModule = require(parent_1.Utility.Experiments.DesktopUpsellExperiment)
local getEnableCentralOverlayForUpsellPromptModule = require(parent_1.Flags.getEnableCentralOverlayForUpsellPrompt)
local fFlagEnableUnifiedProductPurchaseFlow = require(parent_2.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local getAppContextModule = require(parent_1.Utility.getAppContext)
local fFlagMobilePopularItemBadgingExperimentEnabledModule = require(parent_1.Flags.FFlagMobilePopularItemBadgingExperimentEnabled)
local unifiedPurchaseCompletionModalV2Module = require(parent_1.Generic.UnifiedPurchaseCompletionModalV2)
local name = roactModule.Component:extend(script.Name)
local default = require(parent_2.LoggingProtocol).default
local inGameRobuxUpsellEventModule = require(parent.Events.InGameRobuxUpsellEvent)
local playersService = game:GetService("Players")
local intervalPerformanceTracker = require(parent_2.IntervalPerformanceTracker).IntervalPerformanceTracker
local verifiedParentalConsentDialog = require(parent_2.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog
local unifiedRobuxUpsellModalV2Module = require(parent_1.ProductPurchaseRobuxUpsell.v4.UnifiedRobuxUpsellModalV2)
local unifiedRobuxUpsellModalTooExpensiveV2Module = require(parent_1.ProductPurchaseRobuxUpsell.v4.UnifiedRobuxUpsellModalTooExpensiveV2)
local _ = require(parent_1.ProductPurchase.v4.cartPricingResponseLineItem)
local unifiedPurchaseModalTypeEnumModule = require(parent_1.Enums.UnifiedPurchaseModalTypeEnum)
local unifiedPurchaseCompletionModalModule = require(parent_1.Generic.UnifiedPurchaseCompletionModal)
local fFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(parent_2.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local fFlagAddPerformanceMetricsToUnifiedPurchaseModal = require(parent_2.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal
local fIntLegacyPurchaseFPSTrackingTimeout = require(parent_2.SharedFlags).FIntLegacyPurchaseFPSTrackingTimeout
local fIntTTIUnifiedPurchaseSamplingRate = require(parent_2.SharedFlags).FIntTTIUnifiedPurchaseSamplingRate
local fFlagAddCenterDialogForUnifiedPurchaseModal = require(parent_2.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal
game:DefineFastFlag("DisableNonSchematizedInGameRobuxUpsellEvent", false)
game:DefineFastFlag("EnableSchematizedInGameRobuxUpsellEvent2", false)
local fixUnifiedUpsellCompletionModal = game:DefineFastFlag("FixUnifiedUpsellCompletionModal", false)
local _ = require(parent_1.ProductPurchase.PricingTypes)
local _ = require(parent_1.ProductPurchase.v3.UnifiedProductPurchaseModalTypes)
local fFlagEnableDiscountInfoInUnifiedPurchaseModal = require(parent_2.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal
local fFlagPurchasePromptFetchCartPricing = require(parent_2.SharedFlags).FFlagPurchasePromptFetchCartPricing
local fFlagEnableOffersOnInExperienceSurface = require(parent_2.SharedFlags).FFlagEnableOffersOnInExperienceSurface
local _ = require(parent_1.Api.PaymentsGateway.GetUpsellSuggestionsTypes)

function name.init(p1)
	-- upvalues: httpService (ref)
	local props = p1.props
	p1.state = {
		enableInputDelayed = false,
		analyticId = if props.analyticId then props.analyticId else httpService:GenerateGUID(false),
		isDelayedInput = props.isDelayedInput
	}
	
	function p0.closeModal()
		-- upvalues: p1 (ref)
		local props = p1.props
		p1:reportUserInput("Cancel")
		props.cancelPurchase()
		p1:closeCentralOverlay()
		p1:UnbindActions()
	end
end

function name.didMount(p1)
	-- upvalues: fFlagAddPerformanceMetricsToUnifiedPurchaseModal (ref), intervalPerformanceTracker (ref), fIntLegacyPurchaseFPSTrackingTimeout (ref), getTTIEventName (ref), productPurchaseSurface (ref), timeToInteractiveTracker (ref), fIntTTIUnifiedPurchaseSamplingRate (ref)
	if fFlagAddPerformanceMetricsToUnifiedPurchaseModal and (p1.props or {}).eventPrefix == "UACatalog" then
		intervalPerformanceTracker:startTracking("PurchaseModal_RobuxUpsellModalShown_Catalog", fIntLegacyPurchaseFPSTrackingTimeout, nil, true, true)
		intervalPerformanceTracker:startTracking("PurchaseModal_LegacyFlowRobuxUpsellModalShown_Catalog", fIntLegacyPurchaseFPSTrackingTimeout, nil, true, true)
		timeToInteractiveTracker.trackEnd(getTTIEventName(productPurchaseSurface.Catalog), {
			samplingRateOverride = fIntTTIUnifiedPurchaseSamplingRate
		})
	end
end

function name.didUpdate(p1, p2, _)
	local props = p1.props
	
	if p2.purchaseState ~= props.purchaseState then
		p1:reportModalShown()
		p1:dispatchCentralOverlayAndRenderModal(props)
	end
end

function name.UnbindActions(p1)
	-- upvalues: getEnableCentralOverlayForUpsellPromptModule (ref), contextActionService (ref), constantsModule (ref)
	if getEnableCentralOverlayForUpsellPromptModule() and p1.props.dispatchCentralOverlay then
		contextActionService:UnbindAction(constantsModule.CLOSE_MODAL_ACTION)
	end
end

function name.BindCancelAction(p1)
	-- upvalues: getEnableCentralOverlayForUpsellPromptModule (ref), contextActionService (ref), constantsModule (ref)
	if getEnableCentralOverlayForUpsellPromptModule() and p1.props.dispatchCentralOverlay then
		contextActionService:BindAction(constantsModule.CLOSE_MODAL_ACTION, p1.closeModal, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
	end
end

function name.closeCentralOverlay(p1)
	-- upvalues: getEnableCentralOverlayForUpsellPromptModule (ref)
	local props = p1.props
	
	if getEnableCentralOverlayForUpsellPromptModule() and props.dispatchCentralOverlay then
		props.dispatchCentralOverlay()
	end
end

function name.constructRobuxUpsellPromptAnimatorObj(p1)
	-- upvalues: robuxUpsellFlowStateModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagAddCenterDialogForUnifiedPurchaseModal (ref), getAppContextModule (ref), roactModule (ref), unifiedRobuxUpsellModalV2Module (ref), fFlagEnableDiscountInfoInUnifiedPurchaseModal (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), fFlagPurchasePromptFetchCartPricing (ref), unifiedRobuxUpsellModalModule (ref), fFlagEnableOffersOnInExperienceSurface (ref), overlayInGameMenuModule (ref), robuxUpsellModalMultiplePackageModule (ref), shouldShowNewUpsellModalExperimentModule (ref), desktopUpsellExperimentModule (ref), robuxUpsellModalModule (ref), robuxUpsellPromptModule (ref), fFlagMobilePopularItemBadgingExperimentEnabledModule (ref)
	local props = p1.props
	local state = p1.state
	p1:BindCancelAction()
	
	return {
		shouldAnimate = props.shouldAnimate,
		shouldShow = props.purchaseState == robuxUpsellFlowStateModule.PurchaseModal,
		skipAnimation = if fFlagEnableUnifiedProductPurchaseFlow then props.useUnifiedProductPurchaseModal else nil,
		onShown = if props.isDelayedInput then function()
			-- upvalues: p1 (ref), props (ref)
			p1:setState({ enableInputDelayed = true })
			delay(3, function()
				-- upvalues: p1 (copy), props (copy)
				p1:setState({ isDelayedInput = false, enableInputDelayed = false })
				
				if props.onDelayedInputComplete then
					props.onDelayedInputComplete()
				end
			end)
		end else nil,
		onHidden = if props.isDelayedInput then function()
			-- upvalues: p1 (ref), props (ref)
			p1:setState({
				enableInputDelayed = false,
				isDelayedInput = props.isDelayedInput
			})
		end else nil,
		renderChildren = function()
			-- upvalues: fFlagEnableUnifiedProductPurchaseFlow (copy), props (ref), fFlagAddCenterDialogForUnifiedPurchaseModal (copy), getAppContextModule (copy), roactModule (copy), unifiedRobuxUpsellModalV2Module (copy), fFlagEnableDiscountInfoInUnifiedPurchaseModal (copy), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), fFlagPurchasePromptFetchCartPricing (copy), p1 (ref), state (ref), unifiedRobuxUpsellModalModule (copy), fFlagEnableOffersOnInExperienceSurface (copy), overlayInGameMenuModule (copy), robuxUpsellModalMultiplePackageModule (copy), shouldShowNewUpsellModalExperimentModule (copy), desktopUpsellExperimentModule (copy), robuxUpsellModalModule (copy), robuxUpsellPromptModule (copy), fFlagMobilePopularItemBadgingExperimentEnabledModule (copy)
			return if fFlagEnableUnifiedProductPurchaseFlow and props.useUnifiedProductPurchaseModal then if fFlagAddCenterDialogForUnifiedPurchaseModal and getAppContextModule() == "UA" then roactModule.createElement(unifiedRobuxUpsellModalV2Module, {
				product = {
					model = props.model,
					itemIcon = props.itemIcon,
					itemName = props.itemName,
					itemRobuxCost = props.itemRobuxCost,
					badgeType = props.virtualItemBadgeType,
					itemPrice = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then props.virtualItemPrice else nil
				},
				userBalance = props.beforeRobuxBalance,
				upsellSuggestions = props.upsellSuggestions,
				selectedUpsellIndex = props.selectedUpsellIndex,
				onUpsellSuggestionsSelected = props.onUpsellSuggestionsSelected,
				purchaseModalType = props.unifiedProductPurchaseModalType,
				onBuyItemButtonMounted = props.onBuyItemButtonMounted,
				hideUserRobuxBalance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then props.hideUserRobuxBalance else nil,
				cartPricingResponse = if fFlagPurchasePromptFetchCartPricing then props.cartPricingResponse else nil,
				collectibleItemId = if fFlagPurchasePromptFetchCartPricing then props.collectibleItemId else nil,
				isCartPricingLoading = if fFlagPurchasePromptFetchCartPricing then props.isCartPricingLoading else nil,
				onCartOfferAppliedChanged = if fFlagPurchasePromptFetchCartPricing then props.onCartOfferAppliedChanged else nil,
				postPurchaseActions = if fFlagPurchasePromptFetchCartPricing then props.postPurchaseActions else nil,
				setPostPurchaseActions = if fFlagPurchasePromptFetchCartPricing then props.setPostPurchaseActions else nil,
				buttons = {
					buyItemActivated = function()
						-- upvalues: p1 (copy), props (copy)
						p1:reportUserInput("Buy")
						props.purchaseRobux()
						p1:closeCentralOverlay()
					end,
					buyItemControllerIcon = props.acceptControllerIcon,
					buyItemisDelayedInput = state.isDelayedInput,
					buyItemEnableInputDelayed = state.enableInputDelayed and getAppContextModule() == "IN_EXPERIENCE",
					cancelPurchaseActivated = function()
						-- upvalues: p1 (copy), props (copy)
						p1:reportUserInput("Cancel")
						props.cancelPurchase()
						p1:closeCentralOverlay()
					end,
					cancelControllerIcon = props.cancelControllerIcon
				},
				termsOfUseActivated = if props.showTermsOfUse then function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("TermsOfService")
					props.showTermsOfUse()
					props.flowComplete()
				end else nil,
				screenSize = props.screenSize
			}) else roactModule.createElement(unifiedRobuxUpsellModalModule, {
				product = {
					model = props.model,
					itemIcon = props.itemIcon,
					itemName = props.itemName,
					itemRobuxCost = props.itemRobuxCost,
					badgeType = props.virtualItemBadgeType,
					itemPrice = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then props.virtualItemPrice else nil
				},
				userBalance = props.beforeRobuxBalance,
				upsellSuggestions = props.upsellSuggestions,
				selectedUpsellIndex = props.selectedUpsellIndex,
				onUpsellSuggestionsSelected = props.onUpsellSuggestionsSelected,
				purchaseModalType = props.unifiedProductPurchaseModalType,
				onBuyItemButtonMounted = props.onBuyItemButtonMounted,
				hideUserRobuxBalance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then props.hideUserRobuxBalance else nil,
				cartPricingResponse = if fFlagEnableOffersOnInExperienceSurface then props.cartPricingResponse else nil,
				isCartPricingLoading = if fFlagEnableOffersOnInExperienceSurface then props.isCartPricingLoading else nil,
				onCartOfferAppliedChanged = if fFlagEnableOffersOnInExperienceSurface then props.onCartOfferAppliedChanged else nil,
				buttons = {
					buyItemActivated = function()
						-- upvalues: p1 (copy), props (copy)
						p1:reportUserInput("Buy")
						props.purchaseRobux()
						p1:closeCentralOverlay()
					end,
					buyItemControllerIcon = props.acceptControllerIcon,
					buyItemisDelayedInput = state.isDelayedInput,
					buyItemEnableInputDelayed = state.enableInputDelayed and getAppContextModule() == "IN_EXPERIENCE",
					cancelPurchaseActivated = function()
						-- upvalues: p1 (copy), props (copy)
						p1:reportUserInput("Cancel")
						props.cancelPurchase()
						p1:closeCentralOverlay()
					end,
					cancelControllerIcon = props.cancelControllerIcon
				},
				termsOfUseActivated = if props.showTermsOfUse then function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("TermsOfService")
					props.showTermsOfUse()
					props.flowComplete()
				end else nil,
				screenSize = props.screenSize
			}) elseif props.useUpsellSuggestions then overlayInGameMenuModule(roactModule.createElement(robuxUpsellModalMultiplePackageModule, {
				product = {
					model = props.model,
					itemIcon = props.itemIcon,
					itemName = props.itemName,
					itemRobuxCost = props.itemRobuxCost,
					badgeType = props.virtualItemBadgeType
				},
				userBalance = props.beforeRobuxBalance,
				upsellSuggestions = props.upsellSuggestions,
				selectedUpsellIndex = props.selectedUpsellIndex,
				onUpsellSuggestionsSelected = props.onUpsellSuggestionsSelected,
				buttons = {
					buyItemActivated = function()
						-- upvalues: p1 (copy), props (copy)
						p1:reportUserInput("Buy")
						props.purchaseRobux()
						p1:closeCentralOverlay()
					end,
					buyItemControllerIcon = props.acceptControllerIcon,
					buyItemisDelayedInput = state.isDelayedInput,
					buyItemEnableInputDelayed = state.enableInputDelayed,
					cancelPurchaseActivated = function()
						-- upvalues: p1 (copy), props (copy)
						p1:reportUserInput("Cancel")
						props.cancelPurchase()
						p1:closeCentralOverlay()
					end,
					cancelControllerIcon = props.cancelControllerIcon
				},
				isQuest = props.isQuest,
				isVng = props.isVng,
				screenSize = props.screenSize
			})) elseif shouldShowNewUpsellModalExperimentModule() or desktopUpsellExperimentModule.shouldShowNewModal() then overlayInGameMenuModule(roactModule.createElement(robuxUpsellModalModule, {
				product = {
					model = props.model,
					itemIcon = props.itemIcon,
					itemName = props.itemName,
					itemRobuxCost = props.itemRobuxCost,
					badgeType = props.virtualItemBadgeType
				},
				upsell = {
					balanceAmount = props.beforeRobuxBalance,
					robuxPurchaseAmount = props.iapRobuxAmount,
					robuxPurchaseCost = props.iapCostStr,
					robuxPurchaseAmountBeforeBonus = props.iapRobuxAmountBeforeBonus
				},
				buttons = {
					buyItemActivated = function()
						-- upvalues: p1 (copy), props (copy)
						p1:reportUserInput("Buy")
						props.purchaseRobux()
						p1:closeCentralOverlay()
					end,
					buyItemControllerIcon = props.acceptControllerIcon,
					buyItemisDelayedInput = state.isDelayedInput,
					buyItemEnableInputDelayed = state.enableInputDelayed,
					cancelPurchaseActivated = function()
						-- upvalues: p1 (copy), props (copy)
						p1:reportUserInput("Cancel")
						props.cancelPurchase()
						p1:closeCentralOverlay()
					end,
					cancelControllerIcon = props.cancelControllerIcon,
					opensBuyRobuxPage = desktopUpsellExperimentModule.getVariant() == desktopUpsellExperimentModule.variants.OpenRobuxStore
				},
				isQuest = props.isQuest,
				isVng = props.isVng,
				termsOfUseActivated = if props.showTermsOfUse then function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("TermsOfService")
					props.showTermsOfUse()
				end else nil,
				screenSize = props.screenSize
			})) else roactModule.createElement(robuxUpsellPromptModule, {
				screenSize = props.screenSize,
				isDelayedInput = state.isDelayedInput,
				enableInputDelayed = state.enableInputDelayed,
				model = props.model,
				itemIcon = props.itemIcon,
				itemName = props.itemName,
				itemRobuxCost = props.itemRobuxCost,
				robuxPurchaseAmount = props.iapRobuxAmount,
				robuxPurchaseAmountBeforeBonus = props.iapRobuxAmountBeforeBonus,
				balanceAmount = props.beforeRobuxBalance,
				buyItemControllerIcon = props.acceptControllerIcon,
				cancelControllerIcon = props.cancelControllerIcon,
				itemProductId = fFlagMobilePopularItemBadgingExperimentEnabledModule and tostring(props.itemProductId) or nil,
				buyItemActivated = function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("Buy")
					props.purchaseRobux()
					p1:closeCentralOverlay()
				end,
				cancelPurchaseActivated = function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("Cancel")
					props.cancelPurchase()
					p1:closeCentralOverlay()
				end,
				termsOfUseActivated = if props.showTermsOfUse then function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("TermsOfService")
					props.showTermsOfUse()
				end else nil,
				isQuest = p1.props.isQuest,
				isVng = p1.props.isVng
			})
		end
	}
end

function name.constructU13ConfirmPromptAnimatorObj(p1)
	-- upvalues: robuxUpsellFlowStateModule (ref), roactModule (ref), u13ConfirmPromptModule (ref)
	local props = p1.props
	p1:BindCancelAction()
	
	return {
		shouldAnimate = props.shouldAnimate,
		shouldShow = props.purchaseState == robuxUpsellFlowStateModule.PurchaseWarning,
		renderChildren = function()
			-- upvalues: roactModule (copy), u13ConfirmPromptModule (copy), props (ref), p1 (ref)
			return roactModule.createElement(u13ConfirmPromptModule, {
				screenSize = props.screenSize,
				modalType = props.u13ConfirmType,
				doneControllerIcon = props.acceptControllerIcon,
				cancelControllerIcon = props.cancelControllerIcon,
				doneActivated = function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("Confirm")
					props.acceptPurchaseWarning()
					p1:closeCentralOverlay()
				end,
				cancelActivated = function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("Cancel")
					props.cancelPurchase()
					p1:closeCentralOverlay()
				end
			})
		end
	}
end

function name.constructPurchaseErrorPromptAnimatorObj(p1)
	-- upvalues: robuxUpsellFlowStateModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), purchaseErrorTypeModule (ref), fFlagAddCenterDialogForUnifiedPurchaseModal (ref), roactModule (ref), unifiedRobuxUpsellModalTooExpensiveV2Module (ref), unifiedRobuxUpsellModalTooExpensiveModule (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), shouldShowNewUpsellModalExperimentModule (ref), desktopUpsellExperimentModule (ref), robuxUpsellModalTooExpensiveFallbackModule (ref), purchaseErrorPromptModule (ref)
	local props = p1.props
	p1:BindCancelAction()
	
	return {
		shouldAnimate = props.shouldAnimate,
		shouldShow = props.purchaseState == robuxUpsellFlowStateModule.Error,
		renderChildren = function()
			-- upvalues: fFlagEnableUnifiedProductPurchaseFlow (copy), props (ref), purchaseErrorTypeModule (copy), fFlagAddCenterDialogForUnifiedPurchaseModal (copy), roactModule (copy), unifiedRobuxUpsellModalTooExpensiveV2Module (copy), p1 (ref), unifiedRobuxUpsellModalTooExpensiveModule (copy), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), shouldShowNewUpsellModalExperimentModule (copy), desktopUpsellExperimentModule (copy), robuxUpsellModalTooExpensiveFallbackModule (copy), purchaseErrorPromptModule (copy)
			return if fFlagEnableUnifiedProductPurchaseFlow and props.errorType == purchaseErrorTypeModule.NotEnoughRobuxInApp then if fFlagAddCenterDialogForUnifiedPurchaseModal then roactModule.createElement(unifiedRobuxUpsellModalTooExpensiveV2Module, {
				product = {
					model = props.model,
					itemIcon = props.itemIcon,
					itemName = props.itemName,
					itemRobuxCost = props.itemRobuxCost
				},
				balanceAmount = props.beforeRobuxBalance,
				buttons = {
					buyItemActivated = function()
						-- upvalues: p1 (copy), props (copy)
						p1:reportUserInput("Buy Robux")
						props.openBuyRobux()
						props.flowComplete()
						p1:closeCentralOverlay()
					end,
					cancelPurchaseActivated = function()
						-- upvalues: p1 (copy), props (copy)
						p1:reportUserInput("Cancel")
						props.flowComplete()
						p1:closeCentralOverlay()
					end
				},
				purchaseModalType = props.unifiedProductPurchaseModalType,
				screenSize = props.screenSize
			}) else roactModule.createElement(unifiedRobuxUpsellModalTooExpensiveModule, {
				product = {
					model = props.model,
					itemIcon = props.itemIcon,
					itemName = props.itemName,
					itemRobuxCost = props.itemRobuxCost
				},
				balanceAmount = props.beforeRobuxBalance,
				hideUserRobuxBalance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then props.hideUserRobuxBalance else nil,
				buttons = {
					buyItemActivated = function()
						-- upvalues: p1 (copy), props (copy)
						p1:reportUserInput("Buy Robux")
						props.openBuyRobux()
						props.flowComplete()
						p1:closeCentralOverlay()
					end,
					cancelPurchaseActivated = function()
						-- upvalues: p1 (copy), props (copy)
						p1:reportUserInput("Cancel")
						props.flowComplete()
						p1:closeCentralOverlay()
					end
				},
				isQuest = props.isQuest,
				screenSize = props.screenSize,
				purchaseModalType = props.unifiedProductPurchaseModalType
			}) elseif props.errorType == purchaseErrorTypeModule.NotEnoughRobux and (shouldShowNewUpsellModalExperimentModule() or desktopUpsellExperimentModule.shouldShowNewModal()) then roactModule.createElement(robuxUpsellModalTooExpensiveFallbackModule, {
				product = {
					model = props.model,
					itemIcon = props.itemIcon,
					itemName = props.itemName,
					itemRobuxCost = props.itemRobuxCost
				},
				balanceAmount = props.beforeRobuxBalance,
				doneActivated = function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("Done")
					props.flowComplete()
					p1:closeCentralOverlay()
				end,
				doneControllerIcon = props.acceptControllerIcon,
				isQuest = props.isQuest,
				screenSize = props.screenSize
			}) else roactModule.createElement(purchaseErrorPromptModule, {
				screenSize = props.screenSize,
				errorType = props.errorType,
				economicRestrictionError = props.economicRestrictionError,
				doneControllerIcon = props.acceptControllerIcon,
				doneActivated = function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("Done")
					props.flowComplete()
					p1:closeCentralOverlay()
				end
			})
		end
	}
end

function name.constructTwoStepRequiredAnimatorObj(p1)
	-- upvalues: robuxUpsellFlowStateModule (ref), roactModule (ref), twoStepReqPromptModule (ref)
	local props = p1.props
	p1:BindCancelAction()
	
	return {
		shouldAnimate = props.shouldAnimate,
		shouldShow = props.purchaseState == robuxUpsellFlowStateModule.TwoStepRequired,
		renderChildren = function()
			-- upvalues: roactModule (copy), twoStepReqPromptModule (copy), props (ref), p1 (ref)
			return roactModule.createElement(twoStepReqPromptModule, {
				screenSize = props.screenSize,
				doneControllerIcon = props.acceptControllerIcon,
				openSecuritySettings = function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("GoToSecuritySettings")
					props.openSecuritySettings()
					props.flowComplete()
					p1:closeCentralOverlay()
				end,
				closePrompt = function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("Cancel")
					props.flowComplete()
					p1:closeCentralOverlay()
				end
			})
		end
	}
end

function name.constructRobuxUpsellSuccessPromptAnimatorObj(p1)
	-- upvalues: robuxUpsellFlowStateModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fixUnifiedUpsellCompletionModal (ref), getAppContextModule (ref), roactModule (ref), unifiedPurchaseCompletionModalV2Module (ref), unifiedPurchaseModalTypeEnumModule (ref), unifiedPurchaseCompletionModalModule (ref), robuxUpsellSuccessPromptModule (ref)
	local props = p1.props
	p1:BindCancelAction()
	
	return {
		shouldAnimate = props.shouldAnimate,
		shouldShow = props.purchaseState == robuxUpsellFlowStateModule.Success,
		renderChildren = function()
			-- upvalues: props (ref), fFlagEnableUnifiedProductPurchaseFlow (copy), fixUnifiedUpsellCompletionModal (copy), getAppContextModule (copy), roactModule (copy), unifiedPurchaseCompletionModalV2Module (copy), p1 (ref), unifiedPurchaseModalTypeEnumModule (copy), unifiedPurchaseCompletionModalModule (copy), robuxUpsellSuccessPromptModule (copy)
			local _ = 0
			local var1 = props.beforeRobuxBalance - props.itemRobuxCost
			
			return if not (not fFlagEnableUnifiedProductPurchaseFlow or not props.useUnifiedProductPurchaseModal) then if fixUnifiedUpsellCompletionModal and getAppContextModule() == "UA" then roactModule.createElement(unifiedPurchaseCompletionModalV2Module, {
				buttons = {
					onActivated = function()
						-- upvalues: p1 (copy), props (copy)
						p1:reportUserInput("Done")
						props.flowComplete()
						p1:closeCentralOverlay()
					end
				},
				isMultiItem = props.unifiedProductPurchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem,
				itemName = props.itemName
			}) else roactModule.createElement(unifiedPurchaseCompletionModalModule, {
				buttons = {
					onActivated = function()
						-- upvalues: p1 (copy), props (copy)
						p1:reportUserInput("Done")
						props.flowComplete()
						p1:closeCentralOverlay()
					end
				},
				isMultiItem = props.unifiedProductPurchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem,
				itemName = props.itemName
			}) else roactModule.createElement(robuxUpsellSuccessPromptModule, {
				screenSize = props.screenSize,
				model = props.model,
				itemIcon = props.itemIcon,
				itemName = props.itemName,
				balance = if var1 < 0 then var1 + props.iapRobuxAmount else var1,
				confirmControllerIcon = props.acceptControllerIcon,
				cancelControllerIcon = props.cancelControllerIcon,
				doneActivated = function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("Done")
					props.flowComplete()
					p1:closeCentralOverlay()
				end,
				equipActivated = if props.equipItem then function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("Equip")
					props.equipItem()
					p1:closeCentralOverlay()
				end else nil
			})
		end
	}
end

function name.constructInsufficientRobuxAnimatorObj(p1)
	-- upvalues: robuxUpsellFlowStateModule (ref), shouldShowNewUpsellModalExperimentModule (ref), desktopUpsellExperimentModule (ref), roactModule (ref), robuxUpsellModalTooExpensiveModule (ref), insufficientRobuxPromptModule (ref)
	local props = p1.props
	p1:BindCancelAction()
	
	return {
		shouldAnimate = props.shouldAnimate,
		shouldShow = props.purchaseState == robuxUpsellFlowStateModule.GenericPurchaseModal,
		renderChildren = function()
			-- upvalues: shouldShowNewUpsellModalExperimentModule (copy), desktopUpsellExperimentModule (copy), roactModule (copy), robuxUpsellModalTooExpensiveModule (copy), props (ref), p1 (ref), insufficientRobuxPromptModule (copy)
			return if shouldShowNewUpsellModalExperimentModule() or desktopUpsellExperimentModule.shouldShowNewModal() then roactModule.createElement(robuxUpsellModalTooExpensiveModule, {
				product = {
					model = props.model,
					itemIcon = props.itemIcon,
					itemName = props.itemName,
					itemRobuxCost = props.itemRobuxCost
				},
				balanceAmount = props.beforeRobuxBalance,
				buttons = {
					buyItemActivated = function()
						-- upvalues: p1 (copy), props (copy)
						p1:reportUserInput("Buy Robux")
						props.openBuyRobux()
						props.flowComplete()
						p1:closeCentralOverlay()
					end,
					buyItemControllerIcon = props.acceptControllerIcon,
					cancelPurchaseActivated = function()
						-- upvalues: p1 (copy), props (copy)
						p1:reportUserInput("Cancel")
						props.flowComplete()
						p1:closeCentralOverlay()
					end,
					cancelControllerIcon = props.cancelControllerIcon
				},
				isQuest = props.isQuest,
				screenSize = props.screenSize
			}) else roactModule.createElement(insufficientRobuxPromptModule, {
				screenSize = props.screenSize,
				robuxBalance = props.beforeRobuxBalance,
				buyRobux = function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("Buy Robux")
					props.openBuyRobux()
					props.flowComplete()
					p1:closeCentralOverlay()
				end,
				closePrompt = function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("Cancel")
					props.flowComplete()
					p1:closeCentralOverlay()
				end
			})
		end
	}
end

function name.constructInsufficientRobuxProductAnimatorObj(p1)
	-- upvalues: robuxUpsellFlowStateModule (ref), roactModule (ref), insufficientRobuxProductPromptModule (ref)
	local props = p1.props
	p1:BindCancelAction()
	
	return {
		shouldAnimate = props.shouldAnimate,
		shouldShow = props.purchaseState == robuxUpsellFlowStateModule.LargeRobuxPurchaseModal,
		renderChildren = function()
			-- upvalues: roactModule (copy), insufficientRobuxProductPromptModule (copy), props (ref), p1 (ref)
			return roactModule.createElement(insufficientRobuxProductPromptModule, {
				screenSize = props.screenSize,
				model = props.model,
				itemIcon = props.itemIcon,
				itemName = props.itemName,
				itemRobuxCost = props.itemRobuxCost,
				balanceAmount = props.beforeRobuxBalance,
				acceptControllerIcon = props.acceptControllerIcon,
				cancelControllerIcon = props.cancelControllerIcon,
				robuxStoreActivated = function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("Go to Robux store")
					props.openBuyRobux()
					p1:closeCentralOverlay()
				end,
				cancelPurchaseActivated = function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("Cancel")
					props.flowComplete()
					p1:closeCentralOverlay()
				end
			})
		end
	}
end

function name.constructLeaveRobloxPromptAnimatorObj(p1)
	-- upvalues: robuxUpsellFlowStateModule (ref), roactModule (ref), leaveRobloxPromptModule (ref)
	local props = p1.props
	p1:BindCancelAction()
	
	return {
		shouldAnimate = props.shouldAnimate,
		shouldShow = props.purchaseState == robuxUpsellFlowStateModule.LeaveRobloxWarning,
		renderChildren = function()
			-- upvalues: roactModule (copy), leaveRobloxPromptModule (copy), props (ref), p1 (ref)
			return roactModule.createElement(leaveRobloxPromptModule, {
				screenSize = props.screenSize,
				cancelActivated = function()
					-- upvalues: p1 (copy)
					p1:closeCentralOverlay()
				end,
				continueActivated = function()
					-- upvalues: props (copy)
					props.openVngShop()
				end
			})
		end
	}
end

function name.constructPurchaseVPCPromptAnimatorObj(p1)
	-- upvalues: robuxUpsellFlowStateModule (ref), roactModule (ref), verifiedParentalConsentDialog (ref)
	local props = p1.props
	p1:BindCancelAction()
	
	return {
		shouldAnimate = props.shouldAnimate,
		shouldShow = props.purchaseState == robuxUpsellFlowStateModule.PurchaseVPCModal,
		renderChildren = function()
			-- upvalues: roactModule (copy), verifiedParentalConsentDialog (copy), props (ref), p1 (ref)
			return roactModule.createElement(verifiedParentalConsentDialog, {
				screenSize = props.screenSize,
				isActionable = props.openSettingsPage ~= nil,
				modalType = props.purchaseVPCType,
				onAction = props.openSettingsPage and function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("Confirm")
					props.openSettingsPage()
					props.flowComplete()
				end,
				onDismiss = function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("Cancel")
					props.cancelPurchase()
					p1:closeCentralOverlay()
				end
			})
		end
	}
end

function name.dispatchCentralOverlayAndRenderModal(p1, p2)
	-- upvalues: getEnableCentralOverlayForUpsellPromptModule (ref), robuxUpsellFlowStateModule (ref), constantsModule (ref)
	if not getEnableCentralOverlayForUpsellPromptModule() or not p2.dispatchCentralOverlay then return end
	local purchaseState = p2.purchaseState
	
	if purchaseState == robuxUpsellFlowStateModule.PurchaseModal then
		p2.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructRobuxUpsellPromptAnimatorObj())
		
		return
	elseif purchaseState == robuxUpsellFlowStateModule.PurchaseWarning then
		p2.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructU13ConfirmPromptAnimatorObj())
	end
	if purchaseState == robuxUpsellFlowStateModule.Error then
		p2.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructPurchaseErrorPromptAnimatorObj())
	end
	if purchaseState == robuxUpsellFlowStateModule.TwoStepRequired then
		p2.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructTwoStepRequiredAnimatorObj())
	end
	if purchaseState == robuxUpsellFlowStateModule.Success then
		p2.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructRobuxUpsellSuccessPromptAnimatorObj())
	end
	if purchaseState == robuxUpsellFlowStateModule.GenericPurchaseModal then
		p2.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructInsufficientRobuxAnimatorObj())
	end
	if purchaseState == robuxUpsellFlowStateModule.LargeRobuxPurchaseModal then
		p2.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructInsufficientRobuxProductAnimatorObj())
	end
	if purchaseState == robuxUpsellFlowStateModule.LeaveRobloxWarning then
		p2.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructLeaveRobloxPromptAnimatorObj())
	end
	if purchaseState == robuxUpsellFlowStateModule.PurchaseVPCModal then
		p2.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructPurchaseVPCPromptAnimatorObj())
	end
end

function name.reportModalShown(p1)
	-- upvalues: getModalShownEventDataModule (ref), robuxUpsellFlowStateModule (ref), httpService (ref)
	local props = p1.props
	local state = p1.state
	
	if p1.props.onAnalyticEvent then
		props.onAnalyticEvent("UserPurchaseFlow", getModalShownEventDataModule(state.analyticId, props.eventPrefix, "RobuxUpsell", robuxUpsellFlowStateModule.toRawValue(props.purchaseState), httpService:JSONEncode({
			universe_id = tostring(game.GameId),
			item_product_id = tostring(props.itemProductId),
			item_name = props.itemName,
			price = tostring(props.itemRobuxCost),
			user_balance = tostring(props.beforeRobuxBalance) or nil,
			package_robux_amount = tostring(props.iapRobuxAmount) or nil,
			package_cost = props.iapCostStr or nil
		})))
		
		return
	end
end

function name.reportUserInput(p1, p2)
	-- upvalues: getUserInputEventDataModule (ref), robuxUpsellFlowStateModule (ref), httpService (ref), playersService (ref), default (ref), inGameRobuxUpsellEventModule (ref)
	local props = p1.props
	local var1 = getUserInputEventDataModule(p1.state.analyticId, props.eventPrefix, "RobuxUpsell", robuxUpsellFlowStateModule.toRawValue(props.purchaseState), p2, httpService:JSONEncode({
		universe_id = tostring(game.GameId),
		item_product_id = tostring(props.itemProductId),
		item_name = props.itemName,
		price = tostring(props.itemRobuxCost),
		user_balance = tostring(props.beforeRobuxBalance) or nil,
		package_robux_amount = tostring(props.iapRobuxAmount) or nil,
		package_cost = props.iapCostStr or nil
	}))
	
	if not game:GetFastFlag("DisableNonSchematizedInGameRobuxUpsellEvent") and p1.props.onAnalyticEvent then
		props.onAnalyticEvent("UserPurchaseFlow", var1)
	end
	if game:GetFastFlag("EnableSchematizedInGameRobuxUpsellEvent2") then
		default:logRobloxTelemetryEvent(inGameRobuxUpsellEventModule, {
			default.StandardizedFields.addOsInfo,
			default.StandardizedFields.addSessionId
		}, {
			universe_id = game.GameId,
			price = props.itemRobuxCost,
			view_name = var1.view_name,
			purchase_event_type = var1.purchase_event_type,
			input_type = p2,
			user_id = tostring(if playersService.LocalPlayer and playersService.LocalPlayer.UserId > 0 then playersService.LocalPlayer.UserId else nil)
		})
	end
end

function name.purchaseStateToOverlayState(_, p1)
	-- upvalues: robuxUpsellFlowStateModule (ref), loadingOverlayStateModule (ref)
	return if p1 == robuxUpsellFlowStateModule.Loading then loadingOverlayStateModule.Loading elseif p1 == robuxUpsellFlowStateModule.RobuxPurchasePending then loadingOverlayStateModule.PurchasingRobux elseif p1 == robuxUpsellFlowStateModule.RobuxGrantPending then loadingOverlayStateModule.WaitingForRobux elseif p1 == robuxUpsellFlowStateModule.ItemPurchasePending then loadingOverlayStateModule.PurchasingItem elseif p1 == robuxUpsellFlowStateModule.None then nil else loadingOverlayStateModule.None
end

function name.getChildrenElements(p1)
	-- upvalues: roactModule (ref), animatorModule (ref)
	return {
		RobuxUpsellPromptAnimator = roactModule.createElement(animatorModule, p1:constructRobuxUpsellPromptAnimatorObj()),
		U13ConfirmPromptAnimator = roactModule.createElement(animatorModule, p1:constructU13ConfirmPromptAnimatorObj()),
		PurchaseErrorPromptAnimator = roactModule.createElement(animatorModule, p1:constructPurchaseErrorPromptAnimatorObj()),
		TwoStepRequiredAnimator = roactModule.createElement(animatorModule, p1:constructTwoStepRequiredAnimatorObj()),
		RobuxUpsellSuccessPromptAnimator = roactModule.createElement(animatorModule, p1:constructRobuxUpsellSuccessPromptAnimatorObj()),
		InsufficientRobuxAnimator = roactModule.createElement(animatorModule, p1:constructInsufficientRobuxAnimatorObj()),
		InsufficientRobuxProductAnimator = roactModule.createElement(animatorModule, p1:constructInsufficientRobuxProductAnimatorObj()),
		PurchaseVPCPromptAnimator = roactModule.createElement(animatorModule, p1:constructPurchaseVPCPromptAnimatorObj())
	}
end

function name.render(p1)
	-- upvalues: getEnableCentralOverlayForUpsellPromptModule (ref), roactModule (ref), loadingOverlayModule (ref)
	local props = p1.props
	
	return roactModule.createElement(loadingOverlayModule, {
		shouldAnimate = props.shouldAnimate,
		loadingState = p1:purchaseStateToOverlayState(props.purchaseState)
	}, if not (getEnableCentralOverlayForUpsellPromptModule() and props.dispatchCentralOverlay) then p1:getChildrenElements() else {})
end

return name