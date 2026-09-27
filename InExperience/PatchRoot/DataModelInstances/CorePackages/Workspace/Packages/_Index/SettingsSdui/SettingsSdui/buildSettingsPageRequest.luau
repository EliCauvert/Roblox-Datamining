return function(value, p1)
	local t = {}
	
	if p1 then
		t.session_id = p1.sessionId
		t.client_capabilities = p1.clientCapabilities
		
		if p1.cachedRobloxComponentToTemplateId then
			t.cached_roblox_component_to_template_id = p1.cachedRobloxComponentToTemplateId
		end
	end
	return value.SettingsPageRequest.new(t):jsonEncode()
end