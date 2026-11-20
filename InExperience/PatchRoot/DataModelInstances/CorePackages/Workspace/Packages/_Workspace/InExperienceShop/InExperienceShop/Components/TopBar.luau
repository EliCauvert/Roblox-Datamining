local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ShopOverflowConstantsModule = require(InExperienceShop.Components.Shared.shopOverflowConstants)
local FFlagEnableContentPersonalizationForExperienceShopModule = require(InExperienceShop.Flags.FFlagEnableContentPersonalizationForExperienceShop)
local FFlagUseAccountSettingsVlopKeyModule = require(InExperienceShop.Flags.FFlagUseAccountSettingsVlopKey)
local FFlagAlignSideSheetWindowCloseRight = require(Parent.SharedFlags).FFlagAlignSideSheetWindowCloseRight
local View = FoundationModule.View
local Text = FoundationModule.Text
local IconButton = FoundationModule.IconButton
local Menu = FoundationModule.Menu
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local InputSize = FoundationModule.Enums.InputSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local Chip = FoundationModule.Chip
local ChipSize = FoundationModule.Enums.ChipSize
local ChipVariant = FoundationModule.Enums.ChipVariant
local OVERFLOWICON = ShopOverflowConstantsModule.OVERFLOW_ICON
local REPORTICON = ShopOverflowConstantsModule.REPORT_ICON
local REPORTMENUITEMID = ShopOverflowConstantsModule.REPORT_MENU_ITEM_ID
local CONTENTPERSONALIZATIONMENUITEMID = ShopOverflowConstantsModule.CONTENT_PERSONALIZATION_MENU_ITEM_ID
local CONTENTPERSONALIZATIONICON = ShopOverflowConstantsModule.CONTENT_PERSONALIZATION_ICON
local config = {
	title = "Feature.Avatar.Action.Shop",
	report = "Feature.Catalog.Action.Report",
	contentPersonalization = if FFlagUseAccountSettingsVlopKeyModule then "Feature.AccountSettings.Heading.Tab.PersonalizedRecommendations" else "Feature.InExperienceShop.Label.ContentPersonalization"
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), REPORTMENUITEMID (copy), REPORTICON (copy), FFlagEnableContentPersonalizationForExperienceShopModule (copy), CONTENTPERSONALIZATIONMENUITEMID (copy), CONTENTPERSONALIZATIONICON (copy), ReactModule (copy), View (copy), FFlagAlignSideSheetWindowCloseRight (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), Menu (copy), PopoverSide (copy), PopoverAlign (copy), OVERFLOWICON (copy), Text (copy), Chip (copy), IconName (copy), IconVariant (copy), ChipSize (copy), ChipVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local List = {}
	
	if p1.isReportingEnabled then
		table.insert(List, {
			id = REPORTMENUITEMID,
			icon = REPORTICON,
			text = UseLocalizationResult.report
		})
	end
	if FFlagEnableContentPersonalizationForExperienceShopModule and p1.isContentPersonalizationEnabled then
		table.insert(List, {
			id = CONTENTPERSONALIZATIONMENUITEMID,
			icon = CONTENTPERSONALIZATIONICON,
			text = UseLocalizationResult.contentPersonalization
		})
	end
	local IsReportingEnabled = if FFlagEnableContentPersonalizationForExperienceShopModule and p1.isContentPersonalizationEnabled then true else p1.isReportingEnabled
	local Element = ReactModule.createElement(View, {
		tag = "auto-xy padding-top-xxsmall",
		LayoutOrder = if FFlagAlignSideSheetWindowCloseRight then 4 else 1
	}, {
		CloseButton = ReactModule.createElement(IconButton, {
			isCircular = false,
			icon = IconName.X,
			size = InputSize.Medium,
			variant = ButtonVariant.Utility,
			onActivated = p1.onClose
		})
	})
	
	return ReactModule.createElement(View, {
		tag = "row flex-between align-y-center size-full-1200 padding-x-xlarge radius-medium bg-surface-0"
	}, {
		Leading = ReactModule.createElement(View, {
			tag = "row align-y-center gap-small auto-xy",
			LayoutOrder = 1
		}, {
			CloseButtonContainer = if FFlagAlignSideSheetWindowCloseRight then nil else Element,
			Title = ReactModule.createElement(Text, {
				tag = "size-0-1000 auto-x text-heading-small text-align-y-center content-emphasis",
				LayoutOrder = 2,
				Text = UseLocalizationResult.title
			})
		}),
		Trailing = ReactModule.createElement(View, {
			tag = "row align-y-center gap-small auto-xy",
			LayoutOrder = 3
		}, {
			OfferChip = if p1.showOfferChip then ReactModule.createElement(Chip, {
				LayoutOrder = 1,
				testId = "OfferChip",
				text = p1.offerChipText,
				leading = {
					iconName = p1.offerChipIcon and IconName[p1.offerChipIcon] or IconName.Tag,
					iconVariant = IconVariant.Filled
				},
				size = ChipSize.Small,
				variant = ChipVariant.Standard,
				onActivated = p1.onOfferChipActivated
			}) else nil,
			Overflow = if IsReportingEnabled then ReactModule.createElement(Menu, {
				LayoutOrder = 2,
				testId = "TopBar_OverflowMenu",
				isOpen = p1.isOverflowMenuOpen,
				items = List,
				size = InputSize.Medium,
				side = PopoverSide.Top,
				align = PopoverAlign.End,
				onPressedOutside = p1.onOverflowMenuClosed,
				onActivated = p1.onMenuItemActivated
			}, {
				Trigger = ReactModule.createElement(IconButton, {
					isCircular = false,
					testId = "TopBar_OverflowButton",
					icon = OVERFLOWICON,
					size = InputSize.Medium,
					variant = ButtonVariant.Utility,
					onActivated = p1.onOverflowActivated
				})
			}) else nil,
			SearchButton = ReactModule.createElement(IconButton, {
				isCircular = false,
				LayoutOrder = 3,
				testId = "SearchButton",
				icon = IconName.MagnifyingGlass,
				size = InputSize.Medium,
				variant = ButtonVariant.Utility,
				onActivated = p1.onSearchOpen
			}),
			CloseButtonContainer = if FFlagAlignSideSheetWindowCloseRight then Element else nil
		})
	})
end