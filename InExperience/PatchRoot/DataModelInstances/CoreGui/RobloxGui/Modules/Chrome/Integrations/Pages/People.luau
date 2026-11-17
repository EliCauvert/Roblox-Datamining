local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local ChromeModule = require(CorePackages.Workspace.Packages.Chrome)
local SideSheetOpenBehavior = ChromeModule.Enums.SideSheetOpenBehavior
local InGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local PlayersPage = InGameMenuIntegrationUtilsModule.createPageOpenSignal("PlayersPage")

return ServiceModule:register({
	label = "CoreScripts.InGameMenu.PageTitle.Players",
	initialAvailability = ServiceModule.AvailabilitySignal.Available,
	id = require(CorePackages.Workspace.Packages.InExperienceSideSheet).Constants.IntegrationIds.People,
	sideSheetPlacement = ChromeModule.Enums.SideSheetPlacement.AboveFold,
	sideSheetOpenBehavior = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagKeepSideSheetOpenBesideMenu then SideSheetOpenBehavior.MenuBesideSheet else nil,
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