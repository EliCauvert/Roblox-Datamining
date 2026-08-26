local t = {}
local userConnectorModule = require(script.Parent.Parent.connectors.UserConnector)
local findUserById = userConnectorModule.findUserById
local findMe = userConnectorModule.findMe
t.default = {
	findUserById = function(_, p1)
		-- upvalues: findUserById (ref)
		return findUserById(p1)
	end,
	findMe = function(_)
		-- upvalues: findMe (ref)
		return findMe()
	end
}

return t