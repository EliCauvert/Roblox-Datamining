local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local ChromeModule = require(CorePackages.Workspace.Packages.Chrome)
local SideSheetOpenBehavior = ChromeModule.Enums.SideSheetOpenBehavior
local SideSheetPlacement = ChromeModule.Enums.SideSheetPlacement
local FFlagKeepSideSheetOpenBesideMenu = require(CorePackages.Workspace.Packages.SharedFlags).FFlagKeepSideSheetOpenBesideMenu
local InGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local TraversalHistoryPage = InGameMenuIntegrationUtilsModule.createPageOpenSignal("TraversalHistoryPage")

return ServiceModule:register({
	id = "traversal_history",
	label = "CoreScripts.TopBar.Traversal.History",
	initialAvailability = ServiceModule.AvailabilitySignal.Available,
	sideSheetPlacement = SideSheetPlacement.BelowFold,
	sideSheetOpenBehavior = if FFlagKeepSideSheetOpenBesideMenu then SideSheetOpenBehavior.MenuBesideSheet else nil,
	activated = function(_)
		-- upvalues: InGameMenuIntegrationUtilsModule (copy), TraversalHistoryPage (copy)
		InGameMenuIntegrationUtilsModule.toggleIGMPage("TraversalHistoryPage", TraversalHistoryPage:get())
	end,
	isActivated = TraversalHistoryPage,
	components = {
		Icon = function(_)
			-- upvalues: CommonIconModule (copy), TraversalHistoryPage (copy)
			return CommonIconModule("Clock", nil, TraversalHistoryPage)
		end
	}
})