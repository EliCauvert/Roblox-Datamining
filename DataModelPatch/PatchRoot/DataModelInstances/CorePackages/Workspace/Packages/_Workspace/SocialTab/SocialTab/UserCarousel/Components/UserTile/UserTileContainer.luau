local SocialTab = script:FindFirstAncestor("SocialTab")
local Parent = SocialTab.Parent
local ReactModule = require(Parent.React)
local UserProfilesModule = require(Parent.UserProfiles)
local CryoModule = require(Parent.Cryo)
local UserTileModule = require(script.Parent.UserTile)
local GetSocialTabUserProfileApiEnabledModule = require(SocialTab.Flags.getSocialTabUserProfileApiEnabled)

return function(p1)
	-- upvalues: GetSocialTabUserProfileApiEnabledModule (copy), UserProfilesModule (copy), ReactModule (copy), UserTileModule (copy), CryoModule (copy)
	local ShouldShimmerName: boolean? = nil
	local CombinedNameFromId = nil
	
	if GetSocialTabUserProfileApiEnabledModule() then
		local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
			userIds = { p1.user.id },
			query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
		})
		ShouldShimmerName = if UseUserProfilesFetchResult.loading or UseUserProfilesFetchResult.error then true else false
		CombinedNameFromId = if UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, p1.user.id) else nil
	end
	return ReactModule.createElement(UserTileModule, CryoModule.Dictionary.join(p1, {
		combinedName = CombinedNameFromId,
		shouldShimmerName = ShouldShimmerName
	}))
end