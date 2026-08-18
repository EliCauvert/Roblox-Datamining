local parent = script:FindFirstAncestor("MomentsCreation").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local dialog = foundationModule.Dialog

return function(p0) --[[ line: 26 | named "VoiceoverErrorDialog" ]]
	-- upvalues: reactModule (ref), dialog (ref), foundationModule (ref)
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		size = foundationModule.Enums.DialogSize.Small,
		onClose = p0.onDismiss
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = "Something went wrong", LayoutOrder = 1 }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, { Text = p0.message })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = "Try again",
					variant = foundationModule.Enums.ButtonVariant.Standard,
					onActivated = p0.onTryAgain
				}
			}
		})
	})
end