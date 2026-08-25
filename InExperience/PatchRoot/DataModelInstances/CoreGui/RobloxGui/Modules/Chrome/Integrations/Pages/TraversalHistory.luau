local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local serviceModule = require(chrome.Service)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local inGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local traversalHistoryPage = inGameMenuIntegrationUtilsModule.createPageOpenSignal("TraversalHistoryPage")

return serviceModule:register({
	id = "traversal_history",
	label = "CoreScripts.TopBar.Traversal.History",
	initialAvailability = serviceModule.AvailabilitySignal.Available,
	sideSheetPlacement = sideSheetPlacement.Page,
	activated = function(_)
		-- upvalues: inGameMenuIntegrationUtilsModule (ref), traversalHistoryPage (ref)
		inGameMenuIntegrationUtilsModule.toggleIGMPage("TraversalHistoryPage", traversalHistoryPage:get())
	end,
	isActivated = traversalHistoryPage,
	components = {
		Icon = function(_)
			-- upvalues: commonIconModule (ref), traversalHistoryPage (ref)
			return commonIconModule("Clock", nil, traversalHistoryPage)
		end
	}
})