local parent = script:FindFirstAncestor("ApolloProfileInsights").Parent
local useQuery = require(parent.ApolloClient).useQuery
local queries = require(parent.ApolloLocalState).queries

return function(p0)
	-- upvalues: useQuery (ref), queries (ref)
	return useQuery(queries.profilesInsightsByUserIds, {
		errorPolicy = "all",
		skip = not p0.userIds or p0.skip,
		variables = {
			userIds = p0.userIds,
			rankingStrategy = p0.rankingStrategy
		},
		fetchPolicy = p0.fetchPolicy
	})
end