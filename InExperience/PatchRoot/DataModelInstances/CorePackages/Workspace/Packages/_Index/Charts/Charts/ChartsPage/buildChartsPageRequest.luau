local parent = script:FindFirstAncestor("Charts").Parent
local addSystemInfoToArgs = require(parent.DiscoveryUtils).AddSystemInfoToArgs
local buildSduiCollectionInfo = require(parent.SduiSharedUtilities).buildSduiCollectionInfo
local fFlagSduiChartsRequestPlaceholders = require(parent.SharedFlags).FFlagSduiChartsRequestPlaceholders
local uDim = UDim.new(1, 72)

return function(p0, p1) --[[ line: 34 | named "buildChartsPageRequest" ]]
	-- upvalues: addSystemInfoToArgs (ref), fFlagSduiChartsRequestPlaceholders (ref), buildSduiCollectionInfo (ref), uDim (ref)
	local t = {}
	local t_1 = {}
	addSystemInfoToArgs(t_1, { "maxMemory" })
	
	if t_1.maxMemory and t_1.maxMemory ~= "" then
		t.max_memory = t_1.maxMemory
	end
	if p1 then
		if p1.feedPageToken and p1.feedPageToken ~= "" then
			t.feed_page_token = p1.feedPageToken
		end
		if p1.sessionId and p1.sessionId ~= "" then
			t.session_id = p1.sessionId
		end
		if p1.entryPaginationKey and p1.entryPaginationKey ~= "" then
			t.entry_pagination_key = p1.entryPaginationKey
		end
		if p1.entryPageToken and p1.entryPageToken ~= "" then
			t.entry_page_token = p1.entryPageToken
		end
		if p1.pageType and p1.pageType ~= "" then
			t.page_type = p1.pageType
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
		end
		if fFlagSduiChartsRequestPlaceholders and p1.includePlaceholders then
			t.include_placeholders = true
		end
		if p1.hydrationStreamEnabled ~= nil then
			t.hydration_stream_enabled = p1.hydrationStreamEnabled
		end
		if p1.cachedRobloxComponentToTemplateId then
			t.cached_roblox_component_to_template_id = p1.cachedRobloxComponentToTemplateId
		end
		if p1.clientCapabilities then
			t.client_capabilities = p1.clientCapabilities
		end
		if p1.hydrationStreamEnabled then
			local var3 = buildSduiCollectionInfo("Small", uDim)
			t.collection_layout = p0.CollectionLayoutInfo.new({
				items_per_row = var3.items_per_row,
				rows_above_fold = var3.rows_above_fold
			})
		end
	end
	return p0.GetChartsPageRequest.new(t)
end