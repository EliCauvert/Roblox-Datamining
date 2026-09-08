local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useRemainingTimeText = require(parent.InExperienceOffers).Hooks.useRemainingTimeText
local useOfferModalTextModule = require(inExperienceShop.Hooks.useOfferModalText)
local dialog = foundationModule.Dialog
local view = foundationModule.View
local text = foundationModule.Text
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: useRemainingTimeText (ref), useOfferModalTextModule (ref), reactModule (ref), dialog (ref), dialogSize (ref), view (ref), text (ref), buttonVariant (ref)
	local modal = p1.modal
	local var1 = useOfferModalTextModule(modal.body, useRemainingTimeText(p1.expirationTimeInUTC))
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		size = dialogSize.Medium,
		onClose = p1.onClose
	}, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = modal.title }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Body = reactModule.createElement(view, { tag = "col gap-small size-full-0 auto-y" }, {
				BodyText = reactModule.createElement(dialog.Text, { LayoutOrder = 1, Text = var1.bodyText }),
				ViewTermsLink = if modal.termsAndConditions ~= nil then reactModule.createElement(text, {
					tag = "auto-xy text-body-medium text-wrap text-align-x-left content-muted",
					RichText = true,
					LayoutOrder = 2,
					testId = "OfferViewTermsLink",
					Text = `<u>{var1.viewTermsText}</u>`,
					onActivated = p1.onViewTerms
				}) else nil
			})
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = modal.buttonText,
					variant = buttonVariant.Emphasis,
					onActivated = p1.onShopNow
				}
			}
		})
	})
end