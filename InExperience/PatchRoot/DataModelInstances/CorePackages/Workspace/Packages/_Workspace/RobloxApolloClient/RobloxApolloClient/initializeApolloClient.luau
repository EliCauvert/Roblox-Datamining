local parent = script:FindFirstAncestor("RobloxApolloClient").Parent
local apolloClientModule = require(parent.ApolloClient)
local apolloLocalStateModule = require(parent.ApolloLocalState)
local graphQLServer = require(parent.GraphQLServer).GraphQLServer
local apolloClient = apolloClientModule.ApolloClient
local httpLink = apolloClientModule.HttpLink
local inMemoryCache = apolloClientModule.InMemoryCache
local typePolicies = apolloLocalStateModule.typePolicies

function initalizeApolloClient(p1)
	-- upvalues: graphQLServer (ref), httpLink (ref), inMemoryCache (ref), typePolicies (ref), apolloClient (ref)
	local var1 = graphQLServer.new(p1)
	
	return apolloClient.new({
		link = httpLink.new({
			uri = "/api",
			fetch = function(_, p2)
				-- upvalues: var1 (ref)
				return var1:fetchLocal(p2)
			end
		}),
		cache = inMemoryCache.new({ typePolicies = typePolicies })
	})
end

return initalizeApolloClient