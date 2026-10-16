return function(p1, p2) --[[ Line: 7 | Named "buildSettingsPageRequest" ]]
	local t = {}
	
	if p2 then
		t.session_id = p2.sessionId
		t.client_capabilities = p2.clientCapabilities
		
		if p2.cachedRobloxComponentToTemplateId then
			t.cached_roblox_component_to_template_id = p2.cachedRobloxComponentToTemplateId
		end
	end
	return p1.SettingsPageRequest.new(t):jsonEncode()
end