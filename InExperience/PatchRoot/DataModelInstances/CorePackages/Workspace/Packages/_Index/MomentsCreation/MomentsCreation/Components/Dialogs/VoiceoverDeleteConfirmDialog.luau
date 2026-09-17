local parent = script:FindFirstAncestor("MomentsCreation").Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local dialog = foundationModule.Dialog
local useLocalization = localizationModule.Hooks.useLocalization

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), dialog (ref), foundationModule (ref)
	local var1 = useLocalization({
		title = "Feature.Moments.Label.DeleteVoiceoverTitle",
		body = "Feature.Moments.Label.DeleteVoiceoverBody",
		delete = "Feature.Moments.Action.Delete",
		cancel = "Feature.Moments.Action.Cancel"
	})
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		size = foundationModule.Enums.DialogSize.Small
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var1.title }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var1.body })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = foundationModule.Enums.Orientation.Vertical,
			actions = {
				{
					text = var1.delete,
					variant = foundationModule.Enums.ButtonVariant.Alert,
					onActivated = p1.onConfirm
				},
				{
					text = var1.cancel,
					variant = foundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onCancel
				}
			}
		})
	})
end