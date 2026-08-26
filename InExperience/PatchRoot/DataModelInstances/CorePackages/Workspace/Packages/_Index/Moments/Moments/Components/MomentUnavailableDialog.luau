local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local dialog = foundationModule.Dialog
local useLocalization = localizationModule.Hooks.useLocalization
local t = {
	title = "Feature.Moments.Label.MomentUnavailable",
	body = "Feature.Moments.Label.MomentUnavailableDefault",
	ok = "Feature.Moments.Action.Ok"
}

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), dialog (ref), foundationModule (ref)
	local var1 = useLocalization(t)
	
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		size = foundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var1.title }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var1.body })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var1.ok,
					variant = foundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onDismiss
				}
			}
		})
	})
end