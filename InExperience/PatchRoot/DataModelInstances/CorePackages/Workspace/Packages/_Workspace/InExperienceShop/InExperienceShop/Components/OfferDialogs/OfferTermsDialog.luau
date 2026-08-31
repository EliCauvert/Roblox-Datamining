local parent = script:FindFirstAncestor("InExperienceShop").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.InExperienceOffers)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: reactModule (ref), dialog (ref), dialogSize (ref), buttonVariant (ref)
	local terms = p1.terms
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		size = dialogSize.Medium,
		onClose = p1.onClose
	}, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = terms.title }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			BodyText = reactModule.createElement(dialog.Text, { Text = terms.body })
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = terms.buttonText,
					variant = buttonVariant.Emphasis,
					onActivated = p1.onClose
				}
			}
		})
	})
end