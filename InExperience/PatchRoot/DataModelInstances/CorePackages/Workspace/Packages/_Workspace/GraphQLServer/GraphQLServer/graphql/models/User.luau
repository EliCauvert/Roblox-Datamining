local t = {}
local userConnectorModule = require(script.Parent.Parent.connectors.UserConnector)
local findUserById = userConnectorModule.findUserById
local findMe = userConnectorModule.findMe
t.default = {
	findUserById = function(_, p0)
		-- upvalues: findUserById (ref)
		return findUserById(p0)
	end,
	findMe = function(_)
		-- upvalues: findMe (ref)
		return findMe()
	end
}

return t