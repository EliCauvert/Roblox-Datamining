local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local UseQueryFunction = require(Parent.ApolloClient).useQuery
local ProfilesInsightsQueryModule = require(UserSearch.Apollo.ProfilesInsightsQuery)
local FFlagPlayerSearchEnableOnlineFrequents = require(Parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents

return function(UserIds, p1, p2)
	-- upvalues: ProfilesInsightsQueryModule (copy), UseQueryFunction (copy), FFlagPlayerSearchEnableOnlineFrequents (copy)
	return (UseQueryFunction(ProfilesInsightsQueryModule.query, {
		errorPolicy = "all",
		skip = not UserIds or #UserIds == 0,
		variables = {
			userIds = UserIds,
			pageId = ProfilesInsightsQueryModule.createPageId(p1),
			rankingStrategy = if FFlagPlayerSearchEnableOnlineFrequents then p2 else nil
		}
	}))
end