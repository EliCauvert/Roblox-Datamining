local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local _ = require(CorePackages.Packages.Thumbnailing)
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types)

return {
	AnimationTrackWithConnectionsTypes = {
		ToolHold = "ToolHold",
		LookAround = "LookAround",
		Mood = "Mood",
		MainBody = "MainBody",
		CameraStream = "CameraStream"
	}
}