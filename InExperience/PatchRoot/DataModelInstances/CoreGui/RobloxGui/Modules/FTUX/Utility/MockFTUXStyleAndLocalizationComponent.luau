local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local localizationService = game:GetService("LocalizationService")
local renderWithCoreScriptsStyleProviderModule = require(script.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider

return function(p0) --[[ line: 10 ]]
	-- upvalues: roactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), renderWithCoreScriptsStyleProviderModule (ref)
	return roactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		FTUXMock = roactModule.createElement("ScreenGui", {}, {
			ThemeProvider = renderWithCoreScriptsStyleProviderModule({
				Frame = roactModule.createElement("Frame", { Size = UDim2.new(1, 0, 1, 0) }, p0)
			})
		})
	})
end