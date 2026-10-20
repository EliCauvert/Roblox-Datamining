local Parent = script.Parent.Parent

return {
	projects = {
		require(Parent.GraphQLServer)["jest.config"],
		require(Parent.RobloxApolloClient)["jest.config"],
		require(Parent.GraphQlShared)["jest.config"],
		require(Parent.ApolloLocalState)["jest.config"]
	}
}