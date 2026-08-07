local t = {}
local userConnectorModule = require(script.Parent.Parent.connectors.UserConnector)
local findUserById = userConnectorModule.findUserById
local findMe = userConnectorModule.findMe
t.default = {
	User = {
		__resolveType = function() --[[ line: 8 ]]
			return "Player"
		end
	},
	Query = {
		me = function(_, _, p0) --[[ line: 14 ]]
			-- upvalues: findMe (ref)
			return findMe(p0.fetchImpl)
		end,
		user = function(_, p1, p2) --[[ line: 17 ]]
			-- upvalues: findUserById (ref)
			return findUserById(p1.id, p2.fetchImpl)
		end
	}
}

return t