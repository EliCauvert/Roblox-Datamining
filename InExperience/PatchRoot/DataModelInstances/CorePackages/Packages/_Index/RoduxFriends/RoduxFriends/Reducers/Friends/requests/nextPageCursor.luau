local parent = script.Parent.Parent.Parent.Parent
local roduxModule = require(parent.Parent.Rodux)
local _ = require(parent.roduxFriendsTypes)

return function(p1)
	-- upvalues: roduxModule (ref)
	local friendsNetworking = p1.friendsNetworking
	
	return roduxModule.createReducer(nil, {
		[friendsNetworking.GetFriendRequests.Succeeded.name] = function(_, p2)
			return p2.responseBody.nextPageCursor
		end,
		[friendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function(_, _)
			return nil
		end
	})
end