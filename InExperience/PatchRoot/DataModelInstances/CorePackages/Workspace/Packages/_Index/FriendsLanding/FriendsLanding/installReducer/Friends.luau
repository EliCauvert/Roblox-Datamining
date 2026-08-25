local roduxFriends = require(script:FindFirstAncestor("FriendsLanding").dependencies).RoduxFriends
local convertActionsModule = require(script.Parent.convertActions)
local friendsActionAdaptorModule = require(script.Parent.friendsActionAdaptor)
local t = {
	countsByUserId = {},
	byUserId = {},
	requests = { receivedCount = 0 }
}

return function(p0)
	-- upvalues: convertActionsModule (ref), roduxFriends (ref), friendsActionAdaptorModule (ref), t (ref)
	return convertActionsModule(roduxFriends.installReducer(), friendsActionAdaptorModule(p0), t)
end