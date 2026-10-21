local Parent = script.Parent.Parent.Parent.Parent
local RoduxModule = require(Parent.Parent.Rodux)
local _ = require(Parent.roduxFriendsTypes)
local ClearNewFriendRequestsCountUpdatedModule = require(Parent.Actions.ClearNewFriendRequestsCountUpdated)

return function(p1)
	-- upvalues: RoduxModule (copy), ClearNewFriendRequestsCountUpdatedModule (copy)
	local FriendsNetworking = p1.friendsNetworking
	
	return RoduxModule.createReducer(0, {
		[ClearNewFriendRequestsCountUpdatedModule.name] = function(_, _): number
			return 0
		end,
		[FriendsNetworking.GetNewFriendRequestsCount.Succeeded.name] = function(_, p2)
			return p2.responseBody.count
		end,
		[FriendsNetworking.ClearNewFriendRequests.Succeeded.name] = function(_, _): number
			return 0
		end
	})
end