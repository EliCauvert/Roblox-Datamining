local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local friendsNetworking = require(friendsLanding.dependencies).FriendsNetworking
local fFlagMigrateFriendshipStatusesRemainingActions = require(friendsLanding.Parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions

return function(p0)
	-- upvalues: friendsNetworking (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref)
	return {
		fetchFriends = function(p1)
			-- upvalues: p0 (ref), friendsNetworking (copy)
			return p0(friendsNetworking.GetFriendsFromUserId.API(p1))
		end,
		getFriendRequestsCount = function()
			-- upvalues: p0 (ref), friendsNetworking (copy)
			return p0(friendsNetworking.GetFriendRequestsCount.API())
		end,
		getInactiveFriends = function(p2)
			-- upvalues: p0 (ref), friendsNetworking (copy)
			return p0(friendsNetworking.GetInactiveFriends.API(p2))
		end,
		unfriendTargetUser = if fFlagMigrateFriendshipStatusesRemainingActions then nil else function(p3)
			-- upvalues: p0 (ref), friendsNetworking (copy)
			return p0(friendsNetworking.UnfriendTargetUserId.API(p3))
		end
	}
end