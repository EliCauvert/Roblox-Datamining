local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local MergeTypeDefsFunction = require(Parent.GraphqlToolsMerge).mergeTypeDefs
local GraphQLModule = require(Parent.GraphQL)
local LuaTypeDefsModule = require(script.luaTypeDefs)

return {
	typeDefs = "",
	generateTypeDefs = function()
		-- upvalues: MergeTypeDefsFunction (copy), LuaTypeDefsModule (copy), GraphQLModule (copy)
		return (GraphQLModule.print((MergeTypeDefsFunction(LuaTypeDefsModule))))
	end,
	resolvers = require(script.resolvers),
	generatedTypes = require(script.generatedTypes),
	dataLoaders = require(script.dataLoaders),
	mocks = require(script.mocks)
}