return {
	query = require(script:FindFirstAncestor("UserSearch").Parent.ApolloClient).gql(require(script.Parent.ProfilesInsights)),
	createPageId = function(Text): string
		return "PROFILE_INSIGHTS_SEARCH_PAGE_ID" .. ":" .. Text
	end
}