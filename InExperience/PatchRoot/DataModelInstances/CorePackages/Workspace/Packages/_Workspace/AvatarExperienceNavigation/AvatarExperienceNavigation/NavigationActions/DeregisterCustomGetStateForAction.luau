local avatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local avatarRootNavigationActionModule = require(avatarExperienceNavigation.Enums.AvatarRootNavigationAction)
local _ = require(avatarExperienceNavigation.Enums.CustomGetStateForAction)

return function(p1)
	-- upvalues: avatarRootNavigationActionModule (ref)
	return {
		type = avatarRootNavigationActionModule.DeregisterCustomGetStateForAction,
		handlerId = p1
	}
end