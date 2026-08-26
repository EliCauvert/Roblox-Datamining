local avatarMainStackNavigationActionModule = require(script:FindFirstAncestor("AvatarExperienceNavigation").Enums.AvatarMainStackNavigationAction)

return function(p1)
	-- upvalues: avatarMainStackNavigationActionModule (ref)
	return {
		type = avatarMainStackNavigationActionModule.ClearScreens,
		routeNames = p1
	}
end