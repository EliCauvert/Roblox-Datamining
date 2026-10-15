local parent = script:FindFirstAncestor("Gifting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialogSize = foundationModule.Enums.DialogSize
local orientation = foundationModule.Enums.Orientation

return reactModule.memo(function(p1)
	-- upvalues: buttonVariant (ref), reactModule (ref), dialog (ref), dialogSize (ref), orientation (ref)
	return if p1.isOpen then reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		testId = "GiftRejectConfirmationView",
		size = dialogSize.Small
	}, {
		Title = reactModule.createElement(dialog.Title, { text = p1.titleText }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 1 }, {
			Body = reactModule.createElement(dialog.Text, { Text = p1.bodyText })
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 2,
			orientation = orientation.Horizontal,
			actions = {
				{
					text = p1.rejectLabel,
					variant = buttonVariant.Alert,
					isLoading = p1.isRejectLoading,
					onActivated = p1.onReject
				},
				{
					text = p1.cancelLabel,
					variant = buttonVariant.Standard,
					onActivated = p1.onCancel
				}
			}
		})
	}) else nil
end)