local Parent = script:FindFirstAncestor("FriendsCommon").Parent
local ApolloFriendsModule = require(Parent.ApolloFriends)
local FFlagFriendSortedByPresenceSignalsImplementation = require(Parent.SharedFlags).FFlagFriendSortedByPresenceSignalsImplementation
local GetResult = require(Parent.DataHydration).Friends.FriendsStore.get()

return function(p1)
	-- upvalues: FFlagFriendSortedByPresenceSignalsImplementation (copy), GetResult (copy), ApolloFriendsModule (copy)
	if p1.friendshipUpdate.removedUserId then
		if FFlagFriendSortedByPresenceSignalsImplementation then
			GetResult.UpdateIsFriendsWith(p1.friendshipUpdate.removedUserId, false)
			GetResult.UpdateFriendshipStatus(p1.friendshipUpdate.removedUserId, Enum.FriendStatus.NotFriend)
			
			return
		else
			ApolloFriendsModule.Cache.removeFriendFromCache(p1.apolloClient, {
				targetUserId = p1.localUserId,
				userId = p1.friendshipUpdate.removedUserId
			})
			
			return
		end
	elseif p1.friendshipUpdate.addedUserId then
		if FFlagFriendSortedByPresenceSignalsImplementation then
			GetResult.RefetchOnlineFriends()
			GetResult.UpdateIsFriendsWith(p1.friendshipUpdate.addedUserId, true)
			GetResult.UpdateFriendshipStatus(p1.friendshipUpdate.addedUserId, Enum.FriendStatus.Friend)
			
			return
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