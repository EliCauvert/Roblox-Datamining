local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local ChromeModule = require(CorePackages.Workspace.Packages.Chrome)
local SideSheetOpenBehavior = ChromeModule.Enums.SideSheetOpenBehavior
local SideSheetPlacement = ChromeModule.Enums.SideSheetPlacement
local FFlagKeepSideSheetOpenBesideMenu = require(CorePackages.Workspace.Packages.SharedFlags).FFlagKeepSideSheetOpenBesideMenu
local InGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local GameSettingsPage = InGameMenuIntegrationUtilsModule.createPageOpenSignal("GameSettingsPage")

return ServiceModule:register({
	id = "settings",
	label = "CoreScripts.InGameMenu.PageTitle.GameSettings",
	initialAvailability = ServiceModule.AvailabilitySignal.Available,
	sideSheetPlacement = SideSheetPlacement.AboveFold,
	sideSheetOpenBehavior = if FFlagKeepSideSheetOpenBesideMenu then SideSheetOpenBehavior.MenuBesideSheet else nil,
	activated = function(_)
		-- upvalues: InGameMenuIntegrationUtilsModule (copy), GameSettingsPage (copy)
		InGameMenuIntegrationUtilsModule.toggleIGMPage("GameSettingsPage", GameSettingsPage:get())
	end,
	isActivated = GameSettingsPage,
	components = {
		Icon = function(_)
			-- upvalues: CommonIconModule (copy), GameSettingsPage (copy)
			return CommonIconModule("icons/common/settings", "icons/common/settingsOn", GameSettingsPage)
		end
	}
})