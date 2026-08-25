local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p0)
	-- upvalues: useLocalization (ref), reactModule (ref), dialog (ref), buttonVariant (ref)
	local var2 = useLocalization({
		confirmButtonText = "CommonUI.Controls.Action.Confirm",
		cancelButtonText = "CommonUI.Controls.Action.Cancel"
	})
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		disablePortal = p0.disablePortal,
		onClose = if p0.showCloseButton then p0.onCancel else nil
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = p0.title }),
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			DialogText = reactModule.createElement(dialog.Text, { Text = p0.body })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			actions = {
				{
					variant = buttonVariant.Emphasis,
					text = p0.confirmButtonText or var2.confirmButtonText,
					onActivated = p0.onConfirm
				},
				{
					variant = buttonVariant.Standard,
					text = p0.cancelButtonText or var2.cancelButtonText,
					onActivated = p0.onCancel
				}
			}
		})
	})
end