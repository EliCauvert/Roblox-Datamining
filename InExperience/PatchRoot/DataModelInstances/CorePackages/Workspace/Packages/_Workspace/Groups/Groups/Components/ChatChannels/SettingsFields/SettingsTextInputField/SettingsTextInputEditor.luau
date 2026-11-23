local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return {
	Content = function(p1)
		-- upvalues: ReactModule (copy), FoundationModule (copy)
		return ReactModule.createElement(FoundationModule.View, {
			tag = "col gap-medium size-full-0 auto-y",
			LayoutOrder = 1
		}, {
			Description = if p1.description then ReactModule.createElement(FoundationModule.Text, {
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
				LayoutOrder = 1,
				Text = p1.description
			}) else nil,
			Input = ReactModule.createElement(FoundationModule.View, {
				tag = "col gap-xsmall size-full-0 auto-y",
				LayoutOrder = 2
			}, {
				TextInput = ReactModule.createElement(FoundationModule.TextInput, {
					label = "",
					LayoutOrder = 1,
					inputRef = p1.inputRef,
					text = p1.draft,
					onChanged = p1.onDraftChanged,
					onReturnPressed = p1.onSave,
					hasError = p1.hasError,
					width = UDim.new(1, 0),
					testId = `{p1.testId}--input`
				}),
				RemainingCharacters = ReactModule.createElement(FoundationModule.Text, {
					tag = "size-full-0 auto-y text-caption-small text-align-x-right content-muted",
					LayoutOrder = 2,
					Text = tostring(p1.remainingCharacters)
				})
			})
		})
	end,
	Actions = function(p1)
		-- upvalues: FoundationModule (copy), ReactModule (copy)
		return ReactModule.createElement(FoundationModule.ButtonGroup, {
			LayoutOrder = 3,
			fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
			buttons = {
				{
					text = p1.cancelText,
					variant = FoundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onCancel,
					testId = `{p1.testId}--cancel`
				},
				{
					text = p1.saveText,
					variant = FoundationModule.Enums.ButtonVariant.Emphasis,
					isDisabled = not p1.canSave,
					onActivated = p1.onSave,
					testId = `{p1.testId}--save`
				}
			}
		})
	end
}