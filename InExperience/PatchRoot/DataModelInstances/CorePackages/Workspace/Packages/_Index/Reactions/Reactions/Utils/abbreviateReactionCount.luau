local LocalizationService = game:GetService("LocalizationService")
local LocalizationModule = require(script:FindFirstAncestor("Reactions").Parent.Localization)

return function(p1)
	-- upvalues: LocalizationModule (copy), LocalizationService (copy)
	return LocalizationModule.abbreviateCount(p1, LocalizationService.RobloxLocaleId)
end