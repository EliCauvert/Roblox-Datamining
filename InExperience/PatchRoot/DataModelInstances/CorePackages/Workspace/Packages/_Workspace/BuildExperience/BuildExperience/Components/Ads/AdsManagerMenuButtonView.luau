local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local IconButton = FoundationModule.IconButton
local Menu = FoundationModule.Menu
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide

return function(p1) --[[ Line: 28 | Named "AdsManagerMenuButtonView" ]]
	-- upvalues: ReactModule (copy), Menu (copy), PopoverAlign (copy), PopoverSide (copy), IconButton (copy), IconName (copy), ButtonVariant (copy)
	return ReactModule.createElement(Menu, {
		LayoutOrder = p1.layoutOrder,
		align = PopoverAlign.End,
		isOpen = p1.isMenuOpen,
		items = p1.menuItems,
		onActivated = p1.onItemActivated,
		onPressedOutside = p1.onCloseMenu,
		side = PopoverSide.Bottom,
		size = p1.menuSize,
		testId = `{p1.testId}.Menu`,
		width = UDim.new(0, p1.menuWidth)
	}, {
		Button = ReactModule.createElement(IconButton, {
			isCircular = true,
			icon = IconName.ThreeDotsHorizontal,
			onActivated = p1.onToggleMenu,
			size = p1.buttonSize,
			testId = `{p1.testId}.Button`,
			variant = ButtonVariant.Utility
		})
	})
end