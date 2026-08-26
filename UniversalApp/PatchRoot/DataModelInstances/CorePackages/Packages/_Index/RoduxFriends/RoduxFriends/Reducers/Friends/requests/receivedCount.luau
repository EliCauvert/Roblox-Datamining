local roduxFriends = script:FindFirstAncestor("RoduxFriends")
local roduxModule = require(roduxFriends.Parent.Rodux)
local requestReceivedCountUpdatedModule = require(roduxFriends.Actions.RequestReceivedCountUpdated)

return function(p1)
	-- upvalues: roduxModule (ref), requestReceivedCountUpdatedModule (ref)
	return roduxModule.createReducer(0, {
		[requestReceivedCountUpdatedModule.name] = function(_, p2)
			assert(type(p2.payload.count) == "number", "Expected count to be a number")
			
			return p2.payload.count
		end,
		[p1.friendsNetworking.GetFriendRequestsCount.Succeeded.name] = function(_, p2)
			return p2.responseBody.count
		end
	})
end