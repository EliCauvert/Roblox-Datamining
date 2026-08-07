local executeModule = require(script.execute)

return {
	responsePathAsArray = require(script.Parent.jsutils.Path).pathToArray,
	execute = executeModule.execute,
	executeSync = executeModule.executeSync,
	defaultFieldResolver = executeModule.defaultFieldResolver,
	defaultTypeResolver = executeModule.defaultTypeResolver,
	getDirectiveValues = require(script.values).getDirectiveValues
}