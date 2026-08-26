local parent = script:FindFirstAncestor("GenericChallenges").Parent
local localizationService = game:GetService("LocalizationService")
local localization = require(parent.RobloxAppLocales).Localization
local localizeStrings = require(parent.Localization).localizeStrings

return function(p1)
	-- upvalues: localizeStrings (ref), localization (ref), localizationService (ref)
	return localizeStrings(localization.new(localizationService.RobloxLocaleId), {
		title = if p1 ~= nil then p1 else "Feature.AccountSettings.Heading.Tab.Security"
	}).title
end