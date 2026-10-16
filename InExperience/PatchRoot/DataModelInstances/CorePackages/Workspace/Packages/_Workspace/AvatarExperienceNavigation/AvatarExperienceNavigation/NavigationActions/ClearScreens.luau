local AvatarMainStackNavigationActionModule = require(script:FindFirstAncestor("AvatarExperienceNavigation").Enums.AvatarMainStackNavigationAction)

return function(RouteNames) --[[ Line: 5 | Named "ClearScreens" ]]
	-- upvalues: AvatarMainStackNavigationActionModule (copy)
	return {
		type = AvatarMainStackNavigationActionModule.ClearScreens,
		routeNames = RouteNames
	}
end