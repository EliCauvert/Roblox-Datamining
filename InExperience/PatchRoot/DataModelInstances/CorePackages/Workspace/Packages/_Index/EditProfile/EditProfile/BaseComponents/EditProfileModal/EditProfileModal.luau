local parent = script:FindFirstAncestor("EditProfile").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local buttonVariant = foundationModule.Enums.ButtonVariant
local useLocalization = require(parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), dialog (ref), buttonVariant (ref)
	local var1 = useLocalization({ title = p1.titleKey, saveButtonText = p1.saveKey })
	
	return reactModule.createElement(dialog.Root, { onClose = p1.onClose }, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var1.title }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, p1.component),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var1.saveButtonText,
					variant = buttonVariant.Emphasis,
					isLoading = p1.isLoading,
					isDisabled = p1.isDisabled,
					onActivated = p1.onSave
				}
			}
		})
	})
end