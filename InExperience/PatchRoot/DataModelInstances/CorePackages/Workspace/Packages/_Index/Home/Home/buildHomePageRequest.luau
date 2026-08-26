local buildHomeSystemContextFeaturesModule = require(script:FindFirstAncestor("Home").buildHomeSystemContextFeatures)

local function buildContextualFeatures(p1)
	-- upvalues: buildHomeSystemContextFeaturesModule (ref)
	local var1 = buildHomeSystemContextFeaturesModule()
	
	if typeof(p1.contextualFeatures) == "table" then
		for i, v in p1.contextualFeatures do
			if typeof(i) == "string" and v ~= nil then
				var1[i] = tostring(v)
			end
		end
	end
	if p1.requestIntent and p1.requestIntent ~= "" then
		var1.request_intent = p1.requestIntent
	end
	return if next(var1) == nil then nil else var1
end

return function(p2, p3)
	-- upvalues: buildContextualFeatures (ref)
	local t = {}
	
	if p3 then
		if p3.sessionId and p3.sessionId ~= "" then
			t.session_id = p3.sessionId
		end
		t.contextual_features = buildContextualFeatures(p3)
		
		if p3.cachedRobloxComponentToTemplateId then
			t.cached_roblox_component_to_template_id = p3.cachedRobloxComponentToTemplateId
		end
		if p3.clientCapabilities then
			t.client_capabilities = p3.clientCapabilities
		end
		if p3.collectionLayout then
			t.collection_layout = p2.HomeCollectionLayoutInfo.new({
				items_per_row = p3.collectionLayout.items_per_row,
				rows_above_fold = p3.collectionLayout.rows_above_fold
			})
		end
	end
	return p2.HomePageRequest.new(t)
end