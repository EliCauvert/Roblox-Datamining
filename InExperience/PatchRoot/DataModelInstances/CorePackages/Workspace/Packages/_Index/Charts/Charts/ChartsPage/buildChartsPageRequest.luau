local Charts = script:FindFirstAncestor("Charts")
local Parent = Charts.Parent
local AddSystemInfoToArgsFunction = require(Parent.DiscoveryUtils).AddSystemInfoToArgs
local BuildSduiCollectionInfoFunction = require(Parent.SduiSharedUtilities).buildSduiCollectionInfo
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiChartsRequestPlaceholders = SharedFlagsModule.FFlagSduiChartsRequestPlaceholders
local FFlagSduiPreferredTextSizeLineBudgets = SharedFlagsModule.FFlagSduiPreferredTextSizeLineBudgets
local FFlagSduiChartsAudienceFilterModule = require(Charts.Flags.FFlagSduiChartsAudienceFilter)
local _UDim = UDim.new(1, 72)

return function(p1, p2) --[[ Line: 36 | Named "buildChartsPageRequest" ]]
	-- upvalues: AddSystemInfoToArgsFunction (copy), FFlagSduiChartsAudienceFilterModule (copy), FFlagSduiChartsRequestPlaceholders (copy), BuildSduiCollectionInfoFunction (copy), _UDim (copy), FFlagSduiPreferredTextSizeLineBudgets (copy)
	local t = {}
	local t1 = {}
	AddSystemInfoToArgsFunction(t1, { "maxMemory" })
	
	if t1.maxMemory and t1.maxMemory ~= "" then
		t.max_memory = t1.maxMemory
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
		local FilterSelections = p2.filterSelections
		
		if FilterSelections then
			if FilterSelections.device and FilterSelections.device ~= "" then
				t.device = FilterSelections.device
			end
			if FilterSelections.country and FilterSelections.country ~= "" then
				t.country = FilterSelections.country
			end
			if FilterSelections.ageGroup and FilterSelections.ageGroup ~= "" then
				t.age_group = FilterSelections.ageGroup
			end
			if FFlagSduiChartsAudienceFilterModule and FilterSelections.audience and FilterSelections.audience ~= "" then
				t.audience = FilterSelections.audience
			end
		end
		if FFlagSduiChartsRequestPlaceholders and p2.includePlaceholders then
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
			local Small = BuildSduiCollectionInfoFunction("Small", _UDim, if FFlagSduiPreferredTextSizeLineBudgets then 3 else nil)
			t.collection_layout = p1.CollectionLayoutInfo.new({
				items_per_row = Small.items_per_row,
				rows_above_fold = Small.rows_above_fold
			})
		end
	end
	return p1.GetChartsPageRequest.new(t)
end