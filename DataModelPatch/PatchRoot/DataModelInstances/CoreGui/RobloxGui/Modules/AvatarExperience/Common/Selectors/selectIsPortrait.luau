local CorePackages = game:GetService("CorePackages")
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.AvatarExperienceState)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode

return function(p1): boolean
	-- upvalues: IsVRAppBuildFunction (copy), DeviceOrientationMode (copy)
	return if IsVRAppBuildFunction() then true else p1.DeviceOrientation == DeviceOrientationMode.Portrait
end