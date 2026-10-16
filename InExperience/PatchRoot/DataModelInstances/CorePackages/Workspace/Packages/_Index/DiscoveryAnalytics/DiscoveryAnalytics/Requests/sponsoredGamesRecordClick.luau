local Url = require(script:FindFirstAncestor("DiscoveryAnalytics").Parent.Http).Url

return function(Callback, Text) --[[ Line: 6 ]]
	-- upvalues: Url (copy)
	return Callback(string.format("%sv1/sponsored-games/click", Url.ADS_URL), "POST", { postBody = "\"" .. Text .. "\"" })
end