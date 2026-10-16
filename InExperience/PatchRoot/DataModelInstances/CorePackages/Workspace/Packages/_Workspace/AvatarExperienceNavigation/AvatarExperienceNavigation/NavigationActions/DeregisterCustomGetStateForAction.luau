local AvatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local AvatarRootNavigationActionModule = require(AvatarExperienceNavigation.Enums.AvatarRootNavigationAction)
local _ = require(AvatarExperienceNavigation.Enums.CustomGetStateForAction)

return function(HandlerId) --[[ Line: 6 | Named "DeregisterCustomGetStateForAction" ]]
	-- upvalues: AvatarRootNavigationActionModule (copy)
	return {
		type = AvatarRootNavigationActionModule.DeregisterCustomGetStateForAction,
		handlerId = HandlerId
	}
end