local roduxFriends = script:FindFirstAncestor("RoduxFriends")
local roduxModule = require(roduxFriends.Parent.Rodux)
local requestReceivedCountUpdatedModule = require(roduxFriends.Actions.RequestReceivedCountUpdated)

return function(p0) --[[ line: 9 ]]
	-- upvalues: roduxModule (ref), requestReceivedCountUpdatedModule (ref)
	return roduxModule.createReducer(0, {
		[requestReceivedCountUpdatedModule.name] = function(_, p1) --[[ line: 13 ]]
			assert(type(p1.payload.count) == "number", "Expected count to be a number")
			
			return p1.payload.count
		end,
		[p0.friendsNetworking.GetFriendRequestsCount.Succeeded.name] = function(_, p2) --[[ line: 19 ]]
			return p2.responseBody.count
		end
	})
end