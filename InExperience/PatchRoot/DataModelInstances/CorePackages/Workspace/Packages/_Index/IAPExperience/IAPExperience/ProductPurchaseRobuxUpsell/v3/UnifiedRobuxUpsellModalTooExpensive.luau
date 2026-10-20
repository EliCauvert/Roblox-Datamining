local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local Button = FoundationModule.Button
local Sheet = FoundationModule.Sheet
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local LocalizationService = game:GetService("LocalizationService")
local Localization = require(Parent1.AppLocales).Localization
local LocalizationModule = require(Parent1.Localization)
local LocalizationProvider = LocalizationModule.LocalizationProvider
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UnifiedProductDetailsModule = require(Parent.Generic.UnifiedProductDetails)
local PriceSummaryModule = require(Parent.Generic.PriceSummary)
local UnifiedPurchaseModalHeaderModule = require(Parent.Generic.UnifiedPurchaseModalHeader)
local UnifiedPurchaseModalTypeEnumModule = require(Parent.Enums.UnifiedPurchaseModalTypeEnum)
local LoggerModule = require(Parent.Utility.logger)
local GetAppContextModule = require(Parent.Utility.getAppContext)
local Default = require(Parent1.LoggingProtocol).default
local TooExpensiveUnifiedUpsellShownCounter = require(Parent.Generic.Events.TooExpensiveUpsellCounter).TooExpensiveUnifiedUpsellShownCounter
local UseFocusNavigationRefsModule = require(Parent.Generic.Hooks.useFocusNavigationRefs)
local UseInitialButtonDisableDelayModule = require(Parent.Generic.Hooks.useInitialButtonDisableDelay)
local UNIFIEDROBUXUPSELLMODALTOOEXPENSIVEMINHEIGHTPIXELS = require(Parent.Generic.Constants).UNIFIED_ROBUX_UPSELL_MODAL_TOO_EXPENSIVE_MIN_HEIGHT_PIXELS
local FFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(Parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements

local function UnifiedRobuxUpsellModalTooExpensive(p1)
	-- upvalues: UseLocalizationFunction (copy), UseFocusNavigationRefsModule (copy), UseInitialButtonDisableDelayModule (copy), ReactModule (copy), LoggerModule (copy), GetAppContextModule (copy), Default (copy), TooExpensiveUnifiedUpsellShownCounter (copy), Sheet (copy), UseScaledValueFunction (copy), UNIFIEDROBUXUPSELLMODALTOOEXPENSIVEMINHEIGHTPIXELS (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), UnifiedPurchaseModalHeaderModule (copy), View (copy), UnifiedPurchaseModalTypeEnumModule (copy), PriceSummaryModule (copy), UnifiedProductDetailsModule (copy), Button (copy), FillBehavior (copy), ButtonVariant (copy), FoundationModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		NeedMoreRobux = "IAPExperience.RobuxUpsell.Text.NeedMoreRobux",
		ButtonCancel = "IAPExperience.InsufficientRobux.Action.Cancel",
		BuyRobux = "IAPExperience.InsufficientRobux.Action.BuyRobux"
	})
	local UseFocusNavigationRefsModuleResult, UseFocusNavigationRefsModuleResult2 = UseFocusNavigationRefsModule(p1.buttons.cancelPurchaseActivated, nil)
	local UseInitialButtonDisableDelayModuleResult = UseInitialButtonDisableDelayModule()
	ReactModule.useEffect(function()
		-- upvalues: LoggerModule (upval), p1 (copy), GetAppContextModule (upval), Default (upval), TooExpensiveUnifiedUpsellShownCounter (upval)
		LoggerModule.debug({
			message = "Too Expensive Unified Upsell Modal Shown",
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y,
			appContext = GetAppContextModule()
		})
		Default:logRobloxTelemetryCounter(TooExpensiveUnifiedUpsellShownCounter, 1, {
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y,
			appContext = GetAppContextModule()
		})
	end, {})
	
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		onClose = p1.buttons.cancelPurchaseActivated,
		snapPoints = {
			UseScaledValueFunction(UNIFIEDROBUXUPSELLMODALTOOEXPENSIVEMINHEIGHTPIXELS),
			0.8
		},
		ref = if UseInitialButtonDisableDelayModuleResult then nil else UseFocusNavigationRefsModuleResult
	}, {
		Header = ReactModule.createElement(Sheet.Header, {
			hasCloseAffordance = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements and p1.hideUserRobuxBalance then true else nil
		}, {
			ModalHeader = ReactModule.createElement(UnifiedPurchaseModalHeaderModule, {
				titleText = UseLocalizationResult.NeedMoreRobux,
				robuxBalanceAmount = p1.balanceAmount,
				hideUserRobuxBalance = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then p1.hideUserRobuxBalance else nil
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = ReactModule.createElement(View, {
				tag = "col gap-medium auto-y size-full-0 align-x-center align-y-start padding-bottom-medium"
			}, {
				ProductDetails = if p1.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.MultiItem then ReactModule.createElement(PriceSummaryModule, { amount = p1.product.itemRobuxCost }) else ReactModule.createElement(UnifiedProductDetailsModule, {
					layoutOrder = 1,
					isPortrait = p1.screenSize.X < p1.screenSize.Y,
					model = p1.product.model,
					itemIcon = p1.product.itemIcon,
					itemName = p1.product.itemName,
					itemRobuxCost = p1.product.itemRobuxCost
				})
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, { LayoutOrder = 3 }, {
			if p1.isQuest then ReactModule.createElement(Button, {
				text = UseLocalizationResult.ButtonCancel,
				onActivated = p1.buttons.cancelPurchaseActivated,
				fillBehavior = FillBehavior.Fill,
				variant = ButtonVariant.Standard
			}) else ReactModule.createElement(Button, {
				text = UseLocalizationResult.BuyRobux,
				onActivated = p1.buttons.buyItemActivated,
				fillBehavior = FillBehavior.Fill,
				variant = ButtonVariant.Emphasis,
				icon = FoundationModule.Enums.IconName.ArrowUpRightFromSquare,
				isDisabled = UseInitialButtonDisableDelayModuleResult,
				ref = UseFocusNavigationRefsModuleResult2
			})
		})
	})
end

return function(p2)
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), UnifiedRobuxUpsellModalTooExpensive (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		RobuxUpsellModalTooExpensive = ReactModule.createElement(UnifiedRobuxUpsellModalTooExpensive, p2)
	})
end