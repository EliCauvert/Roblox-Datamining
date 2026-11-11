local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local UserProfilesModule = require(CorePackages.Workspace.Packages.UserProfiles)
local PeopleListContextualMenuModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.Home.PeopleListContextualMenu)

return function(p1)
	-- upvalues: UserProfilesModule (copy), ReactModule (copy), PeopleListContextualMenuModule (copy), CryoModule (copy)
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { p1.user.id },
		query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	
	return ReactModule.createElement(PeopleListContextualMenuModule, CryoModule.Dictionary.join(p1, {
		combinedName = if UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, p1.user.id) else nil
	}))
end