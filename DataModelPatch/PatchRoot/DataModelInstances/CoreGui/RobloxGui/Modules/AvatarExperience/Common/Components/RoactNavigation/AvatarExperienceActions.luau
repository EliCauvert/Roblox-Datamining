local AvatarExperienceActionsModule = { ClearScreens = "ClearScreens" }

function AvatarExperienceActionsModule.clearScreens(RouteNames)
	-- upvalues: AvatarExperienceActionsModule (copy)
	return {
		type = AvatarExperienceActionsModule.ClearScreens,
		routeNames = RouteNames
	}
end

return AvatarExperienceActionsModule