local buildHomeSystemContextFeaturesModule = require(script:FindFirstAncestor("Home").buildHomeSystemContextFeatures)

local function buildContextualFeatures(p0) --[[ line: 22 ]]
	-- upvalues: buildHomeSystemContextFeaturesModule (ref)
	local var2 = buildHomeSystemContextFeaturesModule()
	
	if typeof(p0.contextualFeatures) == "table" then
		for i, v in p0.contextualFeatures do
			if typeof(i) == "string" and v ~= nil then
				var2[i] = tostring(v)
			end
		end
	end
	if p0.requestIntent and p0.requestIntent ~= "" then
		var2.request_intent = p0.requestIntent
	end
	return if next(var2) == nil then nil else var2
end

return function(p1, p2) --[[ line: 43 | named "buildHomePageRequest" ]]
	-- upvalues: buildContextualFeatures (ref)
	local t = {}
	
	if p2 then
		if p2.sessionId and p2.sessionId ~= "" then
			t.session_id = p2.sessionId
		end
		t.contextual_features = buildContextualFeatures(p2)
		
		if p2.cachedRobloxComponentToTemplateId then
			t.cached_roblox_component_to_template_id = p2.cachedRobloxComponentToTemplateId
		end
		if p2.clientCapabilities then
			t.client_capabilities = p2.clientCapabilities
		end
	end
	return p1.HomePageRequest.new(t)
end