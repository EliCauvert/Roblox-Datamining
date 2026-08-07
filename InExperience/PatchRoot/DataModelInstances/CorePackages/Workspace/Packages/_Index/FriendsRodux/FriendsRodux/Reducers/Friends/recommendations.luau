local roduxModule = require(script:FindFirstAncestor("FriendsRodux").Parent.Rodux)
local byUserIdModule = require(script.byUserId)
local bySourceModule = require(script.bySource)
local hasIncomingFriendRequestModule = require(script.hasIncomingFriendRequest)

return function(p0) --[[ line: 8 ]]
	-- upvalues: roduxModule (ref), byUserIdModule (ref), bySourceModule (ref), hasIncomingFriendRequestModule (ref)
	return roduxModule.combineReducers({
		byUserId = byUserIdModule(p0),
		bySource = bySourceModule(p0),
		hasIncomingFriendRequest = hasIncomingFriendRequestModule(p0)
	})
end