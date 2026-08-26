local addSystemInfoToArgs = require(script:FindFirstAncestor("Charts").Parent.DiscoveryUtils).AddSystemInfoToArgs

return function(p1, p2)
	-- upvalues: addSystemInfoToArgs (ref)
	local t = { sort_id = p2.sortId }
	local t_1 = {}
	addSystemInfoToArgs(t_1, { "maxMemory" })
	
	if t_1.maxMemory and t_1.maxMemory ~= "" then
		t.max_memory = t_1.maxMemory
	end
	if p2.contentPageToken and p2.contentPageToken ~= "" then
		t.content_page_token = p2.contentPageToken
	end
	if p2.sessionId and p2.sessionId ~= "" then
		t.session_id = p2.sessionId
	end
	local filterSelections = p2.filterSelections
	
	if filterSelections then
		if filterSelections.device and filterSelections.device ~= "" then
			t.device = filterSelections.device
		end
		if filterSelections.country and filterSelections.country ~= "" then
			t.country = filterSelections.country
		end
		if filterSelections.ageGroup and filterSelections.ageGroup ~= "" then
			t.age_group = filterSelections.ageGroup
		end
		if filterSelections.selectedGenre and filterSelections.selectedGenre ~= "" then
			t.selected_genre = filterSelections.selectedGenre
		end
	end
	if p2.cachedRobloxComponentToTemplateId then
		t.cached_roblox_component_to_template_id = p2.cachedRobloxComponentToTemplateId
	end
	if p2.clientCapabilities then
		t.client_capabilities = p2.clientCapabilities
	end
	return p1.GetChartsSortDetailRequest.new(t)
end