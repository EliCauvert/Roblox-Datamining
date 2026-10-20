local Parent = script:FindFirstAncestor("DataHydration").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local _ = require(script.Parent.MarketplaceItemFavoriteStoreTypes)
local Url = require(Parent.Http).Url
local config = { Asset = "assets", Bundle = "bundles" }
local config1 = {
	Asset = "catalog/v1/favorites/users/assets/favorite",
	Bundle = "catalog/v1/favorites/users/bundles/favorite"
}

return {
	buildFavoriteUrl = function(UserId, p1, ItemId)
		-- upvalues: UrlBuilder (copy), Url (copy), config (copy)
		return UrlBuilder.new({
			path = "v1/favorites/users/{userId}/{itemPath}/{itemId}/favorite",
			base = Url.CATALOG_URL
		})({ userId = UserId, itemPath = config[p1], itemId = ItemId })
	end,
	getEndpointName = function(p1)
		-- upvalues: config1 (copy)
		return config1[p1]
	end
}