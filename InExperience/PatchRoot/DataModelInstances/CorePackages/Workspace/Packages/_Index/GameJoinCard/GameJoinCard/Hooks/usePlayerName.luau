local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UserProfilesModule = require(Parent.UserProfiles)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSocialCarouselUseProfileStore = SharedFlagsModule.FFlagSocialCarouselUseProfileStore
local FFlagUserProfilePlatformProfile = SharedFlagsModule.FFlagUserProfilePlatformProfile

return function(p1)
	-- upvalues: FFlagSocialCarouselUseProfileStore (copy), ReactModule (copy), UserProfilesModule (copy), SignalsModule (copy), SignalsReactModule (copy), FFlagUserProfilePlatformProfile (copy)
	if FFlagSocialCarouselUseProfileStore then
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: UserProfilesModule (upval), p1 (copy)
			return UserProfilesModule.Stores.UserProfileStore.get().fetchNamesByUserIds({ p1 })
		end, { p1 })
		
		return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), UseMemoResult (copy)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: UseMemoResult (upval)
				local UseMemoResultResult = UseMemoResult(p2)
				local Entry = UseMemoResultResult and (UseMemoResultResult.data and UseMemoResultResult.data[1])
				
				return if Entry and Entry.names then Entry.names.getCombinedName(p2) else nil
			end)
		end, { UseMemoResult }))) or ""
	else
		local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
			userIds = { p1 },
			query = if FFlagUserProfilePlatformProfile then UserProfilesModule.Queries.userProfilesCombinedNameByUserIds else UserProfilesModule.Queries.userProfilesCombinedAndPlatformByUserIds
		})
		
		return ReactModule.useMemo(function()
			-- upvalues: UseUserProfilesFetchResult (copy), UserProfilesModule (upval), p1 (copy)
			return UseUserProfilesFetchResult.data and UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, p1) or ""
		end, { UseUserProfilesFetchResult.data, p1 })
	end
end