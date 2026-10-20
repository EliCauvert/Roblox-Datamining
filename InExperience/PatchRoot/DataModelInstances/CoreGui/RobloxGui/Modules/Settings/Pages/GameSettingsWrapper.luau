local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules
local BuilderIconsModule = require(CorePackages.Packages.BuilderIcons)
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local SettingsPageFactoryModule = require(Modules.Settings.SettingsPageFactory)
local FFlagRefactorInExpSettingsInDevelopment = require(Modules.Settings.Flags).FFlagRefactorInExpSettingsInDevelopment
local Utils = nil
local Constants = nil

if FFlagRefactorInExpSettingsInDevelopment then
	local IntegrationsModule = require(Modules.Settings.Integrations)
	Utils = IntegrationsModule.Utils
	Constants = IntegrationsModule.Constants
end
local FoundationProvider = FoundationModule.FoundationProvider
local Migration = BuilderIconsModule.Migration

local function createGameSettings()
	-- upvalues: SettingsPageFactoryModule (copy), Constants (ref), Migration (copy), BuilderIconsModule (copy), ReactModule (copy), FoundationProvider (copy), FoundationModule (copy), Utils (ref), ReactRobloxModule (copy)
	local NewPage = SettingsPageFactoryModule:CreateNewPage()
	NewPage.TabHeader.Name = Constants.GAMESETTINGS.TAB_HEADER.NAME
	local IconsCommonSettings = Migration.uiblox["icons/common/settings"]
	NewPage.TabHeader.TabLabel.Icon.Text = IconsCommonSettings.name
	NewPage.TabHeader.TabLabel.Icon.FontFace = BuilderIconsModule.Font[IconsCommonSettings.variant]
	NewPage.TabHeader.TabLabel.Title.Text = Constants.GAMESETTINGS.TAB_HEADER.TEXT
	NewPage.Page:ClearAllChildren()
	NewPage.PageOpen = false
	
	function NewPage.OpenSettingsPage()
		-- upvalues: NewPage (copy)
		NewPage.PageOpen = true
	end
	
	function NewPage.CloseSettingsPage()
		-- upvalues: NewPage (copy)
		NewPage.PageOpen = false
	end
	
	ReactRobloxModule.createRoot(NewPage.Page):render((ReactModule.createElement(FoundationProvider, {
		colorMode = FoundationModule.Enums.ColorMode.Dark,
		device = Utils.getDeviceType()
	}, {})))
	
	return NewPage
end

return if FFlagRefactorInExpSettingsInDevelopment then createGameSettings() else require(Modules.Settings.Pages.GameSettings)