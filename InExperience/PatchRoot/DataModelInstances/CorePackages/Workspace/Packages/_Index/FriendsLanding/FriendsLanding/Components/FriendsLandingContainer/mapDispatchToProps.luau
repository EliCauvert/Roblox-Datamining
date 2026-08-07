local friendsNetworking = require(script:FindFirstAncestor("FriendsLanding").dependencies).FriendsNetworking

return function(p0) --[[ line: 6 ]]
	-- upvalues: friendsNetworking (ref)
	return {
		fetchFriends = function(p1) --[[ line: 8 ]]
			-- upvalues: p0 (ref), friendsNetworking (copy)
			return p0(friendsNetworking.GetFriendsFromUserId.API(p1))
		end,
		getFriendRequestsCount = function() --[[ line: 11 ]]
			-- upvalues: p0 (ref), friendsNetworking (copy)
			return p0(friendsNetworking.GetFriendRequestsCount.API())
		end,
		getInactiveFriends = function(p2) --[[ line: 14 ]]
			-- upvalues: p0 (ref), friendsNetworking (copy)
			return p0(friendsNetworking.GetInactiveFriends.API(p2))
		end,
		unfriendTargetUser = function(p3) --[[ line: 17 ]]
			-- upvalues: p0 (ref), friendsNetworking (copy)
			return p0(friendsNetworking.UnfriendTargetUserId.API(p3))
		end
	}
end