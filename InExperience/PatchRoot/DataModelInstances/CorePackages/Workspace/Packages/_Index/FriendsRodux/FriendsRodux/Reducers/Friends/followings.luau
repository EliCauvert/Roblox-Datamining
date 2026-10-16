local RoduxModule = require(script:FindFirstAncestor("FriendsRodux").Parent.Rodux)
local FollowingStatusesModule = require(script.followingStatuses)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: RoduxModule (copy), FollowingStatusesModule (copy)
	return RoduxModule.combineReducers({ followingStatuses = FollowingStatusesModule(p1) })
end