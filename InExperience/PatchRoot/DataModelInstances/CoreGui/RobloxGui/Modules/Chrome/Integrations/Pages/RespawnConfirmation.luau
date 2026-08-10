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
	activated = function(_) --[[ line: 22 ]]
		-- upvalues: inGameMenuIntegrationUtilsModule (ref), resetCharacterPage (ref)
		inGameMenuIntegrationUtilsModule.toggleIGMPage("ResetCharacterPage", resetCharacterPage:get())
	end,
	isActivated = resetCharacterPage,
	components = {
		Icon = function(_) --[[ line: 27 ]]
			-- upvalues: commonIconModule (ref), resetCharacterPage (ref)
			return commonIconModule("icons/actions/respawn", nil, resetCharacterPage)
		end
	}
})