local url = require(script:FindFirstAncestor("DiscoveryAnalytics").Parent.Http).Url

return function(p0, p1)
	-- upvalues: url (ref)
	return p0(string.format("%sv1/sponsored-games/click", url.ADS_URL), "POST", { postBody = "\"" .. p1 .. "\"" })
end