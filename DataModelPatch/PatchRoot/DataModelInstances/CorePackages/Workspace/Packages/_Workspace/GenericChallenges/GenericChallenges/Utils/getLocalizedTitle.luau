local Parent = script:FindFirstAncestor("GenericChallenges").Parent
local LocalizationService = game:GetService("LocalizationService")
local Localization = require(Parent.RobloxAppLocales).Localization
local LocalizeStringsFunction = require(Parent.Localization).localizeStrings

return function(p1)
	-- upvalues: LocalizeStringsFunction (copy), Localization (copy), LocalizationService (copy)
	return LocalizeStringsFunction(Localization.new(LocalizationService.RobloxLocaleId), {
		title = if p1 == nil then "Feature.AccountSettings.Heading.Tab.Security" else p1
	}).title
end