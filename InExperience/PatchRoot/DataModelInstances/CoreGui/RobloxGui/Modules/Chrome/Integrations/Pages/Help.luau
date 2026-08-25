local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local serviceModule = require(chrome.Service)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local inGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local helpPage = inGameMenuIntegrationUtilsModule.createPageOpenSignal("HelpPage")

return serviceModule:register({
	id = "help",
	label = "CoreScripts.Feedback.Help.MainHeader",
	initialAvailability = serviceModule.AvailabilitySignal.Available,
	sideSheetPlacement = sideSheetPlacement.Page,
	activated = function(_)
		-- upvalues: inGameMenuIntegrationUtilsModule (ref), helpPage (ref)
		inGameMenuIntegrationUtilsModule.toggleIGMPage("HelpPage", helpPage:get())
	end,
	isActivated = helpPage,
	components = {
		Icon = function(_)
			-- upvalues: commonIconModule (ref), helpPage (ref)
			return commonIconModule("CircleQuestion", nil, helpPage)
		end
	}
})