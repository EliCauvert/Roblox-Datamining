local Parent = script:FindFirstAncestor("Badges").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local NewUrlBuilder = UrlBuilder.new({
	path = "landing-page-api/badge-details-page/v1beta1",
	base = require(Parent.Http).Url.APIS_URL
})

return function(BadgeId, UserId) --[[ Line: 12 | Named "getBadgeDetailsUrl" ]]
	-- upvalues: UrlBuilder (copy), NewUrlBuilder (copy)
	local config = { badgeId = BadgeId }
	
	if UserId then
		config.userId = UserId
	end
	config.PageEntryFormat = "Universal"
	
	return (UrlBuilder.addQueryString(NewUrlBuilder(), config))
end