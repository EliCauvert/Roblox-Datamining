local parent = script:FindFirstAncestor("Charts").Parent
local addSystemInfoToArgs = require(parent.DiscoveryUtils).AddSystemInfoToArgs
local buildSduiCollectionInfo = require(parent.SduiSharedUtilities).buildSduiCollectionInfo
local fFlagSduiChartsRequestPlaceholders = require(parent.SharedFlags).FFlagSduiChartsRequestPlaceholders
local uDim = UDim.new(1, 72)

return function(p1, p2)
	-- upvalues: addSystemInfoToArgs (ref), fFlagSduiChartsRequestPlaceholders (ref), buildSduiCollectionInfo (ref), uDim (ref)
	local t = {}
	local t_1 = {}
	addSystemInfoToArgs(t_1, { "maxMemory" })
	
	if t_1.maxMemory and t_1.maxMemory ~= "" then
		t.max_memory = t_1.maxMemory
	end
	if p2 then
		if p2.feedPageToken and p2.feedPageToken ~= "" then
			t.feed_page_token = p2.feedPageToken
		end
		if p2.sessionId and p2.sessionId ~= "" then
			t.session_id = p2.sessionId
		end
		if p2.entryPaginationKey and p2.entryPaginationKey ~= "" then
			t.entry_pagination_key = p2.entryPaginationKey
		end
		if p2.entryPageToken and p2.entryPageToken ~= "" then
			t.entry_page_token = p2.entryPageToken
		end
		if p2.pageType and p2.pageType ~= "" then
			t.page_type = p2.pageType
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
		end
		if fFlagSduiChartsRequestPlaceholders and p2.includePlaceholders then
			t.include_placeholders = true
		end
		if p2.hydrationStreamEnabled ~= nil then
			t.hydration_stream_enabled = p2.hydrationStreamEnabled
		end
		if p2.cachedRobloxComponentToTemplateId then
			t.cached_roblox_component_to_template_id = p2.cachedRobloxComponentToTemplateId
		end
		if p2.clientCapabilities then
			t.client_capabilities = p2.clientCapabilities
		end
		if p2.hydrationStreamEnabled then
			local var1 = buildSduiCollectionInfo("Small", uDim)
			t.collection_layout = p1.CollectionLayoutInfo.new({
				items_per_row = var1.items_per_row,
				rows_above_fold = var1.rows_above_fold
			})
		end
	end
	return p1.GetChartsPageRequest.new(t)
end