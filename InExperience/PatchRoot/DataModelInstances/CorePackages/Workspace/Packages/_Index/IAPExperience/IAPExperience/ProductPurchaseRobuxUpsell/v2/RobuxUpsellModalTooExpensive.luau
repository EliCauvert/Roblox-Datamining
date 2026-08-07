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
local robuxUpsellModalFooterModule = require(script.Parent.RobuxUpsellModalFooter)
local formatNumberModule = require(parent.Utility.formatNumber)
local loggerModule = require(parent.Utility.logger)
local getAppContextModule = require(parent.Utility.getAppContext)
local default = require(parent_1.LoggingProtocol).default
local tooExpensiveUpsellShownCounter = require(parent.Generic.Events.TooExpensiveUpsellCounter).TooExpensiveUpsellShownCounter

local function MiddleContent(p0) --[[ line: 58 ]]
	-- upvalues: useLocalization (ref), formatNumberModule (ref), localizationService (ref), reactModule (ref), view (ref), productDetailsModule (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "col gap-xxlarge auto-y size-full-0 align-x-center align-y-center"
	}, {
		ProductDetails = reactModule.createElement(productDetailsModule, {
			layoutOrder = 1,
			isPortrait = p0.isPortrait,
			model = p0.product.model,
			itemIcon = p0.product.itemIcon,
			itemName = p0.product.itemName,
			itemRobuxCost = p0.product.itemRobuxCost
		}),
		BuyRobuxDetails = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-xy text-label-medium content-emphasis text-align-x-center size-full-0",
			Text = useLocalization({
				DontHaveEnough = "IAPExperience.InsufficientRobux.Text.BuyRobux"
			}).DontHaveEnough:gsub("{robux}", utf8.char(57346) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, p0.product.itemRobuxCost - p0.balanceAmount)),
			padding = { bottom = UDim.new(0, -12) }
		})
	})
end

local function ButtonStackInfo(p1) --[[ line: 93 ]]
	-- upvalues: useLocalization (ref), buttonType (ref)
	local var14 = useLocalization({
		RobuxStoreButton = "IAPExperience.InsufficientRobux.Action.RobuxStore",
		ButtonCancel = "IAPExperience.InsufficientRobux.Action.Cancel"
	})
	
	return {
		forcedFillDirection = Enum.FillDirection.Vertical,
		buttons = if p1.isQuest then {
			{
				props = {
					onActivated = p1.buttons.cancelPurchaseActivated,
					text = var14.ButtonCancel,
					inputIcon = p1.buttons.cancelControllerIcon
				}
			}
		} else {
			{
				buttonType = buttonType.PrimaryContextual,
				props = {
					onActivated = p1.buttons.buyItemActivated,
					text = var14.RobuxStoreButton,
					inputIcon = p1.buttons.buyItemControllerIcon
				}
			}
		}
	}
end

local function RobuxUpsellModalTooExpensive(p2) --[[ line: 130 ]]
	-- upvalues: reactModule (ref), loggerModule (ref), getAppContextModule (ref), default (ref), tooExpensiveUpsellShownCounter (ref), interactiveAlert (ref), robuxUpsellModalTitleModule (ref), MiddleContent (ref), ButtonStackInfo (ref), robuxUpsellModalFooterModule (ref)
	reactModule.useEffect(function() --[[ line: 131 ]]
		-- upvalues: loggerModule (copy), p2 (ref), getAppContextModule (copy), default (copy), tooExpensiveUpsellShownCounter (copy)
		loggerModule.debug({
			message = "Too Expensive Upsell Modal Shown",
			screenHeight = p2.screenSize.Y,
			screenWidth = p2.screenSize.X,
			portrait = p2.screenSize.X < p2.screenSize.Y,
			appContext = getAppContextModule()
		})
		default:logRobloxTelemetryCounter(tooExpensiveUpsellShownCounter, 1, {
			screenHeight = p2.screenSize.Y,
			screenWidth = p2.screenSize.X,
			portrait = p2.screenSize.X < p2.screenSize.Y,
			appContext = getAppContextModule()
		})
	end, {})
	
	return reactModule.createElement(interactiveAlert, {
		title = "",
		screenSize = p2.screenSize,
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		titleContent = function() --[[ line: 151 ]]
			-- upvalues: reactModule (copy), robuxUpsellModalTitleModule (copy), p2 (ref)
			return reactModule.createElement(robuxUpsellModalTitleModule, {
				balanceAmount = p2.balanceAmount,
				cancelPurchaseActivated = p2.buttons.cancelPurchaseActivated
			})
		end,
		middleContent = function() --[[ line: 157 ]]
			-- upvalues: reactModule (copy), MiddleContent (copy), p2 (ref)
			return reactModule.createElement(MiddleContent, {
				product = p2.product,
				balanceAmount = p2.balanceAmount,
				isQuest = p2.isQuest,
				isPortrait = p2.screenSize.X < p2.screenSize.Y
			})
		end,
		buttonStackInfo = ButtonStackInfo({ buttons = p2.buttons, isQuest = p2.isQuest }),
		footerContent = function() --[[ line: 169 ]]
			-- upvalues: reactModule (copy), robuxUpsellModalFooterModule (copy)
			return reactModule.createElement(robuxUpsellModalFooterModule)
		end
	})
end

return function(p3) --[[ line: 175 | named "RobuxUpsellModalTooExpensiveContainer" ]]
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), RobuxUpsellModalTooExpensive (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		RobuxUpsellModalTooExpensive = reactModule.createElement(RobuxUpsellModalTooExpensive, p3)
	})
end