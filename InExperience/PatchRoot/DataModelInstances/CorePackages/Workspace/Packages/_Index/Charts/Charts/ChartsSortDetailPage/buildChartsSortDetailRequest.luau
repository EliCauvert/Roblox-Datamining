local addSystemInfoToArgs = require(script:FindFirstAncestor("Charts").Parent.DiscoveryUtils).AddSystemInfoToArgs

return function(p0, p1)
	-- upvalues: addSystemInfoToArgs (ref)
	local t = { sort_id = p1.sortId }
	local t_1 = {}
	addSystemInfoToArgs(t_1, { "maxMemory" })
	
	if t_1.maxMemory and t_1.maxMemory ~= "" then
		t.max_memory = t_1.maxMemory
	end
	if p1.contentPageToken and p1.contentPageToken ~= "" then
		t.content_page_token = p1.contentPageToken
	end
	if p1.sessionId and p1.sessionId ~= "" then
		t.session_id = p1.sessionId
	end
	local filterSelections = p1.filterSelections
	
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
	if p1.cachedRobloxComponentToTemplateId then
		t.cached_roblox_component_to_template_id = p1.cachedRobloxComponentToTemplateId
	end
	if p1.clientCapabilities then
		t.client_capabilities = p1.clientCapabilities
	end
	return p0.GetChartsSortDetailRequest.new(t)
end