local var1
local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local buildExperienceModule = require(corePackagesService.Workspace.Packages.BuildExperience)
local buildModeLaunchModule = require(corePackagesService.Workspace.Packages.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local serviceModule = require(chrome.Service)
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

local function _()
	-- upvalues: buildModeLaunchModule (ref), VRService (ref)
	local var2
	if not buildModeLaunchModule:hasBuildMode() then
		var2 = game:GetEngineFeature("IsViewingCloudEdit") and not VRService.VREnabled
	end
	return var2
end

local t = {
	id = "model_library",
	label = "CommonUI.Features.NavBar.Build"
}

if not buildModeLaunchModule:hasBuildMode() then
	var1 = game:GetEngineFeature("IsViewingCloudEdit") and not VRService.VREnabled
end
t.initialAvailability = if var1 then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable

function t.activated(_)
	-- upvalues: buildExperienceModule (ref)
	local modelLibraryStore = buildExperienceModule.GetModelLibraryStore()
	modelLibraryStore.setIsOpen(not modelLibraryStore.getIsOpen())
end

t.components = {
	Icon = function(_)
		-- upvalues: reactModule (ref), iconButton (ref), iconName (ref), inputSize (ref)
		return reactModule.createElement(iconButton, {
			isCircular = true,
			testId = "model-library-button",
			icon = iconName.SquaresGridPlus,
			size = inputSize.Medium,
			onActivated = function() end
		})
	end
}

return serviceModule:register(t)