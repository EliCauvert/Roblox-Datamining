local userSearch = script:FindFirstAncestor("UserSearch")
local parent = userSearch.Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local signalsReactModule = require(parent.SignalsReact)
local RODUX_KEY = require(userSearch.Common.Constants).RODUX_KEY
local getDeepValue = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local fFlagMigrateFriendshipStatusesUserSearchModule = require(userSearch.Flags.FFlagMigrateFriendshipStatusesUserSearch)
local fFlagSduiUserSearchTile = require(parent.SharedFlags).FFlagSduiUserSearchTile
local useGetFriendshipStatus = require(parent.FriendsHydrationReact).useGetFriendshipStatus
local followingStore = require(parent.DataHydration.Following).FollowingStore
local localUserIdStore = require(parent.LocalUserIdStore).LocalUserIdStore
local t = { skipFetch = true }

return function(p1)
	-- upvalues: fFlagSduiUserSearchTile (ref), useGetFriendshipStatus (ref), reactModule (ref), followingStore (ref), signalsReactModule (ref), localUserIdStore (ref), fFlagMigrateFriendshipStatusesUserSearchModule (ref), t (ref), useSelector (ref), getDeepValue (ref), RODUX_KEY (ref)
	if fFlagSduiUserSearchTile then
		return {
			status = useGetFriendshipStatus(p1),
			following = signalsReactModule.useSignalState(reactModule.useMemo(function()
				-- upvalues: followingStore (copy), p1 (ref)
				return followingStore.get().GetIsFollowing(p1)
			end, { p1 }).data) == true,
			isMyself = signalsReactModule.useSignalState(localUserIdStore.getCurrentUserId) == p1
		}
	end
	local var1 = if fFlagMigrateFriendshipStatusesUserSearchModule then useGetFriendshipStatus(p1, t) else nil
	
	return useSelector(function(p2)
		-- upvalues: getDeepValue (copy), RODUX_KEY (copy), p1 (ref), fFlagMigrateFriendshipStatusesUserSearchModule (copy), var1 (write)
		return {
			status = if fFlagMigrateFriendshipStatusesUserSearchModule then var1 else getDeepValue(p2, string.format("%s.Friends.friendshipStatus.%s", RODUX_KEY, p1)),
			following = (getDeepValue(p2, string.format("%s.Friends.followings.followingStatuses.%s", RODUX_KEY, p1)) or {}).isFollowing or false,
			isMyself = p2.LocalUserId == p1
		}
	end)
end