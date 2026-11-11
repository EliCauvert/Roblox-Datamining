local Parent = script:FindFirstAncestor("Badges").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local FFlagSduiUniversalPageEntry = require(Parent.SharedFlags).FFlagSduiUniversalPageEntry
local NewUrlBuilder = UrlBuilder.new({
	path = "landing-page-api/badges-see-all/v1beta1",
	base = require(Parent.Http).Url.APIS_URL
})
local LuaAppBadgesSeeAllRequestPageSize = game:DefineFastInt("LuaAppBadgesSeeAllRequestPageSize", 50)

return function(UniverseId, Cursor)
	-- upvalues: UrlBuilder (copy), NewUrlBuilder (copy), LuaAppBadgesSeeAllRequestPageSize (copy), FFlagSduiUniversalPageEntry (copy)
	return (UrlBuilder.addQueryString(NewUrlBuilder(), {
		universeId = UniverseId,
		pageSize = LuaAppBadgesSeeAllRequestPageSize,
		cursor = Cursor,
		PageEntryFormat = if FFlagSduiUniversalPageEntry then "Universal" else nil
	}))
end