local Parent = script:FindFirstAncestor("InExperienceShop").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.InExperienceOffers)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: ReactModule (copy), Dialog (copy), DialogSize (copy), ButtonVariant (copy)
	local Terms = p1.terms
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		size = DialogSize.Medium,
		onClose = p1.onClose
	}, {
		Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = Terms.title }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			BodyText = ReactModule.createElement(Dialog.Text, { Text = Terms.body })
		}),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = Terms.buttonText,
					variant = ButtonVariant.Emphasis,
					onActivated = p1.onClose
				}
			}
		})
	})
end