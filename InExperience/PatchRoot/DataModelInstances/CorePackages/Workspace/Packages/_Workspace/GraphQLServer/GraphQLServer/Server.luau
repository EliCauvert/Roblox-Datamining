local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("GraphQLServer").Parent
local graphQLModule = require(parent.GraphQL)
local promiseModule = require(parent.Promise)
local object = require(parent.LuauPolyfill).Object
local fetch = require(parent.Fetch).fetch
local _ = require(parent.DataLoader)
local responseModule = require(script.Parent.Response)
local graphqlModule = require(script.Parent.graphql)
local typeDefs = graphqlModule.typeDefs
local resolvers = graphqlModule.resolvers
local dataLoaders = graphqlModule.dataLoaders
local buildTypeResolverModule = require(script.Parent.schemaUtils.buildTypeResolver)
local buildRootValueModule = require(script.Parent.schemaUtils.buildRootValue)
local buildFieldResolverModule = require(script.Parent.schemaUtils.buildFieldResolver)
local addMockResolversModule = require(script.Parent.schemaUtils.addMockResolvers)
local getFFlagUserProfilesDataLoaderEnabled = require(parent.SharedFlags).getFFlagUserProfilesDataLoaderEnabled
local t = {}
t.__index = t

function t.new(p0) --[[ line: 71 ]]
	-- upvalues: graphQLModule (ref), typeDefs (ref), resolvers (ref), addMockResolversModule (ref), buildRootValueModule (ref), buildTypeResolverModule (ref), buildFieldResolverModule (ref), fetch (ref), getFFlagUserProfilesDataLoaderEnabled (ref), object (ref), dataLoaders (ref), t (ref)
	local t_1 = { port = if p0.port then p0.port else 4000 }
	local var11 = false
	local var12 = nil
	
	if not p0.typeDefs then
		local ok, status = pcall(function() --[[ line: 78 ]]
			return require(script.Parent.compiled_schema)
		end)
		var11 = ok
		var12 = status
	end
	if var11 and var12 then
		t_1.schema = graphQLModule.buildASTSchema(var12, { assumeValid = true, assumeValidSDL = true })
	else
		t_1.schema = graphQLModule.buildSchema(if p0.typeDefs then p0.typeDefs else typeDefs)
	end
	local var13 = if p0.resolvers then p0.resolvers else resolvers
	
	if type(p0.mockResolvers) == "table" then
		var13 = addMockResolversModule(var13, p0.mockResolvers)
	end
	t_1.rootValue = buildRootValueModule(var13)
	t_1.typeResolver = buildTypeResolverModule(var13)
	t_1.fieldResolver = buildFieldResolverModule(var13)
	t_1.fetchImpl = if p0.fetchImpl then p0.fetchImpl else fetch
	
	if getFFlagUserProfilesDataLoaderEnabled() then
		t_1.clientLoaders = object.assign({}, { userProfiles = dataLoaders.userProfilesDataLoader.new() }, p0.dataLoaderInitializers or {})
	end
	setmetatable(t_1, t)
	
	return t_1
end

function t.fetchLocal(p1, p2) --[[ line: 115 ]]
	-- upvalues: httpService (ref), promiseModule (ref), graphQLModule (ref), getFFlagUserProfilesDataLoaderEnabled (ref), object (ref), responseModule (ref)
	local var14 = if p2 then httpService:JSONDecode(p2.body) else {}
	local t = {}
	
	return promiseModule.new(function(p3, _) --[[ line: 119 ]]
		-- upvalues: graphQLModule (copy), p1 (ref), var14 (ref), getFFlagUserProfilesDataLoaderEnabled (copy), object (copy), t (ref), responseModule (copy)
		graphQLModule.graphql({
			schema = p1.schema,
			source = var14.query or var14.mutation,
			rootValue = p1.rootValue,
			contextValue = {
				fetchImpl = p1.fetchImpl,
				dataLoaders = if getFFlagUserProfilesDataLoaderEnabled() then object.assign({}, t, p1.clientLoaders) else t
			},
			typeResolver = p1.typeResolver,
			fieldResolver = p1.fieldResolver,
			variableValues = var14.variables
		}):andThen(function(p4) --[[ line: 133 ]]
			-- upvalues: p3 (ref), responseModule (copy)
			p3(responseModule.new(p4))
		end)
	end)
end

return t