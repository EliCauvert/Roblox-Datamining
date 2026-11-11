local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local VERIFICATIONTYPES = require(Parent.NotApprovedPageShared).Constants.VERIFICATION_TYPES
local _ = require(NotApprovedPage.Common.Types)
local _ = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext

return {
	getIsVisible = function(p1): boolean
		-- upvalues: VERIFICATIONTYPES (copy)
		local VerificationCategory = p1.verificationCategory
		
		return VerificationCategory == VERIFICATIONTYPES.Parent or VerificationCategory == VERIFICATIONTYPES.Email
	end,
	renderComponent = ReactModule.memo(function(p1)
		-- upvalues: UseNotApprovedPageContextFunction (copy), VERIFICATIONTYPES (copy), ReactModule (copy), View (copy), Text (copy)
		local Translations = UseNotApprovedPageContextFunction().translations
		
		return ReactModule.createElement(View, {
			tag = "size-full-0 auto-y col gap-medium",
			LayoutOrder = p1.layoutOrder
		}, {
			Heading = ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-medium text-align-x-left text-wrap content-emphasis",
				LayoutOrder = 1,
				Text = Translations.chargebackNextSteps
			}),
			Content = ReactModule.createElement(Text, {
				tag = "auto-xy text-align-x-left text-wrap text-body-large",
				LayoutOrder = 2,
				Text = if p1.moderationDetail.verificationCategory == VERIFICATIONTYPES.Parent then Translations.parentReactivationNotice else Translations.emailReactivationNotice
			})
		})
	end)
}