local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules
local VRGamepadControls = script.Parent.VRGamepadControls
local HelpPageModule = require(CorePackages.Workspace.Packages.HelpPage)
local FoundationModule = require(CorePackages.Packages.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local ReactModule = require(CorePackages.Packages.React)
local NewResult = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local ControlLayoutContainerModule = require(script.Parent.Parent.ControlLayoutContainer)
local HelpReactView = HelpPageModule.HelpReactView
local FFlagHelpPageMountVR = HelpPageModule.Flags.FFlagHelpPageMountVR
local Utils = if FFlagHelpPageMountVR then require(Modules.Settings.Integrations).Utils else nil

return if FFlagHelpPageMountVR then ReactModule.memo(function()
	-- upvalues: ReactModule (copy), ControlLayoutContainerModule (copy), LocalizationProvider (copy), NewResult (copy), FoundationProvider (copy), FoundationModule (copy), Utils (ref), HelpReactView (copy)
	return ReactModule.createElement(ControlLayoutContainerModule, {
		titleText = "CoreScripts.InGameMenu.Controls.VrControllerTitle"
	}, {
		Inner = ReactModule.createElement(LocalizationProvider, { localization = NewResult }, {
			FoundationProvider = ReactModule.createElement(FoundationProvider, {
				theme = FoundationModule.Enums.Theme.Dark,
				device = Utils.getDeviceType()
			}, { HelpReactView = ReactModule.createElement(HelpReactView) })
		})
	})
end) else require(VRGamepadControls)