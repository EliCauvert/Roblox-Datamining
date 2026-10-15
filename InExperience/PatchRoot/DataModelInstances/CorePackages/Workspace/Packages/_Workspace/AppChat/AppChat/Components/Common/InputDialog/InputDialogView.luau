local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local text = foundationModule.Text
local textInput = foundationModule.TextInput
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialogSize = foundationModule.Enums.DialogSize

return function(p1)
	-- upvalues: reactModule (ref), dialog (ref), dialogSize (ref), textInput (ref), text (ref), buttonVariant (ref)
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "InputDialogView",
		ref = p1.dialogRef,
		size = dialogSize.Small
	}, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = p1.titleText or "" }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Input = reactModule.createElement(textInput, {
				LayoutOrder = 1,
				label = "",
				testId = "InputDialogView--input",
				text = p1.text,
				placeholder = p1.placeholderText,
				hint = p1.counterText,
				hasError = p1.isOverLimit,
				onChanged = p1.onTextChanged,
				width = UDim.new(1, 0)
			}),
			Warning = if p1.warningText then reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-alert",
				testId = "InputDialogView--warning",
				Text = p1.warningText
			}) else nil
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = p1.cancelText,
					variant = buttonVariant.Standard,
					onActivated = p1.onCancel,
					isDisabled = p1.isLoading
				},
				{
					text = p1.confirmText,
					variant = buttonVariant.Emphasis,
					onActivated = p1.onConfirm,
					isDisabled = p1.isOverLimit,
					isLoading = p1.isLoading
				}
			}
		})
	})
end