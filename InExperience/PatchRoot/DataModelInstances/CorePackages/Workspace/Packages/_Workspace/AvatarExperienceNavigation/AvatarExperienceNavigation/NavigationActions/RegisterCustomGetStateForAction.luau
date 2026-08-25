local avatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local _ = require(avatarExperienceNavigation.Parent.Navigation)
local avatarRootNavigationActionModule = require(avatarExperienceNavigation.Enums.AvatarRootNavigationAction)
local _ = require(avatarExperienceNavigation.Enums.CustomGetStateForAction)

return function(p0, p1)
	-- upvalues: avatarRootNavigationActionModule (ref)
	return {
		type = avatarRootNavigationActionModule.RegisterCustomGetStateForAction,
		handlerId = p0,
		handler = p1
	}
end