return {
	Hooks = {
		useInitializeCrossPlaySettings = require(script.Hooks.useInitializeCrossPlaySettings),
		useCrossPlaySettings = require(script.Hooks.useCrossPlaySettings)
	},
	Reducers = {
		CrossPlaySettings = require(script.Reducers.CrossPlaySettings)
	},
	["jest.config"] = script["jest.config"]
}