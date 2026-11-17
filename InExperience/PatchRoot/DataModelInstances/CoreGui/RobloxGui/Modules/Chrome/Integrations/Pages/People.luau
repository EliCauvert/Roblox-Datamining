local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local ChromeModule = require(CorePackages.Workspace.Packages.Chrome)
local SideSheetOpenBehavior = ChromeModule.Enums.SideSheetOpenBehavior
local SideSheetPlacement = ChromeModule.Enums.SideSheetPlacement
local FFlagKeepSideSheetOpenBesideMenu = require(CorePackages.Workspace.Packages.SharedFlags).FFlagKeepSideSheetOpenBesideMenu
local InGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local PlayersPage = InGameMenuIntegrationUtilsModule.createPageOpenSignal("PlayersPage")

return ServiceModule:register({
	id = "people",
	label = "CoreScripts.InGameMenu.PageTitle.Players",
	initialAvailability = ServiceModule.AvailabilitySignal.Available,
	sideSheetPlacement = SideSheetPlacement.AboveFold,
	sideSheetOpenBehavior = if FFlagKeepSideSheetOpenBesideMenu then SideSheetOpenBehavior.MenuBesideSheet else nil,
	activated = function(_)
		-- upvalues: InGameMenuIntegrationUtilsModule (copy), PlayersPage (copy)
		InGameMenuIntegrationUtilsModule.toggleIGMPage("PlayersPage", PlayersPage:get())
	end,
	isActivated = PlayersPage,
	components = {
		Icon = function(_)
			-- upvalues: CommonIconModule (copy), PlayersPage (copy)
			return CommonIconModule("icons/menu/friends", "icons/menu/friendsOn", PlayersPage)
		end
	}
})