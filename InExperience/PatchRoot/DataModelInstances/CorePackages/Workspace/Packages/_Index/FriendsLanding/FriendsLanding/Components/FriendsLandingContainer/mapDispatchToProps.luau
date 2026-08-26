local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local friendsNetworking = require(friendsLanding.dependencies).FriendsNetworking
local fFlagMigrateFriendshipStatusesRemainingActions = require(friendsLanding.Parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions

return function(p1)
	-- upvalues: friendsNetworking (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref)
	return {
		fetchFriends = function(p2)
			-- upvalues: p1 (ref), friendsNetworking (copy)
			return p1(friendsNetworking.GetFriendsFromUserId.API(p2))
		end,
		getFriendRequestsCount = function()
			-- upvalues: p1 (ref), friendsNetworking (copy)
			return p1(friendsNetworking.GetFriendRequestsCount.API())
		end,
		getInactiveFriends = function(p2)
			-- upvalues: p1 (ref), friendsNetworking (copy)
			return p1(friendsNetworking.GetInactiveFriends.API(p2))
		end,
		unfriendTargetUser = if fFlagMigrateFriendshipStatusesRemainingActions then nil else function(p2)
			-- upvalues: p1 (ref), friendsNetworking (copy)
			return p1(friendsNetworking.UnfriendTargetUserId.API(p2))
		end
	}
end