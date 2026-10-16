local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local FriendsNetworking = require(FriendsLanding.dependencies).FriendsNetworking
local FFlagMigrateFriendshipStatusesRemainingActions = require(FriendsLanding.Parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions

return function(Callback) --[[ Line: 11 ]]
	-- upvalues: FriendsNetworking (copy), FFlagMigrateFriendshipStatusesRemainingActions (copy)
	return {
		fetchFriends = function(p1) --[[ Line: 13 ]]
			-- upvalues: Callback (copy), FriendsNetworking (upval)
			return Callback(FriendsNetworking.GetFriendsFromUserId.API(p1))
		end,
		getFriendRequestsCount = function() --[[ Line: 16 ]]
			-- upvalues: Callback (copy), FriendsNetworking (upval)
			return Callback(FriendsNetworking.GetFriendRequestsCount.API())
		end,
		getInactiveFriends = function(p1) --[[ Line: 19 ]]
			-- upvalues: Callback (copy), FriendsNetworking (upval)
			return Callback(FriendsNetworking.GetInactiveFriends.API(p1))
		end,
		unfriendTargetUser = if FFlagMigrateFriendshipStatusesRemainingActions then nil else function(p1) --[[ Line: 24 ]]
			-- upvalues: Callback (copy), FriendsNetworking (upval)
			return Callback(FriendsNetworking.UnfriendTargetUserId.API(p1))
		end
	}
end