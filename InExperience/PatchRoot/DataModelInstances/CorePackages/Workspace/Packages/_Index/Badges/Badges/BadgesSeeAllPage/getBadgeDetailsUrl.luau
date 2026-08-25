local parent = script:FindFirstAncestor("Badges").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local fFlagSduiUniversalPageEntry = require(parent.SharedFlags).FFlagSduiUniversalPageEntry
local var0 = urlBuilder.new({
	path = "landing-page-api/badge-details-page/v1beta1",
	base = require(parent.Http).Url.APIS_URL
})

return function(p0, p1)
	-- upvalues: fFlagSduiUniversalPageEntry (ref), urlBuilder (ref), var0 (ref)
	local t = { badgeId = p0 }
	
	if p1 then
		t.userId = p1
	end
	if fFlagSduiUniversalPageEntry then
		t.PageEntryFormat = "Universal"
	end
	return urlBuilder.addQueryString(var0(), t)
end