local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local InGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local ResetCharacterPage = InGameMenuIntegrationUtilsModule.createPageOpenSignal("ResetCharacterPage")

return ServiceModule:register({
	label = "CoreScripts.InGameMenu.QuickActions.Respawn",
	initialAvailability = ServiceModule.AvailabilitySignal.Available,
	id = require(CorePackages.Workspace.Packages.InExperienceSideSheet).Enums.ActionBinding.Respawn,
	sideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement.SessionAction,
	activated = function(_) --[[ Line: 22 ]]
		-- upvalues: InGameMenuIntegrationUtilsModule (copy), ResetCharacterPage (copy)
		InGameMenuIntegrationUtilsModule.toggleIGMPage("ResetCharacterPage", ResetCharacterPage:get())
	end,
	isActivated = ResetCharacterPage,
	components = {
		Icon = function(_) --[[ Line: 27 ]]
			-- upvalues: CommonIconModule (copy), ResetCharacterPage (copy)
			return CommonIconModule("icons/actions/respawn", nil, ResetCharacterPage)
		end
	}
})