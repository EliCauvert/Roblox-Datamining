local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local roactModule = require(corePackagesService.Packages.Roact)
local renderWithCoreScriptsStyleProviderModule = require(coreGuiService:WaitForChild("RobloxGui").Modules.Common.renderWithCoreScriptsStyleProvider)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local FTUXPanelModule = require(script.Components.FTUXPanel)
local getFeaturesModule = require(script.Features.GetFeatures)
local _ = require(script.Enums.PlatformEnum)

return {
	mountFtuxMenu = function(p1)
		-- upvalues: roactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), renderWithCoreScriptsStyleProviderModule (ref), FTUXPanelModule (ref), getFeaturesModule (ref), coreGuiService (ref)
		game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
		game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
		local var1 = roactModule.createElement(localizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, {
			FTUXMenu = roactModule.createElement("ScreenGui", {}, {
				ThemeProvider = renderWithCoreScriptsStyleProviderModule({
					FtuxPanel = roactModule.createElement(FTUXPanelModule, { platform = p1 }, {})
				})
			})
		})
		getFeaturesModule(p1)
		roactModule.mount(var1, coreGuiService, "FTUXMenu")
	end
}