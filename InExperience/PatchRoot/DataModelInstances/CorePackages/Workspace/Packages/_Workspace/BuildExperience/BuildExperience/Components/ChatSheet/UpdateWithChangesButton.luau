local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize

return function(p0) --[[ line: 18 | named "UpdateWithChangesButton" ]]
	-- upvalues: reactModule (ref), button (ref), inputSize (ref), buttonVariant (ref)
	return reactModule.createElement(button, {
		text = "Update with changes",
		size = inputSize.Medium,
		variant = buttonVariant.Emphasis,
		width = UDim.new(1, 0),
		onActivated = p0.onActivated,
		LayoutOrder = p0.LayoutOrder
	})
end