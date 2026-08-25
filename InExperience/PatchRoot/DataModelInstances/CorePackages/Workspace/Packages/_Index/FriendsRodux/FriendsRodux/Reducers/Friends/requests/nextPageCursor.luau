local parent = script.Parent.Parent.Parent.Parent
local roduxModule = require(parent.Parent.Rodux)
local _ = require(parent.roduxFriendsTypes)

return function(p0)
	-- upvalues: roduxModule (ref)
	local friendsNetworking = p0.friendsNetworking
	
	return roduxModule.createReducer(nil, {
		[friendsNetworking.GetFriendRequests.Succeeded.name] = function(_, p1)
			return p1.responseBody.nextPageCursor
		end,
		[friendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function(_, _)
			return nil
		end
	})
end