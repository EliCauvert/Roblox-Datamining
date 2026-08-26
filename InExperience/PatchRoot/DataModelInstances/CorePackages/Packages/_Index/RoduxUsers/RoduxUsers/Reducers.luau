local roduxModule = require(script:FindFirstAncestor("RoduxUsers").Parent.Rodux)
local byUserIdModule = require(script.Users.byUserId)
local byUsernameModule = require(script.Users.byUsername)

return function(p1)
	-- upvalues: roduxModule (ref), byUserIdModule (ref), byUsernameModule (ref)
	return roduxModule.combineReducers({
		byUserId = byUserIdModule(p1),
		byUsername = byUsernameModule(p1)
	})
end