local UserProfilesModule = require(script:FindFirstAncestor("UserSearch").Parent.UserProfiles)

return function(p1)
	-- upvalues: UserProfilesModule (copy)
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { p1.userId },
		query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local UsernameFromId = if UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getUsernameFromId(UseUserProfilesFetchResult.data, p1.userId) else nil
	
	return {
		username = if UsernameFromId then UserProfilesModule.Formatters.formatUsername(UsernameFromId) else nil,
		combinedName = if UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, p1.userId) else nil
	}
end