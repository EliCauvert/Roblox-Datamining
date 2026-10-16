local RoduxFriends = require(script:FindFirstAncestor("FriendsLanding").dependencies).RoduxFriends
local ConvertActionsModule = require(script.Parent.convertActions)
local FriendsActionAdaptorModule = require(script.Parent.friendsActionAdaptor)
local config = {
	countsByUserId = {},
	byUserId = {},
	requests = { receivedCount = 0 }
}

return function(p1) --[[ Line: 16 ]]
	-- upvalues: ConvertActionsModule (copy), RoduxFriends (copy), FriendsActionAdaptorModule (copy), config (copy)
	return ConvertActionsModule(RoduxFriends.installReducer(), FriendsActionAdaptorModule(p1), config)
end