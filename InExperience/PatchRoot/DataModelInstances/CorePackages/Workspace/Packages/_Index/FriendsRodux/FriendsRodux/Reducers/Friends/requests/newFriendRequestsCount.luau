local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local _ = require(parent.roduxFriendsTypes)
local clearNewFriendRequestsCountUpdatedModule = require(parent.Actions.ClearNewFriendRequestsCountUpdated)
local fFlagAddFriendsPageHighlightUnseenRequests = require(parent_1.SharedFlags).FFlagAddFriendsPageHighlightUnseenRequests

return function(p0) --[[ line: 14 ]]
	-- upvalues: roduxModule (ref), clearNewFriendRequestsCountUpdatedModule (ref), fFlagAddFriendsPageHighlightUnseenRequests (ref)
	local friendsNetworking = p0.friendsNetworking
	
	return roduxModule.createReducer(0, {
		[clearNewFriendRequestsCountUpdatedModule.name] = function(p1, _) --[[ line: 17 ]]
			-- upvalues: fFlagAddFriendsPageHighlightUnseenRequests (copy)
			return if fFlagAddFriendsPageHighlightUnseenRequests then 0 else p1
		end,
		[friendsNetworking.GetNewFriendRequestsCount.Succeeded.name] = function(_, p2) --[[ line: 20 ]]
			return p2.responseBody.count
		end,
		[friendsNetworking.ClearNewFriendRequests.Succeeded.name] = function(_, _) --[[ line: 26 ]]
			return 0
		end
	})
end