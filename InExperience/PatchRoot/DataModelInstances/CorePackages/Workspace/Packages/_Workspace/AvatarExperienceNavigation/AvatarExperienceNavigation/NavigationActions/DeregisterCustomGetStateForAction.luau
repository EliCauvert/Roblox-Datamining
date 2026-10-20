local AvatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local AvatarRootNavigationActionModule = require(AvatarExperienceNavigation.Enums.AvatarRootNavigationAction)
local _ = require(AvatarExperienceNavigation.Enums.CustomGetStateForAction)

return function(HandlerId)
	-- upvalues: AvatarRootNavigationActionModule (copy)
	return {
		type = AvatarRootNavigationActionModule.DeregisterCustomGetStateForAction,
		handlerId = HandlerId
	}
end