local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local serviceModule = require(chrome.Service)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local fFlagChromeActivatedMappedSignal = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal
local inGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local gameSettingsPage = inGameMenuIntegrationUtilsModule.createPageOpenSignal("GameSettingsPage")

return serviceModule:register({
	id = "settings",
	label = "CoreScripts.InGameMenu.PageTitle.GameSettings",
	initialAvailability = serviceModule.AvailabilitySignal.Available,
	sideSheetPlacement = sideSheetPlacement.Page,
	activated = function(_) --[[ line: 22 ]]
		-- upvalues: inGameMenuIntegrationUtilsModule (ref), gameSettingsPage (ref)
		inGameMenuIntegrationUtilsModule.toggleIGMPage("GameSettingsPage", gameSettingsPage:get())
	end,
	isActivated = if fFlagChromeActivatedMappedSignal then gameSettingsPage else function() --[[ line: 27 ]]
		-- upvalues: gameSettingsPage (ref)
		return gameSettingsPage:get()
	end,
	components = {
		Icon = function(_) --[[ line: 31 ]]
			-- upvalues: commonIconModule (ref), gameSettingsPage (ref)
			return commonIconModule("icons/common/settings", "icons/common/settingsOn", gameSettingsPage)
		end
	}
})