local parent = script:FindFirstAncestor("Moments").Parent
local composerModule = require(parent.AppBlox.Composer)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance

return function(p1)
	-- upvalues: reactModule (ref), composerModule (ref), inputSize (ref), foundationModule (ref), stateLayerAffordance (ref), iconName (ref), buttonVariant (ref)
	return reactModule.createElement(composerModule, {
		minLines = 1,
		maxLines = 5,
		label = "",
		placeholder = "Write a comment",
		testId = "moments-comments-composer",
		width = UDim.new(1, 0),
		size = inputSize.Medium,
		text = p1.text,
		hint = p1.errorMessage,
		hasError = p1.errorMessage ~= nil,
		isDisabled = p1.isInputDisabled,
		onChanged = p1.onTextChanged,
		onReturnPressed = p1.onSubmit,
		trailingElement = reactModule.createElement(foundationModule.View, { tag = "size-800-1000" }, {
			SubmitHitArea = reactModule.createElement(foundationModule.View, {
				tag = "position-center-center anchor-center-center size-1000-1000",
				testId = "moments-comments-composer-submit-hit-area",
				isDisabled = not p1.isSubmitEnabled,
				onActivated = p1.onSubmit,
				selection = { Selectable = false },
				stateLayer = { affordance = stateLayerAffordance.None }
			}, {
				SubmitButton = reactModule.createElement(foundationModule.IconButton, {
					isCircular = true,
					testId = "moments-comments-composer-submit",
					icon = iconName.ArrowMediumUp,
					variant = if p1.isSubmitEnabled then buttonVariant.Emphasis else buttonVariant.Standard,
					size = inputSize.XSmall,
					isDisabled = not p1.isSubmitEnabled,
					onActivated = p1.onSubmit,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5)
				})
			})
		})
	})
end