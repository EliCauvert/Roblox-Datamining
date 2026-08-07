local parent = script:FindFirstAncestor("FriendsCommon").Parent
local apolloFriendsModule = require(parent.ApolloFriends)
local fFlagFriendSortedByPresenceSignalsImplementation = require(parent.SharedFlags).FFlagFriendSortedByPresenceSignalsImplementation
local var1 = if fFlagFriendSortedByPresenceSignalsImplementation then require(parent.DataHydration).Friends.FriendsStore.get() else nil

return function(p0) --[[ line: 21 | named "handleFriendshipEvent" ]]
	-- upvalues: fFlagFriendSortedByPresenceSignalsImplementation (ref), var1 (ref), apolloFriendsModule (ref)
	if p0.friendshipUpdate.removedUserId then
		if fFlagFriendSortedByPresenceSignalsImplementation then
			var1.UpdateIsFriendsWith(p0.friendshipUpdate.removedUserId, false)
			
			return
		end
		apolloFriendsModule.Cache.removeFriendFromCache(p0.apolloClient, {
			targetUserId = p0.localUserId,
			userId = p0.friendshipUpdate.removedUserId
		})
		
		return
	elseif p0.friendshipUpdate.addedUserId then
		if fFlagFriendSortedByPresenceSignalsImplementation then
			var1.RefetchOnlineFriends()
			var1.UpdateIsFriendsWith(p0.friendshipUpdate.addedUserId, true)
			
			return
		end
		p0.onlineFriendsRef:refetch()
		apolloFriendsModule.Cache.addFriendToFriendsByUserIdCache(p0.apolloClient, {
			hasVerifiedBadge = nil,
			targetUserId = p0.localUserId,
			userId = p0.friendshipUpdate.addedUserId
		})
	end
end