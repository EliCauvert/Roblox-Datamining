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
	local var1 = settingsPageFactoryModule:CreateNewPage()
	var1.TabHeader.Name = constants.GAMESETTINGS.TAB_HEADER.NAME
	local settings = migration.uiblox["icons/common/settings"]
	var1.TabHeader.TabLabel.Icon.Text = settings.name
	var1.TabHeader.TabLabel.Icon.FontFace = builderIconsModule.Font[settings.variant]
	var1.TabHeader.TabLabel.Title.Text = constants.GAMESETTINGS.TAB_HEADER.TEXT
	var1.Page:ClearAllChildren()
	var1.PageOpen = false
	
	function var7.OpenSettingsPage()
		-- upvalues: var1 (ref)
		var1.PageOpen = true
	end
	
	function var7.CloseSettingsPage()
		-- upvalues: var1 (ref)
		var1.PageOpen = false
	end
	
	reactRobloxModule.createRoot(var1.Page):render(reactModule.createElement(foundationProvider, {
		colorMode = foundationModule.Enums.ColorMode.Dark,
		device = utils.getDeviceType()
	}, {}))
	
	return var1
end)() else require(modules.Settings.Pages.GameSettings)