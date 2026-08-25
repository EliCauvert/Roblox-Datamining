local parent = script:FindFirstAncestor("RobloxApolloClient").Parent
local apolloClientModule = require(parent.ApolloClient)
local apolloLocalStateModule = require(parent.ApolloLocalState)
local graphQLServer = require(parent.GraphQLServer).GraphQLServer
local apolloClient = apolloClientModule.ApolloClient
local httpLink = apolloClientModule.HttpLink
local inMemoryCache = apolloClientModule.InMemoryCache
local typePolicies = apolloLocalStateModule.typePolicies

function initalizeApolloClient(p0)
	-- upvalues: graphQLServer (ref), httpLink (ref), inMemoryCache (ref), typePolicies (ref), apolloClient (ref)
	local var2 = graphQLServer.new(p0)
	
	return apolloClient.new({
		link = httpLink.new({
			uri = "/api",
			fetch = function(_, p1)
				-- upvalues: var2 (ref)
				return var2:fetchLocal(p1)
			end
		}),
		cache = inMemoryCache.new({ typePolicies = typePolicies })
	})
end

return initalizeApolloClient