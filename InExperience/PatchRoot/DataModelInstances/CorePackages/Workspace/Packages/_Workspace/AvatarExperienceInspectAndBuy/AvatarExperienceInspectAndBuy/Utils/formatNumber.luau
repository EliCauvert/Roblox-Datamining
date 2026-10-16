local NumberLocalization = require(script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent.Localization).NumberLocalization
local LocalizationService = game:GetService("LocalizationService")

return function(p1) --[[ Line: 10 | Named "formatNumber" ]]
	-- upvalues: NumberLocalization (copy), LocalizationService (copy)
	return NumberLocalization.localize(string.format("%.0f", p1 or 0), LocalizationService.RobloxLocaleId)
end