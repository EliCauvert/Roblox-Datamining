local Parent = script:FindFirstAncestor("Badges").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local FFlagSduiUniversalPageEntry = require(Parent.SharedFlags).FFlagSduiUniversalPageEntry
local NewUrlBuilder = UrlBuilder.new({
	path = "landing-page-api/badge-details-page/v1beta1",
	base = require(Parent.Http).Url.APIS_URL
})

return function(BadgeId, UserId)
	-- upvalues: FFlagSduiUniversalPageEntry (copy), UrlBuilder (copy), NewUrlBuilder (copy)
	local config = { badgeId = BadgeId }
	
	if UserId then
		config.userId = UserId
	end
	if FFlagSduiUniversalPageEntry then
		config.PageEntryFormat = "Universal"
	end
	return (UrlBuilder.addQueryString(NewUrlBuilder(), config))
end