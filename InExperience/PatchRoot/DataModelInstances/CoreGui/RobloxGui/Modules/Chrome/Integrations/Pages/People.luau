local Chrome = script:FindFirstAncestor("Chrome")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local InGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local PlayersPage = InGameMenuIntegrationUtilsModule.createPageOpenSignal("PlayersPage")

return ServiceModule:register({
	id = "people",
	label = "CoreScripts.InGameMenu.PageTitle.Players",
	initialAvailability = ServiceModule.AvailabilitySignal.Available,
	sideSheetPlacement = require(game:GetService("CorePackages").Workspace.Packages.Chrome).Enums.SideSheetPlacement.AboveFold,
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