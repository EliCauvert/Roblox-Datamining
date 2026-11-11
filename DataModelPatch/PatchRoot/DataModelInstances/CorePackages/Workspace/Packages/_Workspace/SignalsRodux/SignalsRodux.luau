local _ = require(script.types)

return {
	combineReducers = require(script.combineReducers),
	createStore = require(script.createStore),
	["jest.config"] = script["jest.config"]
}