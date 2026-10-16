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
local YellowBadgeModule = require(Parent.Generic.YellowBadge)
local RobuxUpsellModalTitleModule = require(script.Parent.RobuxUpsellModalTitle)
local RobuxUpsellModalFooterModule = require(script.Parent.RobuxUpsellModalFooter)
local FormatNumberModule = require(Parent.Utility.formatNumber)
local LoggerModule = require(Parent.Utility.logger)
local GetAppContextModule = require(Parent.Utility.getAppContext)
local Default = require(Parent1.LoggingProtocol).default
local MultiplePackageUpsellCounterModule = require(Parent.Generic.Events.MultiplePackageUpsellCounter)
local MultiplePackageUpsellShownCounter = MultiplePackageUpsellCounterModule.MultiplePackageUpsellShownCounter
local MultiplePackageUpsellSelectedCounter = MultiplePackageUpsellCounterModule.MultiplePackageUpsellSelectedCounter
local MultiplePackageUpsellModalClosedCounter = MultiplePackageUpsellCounterModule.MultiplePackageUpsellModalClosedCounter
local MultiplePackageUpsellModalBuyClickedCounter = MultiplePackageUpsellCounterModule.MultiplePackageUpsellModalBuyClickedCounter
local _ = require(Parent.Api.PaymentsGateway.GetUpsellSuggestionsTypes)
local BadgeTypeModule = require(Parent.Enums.BadgeType)
local _ = require(Parent.Enums.VirtualItemBadgeType)
local UseDefaultFocusBehaviorFunction = require(Parent1.ReactFocusNavigation).useDefaultFocusBehavior
local FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule = require(Parent.Flags.FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePrompt)

local function UpsellProductDetails(p1) --[[ Line: 64 ]]
	-- upvalues: UseLocalizationFunction (copy), BadgeTypeModule (copy), ReactModule (copy), View (copy), Text (copy), FormatNumberModule (copy), LocalizationService (copy), YellowBadgeModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		Popular = "IAPExperience.RobuxUpsell.Text.PopularItem",
		LastPurchased = "IAPExperience.RobuxUpsell.Text.LastPurchased"
	})
	local Popular = if p1.badgeType == BadgeTypeModule.Popular then UseLocalizationResult.Popular elseif p1.badgeType == BadgeTypeModule.LastPurchased then UseLocalizationResult.LastPurchased else nil
	local FireFill = if p1.badgeType == BadgeTypeModule.Popular then "icons/menu/fire_fill" else nil
	local v1 = "size-full-1400 radius-medium padding-x-large row"
	
	return ReactModule.createElement(View, {
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onSelected,
		tag = if p1.selected then v1 .. " bg-surface-200 stroke-system-contrast stroke-thick" else v1 .. " bg-surface-300 stroke-emphasis stroke-standard"
	}, {
		LeftSide = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row gap-small align-y-center align-x-start",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxAmount = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-title-large content-emphasis text-align-x-left",
				Text = utf8.char(57346) .. " " .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.product.robuxAmount)
			}),
			RobuxAmountBonus = p1.product.robuxAmountBeforeBonus and ReactModule.createElement(Text, {
				LayoutOrder = 2,
				RichText = true,
				tag = "auto-xy text-title-large content-muted text-align-x-left",
				Text = "<s>" .. utf8.char(57346) .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.product.robuxAmountBeforeBonus) .. "</s>"
			})
		}),
		RightSide = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-y-center align-x-right gap-large",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			Badge = if Popular then ReactModule.createElement(YellowBadgeModule, { LayoutOrder = 1, Text = Popular, Icon = FireFill }) else nil,
			RobuxPrice = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-title-large content-emphasis text-align-x-right",
				Text = p1.product.price or ""
			})
		})
	})
end

local function MiddleContent(p1) --[[ Line: 149 ]]
	-- upvalues: ReactModule (copy), View (copy), ProductDetailsModule (copy), UpsellProductDetails (copy)
	return ReactModule.createElement(View, {
		tag = "col gap-xxlarge auto-y size-full-0 align-x-center align-y-center"
	}, {
		ProductDetails = ReactModule.createElement(ProductDetailsModule, {
			layoutOrder = 1,
			isPortrait = p1.isPortrait and #p1.upsellSuggestions == 1,
			model = p1.product.model,
			itemIcon = p1.product.itemIcon,
			itemName = p1.product.itemName,
			itemRobuxCost = p1.product.itemRobuxCost,
			badgeType = p1.product.badgeType
		}),
		UpsellSuggestions = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center"
		}, {
			UpsellPackage1 = ReactModule.createElement(UpsellProductDetails, {
				layoutOrder = 1,
				product = p1.upsellSuggestions[1],
				selected = p1.selectedUpsellIndex == 1,
				onSelected = function() --[[ Line: 170 ]]
					-- upvalues: p1 (copy)
					p1.onUpsellSuggestionsSelected(1)
				end
			}),
			UpsellPackage2 = if #p1.upsellSuggestions > 1 then ReactModule.createElement(UpsellProductDetails, {
				layoutOrder = 2,
				product = p1.upsellSuggestions[2],
				selected = p1.selectedUpsellIndex == 2,
				onSelected = function() --[[ Line: 179 ]]
					-- upvalues: p1 (copy)
					p1.onUpsellSuggestionsSelected(2)
				end,
				badgeType = p1.upsellSuggestions[2].badgeType
			}) else nil
		})
	})
end

local function ButtonStackInfo(p1) --[[ Line: 204 ]]
	-- upvalues: UseLocalizationFunction (copy), FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (copy), ButtonType (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		BuyRobuxButton = "IAPExperience.RobuxUpsell.Action.BuyRobuxAndItem",
		ButtonCancel = "IAPExperience.RobuxUpsell.Action.Cancel",
		LoadingText = "IAPExperience.RobuxUpsell.Text.Loading"
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

local function RobuxUpsellModal(p1) --[[ Line: 253 ]]
	-- upvalues: FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (copy), UseDefaultFocusBehaviorFunction (copy), ReactModule (copy), LoggerModule (copy), Default (copy), MultiplePackageUpsellShownCounter (copy), MultiplePackageUpsellSelectedCounter (copy), MultiplePackageUpsellModalClosedCounter (copy), GetAppContextModule (copy), MultiplePackageUpsellModalBuyClickedCounter (copy), InteractiveAlert (copy), RobuxUpsellModalTitleModule (copy), MiddleContent (copy), ButtonStackInfo (copy), RobuxUpsellModalFooterModule (copy)
	local ButtonRef = nil
	local v1 = nil
	
	if FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then
		ButtonRef, v40 = UseDefaultFocusBehaviorFunction()
	end
	ReactModule.useEffect(function() --[[ Line: 260 ]]
		-- upvalues: LoggerModule (upval), p1 (copy), Default (upval), MultiplePackageUpsellShownCounter (upval)
		LoggerModule.debug({
			message = "Multiple Package Upsell Modal Shown",
			suggestionCount = #p1.upsellSuggestions,
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y
		})
		Default:logRobloxTelemetryCounter(MultiplePackageUpsellShownCounter, 1, {
			suggestionCount = #p1.upsellSuggestions,
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y
		})
	end, { p1.upsellSuggestions })
	
	local function OnUpsellSuggestionsSelected(SelectedIndex) --[[ Line: 277 ]]
		-- upvalues: LoggerModule (upval), p1 (copy), Default (upval), MultiplePackageUpsellSelectedCounter (upval)
		LoggerModule.debug({
			message = "Multiple Package Upsell Option Selected",
			suggestionCount = #p1.upsellSuggestions,
			previousIndex = p1.selectedUpsellIndex,
			selectedIndex = SelectedIndex
		})
		Default:logRobloxTelemetryCounter(MultiplePackageUpsellSelectedCounter, 1, {
			suggestionCount = #p1.upsellSuggestions,
			previousIndex = p1.selectedUpsellIndex,
			selectedIndex = SelectedIndex
		})
		p1.onUpsellSuggestionsSelected(SelectedIndex)
	end
	
	local function CancelPurchaseActivated() --[[ Line: 293 ]]
		-- upvalues: LoggerModule (upval), p1 (copy), Default (upval), MultiplePackageUpsellModalClosedCounter (upval)
		LoggerModule.debug({
			message = "Multiple Package Upsell Modal Closed",
			suggestionCount = #p1.upsellSuggestions
		})
		Default:logRobloxTelemetryCounter(MultiplePackageUpsellModalClosedCounter, 1, { suggestionCount = #p1.upsellSuggestions })
		p1.buttons.cancelPurchaseActivated()
	end
	
	local BuyItemActivatedFunction = p1.buttons.buyItemActivated
	
	function p1.buttons.buyItemActivated() --[[ Line: 306 ]]
		-- upvalues: LoggerModule (upval), GetAppContextModule (upval), p1 (copy), Default (upval), MultiplePackageUpsellModalBuyClickedCounter (upval), BuyItemActivatedFunction (copy)
		LoggerModule.debug({
			message = "Multiple Package Upsell Modal Buy Clicked",
			appContext = GetAppContextModule(),
			suggestionCount = #p1.upsellSuggestions,
			selectedIndex = p1.selectedUpsellIndex
		})
		Default:logRobloxTelemetryCounter(MultiplePackageUpsellModalBuyClickedCounter, 1, {
			appContext = GetAppContextModule(),
			suggestionCount = #p1.upsellSuggestions,
			selectedIndex = p1.selectedUpsellIndex
		})
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
		titleContent = function() --[[ Line: 331 ]]
			-- upvalues: ReactModule (upval), RobuxUpsellModalTitleModule (upval), p1 (copy), CancelPurchaseActivated (copy)
			return ReactModule.createElement(RobuxUpsellModalTitleModule, {
				balanceAmount = p1.userBalance,
				cancelPurchaseActivated = CancelPurchaseActivated
			})
		end,
		middleContent = function() --[[ Line: 337 ]]
			-- upvalues: ReactModule (upval), MiddleContent (upval), p1 (copy), OnUpsellSuggestionsSelected (copy)
			return ReactModule.createElement(MiddleContent, {
				product = p1.product,
				upsellSuggestions = p1.upsellSuggestions,
				selectedUpsellIndex = p1.selectedUpsellIndex,
				onUpsellSuggestionsSelected = OnUpsellSuggestionsSelected,
				isPortrait = p1.screenSize.X < p1.screenSize.Y
			})
		end,
		buttonStackInfo = ButtonStackInfo({ buttons = p1.buttons, isQuest = p1.isQuest }),
		footerContent = function() --[[ Line: 350 ]]
			-- upvalues: ReactModule (upval), RobuxUpsellModalFooterModule (upval)
			return ReactModule.createElement(RobuxUpsellModalFooterModule)
		end
	})
end

return function(p1) --[[ Line: 356 | Named "RobuxUpsellModalContainer" ]]
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), RobuxUpsellModal (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		RobuxUpsellModal = ReactModule.createElement(RobuxUpsellModal, p1)
	})
end