local BuildHomeSystemContextFeaturesModule = require(script:FindFirstAncestor("Home").buildHomeSystemContextFeatures)

local function buildContextualFeatures(p1) --[[ Line: 25 ]]
	-- upvalues: BuildHomeSystemContextFeaturesModule (copy)
	local HomeSystemContextFeaturesModule = BuildHomeSystemContextFeaturesModule()
	
	if typeof(p1.contextualFeatures) == "table" then
		for i, contextualFeature in p1.contextualFeatures do
			if typeof(i) == "string" and contextualFeature ~= nil then
				HomeSystemContextFeaturesModule[i] = tostring(contextualFeature)
			end
		end
	end
	if p1.requestIntent and p1.requestIntent ~= "" then
		HomeSystemContextFeaturesModule.request_intent = p1.requestIntent
	end
	return if next(HomeSystemContextFeaturesModule) == nil then nil else HomeSystemContextFeaturesModule
end

return function(p2, p3) --[[ Line: 46 | Named "buildHomePageRequest" ]]
	-- upvalues: buildContextualFeatures (copy)
	local t = {}
	
	if p3 then
		if p3.sessionId and p3.sessionId ~= "" then
			t.session_id = p3.sessionId
		end
		t.topic_ids = p3.topicIds
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