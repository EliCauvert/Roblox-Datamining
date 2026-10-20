local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local NewUrlBuilder = UrlBuilder.new({
	base = require(Parent.Http).Url.APIS_URL,
	path = if require(Parent.SharedFlags).FFlagLuaAppChartsAppPage then "/charts-api/v1/get-sort-content" else "/explore-api/v1/get-sort-content"
})

return function(Callback, p1)
	-- upvalues: UrlBuilder (copy), NewUrlBuilder (copy)
	return Callback(UrlBuilder.addQueryString(NewUrlBuilder(), p1), "GET")
end