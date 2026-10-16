local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Dialog = FoundationModule.Dialog
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local config = {
	title = "Feature.Moments.Label.MomentUnavailable",
	body = "Feature.Moments.Label.MomentUnavailableDefault",
	ok = "Feature.Moments.Action.Ok"
}

return function(p1) --[[ Line: 22 | Named "MomentUnavailableDialog" ]]
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
					text = UseLocalizationResult.ok,
					variant = FoundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onDismiss
				}
			}
		})
	})
end