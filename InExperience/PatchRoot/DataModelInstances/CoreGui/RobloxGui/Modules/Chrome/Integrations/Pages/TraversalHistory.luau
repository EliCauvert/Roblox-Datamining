local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local serviceModule = require(chrome.Service)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local fFlagChromeActivatedMappedSignal = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal
local inGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local traversalHistoryPage = inGameMenuIntegrationUtilsModule.createPageOpenSignal("TraversalHistoryPage")

return serviceModule:register({
	id = "traversal_history",
	label = "CoreScripts.TopBar.Traversal.History",
	initialAvailability = serviceModule.AvailabilitySignal.Available,
	sideSheetPlacement = sideSheetPlacement.Page,
	activated = function(_) --[[ line: 21 ]]
		-- upvalues: inGameMenuIntegrationUtilsModule (ref), traversalHistoryPage (ref)
		inGameMenuIntegrationUtilsModule.toggleIGMPage("TraversalHistoryPage", traversalHistoryPage:get())
	end,
	isActivated = if fFlagChromeActivatedMappedSignal then traversalHistoryPage else function() --[[ line: 26 ]]
		-- upvalues: traversalHistoryPage (ref)
		return traversalHistoryPage:get()
	end,
	components = {
		Icon = function(_) --[[ line: 30 ]]
			-- upvalues: commonIconModule (ref), traversalHistoryPage (ref)
			return commonIconModule("Clock", nil, traversalHistoryPage)
		end
	}
})