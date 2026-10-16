local LocalizationService = game:GetService("LocalizationService")
local LocalizationModule = require(script.Parent.Parent.Parent.Localization)
local NumberLocalization = LocalizationModule.NumberLocalization
local RoundingBehaviour = LocalizationModule.RoundingBehaviour

return function(p1) --[[ Line: 12 ]]
	-- upvalues: NumberLocalization (copy), LocalizationService (copy), RoundingBehaviour (copy)
	return if p1 == nil then "-" elseif type(p1) == "number" then if tostring(p1):len() >= 7 then NumberLocalization.abbreviate(p1, LocalizationService.RobloxLocaleId, RoundingBehaviour.Truncate) else NumberLocalization.localize(p1, LocalizationService.RobloxLocaleId) else tostring(p1)
end