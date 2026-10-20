local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Packages.Signals)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local FoundationModule = require(CorePackages.Packages.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local MenuButtonsModule = require(script.Parent.MenuButtons)

return function(p1)
	-- upvalues: Localization (copy), LocalizationService (copy), ReactModule (copy), LocalizationProvider (copy), FoundationProvider (copy), FoundationModule (copy), MenuButtonsModule (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		FoundationProvider = ReactModule.createElement(FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
			MenuButtons = ReactModule.createElement(MenuButtonsModule, p1)
		})
	})
end