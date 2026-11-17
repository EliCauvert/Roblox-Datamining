local Logging = require(script.Parent.Parent.AppCommonLib).Logging
local AgreementTypes = {
	TermsOfService = true,
	PrivacyPolicy = true,
	RiderTerms = true,
	ChildrenPrivacyPolicy = true,
	LuobuThirdPartyDataUse = true,
	TransferPersonalInformationPolicy = true,
	OptionalPersonalInformationPolicy = true,
	ThirdPartyPersonalInformationPolicy = true,
	PersonalInformationPolicy = true,
	StudioTermsForVNGSKU = true
}
setmetatable(AgreementTypes, {
	__index = function(_, p1): boolean
		-- upvalues: Logging (copy)
		Logging.warn(string.format("Unknown User Agreement Type: %s", (tostring(p1))))
		
		return false
	end
})

return {
	agreementTypes = AgreementTypes,
	CheckAgreementTypeExists = function(p1)
		-- upvalues: AgreementTypes (copy)
		return AgreementTypes[p1]
	end
}