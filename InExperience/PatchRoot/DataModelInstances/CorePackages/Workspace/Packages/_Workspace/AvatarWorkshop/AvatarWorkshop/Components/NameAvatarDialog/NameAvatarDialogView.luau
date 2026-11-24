local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Dialog = FoundationModule.Dialog
local TextInput = FoundationModule.TextInput
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local InputSize = FoundationModule.Enums.InputSize
local Orientation = FoundationModule.Enums.Orientation

return function(p1)
	-- upvalues: ButtonVariant (copy), Orientation (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), TextInput (copy), InputSize (copy)
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "avatar-workshop-name-avatar-dialog",
		size = DialogSize.Small,
		onClose = p1.onCancel
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = p1.title }),
		DialogContent = ReactModule.createElement(Dialog.Content, nil, {
			NameInput = ReactModule.createElement(TextInput, {
				label = "",
				testId = "avatar-workshop-name-avatar-dialog-name-input",
				text = p1.name,
				size = InputSize.Medium,
				width = UDim.new(1, 0),
				hasError = p1.hasNameError,
				hint = p1.nameHint,
				onChanged = p1.onNameChanged,
				onReturnPressed = p1.onConfirm
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 1,
			actions = {
				{
					text = p1.addText,
					variant = ButtonVariant.Emphasis,
					isDisabled = not p1.canConfirm,
					onActivated = p1.onConfirm
				},
				{
					text = p1.cancelText,
					variant = ButtonVariant.Standard,
					onActivated = p1.onCancel
				}
			},
			orientation = Orientation.Vertical
		})
	})
end