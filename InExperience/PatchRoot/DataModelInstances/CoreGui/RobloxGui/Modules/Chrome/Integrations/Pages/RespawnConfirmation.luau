local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local serviceModule = require(chrome.Service)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local inGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local resetCharacterPage = inGameMenuIntegrationUtilsModule.createPageOpenSignal("ResetCharacterPage")

return serviceModule:register({
	label = "CoreScripts.InGameMenu.QuickActions.Respawn",
	initialAvailability = serviceModule.AvailabilitySignal.Available,
	id = require(corePackagesService.Workspace.Packages.InExperienceSideSheet).Enums.ActionBinding.Respawn,
	sideSheetPlacement = sideSheetPlacement.SessionAction,
	activated = function(_) --[[ line: 25 ]]
		-- upvalues: inGameMenuIntegrationUtilsModule (ref), resetCharacterPage (ref)
		inGameMenuIntegrationUtilsModule.toggleIGMPage("ResetCharacterPage", resetCharacterPage:get())
	end,
	isActivated = if require(corePackagesService.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal then resetCharacterPage else function() --[[ line: 30 ]]
		-- upvalues: resetCharacterPage (ref)
		return resetCharacterPage:get()
	end,
	components = {
		Icon = function(_) --[[ line: 34 ]]
			-- upvalues: commonIconModule (ref), resetCharacterPage (ref)
			return commonIconModule("icons/actions/respawn", nil, resetCharacterPage)
		end
	}
})