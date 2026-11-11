local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local LocalizationService = game:GetService("LocalizationService")
local RenderWithCoreScriptsStyleProviderModule = require(script.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider

return function(p1)
	-- upvalues: RoactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), RenderWithCoreScriptsStyleProviderModule (copy)
	return RoactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		FTUXMock = RoactModule.createElement("ScreenGui", {}, {
			ThemeProvider = RenderWithCoreScriptsStyleProviderModule({
				Frame = RoactModule.createElement("Frame", { Size = UDim2.new(1, 0, 1, 0) }, p1)
			})
		})
	})
end