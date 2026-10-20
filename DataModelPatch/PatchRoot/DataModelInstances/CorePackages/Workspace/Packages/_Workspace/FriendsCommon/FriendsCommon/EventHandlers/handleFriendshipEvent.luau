local Parent = script:FindFirstAncestor("FriendsCommon").Parent
local ApolloFriendsModule = require(Parent.ApolloFriends)
local FFlagFriendSortedByPresenceSignalsImplementation = require(Parent.SharedFlags).FFlagFriendSortedByPresenceSignalsImplementation
local DataHydrationModule = require(Parent.DataHydration)
local GetResult = if FFlagFriendSortedByPresenceSignalsImplementation then DataHydrationModule.Friends.FriendsStore.get() else nil

return function(p1)
	-- upvalues: FFlagFriendSortedByPresenceSignalsImplementation (copy), GetResult (copy), ApolloFriendsModule (copy)
	if p1.friendshipUpdate.removedUserId then
		if FFlagFriendSortedByPresenceSignalsImplementation then
			GetResult.UpdateIsFriendsWith(p1.friendshipUpdate.removedUserId, false)
			
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
			
			return
		end
		p1.onlineFriendsRef:refetch()
		ApolloFriendsModule.Cache.addFriendToFriendsByUserIdCache(p1.apolloClient, {
			hasVerifiedBadge = nil,
			targetUserId = p1.localUserId,
			userId = p1.friendshipUpdate.addedUserId
		})
	end
end