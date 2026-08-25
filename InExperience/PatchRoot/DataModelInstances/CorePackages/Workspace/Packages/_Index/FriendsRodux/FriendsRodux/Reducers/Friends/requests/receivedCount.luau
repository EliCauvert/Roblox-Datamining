local friendsRodux = script:FindFirstAncestor("FriendsRodux")
local roduxModule = require(friendsRodux.Parent.Rodux)
local _ = require(friendsRodux.roduxFriendsTypes)
local requestReceivedCountUpdatedModule = require(friendsRodux.Actions.RequestReceivedCountUpdated)

return function(p0)
	-- upvalues: roduxModule (ref), requestReceivedCountUpdatedModule (ref)
	return roduxModule.createReducer(0, {
		[requestReceivedCountUpdatedModule.name] = function(_, p1)
			assert(type(p1.payload.count) == "number", "Expected count to be a number")
			
			return p1.payload.count
		end,
		[p0.friendsNetworking.GetFriendRequestsCount.Succeeded.name] = function(_, p2)
			return p2.responseBody.count
		end
	})
end