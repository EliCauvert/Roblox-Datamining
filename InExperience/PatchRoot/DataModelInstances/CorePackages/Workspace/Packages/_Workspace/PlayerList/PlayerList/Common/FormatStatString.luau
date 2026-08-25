local localizationService = game:GetService("LocalizationService")
local localizationModule = require(script.Parent.Parent.Parent.Localization)
local numberLocalization = localizationModule.NumberLocalization
local roundingBehaviour = localizationModule.RoundingBehaviour

return function(p0)
	-- upvalues: numberLocalization (ref), localizationService (ref), roundingBehaviour (ref)
	return if p0 == nil then "-" elseif type(p0) == "number" then if tostring(p0):len() >= 7 then numberLocalization.abbreviate(p0, localizationService.RobloxLocaleId, roundingBehaviour.Truncate) else numberLocalization.localize(p0, localizationService.RobloxLocaleId) else tostring(p0)
end