local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local _ = require(NotApprovedPage.Common.Types)
local Parent = NotApprovedPage.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local ReactModule = require(Parent.React)
local UseMemoFunction = ReactModule.useMemo
local UseContextFunction = ReactModule.useContext
local PlatformEvidenceModule = require(NotApprovedPage.Utils.platformEvidence)
local CollectUniqueTranslationsModule = require(NotApprovedPage.Utils.collectUniqueTranslations)
local Context = ReactModule.createContext({})

return {
	NotApprovedPageProvider = function(p1)
		-- upvalues: UseMemoFunction (copy), PlatformEvidenceModule (copy), CollectUniqueTranslationsModule (copy), ReactModule (copy), Context (copy)
		local Translations = p1.translations
		local BadUtterances = p1.moderationDetail.badUtterances
		local Violation = p1.moderationDetail.violation
		local CommutationEligibility = p1.commutationEligibility
		
		return ReactModule.createElement(Context.Provider, {
			value = UseMemoFunction(function()
				-- upvalues: Violation (copy), PlatformEvidenceModule (upval), CollectUniqueTranslationsModule (upval), Translations (copy), BadUtterances (copy), CommutationEligibility (copy)
				local TranslatedReasons = {}
				local UntranslatedReasons = {}
				
				if Violation and PlatformEvidenceModule.isVisibleInView(Violation) then
					TranslatedReasons = CollectUniqueTranslationsModule(Violation.abuseTypeTranslationKeys, Translations)
					UntranslatedReasons = CollectUniqueTranslationsModule(Violation.abuseTypeTranslationKeys, nil)
				elseif BadUtterances then
					local LabelTranslationKeys = {}
					
					for _, badUtterance in BadUtterances do
						table.insert(LabelTranslationKeys, badUtterance.labelTranslationKey)
					end
					TranslatedReasons = CollectUniqueTranslationsModule(LabelTranslationKeys, Translations)
					UntranslatedReasons = CollectUniqueTranslationsModule(LabelTranslationKeys, nil)
				end
				return {
					translations = Translations,
					violationReasons = {
						translatedReasons = TranslatedReasons,
						untranslatedReasons = UntranslatedReasons
					},
					commutationEligibility = CommutationEligibility
				}
			end, {
				BadUtterances,
				Violation,
				Translations,
				CommutationEligibility
			})
		}, p1.children)
	end,
	useNotApprovedPageContext = function()
		-- upvalues: UseContextFunction (copy), Context (copy), ArgCheckModule (copy)
		local UseContextResult = UseContextFunction(Context)
		ArgCheckModule.assert(UseContextResult and UseContextResult.translations, "useNotApprovedPageContext returned invalid context, usually this means the NotApprovedPageProvider is not present in the tree")
		
		return {
			translations = UseContextResult.translations,
			violationReasons = UseContextResult.violationReasons,
			commutationEligibility = UseContextResult.commutationEligibility
		}
	end
}