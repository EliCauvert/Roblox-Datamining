local friendsRodux = script:FindFirstAncestor("FriendsRodux")
local roduxModule = require(friendsRodux.Parent.Rodux)
local _ = require(friendsRodux.roduxFriendsTypes)
local requestReceivedCountUpdatedModule = require(friendsRodux.Actions.RequestReceivedCountUpdated)

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