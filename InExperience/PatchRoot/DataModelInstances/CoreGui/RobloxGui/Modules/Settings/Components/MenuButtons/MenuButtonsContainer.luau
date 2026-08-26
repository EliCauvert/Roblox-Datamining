local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local reactModule = require(corePackagesService.Packages.React)
local _ = require(corePackagesService.Packages.Signals)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local foundationModule = require(corePackagesService.Packages.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local menuButtonsModule = require(script.Parent.MenuButtons)

return function(p1)
	-- upvalues: localization (ref), localizationService (ref), reactModule (ref), localizationProvider (ref), foundationProvider (ref), foundationModule (ref), menuButtonsModule (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		FoundationProvider = reactModule.createElement(foundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
			MenuButtons = reactModule.createElement(menuButtonsModule, p1)
		})
	})
end