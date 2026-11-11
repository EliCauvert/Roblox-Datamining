local Parent = script:FindFirstAncestor("AppChat").Parent
local RoduxModule = require(Parent.Rodux)
local CryoModule = require(Parent.Cryo)
local config = {
	ChatAppReducer = { Presence = { byUserId = {} } },
	Users = {}
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), RoduxModule (copy)
	local JoinResult = if p1 then CryoModule.Dictionary.join(config, p1) else config
	
	return RoduxModule.Store.new(function()
		-- upvalues: JoinResult (copy)
		return JoinResult
	end, JoinResult, { RoduxModule.thunkMiddleware })
end