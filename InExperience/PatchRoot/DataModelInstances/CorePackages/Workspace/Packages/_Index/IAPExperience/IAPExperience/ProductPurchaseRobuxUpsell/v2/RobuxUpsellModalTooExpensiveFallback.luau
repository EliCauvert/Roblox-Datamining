local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local UIBloxModule = require(parent_1.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local localizationService = game:GetService("LocalizationService")
local localization = require(parent_1.AppLocales).Localization
local localizationModule = require(parent_1.Localization)
local localizationProvider = localizationModule.LocalizationProvider
local useLocalization = localizationModule.Hooks.useLocalization
local productDetailsModule = require(parent.Generic.ProductDetails)
local robuxUpsellModalTitleModule = require(script.Parent.RobuxUpsellModalTitle)
local formatNumberModule = require(parent.Utility.formatNumber)
local loggerModule = require(parent.Utility.logger)
local getAppContextModule = require(parent.Utility.getAppContext)
local default = require(parent_1.LoggingProtocol).default
local tooExpensiveUpsellFallbackShownCounter = require(parent.Generic.Events.TooExpensiveUpsellCounter).TooExpensiveUpsellFallbackShownCounter

local function MiddleContent(p1)
	-- upvalues: useLocalization (ref), formatNumberModule (ref), localizationService (ref), reactModule (ref), view (ref), productDetailsModule (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center"
	}, {
		ProductDetails = reactModule.createElement(productDetailsModule, {
			layoutOrder = 1,
			isPortrait = p1.isPortrait,
			model = p1.product.model,
			itemIcon = p1.product.itemIcon,
			itemName = p1.product.itemName,
			itemRobuxCost = p1.product.itemRobuxCost
		}),
		BuyRobuxDetails = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-xy text-body-medium content-emphasis text-align-x-left size-full-0 text-wrap padding-x-small line-height-",
			Text = useLocalization({ YouNeed = "IAPExperience.InsufficientRobux.Text.YouNeed" }).YouNeed:gsub("{robux}", utf8.char(57346) .. formatNumberModule(localizationService.RobloxLocaleId, p1.product.itemRobuxCost - p1.balanceAmount)),
			padding = { bottom = UDim.new(0, -12) }
		})
	})
end

local function RobuxUpsellModalTooExpensiveFallback(p1)
	-- upvalues: reactModule (ref), loggerModule (ref), getAppContextModule (ref), default (ref), tooExpensiveUpsellFallbackShownCounter (ref), useLocalization (ref), interactiveAlert (ref), robuxUpsellModalTitleModule (ref), MiddleContent (ref), buttonType (ref)
	reactModule.useEffect(function()
		-- upvalues: loggerModule (copy), p1 (ref), getAppContextModule (copy), default (copy), tooExpensiveUpsellFallbackShownCounter (copy)
		loggerModule.debug({
			message = "Too Expensive Upsell Fallback Modal Shown",
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y,
			appContext = getAppContextModule()
		})
		default:logRobloxTelemetryCounter(tooExpensiveUpsellFallbackShownCounter, 1, {
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y,
			appContext = getAppContextModule()
		})
	end, {})
	
	return reactModule.createElement(interactiveAlert, {
		title = "",
		screenSize = p1.screenSize,
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		titleContent = function()
			-- upvalues: reactModule (copy), robuxUpsellModalTitleModule (copy), p1 (ref)
			return reactModule.createElement(robuxUpsellModalTitleModule, {
				balanceAmount = p1.balanceAmount,
				cancelPurchaseActivated = p1.doneActivated
			})
		end,
		middleContent = function()
			-- upvalues: reactModule (copy), MiddleContent (copy), p1 (ref)
			return reactModule.createElement(MiddleContent, {
				product = p1.product,
				isQuest = p1.isQuest,
				balanceAmount = p1.balanceAmount,
				isPortrait = p1.screenSize.X < p1.screenSize.Y
			})
		end,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.PrimaryContextual,
					props = {
						onActivated = p1.doneActivated,
						text = useLocalization({ OK = "IAPExperience.PurchaseError.Text.Ok" }).OK,
						inputIcon = p1.doneControllerIcon
					}
				}
			}
		}
	})
end

return function(p1)
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), RobuxUpsellModalTooExpensiveFallback (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		RobuxUpsellModalTooExpensiveFallback = reactModule.createElement(RobuxUpsellModalTooExpensiveFallback, p1)
	})
end