local Parent = script:FindFirstAncestor("AppBlox").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local ButtonVariant = FoundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), Dialog (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		confirmButtonText = "CommonUI.Controls.Action.Confirm",
		cancelButtonText = "CommonUI.Controls.Action.Cancel"
	})
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		disablePortal = p1.disablePortal,
		onClose = if p1.showCloseButton then p1.onCancel else nil
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = p1.title }),
		DialogContent = ReactModule.createElement(Dialog.Content, nil, {
			DialogText = ReactModule.createElement(Dialog.Text, { Text = p1.body })
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			actions = {
				{
					variant = ButtonVariant.Emphasis,
					text = p1.confirmButtonText or UseLocalizationResult.confirmButtonText,
					onActivated = p1.onConfirm
				},
				{
					variant = ButtonVariant.Standard,
					text = p1.cancelButtonText or UseLocalizationResult.cancelButtonText,
					onActivated = p1.onCancel
				}
			}
		})
	})
end