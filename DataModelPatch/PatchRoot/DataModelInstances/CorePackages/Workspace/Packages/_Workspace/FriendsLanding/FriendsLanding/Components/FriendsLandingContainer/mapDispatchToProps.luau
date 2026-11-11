local FriendsNetworking = require(script:FindFirstAncestor("FriendsLanding").dependencies).FriendsNetworking

return function(Callback)
	-- upvalues: FriendsNetworking (copy)
	return {
		fetchFriends = function(p1)
			-- upvalues: Callback (copy), FriendsNetworking (upval)
			return Callback(FriendsNetworking.GetFriendsFromUserId.API(p1))
		end,
		getFriendRequestsCount = function()
			-- upvalues: Callback (copy), FriendsNetworking (upval)
			return Callback(FriendsNetworking.GetFriendRequestsCount.API())
		end,
		getInactiveFriends = function(p1)
			-- upvalues: Callback (copy), FriendsNetworking (upval)
			return Callback(FriendsNetworking.GetInactiveFriends.API(p1))
		end,
		unfriendTargetUser = function(p1)
			-- upvalues: Callback (copy), FriendsNetworking (upval)
			return Callback(FriendsNetworking.UnfriendTargetUserId.API(p1))
		end
	}
end