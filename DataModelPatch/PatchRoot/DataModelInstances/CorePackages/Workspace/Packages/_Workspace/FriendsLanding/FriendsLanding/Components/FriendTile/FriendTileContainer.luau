local Parent = script:FindFirstAncestor("FriendsLanding").Parent
local ReactModule = require(Parent.React)
local UserProfilesModule = require(Parent.UserProfiles)
local DashModule = require(Parent.Dash)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local SignalsModule = require(Parent.Signals)
local FriendTileModule = require(script.Parent.FriendTile)
local FFlagFriendsPageUserListEnabled = require(Parent.SharedFlags).FFlagFriendsPageUserListEnabled
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local UseIsRobloxSubscriberFunction = UserProfilesModule.Hooks.useIsRobloxSubscriber
local GetResult = require(Parent.DataHydration).TrustedConnections.TrustedConnectionsStore.get()

return function(p1)
	-- upvalues: FFlagFriendsPageUserListEnabled (copy), UserProfilesModule (copy), FFlagEnableBlackbirdCheck (copy), UseIsRobloxSubscriberFunction (copy), ReactModule (copy), SignalsModule (copy), GetResult (copy), UseSignalStateFunction (copy), FriendTileModule (copy), DashModule (copy)
	local UseUserProfilesFetchResult = if FFlagFriendsPageUserListEnabled then nil else UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { p1.user.id },
		query = UserProfilesModule.Queries.userProfilesFriendsLandingQueryByUserIds
	})
	local UseIsRobloxSubscriberResult = if FFlagEnableBlackbirdCheck then UseIsRobloxSubscriberFunction(if p1.user and p1.user.id then p1.user.id else nil) else nil
	
	return ReactModule.createElement(FriendTileModule, DashModule.join(p1, {
		userProfile = if FFlagFriendsPageUserListEnabled then nil elseif UseUserProfilesFetchResult.data then UseUserProfilesFetchResult.data.userProfiles[1] else nil,
		trustedConnection = UseSignalStateFunction((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), p1 (copy), GetResult (upval)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: p1 (upval), GetResult (upval)
				return if p1.user and p1.user.id and p1.user.id ~= "" then GetResult.getIsTrustedConnection(p1.user.id).data(p2) else nil
			end)
		end, { if p1.user then p1.user.id else nil }))),
		isRobloxSubscriber = if FFlagEnableBlackbirdCheck then UseIsRobloxSubscriberResult else nil
	}))
end