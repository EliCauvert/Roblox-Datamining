local parent = script:FindFirstAncestor("VirtualEvents").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local var0 = urlBuilder.new({
	path = "virtual-events/v1beta1/event-details-page",
	base = require(parent.Http).Url.APIS_URL
})

return function(p0) --[[ line: 12 | named "getEventDetailsUrl" ]]
	-- upvalues: urlBuilder (ref), var0 (ref)
	return urlBuilder.addQueryString(var0(), { eventId = p0 })
end