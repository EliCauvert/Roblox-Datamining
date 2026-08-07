local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local buildExperienceModule = require(corePackagesService.Workspace.Packages.BuildExperience)
local serviceModule = require(chrome.Service)
local buttonVariant = foundationModule.Enums.ButtonVariant

local function _() --[[ line: 14 | named "canShowAssistantBuild" ]]
	-- upvalues: buildExperienceModule (ref), VRService (ref)
	return buildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled
end

return serviceModule:register({
	id = "assistant_build",
	label = "CommonUI.Features.NavBar.Build",
	initialAvailability = if buildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable,
	activated = function(_) --[[ line: 24 ]]
		-- upvalues: buildExperienceModule (ref)
		local assistantBuildStore = buildExperienceModule.GetAssistantBuildStore()
		local playButtonStore = buildExperienceModule.GetPlayButtonStore()
		
		if assistantBuildStore.getIsDisabled() then
			assistantBuildStore.setIsDisabledTooltipOpen(not assistantBuildStore.getIsDisabledTooltipOpen())
			
			return
		end
		assistantBuildStore.setIsDisabledTooltipOpen(false)
		playButtonStore.setIsActive(true)
	end,
	components = {
		Icon = function(_) --[[ line: 35 ]]
			-- upvalues: reactModule (ref), buildExperienceModule (ref), buttonVariant (ref)
			return reactModule.createElement(buildExperienceModule.AssistantBuild, { variant = buttonVariant.Utility })
		end
	}
})