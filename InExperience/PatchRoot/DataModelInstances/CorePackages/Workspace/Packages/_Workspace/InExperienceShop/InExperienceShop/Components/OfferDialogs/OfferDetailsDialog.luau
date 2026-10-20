local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseRemainingTimeTextFunction = require(Parent.InExperienceOffers).Hooks.useRemainingTimeText
local UseOfferModalTextModule = require(InExperienceShop.Hooks.useOfferModalText)
local Dialog = FoundationModule.Dialog
local View = FoundationModule.View
local Text = FoundationModule.Text
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: UseRemainingTimeTextFunction (copy), UseOfferModalTextModule (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), View (copy), Text (copy), ButtonVariant (copy)
	local Modal = p1.modal
	local HasTermsAndConditions = Modal.termsAndConditions ~= nil
	local UseOfferModalTextModuleResult = UseOfferModalTextModule(Modal.body, (UseRemainingTimeTextFunction(p1.expirationTimeInUTC)))
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		size = DialogSize.Medium,
		onClose = p1.onClose
	}, {
		Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = Modal.title }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Body = ReactModule.createElement(View, { tag = "col gap-small size-full-0 auto-y" }, {
				BodyText = ReactModule.createElement(Dialog.Text, {
					LayoutOrder = 1,
					Text = UseOfferModalTextModuleResult.bodyText
				}),
				ViewTermsLink = if HasTermsAndConditions then ReactModule.createElement(Text, {
					tag = "auto-xy text-body-medium text-wrap text-align-x-left content-muted",
					RichText = true,
					LayoutOrder = 2,
					testId = "OfferViewTermsLink",
					Text = `<u>{UseOfferModalTextModuleResult.viewTermsText}</u>`,
					onActivated = p1.onViewTerms
				}) else nil
			})
		}),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = Modal.buttonText,
					variant = ButtonVariant.Emphasis,
					onActivated = p1.onShopNow
				}
			}
		})
	})
end