local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local EnumReactPageModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.EnumReactPage)
local InGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local TraversalHistoryPage = InGameMenuIntegrationUtilsModule.createPageOpenSignal("TraversalHistoryPage")

return ServiceModule:register({
	id = "traversal_history",
	label = "CoreScripts.TopBar.Traversal.History",
	initialAvailability = ServiceModule.AvailabilitySignal.Available,
	sideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement.Page,
	activated = function(_)
		-- upvalues: InGameMenuIntegrationUtilsModule (copy), TraversalHistoryPage (copy), EnumReactPageModule (copy)
		InGameMenuIntegrationUtilsModule.toggleReactPage("TraversalHistoryPage", TraversalHistoryPage:get(), EnumReactPageModule.TraversalHistory)
	end,
	isActivated = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal then TraversalHistoryPage else function()
		-- upvalues: TraversalHistoryPage (copy)
		return TraversalHistoryPage:get()
	end,
	components = {
		Icon = function(_)
			-- upvalues: CommonIconModule (copy), TraversalHistoryPage (copy)
			return CommonIconModule("Clock", nil, TraversalHistoryPage)
		end
	}
})