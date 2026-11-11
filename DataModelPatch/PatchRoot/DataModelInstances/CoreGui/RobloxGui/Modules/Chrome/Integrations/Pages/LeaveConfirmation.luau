local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local InGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local LeaveGamePage = InGameMenuIntegrationUtilsModule.createPageOpenSignal("LeaveGamePage")

return ServiceModule:register({
	label = "CoreScripts.InGameMenu.LeaveGame",
	initialAvailability = ServiceModule.AvailabilitySignal.Available,
	id = require(CorePackages.Workspace.Packages.InExperienceSideSheet).Enums.ActionBinding.Leave,
	sideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement.SessionAction,
	activated = function(_)
		-- upvalues: InGameMenuIntegrationUtilsModule (copy), LeaveGamePage (copy)
		InGameMenuIntegrationUtilsModule.toggleIGMPage("LeaveGamePage", LeaveGamePage:get())
	end,
	isActivated = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal then LeaveGamePage else function()
		-- upvalues: LeaveGamePage (copy)
		return LeaveGamePage:get()
	end,
	components = {
		Icon = function(_)
			-- upvalues: CommonIconModule (copy), LeaveGamePage (copy)
			return CommonIconModule("icons/actions/leave", nil, LeaveGamePage)
		end
	}
})