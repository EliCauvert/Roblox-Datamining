local httpService = game:GetService("HttpService")
local url = require(script:FindFirstAncestor("AssetFavorites").Parent.Http).Url

return function(p0, p1, p2) --[[ line: 16 ]]
	-- upvalues: url (ref), httpService (ref)
	return p0(string.format("%s/v1/favorites/users/%s/assets/%s/favorite", url.CATALOG_URL, p1, p2), "POST", { postBody = httpService:JSONEncode({}) })
end