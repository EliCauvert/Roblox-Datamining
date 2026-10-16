local FriendsRodux = script:FindFirstAncestor("FriendsRodux")
local RoduxModule = require(FriendsRodux.Parent.Rodux)
local _ = require(FriendsRodux.roduxFriendsTypes)
local RequestReceivedCountUpdatedModule = require(FriendsRodux.Actions.RequestReceivedCountUpdated)

return function(p1) --[[ Line: 10 ]]
	-- upvalues: RoduxModule (copy), RequestReceivedCountUpdatedModule (copy)
	return RoduxModule.createReducer(0, {
		[RequestReceivedCountUpdatedModule.name] = function(_, p2) --[[ Line: 14 ]]
			assert(type(p2.payload.count) == "number", "Expected count to be a number")
			
			return p2.payload.count
		end,
		[p1.friendsNetworking.GetFriendRequestsCount.Succeeded.name] = function(_, p2) --[[ Line: 20 ]]
			return p2.responseBody.count
		end
	})
end