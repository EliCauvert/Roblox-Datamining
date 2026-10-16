local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local InGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local HelpPage = InGameMenuIntegrationUtilsModule.createPageOpenSignal("HelpPage")

return ServiceModule:register({
	id = "help",
	label = "CoreScripts.Feedback.Help.MainHeader",
	initialAvailability = ServiceModule.AvailabilitySignal.Available,
	sideSheetPlacement = if require(CorePackages.Workspace.Packages.PioneerUtils).isPioneerLaunch() then SideSheetPlacement.AboveFold else SideSheetPlacement.BelowFold,
	activated = function(_) --[[ Line: 20 ]]
		-- upvalues: InGameMenuIntegrationUtilsModule (copy), HelpPage (copy)
		InGameMenuIntegrationUtilsModule.toggleIGMPage("HelpPage", HelpPage:get())
	end,
	isActivated = HelpPage,
	components = {
		Icon = function(_) --[[ Line: 25 ]]
			-- upvalues: CommonIconModule (copy), HelpPage (copy)
			return CommonIconModule("CircleQuestion", nil, HelpPage)
		end
	}
})