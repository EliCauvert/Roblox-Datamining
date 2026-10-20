local Parent = script:FindFirstAncestor("EditProfile").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), Dialog (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({ title = p1.titleKey, saveButtonText = p1.saveKey })
	
	return ReactModule.createElement(Dialog.Root, { onClose = p1.onClose }, {
		Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.title }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, p1.component),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseLocalizationResult.saveButtonText,
					variant = ButtonVariant.Emphasis,
					isLoading = p1.isLoading,
					isDisabled = p1.isDisabled,
					onActivated = p1.onSave
				}
			}
		})
	})
end