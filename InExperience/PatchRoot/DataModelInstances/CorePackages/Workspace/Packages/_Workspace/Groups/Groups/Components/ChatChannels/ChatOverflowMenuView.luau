local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return function(Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return if #Frame.menuItems == 0 then nil else ReactModule.createElement(FoundationModule.Menu, {
		items = Frame.menuItems,
		isOpen = Frame.isMenuOpen,
		onPressedOutside = Frame.onCloseMenu,
		side = FoundationModule.Enums.PopoverSide.Bottom,
		align = FoundationModule.Enums.PopoverAlign.End,
		selectionGroup = {
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		},
		ref = Frame.menuRef,
		LayoutOrder = Frame.LayoutOrder,
		testId = `{Frame.testId}--menu`
	}, {
		Trigger = ReactModule.createElement(FoundationModule.IconButton, {
			icon = FoundationModule.Enums.IconName.ThreeDotsHorizontal,
			variant = FoundationModule.Enums.ButtonVariant.Utility,
			size = FoundationModule.Enums.InputSize.Small,
			onActivated = Frame.onToggleMenu,
			testId = `{Frame.testId}--overflow`
		})
	})
end