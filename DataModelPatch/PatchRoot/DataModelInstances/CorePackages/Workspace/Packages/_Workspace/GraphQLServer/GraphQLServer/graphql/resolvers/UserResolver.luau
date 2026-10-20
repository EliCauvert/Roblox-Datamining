local UserConnectorModule = require(script.Parent.Parent.connectors.UserConnector)
local FindUserByIdFunction = UserConnectorModule.findUserById
local FindMeFunction = UserConnectorModule.findMe

return {
	default = {
		User = {
			__resolveType = function(): string
				return "Player"
			end
		},
		Query = {
			me = function(_, _, p1)
				-- upvalues: FindMeFunction (copy)
				return FindMeFunction(p1.fetchImpl)
			end,
			user = function(_, p1, p2)
				-- upvalues: FindUserByIdFunction (copy)
				return FindUserByIdFunction(p1.id, p2.fetchImpl)
			end
		}
	}
}