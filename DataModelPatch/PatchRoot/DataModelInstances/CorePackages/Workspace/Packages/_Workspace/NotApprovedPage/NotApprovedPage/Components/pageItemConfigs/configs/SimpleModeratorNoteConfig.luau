local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local EvidenceFieldModule = require(NotApprovedPage.Components.EvidenceField)
local PlatformEvidenceModule = require(NotApprovedPage.Utils.platformEvidence)
local ParseDateFromStringModule = require(NotApprovedPage.Utils.parseDateFromString)
local _ = require(NotApprovedPage.Common.Types)
local _ = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils)
local Parent = NotApprovedPage.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext

return {
	getIsVisible = function(p1): boolean
		-- upvalues: PlatformEvidenceModule (copy)
		local BadUtterances = p1.badUtterances
		
		return not PlatformEvidenceModule.isVisibleInView(p1.violation) and (not BadUtterances or #BadUtterances == 0)
	end,
	renderComponent = ReactModule.memo(function(p1)
		-- upvalues: UseNotApprovedPageContextFunction (copy), ReactModule (copy), View (copy), EvidenceFieldModule (copy), ParseDateFromStringModule (copy)
		local Translations = UseNotApprovedPageContextFunction().translations
		
		return ReactModule.createElement(View, {
			tag = "size-full-0 auto-y col gap-small",
			LayoutOrder = p1.layoutOrder
		}, {
			ReviewDate = ReactModule.createElement(EvidenceFieldModule, {
				layoutOrder = 2,
				fieldLabel = Translations.dateReviewedLabel,
				fieldValue = ParseDateFromStringModule(p1.moderationDetail.beginDate, Translations)
			})
		})
	end)
}