local RoduxModule = require(script:FindFirstAncestor("RoduxUsers").Parent.Rodux)
local ByUserIdModule = require(script.Users.byUserId)
local ByUsernameModule = require(script.Users.byUsername)

return function(p1) --[[ Line: 8 ]]
	-- upvalues: RoduxModule (copy), ByUserIdModule (copy), ByUsernameModule (copy)
	return RoduxModule.combineReducers({
		byUserId = ByUserIdModule(p1),
		byUsername = ByUsernameModule(p1)
	})
end