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

local function UnifiedRobuxUpsellModalTooExpensiveV2(p0) --[[ line: 63 ]]
	-- upvalues: useLocalization (ref), useFocusNavigationRefsModule (ref), reactModule (ref), loggerModule (ref), getAppContextModule (ref), default (ref), tooExpensiveUnifiedUpsellShownCounter (ref), dialog (ref), dialogSize (ref), view (ref), unifiedPurchaseModalTypeEnumModule (ref), priceSummaryModule (ref), unifiedProductDetailsModule (ref), orientation (ref), buttonVariant (ref), foundationModule (ref)
	local var11 = useLocalization({
		NeedMoreRobux = "IAPExperience.RobuxUpsell.Text.NeedMoreRobux",
		ButtonCancel = "IAPExperience.InsufficientRobux.Action.Cancel",
		BuyRobux = "IAPExperience.InsufficientRobux.Action.BuyRobux"
	})
	local _ = nil
	local _ = nil
	local var12, var13 = useFocusNavigationRefsModule(p0.buttons.cancelPurchaseActivated, nil)
	reactModule.useEffect(function() --[[ line: 73 ]]
		-- upvalues: loggerModule (copy), p0 (ref), getAppContextModule (copy), default (copy), tooExpensiveUnifiedUpsellShownCounter (copy)
		loggerModule.debug({
			message = "Too Expensive Unified Upsell Modal Shown (Dialog)",
			screenHeight = p0.screenSize.Y,
			screenWidth = p0.screenSize.X,
			portrait = p0.screenSize.X < p0.screenSize.Y,
			appContext = getAppContextModule()
		})
		default:logRobloxTelemetryCounter(tooExpensiveUnifiedUpsellShownCounter, 1, {
			screenHeight = p0.screenSize.Y,
			screenWidth = p0.screenSize.X,
			portrait = p0.screenSize.X < p0.screenSize.Y,
			appContext = getAppContextModule()
		})
	end, {})
	
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		size = dialogSize.Medium,
		onClose = p0.buttons.cancelPurchaseActivated,
		ref = var12
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var11.NeedMoreRobux }),
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			ContentView = reactModule.createElement(view, {
				tag = "col gap-medium auto-y size-full-0 align-x-center align-y-start padding-bottom-medium"
			}, {
				ProductDetails = if p0.purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then reactModule.createElement(priceSummaryModule, { amount = p0.product.itemRobuxCost }) else reactModule.createElement(unifiedProductDetailsModule, {
					layoutOrder = 1,
					isPortrait = p0.screenSize.X < p0.screenSize.Y,
					model = p0.product.model,
					itemIcon = p0.product.itemIcon,
					itemName = p0.product.itemName,
					itemRobuxCost = p0.product.itemRobuxCost
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = orientation.Horizontal,
			actions = {
				{
					isDisabled = false,
					text = var11.BuyRobux,
					onActivated = p0.buttons.buyItemActivated,
					variant = buttonVariant.Emphasis,
					icon = foundationModule.Enums.IconName.ArrowUpRightFromSquare,
					ref = var13
				}
			}
		})
	})
end

return function(p1) --[[ line: 133 | named "UnifiedRobuxUpsellModalTooExpensiveV2Container" ]]
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), UnifiedRobuxUpsellModalTooExpensiveV2 (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		RobuxUpsellModalTooExpensiveV2 = reactModule.createElement(UnifiedRobuxUpsellModalTooExpensiveV2, p1)
	})
end