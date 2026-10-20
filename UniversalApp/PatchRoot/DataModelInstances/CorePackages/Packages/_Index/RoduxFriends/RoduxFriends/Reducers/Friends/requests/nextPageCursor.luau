local Parent = script.Parent.Parent.Parent.Parent
local RoduxModule = require(Parent.Parent.Rodux)
local _ = require(Parent.roduxFriendsTypes)

return function(p1)
	-- upvalues: RoduxModule (copy)
	local FriendsNetworking = p1.friendsNetworking
	
	return RoduxModule.createReducer(nil, {
		[FriendsNetworking.GetFriendRequests.Succeeded.name] = function(_, p2)
			return p2.responseBody.nextPageCursor
		end,
		[FriendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function(_, _)
			return nil
		end
	})
end