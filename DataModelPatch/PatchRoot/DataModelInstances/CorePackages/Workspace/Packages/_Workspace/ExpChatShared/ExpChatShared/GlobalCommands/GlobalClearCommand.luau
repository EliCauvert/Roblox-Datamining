local _ = require(script.Parent.types)
local RBXClearCommandModule = require(script.Parent.Parent.Commands.RBXClearCommand)

return {
	name = script.Name,
	alias = RBXClearCommandModule.alias,
	clientRun = RBXClearCommandModule.clientRun
}