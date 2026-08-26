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
local yellowBadgeModule = require(parent.Generic.YellowBadge)
local robuxUpsellModalTitleModule = require(script.Parent.RobuxUpsellModalTitle)
local robuxUpsellModalFooterModule = require(script.Parent.RobuxUpsellModalFooter)
local formatNumberModule = require(parent.Utility.formatNumber)
local loggerModule = require(parent.Utility.logger)
local getAppContextModule = require(parent.Utility.getAppContext)
local default = require(parent_1.LoggingProtocol).default
local multiplePackageUpsellCounterModule = require(parent.Generic.Events.MultiplePackageUpsellCounter)
local multiplePackageUpsellShownCounter = multiplePackageUpsellCounterModule.MultiplePackageUpsellShownCounter
local multiplePackageUpsellSelectedCounter = multiplePackageUpsellCounterModule.MultiplePackageUpsellSelectedCounter
local multiplePackageUpsellModalClosedCounter = multiplePackageUpsellCounterModule.MultiplePackageUpsellModalClosedCounter
local multiplePackageUpsellModalBuyClickedCounter = multiplePackageUpsellCounterModule.MultiplePackageUpsellModalBuyClickedCounter
local _ = require(parent.Api.PaymentsGateway.GetUpsellSuggestionsTypes)
local badgeTypeModule = require(parent.Enums.BadgeType)
local _ = require(parent.Enums.VirtualItemBadgeType)
local useDefaultFocusBehavior = require(parent_1.ReactFocusNavigation).useDefaultFocusBehavior
local fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule = require(parent.Flags.FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePrompt)

local function UpsellProductDetails(p1)
	-- upvalues: useLocalization (ref), badgeTypeModule (ref), reactModule (ref), view (ref), text (ref), formatNumberModule (ref), localizationService (ref), yellowBadgeModule (ref)
	local var1 = useLocalization({
		Popular = "IAPExperience.RobuxUpsell.Text.PopularItem",
		LastPurchased = "IAPExperience.RobuxUpsell.Text.LastPurchased"
	})
	local var2 = if p1.badgeType == badgeTypeModule.Popular then var1.Popular elseif p1.badgeType == badgeTypeModule.LastPurchased then var1.LastPurchased else nil
	local var3 = "size-full-1400 radius-medium padding-x-large row"
	
	return reactModule.createElement(view, {
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onSelected,
		tag = if p1.selected then var3 .. " bg-surface-200 stroke-system-contrast stroke-thick" else var3 .. " bg-surface-300 stroke-emphasis stroke-standard"
	}, {
		LeftSide = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row gap-small align-y-center align-x-start",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxAmount = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-title-large content-emphasis text-align-x-left",
				Text = utf8.char(57346) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, p1.product.robuxAmount)
			}),
			RobuxAmountBonus = p1.product.robuxAmountBeforeBonus and reactModule.createElement(text, {
				LayoutOrder = 2,
				RichText = true,
				tag = "auto-xy text-title-large content-muted text-align-x-left",
				Text = "<s>" .. utf8.char(57346) .. formatNumberModule(localizationService.RobloxLocaleId, p1.product.robuxAmountBeforeBonus) .. "</s>"
			})
		}),
		RightSide = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-y-center align-x-right gap-large",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			Badge = if var2 then reactModule.createElement(yellowBadgeModule, {
				LayoutOrder = 1,
				Text = var2,
				Icon = if p1.badgeType == badgeTypeModule.Popular then "icons/menu/fire_fill" else nil
			}) else nil,
			RobuxPrice = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-title-large content-emphasis text-align-x-right",
				Text = p1.product.price or ""
			})
		})
	})
end

local function MiddleContent(p1)
	-- upvalues: reactModule (ref), view (ref), productDetailsModule (ref), UpsellProductDetails (ref)
	return reactModule.createElement(view, {
		tag = "col gap-xxlarge auto-y size-full-0 align-x-center align-y-center"
	}, {
		ProductDetails = reactModule.createElement(productDetailsModule, {
			layoutOrder = 1,
			isPortrait = p1.isPortrait and #p1.upsellSuggestions == 1,
			model = p1.product.model,
			itemIcon = p1.product.itemIcon,
			itemName = p1.product.itemName,
			itemRobuxCost = p1.product.itemRobuxCost,
			badgeType = p1.product.badgeType
		}),
		UpsellSuggestions = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center"
		}, {
			UpsellPackage1 = reactModule.createElement(UpsellProductDetails, {
				layoutOrder = 1,
				product = p1.upsellSuggestions[1],
				selected = p1.selectedUpsellIndex == 1,
				onSelected = function()
					-- upvalues: p1 (ref)
					p1.onUpsellSuggestionsSelected(1)
				end
			}),
			UpsellPackage2 = if #p1.upsellSuggestions > 1 then reactModule.createElement(UpsellProductDetails, {
				layoutOrder = 2,
				product = p1.upsellSuggestions[2],
				selected = p1.selectedUpsellIndex == 2,
				onSelected = function()
					-- upvalues: p1 (ref)
					p1.onUpsellSuggestionsSelected(2)
				end,
				badgeType = p1.upsellSuggestions[2].badgeType
			}) else nil
		})
	})
end

local function ButtonStackInfo(p1)
	-- upvalues: useLocalization (ref), fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (ref), buttonType (ref)
	local var1 = useLocalization({
		BuyRobuxButton = "IAPExperience.RobuxUpsell.Action.BuyRobuxAndItem",
		ButtonCancel = "IAPExperience.RobuxUpsell.Action.Cancel",
		LoadingText = "IAPExperience.RobuxUpsell.Text.Loading"
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
	-- upvalues: fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (ref), useDefaultFocusBehavior (ref), reactModule (ref), loggerModule (ref), default (ref), multiplePackageUpsellShownCounter (ref), multiplePackageUpsellSelectedCounter (ref), multiplePackageUpsellModalClosedCounter (ref), getAppContextModule (ref), multiplePackageUpsellModalBuyClickedCounter (ref), interactiveAlert (ref), robuxUpsellModalTitleModule (ref), MiddleContent (ref), ButtonStackInfo (ref), robuxUpsellModalFooterModule (ref)
	local var1 = nil
	local var2 = nil
	
	if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then
		local var3, var4 = useDefaultFocusBehavior()
		var1 = var3
		var2 = var4
	end
	reactModule.useEffect(function()
		-- upvalues: loggerModule (copy), p1 (ref), default (copy), multiplePackageUpsellShownCounter (copy)
		loggerModule.debug({
			message = "Multiple Package Upsell Modal Shown",
			suggestionCount = #p1.upsellSuggestions,
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y
		})
		default:logRobloxTelemetryCounter(multiplePackageUpsellShownCounter, 1, {
			suggestionCount = #p1.upsellSuggestions,
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y
		})
	end, { p1.upsellSuggestions })
	
	local var5 = function(p2)
		-- upvalues: loggerModule (copy), p1 (ref), default (copy), multiplePackageUpsellSelectedCounter (copy)
		loggerModule.debug({
			message = "Multiple Package Upsell Option Selected",
			suggestionCount = #p1.upsellSuggestions,
			previousIndex = p1.selectedUpsellIndex,
			selectedIndex = p2
		})
		default:logRobloxTelemetryCounter(multiplePackageUpsellSelectedCounter, 1, {
			suggestionCount = #p1.upsellSuggestions,
			previousIndex = p1.selectedUpsellIndex,
			selectedIndex = p2
		})
		p1.onUpsellSuggestionsSelected(p2)
	end
	
	local var6 = function()
		-- upvalues: loggerModule (copy), p1 (ref), default (copy), multiplePackageUpsellModalClosedCounter (copy)
		loggerModule.debug({
			message = "Multiple Package Upsell Modal Closed",
			suggestionCount = #p1.upsellSuggestions
		})
		default:logRobloxTelemetryCounter(multiplePackageUpsellModalClosedCounter, 1, { suggestionCount = #p1.upsellSuggestions })
		p1.buttons.cancelPurchaseActivated()
	end
	
	local buyItemActivated = p1.buttons.buyItemActivated
	
	function p3.buttons.buyItemActivated()
		-- upvalues: loggerModule (copy), getAppContextModule (copy), p1 (ref), default (copy), multiplePackageUpsellModalBuyClickedCounter (copy), buyItemActivated (ref)
		loggerModule.debug({
			message = "Multiple Package Upsell Modal Buy Clicked",
			appContext = getAppContextModule(),
			suggestionCount = #p1.upsellSuggestions,
			selectedIndex = p1.selectedUpsellIndex
		})
		default:logRobloxTelemetryCounter(multiplePackageUpsellModalBuyClickedCounter, 1, {
			appContext = getAppContextModule(),
			suggestionCount = #p1.upsellSuggestions,
			selectedIndex = p1.selectedUpsellIndex
		})
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
			-- upvalues: reactModule (copy), robuxUpsellModalTitleModule (copy), p1 (ref), var6 (ref)
			return reactModule.createElement(robuxUpsellModalTitleModule, {
				balanceAmount = p1.userBalance,
				cancelPurchaseActivated = var6
			})
		end,
		middleContent = function()
			-- upvalues: reactModule (copy), MiddleContent (copy), p1 (ref), var5 (ref)
			return reactModule.createElement(MiddleContent, {
				product = p1.product,
				upsellSuggestions = p1.upsellSuggestions,
				selectedUpsellIndex = p1.selectedUpsellIndex,
				onUpsellSuggestionsSelected = var5,
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