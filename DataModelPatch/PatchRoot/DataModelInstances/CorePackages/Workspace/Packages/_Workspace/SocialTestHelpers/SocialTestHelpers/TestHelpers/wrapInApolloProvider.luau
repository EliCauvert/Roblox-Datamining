local Parent = script:FindFirstAncestor("SocialTestHelpers").Parent
local ReactModule = require(Parent.React)
local ApolloProvider = require(Parent.ApolloClient).ApolloProvider
local MockApolloClientFunction = require(Parent.GraphQLServer).ApolloClientTestUtils.mockApolloClient

return function(p1, p2)
	-- upvalues: ReactModule (copy), ApolloProvider (copy), MockApolloClientFunction (copy)
	return ReactModule.createElement(ApolloProvider, { client = p2 or MockApolloClientFunction({}) }, p1)
end