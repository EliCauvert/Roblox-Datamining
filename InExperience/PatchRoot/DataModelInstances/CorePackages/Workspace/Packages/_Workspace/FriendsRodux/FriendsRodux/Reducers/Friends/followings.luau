local roduxModule = require(script:FindFirstAncestor("FriendsRodux").Parent.Rodux)
local followingStatusesModule = require(script.followingStatuses)

return function(p0) --[[ line: 6 ]]
	-- upvalues: roduxModule (ref), followingStatusesModule (ref)
	return roduxModule.combineReducers({ followingStatuses = followingStatusesModule(p0) })
end