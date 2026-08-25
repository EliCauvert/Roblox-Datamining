local parent = script:FindFirstAncestor("GameDetail").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local url = require(parent.Http).Url
local sduiCapabilities = require(parent.SduiSharedUtilities).SduiCapabilities
local fFlagSduiCapabilityBindings = require(parent.SharedFlags).FFlagSduiCapabilityBindings
local fFlagSduiEdpClientTemplateCache = require(parent.SharedFlags).FFlagSduiEdpClientTemplateCache

return function(p0)
	-- upvalues: urlBuilder (ref), url (ref), fFlagSduiCapabilityBindings (ref), fFlagSduiEdpClientTemplateCache (ref), parent (ref), sduiCapabilities (ref)
	local var0 = urlBuilder.new({
		path = "experience-details-api/v2/universes/{universeId}/experience-details",
		base = url.APIS_URL
	})({ universeId = p0 })
	
	if fFlagSduiCapabilityBindings and not fFlagSduiEdpClientTemplateCache then
		local _ = require(parent.ServiceContractsProto)
		local t = {}
		sduiCapabilities.addToQueryParams(t, {
			"CAPABILITY_SUPPORTS_EDP_PERSISTENT_ACTION_BAR_PLAY_BUTTON",
			"CAPABILITY_SUPPORTS_EDP_COMMUNITY_SECTION",
			"CAPABILITY_SUPPORTS_EDP_BUILD_TAG",
			"CAPABILITY_SUPPORTS_OPEN_EXPERIENCE_STORE_SEE_ALL_WITH_WEBVIEW_FALLBACK_ACTION",
			"CAPABILITY_SUPPORTS_PIN_SHORTCUT_ACTION",
			"CAPABILITY_SUPPORTS_SCALED_PLAY_BUTTON_AND_IMAGE_SIZES"
		})
		
		if next(t) ~= nil then
			var0 = urlBuilder.addQueryString(var0, t)
		end
	end
	return var0
end