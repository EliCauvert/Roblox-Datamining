local Parent = script:FindFirstAncestor("MomentsCreation").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Dialog = FoundationModule.Dialog
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), Dialog (copy), FoundationModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.Moments.Label.DeleteVoiceoverTitle",
		body = "Feature.Moments.Label.DeleteVoiceoverBody",
		delete = "Feature.Moments.Action.Delete",
		cancel = "Feature.Moments.Action.Cancel"
	})
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		size = FoundationModule.Enums.DialogSize.Small
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.title }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			DialogText = ReactModule.createElement(Dialog.Text, { Text = UseLocalizationResult.body })
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			orientation = FoundationModule.Enums.Orientation.Vertical,
			actions = {
				{
					text = UseLocalizationResult.delete,
					variant = FoundationModule.Enums.ButtonVariant.Alert,
					onActivated = p1.onConfirm
				},
				{
					text = UseLocalizationResult.cancel,
					variant = FoundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onCancel
				}
			}
		})
	})
end