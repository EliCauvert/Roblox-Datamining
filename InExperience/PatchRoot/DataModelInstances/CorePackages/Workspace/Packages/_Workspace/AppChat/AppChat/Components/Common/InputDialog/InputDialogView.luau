local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local Text = FoundationModule.Text
local TextInput = FoundationModule.TextInput
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize

return function(p1)
	-- upvalues: ReactModule (copy), Dialog (copy), DialogSize (copy), TextInput (copy), Text (copy), ButtonVariant (copy)
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "InputDialogView",
		ref = p1.dialogRef,
		size = DialogSize.Small
	}, {
		Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = p1.titleText or "" }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Input = ReactModule.createElement(TextInput, {
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
			Warning = if p1.warningText then ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-alert",
				testId = "InputDialogView--warning",
				Text = p1.warningText
			}) else nil
		}),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = p1.cancelText,
					variant = ButtonVariant.Standard,
					onActivated = p1.onCancel,
					isDisabled = p1.isLoading
				},
				{
					text = p1.confirmText,
					variant = ButtonVariant.Emphasis,
					onActivated = p1.onConfirm,
					isDisabled = p1.isOverLimit,
					isLoading = p1.isLoading
				}
			}
		})
	})
end