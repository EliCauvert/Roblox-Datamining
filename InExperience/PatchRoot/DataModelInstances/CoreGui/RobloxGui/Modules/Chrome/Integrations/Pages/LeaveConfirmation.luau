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
	activated = function(_) --[[ line: 25 ]]
		-- upvalues: inGameMenuIntegrationUtilsModule (ref), leaveGamePage (ref)
		inGameMenuIntegrationUtilsModule.toggleIGMPage("LeaveGamePage", leaveGamePage:get())
	end,
	isActivated = if require(corePackagesService.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal then leaveGamePage else function() --[[ line: 30 ]]
		-- upvalues: leaveGamePage (ref)
		return leaveGamePage:get()
	end,
	components = {
		Icon = function(_) --[[ line: 34 ]]
			-- upvalues: commonIconModule (ref), leaveGamePage (ref)
			return commonIconModule("icons/actions/leave", nil, leaveGamePage)
		end
	}
})