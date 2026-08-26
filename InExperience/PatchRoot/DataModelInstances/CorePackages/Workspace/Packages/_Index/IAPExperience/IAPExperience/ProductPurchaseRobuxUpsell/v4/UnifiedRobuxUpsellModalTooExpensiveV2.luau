local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local orientation = foundationModule.Enums.Orientation
local localizationService = game:GetService("LocalizationService")
local localization = require(parent_1.AppLocales).Localization
local localizationModule = require(parent_1.Localization)
local localizationProvider = localizationModule.LocalizationProvider
local useLocalization = localizationModule.Hooks.useLocalization
local unifiedProductDetailsModule = require(parent.Generic.UnifiedProductDetails)
local priceSummaryModule = require(parent.Generic.PriceSummary)
local unifiedPurchaseModalTypeEnumModule = require(parent.Enums.UnifiedPurchaseModalTypeEnum)
local loggerModule = require(parent.Utility.logger)
local getAppContextModule = require(parent.Utility.getAppContext)
local default = require(parent_1.LoggingProtocol).default
local tooExpensiveUnifiedUpsellShownCounter = require(parent.Generic.Events.TooExpensiveUpsellCounter).TooExpensiveUnifiedUpsellShownCounter
local useFocusNavigationRefsModule = require(parent.Generic.Hooks.useFocusNavigationRefs)

local function UnifiedRobuxUpsellModalTooExpensiveV2(p1)
	-- upvalues: useLocalization (ref), useFocusNavigationRefsModule (ref), reactModule (ref), loggerModule (ref), getAppContextModule (ref), default (ref), tooExpensiveUnifiedUpsellShownCounter (ref), dialog (ref), dialogSize (ref), view (ref), unifiedPurchaseModalTypeEnumModule (ref), priceSummaryModule (ref), unifiedProductDetailsModule (ref), orientation (ref), buttonVariant (ref), foundationModule (ref)
	local var1 = useLocalization({
		NeedMoreRobux = "IAPExperience.RobuxUpsell.Text.NeedMoreRobux",
		ButtonCancel = "IAPExperience.InsufficientRobux.Action.Cancel",
		BuyRobux = "IAPExperience.InsufficientRobux.Action.BuyRobux"
	})
	local _ = nil
	local _ = nil
	local var2, var3 = useFocusNavigationRefsModule(p1.buttons.cancelPurchaseActivated, nil)
	reactModule.useEffect(function()
		-- upvalues: loggerModule (copy), p1 (ref), getAppContextModule (copy), default (copy), tooExpensiveUnifiedUpsellShownCounter (copy)
		loggerModule.debug({
			message = "Too Expensive Unified Upsell Modal Shown (Dialog)",
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
	
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		size = dialogSize.Medium,
		onClose = p1.buttons.cancelPurchaseActivated,
		ref = var2
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var1.NeedMoreRobux }),
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			ContentView = reactModule.createElement(view, {
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
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = orientation.Horizontal,
			actions = {
				{
					isDisabled = false,
					text = var1.BuyRobux,
					onActivated = p1.buttons.buyItemActivated,
					variant = buttonVariant.Emphasis,
					icon = foundationModule.Enums.IconName.ArrowUpRightFromSquare,
					ref = var3
				}
			}
		})
	})
end

return function(p1)
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), UnifiedRobuxUpsellModalTooExpensiveV2 (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		RobuxUpsellModalTooExpensiveV2 = reactModule.createElement(UnifiedRobuxUpsellModalTooExpensiveV2, p1)
	})
end