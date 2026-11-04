local Parent = script:FindFirstAncestor("InExperienceShop").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum

return function(p1)
	-- upvalues: UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), ButtonVariant (copy)
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		ref = UseFocusRootFunction({
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
		}),
		size = DialogSize.Medium,
		onClose = p1.onClose
	}, {
		Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = p1.title }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			BodyText = ReactModule.createElement(Dialog.Text, { Text = p1.body })
		}),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = p1.actionText,
					variant = ButtonVariant.Emphasis,
					onActivated = p1.onAction
				}
			}
		})
	})
end