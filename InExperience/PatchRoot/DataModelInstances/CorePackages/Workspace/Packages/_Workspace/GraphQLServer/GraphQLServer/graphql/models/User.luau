local UserConnectorModule = require(script.Parent.Parent.connectors.UserConnector)
local FindUserByIdFunction = UserConnectorModule.findUserById
local FindMeFunction = UserConnectorModule.findMe

return {
	default = {
		findUserById = function(_, p1)
			-- upvalues: FindUserByIdFunction (copy)
			return FindUserByIdFunction(p1)
		end,
		findMe = function(_)
			-- upvalues: FindMeFunction (copy)
			return FindMeFunction()
		end
	}
}