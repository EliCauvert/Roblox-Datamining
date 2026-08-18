local parent = script:FindFirstAncestor("MomentsCreation").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local dialog = foundationModule.Dialog

return function(p0) --[[ line: 27 | named "VoiceoverDeleteConfirmDialog" ]]
	-- upvalues: reactModule (ref), dialog (ref), foundationModule (ref)
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		size = foundationModule.Enums.DialogSize.Small,
		onClose = p0.onCancel
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = "Delete voiceover?", LayoutOrder = 1 }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, {
				Text = "This clears your text and any generated voiceover. You can start over anytime."
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = foundationModule.Enums.Orientation.Vertical,
			actions = {
				{
					text = "Delete",
					variant = foundationModule.Enums.ButtonVariant.Alert,
					onActivated = p0.onConfirm
				},
				{
					text = "Cancel",
					variant = foundationModule.Enums.ButtonVariant.Standard,
					onActivated = p0.onCancel
				}
			}
		})
	})
end