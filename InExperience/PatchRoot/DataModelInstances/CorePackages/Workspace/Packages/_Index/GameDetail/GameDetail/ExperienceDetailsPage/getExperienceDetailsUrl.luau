local parent = script:FindFirstAncestor("GameDetail").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local url = require(parent.Http).Url
local sduiCapabilities = require(parent.SduiSharedUtilities).SduiCapabilities
local fFlagSduiCapabilityBindings = require(parent.SharedFlags).FFlagSduiCapabilityBindings
local fFlagSduiEdpClientTemplateCache = require(parent.SharedFlags).FFlagSduiEdpClientTemplateCache
local fFlagInfoTableStableItemKeys = require(parent.SharedFlags).FFlagInfoTableStableItemKeys

return function(p1)
	-- upvalues: urlBuilder (ref), url (ref), fFlagSduiCapabilityBindings (ref), fFlagSduiEdpClientTemplateCache (ref), parent (ref), fFlagInfoTableStableItemKeys (ref), sduiCapabilities (ref)
	local var1 = urlBuilder.new({
		path = "experience-details-api/v2/universes/{universeId}/experience-details",
		base = url.APIS_URL
	})({ universeId = p1 })
	
	if fFlagSduiCapabilityBindings and not fFlagSduiEdpClientTemplateCache then
		local _ = require(parent.ServiceContractsProto)
		local list = {
			"CAPABILITY_SUPPORTS_EDP_PERSISTENT_ACTION_BAR_PLAY_BUTTON",
			"CAPABILITY_SUPPORTS_EDP_COMMUNITY_SECTION",
			"CAPABILITY_SUPPORTS_EDP_BUILD_TAG",
			"CAPABILITY_SUPPORTS_OPEN_EXPERIENCE_STORE_SEE_ALL_WITH_WEBVIEW_FALLBACK_ACTION",
			"CAPABILITY_SUPPORTS_PIN_SHORTCUT_ACTION",
			"CAPABILITY_SUPPORTS_SCALED_PLAY_BUTTON_AND_IMAGE_SIZES",
			"CAPABILITY_SUPPORTS_CONTAINER_QUERIES",
			"CAPABILITY_SUPPORTS_EDP_EARLY_ACCESS_UPSELL"
		}
		
		if fFlagInfoTableStableItemKeys then
			table.insert(list, "CAPABILITY_SUPPORTS_EDP_INFO_TABLE_STABLE_ITEM_KEYS")
		end
		local t = {}
		sduiCapabilities.addToQueryParams(t, list)
		
		if next(t) ~= nil then
			var1 = urlBuilder.addQueryString(var1, t)
		end
	end
	return var1
end