local corePackagesService = game:GetService("CorePackages")
local modules = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules
local builderIconsModule = require(corePackagesService.Packages.BuilderIcons)
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local settingsPageFactoryModule = require(modules.Settings.SettingsPageFactory)
local fFlagRefactorInExpSettingsInDevelopment = require(modules.Settings.Flags).FFlagRefactorInExpSettingsInDevelopment
local _ = nil
local utils = nil
local constants = nil

if fFlagRefactorInExpSettingsInDevelopment then
	local integrationsModule = require(modules.Settings.Integrations)
	utils = integrationsModule.Utils
	constants = integrationsModule.Constants
end
local foundationProvider = foundationModule.FoundationProvider
local migration = builderIconsModule.Migration

return if fFlagRefactorInExpSettingsInDevelopment then (function()
	-- upvalues: settingsPageFactoryModule (ref), constants (write), migration (ref), builderIconsModule (ref), reactModule (ref), foundationProvider (ref), foundationModule (ref), utils (write), reactRobloxModule (ref)
	local var7 = settingsPageFactoryModule:CreateNewPage()
	var7.TabHeader.Name = constants.GAMESETTINGS.TAB_HEADER.NAME
	local settings = migration.uiblox["icons/common/settings"]
	var7.TabHeader.TabLabel.Icon.Text = settings.name
	var7.TabHeader.TabLabel.Icon.FontFace = builderIconsModule.Font[settings.variant]
	var7.TabHeader.TabLabel.Title.Text = constants.GAMESETTINGS.TAB_HEADER.TEXT
	var7.Page:ClearAllChildren()
	var7.PageOpen = false
	
	function var7.OpenSettingsPage()
		-- upvalues: var7 (ref)
		var7.PageOpen = true
	end
	
	function var7.CloseSettingsPage()
		-- upvalues: var7 (ref)
		var7.PageOpen = false
	end
	
	reactRobloxModule.createRoot(var7.Page):render(reactModule.createElement(foundationProvider, {
		colorMode = foundationModule.Enums.ColorMode.Dark,
		device = utils.getDeviceType()
	}, {}))
	
	return var7
end)() else require(modules.Settings.Pages.GameSettings)