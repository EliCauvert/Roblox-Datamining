local CorePackages = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local ReactModule = require(CorePackages.Packages.React)
local BuildExperienceModule = require(CorePackages.Workspace.Packages.BuildExperience)
local ServiceModule = require(script:FindFirstAncestor("Chrome").Service)
local ButtonVariant = require(CorePackages.Packages.Foundation).Enums.ButtonVariant

local function _(): boolean
	-- upvalues: BuildExperienceModule (copy), VRService (copy)
	return BuildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled
end

local config = {
	id = "assistant_build",
	label = "CommonUI.Features.NavBar.Build",
	initialAvailability = if NoVREnabled then ServiceModule.AvailabilitySignal.Available else ServiceModule.AvailabilitySignal.Unavailable,
	activated = function(_)
		-- upvalues: BuildExperienceModule (copy)
		local AssistantBuildStore = BuildExperienceModule.GetAssistantBuildStore()
		local PlayButtonStore = BuildExperienceModule.GetPlayButtonStore()
		
		if AssistantBuildStore.getIsDisabled() then
			AssistantBuildStore.setIsDisabledTooltipOpen(not AssistantBuildStore.getIsDisabledTooltipOpen())
			
			return
		else
			AssistantBuildStore.setIsDisabledTooltipOpen(false)
			PlayButtonStore.setIsActive(true)
		end
	end,
	components = {
		Icon = function(_)
			-- upvalues: ReactModule (copy), BuildExperienceModule (copy), ButtonVariant (copy)
			return ReactModule.createElement(BuildExperienceModule.AssistantBuild, { variant = ButtonVariant.Utility })
		end
	}
}
local NoVREnabled: boolean = BuildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled

return (ServiceModule:register(config))