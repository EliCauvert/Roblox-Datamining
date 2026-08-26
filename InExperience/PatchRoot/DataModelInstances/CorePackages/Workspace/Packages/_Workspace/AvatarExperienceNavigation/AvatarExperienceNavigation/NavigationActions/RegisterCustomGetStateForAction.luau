local avatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local _ = require(avatarExperienceNavigation.Parent.Navigation)
local avatarRootNavigationActionModule = require(avatarExperienceNavigation.Enums.AvatarRootNavigationAction)
local _ = require(avatarExperienceNavigation.Enums.CustomGetStateForAction)

return function(p1, p2)
	-- upvalues: avatarRootNavigationActionModule (ref)
	return {
		type = avatarRootNavigationActionModule.RegisterCustomGetStateForAction,
		handlerId = p1,
		handler = p2
	}
end