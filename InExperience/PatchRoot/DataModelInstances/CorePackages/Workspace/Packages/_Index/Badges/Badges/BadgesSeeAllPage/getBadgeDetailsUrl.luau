local parent = script:FindFirstAncestor("Badges").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local fFlagSduiUniversalPageEntry = require(parent.SharedFlags).FFlagSduiUniversalPageEntry
local var1 = urlBuilder.new({
	path = "landing-page-api/badge-details-page/v1beta1",
	base = require(parent.Http).Url.APIS_URL
})

return function(p1, p2)
	-- upvalues: fFlagSduiUniversalPageEntry (ref), urlBuilder (ref), var1 (ref)
	local t = { badgeId = p1 }
	
	if p2 then
		t.userId = p2
	end
	if fFlagSduiUniversalPageEntry then
		t.PageEntryFormat = "Universal"
	end
	return urlBuilder.addQueryString(var1(), t)
end