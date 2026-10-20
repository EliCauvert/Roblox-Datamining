local Chrome = script:FindFirstAncestor("Chrome")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local InGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local GameSettingsPage = InGameMenuIntegrationUtilsModule.createPageOpenSignal("GameSettingsPage")

return ServiceModule:register({
	id = "settings",
	label = "CoreScripts.InGameMenu.PageTitle.GameSettings",
	initialAvailability = ServiceModule.AvailabilitySignal.Available,
	sideSheetPlacement = require(game:GetService("CorePackages").Workspace.Packages.Chrome).Enums.SideSheetPlacement.AboveFold,
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