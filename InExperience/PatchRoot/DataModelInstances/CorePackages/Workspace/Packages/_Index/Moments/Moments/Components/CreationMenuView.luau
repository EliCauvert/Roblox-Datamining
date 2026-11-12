local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local PlusLarge = require(Parent.BuilderIcons).Icon.PlusLarge
local IconButton = FoundationModule.IconButton
local Menu = FoundationModule.Menu
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize

return function(p1)
	-- upvalues: ReactModule (copy), Menu (copy), FoundationModule (copy), IconButton (copy), PlusLarge (copy), ButtonVariant (copy), InputSize (copy)
	return ReactModule.createElement(Menu, {
		align = FoundationModule.Enums.PopoverAlign.End,
		isOpen = p1.isOpen,
		items = p1.items,
		LayoutOrder = p1.layoutOrder,
		onPressedOutside = p1.onPressedOutside,
		ref = p1.menuRef,
		side = FoundationModule.Enums.PopoverSide.Bottom,
		testId = p1.testId
	}, {
		Trigger = ReactModule.createElement(IconButton, {
			isCircular = true,
			Selectable = true,
			LayoutOrder = p1.layoutOrder,
			icon = PlusLarge,
			onActivated = p1.onToggle,
			variant = p1.buttonVariant or ButtonVariant.Utility,
			size = InputSize.Medium,
			testId = p1.buttonTestId or "--moments-creation-menu-button"
		})
	})
end