local Parent = script:FindFirstAncestor("SearchResults").Parent
local HttpService = game:GetService("HttpService")
local Url = require(Parent.Http).Url
local FFlagLuaAppEnableSearchStreamingEndpoint = require(Parent.SharedFlags).FFlagLuaAppEnableSearchStreamingEndpoint

return function(Input, Input1, Input2): string
	-- upvalues: HttpService (copy), FFlagLuaAppEnableSearchStreamingEndpoint (copy), Url (copy)
	return string.format("%ssearch-api/v1/%s?searchQuery=%s&sessionId=%s&globalSessionId=%s", Url.APIS_URL, if FFlagLuaAppEnableSearchStreamingEndpoint then "search-results-page-stream" else "search-results-page", HttpService:UrlEncode(Input), HttpService:UrlEncode(Input1), (HttpService:UrlEncode(Input2)))
end