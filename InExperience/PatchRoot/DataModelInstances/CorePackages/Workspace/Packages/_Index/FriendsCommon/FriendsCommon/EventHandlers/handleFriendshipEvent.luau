local parent = script:FindFirstAncestor("FriendsCommon").Parent
local apolloFriendsModule = require(parent.ApolloFriends)
local fFlagFriendSortedByPresenceSignalsImplementation = require(parent.SharedFlags).FFlagFriendSortedByPresenceSignalsImplementation
local var1 = require(parent.DataHydration).Friends.FriendsStore.get()

return function(p1)
	-- upvalues: fFlagFriendSortedByPresenceSignalsImplementation (ref), var1 (ref), apolloFriendsModule (ref)
	if p1.friendshipUpdate.removedUserId then
		if fFlagFriendSortedByPresenceSignalsImplementation then
			var1.UpdateIsFriendsWith(p1.friendshipUpdate.removedUserId, false)
			
			return
		end
		apolloFriendsModule.Cache.removeFriendFromCache(p1.apolloClient, {
			targetUserId = p1.localUserId,
			userId = p1.friendshipUpdate.removedUserId
		})
		
		return
	elseif p1.friendshipUpdate.addedUserId then
		if fFlagFriendSortedByPresenceSignalsImplementation then
			var1.RefetchOnlineFriends()
			var1.UpdateIsFriendsWith(p1.friendshipUpdate.addedUserId, true)
			
			return
		end
		p1.onlineFriendsRef:refetch()
		apolloFriendsModule.Cache.addFriendToFriendsByUserIdCache(p1.apolloClient, {
			hasVerifiedBadge = nil,
			targetUserId = p1.localUserId,
			userId = p1.friendshipUpdate.addedUserId
		})
	end
end