local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local modules = coreGuiService:WaitForChild("RobloxGui").Modules
local VRGamepadControls = script.Parent.VRGamepadControls
local helpPageModule = require(corePackagesService.Workspace.Packages.HelpPage)
local foundationModule = require(corePackagesService.Packages.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local reactModule = require(corePackagesService.Packages.React)
local var6 = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization.new(localizationService.RobloxLocaleId)
local controlLayoutContainerModule = require(script.Parent.Parent.ControlLayoutContainer)
local helpReactView = helpPageModule.HelpReactView
local fFlagHelpPageMountVR = helpPageModule.Flags.FFlagHelpPageMountVR
local _ = nil
local var8 = if fFlagHelpPageMountVR then require(modules.Settings.Integrations).Utils else nil

return if fFlagHelpPageMountVR then reactModule.memo(function()
	-- upvalues: reactModule (ref), controlLayoutContainerModule (ref), localizationProvider (ref), var6 (ref), foundationProvider (ref), foundationModule (ref), var8 (write), helpReactView (ref)
	return reactModule.createElement(controlLayoutContainerModule, {
		titleText = "CoreScripts.InGameMenu.Controls.VrControllerTitle"
	}, {
		Inner = reactModule.createElement(localizationProvider, { localization = var6 }, {
			FoundationProvider = reactModule.createElement(foundationProvider, {
				colorMode = foundationModule.Enums.ColorMode.Dark,
				device = var8.getDeviceType()
			}, { HelpReactView = reactModule.createElement(helpReactView) })
		})
	})
end) else require(VRGamepadControls)