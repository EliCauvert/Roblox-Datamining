local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ShopOverflowConstantsModule = require(InExperienceShop.Components.Shared.shopOverflowConstants)
local View = FoundationModule.View
local Text = FoundationModule.Text
local IconButton = FoundationModule.IconButton
local Menu = FoundationModule.Menu
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local OVERFLOWICON = ShopOverflowConstantsModule.OVERFLOW_ICON
local REPORTICON = ShopOverflowConstantsModule.REPORT_ICON
local REPORTMENUITEMID = ShopOverflowConstantsModule.REPORT_MENU_ITEM_ID
local config = {
	title = "Feature.Avatar.Action.Shop",
	report = "Feature.Catalog.Action.Report"
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), REPORTMENUITEMID (copy), REPORTICON (copy), ReactModule (copy), Menu (copy), InputSize (copy), PopoverSide (copy), PopoverAlign (copy), IconButton (copy), OVERFLOWICON (copy), ButtonVariant (copy), View (copy), IconName (copy), Text (copy)
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
			LayoutOrder = 2
		}, {
			Overflow = if p1.isReportingEnabled then ReactModule.createElement(Menu, {
				LayoutOrder = 1,
				testId = "TopBar_OverflowMenu",
				isOpen = p1.isOverflowMenuOpen,
				items = Items,
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
				LayoutOrder = 2,
				testId = "SearchButton",
				icon = IconName.MagnifyingGlass,
				size = InputSize.Medium,
				variant = ButtonVariant.Utility,
				onActivated = p1.onSearchOpen
			})
		})
	})
end