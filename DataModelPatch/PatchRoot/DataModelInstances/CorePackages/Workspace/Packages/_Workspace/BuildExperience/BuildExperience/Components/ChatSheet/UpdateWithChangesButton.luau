local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize

return function(Frame)
	-- upvalues: ReactModule (copy), Button (copy), InputSize (copy), ButtonVariant (copy)
	return ReactModule.createElement(Button, {
		text = "Update with changes",
		size = InputSize.Medium,
		variant = ButtonVariant.Emphasis,
		width = UDim.new(1, 0),
		onActivated = Frame.onActivated,
		LayoutOrder = Frame.LayoutOrder
	})
end