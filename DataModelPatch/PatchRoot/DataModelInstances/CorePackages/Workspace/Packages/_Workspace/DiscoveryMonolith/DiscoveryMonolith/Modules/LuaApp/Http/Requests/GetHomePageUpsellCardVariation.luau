local Url = require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Http).Url

return function(Callback)
	-- upvalues: Url (copy)
	return Callback(string.format("%supsellcard/type", Url.APIS_URL), "GET")
end