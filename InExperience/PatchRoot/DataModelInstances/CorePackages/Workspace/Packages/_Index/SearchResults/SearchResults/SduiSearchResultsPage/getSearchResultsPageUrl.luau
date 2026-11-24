local Parent = script:FindFirstAncestor("SearchResults").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local AddSystemInfoToArgsFunction = require(Parent.DiscoveryUtils).AddSystemInfoToArgs
local NewUrlBuilder = UrlBuilder.new({
	path = "search-api/v1/search-results-page-stream",
	base = require(Parent.Http).Url.APIS_URL
})

return function(SearchQuery, SessionId, GlobalSessionId)
	-- upvalues: AddSystemInfoToArgsFunction (copy), UrlBuilder (copy), NewUrlBuilder (copy)
	local config = {
		searchQuery = SearchQuery,
		sessionId = SessionId,
		globalSessionId = GlobalSessionId
	}
	AddSystemInfoToArgsFunction(config)
	
	return UrlBuilder.addQueryString(NewUrlBuilder(), config)
end