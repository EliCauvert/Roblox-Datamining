local localizationService = game:GetService("LocalizationService")
local numberLocalization = require(script:FindFirstAncestor("InExperienceShop").Parent.Localization).NumberLocalization

return function(p0) --[[ line: 10 | named "formatPrice" ]]
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", p0 or 0), localizationService.RobloxLocaleId)
end