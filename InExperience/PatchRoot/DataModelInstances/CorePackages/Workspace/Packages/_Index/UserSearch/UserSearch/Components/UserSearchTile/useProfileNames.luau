local userProfilesModule = require(script:FindFirstAncestor("UserSearch").Parent.UserProfiles)

return function(p1)
	-- upvalues: userProfilesModule (ref)
	local var1 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { p1.userId },
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local var2 = if var1.data then userProfilesModule.Selectors.getUsernameFromId(var1.data, p1.userId) else nil
	
	return {
		username = if var2 then userProfilesModule.Formatters.formatUsername(var2) else nil,
		combinedName = if var1.data then userProfilesModule.Selectors.getCombinedNameFromId(var1.data, p1.userId) else nil
	}
end