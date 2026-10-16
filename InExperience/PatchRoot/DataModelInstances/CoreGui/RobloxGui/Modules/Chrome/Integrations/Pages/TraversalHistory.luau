local Chrome = script:FindFirstAncestor("Chrome")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local InGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local TraversalHistoryPage = InGameMenuIntegrationUtilsModule.createPageOpenSignal("TraversalHistoryPage")

return ServiceModule:register({
	id = "traversal_history",
	label = "CoreScripts.TopBar.Traversal.History",
	initialAvailability = ServiceModule.AvailabilitySignal.Available,
	sideSheetPlacement = require(game:GetService("CorePackages").Workspace.Packages.Chrome).Enums.SideSheetPlacement.BelowFold,
	activated = function(_) --[[ Line: 18 ]]
		-- upvalues: InGameMenuIntegrationUtilsModule (copy), TraversalHistoryPage (copy)
		InGameMenuIntegrationUtilsModule.toggleIGMPage("TraversalHistoryPage", TraversalHistoryPage:get())
	end,
	isActivated = TraversalHistoryPage,
	components = {
		Icon = function(_) --[[ Line: 23 ]]
			-- upvalues: CommonIconModule (copy), TraversalHistoryPage (copy)
			return CommonIconModule("Clock", nil, TraversalHistoryPage)
		end
	}
})