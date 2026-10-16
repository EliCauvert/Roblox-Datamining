local AvatarExperienceActionsModule = { ClearScreens = "ClearScreens" }

function AvatarExperienceActionsModule.clearScreens(RouteNames) --[[ Line: 9 ]]
	-- upvalues: AvatarExperienceActionsModule (copy)
	return {
		type = AvatarExperienceActionsModule.ClearScreens,
		routeNames = RouteNames
	}
end

return AvatarExperienceActionsModule