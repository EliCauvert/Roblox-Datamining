local Parent = script:FindFirstAncestor("QueryRefetch").Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local LoginStatus = require(Parent.RobloxAppEnums).LoginStatus
local UserProfilesModule = require(Parent.UserProfiles)
local UserProfileStore = UserProfilesModule.Stores.UserProfileStore
local FFlagUserProfileStoreQueryRefetch = require(Parent.SharedFlags).FFlagUserProfileStoreQueryRefetch

local function selectAuthenticationStatus(p1)
	return { authenticationStatus = p1.AuthenticationStatus.status }
end

return function(p1)
	-- upvalues: UseSelectorFunction (copy), selectAuthenticationStatus (copy), LoginStatus (copy), ReactModule (copy), UserProfilesModule (copy), FFlagUserProfileStoreQueryRefetch (copy), UserProfileStore (copy)
	local IsAuthenticationStatusMatch = UseSelectorFunction(selectAuthenticationStatus).authenticationStatus == LoginStatus.LOGGED_IN
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = UseStateResult,
		query = UserProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds
	})
	local UseUserProfilesFetchResult1 = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = UseStateResult,
		query = UserProfilesModule.Queries.userProfilesCombinedAndPlatformByUserIds
	})
	ReactModule.useEffect(function()
		-- upvalues: IsAuthenticationStatusMatch (copy), p1 (copy), UseStateResult2 (copy)
		local UserProfileNotifications = if IsAuthenticationStatusMatch and p1 then p1:observeEvent("UserProfileNotifications", function(p2)
			-- upvalues: UseStateResult2 (upval)
			if p2.Type == "PlatformName" then
				UseStateResult2({ (tostring(p2.VieweeUserId)) })
			end
		end) else nil
		
		return function()
			-- upvalues: UserProfileNotifications (ref)
			if UserProfileNotifications and UserProfileNotifications.disconnect then
				UserProfileNotifications:disconnect()
			end
		end
	end, { IsAuthenticationStatusMatch, p1 })
	ReactModule.useEffect(function()
		-- upvalues: UseUserProfilesFetchResult (copy), UseStateResult (copy), UseUserProfilesFetchResult1 (copy), FFlagUserProfileStoreQueryRefetch (upval), UserProfileStore (upval)
		UseUserProfilesFetchResult.refetch({ userIds = UseStateResult })
		
		if UseUserProfilesFetchResult1 then
			UseUserProfilesFetchResult1.refetch({ userIds = UseStateResult })
		end
		if FFlagUserProfileStoreQueryRefetch then
			UserProfileStore.get().invalidateCachedNamesForUserIds(UseStateResult)
		end
	end, {
		UseStateResult,
		UseUserProfilesFetchResult.refetch,
		if UseUserProfilesFetchResult1 then UseUserProfilesFetchResult1.refetch else nil
	})
end