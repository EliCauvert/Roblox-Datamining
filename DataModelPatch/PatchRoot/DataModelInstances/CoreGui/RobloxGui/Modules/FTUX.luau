local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local RoactModule = require(CorePackages.Packages.Roact)
local RenderWithCoreScriptsStyleProviderModule = require(CoreGui:WaitForChild("RobloxGui").Modules.Common.renderWithCoreScriptsStyleProvider)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local FTUXPanelModule = require(script.Components.FTUXPanel)
local GetFeaturesModule = require(script.Features.GetFeatures)
local _ = require(script.Enums.PlatformEnum)

return {
	mountFtuxMenu = function(Platform)
		-- upvalues: RoactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), RenderWithCoreScriptsStyleProviderModule (copy), FTUXPanelModule (copy), GetFeaturesModule (copy), CoreGui (copy)
		game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
		game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
		local Element = RoactModule.createElement(LocalizationProvider, {
			localization = Localization.new(LocalizationService.RobloxLocaleId)
		}, {
			FTUXMenu = RoactModule.createElement("ScreenGui", {}, {
				ThemeProvider = RenderWithCoreScriptsStyleProviderModule({
					FtuxPanel = RoactModule.createElement(FTUXPanelModule, { platform = Platform }, {})
				})
			})
		})
		GetFeaturesModule(Platform)
		RoactModule.mount(Element, CoreGui, "FTUXMenu")
	end
}