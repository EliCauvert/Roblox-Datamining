local CorePackages = game:GetService("CorePackages")
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.AvatarExperienceState)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView

return function(p1)
	-- upvalues: IsVRAppBuildFunction (copy), FullView (copy)
	if IsVRAppBuildFunction() then
		local t = {}
		setmetatable(t, {
			__index = function()
				-- upvalues: FullView (upval)
				return FullView.None
			end
		})
		
		return t
	else
		return p1.AvatarExperience.Common.FullView
	end
end