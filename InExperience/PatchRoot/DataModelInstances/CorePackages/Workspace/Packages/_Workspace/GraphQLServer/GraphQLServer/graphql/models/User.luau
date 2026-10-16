local UserConnectorModule = require(script.Parent.Parent.connectors.UserConnector)
local FindUserByIdFunction = UserConnectorModule.findUserById
local FindMeFunction = UserConnectorModule.findMe

return {
	default = {
		findUserById = function(_, p1) --[[ Line: 7 ]]
			-- upvalues: FindUserByIdFunction (copy)
			return FindUserByIdFunction(p1)
		end,
		findMe = function(_) --[[ Line: 10 ]]
			-- upvalues: FindMeFunction (copy)
			return FindMeFunction()
		end
	}
}