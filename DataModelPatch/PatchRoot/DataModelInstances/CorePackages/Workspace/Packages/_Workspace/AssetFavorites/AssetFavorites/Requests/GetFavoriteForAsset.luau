local HttpService = game:GetService("HttpService")
local Url = require(script:FindFirstAncestor("AssetFavorites").Parent.Http).Url

return function(Callback, p1, p2)
	-- upvalues: Url (copy), HttpService (copy)
	return Callback(string.format("%s/v1/favorites/users/%s/assets/%s/favorite", Url.CATALOG_URL, p1, p2), "GET", { postBody = HttpService:JSONEncode({}) })
end