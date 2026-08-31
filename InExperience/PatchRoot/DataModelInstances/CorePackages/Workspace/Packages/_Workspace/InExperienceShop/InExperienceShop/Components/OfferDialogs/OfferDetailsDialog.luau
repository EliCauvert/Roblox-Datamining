local parent = script:FindFirstAncestor("InExperienceShop").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useRemainingTimeText = require(parent.InExperienceOffers).Hooks.useRemainingTimeText
local dialog = foundationModule.Dialog
local view = foundationModule.View
local text = foundationModule.Text
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: useRemainingTimeText (ref), useLocalization (ref), reactModule (ref), dialog (ref), dialogSize (ref), view (ref), text (ref), buttonVariant (ref)
	local modal = p1.modal
	local var1 = modal.termsAndConditions ~= nil
	local var2 = useRemainingTimeText(p1.expirationTimeInUTC)
	local var3 = useLocalization({
		viewTerms = "Feature.Catalog.Action.ViewTerms",
		descriptionWithTime = {
			"Feature.InExperienceShop.Label.DescriptionWithTime",
			description = modal.body,
			timeRemaining = useLocalization({
				endTime = {
					"Feature.InExperienceShop.Label.EndTime",
					timeRemaining = var2 or ""
				}
			}).endTime
		}
	})
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		size = dialogSize.Medium,
		onClose = p1.onClose
	}, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = modal.title }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Body = reactModule.createElement(view, { tag = "col gap-small size-full-0 auto-y" }, {
				BodyText = reactModule.createElement(dialog.Text, {
					LayoutOrder = 1,
					Text = if var2 ~= nil then modal.body else var3.descriptionWithTime
				}),
				ViewTermsLink = if var1 then reactModule.createElement(text, {
					tag = "auto-xy text-body-medium text-wrap text-align-x-left content-muted",
					RichText = true,
					LayoutOrder = 2,
					testId = "OfferViewTermsLink",
					Text = `<u>{var3.viewTerms}</u>`,
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