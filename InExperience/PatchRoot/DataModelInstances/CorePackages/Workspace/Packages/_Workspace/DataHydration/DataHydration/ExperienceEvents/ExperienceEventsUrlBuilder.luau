local parent = script:FindFirstAncestor("DataHydration").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local url = require(parent.Http).Url

return {
	buildRsvpUpdateUrl = function(p1)
		-- upvalues: urlBuilder (ref), url (ref)
		return urlBuilder.new({
			path = "virtual-events/v1/virtual-events/{id}/rsvps",
			base = url.APIS_URL
		})({ id = p1 })
	end,
	RSVP_UPDATE_URL = urlBuilder.new({
		path = "virtual-events/v1/virtual-events/rsvps",
		base = url.APIS_URL
	})
}