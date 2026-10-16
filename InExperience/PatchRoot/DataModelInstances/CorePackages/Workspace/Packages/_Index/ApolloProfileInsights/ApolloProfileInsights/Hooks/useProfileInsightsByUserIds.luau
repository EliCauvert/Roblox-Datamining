local Parent = script:FindFirstAncestor("ApolloProfileInsights").Parent
local UseQueryFunction = require(Parent.ApolloClient).useQuery
local Queries = require(Parent.ApolloLocalState).queries

return function(p1) --[[ Line: 17 | Named "useProfileInsightsByUserIds" ]]
	-- upvalues: UseQueryFunction (copy), Queries (copy)
	return (UseQueryFunction(Queries.profilesInsightsByUserIds, {
		errorPolicy = "all",
		skip = not p1.userIds or p1.skip,
		variables = {
			userIds = p1.userIds,
			rankingStrategy = p1.rankingStrategy
		},
		fetchPolicy = p1.fetchPolicy
	}))
end