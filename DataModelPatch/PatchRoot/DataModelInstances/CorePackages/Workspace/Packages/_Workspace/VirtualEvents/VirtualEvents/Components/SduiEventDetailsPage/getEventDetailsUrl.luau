local Parent = script:FindFirstAncestor("VirtualEvents").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local NewUrlBuilder = UrlBuilder.new({
	path = "virtual-events/v1beta1/event-details-page",
	base = require(Parent.Http).Url.APIS_URL
})

return function(EventId)
	-- upvalues: UrlBuilder (copy), NewUrlBuilder (copy)
	return (UrlBuilder.addQueryString(NewUrlBuilder(), { eventId = EventId }))
end