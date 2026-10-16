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
local FormatNumberModule = require(Parent.Utility.formatNumber)
local LoggerModule = require(Parent.Utility.logger)
local GetAppContextModule = require(Parent.Utility.getAppContext)
local Default = require(Parent1.LoggingProtocol).default
local TooExpensiveUpsellFallbackShownCounter = require(Parent.Generic.Events.TooExpensiveUpsellCounter).TooExpensiveUpsellFallbackShownCounter

local function MiddleContent(p1) --[[ Line: 56 ]]
	-- upvalues: UseLocalizationFunction (copy), FormatNumberModule (copy), LocalizationService (copy), ReactModule (copy), View (copy), ProductDetailsModule (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center"
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
			tag = "auto-xy text-body-medium content-emphasis text-align-x-left size-full-0 text-wrap padding-x-small line-height-",
			Text = UseLocalizationFunction({ YouNeed = "IAPExperience.InsufficientRobux.Text.YouNeed" }).YouNeed:gsub("{robux}", utf8.char(57346) .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.product.itemRobuxCost - p1.balanceAmount)),
			padding = { bottom = UDim.new(0, -12) }
		})
	})
end

local function RobuxUpsellModalTooExpensiveFallback(p1) --[[ Line: 95 ]]
	-- upvalues: ReactModule (copy), LoggerModule (copy), GetAppContextModule (copy), Default (copy), TooExpensiveUpsellFallbackShownCounter (copy), UseLocalizationFunction (copy), InteractiveAlert (copy), RobuxUpsellModalTitleModule (copy), MiddleContent (copy), ButtonType (copy)
	ReactModule.useEffect(function() --[[ Line: 96 ]]
		-- upvalues: LoggerModule (upval), p1 (copy), GetAppContextModule (upval), Default (upval), TooExpensiveUpsellFallbackShownCounter (upval)
		LoggerModule.debug({
			message = "Too Expensive Upsell Fallback Modal Shown",
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y,
			appContext = GetAppContextModule()
		})
		Default:logRobloxTelemetryCounter(TooExpensiveUpsellFallbackShownCounter, 1, {
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
		titleContent = function() --[[ Line: 119 ]]
			-- upvalues: ReactModule (upval), RobuxUpsellModalTitleModule (upval), p1 (copy)
			return ReactModule.createElement(RobuxUpsellModalTitleModule, {
				balanceAmount = p1.balanceAmount,
				cancelPurchaseActivated = p1.doneActivated
			})
		end,
		middleContent = function() --[[ Line: 125 ]]
			-- upvalues: ReactModule (upval), MiddleContent (upval), p1 (copy)
			return ReactModule.createElement(MiddleContent, {
				product = p1.product,
				isQuest = p1.isQuest,
				balanceAmount = p1.balanceAmount,
				isPortrait = p1.screenSize.X < p1.screenSize.Y
			})
		end,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.PrimaryContextual,
					props = {
						onActivated = p1.doneActivated,
						text = UseLocalizationFunction({ OK = "IAPExperience.PurchaseError.Text.Ok" }).OK,
						inputIcon = p1.doneControllerIcon
					}
				}
			}
		}
	})
end

return function(p1) --[[ Line: 148 | Named "RobuxUpsellModalTooExpensiveFallbackContainer" ]]
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), RobuxUpsellModalTooExpensiveFallback (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		RobuxUpsellModalTooExpensiveFallback = ReactModule.createElement(RobuxUpsellModalTooExpensiveFallback, p1)
	})
end