local AvatarMainStackNavigationActionModule = require(script:FindFirstAncestor("AvatarExperienceNavigation").Enums.AvatarMainStackNavigationAction)

return function(RouteNames)
	-- upvalues: AvatarMainStackNavigationActionModule (copy)
	return {
		type = AvatarMainStackNavigationActionModule.ClearScreens,
		routeNames = RouteNames
	}
end