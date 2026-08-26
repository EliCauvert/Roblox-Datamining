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

local function MiddleContent(p1)
	-- upvalues: reactModule (ref), view (ref), productDetailsModule (ref), robuxUpsellModalUpsellDetailsWithBonusModule (ref), text (ref), formatNumberModule (ref), localizationService (ref)
	return reactModule.createElement(view, {
		tag = "col gap-xxlarge auto-y size-full-0 align-x-center align-y-center"
	}, {
		ProductDetails = reactModule.createElement(productDetailsModule, {
			layoutOrder = 1,
			isPortrait = p1.isPortrait,
			model = p1.product.model,
			itemIcon = p1.product.itemIcon,
			itemName = p1.product.itemName,
			itemRobuxCost = p1.product.itemRobuxCost,
			badgeType = p1.product.badgeType
		}),
		UpsellPackageDetails = if p1.upsell.robuxPurchaseAmountBeforeBonus then reactModule.createElement(robuxUpsellModalUpsellDetailsWithBonusModule, {
			layoutOrder = 2,
			priceString = p1.upsell.robuxPurchaseCost or "",
			robuxAmount = p1.upsell.robuxPurchaseAmountBeforeBonus,
			bonusAmount = p1.upsell.robuxPurchaseAmount - p1.upsell.robuxPurchaseAmountBeforeBonus
		}) else reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row flex-between size-full-1400 align-y-center bg-surface-300 radius-medium padding-large stroke-system-contrast stroke-thick"
		}, {
			RobuxAmountContainer = reactModule.createElement(view, { tag = "auto-xy row gap-small" }, {
				RobuxAmount = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-title-large content-emphasis text-align-x-left",
					Text = utf8.char(57346) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, p1.upsell.robuxPurchaseAmount)
				})
			}),
			RobuxPrice = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-title-large content-emphasis text-align-x-right",
				Text = p1.upsell.robuxPurchaseCost or ""
			})
		})
	})
end

local function ButtonStackInfo(p1)
	-- upvalues: useLocalization (ref), fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (ref), buttonType (ref)
	local var1 = useLocalization({
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
					text = var1.ButtonCancel,
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
					text = var1.BuyRobuxButton,
					inputIcon = p1.buttons.buyItemControllerIcon,
					buttonRef = if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then p1.buttons.buttonRef else nil
				}
			}
		}
	}
end

local function RobuxUpsellModal(p1)
	-- upvalues: fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (ref), useDefaultFocusBehavior (ref), reactModule (ref), loggerModule (ref), getAppContextModule (ref), default (ref), singlePackageUpsellShownCounter (ref), singlePackageUpsellModalClosedCounter (ref), singlePackageUpsellModalBuyClickedCounter (ref), interactiveAlert (ref), robuxUpsellModalTitleModule (ref), MiddleContent (ref), ButtonStackInfo (ref), robuxUpsellModalFooterModule (ref)
	local var1 = nil
	local var2 = nil
	
	if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then
		local var3, var4 = useDefaultFocusBehavior()
		var1 = var3
		var2 = var4
	end
	reactModule.useEffect(function()
		-- upvalues: loggerModule (copy), p1 (ref), getAppContextModule (copy), default (copy), singlePackageUpsellShownCounter (copy)
		loggerModule.debug({
			message = "Single Package Upsell Modal Shown",
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y,
			appContext = getAppContextModule(),
			buyRobuxVariant = if p1.buttons.opensBuyRobuxPage == nil then 0 elseif p1.buttons.opensBuyRobuxPage then 1 else 2
		})
		default:logRobloxTelemetryCounter(singlePackageUpsellShownCounter, 1, {
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y,
			appContext = getAppContextModule(),
			buyRobuxVariant = if p1.buttons.opensBuyRobuxPage == nil then 0 elseif p1.buttons.opensBuyRobuxPage then 1 else 2
		})
	end, {})
	
	local var5 = function()
		-- upvalues: loggerModule (copy), default (copy), singlePackageUpsellModalClosedCounter (copy), getAppContextModule (copy), p1 (ref)
		loggerModule.debug({ message = "Single Package Upsell Modal Closed" })
		default:logRobloxTelemetryCounter(singlePackageUpsellModalClosedCounter, 1, { appContext = getAppContextModule() })
		p1.buttons.cancelPurchaseActivated()
	end
	
	local buyItemActivated = p1.buttons.buyItemActivated
	
	function p2.buttons.buyItemActivated()
		-- upvalues: loggerModule (copy), default (copy), singlePackageUpsellModalBuyClickedCounter (copy), getAppContextModule (copy), buyItemActivated (ref)
		loggerModule.debug({ message = "Single Package Upsell Modal Buy Clicked" })
		default:logRobloxTelemetryCounter(singlePackageUpsellModalBuyClickedCounter, 1, { appContext = getAppContextModule() })
		buyItemActivated()
	end
	
	if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then
		p1.buttons.buttonRef = var1
	end
	return reactModule.createElement(interactiveAlert, {
		title = "",
		defaultChildRef = if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then var2 else nil,
		screenSize = p1.screenSize,
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		titleContent = function()
			-- upvalues: reactModule (copy), robuxUpsellModalTitleModule (copy), p1 (ref), var5 (ref)
			return reactModule.createElement(robuxUpsellModalTitleModule, {
				balanceAmount = p1.upsell.balanceAmount,
				cancelPurchaseActivated = var5
			})
		end,
		middleContent = function()
			-- upvalues: reactModule (copy), MiddleContent (copy), p1 (ref)
			return reactModule.createElement(MiddleContent, {
				product = p1.product,
				upsell = p1.upsell,
				isPortrait = p1.screenSize.X < p1.screenSize.Y
			})
		end,
		buttonStackInfo = ButtonStackInfo({ buttons = p1.buttons, isQuest = p1.isQuest }),
		footerContent = function()
			-- upvalues: reactModule (copy), robuxUpsellModalFooterModule (copy)
			return reactModule.createElement(robuxUpsellModalFooterModule)
		end
	})
end

return function(p1)
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), RobuxUpsellModal (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		RobuxUpsellModal = reactModule.createElement(RobuxUpsellModal, p1)
	})
end