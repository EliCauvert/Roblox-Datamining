local avatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local avatarRootNavigationActionModule = require(avatarExperienceNavigation.Enums.AvatarRootNavigationAction)
local _ = require(avatarExperienceNavigation.Enums.CustomGetStateForAction)

return function(p0)
	-- upvalues: avatarRootNavigationActionModule (ref)
	return {
		type = avatarRootNavigationActionModule.DeregisterCustomGetStateForAction,
		handlerId = p0
	}
end