local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local InGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local GameSettingsPage = InGameMenuIntegrationUtilsModule.createPageOpenSignal("GameSettingsPage")

return ServiceModule:register({
	id = "settings",
	label = "CoreScripts.InGameMenu.PageTitle.GameSettings",
	initialAvailability = ServiceModule.AvailabilitySignal.Available,
	sideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement.Page,
	activated = function(_)
		-- upvalues: InGameMenuIntegrationUtilsModule (copy), GameSettingsPage (copy)
		InGameMenuIntegrationUtilsModule.toggleIGMPage("GameSettingsPage", GameSettingsPage:get())
	end,
	isActivated = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal then GameSettingsPage else function()
		-- upvalues: GameSettingsPage (copy)
		return GameSettingsPage:get()
	end,
	components = {
		Icon = function(_)
			-- upvalues: CommonIconModule (copy), GameSettingsPage (copy)
			return CommonIconModule("icons/common/settings", "icons/common/settingsOn", GameSettingsPage)
		end
	}
})