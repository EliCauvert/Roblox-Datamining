local Parent = script:FindFirstAncestor("MomentsCreation").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Dialog = FoundationModule.Dialog
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), Dialog (copy), FoundationModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "CommonUI.Messages.Response.SomethingWentWrong",
		tryAgain = "Feature.Moments.Action.TryAgain"
	})
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		size = FoundationModule.Enums.DialogSize.Small,
		onClose = p1.onDismiss
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.title }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			DialogText = ReactModule.createElement(Dialog.Text, { Text = p1.message })
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseLocalizationResult.tryAgain,
					variant = FoundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onTryAgain
				}
			}
		})
	})
end