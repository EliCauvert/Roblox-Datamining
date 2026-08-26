local httpService = game:GetService("HttpService")
local url = require(script:FindFirstAncestor("AssetFavorites").Parent.Http).Url

return function(p1, p2, p3)
	-- upvalues: url (ref), httpService (ref)
	return p1(string.format("%s/v1/favorites/users/%s/assets/%s/favorite", url.CATALOG_URL, p2, p3), "POST", { postBody = httpService:JSONEncode({}) })
end