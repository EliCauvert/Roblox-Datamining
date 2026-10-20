local Players = game:GetService("Players")
local VRService = game:GetService("VRService")
local CorePackages = game:GetService("CorePackages")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
game:DefineFastInt("NewInGameMenuPercentRollout3", 0)
game:DefineFastString("NewInGameMenuForcedUserIds", "")
game:DefineFastFlag("NewInGameMenuDisabledInVR", false)
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = SharedFlagsModule.isSubjectToDesktopPolicies
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled

return function(): boolean
	-- upvalues: VRService (copy), IsInExperienceUIVREnabled (copy), Players (copy)
	if VRService.VREnabled then
		return not IsInExperienceUIVREnabled
	end
	local LocalPlayer = Players.LocalPlayer
	while not LocalPlayer do
		Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
		LocalPlayer = Players.LocalPlayer
	end
	for i in game:GetFastString("NewInGameMenuForcedUserIds"):gmatch("%d+") do
		if tonumber(i) == LocalPlayer.UserId then
			return true
		end
	end
	return game:GetFastInt("NewInGameMenuPercentRollout3") > LocalPlayer.UserId % 100
end