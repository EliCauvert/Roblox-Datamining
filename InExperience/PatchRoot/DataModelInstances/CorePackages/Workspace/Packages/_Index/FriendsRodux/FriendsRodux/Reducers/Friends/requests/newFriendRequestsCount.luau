local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoduxModule = require(Parent1.Rodux)
local _ = require(Parent.roduxFriendsTypes)
local ClearNewFriendRequestsCountUpdatedModule = require(Parent.Actions.ClearNewFriendRequestsCountUpdated)
local FFlagAddFriendsPageHighlightUnseenRequests = require(Parent1.SharedFlags).FFlagAddFriendsPageHighlightUnseenRequests

return function(p1) --[[ Line: 14 ]]
	-- upvalues: RoduxModule (copy), ClearNewFriendRequestsCountUpdatedModule (copy), FFlagAddFriendsPageHighlightUnseenRequests (copy)
	local FriendsNetworking = p1.friendsNetworking
	
	return RoduxModule.createReducer(0, {
		[ClearNewFriendRequestsCountUpdatedModule.name] = function(p2, _) --[[ Line: 17 ]]
			-- upvalues: FFlagAddFriendsPageHighlightUnseenRequests (upval)
			return if FFlagAddFriendsPageHighlightUnseenRequests then 0 else p2
		end,
		[FriendsNetworking.GetNewFriendRequestsCount.Succeeded.name] = function(_, p2) --[[ Line: 20 ]]
			return p2.responseBody.count
		end,
		[FriendsNetworking.ClearNewFriendRequests.Succeeded.name] = function(_, _): number --[[ Line: 26 ]]
			return 0
		end
	})
end