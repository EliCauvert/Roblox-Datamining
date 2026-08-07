local t = {}
local userConnectorModule = require(script.Parent.Parent.connectors.UserConnector)
local findUserById = userConnectorModule.findUserById
local findMe = userConnectorModule.findMe
t.default = {
	findUserById = function(_, p0) --[[ line: 7 ]]
		-- upvalues: findUserById (ref)
		return findUserById(p0)
	end,
	findMe = function(_) --[[ line: 10 ]]
		-- upvalues: findMe (ref)
		return findMe()
	end
}

return t