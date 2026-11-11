local ExecuteModule = require(script.execute)

return {
	responsePathAsArray = require(script.Parent.jsutils.Path).pathToArray,
	execute = ExecuteModule.execute,
	executeSync = ExecuteModule.executeSync,
	defaultFieldResolver = ExecuteModule.defaultFieldResolver,
	defaultTypeResolver = ExecuteModule.defaultTypeResolver,
	getDirectiveValues = require(script.values).getDirectiveValues
}