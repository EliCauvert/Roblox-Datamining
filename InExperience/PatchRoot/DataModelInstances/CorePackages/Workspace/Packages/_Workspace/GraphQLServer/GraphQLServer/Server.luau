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

function t.new(p1)
	-- upvalues: graphQLModule (ref), typeDefs (ref), resolvers (ref), addMockResolversModule (ref), buildRootValueModule (ref), buildTypeResolverModule (ref), buildFieldResolverModule (ref), fetch (ref), getFFlagUserProfilesDataLoaderEnabled (ref), object (ref), dataLoaders (ref), t (ref)
	local t_1 = { port = if p1.port then p1.port else 4000 }
	local var1 = false
	local var2 = nil
	
	if not p1.typeDefs then
		local ok, status = pcall(function()
			return require(script.Parent.compiled_schema)
		end)
		var1 = ok
		var2 = status
	end
	if var1 and var2 then
		t_1.schema = graphQLModule.buildASTSchema(var2, { assumeValid = true, assumeValidSDL = true })
	else
		t_1.schema = graphQLModule.buildSchema(if p1.typeDefs then p1.typeDefs else typeDefs)
	end
	local var3 = if p1.resolvers then p1.resolvers else resolvers
	
	if type(p1.mockResolvers) == "table" then
		var3 = addMockResolversModule(var3, p1.mockResolvers)
	end
	t_1.rootValue = buildRootValueModule(var3)
	t_1.typeResolver = buildTypeResolverModule(var3)
	t_1.fieldResolver = buildFieldResolverModule(var3)
	t_1.fetchImpl = if p1.fetchImpl then p1.fetchImpl else fetch
	
	if getFFlagUserProfilesDataLoaderEnabled() then
		t_1.clientLoaders = object.assign({}, { userProfiles = dataLoaders.userProfilesDataLoader.new() }, p1.dataLoaderInitializers or {})
	end
	setmetatable(t_1, t)
	
	return t_1
end

function t.fetchLocal(p1, p2)
	-- upvalues: httpService (ref), promiseModule (ref), graphQLModule (ref), getFFlagUserProfilesDataLoaderEnabled (ref), object (ref), responseModule (ref)
	local var1 = if p2 then httpService:JSONDecode(p2.body) else {}
	local t = {}
	
	return promiseModule.new(function(p3, _)
		-- upvalues: graphQLModule (copy), p1 (ref), var1 (ref), getFFlagUserProfilesDataLoaderEnabled (copy), object (copy), t (ref), responseModule (copy)
		graphQLModule.graphql({
			schema = p1.schema,
			source = var1.query or var1.mutation,
			rootValue = p1.rootValue,
			contextValue = {
				fetchImpl = p1.fetchImpl,
				dataLoaders = if getFFlagUserProfilesDataLoaderEnabled() then object.assign({}, t, p1.clientLoaders) else t
			},
			typeResolver = p1.typeResolver,
			fieldResolver = p1.fieldResolver,
			variableValues = var1.variables
		}):andThen(function(p4)
			-- upvalues: p3 (ref), responseModule (copy)
			p3(responseModule.new(p4))
		end)
	end)
end

return t