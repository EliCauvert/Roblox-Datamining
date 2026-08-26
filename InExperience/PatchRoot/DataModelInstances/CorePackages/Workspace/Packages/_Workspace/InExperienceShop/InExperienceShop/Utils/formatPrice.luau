local localizationService = game:GetService("LocalizationService")
local numberLocalization = require(script:FindFirstAncestor("InExperienceShop").Parent.Localization).NumberLocalization

return function(p1)
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", p1 or 0), localizationService.RobloxLocaleId)
end