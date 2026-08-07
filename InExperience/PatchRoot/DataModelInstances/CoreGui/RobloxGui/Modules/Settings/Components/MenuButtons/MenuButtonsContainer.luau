local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local reactModule = require(corePackagesService.Packages.React)
local _ = require(corePackagesService.Packages.Signals)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local foundationModule = require(corePackagesService.Packages.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local menuButtonsModule = require(script.Parent.MenuButtons)

return function(p0) --[[ line: 27 | named "Container" ]]
	-- upvalues: localization (ref), localizationService (ref), reactModule (ref), localizationProvider (ref), foundationProvider (ref), foundationModule (ref), menuButtonsModule (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		FoundationProvider = reactModule.createElement(foundationProvider, { theme = foundationModule.Enums.Theme.Dark }, {
			MenuButtons = reactModule.createElement(menuButtonsModule, p0)
		})
	})
end