return {
	query = require(script:FindFirstAncestor("UserSearch").Parent.ApolloClient).gql(require(script.Parent.ProfilesInsights)),
	createPageId = function(p1)
		return "PROFILE_INSIGHTS_SEARCH_PAGE_ID" .. ":" .. p0
	end
}