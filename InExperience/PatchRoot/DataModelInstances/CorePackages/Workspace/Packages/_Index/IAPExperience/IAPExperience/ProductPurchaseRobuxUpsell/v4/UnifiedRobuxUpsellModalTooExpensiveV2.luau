local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local Orientation = FoundationModule.Enums.Orientation
local LocalizationService = game:GetService("LocalizationService")
local Localization = require(Parent1.AppLocales).Localization
local LocalizationModule = require(Parent1.Localization)
local LocalizationProvider = LocalizationModule.LocalizationProvider
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UnifiedProductDetailsModule = require(Parent.Generic.UnifiedProductDetails)
local PriceSummaryModule = require(Parent.Generic.PriceSummary)
local UnifiedPurchaseModalTypeEnumModule = require(Parent.Enums.UnifiedPurchaseModalTypeEnum)
local LoggerModule = require(Parent.Utility.logger)
local GetAppContextModule = require(Parent.Utility.getAppContext)
local Default = require(Parent1.LoggingProtocol).default
local TooExpensiveUnifiedUpsellShownCounter = require(Parent.Generic.Events.TooExpensiveUpsellCounter).TooExpensiveUnifiedUpsellShownCounter
local UseFocusNavigationRefsModule = require(Parent.Generic.Hooks.useFocusNavigationRefs)

local function UnifiedRobuxUpsellModalTooExpensiveV2(p1) --[[ Line: 63 ]]
	-- upvalues: UseLocalizationFunction (copy), UseFocusNavigationRefsModule (copy), ReactModule (copy), LoggerModule (copy), GetAppContextModule (copy), Default (copy), TooExpensiveUnifiedUpsellShownCounter (copy), Dialog (copy), DialogSize (copy), View (copy), UnifiedPurchaseModalTypeEnumModule (copy), PriceSummaryModule (copy), UnifiedProductDetailsModule (copy), Orientation (copy), ButtonVariant (copy), FoundationModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		NeedMoreRobux = "IAPExperience.RobuxUpsell.Text.NeedMoreRobux",
		ButtonCancel = "IAPExperience.InsufficientRobux.Action.Cancel",
		BuyRobux = "IAPExperience.InsufficientRobux.Action.BuyRobux"
	})
	local UseFocusNavigationRefsModuleResult, UseFocusNavigationRefsModuleResult2 = UseFocusNavigationRefsModule(p1.buttons.cancelPurchaseActivated, nil)
	ReactModule.useEffect(function() --[[ Line: 73 ]]
		-- upvalues: LoggerModule (upval), p1 (copy), GetAppContextModule (upval), Default (upval), TooExpensiveUnifiedUpsellShownCounter (upval)
		LoggerModule.debug({
			message = "Too Expensive Unified Upsell Modal Shown (Dialog)",
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
	
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		size = DialogSize.Medium,
		onClose = p1.buttons.cancelPurchaseActivated,
		ref = UseFocusNavigationRefsModuleResult
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = UseLocalizationResult.NeedMoreRobux }),
		DialogContent = ReactModule.createElement(Dialog.Content, nil, {
			ContentView = ReactModule.createElement(View, {
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
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			orientation = Orientation.Horizontal,
			actions = {
				{
					isDisabled = false,
					text = UseLocalizationResult.BuyRobux,
					onActivated = p1.buttons.buyItemActivated,
					variant = ButtonVariant.Emphasis,
					icon = FoundationModule.Enums.IconName.ArrowUpRightFromSquare,
					ref = UseFocusNavigationRefsModuleResult2
				}
			}
		})
	})
end

return function(p1) --[[ Line: 133 | Named "UnifiedRobuxUpsellModalTooExpensiveV2Container" ]]
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), UnifiedRobuxUpsellModalTooExpensiveV2 (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		RobuxUpsellModalTooExpensiveV2 = ReactModule.createElement(UnifiedRobuxUpsellModalTooExpensiveV2, p1)
	})
end