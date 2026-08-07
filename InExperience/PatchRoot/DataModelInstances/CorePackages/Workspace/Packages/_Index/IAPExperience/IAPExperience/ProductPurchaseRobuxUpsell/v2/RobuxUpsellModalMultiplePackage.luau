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

local function UpsellProductDetails(p0) --[[ line: 64 ]]
	-- upvalues: useLocalization (ref), badgeTypeModule (ref), reactModule (ref), view (ref), text (ref), formatNumberModule (ref), localizationService (ref), yellowBadgeModule (ref)
	local var19 = useLocalization({
		Popular = "IAPExperience.RobuxUpsell.Text.PopularItem",
		LastPurchased = "IAPExperience.RobuxUpsell.Text.LastPurchased"
	})
	local var20 = if p0.badgeType == badgeTypeModule.Popular then var19.Popular elseif p0.badgeType == badgeTypeModule.LastPurchased then var19.LastPurchased else nil
	local var21 = "size-full-1400 radius-medium padding-x-large row"
	
	return reactModule.createElement(view, {
		LayoutOrder = p0.layoutOrder,
		onActivated = p0.onSelected,
		tag = if p0.selected then var21 .. " bg-surface-200 stroke-system-contrast stroke-thick" else var21 .. " bg-surface-300 stroke-emphasis stroke-standard"
	}, {
		LeftSide = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row gap-small align-y-center align-x-start",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxAmount = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-title-large content-emphasis text-align-x-left",
				Text = utf8.char(57346) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, p0.product.robuxAmount)
			}),
			RobuxAmountBonus = p0.product.robuxAmountBeforeBonus and reactModule.createElement(text, {
				LayoutOrder = 2,
				RichText = true,
				tag = "auto-xy text-title-large content-muted text-align-x-left",
				Text = "<s>" .. utf8.char(57346) .. formatNumberModule(localizationService.RobloxLocaleId, p0.product.robuxAmountBeforeBonus) .. "</s>"
			})
		}),
		RightSide = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-y-center align-x-right gap-large",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			Badge = if var20 then reactModule.createElement(yellowBadgeModule, {
				LayoutOrder = 1,
				Text = var20,
				Icon = if p0.badgeType == badgeTypeModule.Popular then "icons/menu/fire_fill" else nil
			}) else nil,
			RobuxPrice = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-title-large content-emphasis text-align-x-right",
				Text = p0.product.price or ""
			})
		})
	})
end

local function MiddleContent(p1) --[[ line: 149 ]]
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
				onSelected = function() --[[ line: 170 ]]
					-- upvalues: p1 (ref)
					p1.onUpsellSuggestionsSelected(1)
				end
			}),
			UpsellPackage2 = if #p1.upsellSuggestions > 1 then reactModule.createElement(UpsellProductDetails, {
				layoutOrder = 2,
				product = p1.upsellSuggestions[2],
				selected = p1.selectedUpsellIndex == 2,
				onSelected = function() --[[ line: 179 ]]
					-- upvalues: p1 (ref)
					p1.onUpsellSuggestionsSelected(2)
				end,
				badgeType = p1.upsellSuggestions[2].badgeType
			}) else nil
		})
	})
end

local function ButtonStackInfo(p2) --[[ line: 204 ]]
	-- upvalues: useLocalization (ref), fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (ref), buttonType (ref)
	local var22 = useLocalization({
		BuyRobuxButton = "IAPExperience.RobuxUpsell.Action.BuyRobuxAndItem",
		ButtonCancel = "IAPExperience.RobuxUpsell.Action.Cancel",
		LoadingText = "IAPExperience.RobuxUpsell.Text.Loading"
	})
	
	return {
		forcedFillDirection = Enum.FillDirection.Vertical,
		disableGamepadRefs = if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then true else nil,
		buttons = if p2.isQuest then {
			{
				props = {
					onActivated = p2.buttons.cancelPurchaseActivated,
					text = var22.ButtonCancel,
					inputIcon = p2.buttons.cancelControllerIcon
				}
			}
		} else {
			{
				buttonType = buttonType.PrimaryContextual,
				props = {
					isDelayedInput = p2.buttons.buyItemisDelayedInput,
					enableInputDelayed = p2.buttons.buyItemEnableInputDelayed,
					onActivated = p2.buttons.buyItemActivated,
					text = var22.BuyRobuxButton,
					inputIcon = p2.buttons.buyItemControllerIcon,
					buttonRef = if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then p2.buttons.buttonRef else nil
				}
			}
		}
	}
end

local function RobuxUpsellModal(p3) --[[ line: 253 ]]
	-- upvalues: fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (ref), useDefaultFocusBehavior (ref), reactModule (ref), loggerModule (ref), default (ref), multiplePackageUpsellShownCounter (ref), multiplePackageUpsellSelectedCounter (ref), multiplePackageUpsellModalClosedCounter (ref), getAppContextModule (ref), multiplePackageUpsellModalBuyClickedCounter (ref), interactiveAlert (ref), robuxUpsellModalTitleModule (ref), MiddleContent (ref), ButtonStackInfo (ref), robuxUpsellModalFooterModule (ref)
	local var23 = nil
	local var24 = nil
	
	if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then
		local var25, var26 = useDefaultFocusBehavior()
		var23 = var25
		var24 = var26
	end
	reactModule.useEffect(function() --[[ line: 260 ]]
		-- upvalues: loggerModule (copy), p3 (ref), default (copy), multiplePackageUpsellShownCounter (copy)
		loggerModule.debug({
			message = "Multiple Package Upsell Modal Shown",
			suggestionCount = #p3.upsellSuggestions,
			screenHeight = p3.screenSize.Y,
			screenWidth = p3.screenSize.X,
			portrait = p3.screenSize.X < p3.screenSize.Y
		})
		default:logRobloxTelemetryCounter(multiplePackageUpsellShownCounter, 1, {
			suggestionCount = #p3.upsellSuggestions,
			screenHeight = p3.screenSize.Y,
			screenWidth = p3.screenSize.X,
			portrait = p3.screenSize.X < p3.screenSize.Y
		})
	end, { p3.upsellSuggestions })
	
	local var27 = function(p4) --[[ line: 277 ]]
		-- upvalues: loggerModule (copy), p3 (ref), default (copy), multiplePackageUpsellSelectedCounter (copy)
		loggerModule.debug({
			message = "Multiple Package Upsell Option Selected",
			suggestionCount = #p3.upsellSuggestions,
			previousIndex = p3.selectedUpsellIndex,
			selectedIndex = p4
		})
		default:logRobloxTelemetryCounter(multiplePackageUpsellSelectedCounter, 1, {
			suggestionCount = #p3.upsellSuggestions,
			previousIndex = p3.selectedUpsellIndex,
			selectedIndex = p4
		})
		p3.onUpsellSuggestionsSelected(p4)
	end
	
	local var28 = function() --[[ line: 293 ]]
		-- upvalues: loggerModule (copy), p3 (ref), default (copy), multiplePackageUpsellModalClosedCounter (copy)
		loggerModule.debug({
			message = "Multiple Package Upsell Modal Closed",
			suggestionCount = #p3.upsellSuggestions
		})
		default:logRobloxTelemetryCounter(multiplePackageUpsellModalClosedCounter, 1, { suggestionCount = #p3.upsellSuggestions })
		p3.buttons.cancelPurchaseActivated()
	end
	
	local buyItemActivated = p3.buttons.buyItemActivated
	
	function p3.buttons.buyItemActivated() --[[ line: 306 ]]
		-- upvalues: loggerModule (copy), getAppContextModule (copy), p3 (ref), default (copy), multiplePackageUpsellModalBuyClickedCounter (copy), buyItemActivated (ref)
		loggerModule.debug({
			message = "Multiple Package Upsell Modal Buy Clicked",
			appContext = getAppContextModule(),
			suggestionCount = #p3.upsellSuggestions,
			selectedIndex = p3.selectedUpsellIndex
		})
		default:logRobloxTelemetryCounter(multiplePackageUpsellModalBuyClickedCounter, 1, {
			appContext = getAppContextModule(),
			suggestionCount = #p3.upsellSuggestions,
			selectedIndex = p3.selectedUpsellIndex
		})
		buyItemActivated()
	end
	
	if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then
		p3.buttons.buttonRef = var23
	end
	return reactModule.createElement(interactiveAlert, {
		title = "",
		defaultChildRef = if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then var24 else nil,
		screenSize = p3.screenSize,
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		titleContent = function() --[[ line: 331 ]]
			-- upvalues: reactModule (copy), robuxUpsellModalTitleModule (copy), p3 (ref), var28 (ref)
			return reactModule.createElement(robuxUpsellModalTitleModule, {
				balanceAmount = p3.userBalance,
				cancelPurchaseActivated = var28
			})
		end,
		middleContent = function() --[[ line: 337 ]]
			-- upvalues: reactModule (copy), MiddleContent (copy), p3 (ref), var27 (ref)
			return reactModule.createElement(MiddleContent, {
				product = p3.product,
				upsellSuggestions = p3.upsellSuggestions,
				selectedUpsellIndex = p3.selectedUpsellIndex,
				onUpsellSuggestionsSelected = var27,
				isPortrait = p3.screenSize.X < p3.screenSize.Y
			})
		end,
		buttonStackInfo = ButtonStackInfo({ buttons = p3.buttons, isQuest = p3.isQuest }),
		footerContent = function() --[[ line: 350 ]]
			-- upvalues: reactModule (copy), robuxUpsellModalFooterModule (copy)
			return reactModule.createElement(robuxUpsellModalFooterModule)
		end
	})
end

return function(p5) --[[ line: 356 | named "RobuxUpsellModalContainer" ]]
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), RobuxUpsellModal (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		RobuxUpsellModal = reactModule.createElement(RobuxUpsellModal, p5)
	})
end