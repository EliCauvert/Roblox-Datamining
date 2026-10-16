local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local RoundingBehaviour = require(CorePackages.Workspace.Packages.Localization).RoundingBehaviour

return function(p1) --[[ Line: 9 ]]
	-- upvalues: NumberLocalization (copy), LocalizationService (copy), RoundingBehaviour (copy)
	return if p1 == nil then "-" elseif type(p1) == "number" then if tostring(p1):len() >= 7 then NumberLocalization.abbreviate(p1, LocalizationService.RobloxLocaleId, RoundingBehaviour.Truncate) else NumberLocalization.localize(p1, LocalizationService.RobloxLocaleId) else tostring(p1)
end