local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), dialog (ref), buttonVariant (ref)
	local var1 = useLocalization({
		confirmButtonText = "CommonUI.Controls.Action.Confirm",
		cancelButtonText = "CommonUI.Controls.Action.Cancel"
	})
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		disablePortal = p1.disablePortal,
		onClose = if p1.showCloseButton then p1.onCancel else nil
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = p1.title }),
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			DialogText = reactModule.createElement(dialog.Text, { Text = p1.body })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			actions = {
				{
					variant = buttonVariant.Emphasis,
					text = p1.confirmButtonText or var1.confirmButtonText,
					onActivated = p1.onConfirm
				},
				{
					variant = buttonVariant.Standard,
					text = p1.cancelButtonText or var1.cancelButtonText,
					onActivated = p1.onCancel
				}
			}
		})
	})
end