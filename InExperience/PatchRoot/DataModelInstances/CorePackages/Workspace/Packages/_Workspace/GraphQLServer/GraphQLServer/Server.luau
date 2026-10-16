local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local GraphQLModule = require(Parent.GraphQL)
local PromiseModule = require(Parent.Promise)
local Object = require(Parent.LuauPolyfill).Object
local Fetch = require(Parent.Fetch).fetch
local _ = require(Parent.DataLoader)
local ResponseModule = require(script.Parent.Response)
local GraphqlModule = require(script.Parent.graphql)
local TypeDefs = GraphqlModule.typeDefs
local Resolvers = GraphqlModule.resolvers
local DataLoaders = GraphqlModule.dataLoaders
local BuildTypeResolverModule = require(script.Parent.schemaUtils.buildTypeResolver)
local BuildRootValueModule = require(script.Parent.schemaUtils.buildRootValue)
local BuildFieldResolverModule = require(script.Parent.schemaUtils.buildFieldResolver)
local AddMockResolversModule = require(script.Parent.schemaUtils.addMockResolvers)
local GetFFlagUserProfilesDataLoaderEnabledFunction = require(Parent.SharedFlags).getFFlagUserProfilesDataLoaderEnabled
local ServerModule = {}
ServerModule.__index = ServerModule

function ServerModule.new(p1) --[[ Line: 71 ]]
	-- upvalues: GraphQLModule (copy), TypeDefs (copy), Resolvers (copy), AddMockResolversModule (copy), BuildRootValueModule (copy), BuildTypeResolverModule (copy), BuildFieldResolverModule (copy), Fetch (copy), GetFFlagUserProfilesDataLoaderEnabledFunction (copy), Object (copy), DataLoaders (copy), ServerModule (copy)
	local config = { port = if p1.port then p1.port else 4000 }
	local v1 = false
	local v2 = nil
	
	if not p1.typeDefs then
		v1, v18 = pcall(function() --[[ Line: 78 ]]
			return require(script.Parent.compiled_schema)
		end)
	end
	if v1 and v2 then
		config.schema = GraphQLModule.buildASTSchema(v2, { assumeValid = true, assumeValidSDL = true })
	else
		config.schema = GraphQLModule.buildSchema(if p1.typeDefs then p1.typeDefs else TypeDefs)
	end
	local Resolvers1 = if p1.resolvers then p1.resolvers else Resolvers
	
	if type(p1.mockResolvers) == "table" then
		Resolvers1 = AddMockResolversModule(Resolvers1, p1.mockResolvers)
	end
	config.rootValue = BuildRootValueModule(Resolvers1)
	config.typeResolver = BuildTypeResolverModule(Resolvers1)
	config.fieldResolver = BuildFieldResolverModule(Resolvers1)
	config.fetchImpl = if p1.fetchImpl then p1.fetchImpl else Fetch
	
	if GetFFlagUserProfilesDataLoaderEnabledFunction() then
		config.clientLoaders = Object.assign({}, { userProfiles = DataLoaders.userProfilesDataLoader.new() }, p1.dataLoaderInitializers or {})
	end
	setmetatable(config, ServerModule)
	
	return config
end

function ServerModule.fetchLocal(p1, p2) --[[ Line: 115 ]]
	-- upvalues: HttpService (copy), PromiseModule (copy), GraphQLModule (copy), GetFFlagUserProfilesDataLoaderEnabledFunction (copy), Object (copy), ResponseModule (copy)
	local Data = if p2 then HttpService:JSONDecode(p2.body) else {}
	local t = {}
	
	return PromiseModule.new(function(Callback, _) --[[ Line: 119 ]]
		-- upvalues: GraphQLModule (upval), p1 (copy), Data (copy), GetFFlagUserProfilesDataLoaderEnabledFunction (upval), Object (upval), t (copy), ResponseModule (upval)
		GraphQLModule.graphql({
			schema = p1.schema,
			source = Data.query or Data.mutation,
			rootValue = p1.rootValue,
			contextValue = {
				fetchImpl = p1.fetchImpl,
				dataLoaders = if GetFFlagUserProfilesDataLoaderEnabledFunction() then Object.assign({}, t, p1.clientLoaders) else t
			},
			typeResolver = p1.typeResolver,
			fieldResolver = p1.fieldResolver,
			variableValues = Data.variables
		}):andThen(function(Result) --[[ Line: 133 ]]
			-- upvalues: Callback (copy), ResponseModule (upval)
			Callback(ResponseModule.new(Result))
		end)
	end)
end

return ServerModule