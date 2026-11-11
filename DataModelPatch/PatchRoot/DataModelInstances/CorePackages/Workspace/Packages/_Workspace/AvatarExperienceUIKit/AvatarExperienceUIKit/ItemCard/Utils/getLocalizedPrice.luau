local NumberLocalization = require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.Localization).NumberLocalization
local LocalizationService = game:GetService("LocalizationService")

return function(p1)
	-- upvalues: NumberLocalization (copy), LocalizationService (copy)
	return NumberLocalization.localize(string.format("%.0f", p1 or 0), LocalizationService.RobloxLocaleId)
end