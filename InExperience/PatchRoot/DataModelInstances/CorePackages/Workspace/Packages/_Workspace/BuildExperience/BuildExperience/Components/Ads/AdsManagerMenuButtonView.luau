local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local iconButton = foundationModule.IconButton
local menu = foundationModule.Menu
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide

return function(p1)
	-- upvalues: reactModule (ref), menu (ref), popoverAlign (ref), popoverSide (ref), iconButton (ref), iconName (ref), buttonVariant (ref)
	return reactModule.createElement(menu, {
		LayoutOrder = p1.layoutOrder,
		align = popoverAlign.End,
		isOpen = p1.isMenuOpen,
		items = p1.menuItems,
		onActivated = p1.onItemActivated,
		onPressedOutside = p1.onCloseMenu,
		side = popoverSide.Bottom,
		size = p1.menuSize,
		testId = `{p1.testId}.Menu`,
		width = UDim.new(0, p1.menuWidth)
	}, {
		Button = reactModule.createElement(iconButton, {
			isCircular = true,
			icon = iconName.ThreeDotsHorizontal,
			onActivated = p1.onToggleMenu,
			size = p1.buttonSize,
			testId = `{p1.testId}.Button`,
			variant = buttonVariant.Utility
		})
	})
end