local DependenciesModule = require(script:FindFirstAncestor("SocialTestHelpers").dependencies)
local LocalizationProvider = DependenciesModule.LocalizationProvider
local Roact = DependenciesModule.Roact
local EnUs = DependenciesModule.RobloxAppLocales.Localization.new("en-us")

return function(p1, p2)
	-- upvalues: EnUs (copy), Roact (copy), LocalizationProvider (copy)
	if p2 and p2.controls and p2.controls.langauge then
		EnUs:SetLocale(p2.controls.language)
	end
	return Roact.createElement(LocalizationProvider, { localization = EnUs }, { TestElement1 = Roact.createElement(p1, p2) })
end