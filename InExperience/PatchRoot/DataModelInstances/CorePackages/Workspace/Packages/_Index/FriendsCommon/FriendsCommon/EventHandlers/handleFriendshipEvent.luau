local parent = script:FindFirstAncestor("FriendsCommon").Parent
local apolloFriendsModule = require(parent.ApolloFriends)
local fFlagFriendSortedByPresenceSignalsImplementation = require(parent.SharedFlags).FFlagFriendSortedByPresenceSignalsImplementation
local fFlagFriendsStoreRteRequestStatusUpdates = require(parent.SharedFlags).FFlagFriendsStoreRteRequestStatusUpdates
local var1 = require(parent.DataHydration).Friends.FriendsStore.get()

return function(p1)
	-- upvalues: fFlagFriendSortedByPresenceSignalsImplementation (ref), var1 (ref), fFlagFriendsStoreRteRequestStatusUpdates (ref), apolloFriendsModule (ref)
	if p1.friendshipUpdate.removedUserId then
		if fFlagFriendSortedByPresenceSignalsImplementation then
			var1.UpdateIsFriendsWith(p1.friendshipUpdate.removedUserId, false)
			
			if fFlagFriendsStoreRteRequestStatusUpdates then
				var1.UpdateFriendshipStatus(p1.friendshipUpdate.removedUserId, Enum.FriendStatus.NotFriend)
				
				return
			end
		else
			apolloFriendsModule.Cache.removeFriendFromCache(p1.apolloClient, {
				targetUserId = p1.localUserId,
				userId = p1.friendshipUpdate.removedUserId
			})
			
			return
		end
	elseif p1.friendshipUpdate.addedUserId then
		if fFlagFriendSortedByPresenceSignalsImplementation then
			var1.RefetchOnlineFriends()
			var1.UpdateIsFriendsWith(p1.friendshipUpdate.addedUserId, true)
			
			if fFlagFriendsStoreRteRequestStatusUpdates then
				var1.UpdateFriendshipStatus(p1.friendshipUpdate.addedUserId, Enum.FriendStatus.Friend)
				
				return
			end
		else
			p1.onlineFriendsRef:refetch()
			apolloFriendsModule.Cache.addFriendToFriendsByUserIdCache(p1.apolloClient, {
				hasVerifiedBadge = nil,
				targetUserId = p1.localUserId,
				userId = p1.friendshipUpdate.addedUserId
			})
		end
	end
end