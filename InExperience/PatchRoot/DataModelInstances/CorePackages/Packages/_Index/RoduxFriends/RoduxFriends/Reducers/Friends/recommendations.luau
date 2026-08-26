local roduxModule = require(script:FindFirstAncestor("RoduxFriends").Parent.Rodux)
local byUserIdModule = require(script.byUserId)
local bySourceModule = require(script.bySource)
local hasIncomingFriendRequestModule = require(script.hasIncomingFriendRequest)

return function(p1)
	-- upvalues: roduxModule (ref), byUserIdModule (ref), bySourceModule (ref), hasIncomingFriendRequestModule (ref)
	return roduxModule.combineReducers({
		byUserId = byUserIdModule(p1),
		bySource = bySourceModule(p1),
		hasIncomingFriendRequest = hasIncomingFriendRequestModule(p1)
	})
end