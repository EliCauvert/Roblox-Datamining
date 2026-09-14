local var1
local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local buildExperienceModule = require(corePackagesService.Workspace.Packages.BuildExperience)
local buildModeLaunchModule = require(corePackagesService.Workspace.Packages.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local serviceModule = require(chrome.Service)
local fFlagBuildExperienceAssetLibrary = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagBuildExperienceAssetLibrary
local buttonVariant = foundationModule.Enums.ButtonVariant

local function _()
	-- upvalues: buildModeLaunchModule (ref), fFlagBuildExperienceAssetLibrary (ref), VRService (ref)
	local var2
	if not buildModeLaunchModule:hasBuildMode() then
		var2 = fFlagBuildExperienceAssetLibrary and (game:GetEngineFeature("IsViewingCloudEdit") and not VRService.VREnabled)
	end
	return var2
end

local t = {
	id = "assistant_build",
	label = "CommonUI.Features.NavBar.Build"
}

if not buildModeLaunchModule:hasBuildMode() then
	var1 = fFlagBuildExperienceAssetLibrary and (game:GetEngineFeature("IsViewingCloudEdit") and not VRService.VREnabled)
end
t.initialAvailability = if var1 then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable

function t.activated(_)
	-- upvalues: buildExperienceModule (ref)
	local assistantBuildStore = buildExperienceModule.GetAssistantBuildStore()
	local playButtonStore = buildExperienceModule.GetPlayButtonStore()
	
	if assistantBuildStore.getIsDisabled() then
		assistantBuildStore.setIsDisabledTooltipOpen(not assistantBuildStore.getIsDisabledTooltipOpen())
		
		return
	end
	assistantBuildStore.setIsDisabledTooltipOpen(false)
	playButtonStore.setIsActive(true)
end

t.components = {
	Icon = function(_)
		-- upvalues: reactModule (ref), buildExperienceModule (ref), buttonVariant (ref)
		return reactModule.createElement(buildExperienceModule.AssistantBuild, { variant = buttonVariant.Utility })
	end
}

return serviceModule:register(t)