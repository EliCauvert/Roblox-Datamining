local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local InGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local PlayersPage = InGameMenuIntegrationUtilsModule.createPageOpenSignal("PlayersPage")

return ServiceModule:register({
	id = "people",
	label = "CoreScripts.InGameMenu.PageTitle.Players",
	initialAvailability = ServiceModule.AvailabilitySignal.Available,
	sideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement.Vertical,
	activated = function(_)
		-- upvalues: InGameMenuIntegrationUtilsModule (copy), PlayersPage (copy)
		InGameMenuIntegrationUtilsModule.toggleIGMPage("PlayersPage", PlayersPage:get())
	end,
	isActivated = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal then PlayersPage else function()
		-- upvalues: PlayersPage (copy)
		return PlayersPage:get()
	end,
	components = {
		Icon = function(_)
			-- upvalues: CommonIconModule (copy), PlayersPage (copy)
			return CommonIconModule("icons/menu/friends", "icons/menu/friendsOn", PlayersPage)
		end
	}
})