local Parent = script:FindFirstAncestor("Squads").Parent
local JestGlobalsModule = require(Parent.Dev.JestGlobals)

return {
	ApolloClient = require(Parent.Dev.ApolloClient),
	DeferredLuaHelpers = require(Parent.Dev.TestUtils).DeferredLuaHelpers,
	GraphQLServer = require(Parent.Dev.GraphQLServer),
	JestGlobals = JestGlobalsModule,
	Rhodium = require(Parent.Dev.Rhodium),
	RhodiumHelpers = function()
		-- upvalues: Parent (copy)
		return require(Parent.Dev.RhodiumHelpers)
	end,
	UnitTestHelpers = require(Parent.Dev.SocialTestHelpers).TestHelpers,
	createTreeWithProviders = require(Parent.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders,
	findImageSet = require(Parent.Dev.SocialTestHelpers).TestHelpers.findImageSet,
	jest = JestGlobalsModule.jest,
	jestExpect = JestGlobalsModule.expect
}