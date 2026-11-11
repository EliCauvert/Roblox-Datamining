local CorePackages = game:GetService("CorePackages")
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.AvatarExperienceState)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView

return function(p1, p2)
	-- upvalues: IsVRAppBuildFunction (copy), FullView (copy)
	return if IsVRAppBuildFunction() then FullView.None else p1.AvatarExperience.Common.FullView[p2]
end