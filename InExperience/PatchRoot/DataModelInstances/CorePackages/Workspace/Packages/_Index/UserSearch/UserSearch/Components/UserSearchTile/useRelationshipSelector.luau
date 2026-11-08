local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local SignalsReactModule = require(Parent.SignalsReact)
local RODUXKEY = require(UserSearch.Common.Constants).RODUX_KEY
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local FFlagMigrateFriendshipStatusesUserSearchModule = require(UserSearch.Flags.FFlagMigrateFriendshipStatusesUserSearch)
local FFlagSduiUserSearchTile = require(Parent.SharedFlags).FFlagSduiUserSearchTile
local FFlagUserSearchRefreshPendingFriendshipStatusModule = require(UserSearch.Flags.FFlagUserSearchRefreshPendingFriendshipStatus)
local UseGetFriendshipStatusFunction = require(Parent.FriendsHydrationReact).useGetFriendshipStatus
local FollowingStore = require(Parent.DataHydration.Following).FollowingStore
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local GetResult = require(Parent.DataHydration).Friends.FriendsStore.get()
local config = { skipFetch = true }

local function _(p1)
	-- upvalues: ReactModule (copy), GetResult (copy), config (copy)
	ReactModule.useEffect(function()
		-- upvalues: GetResult (upval), p1 (copy), config (upval)
		local FriendshipStatus = GetResult.GetFriendshipStatus(p1, config)
		
		if FriendshipStatus and FriendshipStatus.data(false) == Enum.FriendStatus.FriendRequestSent then
			GetResult.RefetchFriendshipStatus(p1)
		end
	end, { p1 })
end

return function(LocalUserId)
	-- upvalues: FFlagSduiUserSearchTile (copy), UseGetFriendshipStatusFunction (copy), FFlagUserSearchRefreshPendingFriendshipStatusModule (copy), ReactModule (copy), GetResult (copy), config (copy), FollowingStore (copy), SignalsReactModule (copy), LocalUserIdStore (copy), FFlagMigrateFriendshipStatusesUserSearchModule (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), RODUXKEY (copy)
	if FFlagSduiUserSearchTile then
		local UseGetFriendshipStatusResult = UseGetFriendshipStatusFunction(LocalUserId)
		
		if FFlagUserSearchRefreshPendingFriendshipStatusModule then
			ReactModule.useEffect(function()
				-- upvalues: GetResult (upval), LocalUserId (copy), config (upval)
				local FriendshipStatus = GetResult.GetFriendshipStatus(LocalUserId, config)
				
				if FriendshipStatus and FriendshipStatus.data(false) == Enum.FriendStatus.FriendRequestSent then
					GetResult.RefetchFriendshipStatus(LocalUserId)
				end
			end, { LocalUserId })
		end
		return {
			status = UseGetFriendshipStatusResult,
			following = SignalsReactModule.useSignalState(ReactModule.useMemo(function()
				-- upvalues: FollowingStore (upval), LocalUserId (copy)
				return FollowingStore.get().GetIsFollowing(LocalUserId)
			end, { LocalUserId }).data) == true,
			isMyself = SignalsReactModule.useSignalState(LocalUserIdStore.getCurrentUserId) == LocalUserId
		}
	else
		local v1 = nil
		
		if FFlagMigrateFriendshipStatusesUserSearchModule then
			v1 = UseGetFriendshipStatusFunction(LocalUserId, config)
			
			if FFlagUserSearchRefreshPendingFriendshipStatusModule then
				ReactModule.useEffect(function()
					-- upvalues: GetResult (upval), LocalUserId (copy), config (upval)
					local FriendshipStatus = GetResult.GetFriendshipStatus(LocalUserId, config)
					
					if FriendshipStatus and FriendshipStatus.data(false) == Enum.FriendStatus.FriendRequestSent then
						GetResult.RefetchFriendshipStatus(LocalUserId)
					end
				end, { LocalUserId })
			end
		end
		return UseSelectorFunction(function(p1)
			-- upvalues: GetDeepValueFunction (upval), RODUXKEY (upval), LocalUserId (copy), FFlagMigrateFriendshipStatusesUserSearchModule (upval), v1 (ref)
			return {
				status = if FFlagMigrateFriendshipStatusesUserSearchModule then v1 else GetDeepValueFunction(p1, string.format("%s.Friends.friendshipStatus.%s", RODUXKEY, LocalUserId)),
				following = (GetDeepValueFunction(p1, string.format("%s.Friends.followings.followingStatuses.%s", RODUXKEY, LocalUserId)) or {}).isFollowing or false,
				isMyself = p1.LocalUserId == LocalUserId
			}
		end)
	end
end