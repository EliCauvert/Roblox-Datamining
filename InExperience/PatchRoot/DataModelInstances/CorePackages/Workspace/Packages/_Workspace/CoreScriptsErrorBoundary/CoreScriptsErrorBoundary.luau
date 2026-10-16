return {
	CoreScriptsErrorBoundary = require(script.CoreScriptsErrorBoundary),
	Surfaces = require(script.Surfaces),
	ReactTreeCrashedConfig = require(script.ReactTreeCrashedConfig),
	Flags = {
		FFlagCoreScriptsReactTreeCrashCounter = require(script.Flags.FFlagCoreScriptsReactTreeCrashCounter)
	},
	["jest.config"] = script["jest.config"]
}