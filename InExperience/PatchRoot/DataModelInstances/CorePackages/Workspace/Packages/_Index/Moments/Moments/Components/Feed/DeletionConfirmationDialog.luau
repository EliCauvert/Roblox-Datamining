local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local dialog = foundationModule.Dialog
local useLocalization = localizationModule.Hooks.useLocalization
local t = {
	title = "Feature.Moments.Label.DeleteMomentTitle",
	body = "Feature.Moments.Label.DeleteMomentBody",
	delete = "Feature.Moments.Action.Delete",
	cancel = "Feature.Moments.Action.Cancel"
}

return function(p0) --[[ line: 24 | named "DeletionConfirmationDialog" ]]
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), dialog (ref), foundationModule (ref)
	local var4 = useLocalization(t)
	
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		size = foundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var4.title }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var4.body })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var4.delete,
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = p0.onConfirm
				},
				{
					text = var4.cancel,
					variant = foundationModule.Enums.ButtonVariant.Standard,
					onActivated = p0.onCancel
				}
			}
		})
	})
end