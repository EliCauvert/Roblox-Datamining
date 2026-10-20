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
local RobuxUpsellModalUpsellDetailsWithBonusModule = require(script.Parent.RobuxUpsellModalUpsellDetailsWithBonus)
local FormatNumberModule = require(Parent.Utility.formatNumber)
local LoggerModule = require(Parent.Utility.logger)
local GetAppContextModule = require(Parent.Utility.getAppContext)
local Default = require(Parent1.LoggingProtocol).default
local SinglePackageUpsellCounterModule = require(Parent.Generic.Events.SinglePackageUpsellCounter)
local SinglePackageUpsellShownCounter = SinglePackageUpsellCounterModule.SinglePackageUpsellShownCounter
local SinglePackageUpsellModalClosedCounter = SinglePackageUpsellCounterModule.SinglePackageUpsellModalClosedCounter
local SinglePackageUpsellModalBuyClickedCounter = SinglePackageUpsellCounterModule.SinglePackageUpsellModalBuyClickedCounter
local _ = require(Parent.Enums.VirtualItemBadgeType)
local UseDefaultFocusBehaviorFunction = require(Parent1.ReactFocusNavigation).useDefaultFocusBehavior
local FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule = require(Parent.Flags.FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePrompt)

local function MiddleContent(p1)
	-- upvalues: ReactModule (copy), View (copy), ProductDetailsModule (copy), RobuxUpsellModalUpsellDetailsWithBonusModule (copy), Text (copy), FormatNumberModule (copy), LocalizationService (copy)
	return ReactModule.createElement(View, {
		tag = "col gap-xxlarge auto-y size-full-0 align-x-center align-y-center"
	}, {
		ProductDetails = ReactModule.createElement(ProductDetailsModule, {
			layoutOrder = 1,
			isPortrait = p1.isPortrait,
			model = p1.product.model,
			itemIcon = p1.product.itemIcon,
			itemName = p1.product.itemName,
			itemRobuxCost = p1.product.itemRobuxCost,
			badgeType = p1.product.badgeType
		}),
		UpsellPackageDetails = if p1.upsell.robuxPurchaseAmountBeforeBonus then ReactModule.createElement(RobuxUpsellModalUpsellDetailsWithBonusModule, {
			layoutOrder = 2,
			priceString = p1.upsell.robuxPurchaseCost or "",
			robuxAmount = p1.upsell.robuxPurchaseAmountBeforeBonus,
			bonusAmount = p1.upsell.robuxPurchaseAmount - p1.upsell.robuxPurchaseAmountBeforeBonus
		}) else ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row flex-between size-full-1400 align-y-center bg-surface-300 radius-medium padding-large stroke-system-contrast stroke-thick"
		}, {
			RobuxAmountContainer = ReactModule.createElement(View, { tag = "auto-xy row gap-small" }, {
				RobuxAmount = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "auto-xy text-title-large content-emphasis text-align-x-left",
					Text = utf8.char(57346) .. " " .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.upsell.robuxPurchaseAmount)
				})
			}),
			RobuxPrice = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-title-large content-emphasis text-align-x-right",
				Text = p1.upsell.robuxPurchaseCost or ""
			})
		})
	})
end

local function ButtonStackInfo(p1)
	-- upvalues: UseLocalizationFunction (copy), FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (copy), ButtonType (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		ButtonCancel = "IAPExperience.RobuxUpsell.Action.Cancel",
		LoadingText = "IAPExperience.RobuxUpsell.Text.Loading",
		BuyRobuxButton = if p1.buttons.opensBuyRobuxPage then "IAPExperience.RobuxUpsell.Action.BuyRobux" else "IAPExperience.RobuxUpsell.Action.BuyRobuxAndItem"
	})
	
	return {
		forcedFillDirection = Enum.FillDirection.Vertical,
		disableGamepadRefs = if FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then true else nil,
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
					isDisabled = p1.buttons.buyItemDisabled,
					isDelayedInput = p1.buttons.buyItemisDelayedInput,
					enableInputDelayed = p1.buttons.buyItemEnableInputDelayed,
					onActivated = p1.buttons.buyItemActivated,
					text = UseLocalizationResult.BuyRobuxButton,
					inputIcon = p1.buttons.buyItemControllerIcon,
					buttonRef = if FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then p1.buttons.buttonRef else nil
				}
			}
		}
	}
end

local function RobuxUpsellModal(p1)
	-- upvalues: FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (copy), UseDefaultFocusBehaviorFunction (copy), ReactModule (copy), LoggerModule (copy), GetAppContextModule (copy), Default (copy), SinglePackageUpsellShownCounter (copy), SinglePackageUpsellModalClosedCounter (copy), SinglePackageUpsellModalBuyClickedCounter (copy), InteractiveAlert (copy), RobuxUpsellModalTitleModule (copy), MiddleContent (copy), ButtonStackInfo (copy), RobuxUpsellModalFooterModule (copy)
	local ButtonRef = nil
	local v1 = nil
	
	if FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then
		ButtonRef, v32 = UseDefaultFocusBehaviorFunction()
	end
	ReactModule.useEffect(function()
		-- upvalues: LoggerModule (upval), p1 (copy), GetAppContextModule (upval), Default (upval), SinglePackageUpsellShownCounter (upval)
		LoggerModule.debug({
			message = "Single Package Upsell Modal Shown",
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y,
			appContext = GetAppContextModule(),
			buyRobuxVariant = if p1.buttons.opensBuyRobuxPage == nil then 0 elseif p1.buttons.opensBuyRobuxPage then 1 else 2
		})
		Default:logRobloxTelemetryCounter(SinglePackageUpsellShownCounter, 1, {
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y,
			appContext = GetAppContextModule(),
			buyRobuxVariant = if p1.buttons.opensBuyRobuxPage == nil then 0 elseif p1.buttons.opensBuyRobuxPage then 1 else 2
		})
	end, {})
	
	local function CancelPurchaseActivated()
		-- upvalues: LoggerModule (upval), Default (upval), SinglePackageUpsellModalClosedCounter (upval), GetAppContextModule (upval), p1 (copy)
		LoggerModule.debug({ message = "Single Package Upsell Modal Closed" })
		Default:logRobloxTelemetryCounter(SinglePackageUpsellModalClosedCounter, 1, { appContext = GetAppContextModule() })
		p1.buttons.cancelPurchaseActivated()
	end
	
	local BuyItemActivatedFunction = p1.buttons.buyItemActivated
	
	function p1.buttons.buyItemActivated()
		-- upvalues: LoggerModule (upval), Default (upval), SinglePackageUpsellModalBuyClickedCounter (upval), GetAppContextModule (upval), BuyItemActivatedFunction (copy)
		LoggerModule.debug({ message = "Single Package Upsell Modal Buy Clicked" })
		Default:logRobloxTelemetryCounter(SinglePackageUpsellModalBuyClickedCounter, 1, { appContext = GetAppContextModule() })
		BuyItemActivatedFunction()
	end
	
	if FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then
		p1.buttons.buttonRef = ButtonRef
	end
	return ReactModule.createElement(InteractiveAlert, {
		title = "",
		defaultChildRef = if FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then v1 else nil,
		screenSize = p1.screenSize,
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		titleContent = function()
			-- upvalues: ReactModule (upval), RobuxUpsellModalTitleModule (upval), p1 (copy), CancelPurchaseActivated (copy)
			return ReactModule.createElement(RobuxUpsellModalTitleModule, {
				balanceAmount = p1.upsell.balanceAmount,
				cancelPurchaseActivated = CancelPurchaseActivated
			})
		end,
		middleContent = function()
			-- upvalues: ReactModule (upval), MiddleContent (upval), p1 (copy)
			return ReactModule.createElement(MiddleContent, {
				product = p1.product,
				upsell = p1.upsell,
				isPortrait = p1.screenSize.X < p1.screenSize.Y
			})
		end,
		buttonStackInfo = ButtonStackInfo({ buttons = p1.buttons, isQuest = p1.isQuest }),
		footerContent = function()
			-- upvalues: ReactModule (upval), RobuxUpsellModalFooterModule (upval)
			return ReactModule.createElement(RobuxUpsellModalFooterModule)
		end
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), RobuxUpsellModal (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		RobuxUpsellModal = ReactModule.createElement(RobuxUpsellModal, p1)
	})
end