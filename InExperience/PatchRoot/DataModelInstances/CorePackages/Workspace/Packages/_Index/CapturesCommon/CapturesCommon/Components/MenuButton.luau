local parent = script.Parent.Parent.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local button = foundationModule.Button
local buttonSize = foundationModule.Enums.ButtonSize
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: reactModule (ref), view (ref), button (ref), buttonSize (ref), buttonVariant (ref)
	return reactModule.createElement(view, {
		tag = "bg-action-subtle align-x-center align-y-center auto-xy padding-bottom-medium",
		AnchorPoint = p1.AnchorPoint,
		LayoutOrder = p1.LayoutOrder,
		Position = p1.Position
	}, {
		ShowMoreButton = reactModule.createElement(button, {
			onActivated = p1.onActivated,
			size = buttonSize.Small,
			text = p1.text,
			variant = buttonVariant.Subtle
		})
	})
end