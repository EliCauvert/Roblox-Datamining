local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local toast = foundationModule.Toast
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: reactModule (ref), view (ref), toast (ref), buttonVariant (ref)
	return if p1.isVisible then reactModule.createElement(view, {
		tag = "col anchor-top-center auto-y",
		testId = "CaptureModeView",
		Position = UDim2.new(0.5, 0, 0, 12),
		Size = UDim2.new(1, -24, 0, 0),
		sizeConstraint = { MaxSize = Vector2.new(360, 10000) }
	}, {
		Instructions = reactModule.createElement(toast, {
			testId = "CaptureModeView.Instructions",
			actions = {
				{
					text = "Cancel",
					onActivated = p1.onClose,
					variant = buttonVariant.Standard
				}
			},
			text = p1.description,
			title = p1.title,
			width = UDim.new(1, 0)
		})
	}) else nil
end