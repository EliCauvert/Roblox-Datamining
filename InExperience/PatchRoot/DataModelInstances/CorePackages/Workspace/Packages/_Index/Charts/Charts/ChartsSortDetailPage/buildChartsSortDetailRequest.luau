local Charts = script:FindFirstAncestor("Charts")
local AddSystemInfoToArgsFunction = require(Charts.Parent.DiscoveryUtils).AddSystemInfoToArgs
local FFlagSduiChartsAudienceFilterModule = require(Charts.Flags.FFlagSduiChartsAudienceFilter)

return function(p1, p2) --[[ Line: 22 | Named "buildChartsSortDetailRequest" ]]
	-- upvalues: AddSystemInfoToArgsFunction (copy), FFlagSduiChartsAudienceFilterModule (copy)
	local config = { sort_id = p2.sortId }
	local t = {}
	AddSystemInfoToArgsFunction(t, { "maxMemory" })
	
	if t.maxMemory and t.maxMemory ~= "" then
		config.max_memory = t.maxMemory
	end
	if p2.contentPageToken and p2.contentPageToken ~= "" then
		config.content_page_token = p2.contentPageToken
	end
	if p2.sessionId and p2.sessionId ~= "" then
		config.session_id = p2.sessionId
	end
	local FilterSelections = p2.filterSelections
	
	if FilterSelections then
		if FilterSelections.device and FilterSelections.device ~= "" then
			config.device = FilterSelections.device
		end
		if FilterSelections.country and FilterSelections.country ~= "" then
			config.country = FilterSelections.country
		end
		if FilterSelections.ageGroup and FilterSelections.ageGroup ~= "" then
			config.age_group = FilterSelections.ageGroup
		end
		if FilterSelections.selectedGenre and FilterSelections.selectedGenre ~= "" then
			config.selected_genre = FilterSelections.selectedGenre
		end
		if FFlagSduiChartsAudienceFilterModule and FilterSelections.audience and FilterSelections.audience ~= "" then
			config.audience = FilterSelections.audience
		end
	end
	if p2.cachedRobloxComponentToTemplateId then
		config.cached_roblox_component_to_template_id = p2.cachedRobloxComponentToTemplateId
	end
	if p2.clientCapabilities then
		config.client_capabilities = p2.clientCapabilities
	end
	return p1.GetChartsSortDetailRequest.new(config)
end