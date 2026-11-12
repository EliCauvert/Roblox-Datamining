local LocalizationService = game:GetService("LocalizationService")
local Parent = script.Parent.Parent

return function(p1)
	-- upvalues: Parent (copy), LocalizationService (copy)
	return require(Parent.InExperienceLocales).Localization.new(LocalizationService.RobloxLocaleId):Format(p1)
end