local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagEnableUserOffers = require(Parent.SharedFlags).FFlagEnableUserOffers
local ShopOverflowConstantsModule = require(InExperienceShop.Components.Shared.shopOverflowConstants)
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
local config = {
	title = "Feature.Avatar.Action.Shop",
	report = "Feature.Catalog.Action.Report"
}

return function(p1) --[[ Line: 59 | Named "TopBar" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), REPORTMENUITEMID (copy), REPORTICON (copy), ReactModule (copy), Menu (copy), InputSize (copy), PopoverSide (copy), PopoverAlign (copy), FFlagEnableUserOffers (copy), IconButton (copy), OVERFLOWICON (copy), ButtonVariant (copy), View (copy), IconName (copy), Text (copy), Chip (copy), IconName (copy), IconVariant (copy), ChipSize (copy), ChipVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local Items = {}
	
	if p1.isReportingEnabled then
		table.insert(Items, {
			id = REPORTMENUITEMID,
			icon = REPORTICON,
			text = UseLocalizationResult.report
		})
	end
	return ReactModule.createElement(View, {
		tag = "row flex-between align-y-center size-full-1200 padding-x-xlarge radius-medium bg-surface-0"
	}, {
		Leading = ReactModule.createElement(View, {
			tag = "row align-y-center gap-small auto-xy",
			LayoutOrder = 1
		}, {
			CloseButtonContainer = ReactModule.createElement(View, { tag = "auto-xy padding-top-xxsmall", LayoutOrder = 1 }, {
				CloseButton = ReactModule.createElement(IconButton, {
					isCircular = false,
					icon = IconName.X,
					size = InputSize.Medium,
					variant = ButtonVariant.Utility,
					onActivated = p1.onClose
				})
			}),
			Title = ReactModule.createElement(Text, {
				tag = "size-0-1000 auto-x text-heading-small text-align-y-center content-emphasis",
				LayoutOrder = 2,
				Text = UseLocalizationResult.title
			})
		}),
		Trailing = ReactModule.createElement(View, {
			tag = "row align-y-center gap-small auto-xy",
			LayoutOrder = if FFlagEnableUserOffers then 3 else 2
		}, {
			OfferChip = if FFlagEnableUserOffers and p1.showOfferChip then ReactModule.createElement(Chip, {
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
			Overflow = if p1.isReportingEnabled then ReactModule.createElement(Menu, {
				testId = "TopBar_OverflowMenu",
				isOpen = p1.isOverflowMenuOpen,
				items = Items,
				size = InputSize.Medium,
				side = PopoverSide.Top,
				align = PopoverAlign.End,
				onPressedOutside = p1.onOverflowMenuClosed,
				onActivated = p1.onMenuItemActivated,
				LayoutOrder = if FFlagEnableUserOffers then 2 else 1
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
				testId = "SearchButton",
				icon = IconName.MagnifyingGlass,
				size = InputSize.Medium,
				variant = ButtonVariant.Utility,
				onActivated = p1.onSearchOpen,
				LayoutOrder = if FFlagEnableUserOffers then 3 else 2
			})
		})
	})
end