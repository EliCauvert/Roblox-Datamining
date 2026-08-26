local localizationService = game:GetService("LocalizationService")
local localizationModule = require(script.Parent.Parent.Parent.Localization)
local numberLocalization = localizationModule.NumberLocalization
local roundingBehaviour = localizationModule.RoundingBehaviour

return function(p1)
	-- upvalues: numberLocalization (ref), localizationService (ref), roundingBehaviour (ref)
	return if p1 == nil then "-" elseif type(p1) == "number" then if tostring(p1):len() >= 7 then numberLocalization.abbreviate(p1, localizationService.RobloxLocaleId, roundingBehaviour.Truncate) else numberLocalization.localize(p1, localizationService.RobloxLocaleId) else tostring(p1)
end