local playersService = game:GetService("Players")
local VRService = game:GetService("VRService")
local corePackagesService = game:GetService("CorePackages")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
game:DefineFastInt("NewInGameMenuPercentRollout3", 0)
game:DefineFastString("NewInGameMenuForcedUserIds", "")
game:DefineFastFlag("NewInGameMenuDisabledInVR", false)
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = sharedFlagsModule.isSubjectToDesktopPolicies
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled

return function()
	-- upvalues: VRService (ref), isInExperienceUIVREnabled (ref), playersService (ref)
	if VRService.VREnabled then
		return isInExperienceUIVREnabled
	end
	local localPlayer = playersService.LocalPlayer
	while not localPlayer do
		playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
		localPlayer = playersService.LocalPlayer
	end
	for i in game:GetFastString("NewInGameMenuForcedUserIds"):gmatch("%d+") do
		if tonumber(i) == localPlayer.UserId then
			return true
		end
	end
	return localPlayer.UserId % 100 < game:GetFastInt("NewInGameMenuPercentRollout3")
end