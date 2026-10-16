local RoduxModule = require(script:FindFirstAncestor("RoduxFriends").Parent.Rodux)
local ByUserIdModule = require(script.byUserId)
local BySourceModule = require(script.bySource)
local HasIncomingFriendRequestModule = require(script.hasIncomingFriendRequest)

return function(p1) --[[ Line: 8 ]]
	-- upvalues: RoduxModule (copy), ByUserIdModule (copy), BySourceModule (copy), HasIncomingFriendRequestModule (copy)
	return RoduxModule.combineReducers({
		byUserId = ByUserIdModule(p1),
		bySource = BySourceModule(p1),
		hasIncomingFriendRequest = HasIncomingFriendRequestModule(p1)
	})
end