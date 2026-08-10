local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local serviceModule = require(chrome.Service)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local inGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local leaveGamePage = inGameMenuIntegrationUtilsModule.createPageOpenSignal("LeaveGamePage")

return serviceModule:register({
	label = "CoreScripts.InGameMenu.LeaveGame",
	initialAvailability = serviceModule.AvailabilitySignal.Available,
	id = require(corePackagesService.Workspace.Packages.InExperienceSideSheet).Enums.ActionBinding.Leave,
	sideSheetPlacement = sideSheetPlacement.SessionAction,
	activated = function(_) --[[ line: 22 ]]
		-- upvalues: inGameMenuIntegrationUtilsModule (ref), leaveGamePage (ref)
		inGameMenuIntegrationUtilsModule.toggleIGMPage("LeaveGamePage", leaveGamePage:get())
	end,
	isActivated = leaveGamePage,
	components = {
		Icon = function(_) --[[ line: 27 ]]
			-- upvalues: commonIconModule (ref), leaveGamePage (ref)
			return commonIconModule("icons/actions/leave", nil, leaveGamePage)
		end
	}
})