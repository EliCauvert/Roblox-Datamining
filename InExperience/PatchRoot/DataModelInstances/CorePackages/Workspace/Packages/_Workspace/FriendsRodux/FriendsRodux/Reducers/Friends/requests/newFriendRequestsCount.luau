local parent = script.Parent.Parent.Parent.Parent
local roduxModule = require(parent.Parent.Rodux)
local _ = require(parent.roduxFriendsTypes)

return function(p0) --[[ line: 9 ]]
	-- upvalues: roduxModule (ref)
	local friendsNetworking = p0.friendsNetworking
	
	return roduxModule.createReducer(0, {
		[friendsNetworking.GetNewFriendRequestsCount.Succeeded.name] = function(_, p1) --[[ line: 12 ]]
			return p1.responseBody.count
		end,
		[friendsNetworking.ClearNewFriendRequests.Succeeded.name] = function(_, _) --[[ line: 18 ]]
			return 0
		end
	})
end