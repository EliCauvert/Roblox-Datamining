local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local IconButton = FoundationModule.IconButton
local Menu = FoundationModule.Menu
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide

return function(Frame)
	-- upvalues: ReactModule (copy), Menu (copy), PopoverSide (copy), PopoverAlign (copy), InputSize (copy), IconButton (copy), IconName (copy), ButtonVariant (copy)
	return ReactModule.createElement(Menu, {
		ref = Frame.focusRootRef,
		isOpen = Frame.isOpen,
		items = Frame.items,
		side = PopoverSide.Top,
		align = PopoverAlign.Start,
		size = InputSize.Large,
		onPressedOutside = Frame.onClose,
		LayoutOrder = Frame.LayoutOrder,
		testId = `{Frame.testId}.Menu`
	}, {
		Anchor = ReactModule.createElement(IconButton, {
			isCircular = true,
			icon = IconName.PlusSmall,
			isDisabled = Frame.isDisabled,
			onActivated = Frame.onToggle,
			size = InputSize.Small,
			variant = ButtonVariant.Standard,
			testId = Frame.testId
		})
	})
end