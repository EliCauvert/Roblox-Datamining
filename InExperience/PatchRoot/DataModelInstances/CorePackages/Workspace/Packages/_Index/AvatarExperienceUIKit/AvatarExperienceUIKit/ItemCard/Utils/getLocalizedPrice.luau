local numberLocalization = require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.Localization).NumberLocalization
local localizationService = game:GetService("LocalizationService")

return function(p1)
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", p1 or 0), localizationService.RobloxLocaleId)
end