local Parent = script:FindFirstAncestor("Gifting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local Orientation = FoundationModule.Enums.Orientation

return ReactModule.memo(function(p1) --[[ Line: 26 | Named "GiftRejectConfirmationView" ]]
	-- upvalues: ButtonVariant (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), Orientation (copy)
	return if p1.isOpen then ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		testId = "GiftRejectConfirmationView",
		size = DialogSize.Small
	}, {
		Title = ReactModule.createElement(Dialog.Title, { text = p1.titleText }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 1 }, {
			Body = ReactModule.createElement(Dialog.Text, { Text = p1.bodyText })
		}),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 2,
			orientation = Orientation.Horizontal,
			actions = {
				{
					text = p1.rejectLabel,
					variant = ButtonVariant.Alert,
					isLoading = p1.isRejectLoading,
					onActivated = p1.onReject
				},
				{
					text = p1.cancelLabel,
					variant = ButtonVariant.Standard,
					onActivated = p1.onCancel
				}
			}
		})
	}) else nil
end)