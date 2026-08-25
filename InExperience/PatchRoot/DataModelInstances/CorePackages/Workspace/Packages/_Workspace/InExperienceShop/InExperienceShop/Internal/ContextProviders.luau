local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("InExperienceShop").Parent
local reactModule = require(parent.React)
local styleModule = require(parent.Style)
local foundationModule = require(parent.Foundation)
local localization = require(parent.AppLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider

return function(p0)
	-- upvalues: reactModule (ref), foundationModule (ref), styleModule (ref), localizationProvider (ref), localization (ref), localizationService (ref)
	return reactModule.createElement(foundationModule.FoundationProvider, { colorMode = p0.theme, overlayGui = p0.overlayGui }, {
		AppStyleProvider = reactModule.createElement(styleModule.AppStyleProvider, { style = { fontName = "Gotham", themeName = p0.theme } }, {
			LocalizationProvider = reactModule.createElement(localizationProvider, {
				localization = localization.new(localizationService.RobloxLocaleId)
			}, p0.children)
		})
	})
end