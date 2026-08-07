local avatarMainStackNavigationActionModule = require(script:FindFirstAncestor("AvatarExperienceNavigation").Enums.AvatarMainStackNavigationAction)

return function(p0) --[[ line: 5 | named "ClearScreens" ]]
	-- upvalues: avatarMainStackNavigationActionModule (ref)
	return {
		type = avatarMainStackNavigationActionModule.ClearScreens,
		routeNames = p0
	}
end