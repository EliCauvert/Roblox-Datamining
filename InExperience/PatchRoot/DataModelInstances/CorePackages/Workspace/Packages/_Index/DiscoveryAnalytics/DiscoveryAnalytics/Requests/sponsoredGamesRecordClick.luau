local url = require(script:FindFirstAncestor("DiscoveryAnalytics").Parent.Http).Url

return function(p1, p2)
	-- upvalues: url (ref)
	return p1(string.format("%sv1/sponsored-games/click", url.ADS_URL), "POST", { postBody = "\"" .. p1 .. "\"" })
end