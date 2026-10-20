local Parent = script:FindFirstAncestor("GameDetail").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local Url = require(Parent.Http).Url
local SduiCapabilities = require(Parent.SduiSharedUtilities).SduiCapabilities
local FFlagSduiCapabilityBindings = require(Parent.SharedFlags).FFlagSduiCapabilityBindings
local FFlagSduiEdpClientTemplateCache = require(Parent.SharedFlags).FFlagSduiEdpClientTemplateCache

return function(UniverseId)
	-- upvalues: UrlBuilder (copy), Url (copy), FFlagSduiCapabilityBindings (copy), FFlagSduiEdpClientTemplateCache (copy), Parent (copy), SduiCapabilities (copy)
	local AddQueryStringResult = UrlBuilder.new({
		path = "experience-details-api/v2/universes/{universeId}/experience-details",
		base = Url.APIS_URL
	})({ universeId = UniverseId })
	
	if FFlagSduiCapabilityBindings and not FFlagSduiEdpClientTemplateCache then
		local _ = require(Parent.ServiceContractsProto)
		local t = {}
		SduiCapabilities.addToQueryParams(t, {
			"CAPABILITY_SUPPORTS_EDP_PERSISTENT_ACTION_BAR_PLAY_BUTTON",
			"CAPABILITY_SUPPORTS_OPEN_EXPERIENCE_STORE_SEE_ALL_WITH_WEBVIEW_FALLBACK_ACTION"
		})
		
		if next(t) ~= nil then
			AddQueryStringResult = UrlBuilder.addQueryString(AddQueryStringResult, t)
		end
	end
	return AddQueryStringResult
end