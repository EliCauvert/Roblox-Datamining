local parent = script:FindFirstAncestor("DataHydration").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local url = require(parent.Http).Url

return {
	buildBadgeRemoveUrl = function(p1)
		-- upvalues: urlBuilder (ref), url (ref)
		return urlBuilder.new({ path = "v1/user/badges/{assetId}", base = url.BADGES_URL })({ assetId = p1 })
	end,
	BADGE_REMOVE_URL = urlBuilder.new({ path = "v1/user/badges/", base = url.BADGES_URL })()
}