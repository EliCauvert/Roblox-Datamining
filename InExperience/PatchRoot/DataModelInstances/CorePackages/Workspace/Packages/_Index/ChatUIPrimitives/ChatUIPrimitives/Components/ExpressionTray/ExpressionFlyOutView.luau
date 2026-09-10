local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useDismissOnEscapeOrMenuModule = require(chatUIPrimitives.Hooks.useDismissOnEscapeOrMenu)

return reactModule.memo(function(p1)
	-- upvalues: useDismissOnEscapeOrMenuModule (ref), reactModule (ref), foundationModule (ref)
	useDismissOnEscapeOrMenuModule(p1.isOpen, p1.onPressedOutside)
	
	return reactModule.createElement(foundationModule.Popover.Root, { isOpen = p1.isOpen }, {
		Anchor = reactModule.createElement(foundationModule.Popover.Anchor, nil, {
			AnchorWrapper = reactModule.createElement(foundationModule.View, {
				tag = "col align-x-center align-y-bottom size-0-full auto-x",
				padding = if p1.addTopPadding then { top = UDim.new(0, 6) } else nil
			}, { Button = p1.anchorContent })
		}),
		Content = reactModule.createElement(foundationModule.Popover.Content, {
			hasArrow = false,
			side = {
				offset = 7,
				position = foundationModule.Enums.PopoverSide.Right
			},
			align = {
				offset = 3,
				position = foundationModule.Enums.PopoverAlign.Start
			},
			radius = foundationModule.Enums.Radius.Medium,
			onPressedOutside = p1.onPressedOutside
		}, {
			ContentWrapper = reactModule.createElement(foundationModule.View, {
				Size = UDim2.fromOffset(p1.width or 360, p1.height or 240)
			}, { Container = p1.content })
		})
	})
end)