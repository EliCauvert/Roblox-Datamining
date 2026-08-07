local parent = script:FindFirstAncestor("GenericChallenges").Parent
local localizationService = game:GetService("LocalizationService")
local localization = require(parent.RobloxAppLocales).Localization
local localizeStrings = require(parent.Localization).localizeStrings

return function(p0) --[[ line: 10 ]]
	-- upvalues: localizeStrings (ref), localization (ref), localizationService (ref)
	return localizeStrings(localization.new(localizationService.RobloxLocaleId), {
		title = if p0 ~= nil then p0 else "Feature.AccountSettings.Heading.Tab.Security"
	}).title
end