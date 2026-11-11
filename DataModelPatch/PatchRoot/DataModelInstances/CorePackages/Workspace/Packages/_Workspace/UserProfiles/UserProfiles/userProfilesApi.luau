return {
	Hooks = require(script.Parent.Hooks),
	Formatters = require(script.Parent.Formatters),
	Selectors = require(script.Parent.Selectors),
	Queries = require(script.Parent.Common.Queries),
	Mutations = require(script.Parent.Mutations),
	Stores = require(script.Parent.Stores),
	TestUtils = require(script.Parent.TestUtils),
	UserProfilesFetchWrapper = require(script.Parent.UserProfilesFetchWrapper),
	["jest.config"] = script.Parent["jest.config"]
}