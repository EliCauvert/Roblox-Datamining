local parent = script:FindFirstAncestor("EditProfile").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local buttonVariant = foundationModule.Enums.ButtonVariant
local useLocalization = require(parent.Localization).Hooks.useLocalization

return function(p0)
	-- upvalues: useLocalization (ref), reactModule (ref), dialog (ref), buttonVariant (ref)
	local var2 = useLocalization({ title = p0.titleKey, saveButtonText = p0.saveKey })
	
	return reactModule.createElement(dialog.Root, { onClose = p0.onClose }, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var2.title }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, p0.component),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var2.saveButtonText,
					variant = buttonVariant.Emphasis,
					isLoading = p0.isLoading,
					isDisabled = p0.isDisabled,
					onActivated = p0.onSave
				}
			}
		})
	})
end