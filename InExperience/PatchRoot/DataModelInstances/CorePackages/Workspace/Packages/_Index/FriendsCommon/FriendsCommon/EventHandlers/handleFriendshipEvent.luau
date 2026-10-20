local Parent = script:FindFirstAncestor("FriendsCommon").Parent
local ApolloFriendsModule = require(Parent.ApolloFriends)
local FFlagFriendSortedByPresenceSignalsImplementation = require(Parent.SharedFlags).FFlagFriendSortedByPresenceSignalsImplementation
local FFlagFriendsStoreRteRequestStatusUpdates = require(Parent.SharedFlags).FFlagFriendsStoreRteRequestStatusUpdates
local GetResult = require(Parent.DataHydration).Friends.FriendsStore.get()

return function(p1)
	-- upvalues: FFlagFriendSortedByPresenceSignalsImplementation (copy), GetResult (copy), FFlagFriendsStoreRteRequestStatusUpdates (copy), ApolloFriendsModule (copy)
	if p1.friendshipUpdate.removedUserId then
		if not FFlagFriendSortedByPresenceSignalsImplementation then
			ApolloFriendsModule.Cache.removeFriendFromCache(p1.apolloClient, {
				targetUserId = p1.localUserId,
				userId = p1.friendshipUpdate.removedUserId
			})
			
			return
		end
		GetResult.UpdateIsFriendsWith(p1.friendshipUpdate.removedUserId, false)
		
		if FFlagFriendsStoreRteRequestStatusUpdates then
			GetResult.UpdateFriendshipStatus(p1.friendshipUpdate.removedUserId, Enum.FriendStatus.NotFriend)
			
			return
		end
	elseif p1.friendshipUpdate.addedUserId then
		if FFlagFriendSortedByPresenceSignalsImplementation then
			GetResult.RefetchOnlineFriends()
			GetResult.UpdateIsFriendsWith(p1.friendshipUpdate.addedUserId, true)
			
			if FFlagFriendsStoreRteRequestStatusUpdates then
				GetResult.UpdateFriendshipStatus(p1.friendshipUpdate.addedUserId, Enum.FriendStatus.Friend)
				
				return
			end
		else
			p1.onlineFriendsRef:refetch()
			ApolloFriendsModule.Cache.addFriendToFriendsByUserIdCache(p1.apolloClient, {
				hasVerifiedBadge = nil,
				targetUserId = p1.localUserId,
				userId = p1.friendshipUpdate.addedUserId
			})
		end
	end
end