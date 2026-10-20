local Url = require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Http).Url

return function(Callback, p1)
	-- upvalues: Url (copy)
	return Callback(string.format("%ssearch-landing-page-api/v1?%s", Url.APIS_URL, (Url:makeQueryString(p1))), "GET")
end