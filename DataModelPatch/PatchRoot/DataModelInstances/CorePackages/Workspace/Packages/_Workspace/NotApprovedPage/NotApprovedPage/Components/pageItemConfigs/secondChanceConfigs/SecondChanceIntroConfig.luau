local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local _ = require(NotApprovedPage.Common.Types)
local Parent = NotApprovedPage.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local _ = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils)
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext

return {
	getIsVisible = function(_, _): boolean
		return true
	end,
	renderComponent = ReactModule.memo(function(p1)
		-- upvalues: UseNotApprovedPageContextFunction (copy), ReactModule (copy), View (copy), Text (copy)
		local Translations = UseNotApprovedPageContextFunction().translations
		
		return ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y gap-large",
			LayoutOrder = p1.layoutOrder
		}, {
			Heading = ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-medium content-emphasis text-align-x-left text-wrap",
				LayoutOrder = 1,
				Text = Translations.secondChanceIntroHeading
			}),
			Description = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-large text-align-x-left text-wrap",
				LayoutOrder = 2,
				Text = Translations.secondChanceIntroDescription
			})
		})
	end)
}