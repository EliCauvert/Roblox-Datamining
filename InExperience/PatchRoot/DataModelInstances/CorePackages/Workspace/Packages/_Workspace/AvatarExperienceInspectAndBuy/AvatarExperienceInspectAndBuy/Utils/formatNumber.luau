local numberLocalization = require(script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent.Localization).NumberLocalization
local localizationService = game:GetService("LocalizationService")

return function(p0) --[[ line: 10 | named "formatNumber" ]]
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", p0 or 0), localizationService.RobloxLocaleId)
end