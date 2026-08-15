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

function name.init(p0) --[[ line: 183 ]]
	-- upvalues: httpService (ref)
	local props = p0.props
	p0.state = {
		enableInputDelayed = false,
		analyticId = if props.analyticId then props.analyticId else httpService:GenerateGUID(false),
		isDelayedInput = props.isDelayedInput
	}
	
	function p0.closeModal() --[[ line: 193 ]]
		-- upvalues: p0 (ref)
		local props = p0.props
		p0:reportUserInput("Cancel")
		props.cancelPurchase()
		p0:closeCentralOverlay()
		p0:UnbindActions()
	end
end

function name.didMount(p1) --[[ line: 203 ]]
	-- upvalues: fFlagAddPerformanceMetricsToUnifiedPurchaseModal (ref), intervalPerformanceTracker (ref), fIntLegacyPurchaseFPSTrackingTimeout (ref), getTTIEventName (ref), productPurchaseSurface (ref), timeToInteractiveTracker (ref), fIntTTIUnifiedPurchaseSamplingRate (ref)
	if fFlagAddPerformanceMetricsToUnifiedPurchaseModal and (p1.props or {}).eventPrefix == "UACatalog" then
		intervalPerformanceTracker:startTracking("PurchaseModal_RobuxUpsellModalShown_Catalog", fIntLegacyPurchaseFPSTrackingTimeout, nil, true, true)
		intervalPerformanceTracker:startTracking("PurchaseModal_LegacyFlowRobuxUpsellModalShown_Catalog", fIntLegacyPurchaseFPSTrackingTimeout, nil, true, true)
		timeToInteractiveTracker.trackEnd(getTTIEventName(productPurchaseSurface.Catalog), {
			samplingRateOverride = fIntTTIUnifiedPurchaseSamplingRate
		})
	end
end

function name.didUpdate(p2, p3, _) --[[ line: 232 ]]
	local props = p2.props
	
	if p3.purchaseState ~= props.purchaseState then
		p2:reportModalShown()
		p2:dispatchCentralOverlayAndRenderModal(props)
	end
end

function name.UnbindActions(p4) --[[ line: 241 ]]
	-- upvalues: getEnableCentralOverlayForUpsellPromptModule (ref), contextActionService (ref), constantsModule (ref)
	if getEnableCentralOverlayForUpsellPromptModule() and p4.props.dispatchCentralOverlay then
		contextActionService:UnbindAction(constantsModule.CLOSE_MODAL_ACTION)
	end
end

function name.BindCancelAction(p5) --[[ line: 247 ]]
	-- upvalues: getEnableCentralOverlayForUpsellPromptModule (ref), contextActionService (ref), constantsModule (ref)
	if getEnableCentralOverlayForUpsellPromptModule() and p5.props.dispatchCentralOverlay then
		contextActionService:BindAction(constantsModule.CLOSE_MODAL_ACTION, p5.closeModal, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
	end
end

function name.closeCentralOverlay(p6) --[[ line: 263 ]]
	-- upvalues: getEnableCentralOverlayForUpsellPromptModule (ref)
	local props = p6.props
	
	if getEnableCentralOverlayForUpsellPromptModule() and props.dispatchCentralOverlay then
		props.dispatchCentralOverlay()
	end
end

function name.constructRobuxUpsellPromptAnimatorObj(p7) --[[ line: 271 ]]
	-- upvalues: robuxUpsellFlowStateModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagAddCenterDialogForUnifiedPurchaseModal (ref), getAppContextModule (ref), roactModule (ref), unifiedRobuxUpsellModalV2Module (ref), fFlagEnableDiscountInfoInUnifiedPurchaseModal (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), fFlagPurchasePromptFetchCartPricing (ref), unifiedRobuxUpsellModalModule (ref), fFlagEnableOffersOnInExperienceSurface (ref), overlayInGameMenuModule (ref), robuxUpsellModalMultiplePackageModule (ref), shouldShowNewUpsellModalExperimentModule (ref), desktopUpsellExperimentModule (ref), robuxUpsellModalModule (ref), robuxUpsellPromptModule (ref), fFlagMobilePopularItemBadgingExperimentEnabledModule (ref)
	local props = p7.props
	local state = p7.state
	p7:BindCancelAction()
	
	return {
		shouldAnimate = props.shouldAnimate,
		shouldShow = props.purchaseState == robuxUpsellFlowStateModule.PurchaseModal,
		skipAnimation = if fFlagEnableUnifiedProductPurchaseFlow then props.useUnifiedProductPurchaseModal else nil,
		onShown = if props.isDelayedInput then function() --[[ line: 283 ]]
			-- upvalues: p7 (ref), props (ref)
			p7:setState({ enableInputDelayed = true })
			delay(3, function() --[[ line: 287 ]]
				-- upvalues: p7 (copy), props (copy)
				p7:setState({ isDelayedInput = false, enableInputDelayed = false })
				
				if props.onDelayedInputComplete then
					props.onDelayedInputComplete()
				end
			end)
		end else nil,
		onHidden = if props.isDelayedInput then function() --[[ line: 297 ]]
			-- upvalues: p7 (ref), props (ref)
			p7:setState({
				enableInputDelayed = false,
				isDelayedInput = props.isDelayedInput
			})
		end else nil,
		renderChildren = function() --[[ line: 303 ]]
			-- upvalues: fFlagEnableUnifiedProductPurchaseFlow (copy), props (ref), fFlagAddCenterDialogForUnifiedPurchaseModal (copy), getAppContextModule (copy), roactModule (copy), unifiedRobuxUpsellModalV2Module (copy), fFlagEnableDiscountInfoInUnifiedPurchaseModal (copy), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), fFlagPurchasePromptFetchCartPricing (copy), p7 (ref), state (ref), unifiedRobuxUpsellModalModule (copy), fFlagEnableOffersOnInExperienceSurface (copy), overlayInGameMenuModule (copy), robuxUpsellModalMultiplePackageModule (copy), shouldShowNewUpsellModalExperimentModule (copy), desktopUpsellExperimentModule (copy), robuxUpsellModalModule (copy), robuxUpsellPromptModule (copy), fFlagMobilePopularItemBadgingExperimentEnabledModule (copy)
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
					buyItemActivated = function() --[[ line: 345 ]]
						-- upvalues: p7 (copy), props (copy)
						p7:reportUserInput("Buy")
						props.purchaseRobux()
						p7:closeCentralOverlay()
					end,
					buyItemControllerIcon = props.acceptControllerIcon,
					buyItemisDelayedInput = state.isDelayedInput,
					buyItemEnableInputDelayed = state.enableInputDelayed and getAppContextModule() == "IN_EXPERIENCE",
					cancelPurchaseActivated = function() --[[ line: 353 ]]
						-- upvalues: p7 (copy), props (copy)
						p7:reportUserInput("Cancel")
						props.cancelPurchase()
						p7:closeCentralOverlay()
					end,
					cancelControllerIcon = props.cancelControllerIcon
				},
				termsOfUseActivated = if props.showTermsOfUse then function() --[[ line: 360 ]]
					-- upvalues: p7 (copy), props (copy)
					p7:reportUserInput("TermsOfService")
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
					buyItemActivated = function() --[[ line: 398 ]]
						-- upvalues: p7 (copy), props (copy)
						p7:reportUserInput("Buy")
						props.purchaseRobux()
						p7:closeCentralOverlay()
					end,
					buyItemControllerIcon = props.acceptControllerIcon,
					buyItemisDelayedInput = state.isDelayedInput,
					buyItemEnableInputDelayed = state.enableInputDelayed and getAppContextModule() == "IN_EXPERIENCE",
					cancelPurchaseActivated = function() --[[ line: 408 ]]
						-- upvalues: p7 (copy), props (copy)
						p7:reportUserInput("Cancel")
						props.cancelPurchase()
						p7:closeCentralOverlay()
					end,
					cancelControllerIcon = props.cancelControllerIcon
				},
				termsOfUseActivated = if props.showTermsOfUse then function() --[[ line: 415 ]]
					-- upvalues: p7 (copy), props (copy)
					p7:reportUserInput("TermsOfService")
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
					buyItemActivated = function() --[[ line: 437 ]]
						-- upvalues: p7 (copy), props (copy)
						p7:reportUserInput("Buy")
						props.purchaseRobux()
						p7:closeCentralOverlay()
					end,
					buyItemControllerIcon = props.acceptControllerIcon,
					buyItemisDelayedInput = state.isDelayedInput,
					buyItemEnableInputDelayed = state.enableInputDelayed,
					cancelPurchaseActivated = function() --[[ line: 447 ]]
						-- upvalues: p7 (copy), props (copy)
						p7:reportUserInput("Cancel")
						props.cancelPurchase()
						p7:closeCentralOverlay()
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
					buyItemActivated = function() --[[ line: 475 ]]
						-- upvalues: p7 (copy), props (copy)
						p7:reportUserInput("Buy")
						props.purchaseRobux()
						p7:closeCentralOverlay()
					end,
					buyItemControllerIcon = props.acceptControllerIcon,
					buyItemisDelayedInput = state.isDelayedInput,
					buyItemEnableInputDelayed = state.enableInputDelayed,
					cancelPurchaseActivated = function() --[[ line: 485 ]]
						-- upvalues: p7 (copy), props (copy)
						p7:reportUserInput("Cancel")
						props.cancelPurchase()
						p7:closeCentralOverlay()
					end,
					cancelControllerIcon = props.cancelControllerIcon,
					opensBuyRobuxPage = desktopUpsellExperimentModule.getVariant() == desktopUpsellExperimentModule.variants.OpenRobuxStore
				},
				isQuest = props.isQuest,
				isVng = props.isVng,
				termsOfUseActivated = if props.showTermsOfUse then function() --[[ line: 496 ]]
					-- upvalues: p7 (copy), props (copy)
					p7:reportUserInput("TermsOfService")
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
				buyItemActivated = function() --[[ line: 520 ]]
					-- upvalues: p7 (copy), props (copy)
					p7:reportUserInput("Buy")
					props.purchaseRobux()
					p7:closeCentralOverlay()
				end,
				cancelPurchaseActivated = function() --[[ line: 525 ]]
					-- upvalues: p7 (copy), props (copy)
					p7:reportUserInput("Cancel")
					props.cancelPurchase()
					p7:closeCentralOverlay()
				end,
				termsOfUseActivated = if props.showTermsOfUse then function() --[[ line: 530 ]]
					-- upvalues: p7 (copy), props (copy)
					p7:reportUserInput("TermsOfService")
					props.showTermsOfUse()
				end else nil,
				isQuest = p7.props.isQuest,
				isVng = p7.props.isVng
			})
		end
	}
end

function name.constructU13ConfirmPromptAnimatorObj(p8) --[[ line: 541 ]]
	-- upvalues: robuxUpsellFlowStateModule (ref), roactModule (ref), u13ConfirmPromptModule (ref)
	local props = p8.props
	p8:BindCancelAction()
	
	return {
		shouldAnimate = props.shouldAnimate,
		shouldShow = props.purchaseState == robuxUpsellFlowStateModule.PurchaseWarning,
		renderChildren = function() --[[ line: 549 ]]
			-- upvalues: roactModule (copy), u13ConfirmPromptModule (copy), props (ref), p8 (ref)
			return roactModule.createElement(u13ConfirmPromptModule, {
				screenSize = props.screenSize,
				modalType = props.u13ConfirmType,
				doneControllerIcon = props.acceptControllerIcon,
				cancelControllerIcon = props.cancelControllerIcon,
				doneActivated = function() --[[ line: 558 ]]
					-- upvalues: p8 (copy), props (copy)
					p8:reportUserInput("Confirm")
					props.acceptPurchaseWarning()
					p8:closeCentralOverlay()
				end,
				cancelActivated = function() --[[ line: 563 ]]
					-- upvalues: p8 (copy), props (copy)
					p8:reportUserInput("Cancel")
					props.cancelPurchase()
					p8:closeCentralOverlay()
				end
			})
		end
	}
end

function name.constructPurchaseErrorPromptAnimatorObj(p9) --[[ line: 573 ]]
	-- upvalues: robuxUpsellFlowStateModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), purchaseErrorTypeModule (ref), fFlagAddCenterDialogForUnifiedPurchaseModal (ref), roactModule (ref), unifiedRobuxUpsellModalTooExpensiveV2Module (ref), unifiedRobuxUpsellModalTooExpensiveModule (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), shouldShowNewUpsellModalExperimentModule (ref), desktopUpsellExperimentModule (ref), robuxUpsellModalTooExpensiveFallbackModule (ref), purchaseErrorPromptModule (ref)
	local props = p9.props
	p9:BindCancelAction()
	
	return {
		shouldAnimate = props.shouldAnimate,
		shouldShow = props.purchaseState == robuxUpsellFlowStateModule.Error,
		renderChildren = function() --[[ line: 581 ]]
			-- upvalues: fFlagEnableUnifiedProductPurchaseFlow (copy), props (ref), purchaseErrorTypeModule (copy), fFlagAddCenterDialogForUnifiedPurchaseModal (copy), roactModule (copy), unifiedRobuxUpsellModalTooExpensiveV2Module (copy), p9 (ref), unifiedRobuxUpsellModalTooExpensiveModule (copy), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), shouldShowNewUpsellModalExperimentModule (copy), desktopUpsellExperimentModule (copy), robuxUpsellModalTooExpensiveFallbackModule (copy), purchaseErrorPromptModule (copy)
			return if fFlagEnableUnifiedProductPurchaseFlow and props.errorType == purchaseErrorTypeModule.NotEnoughRobuxInApp then if fFlagAddCenterDialogForUnifiedPurchaseModal then roactModule.createElement(unifiedRobuxUpsellModalTooExpensiveV2Module, {
				product = {
					model = props.model,
					itemIcon = props.itemIcon,
					itemName = props.itemName,
					itemRobuxCost = props.itemRobuxCost
				},
				balanceAmount = props.beforeRobuxBalance,
				buttons = {
					buyItemActivated = function() --[[ line: 598 ]]
						-- upvalues: p9 (copy), props (copy)
						p9:reportUserInput("Buy Robux")
						props.openBuyRobux()
						props.flowComplete()
						p9:closeCentralOverlay()
					end,
					cancelPurchaseActivated = function() --[[ line: 604 ]]
						-- upvalues: p9 (copy), props (copy)
						p9:reportUserInput("Cancel")
						props.flowComplete()
						p9:closeCentralOverlay()
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
					buyItemActivated = function() --[[ line: 629 ]]
						-- upvalues: p9 (copy), props (copy)
						p9:reportUserInput("Buy Robux")
						props.openBuyRobux()
						props.flowComplete()
						p9:closeCentralOverlay()
					end,
					cancelPurchaseActivated = function() --[[ line: 636 ]]
						-- upvalues: p9 (copy), props (copy)
						p9:reportUserInput("Cancel")
						props.flowComplete()
						p9:closeCentralOverlay()
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
				doneActivated = function() --[[ line: 662 ]]
					-- upvalues: p9 (copy), props (copy)
					p9:reportUserInput("Done")
					props.flowComplete()
					p9:closeCentralOverlay()
				end,
				doneControllerIcon = props.acceptControllerIcon,
				isQuest = props.isQuest,
				screenSize = props.screenSize
			}) else roactModule.createElement(purchaseErrorPromptModule, {
				screenSize = props.screenSize,
				errorType = props.errorType,
				economicRestrictionError = props.economicRestrictionError,
				doneControllerIcon = props.acceptControllerIcon,
				doneActivated = function() --[[ line: 680 ]]
					-- upvalues: p9 (copy), props (copy)
					p9:reportUserInput("Done")
					props.flowComplete()
					p9:closeCentralOverlay()
				end
			})
		end
	}
end

function name.constructTwoStepRequiredAnimatorObj(p10) --[[ line: 690 ]]
	-- upvalues: robuxUpsellFlowStateModule (ref), roactModule (ref), twoStepReqPromptModule (ref)
	local props = p10.props
	p10:BindCancelAction()
	
	return {
		shouldAnimate = props.shouldAnimate,
		shouldShow = props.purchaseState == robuxUpsellFlowStateModule.TwoStepRequired,
		renderChildren = function() --[[ line: 698 ]]
			-- upvalues: roactModule (copy), twoStepReqPromptModule (copy), props (ref), p10 (ref)
			return roactModule.createElement(twoStepReqPromptModule, {
				screenSize = props.screenSize,
				doneControllerIcon = props.acceptControllerIcon,
				openSecuritySettings = function() --[[ line: 704 ]]
					-- upvalues: p10 (copy), props (copy)
					p10:reportUserInput("GoToSecuritySettings")
					props.openSecuritySettings()
					props.flowComplete()
					p10:closeCentralOverlay()
				end,
				closePrompt = function() --[[ line: 710 ]]
					-- upvalues: p10 (copy), props (copy)
					p10:reportUserInput("Cancel")
					props.flowComplete()
					p10:closeCentralOverlay()
				end
			})
		end
	}
end

function name.constructRobuxUpsellSuccessPromptAnimatorObj(p11) --[[ line: 720 ]]
	-- upvalues: robuxUpsellFlowStateModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fixUnifiedUpsellCompletionModal (ref), getAppContextModule (ref), roactModule (ref), unifiedPurchaseCompletionModalV2Module (ref), unifiedPurchaseModalTypeEnumModule (ref), unifiedPurchaseCompletionModalModule (ref), robuxUpsellSuccessPromptModule (ref)
	local props = p11.props
	p11:BindCancelAction()
	
	return {
		shouldAnimate = props.shouldAnimate,
		shouldShow = props.purchaseState == robuxUpsellFlowStateModule.Success,
		renderChildren = function() --[[ line: 728 ]]
			-- upvalues: props (ref), fFlagEnableUnifiedProductPurchaseFlow (copy), fixUnifiedUpsellCompletionModal (copy), getAppContextModule (copy), roactModule (copy), unifiedPurchaseCompletionModalV2Module (copy), p11 (ref), unifiedPurchaseModalTypeEnumModule (copy), unifiedPurchaseCompletionModalModule (copy), robuxUpsellSuccessPromptModule (copy)
			local _ = 0
			local var41 = props.beforeRobuxBalance - props.itemRobuxCost
			
			return if not (not fFlagEnableUnifiedProductPurchaseFlow or not props.useUnifiedProductPurchaseModal) then if fixUnifiedUpsellCompletionModal and getAppContextModule() == "UA" then roactModule.createElement(unifiedPurchaseCompletionModalV2Module, {
				buttons = {
					onActivated = function() --[[ line: 739 ]]
						-- upvalues: p11 (copy), props (copy)
						p11:reportUserInput("Done")
						props.flowComplete()
						p11:closeCentralOverlay()
					end
				},
				isMultiItem = props.unifiedProductPurchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem,
				itemName = props.itemName
			}) else roactModule.createElement(unifiedPurchaseCompletionModalModule, {
				buttons = {
					onActivated = function() --[[ line: 751 ]]
						-- upvalues: p11 (copy), props (copy)
						p11:reportUserInput("Done")
						props.flowComplete()
						p11:closeCentralOverlay()
					end
				},
				isMultiItem = props.unifiedProductPurchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem,
				itemName = props.itemName
			}) else roactModule.createElement(robuxUpsellSuccessPromptModule, {
				screenSize = props.screenSize,
				model = props.model,
				itemIcon = props.itemIcon,
				itemName = props.itemName,
				balance = if var41 < 0 then var41 + props.iapRobuxAmount else var41,
				confirmControllerIcon = props.acceptControllerIcon,
				cancelControllerIcon = props.cancelControllerIcon,
				doneActivated = function() --[[ line: 770 ]]
					-- upvalues: p11 (copy), props (copy)
					p11:reportUserInput("Done")
					props.flowComplete()
					p11:closeCentralOverlay()
				end,
				equipActivated = if props.equipItem then function() --[[ line: 775 ]]
					-- upvalues: p11 (copy), props (copy)
					p11:reportUserInput("Equip")
					props.equipItem()
					p11:closeCentralOverlay()
				end else nil
			})
		end
	}
end

function name.constructInsufficientRobuxAnimatorObj(p12) --[[ line: 785 ]]
	-- upvalues: robuxUpsellFlowStateModule (ref), shouldShowNewUpsellModalExperimentModule (ref), desktopUpsellExperimentModule (ref), roactModule (ref), robuxUpsellModalTooExpensiveModule (ref), insufficientRobuxPromptModule (ref)
	local props = p12.props
	p12:BindCancelAction()
	
	return {
		shouldAnimate = props.shouldAnimate,
		shouldShow = props.purchaseState == robuxUpsellFlowStateModule.GenericPurchaseModal,
		renderChildren = function() --[[ line: 793 ]]
			-- upvalues: shouldShowNewUpsellModalExperimentModule (copy), desktopUpsellExperimentModule (copy), roactModule (copy), robuxUpsellModalTooExpensiveModule (copy), props (ref), p12 (ref), insufficientRobuxPromptModule (copy)
			return if shouldShowNewUpsellModalExperimentModule() or desktopUpsellExperimentModule.shouldShowNewModal() then roactModule.createElement(robuxUpsellModalTooExpensiveModule, {
				product = {
					model = props.model,
					itemIcon = props.itemIcon,
					itemName = props.itemName,
					itemRobuxCost = props.itemRobuxCost
				},
				balanceAmount = props.beforeRobuxBalance,
				buttons = {
					buyItemActivated = function() --[[ line: 805 ]]
						-- upvalues: p12 (copy), props (copy)
						p12:reportUserInput("Buy Robux")
						props.openBuyRobux()
						props.flowComplete()
						p12:closeCentralOverlay()
					end,
					buyItemControllerIcon = props.acceptControllerIcon,
					cancelPurchaseActivated = function() --[[ line: 813 ]]
						-- upvalues: p12 (copy), props (copy)
						p12:reportUserInput("Cancel")
						props.flowComplete()
						p12:closeCentralOverlay()
					end,
					cancelControllerIcon = props.cancelControllerIcon
				},
				isQuest = props.isQuest,
				screenSize = props.screenSize
			}) else roactModule.createElement(insufficientRobuxPromptModule, {
				screenSize = props.screenSize,
				robuxBalance = props.beforeRobuxBalance,
				buyRobux = function() --[[ line: 829 ]]
					-- upvalues: p12 (copy), props (copy)
					p12:reportUserInput("Buy Robux")
					props.openBuyRobux()
					props.flowComplete()
					p12:closeCentralOverlay()
				end,
				closePrompt = function() --[[ line: 835 ]]
					-- upvalues: p12 (copy), props (copy)
					p12:reportUserInput("Cancel")
					props.flowComplete()
					p12:closeCentralOverlay()
				end
			})
		end
	}
end

function name.constructInsufficientRobuxProductAnimatorObj(p13) --[[ line: 845 ]]
	-- upvalues: robuxUpsellFlowStateModule (ref), roactModule (ref), insufficientRobuxProductPromptModule (ref)
	local props = p13.props
	p13:BindCancelAction()
	
	return {
		shouldAnimate = props.shouldAnimate,
		shouldShow = props.purchaseState == robuxUpsellFlowStateModule.LargeRobuxPurchaseModal,
		renderChildren = function() --[[ line: 853 ]]
			-- upvalues: roactModule (copy), insufficientRobuxProductPromptModule (copy), props (ref), p13 (ref)
			return roactModule.createElement(insufficientRobuxProductPromptModule, {
				screenSize = props.screenSize,
				model = props.model,
				itemIcon = props.itemIcon,
				itemName = props.itemName,
				itemRobuxCost = props.itemRobuxCost,
				balanceAmount = props.beforeRobuxBalance,
				acceptControllerIcon = props.acceptControllerIcon,
				cancelControllerIcon = props.cancelControllerIcon,
				robuxStoreActivated = function() --[[ line: 866 ]]
					-- upvalues: p13 (copy), props (copy)
					p13:reportUserInput("Go to Robux store")
					props.openBuyRobux()
					p13:closeCentralOverlay()
				end,
				cancelPurchaseActivated = function() --[[ line: 871 ]]
					-- upvalues: p13 (copy), props (copy)
					p13:reportUserInput("Cancel")
					props.flowComplete()
					p13:closeCentralOverlay()
				end
			})
		end
	}
end

function name.constructLeaveRobloxPromptAnimatorObj(p14) --[[ line: 881 ]]
	-- upvalues: robuxUpsellFlowStateModule (ref), roactModule (ref), leaveRobloxPromptModule (ref)
	local props = p14.props
	p14:BindCancelAction()
	
	return {
		shouldAnimate = props.shouldAnimate,
		shouldShow = props.purchaseState == robuxUpsellFlowStateModule.LeaveRobloxWarning,
		renderChildren = function() --[[ line: 889 ]]
			-- upvalues: roactModule (copy), leaveRobloxPromptModule (copy), props (ref), p14 (ref)
			return roactModule.createElement(leaveRobloxPromptModule, {
				screenSize = props.screenSize,
				cancelActivated = function() --[[ line: 893 ]]
					-- upvalues: p14 (copy)
					p14:closeCentralOverlay()
				end,
				continueActivated = function() --[[ line: 896 ]]
					-- upvalues: props (copy)
					props.openVngShop()
				end
			})
		end
	}
end

function name.constructPurchaseVPCPromptAnimatorObj(p15) --[[ line: 904 ]]
	-- upvalues: robuxUpsellFlowStateModule (ref), roactModule (ref), verifiedParentalConsentDialog (ref)
	local props = p15.props
	p15:BindCancelAction()
	
	return {
		shouldAnimate = props.shouldAnimate,
		shouldShow = props.purchaseState == robuxUpsellFlowStateModule.PurchaseVPCModal,
		renderChildren = function() --[[ line: 912 ]]
			-- upvalues: roactModule (copy), verifiedParentalConsentDialog (copy), props (ref), p15 (ref)
			return roactModule.createElement(verifiedParentalConsentDialog, {
				screenSize = props.screenSize,
				isActionable = props.openSettingsPage ~= nil,
				modalType = props.purchaseVPCType,
				onAction = props.openSettingsPage and function() --[[ line: 917 ]]
					-- upvalues: p15 (copy), props (copy)
					p15:reportUserInput("Confirm")
					props.openSettingsPage()
					props.flowComplete()
				end,
				onDismiss = function() --[[ line: 922 ]]
					-- upvalues: p15 (copy), props (copy)
					p15:reportUserInput("Cancel")
					props.cancelPurchase()
					p15:closeCentralOverlay()
				end
			})
		end
	}
end

function name.dispatchCentralOverlayAndRenderModal(p16, p17) --[[ line: 934 ]]
	-- upvalues: getEnableCentralOverlayForUpsellPromptModule (ref), robuxUpsellFlowStateModule (ref), constantsModule (ref)
	if not getEnableCentralOverlayForUpsellPromptModule() or not p17.dispatchCentralOverlay then return end
	local purchaseState = p17.purchaseState
	
	if purchaseState == robuxUpsellFlowStateModule.PurchaseModal then
		p17.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p16:constructRobuxUpsellPromptAnimatorObj())
		
		return
	elseif purchaseState == robuxUpsellFlowStateModule.PurchaseWarning then
		p17.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p16:constructU13ConfirmPromptAnimatorObj())
	end
	if purchaseState == robuxUpsellFlowStateModule.Error then
		p17.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p16:constructPurchaseErrorPromptAnimatorObj())
	end
	if purchaseState == robuxUpsellFlowStateModule.TwoStepRequired then
		p17.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p16:constructTwoStepRequiredAnimatorObj())
	end
	if purchaseState == robuxUpsellFlowStateModule.Success then
		p17.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p16:constructRobuxUpsellSuccessPromptAnimatorObj())
	end
	if purchaseState == robuxUpsellFlowStateModule.GenericPurchaseModal then
		p17.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p16:constructInsufficientRobuxAnimatorObj())
	end
	if purchaseState == robuxUpsellFlowStateModule.LargeRobuxPurchaseModal then
		p17.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p16:constructInsufficientRobuxProductAnimatorObj())
	end
	if purchaseState == robuxUpsellFlowStateModule.LeaveRobloxWarning then
		p17.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p16:constructLeaveRobloxPromptAnimatorObj())
	end
	if purchaseState == robuxUpsellFlowStateModule.PurchaseVPCModal then
		p17.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p16:constructPurchaseVPCPromptAnimatorObj())
	end
end

function name.reportModalShown(p18) --[[ line: 1015 ]]
	-- upvalues: getModalShownEventDataModule (ref), robuxUpsellFlowStateModule (ref), httpService (ref)
	local props = p18.props
	local state = p18.state
	
	if p18.props.onAnalyticEvent then
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

function name.reportUserInput(p19, p20) --[[ line: 1044 ]]
	-- upvalues: getUserInputEventDataModule (ref), robuxUpsellFlowStateModule (ref), httpService (ref), playersService (ref), default (ref), inGameRobuxUpsellEventModule (ref)
	local props = p19.props
	local var42 = getUserInputEventDataModule(p19.state.analyticId, props.eventPrefix, "RobuxUpsell", robuxUpsellFlowStateModule.toRawValue(props.purchaseState), p20, httpService:JSONEncode({
		universe_id = tostring(game.GameId),
		item_product_id = tostring(props.itemProductId),
		item_name = props.itemName,
		price = tostring(props.itemRobuxCost),
		user_balance = tostring(props.beforeRobuxBalance) or nil,
		package_robux_amount = tostring(props.iapRobuxAmount) or nil,
		package_cost = props.iapCostStr or nil
	}))
	
	if not game:GetFastFlag("DisableNonSchematizedInGameRobuxUpsellEvent") and p19.props.onAnalyticEvent then
		props.onAnalyticEvent("UserPurchaseFlow", var42)
	end
	if game:GetFastFlag("EnableSchematizedInGameRobuxUpsellEvent2") then
		default:logRobloxTelemetryEvent(inGameRobuxUpsellEventModule, {
			default.StandardizedFields.addOsInfo,
			default.StandardizedFields.addSessionId
		}, {
			universe_id = game.GameId,
			price = props.itemRobuxCost,
			view_name = var42.view_name,
			purchase_event_type = var42.purchase_event_type,
			input_type = p20,
			user_id = tostring(if playersService.LocalPlayer and playersService.LocalPlayer.UserId > 0 then playersService.LocalPlayer.UserId else nil)
		})
	end
end

function name.purchaseStateToOverlayState(_, p21) --[[ line: 1090 ]]
	-- upvalues: robuxUpsellFlowStateModule (ref), loadingOverlayStateModule (ref)
	return if p21 == robuxUpsellFlowStateModule.Loading then loadingOverlayStateModule.Loading elseif p21 == robuxUpsellFlowStateModule.RobuxPurchasePending then loadingOverlayStateModule.PurchasingRobux elseif p21 == robuxUpsellFlowStateModule.RobuxGrantPending then loadingOverlayStateModule.WaitingForRobux elseif p21 == robuxUpsellFlowStateModule.ItemPurchasePending then loadingOverlayStateModule.PurchasingItem elseif p21 == robuxUpsellFlowStateModule.None then nil else loadingOverlayStateModule.None
end

function name.getChildrenElements(p22) --[[ line: 1107 ]]
	-- upvalues: roactModule (ref), animatorModule (ref)
	return {
		RobuxUpsellPromptAnimator = roactModule.createElement(animatorModule, p22:constructRobuxUpsellPromptAnimatorObj()),
		U13ConfirmPromptAnimator = roactModule.createElement(animatorModule, p22:constructU13ConfirmPromptAnimatorObj()),
		PurchaseErrorPromptAnimator = roactModule.createElement(animatorModule, p22:constructPurchaseErrorPromptAnimatorObj()),
		TwoStepRequiredAnimator = roactModule.createElement(animatorModule, p22:constructTwoStepRequiredAnimatorObj()),
		RobuxUpsellSuccessPromptAnimator = roactModule.createElement(animatorModule, p22:constructRobuxUpsellSuccessPromptAnimatorObj()),
		InsufficientRobuxAnimator = roactModule.createElement(animatorModule, p22:constructInsufficientRobuxAnimatorObj()),
		InsufficientRobuxProductAnimator = roactModule.createElement(animatorModule, p22:constructInsufficientRobuxProductAnimatorObj()),
		PurchaseVPCPromptAnimator = roactModule.createElement(animatorModule, p22:constructPurchaseVPCPromptAnimatorObj())
	}
end

function name.render(p23) --[[ line: 1126 ]]
	-- upvalues: getEnableCentralOverlayForUpsellPromptModule (ref), roactModule (ref), loadingOverlayModule (ref)
	local props = p23.props
	
	return roactModule.createElement(loadingOverlayModule, {
		shouldAnimate = props.shouldAnimate,
		loadingState = p23:purchaseStateToOverlayState(props.purchaseState)
	}, if not (getEnableCentralOverlayForUpsellPromptModule() and props.dispatchCentralOverlay) then p23:getChildrenElements() else {})
end

return name