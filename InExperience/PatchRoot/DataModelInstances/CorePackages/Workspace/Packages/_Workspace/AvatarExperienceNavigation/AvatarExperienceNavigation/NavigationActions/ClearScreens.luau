local avatarMainStackNavigationActionModule = require(script:FindFirstAncestor("AvatarExperienceNavigation").Enums.AvatarMainStackNavigationAction)

return function(p0)
	-- upvalues: avatarMainStackNavigationActionModule (ref)
	return {
		type = avatarMainStackNavigationActionModule.ClearScreens,
		routeNames = p0
	}
end