local parent = script:FindFirstAncestor("Badges").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local fFlagSduiUniversalPageEntry = require(parent.SharedFlags).FFlagSduiUniversalPageEntry
local var1 = urlBuilder.new({
	path = "landing-page-api/badges-see-all/v1beta1",
	base = require(parent.Http).Url.APIS_URL
})
local luaAppBadgesSeeAllRequestPageSize = game:DefineFastInt("LuaAppBadgesSeeAllRequestPageSize", 50)

return function(p1, p2)
	-- upvalues: urlBuilder (ref), var1 (ref), luaAppBadgesSeeAllRequestPageSize (ref), fFlagSduiUniversalPageEntry (ref)
	return urlBuilder.addQueryString(var1(), {
		universeId = p1,
		pageSize = luaAppBadgesSeeAllRequestPageSize,
		cursor = p2,
		PageEntryFormat = if fFlagSduiUniversalPageEntry then "Universal" else nil
	})
end