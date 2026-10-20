local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("IdentityVerification").Parent
local Localization = require(Parent.RobloxAppLocales).Localization
local _ = require(Parent.UniversalFeatureRestrictions)

return function()
	-- upvalues: Localization (copy), LocalizationService (copy)
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	
	return {
		titleOverride = NewLocalization:Format("Feature.UniversalFeatureRestrictions.AbuseVector.AgeVerification.DialogTitle.Suspended"),
		bodyOverride = NewLocalization:Format("Feature.UniversalFeatureRestrictions.AbuseVector.AgeVerification.DialogBody.Suspended")
	}
end