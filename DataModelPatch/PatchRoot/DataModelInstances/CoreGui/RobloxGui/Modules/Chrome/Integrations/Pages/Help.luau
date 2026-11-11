local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local InGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local HelpPage = InGameMenuIntegrationUtilsModule.createPageOpenSignal("HelpPage")

return ServiceModule:register({
	id = "help",
	label = "CoreScripts.Feedback.Help.MainHeader",
	initialAvailability = ServiceModule.AvailabilitySignal.Available,
	sideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement.Page,
	activated = function(_)
		-- upvalues: InGameMenuIntegrationUtilsModule (copy), HelpPage (copy)
		InGameMenuIntegrationUtilsModule.toggleIGMPage("HelpPage", HelpPage:get())
	end,
	isActivated = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal then HelpPage else function()
		-- upvalues: HelpPage (copy)
		return HelpPage:get()
	end,
	components = {
		Icon = function(_)
			-- upvalues: CommonIconModule (copy), HelpPage (copy)
			return CommonIconModule("CircleQuestion", nil, HelpPage)
		end
	}
})