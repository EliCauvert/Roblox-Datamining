local localizationService = game:GetService("LocalizationService")
local localization = require(script:FindFirstAncestor("IdentityVerification").Parent.RobloxAppLocales).Localization

return function() --[[ line: 28 | named "buildAgeVerificationFeatureRestrictionOverrides" ]]
	-- upvalues: localization (ref), localizationService (ref)
	local var1 = localization.new(localizationService.RobloxLocaleId)
	
	return {
		titleOverride = var1:Format("Feature.UniversalFeatureRestrictions.AbuseVector.AgeVerification.DialogTitle.Suspended"),
		bodyOverride = var1:Format("Feature.UniversalFeatureRestrictions.AbuseVector.AgeVerification.DialogBody.Suspended")
	}
end