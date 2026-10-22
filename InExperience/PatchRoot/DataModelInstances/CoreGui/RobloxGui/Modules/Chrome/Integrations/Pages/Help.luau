local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local IsPioneerLaunchFunction = require(CorePackages.Workspace.Packages.PioneerUtils).isPioneerLaunch
local FFlagRenameHelpToControls = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameHelpToControls
local InGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local HelpPage = InGameMenuIntegrationUtilsModule.createPageOpenSignal("HelpPage")

return ServiceModule:register({
	id = "help",
	initialAvailability = ServiceModule.AvailabilitySignal.Available,
	label = if FFlagRenameHelpToControls then "CoreScripts.InGameMenu.Controls.ControlsPage" else "CoreScripts.Feedback.Help.MainHeader",
	sideSheetPlacement = if IsPioneerLaunchFunction() then SideSheetPlacement.AboveFold else SideSheetPlacement.BelowFold,
	activated = function(_)
		-- upvalues: InGameMenuIntegrationUtilsModule (copy), HelpPage (copy)
		InGameMenuIntegrationUtilsModule.toggleIGMPage("HelpPage", HelpPage:get())
	end,
	isActivated = HelpPage,
	components = {
		Icon = function(_)
			-- upvalues: CommonIconModule (copy), FFlagRenameHelpToControls (copy), HelpPage (copy)
			return CommonIconModule(if FFlagRenameHelpToControls then "Controller" else "CircleQuestion", nil, HelpPage)
		end
	}
})