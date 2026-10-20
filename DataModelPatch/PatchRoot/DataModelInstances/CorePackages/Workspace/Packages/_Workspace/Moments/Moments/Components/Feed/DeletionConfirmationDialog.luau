local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Dialog = FoundationModule.Dialog
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local config = {
	title = "Feature.Moments.Label.DeleteMomentTitle",
	body = "Feature.Moments.Label.DeleteMomentBody",
	delete = "Feature.Moments.Action.Delete",
	cancel = "Feature.Moments.Action.Cancel"
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), Dialog (copy), FoundationModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		size = FoundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.title }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			DialogText = ReactModule.createElement(Dialog.Text, { Text = UseLocalizationResult.body })
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseLocalizationResult.delete,
					variant = FoundationModule.Enums.ButtonVariant.Emphasis,
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