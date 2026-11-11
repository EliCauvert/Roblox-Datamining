local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local PUNISHMENTTYPETOINTERVENTIONMAP = require(Parent.NotApprovedPageShared).Constants.PUNISHMENT_TYPE_TO_INTERVENTION_MAP
local _ = require(NotApprovedPage.Common.Types)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseMemoFunction = ReactModule.useMemo
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext
local _ = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils)
local DeterminePunishmentDescriptionModule = require(NotApprovedPage.Utils.determinePunishmentDescription)

return {
	getIsVisible = function(): boolean
		return true
	end,
	renderComponent = ReactModule.memo(function(p1)
		-- upvalues: UseNotApprovedPageContextFunction (copy), PUNISHMENTTYPETOINTERVENTIONMAP (copy), UseMemoFunction (copy), DeterminePunishmentDescriptionModule (copy), ReactModule (copy), View (copy), Text (copy)
		local Translations = UseNotApprovedPageContextFunction().translations
		local TranslatedReasons = UseNotApprovedPageContextFunction().violationReasons.translatedReasons
		local PUNISHMENTTYPETOINTERVENTION = PUNISHMENTTYPETOINTERVENTIONMAP[p1.moderationDetail.punishmentTypeDescription]
		
		return ReactModule.createElement(View, {
			tag = "size-full-0 auto-y col gap-small",
			testId = "punishment-description",
			LayoutOrder = p1.layoutOrder
		}, {
			Description = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-medium text-wrap text-align-x-left content-emphasis",
				LayoutOrder = 1,
				Text = UseMemoFunction(function()
					-- upvalues: DeterminePunishmentDescriptionModule (upval), Translations (copy), PUNISHMENTTYPETOINTERVENTION (copy), TranslatedReasons (copy)
					return DeterminePunishmentDescriptionModule(Translations.violationType, PUNISHMENTTYPETOINTERVENTION, TranslatedReasons or {})
				end, {
					Translations.violationType,
					PUNISHMENTTYPETOINTERVENTION,
					TranslatedReasons
				})
			})
		})
	end)
}