local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local HttpService = game:GetService("HttpService")
local EvidenceFieldModule = require(NotApprovedPage.Components.EvidenceField)
local PlatformEvidenceModule = require(NotApprovedPage.Utils.platformEvidence)
local ParseDateFromStringModule = require(NotApprovedPage.Utils.parseDateFromString)
local SendNotApprovedPageEventModule = require(NotApprovedPage.Utils.sendNotApprovedPageEvent)
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext
local _ = require(NotApprovedPage.Common.Types)
local Parent = NotApprovedPage.Parent
local ReactModule = require(Parent.React)
local UseMemoFunction = ReactModule.useMemo
local View = require(Parent.Foundation).View
local _ = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils)
local Constants = require(Parent.NotApprovedPageShared).Constants
local FFlagNapPublicEvidenceTranslationKeysModule = require(NotApprovedPage.Flags.FFlagNapPublicEvidenceTranslationKeys)

return {
	getIsVisible = function(p1)
		-- upvalues: PlatformEvidenceModule (copy)
		return PlatformEvidenceModule.isVisibleInView(p1.violation)
	end,
	renderComponent = ReactModule.memo(function(p1)
		-- upvalues: UseNotApprovedPageContextFunction (copy), UseMemoFunction (copy), PlatformEvidenceModule (copy), FFlagNapPublicEvidenceTranslationKeysModule (copy), SendNotApprovedPageEventModule (copy), Constants (copy), HttpService (copy), ReactModule (copy), EvidenceFieldModule (copy), View (copy), ParseDateFromStringModule (copy)
		local Translations = UseNotApprovedPageContextFunction().translations
		local Violation = p1.moderationDetail.violation
		local BeginDate = p1.moderationDetail.beginDate
		
		if Violation then
			local UseMemoResult = UseMemoFunction(function()
				-- upvalues: PlatformEvidenceModule (upval), Violation (copy)
				return PlatformEvidenceModule.filterForVisibleElements(Violation.evidence.elements)
			end, { Violation.evidence.elements })
			
			return ReactModule.createElement(View, {
				tag = "size-full-0 auto-y col gap-small",
				LayoutOrder = 1
			}, {
				Elements = ReactModule.createElement(View, {
					tag = "size-full-0 auto-y col gap-small",
					LayoutOrder = 2
				}, unpack((UseMemoFunction(function()
					-- upvalues: UseMemoResult (copy), FFlagNapPublicEvidenceTranslationKeysModule (upval), Translations (copy), SendNotApprovedPageEventModule (upval), Constants (upval), HttpService (upval), ReactModule (upval), EvidenceFieldModule (upval)
					local Elements = {}
					
					for LayoutOrder, value in UseMemoResult do
						if value.type == "text" then
							local Text = value.text
							
							if FFlagNapPublicEvidenceTranslationKeysModule and value.textKey then
								local Translation = Translations[value.textKey .. "_" .. value.labelKey]
								
								if Translation and Translation ~= "" then
									Text = Translation
								else
									SendNotApprovedPageEventModule({
										eventType = Constants.EVENT_TYPES.MissingTranslation,
										additionalInfo = HttpService:JSONEncode({ key = value.textKey, params = value.textKeyParameters })
									})
									Text = value.textKey
								end
							end
							table.insert(Elements, ReactModule.createElement(EvidenceFieldModule, {
								fieldLabel = Translations[value.labelKey],
								fieldValue = if FFlagNapPublicEvidenceTranslationKeysModule then Text else value.text,
								layoutOrder = LayoutOrder
							}))
						end
					end
					return Elements
				end, { UseMemoResult })))),
				ReviewDate = ReactModule.createElement(EvidenceFieldModule, {
					layoutOrder = 3,
					fieldLabel = Translations.dateReviewedLabel,
					fieldValue = ParseDateFromStringModule(BeginDate, Translations)
				})
			})
		else
			return nil
		end
	end)
}