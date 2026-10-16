local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local SignalsReactModule = require(Parent.SignalsReact)
local RODUXKEY = require(UserSearch.Common.Constants).RODUX_KEY
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local FFlagMigrateFriendshipStatusesUserSearchModule = require(UserSearch.Flags.FFlagMigrateFriendshipStatusesUserSearch)
local FFlagSduiUserSearchTile = require(Parent.SharedFlags).FFlagSduiUserSearchTile
local UseGetFriendshipStatusFunction = require(Parent.FriendsHydrationReact).useGetFriendshipStatus
local FollowingStore = require(Parent.DataHydration.Following).FollowingStore
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local config = { skipFetch = true }

return function(LocalUserId) --[[ Line: 25 ]]
	-- upvalues: FFlagSduiUserSearchTile (copy), UseGetFriendshipStatusFunction (copy), ReactModule (copy), FollowingStore (copy), SignalsReactModule (copy), LocalUserIdStore (copy), FFlagMigrateFriendshipStatusesUserSearchModule (copy), config (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), RODUXKEY (copy)
	if FFlagSduiUserSearchTile then
		return {
			status = UseGetFriendshipStatusFunction(LocalUserId),
			following = SignalsReactModule.useSignalState(ReactModule.useMemo(function() --[[ Line: 30 ]]
				-- upvalues: FollowingStore (upval), LocalUserId (copy)
				return FollowingStore.get().GetIsFollowing(LocalUserId)
			end, { LocalUserId }).data) == true,
			isMyself = SignalsReactModule.useSignalState(LocalUserIdStore.getCurrentUserId) == LocalUserId
		}
	else
		local UseGetFriendshipStatusResult = if FFlagMigrateFriendshipStatusesUserSearchModule then UseGetFriendshipStatusFunction(LocalUserId, config) else nil
		
		return UseSelectorFunction(function(p1) --[[ Line: 48 ]]
			-- upvalues: GetDeepValueFunction (upval), RODUXKEY (upval), LocalUserId (copy), FFlagMigrateFriendshipStatusesUserSearchModule (upval), UseGetFriendshipStatusResult (ref)
			return {
				status = if FFlagMigrateFriendshipStatusesUserSearchModule then UseGetFriendshipStatusResult else GetDeepValueFunction(p1, string.format("%s.Friends.friendshipStatus.%s", RODUXKEY, LocalUserId)),
				following = (GetDeepValueFunction(p1, string.format("%s.Friends.followings.followingStatuses.%s", RODUXKEY, LocalUserId)) or {}).isFollowing or false,
				isMyself = p1.LocalUserId == LocalUserId
			}
		end)
	end
end