local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("InExperienceShop").Parent
local ReactModule = require(Parent.React)
local StyleModule = require(Parent.Style)
local FoundationModule = require(Parent.Foundation)
local Localization = require(Parent.AppLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), StyleModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy)
	return ReactModule.createElement(FoundationModule.FoundationProvider, { theme = p1.theme, overlayGui = p1.overlayGui }, {
		AppStyleProvider = ReactModule.createElement(StyleModule.AppStyleProvider, { style = { fontName = "Gotham", themeName = p1.theme } }, {
			LocalizationProvider = ReactModule.createElement(LocalizationProvider, {
				localization = Localization.new(LocalizationService.RobloxLocaleId)
			}, p1.children)
		})
	})
end