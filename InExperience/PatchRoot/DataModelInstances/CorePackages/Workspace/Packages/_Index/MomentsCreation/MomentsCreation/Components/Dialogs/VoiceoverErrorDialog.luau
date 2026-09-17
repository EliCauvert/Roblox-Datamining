local parent = script:FindFirstAncestor("MomentsCreation").Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local dialog = foundationModule.Dialog
local useLocalization = localizationModule.Hooks.useLocalization

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), dialog (ref), foundationModule (ref)
	local var1 = useLocalization({
		title = "CommonUI.Messages.Response.SomethingWentWrong",
		tryAgain = "Feature.Moments.Action.TryAgain"
	})
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		size = foundationModule.Enums.DialogSize.Small,
		onClose = p1.onDismiss
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var1.title }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, { Text = p1.message })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var1.tryAgain,
					variant = foundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onTryAgain
				}
			}
		})
	})
end