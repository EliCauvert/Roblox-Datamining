local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local _ = require(NotApprovedPage.Common.Types)
local VIOLATIONTYPETOPLURALMAP = require(NotApprovedPage.Parent.NotApprovedPageShared).Constants.VIOLATION_TYPE_TO_PLURAL_MAP
local PlatformEvidenceModule = require(NotApprovedPage.Utils.platformEvidence)
local FFlagNapPublicEvidenceTranslationKeysModule = require(NotApprovedPage.Flags.FFlagNapPublicEvidenceTranslationKeys)

return function(p1, p2)
	-- upvalues: PlatformEvidenceModule (copy), FFlagNapPublicEvidenceTranslationKeysModule (copy), VIOLATIONTYPETOPLURALMAP (copy)
	local Violation = p1.violation
	
	if not Violation or not PlatformEvidenceModule.isVisibleInView(Violation) then return end
	local Evidence = Violation.evidence
	local Elements = Evidence.elements or {}
	for _, element in Elements do
		if element.labelKey then
			p2[element.labelKey] = "Feature.AppealsPortal." .. element.labelKey
		end
		if element.altLabelKey then
			p2[element.altLabelKey] = "Feature.AppealsPortal." .. element.altLabelKey
		end
		if FFlagNapPublicEvidenceTranslationKeysModule and element.textKey then
			local Text = element.textKey .. "_" .. element.labelKey
			
			if element.textKeyParameters then
				local list = { "Feature.NotApproved." .. element.textKey }
				
				for i, textKeyParameter in element.textKeyParameters do
					list[i] = textKeyParameter
				end
				p2[Text] = list
			else
				p2[Text] = "Feature.NotApproved." .. element.textKey
			end
		end
	end
	for _, abuseTypeTranslationKey in Violation.abuseTypeTranslationKeys do
		p2[abuseTypeTranslationKey] = "Feature.NotApproved." .. abuseTypeTranslationKey
	end
	if Evidence.displayMeta then
		local CapitalizedKey = Evidence.displayMeta.capitalizedKey
		
		if CapitalizedKey and CapitalizedKey ~= "" then
			p2.violationType = VIOLATIONTYPETOPLURALMAP[CapitalizedKey]
		end
	end
end