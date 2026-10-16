local Parent = script:FindFirstAncestor("DataHydration").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local Url = require(Parent.Http).Url

return {
	buildBadgeRemoveUrl = function(AssetId) --[[ Line: 13 ]]
		-- upvalues: UrlBuilder (copy), Url (copy)
		return UrlBuilder.new({ path = "v1/user/badges/{assetId}", base = Url.BADGES_URL })({ assetId = AssetId })
	end,
	BADGE_REMOVE_URL = UrlBuilder.new({ path = "v1/user/badges/", base = Url.BADGES_URL })()
}