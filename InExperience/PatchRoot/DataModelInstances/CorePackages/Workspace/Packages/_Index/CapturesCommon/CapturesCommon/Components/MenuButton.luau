local parent = script.Parent.Parent.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local button = foundationModule.Button
local buttonSize = foundationModule.Enums.ButtonSize
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p0) --[[ line: 22 ]]
	-- upvalues: reactModule (ref), view (ref), button (ref), buttonSize (ref), buttonVariant (ref)
	return reactModule.createElement(view, {
		tag = "bg-action-subtle align-x-center align-y-center auto-xy padding-bottom-medium",
		AnchorPoint = p0.AnchorPoint,
		LayoutOrder = p0.LayoutOrder,
		Position = p0.Position
	}, {
		ShowMoreButton = reactModule.createElement(button, {
			onActivated = p0.onActivated,
			size = buttonSize.Small,
			text = p0.text,
			variant = buttonVariant.Subtle
		})
	})
end