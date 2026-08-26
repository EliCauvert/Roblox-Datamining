local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local button = foundationModule.Button
local sheet = foundationModule.Sheet
local useScaledValue = foundationModule.Hooks.useScaledValue
local localizationService = game:GetService("LocalizationService")
local localization = require(parent_1.AppLocales).Localization
local localizationModule = require(parent_1.Localization)
local localizationProvider = localizationModule.LocalizationProvider
local useLocalization = localizationModule.Hooks.useLocalization
local unifiedProductDetailsModule = require(parent.Generic.UnifiedProductDetails)
local priceSummaryModule = require(parent.Generic.PriceSummary)
local unifiedPurchaseModalHeaderModule = require(parent.Generic.UnifiedPurchaseModalHeader)
local unifiedPurchaseModalTypeEnumModule = require(parent.Enums.UnifiedPurchaseModalTypeEnum)
local loggerModule = require(parent.Utility.logger)
local getAppContextModule = require(parent.Utility.getAppContext)
local default = require(parent_1.LoggingProtocol).default
local tooExpensiveUnifiedUpsellShownCounter = require(parent.Generic.Events.TooExpensiveUpsellCounter).TooExpensiveUnifiedUpsellShownCounter
local useFocusNavigationRefsModule = require(parent.Generic.Hooks.useFocusNavigationRefs)
local useInitialButtonDisableDelayModule = require(parent.Generic.Hooks.useInitialButtonDisableDelay)
local UNIFIED_ROBUX_UPSELL_MODAL_TOO_EXPENSIVE_MIN_HEIGHT_PIXELS = require(parent.Generic.Constants).UNIFIED_ROBUX_UPSELL_MODAL_TOO_EXPENSIVE_MIN_HEIGHT_PIXELS
local fFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements

local function UnifiedRobuxUpsellModalTooExpensive(p1)
	-- upvalues: useLocalization (ref), useFocusNavigationRefsModule (ref), useInitialButtonDisableDelayModule (ref), reactModule (ref), loggerModule (ref), getAppContextModule (ref), default (ref), tooExpensiveUnifiedUpsellShownCounter (ref), sheet (ref), useScaledValue (ref), UNIFIED_ROBUX_UPSELL_MODAL_TOO_EXPENSIVE_MIN_HEIGHT_PIXELS (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), unifiedPurchaseModalHeaderModule (ref), view (ref), unifiedPurchaseModalTypeEnumModule (ref), priceSummaryModule (ref), unifiedProductDetailsModule (ref), button (ref), fillBehavior (ref), buttonVariant (ref), foundationModule (ref)
	local var1 = useLocalization({
		NeedMoreRobux = "IAPExperience.RobuxUpsell.Text.NeedMoreRobux",
		ButtonCancel = "IAPExperience.InsufficientRobux.Action.Cancel",
		BuyRobux = "IAPExperience.InsufficientRobux.Action.BuyRobux"
	})
	local var2, var3 = useFocusNavigationRefsModule(p1.buttons.cancelPurchaseActivated, nil)
	local var4 = useInitialButtonDisableDelayModule()
	reactModule.useEffect(function()
		-- upvalues: loggerModule (copy), p1 (ref), getAppContextModule (copy), default (copy), tooExpensiveUnifiedUpsellShownCounter (copy)
		loggerModule.debug({
			message = "Too Expensive Unified Upsell Modal Shown",
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y,
			appContext = getAppContextModule()
		})
		default:logRobloxTelemetryCounter(tooExpensiveUnifiedUpsellShownCounter, 1, {
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y,
			appContext = getAppContextModule()
		})
	end, {})
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		onClose = p1.buttons.cancelPurchaseActivated,
		snapPoints = {
			useScaledValue(UNIFIED_ROBUX_UPSELL_MODAL_TOO_EXPENSIVE_MIN_HEIGHT_PIXELS),
			0.8
		},
		ref = if var4 then nil else var2
	}, {
		Header = reactModule.createElement(sheet.Header, {
			hasCloseAffordance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then if p1.hideUserRobuxBalance then true else nil else nil
		}, {
			ModalHeader = reactModule.createElement(unifiedPurchaseModalHeaderModule, {
				titleText = var1.NeedMoreRobux,
				robuxBalanceAmount = p1.balanceAmount,
				hideUserRobuxBalance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then p1.hideUserRobuxBalance else nil
			})
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = reactModule.createElement(view, {
				tag = "col gap-medium auto-y size-full-0 align-x-center align-y-start padding-bottom-medium"
			}, {
				ProductDetails = if p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then reactModule.createElement(priceSummaryModule, { amount = p1.product.itemRobuxCost }) else reactModule.createElement(unifiedProductDetailsModule, {
					layoutOrder = 1,
					isPortrait = p1.screenSize.X < p1.screenSize.Y,
					model = p1.product.model,
					itemIcon = p1.product.itemIcon,
					itemName = p1.product.itemName,
					itemRobuxCost = p1.product.itemRobuxCost
				})
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 3 }, {
			if p1.isQuest then reactModule.createElement(button, {
				text = var1.ButtonCancel,
				onActivated = p1.buttons.cancelPurchaseActivated,
				fillBehavior = fillBehavior.Fill,
				variant = buttonVariant.Standard
			}) else reactModule.createElement(button, {
				text = var1.BuyRobux,
				onActivated = p1.buttons.buyItemActivated,
				fillBehavior = fillBehavior.Fill,
				variant = buttonVariant.Emphasis,
				icon = foundationModule.Enums.IconName.ArrowUpRightFromSquare,
				isDisabled = var4,
				ref = var3
			})
		})
	})
end

return function(p2)
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), UnifiedRobuxUpsellModalTooExpensive (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		RobuxUpsellModalTooExpensive = reactModule.createElement(UnifiedRobuxUpsellModalTooExpensive, p2)
	})
end