local Parent = script:FindFirstAncestor("DataHydration").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local Url = require(Parent.Http).Url

return {
	buildRsvpUpdateUrl = function(Id)
		-- upvalues: UrlBuilder (copy), Url (copy)
		return UrlBuilder.new({
			path = "virtual-events/v1/virtual-events/{id}/rsvps",
			base = Url.APIS_URL
		})({ id = Id })
	end,
	RSVP_UPDATE_URL = UrlBuilder.new({
		path = "virtual-events/v1/virtual-events/rsvps",
		base = Url.APIS_URL
	})
}