local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local NewUrlBuilder = UrlBuilder.new({
	base = require(Parent.Http).Url.APIS_URL,
	path = if require(Parent.SharedFlags).FFlagLuaAppChartsAppPage then "/charts-api/v1/get-sorts-metadata" else "/explore-api/v1/get-sorts-metadata"
})

return function(Callback, SessionId)
	-- upvalues: UrlBuilder (copy), NewUrlBuilder (copy)
	return Callback(UrlBuilder.addQueryString(NewUrlBuilder(), { sessionId = SessionId }), "GET")
end