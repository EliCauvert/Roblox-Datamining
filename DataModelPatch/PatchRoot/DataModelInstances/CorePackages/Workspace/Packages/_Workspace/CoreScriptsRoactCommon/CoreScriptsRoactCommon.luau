return {
	CoreScriptsRootProvider = require(script.CoreScriptsRootProvider),
	Scrim = require(script.Scrim),
	Traversal = require(script.Traversal),
	["jest.config"] = script["jest.config"],
	useScreenSize = require(script.useScreenSize),
	Utilities = {
		createSignalMap = require(script.Utilities.createSignalMap),
		sortTableByValue = require(script.Utilities.sortTableByValue)
	}
}