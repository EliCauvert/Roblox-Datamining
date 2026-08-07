local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local serviceModule = require(chrome.Service)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local fFlagChromeActivatedMappedSignal = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal
local inGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local playersPage = inGameMenuIntegrationUtilsModule.createPageOpenSignal("PlayersPage")

return serviceModule:register({
	id = "people",
	label = "CoreScripts.InGameMenu.PageTitle.Players",
	initialAvailability = serviceModule.AvailabilitySignal.Available,
	sideSheetPlacement = sideSheetPlacement.Vertical,
	activated = function(_) --[[ line: 22 ]]
		-- upvalues: inGameMenuIntegrationUtilsModule (ref), playersPage (ref)
		inGameMenuIntegrationUtilsModule.toggleIGMPage("PlayersPage", playersPage:get())
	end,
	isActivated = if fFlagChromeActivatedMappedSignal then playersPage else function() --[[ line: 27 ]]
		-- upvalues: playersPage (ref)
		return playersPage:get()
	end,
	components = {
		Icon = function(_) --[[ line: 31 ]]
			-- upvalues: commonIconModule (ref), playersPage (ref)
			return commonIconModule("icons/menu/friends", "icons/menu/friendsOn", playersPage)
		end
	}
})