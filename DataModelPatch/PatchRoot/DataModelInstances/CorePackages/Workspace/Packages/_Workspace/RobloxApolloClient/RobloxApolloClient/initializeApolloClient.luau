local Parent = script:FindFirstAncestor("RobloxApolloClient").Parent
local ApolloClientModule = require(Parent.ApolloClient)
local GraphQLServer = require(Parent.GraphQLServer).GraphQLServer
local ApolloClient = ApolloClientModule.ApolloClient
local HttpLink = ApolloClientModule.HttpLink
local InMemoryCache = ApolloClientModule.InMemoryCache
local TypePolicies = require(Parent.ApolloLocalState).typePolicies

function initalizeApolloClient(p1)
	-- upvalues: GraphQLServer (copy), HttpLink (copy), InMemoryCache (copy), TypePolicies (copy), ApolloClient (copy)
	local NewGraphQLServer = GraphQLServer.new(p1)
	
	return (ApolloClient.new({
		link = HttpLink.new({
			uri = "/api",
			fetch = function(_, p2)
				-- upvalues: NewGraphQLServer (copy)
				return NewGraphQLServer:fetchLocal(p2)
			end
		}),
		cache = InMemoryCache.new({ typePolicies = TypePolicies })
	}))
end

return initalizeApolloClient