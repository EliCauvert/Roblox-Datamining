local parent = script:FindFirstAncestor("Badges").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local badgesSeeAllPageConstantsModule = require(script.Parent.BadgesSeeAllPageConstants)
local var1 = urlBuilder.new({
	path = "landing-page-api/badges-see-all/v1beta1",
	base = require(parent.Http).Url.APIS_URL
})

return function(p1, p2)
	-- upvalues: urlBuilder (ref), var1 (ref), badgesSeeAllPageConstantsModule (ref)
	return urlBuilder.addQueryString(var1(), {
		PageEntryFormat = "Universal",
		universeId = p1,
		pageSize = badgesSeeAllPageConstantsModule.RequestPageSize,
		cursor = p2
	})
end