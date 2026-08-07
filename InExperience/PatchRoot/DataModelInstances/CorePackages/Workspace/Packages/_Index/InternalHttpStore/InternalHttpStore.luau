return {
	["jest.config"] = script["jest.config"],
	createHttpStore = require(script.createHttpStore),
	GetHttpStore = require(script.GetHttpStore),
	HttpResponseStatus = require(script.HttpStoreTypes).HttpResponseStatus,
	createMockHttpStore = require(script.createMockHttpStore)
}