local Parent = script:FindFirstAncestor("Badges").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local BadgesSeeAllPageConstantsModule = require(script.Parent.BadgesSeeAllPageConstants)
local NewUrlBuilder = UrlBuilder.new({
	path = "landing-page-api/badges-see-all/v1beta1",
	base = require(Parent.Http).Url.APIS_URL
})

return function(UniverseId, Cursor)
	-- upvalues: UrlBuilder (copy), NewUrlBuilder (copy), BadgesSeeAllPageConstantsModule (copy)
	return (UrlBuilder.addQueryString(NewUrlBuilder(), {
		PageEntryFormat = "Universal",
		universeId = UniverseId,
		pageSize = BadgesSeeAllPageConstantsModule.RequestPageSize,
		cursor = Cursor
	}))
end