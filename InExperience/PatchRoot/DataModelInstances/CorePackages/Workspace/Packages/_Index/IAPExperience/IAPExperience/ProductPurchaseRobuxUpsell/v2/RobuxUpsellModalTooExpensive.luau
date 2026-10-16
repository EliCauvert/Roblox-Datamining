local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local UIBloxModule = require(Parent1.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local LocalizationService = game:GetService("LocalizationService")
local Localization = require(Parent1.AppLocales).Localization
local LocalizationModule = require(Parent1.Localization)
local LocalizationProvider = LocalizationModule.LocalizationProvider
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local ProductDetailsModule = require(Parent.Generic.ProductDetails)
local RobuxUpsellModalTitleModule = require(script.Parent.RobuxUpsellModalTitle)
local RobuxUpsellModalFooterModule = require(script.Parent.RobuxUpsellModalFooter)
local FormatNumberModule = require(Parent.Utility.formatNumber)
local LoggerModule = require(Parent.Utility.logger)
local GetAppContextModule = require(Parent.Utility.getAppContext)
local Default = require(Parent1.LoggingProtocol).default
local TooExpensiveUpsellShownCounter = require(Parent.Generic.Events.TooExpensiveUpsellCounter).TooExpensiveUpsellShownCounter

local function MiddleContent(p1) --[[ Line: 58 ]]
	-- upvalues: UseLocalizationFunction (copy), FormatNumberModule (copy), LocalizationService (copy), ReactModule (copy), View (copy), ProductDetailsModule (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "col gap-xxlarge auto-y size-full-0 align-x-center align-y-center"
	}, {
		ProductDetails = ReactModule.createElement(ProductDetailsModule, {
			layoutOrder = 1,
			isPortrait = p1.isPortrait,
			model = p1.product.model,
			itemIcon = p1.product.itemIcon,
			itemName = p1.product.itemName,
			itemRobuxCost = p1.product.itemRobuxCost
		}),
		BuyRobuxDetails = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "auto-xy text-label-medium content-emphasis text-align-x-center size-full-0",
			Text = UseLocalizationFunction({
				DontHaveEnough = "IAPExperience.InsufficientRobux.Text.BuyRobux"
			}).DontHaveEnough:gsub("{robux}", utf8.char(57346) .. " " .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.product.itemRobuxCost - p1.balanceAmount)),
			padding = { bottom = UDim.new(0, -12) }
		})
	})
end

local function ButtonStackInfo(p1) --[[ Line: 93 ]]
	-- upvalues: UseLocalizationFunction (copy), ButtonType (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		RobuxStoreButton = "IAPExperience.InsufficientRobux.Action.RobuxStore",
		ButtonCancel = "IAPExperience.InsufficientRobux.Action.Cancel"
	})
	
	return {
		forcedFillDirection = Enum.FillDirection.Vertical,
		buttons = if p1.isQuest then {
			{
				props = {
					onActivated = p1.buttons.cancelPurchaseActivated,
					text = UseLocalizationResult.ButtonCancel,
					inputIcon = p1.buttons.cancelControllerIcon
				}
			}
		} else {
			{
				buttonType = ButtonType.PrimaryContextual,
				props = {
					onActivated = p1.buttons.buyItemActivated,
					text = UseLocalizationResult.RobuxStoreButton,
					inputIcon = p1.buttons.buyItemControllerIcon
				}
			}
		}
	}
end

local function RobuxUpsellModalTooExpensive(p1) --[[ Line: 130 ]]
	-- upvalues: ReactModule (copy), LoggerModule (copy), GetAppContextModule (copy), Default (copy), TooExpensiveUpsellShownCounter (copy), InteractiveAlert (copy), RobuxUpsellModalTitleModule (copy), MiddleContent (copy), ButtonStackInfo (copy), RobuxUpsellModalFooterModule (copy)
	ReactModule.useEffect(function() --[[ Line: 131 ]]
		-- upvalues: LoggerModule (upval), p1 (copy), GetAppContextModule (upval), Default (upval), TooExpensiveUpsellShownCounter (upval)
		LoggerModule.debug({
			message = "Too Expensive Upsell Modal Shown",
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y,
			appContext = GetAppContextModule()
		})
		Default:logRobloxTelemetryCounter(TooExpensiveUpsellShownCounter, 1, {
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y,
			appContext = GetAppContextModule()
		})
	end, {})
	
	return ReactModule.createElement(InteractiveAlert, {
		title = "",
		screenSize = p1.screenSize,
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		titleContent = function() --[[ Line: 151 ]]
			-- upvalues: ReactModule (upval), RobuxUpsellModalTitleModule (upval), p1 (copy)
			return ReactModule.createElement(RobuxUpsellModalTitleModule, {
				balanceAmount = p1.balanceAmount,
				cancelPurchaseActivated = p1.buttons.cancelPurchaseActivated
			})
		end,
		middleContent = function() --[[ Line: 157 ]]
			-- upvalues: ReactModule (upval), MiddleContent (upval), p1 (copy)
			return ReactModule.createElement(MiddleContent, {
				product = p1.product,
				balanceAmount = p1.balanceAmount,
				isQuest = p1.isQuest,
				isPortrait = p1.screenSize.X < p1.screenSize.Y
			})
		end,
		buttonStackInfo = ButtonStackInfo({ buttons = p1.buttons, isQuest = p1.isQuest }),
		footerContent = function() --[[ Line: 169 ]]
			-- upvalues: ReactModule (upval), RobuxUpsellModalFooterModule (upval)
			return ReactModule.createElement(RobuxUpsellModalFooterModule)
		end
	})
end

return function(p1) --[[ Line: 175 | Named "RobuxUpsellModalTooExpensiveContainer" ]]
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), RobuxUpsellModalTooExpensive (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		RobuxUpsellModalTooExpensive = ReactModule.createElement(RobuxUpsellModalTooExpensive, p1)
	})
end