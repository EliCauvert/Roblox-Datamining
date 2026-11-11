local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.AvatarExperienceState)
local SetEquippedInTryOnManagerFunction = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceRodux).Actions.SetEquippedInTryOnManager

return function(p1, p2, _, p3, _)
	-- upvalues: SetEquippedInTryOnManagerFunction (copy)
	return function(p4)
		-- upvalues: SetEquippedInTryOnManagerFunction (upval), p1 (copy), p2 (copy), p3 (copy)
		p4:dispatch(SetEquippedInTryOnManagerFunction(p1, p2, p3))
	end
end