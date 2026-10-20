local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseDismissOnEscapeOrMenuModule = require(ChatUIPrimitives.Hooks.useDismissOnEscapeOrMenu)
local config = {
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop
}

return ReactModule.memo(function(p1)
	-- upvalues: UseDismissOnEscapeOrMenuModule (copy), ReactModule (copy), FoundationModule (copy), config (copy)
	UseDismissOnEscapeOrMenuModule(p1.isOpen, p1.onPressedOutside)
	
	return ReactModule.createElement(FoundationModule.Popover.Root, { isOpen = p1.isOpen }, {
		Anchor = ReactModule.createElement(FoundationModule.Popover.Anchor, nil, {
			AnchorWrapper = ReactModule.createElement(FoundationModule.View, {
				tag = "col align-x-center align-y-bottom size-0-full auto-x",
				padding = if p1.addTopPadding then { top = UDim.new(0, 6) } else nil
			}, { Button = p1.anchorContent })
		}),
		Content = ReactModule.createElement(FoundationModule.Popover.Content, {
			hasArrow = false,
			side = {
				offset = 7,
				position = FoundationModule.Enums.PopoverSide.Right
			},
			align = {
				offset = 3,
				position = FoundationModule.Enums.PopoverAlign.Start
			},
			radius = FoundationModule.Enums.Radius.Medium,
			onPressedOutside = p1.onPressedOutside
		}, {
			ContentWrapper = ReactModule.createElement(FoundationModule.View, {
				Size = UDim2.fromOffset(p1.width or 360, p1.height or 240),
				ref = p1.contentRef,
				selectionGroup = if p1.focusNavEnabled then config else nil
			}, { Container = p1.content })
		})
	})
end)