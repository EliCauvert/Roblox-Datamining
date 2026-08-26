local roduxModule = require(script:FindFirstAncestor("FriendsRodux").Parent.Rodux)
local followingStatusesModule = require(script.followingStatuses)

return function(p1)
	-- upvalues: roduxModule (ref), followingStatusesModule (ref)
	return roduxModule.combineReducers({ followingStatuses = followingStatusesModule(p1) })
end