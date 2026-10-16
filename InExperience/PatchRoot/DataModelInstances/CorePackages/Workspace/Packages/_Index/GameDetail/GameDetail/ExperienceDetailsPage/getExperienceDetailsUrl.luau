local Parent = script:FindFirstAncestor("GameDetail").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local Url = require(Parent.Http).Url
local SduiCapabilities = require(Parent.SduiSharedUtilities).SduiCapabilities
local FFlagSduiCapabilityBindings = require(Parent.SharedFlags).FFlagSduiCapabilityBindings
local FFlagSduiEdpClientTemplateCache = require(Parent.SharedFlags).FFlagSduiEdpClientTemplateCache
local FFlagInfoTableStableItemKeys = require(Parent.SharedFlags).FFlagInfoTableStableItemKeys
local FFlagLuaAppEdpMomentVideo = require(Parent.SharedFlags).FFlagLuaAppEdpMomentVideo

return function(UniverseId) --[[ Line: 12 | Named "getExperienceDetailsUrl" ]]
	-- upvalues: UrlBuilder (copy), Url (copy), FFlagSduiCapabilityBindings (copy), FFlagSduiEdpClientTemplateCache (copy), Parent (copy), FFlagLuaAppEdpMomentVideo (copy), FFlagInfoTableStableItemKeys (copy), SduiCapabilities (copy)
	local AddQueryStringResult = UrlBuilder.new({
		path = "experience-details-api/v2/universes/{universeId}/experience-details",
		base = Url.APIS_URL
	})({ universeId = UniverseId })
	
	if FFlagSduiCapabilityBindings and not FFlagSduiEdpClientTemplateCache then
		local _ = require(Parent.ServiceContractsProto)
		local List = {
			"CAPABILITY_SUPPORTS_EDP_PERSISTENT_ACTION_BAR_PLAY_BUTTON",
			"CAPABILITY_SUPPORTS_EDP_COMMUNITY_SECTION",
			"CAPABILITY_SUPPORTS_EDP_BUILD_TAG",
			"CAPABILITY_SUPPORTS_OPEN_EXPERIENCE_STORE_SEE_ALL_WITH_WEBVIEW_FALLBACK_ACTION",
			"CAPABILITY_SUPPORTS_PIN_SHORTCUT_ACTION",
			"CAPABILITY_SUPPORTS_SCALED_PLAY_BUTTON_AND_IMAGE_SIZES",
			"CAPABILITY_SUPPORTS_CONTAINER_QUERIES",
			"CAPABILITY_SUPPORTS_EDP_EARLY_ACCESS_UPSELL",
			if FFlagLuaAppEdpMomentVideo then "CAPABILITY_SUPPORTS_EDP_MEDIA_GALLERY_MOMENT_VIDEO" else nil
		}
		
		if FFlagInfoTableStableItemKeys then
			table.insert(List, "CAPABILITY_SUPPORTS_EDP_INFO_TABLE_STABLE_ITEM_KEYS")
		end
		local t = {}
		SduiCapabilities.addToQueryParams(t, List)
		
		if next(t) ~= nil then
			AddQueryStringResult = UrlBuilder.addQueryString(AddQueryStringResult, t)
		end
	end
	return AddQueryStringResult
end