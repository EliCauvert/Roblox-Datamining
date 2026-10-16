local AvatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local _ = require(AvatarExperienceNavigation.Parent.Navigation)
local AvatarRootNavigationActionModule = require(AvatarExperienceNavigation.Enums.AvatarRootNavigationAction)
local _ = require(AvatarExperienceNavigation.Enums.CustomGetStateForAction)

return function(HandlerId, Handler) --[[ Line: 14 | Named "RegisterCustomGetStateForAction" ]]
	-- upvalues: AvatarRootNavigationActionModule (copy)
	return {
		type = AvatarRootNavigationActionModule.RegisterCustomGetStateForAction,
		handlerId = HandlerId,
		handler = Handler
	}
end