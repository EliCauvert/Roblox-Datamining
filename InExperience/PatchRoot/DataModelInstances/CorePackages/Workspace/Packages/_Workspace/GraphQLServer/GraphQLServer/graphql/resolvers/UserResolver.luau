local t = {}
local userConnectorModule = require(script.Parent.Parent.connectors.UserConnector)
local findUserById = userConnectorModule.findUserById
local findMe = userConnectorModule.findMe
t.default = {
	User = {
		__resolveType = function()
			return "Player"
		end
	},
	Query = {
		me = function(_, _, p1)
			-- upvalues: findMe (ref)
			return findMe(p1.fetchImpl)
		end,
		user = function(_, p1, p2)
			-- upvalues: findUserById (ref)
			return findUserById(p1.id, p2.fetchImpl)
		end
	}
}

return t