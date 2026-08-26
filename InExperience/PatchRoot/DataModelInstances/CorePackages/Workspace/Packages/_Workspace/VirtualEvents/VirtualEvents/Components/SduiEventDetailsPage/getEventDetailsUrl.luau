local parent = script:FindFirstAncestor("VirtualEvents").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local url = require(parent.Http).Url
local sduiCapabilities = require(parent.SduiSharedUtilities).SduiCapabilities
local fFlagSduiCapabilityBindings = require(parent.SharedFlags).FFlagSduiCapabilityBindings
local var1 = urlBuilder.new({
	path = "virtual-events/v1beta1/event-details-page",
	base = url.APIS_URL
})

return function(p1)
	-- upvalues: fFlagSduiCapabilityBindings (ref), parent (ref), sduiCapabilities (ref), urlBuilder (ref), var1 (ref)
	local t = { eventId = p1 }
	
	if fFlagSduiCapabilityBindings then
		local _ = require(parent.ServiceContractsProto)
		sduiCapabilities.addToQueryParams(t, { "CAPABILITY_SUPPORTS_EVENT_RSVP_FACE_PILE" })
	end
	return urlBuilder.addQueryString(var1(), t)
end