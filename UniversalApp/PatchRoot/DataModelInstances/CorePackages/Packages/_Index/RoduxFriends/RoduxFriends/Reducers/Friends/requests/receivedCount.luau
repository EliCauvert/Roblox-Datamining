local RoduxFriends = script:FindFirstAncestor("RoduxFriends")
local RoduxModule = require(RoduxFriends.Parent.Rodux)
local RequestReceivedCountUpdatedModule = require(RoduxFriends.Actions.RequestReceivedCountUpdated)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: RoduxModule (copy), RequestReceivedCountUpdatedModule (copy)
	return RoduxModule.createReducer(0, {
		[RequestReceivedCountUpdatedModule.name] = function(_, p2) --[[ Line: 13 ]]
			assert(type(p2.payload.count) == "number", "Expected count to be a number")
			
			return p2.payload.count
		end,
		[p1.friendsNetworking.GetFriendRequestsCount.Succeeded.name] = function(_, p2) --[[ Line: 19 ]]
			return p2.responseBody.count
		end
	})
end