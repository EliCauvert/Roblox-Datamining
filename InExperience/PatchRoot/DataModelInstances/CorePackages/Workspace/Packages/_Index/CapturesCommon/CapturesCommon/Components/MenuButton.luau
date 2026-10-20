local Parent = script.Parent.Parent.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local Button = FoundationModule.Button
local ButtonSize = FoundationModule.Enums.ButtonSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant

return function(Frame: Frame)
	-- upvalues: ReactModule (copy), View (copy), Button (copy), ButtonSize (copy), ButtonVariant (copy)
	return ReactModule.createElement(View, {
		tag = "bg-action-subtle align-x-center align-y-center auto-xy padding-bottom-medium",
		AnchorPoint = Frame.AnchorPoint,
		LayoutOrder = Frame.LayoutOrder,
		Position = Frame.Position
	}, {
		ShowMoreButton = ReactModule.createElement(Button, {
			onActivated = Frame.onActivated,
			size = ButtonSize.Small,
			text = Frame.text,
			variant = ButtonVariant.Subtle
		})
	})
end