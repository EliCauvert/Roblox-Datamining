local Parent = script:FindFirstAncestor("VirtualEvents").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local SduiCapabilities = require(Parent.SduiSharedUtilities).SduiCapabilities
local FFlagSduiCapabilityBindings = require(Parent.SharedFlags).FFlagSduiCapabilityBindings
local NewUrlBuilder = UrlBuilder.new({
	path = "virtual-events/v1beta1/event-details-page",
	base = require(Parent.Http).Url.APIS_URL
})

return function(EventId) --[[ Line: 14 | Named "getEventDetailsUrl" ]]
	-- upvalues: FFlagSduiCapabilityBindings (copy), Parent (copy), SduiCapabilities (copy), UrlBuilder (copy), NewUrlBuilder (copy)
	local config = { eventId = EventId }
	
	if FFlagSduiCapabilityBindings then
		local _ = require(Parent.ServiceContractsProto)
		SduiCapabilities.addToQueryParams(config, { "CAPABILITY_SUPPORTS_EVENT_RSVP_FACE_PILE" })
	end
	return UrlBuilder.addQueryString(NewUrlBuilder(), config)
end