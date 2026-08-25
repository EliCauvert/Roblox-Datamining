local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local serviceModule = require(chrome.Service)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local inGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local playersPage = inGameMenuIntegrationUtilsModule.createPageOpenSignal("PlayersPage")

return serviceModule:register({
	id = "people",
	label = "CoreScripts.InGameMenu.PageTitle.Players",
	initialAvailability = serviceModule.AvailabilitySignal.Available,
	sideSheetPlacement = sideSheetPlacement.Vertical,
	activated = function(_)
		-- upvalues: inGameMenuIntegrationUtilsModule (ref), playersPage (ref)
		inGameMenuIntegrationUtilsModule.toggleIGMPage("PlayersPage", playersPage:get())
	end,
	isActivated = playersPage,
	components = {
		Icon = function(_)
			-- upvalues: commonIconModule (ref), playersPage (ref)
			return commonIconModule("icons/menu/friends", "icons/menu/friendsOn", playersPage)
		end
	}
})