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
local robuxUpsellModalUpsellDetailsWithBonusModule = require(script.Parent.RobuxUpsellModalUpsellDetailsWithBonus)
local formatNumberModule = require(parent.Utility.formatNumber)
local loggerModule = require(parent.Utility.logger)
local getAppContextModule = require(parent.Utility.getAppContext)
local default = require(parent_1.LoggingProtocol).default
local singlePackageUpsellCounterModule = require(parent.Generic.Events.SinglePackageUpsellCounter)
local singlePackageUpsellShownCounter = singlePackageUpsellCounterModule.SinglePackageUpsellShownCounter
local singlePackageUpsellModalClosedCounter = singlePackageUpsellCounterModule.SinglePackageUpsellModalClosedCounter
local singlePackageUpsellModalBuyClickedCounter = singlePackageUpsellCounterModule.SinglePackageUpsellModalBuyClickedCounter
local _ = require(parent.Enums.VirtualItemBadgeType)
local useDefaultFocusBehavior = require(parent_1.ReactFocusNavigation).useDefaultFocusBehavior
local fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule = require(parent.Flags.FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePrompt)

local function MiddleContent(p0) --[[ line: 72 ]]
	-- upvalues: reactModule (ref), view (ref), productDetailsModule (ref), robuxUpsellModalUpsellDetailsWithBonusModule (ref), text (ref), formatNumberModule (ref), localizationService (ref)
	return reactModule.createElement(view, {
		tag = "col gap-xxlarge auto-y size-full-0 align-x-center align-y-center"
	}, {
		ProductDetails = reactModule.createElement(productDetailsModule, {
			layoutOrder = 1,
			isPortrait = p0.isPortrait,
			model = p0.product.model,
			itemIcon = p0.product.itemIcon,
			itemName = p0.product.itemName,
			itemRobuxCost = p0.product.itemRobuxCost,
			badgeType = p0.product.badgeType
		}),
		UpsellPackageDetails = if p0.upsell.robuxPurchaseAmountBeforeBonus then reactModule.createElement(robuxUpsellModalUpsellDetailsWithBonusModule, {
			layoutOrder = 2,
			priceString = p0.upsell.robuxPurchaseCost or "",
			robuxAmount = p0.upsell.robuxPurchaseAmountBeforeBonus,
			bonusAmount = p0.upsell.robuxPurchaseAmount - p0.upsell.robuxPurchaseAmountBeforeBonus
		}) else reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row flex-between size-full-1400 align-y-center bg-surface-300 radius-medium padding-large stroke-system-contrast stroke-thick"
		}, {
			RobuxAmountContainer = reactModule.createElement(view, { tag = "auto-xy row gap-small" }, {
				RobuxAmount = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-title-large content-emphasis text-align-x-left",
					Text = utf8.char(57346) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, p0.upsell.robuxPurchaseAmount)
				})
			}),
			RobuxPrice = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-title-large content-emphasis text-align-x-right",
				Text = p0.upsell.robuxPurchaseCost or ""
			})
		})
	})
end

local function ButtonStackInfo(p1) --[[ line: 133 ]]
	-- upvalues: useLocalization (ref), fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (ref), buttonType (ref)
	local var17 = useLocalization({
		ButtonCancel = "IAPExperience.RobuxUpsell.Action.Cancel",
		LoadingText = "IAPExperience.RobuxUpsell.Text.Loading",
		BuyRobuxButton = if p1.buttons.opensBuyRobuxPage then "IAPExperience.RobuxUpsell.Action.BuyRobux" else "IAPExperience.RobuxUpsell.Action.BuyRobuxAndItem"
	})
	
	return {
		forcedFillDirection = Enum.FillDirection.Vertical,
		disableGamepadRefs = if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then true else nil,
		buttons = if p1.isQuest then {
			{
				props = {
					onActivated = p1.buttons.cancelPurchaseActivated,
					text = var17.ButtonCancel,
					inputIcon = p1.buttons.cancelControllerIcon
				}
			}
		} else {
			{
				buttonType = buttonType.PrimaryContextual,
				props = {
					isDisabled = p1.buttons.buyItemDisabled,
					isDelayedInput = p1.buttons.buyItemisDelayedInput,
					enableInputDelayed = p1.buttons.buyItemEnableInputDelayed,
					onActivated = p1.buttons.buyItemActivated,
					text = var17.BuyRobuxButton,
					inputIcon = p1.buttons.buyItemControllerIcon,
					buttonRef = if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then p1.buttons.buttonRef else nil
				}
			}
		}
	}
end

local function RobuxUpsellModal(p2) --[[ line: 180 ]]
	-- upvalues: fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (ref), useDefaultFocusBehavior (ref), reactModule (ref), loggerModule (ref), getAppContextModule (ref), default (ref), singlePackageUpsellShownCounter (ref), singlePackageUpsellModalClosedCounter (ref), singlePackageUpsellModalBuyClickedCounter (ref), interactiveAlert (ref), robuxUpsellModalTitleModule (ref), MiddleContent (ref), ButtonStackInfo (ref), robuxUpsellModalFooterModule (ref)
	local var18 = nil
	local var19 = nil
	
	if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then
		local var20, var21 = useDefaultFocusBehavior()
		var18 = var20
		var19 = var21
	end
	reactModule.useEffect(function() --[[ line: 186 ]]
		-- upvalues: loggerModule (copy), p2 (ref), getAppContextModule (copy), default (copy), singlePackageUpsellShownCounter (copy)
		loggerModule.debug({
			message = "Single Package Upsell Modal Shown",
			screenHeight = p2.screenSize.Y,
			screenWidth = p2.screenSize.X,
			portrait = p2.screenSize.X < p2.screenSize.Y,
			appContext = getAppContextModule(),
			buyRobuxVariant = if p2.buttons.opensBuyRobuxPage == nil then 0 elseif p2.buttons.opensBuyRobuxPage then 1 else 2
		})
		default:logRobloxTelemetryCounter(singlePackageUpsellShownCounter, 1, {
			screenHeight = p2.screenSize.Y,
			screenWidth = p2.screenSize.X,
			portrait = p2.screenSize.X < p2.screenSize.Y,
			appContext = getAppContextModule(),
			buyRobuxVariant = if p2.buttons.opensBuyRobuxPage == nil then 0 elseif p2.buttons.opensBuyRobuxPage then 1 else 2
		})
	end, {})
	
	local var22 = function() --[[ line: 209 ]]
		-- upvalues: loggerModule (copy), default (copy), singlePackageUpsellModalClosedCounter (copy), getAppContextModule (copy), p2 (ref)
		loggerModule.debug({ message = "Single Package Upsell Modal Closed" })
		default:logRobloxTelemetryCounter(singlePackageUpsellModalClosedCounter, 1, { appContext = getAppContextModule() })
		p2.buttons.cancelPurchaseActivated()
	end
	
	local buyItemActivated = p2.buttons.buyItemActivated
	
	function p2.buttons.buyItemActivated() --[[ line: 219 ]]
		-- upvalues: loggerModule (copy), default (copy), singlePackageUpsellModalBuyClickedCounter (copy), getAppContextModule (copy), buyItemActivated (ref)
		loggerModule.debug({ message = "Single Package Upsell Modal Buy Clicked" })
		default:logRobloxTelemetryCounter(singlePackageUpsellModalBuyClickedCounter, 1, { appContext = getAppContextModule() })
		buyItemActivated()
	end
	
	if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then
		p2.buttons.buttonRef = var18
	end
	return reactModule.createElement(interactiveAlert, {
		title = "",
		defaultChildRef = if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then var19 else nil,
		screenSize = p2.screenSize,
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		titleContent = function() --[[ line: 237 ]]
			-- upvalues: reactModule (copy), robuxUpsellModalTitleModule (copy), p2 (ref), var22 (ref)
			return reactModule.createElement(robuxUpsellModalTitleModule, {
				balanceAmount = p2.upsell.balanceAmount,
				cancelPurchaseActivated = var22
			})
		end,
		middleContent = function() --[[ line: 243 ]]
			-- upvalues: reactModule (copy), MiddleContent (copy), p2 (ref)
			return reactModule.createElement(MiddleContent, {
				product = p2.product,
				upsell = p2.upsell,
				isPortrait = p2.screenSize.X < p2.screenSize.Y
			})
		end,
		buttonStackInfo = ButtonStackInfo({ buttons = p2.buttons, isQuest = p2.isQuest }),
		footerContent = function() --[[ line: 254 ]]
			-- upvalues: reactModule (copy), robuxUpsellModalFooterModule (copy)
			return reactModule.createElement(robuxUpsellModalFooterModule)
		end
	})
end

return function(p3) --[[ line: 260 | named "RobuxUpsellModalContainer" ]]
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), RobuxUpsellModal (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		RobuxUpsellModal = reactModule.createElement(RobuxUpsellModal, p3)
	})
end