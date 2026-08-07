local parent = script:FindFirstAncestor("GraphQLServer").Parent
local mergeTypeDefs = require(parent.GraphqlToolsMerge).mergeTypeDefs
local graphQLModule = require(parent.GraphQL)
local luaTypeDefsModule = require(script.luaTypeDefs)

return {
	typeDefs = "",
	generateTypeDefs = function() --[[ line: 35 ]]
		-- upvalues: mergeTypeDefs (ref), luaTypeDefsModule (ref), graphQLModule (ref)
		return graphQLModule.print(mergeTypeDefs(luaTypeDefsModule))
	end,
	resolvers = require(script.resolvers),
	generatedTypes = require(script.generatedTypes),
	dataLoaders = require(script.dataLoaders),
	mocks = require(script.mocks)
}