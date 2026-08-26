local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local shopOverflowConstantsModule = require(inExperienceShop.Components.Shared.shopOverflowConstants)
local view = foundationModule.View
local text = foundationModule.Text
local iconButton = foundationModule.IconButton
local menu = foundationModule.Menu
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local OVERFLOW_ICON = shopOverflowConstantsModule.OVERFLOW_ICON
local REPORT_ICON = shopOverflowConstantsModule.REPORT_ICON
local REPORT_MENU_ITEM_ID = shopOverflowConstantsModule.REPORT_MENU_ITEM_ID
local t = {
	title = "Feature.Avatar.Action.Shop",
	report = "Feature.Catalog.Action.Report"
}

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), REPORT_MENU_ITEM_ID (ref), REPORT_ICON (ref), reactModule (ref), menu (ref), inputSize (ref), popoverSide (ref), popoverAlign (ref), iconButton (ref), OVERFLOW_ICON (ref), buttonVariant (ref), view (ref), iconName (ref), text (ref)
	local var1 = useLocalization(t)
	local t_1 = {}
	
	if p1.isReportingEnabled then
		table.insert(t_1, {
			id = REPORT_MENU_ITEM_ID,
			icon = REPORT_ICON,
			text = var1.report
		})
	end
	return reactModule.createElement(view, {
		tag = "row flex-between align-y-center size-full-1200 padding-x-xlarge radius-medium bg-surface-0"
	}, {
		Leading = reactModule.createElement(view, {
			tag = "row align-y-center gap-small auto-xy",
			LayoutOrder = 1
		}, {
			CloseButtonContainer = reactModule.createElement(view, { tag = "auto-xy padding-top-xxsmall", LayoutOrder = 1 }, {
				CloseButton = reactModule.createElement(iconButton, {
					isCircular = false,
					icon = iconName.X,
					size = inputSize.Medium,
					variant = buttonVariant.Utility,
					onActivated = p1.onClose
				})
			}),
			Title = reactModule.createElement(text, {
				tag = "size-0-1000 auto-x text-heading-small text-align-y-center content-emphasis",
				LayoutOrder = 2,
				Text = var1.title
			})
		}),
		Trailing = reactModule.createElement(view, {
			tag = "row align-y-center gap-small auto-xy",
			LayoutOrder = 2
		}, {
			Overflow = if p1.isReportingEnabled then reactModule.createElement(menu, {
				LayoutOrder = 1,
				testId = "TopBar_OverflowMenu",
				isOpen = p1.isOverflowMenuOpen,
				items = t_1,
				size = inputSize.Medium,
				side = popoverSide.Top,
				align = popoverAlign.End,
				onPressedOutside = p1.onOverflowMenuClosed,
				onActivated = p1.onMenuItemActivated
			}, {
				Trigger = reactModule.createElement(iconButton, {
					isCircular = false,
					testId = "TopBar_OverflowButton",
					icon = OVERFLOW_ICON,
					size = inputSize.Medium,
					variant = buttonVariant.Utility,
					onActivated = p1.onOverflowActivated
				})
			}) else nil,
			SearchButton = reactModule.createElement(iconButton, {
				isCircular = false,
				LayoutOrder = 2,
				testId = "SearchButton",
				icon = iconName.MagnifyingGlass,
				size = inputSize.Medium,
				variant = buttonVariant.Utility,
				onActivated = p1.onSearchOpen
			})
		})
	})
end