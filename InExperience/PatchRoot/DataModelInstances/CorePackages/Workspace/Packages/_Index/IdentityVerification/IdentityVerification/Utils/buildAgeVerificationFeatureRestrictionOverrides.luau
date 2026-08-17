local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("IdentityVerification").Parent
local localization = require(parent.RobloxAppLocales).Localization
local _ = require(parent.UniversalFeatureRestrictions)

return function() --[[ line: 24 | named "buildAgeVerificationFeatureRestrictionOverrides" ]]
	-- upvalues: localization (ref), localizationService (ref)
	local var1 = localization.new(localizationService.RobloxLocaleId)
	
	return {
		titleOverride = var1:Format("Feature.UniversalFeatureRestrictions.AbuseVector.AgeVerification.DialogTitle.Suspended"),
		bodyOverride = var1:Format("Feature.UniversalFeatureRestrictions.AbuseVector.AgeVerification.DialogBody.Suspended")
	}
end