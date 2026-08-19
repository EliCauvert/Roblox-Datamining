local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local friendsNetworking = require(friendsLanding.dependencies).FriendsNetworking
local fFlagMigrateFriendshipStatusesRemainingActions = require(friendsLanding.Parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions

return function(p0) --[[ line: 11 ]]
	-- upvalues: friendsNetworking (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref)
	return {
		fetchFriends = function(p1) --[[ line: 13 ]]
			-- upvalues: p0 (ref), friendsNetworking (copy)
			return p0(friendsNetworking.GetFriendsFromUserId.API(p1))
		end,
		getFriendRequestsCount = function() --[[ line: 16 ]]
			-- upvalues: p0 (ref), friendsNetworking (copy)
			return p0(friendsNetworking.GetFriendRequestsCount.API())
		end,
		getInactiveFriends = function(p2) --[[ line: 19 ]]
			-- upvalues: p0 (ref), friendsNetworking (copy)
			return p0(friendsNetworking.GetInactiveFriends.API(p2))
		end,
		unfriendTargetUser = if fFlagMigrateFriendshipStatusesRemainingActions then nil else function(p3) --[[ line: 24 ]]
			-- upvalues: p0 (ref), friendsNetworking (copy)
			return p0(friendsNetworking.UnfriendTargetUserId.API(p3))
		end
	}
end