local userSearch = script:FindFirstAncestor("UserSearch")
local parent = userSearch.Parent
local useQuery = require(parent.ApolloClient).useQuery
local profilesInsightsQueryModule = require(userSearch.Apollo.ProfilesInsightsQuery)
local fFlagPlayerSearchEnableOnlineFrequents = require(parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents

return function(p1, p2, p3)
	-- upvalues: profilesInsightsQueryModule (ref), useQuery (ref), fFlagPlayerSearchEnableOnlineFrequents (ref)
	return useQuery(profilesInsightsQueryModule.query, {
		errorPolicy = "all",
		skip = not p1 or #p1 == 0,
		variables = {
			userIds = p1,
			pageId = profilesInsightsQueryModule.createPageId(p2),
			rankingStrategy = if fFlagPlayerSearchEnableOnlineFrequents then p3 else nil
		}
	})
end