local parent = script:FindFirstAncestor("ApolloProfileInsights").Parent
local useQuery = require(parent.ApolloClient).useQuery
local queries = require(parent.ApolloLocalState).queries

return function(p1)
	-- upvalues: useQuery (ref), queries (ref)
	return useQuery(queries.profilesInsightsByUserIds, {
		errorPolicy = "all",
		skip = not p1.userIds or p1.skip,
		variables = {
			userIds = p1.userIds,
			rankingStrategy = p1.rankingStrategy
		},
		fetchPolicy = p1.fetchPolicy
	})
end