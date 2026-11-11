local RemoveTemporaryGlobalsFunction: () -> () = require(script.graphql).removeTemporaryGlobals
local GlobalsModule = {
	DEV = require(script.DEV).default,
	removeTemporaryGlobals = RemoveTemporaryGlobalsFunction,
	NULL = require(script.null).NULL
}
RemoveTemporaryGlobalsFunction()

return GlobalsModule