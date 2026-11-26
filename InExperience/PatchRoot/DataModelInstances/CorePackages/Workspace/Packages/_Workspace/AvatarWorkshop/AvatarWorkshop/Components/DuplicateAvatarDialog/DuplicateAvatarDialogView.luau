local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Dialog = FoundationModule.Dialog
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local Orientation = FoundationModule.Enums.Orientation

return function(p1)
	-- upvalues: Orientation (copy), ButtonVariant (copy), ReactModule (copy), Dialog (copy), DialogSize (copy)
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "avatar-workshop-duplicate-avatar-dialog",
		size = DialogSize.Small,
		onClose = p1.onCancel
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = p1.title }),
		DialogContent = ReactModule.createElement(Dialog.Content, nil, {
			DialogText = ReactModule.createElement(Dialog.Text, { Text = p1.body })
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 1,
			orientation = Orientation.Vertical,
			actions = {
				{
					text = p1.addText,
					variant = ButtonVariant.Emphasis,
					onActivated = p1.onConfirm
				},
				{
					text = p1.cancelText,
					variant = ButtonVariant.Standard,
					onActivated = p1.onCancel
				}
			}
		})
	})
end