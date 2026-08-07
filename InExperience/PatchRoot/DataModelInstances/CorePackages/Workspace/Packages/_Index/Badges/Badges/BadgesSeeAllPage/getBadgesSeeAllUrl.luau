local parent = script:FindFirstAncestor("Badges").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local fFlagSduiUniversalPageEntry = require(parent.SharedFlags).FFlagSduiUniversalPageEntry
local var0 = urlBuilder.new({
	path = "landing-page-api/badges-see-all/v1beta1",
	base = require(parent.Http).Url.APIS_URL
})
local luaAppBadgesSeeAllRequestPageSize = game:DefineFastInt("LuaAppBadgesSeeAllRequestPageSize", 50)

return function(p0, p1) --[[ line: 16 | named "getBadgesSeeAllUrl" ]]
	-- upvalues: urlBuilder (ref), var0 (ref), luaAppBadgesSeeAllRequestPageSize (ref), fFlagSduiUniversalPageEntry (ref)
	return urlBuilder.addQueryString(var0(), {
		universeId = p0,
		pageSize = luaAppBadgesSeeAllRequestPageSize,
		cursor = p1,
		PageEntryFormat = if fFlagSduiUniversalPageEntry then "Universal" else nil
	})
end