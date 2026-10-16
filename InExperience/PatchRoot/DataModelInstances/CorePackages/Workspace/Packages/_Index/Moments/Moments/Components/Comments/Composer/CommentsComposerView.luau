local Parent = script:FindFirstAncestor("Moments").Parent
local ComposerModule = require(Parent.AppBlox.Composer)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local config = { placeholder = "Feature.Moments.Label.WriteComment" }

return function(p1) --[[ Line: 29 | Named "CommentsComposerView" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), ComposerModule (copy), InputSize (copy), FoundationModule (copy), StateLayerAffordance (copy), IconName (copy), ButtonVariant (copy)
	return ReactModule.createElement(ComposerModule, {
		minLines = 1,
		maxLines = 5,
		label = "",
		testId = "moments-comments-composer",
		width = UDim.new(1, 0),
		size = InputSize.Medium,
		placeholder = UseLocalizationFunction(config).placeholder,
		text = p1.text,
		hint = p1.errorMessage,
		hasError = p1.errorMessage ~= nil,
		isDisabled = p1.isInputDisabled,
		onChanged = p1.onTextChanged,
		onReturnPressed = p1.onSubmit,
		trailingElement = ReactModule.createElement(FoundationModule.View, { tag = "size-800-1000" }, {
			SubmitHitArea = ReactModule.createElement(FoundationModule.View, {
				tag = "position-center-center anchor-center-center size-1000-1000",
				testId = "moments-comments-composer-submit-hit-area",
				isDisabled = not p1.isSubmitEnabled,
				onActivated = p1.onSubmit,
				selection = { Selectable = false },
				stateLayer = { affordance = StateLayerAffordance.None }
			}, {
				SubmitButton = ReactModule.createElement(FoundationModule.IconButton, {
					isCircular = true,
					testId = "moments-comments-composer-submit",
					icon = IconName.ArrowMediumUp,
					variant = if p1.isSubmitEnabled then ButtonVariant.Emphasis else ButtonVariant.Standard,
					size = InputSize.XSmall,
					isDisabled = not p1.isSubmitEnabled,
					onActivated = p1.onSubmit,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5)
				})
			})
		})
	})
end