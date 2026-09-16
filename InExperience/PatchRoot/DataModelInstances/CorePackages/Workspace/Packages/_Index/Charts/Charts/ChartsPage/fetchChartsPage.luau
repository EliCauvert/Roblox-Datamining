local charts = script:FindFirstAncestor("Charts")
local parent = charts.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getSduiTemplateStore = sduiSharedUtilitiesModule.getSduiTemplateStore
local getSduiClientPageScope = sduiSharedUtilitiesModule.getSduiClientPageScope
local sduiApiStorePostConfigContentType = sduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local sduiCapabilities = sduiSharedUtilitiesModule.SduiCapabilities
local chartsPageSessionModule = require(charts.ChartsPage.ChartsPageSession)
local getChartsPageUrlModule = require(charts.ChartsPage.getChartsPageUrl)
local getChartsPagePostUrlModule = require(charts.ChartsPage.getChartsPagePostUrl)
local getChartsPageStreamUrlModule = require(charts.ChartsPage.getChartsPageStreamUrl)
local chartsConstantsModule = require(charts.ChartsPage.ChartsConstants)
local chartsPageScopeFieldsModule = require(charts.ChartsPage.ChartsPageScopeFields)
local chartsMergeStrategyModule = require(charts.ChartsPage.chartsMergeStrategy)
local buildChartsPageRequestModule = require(charts.ChartsPage.buildChartsPageRequest)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableTopSongsSort = sharedFlagsModule.FFlagEnableTopSongsSort
local getFStringTopSongsSortExploreApiPageType = sharedFlagsModule.GetFStringTopSongsSortExploreApiPageType
local fFlagSduiChartsRequestPlaceholders = sharedFlagsModule.FFlagSduiChartsRequestPlaceholders
local fFlagSduiChartsPlaceholderMergeStrategySupport = sharedFlagsModule.FFlagSduiChartsPlaceholderMergeStrategySupport
local fFlagChartsHydrationStreaming = sharedFlagsModule.FFlagChartsHydrationStreaming
local fFlagSduiChartsPostBody = sharedFlagsModule.FFlagSduiChartsPostBody
local fFlagSduiClientTemplateCache = sharedFlagsModule.FFlagSduiClientTemplateCache

local function _()
	-- upvalues: getSduiClientPageScope (ref), chartsConstantsModule (ref), chartsPageScopeFieldsModule (ref)
	return getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
end

local _ = function()
	-- upvalues: fFlagEnableTopSongsSort (ref), getFStringTopSongsSortExploreApiPageType (ref)
	return if fFlagEnableTopSongsSort then getFStringTopSongsSortExploreApiPageType() else nil
end

local function extractNextFeedPageToken(p1)
	local pageEntries = p1 and p1.page_entries
	
	if not pageEntries then
		return nil
	end
	for i, v in pageEntries do
		local pageEntry = v.page_entry
		
		if pageEntry and pageEntry.identifier == "charts_feed" then
			local inputData = v.input_data
			local kind = inputData and inputData.kind
			local value = kind and kind.value
			local nextPageToken = value and value.next_page_token
			
			if nextPageToken and nextPageToken ~= "" then
				return nextPageToken
			end
		end
	end
	return nil
end

return function(_, _)
	-- upvalues: chartsConstantsModule (ref), getSduiApiStore (ref), chartsPageSessionModule (ref), fFlagChartsHydrationStreaming (ref), fFlagSduiChartsPostBody (ref), getChartsPageStreamUrlModule (ref), getChartsPagePostUrlModule (ref), parent (ref), sduiCapabilities (ref), buildChartsPageRequestModule (ref), getSduiClientPageScope (ref), chartsPageScopeFieldsModule (ref), fFlagEnableTopSongsSort (ref), getFStringTopSongsSortExploreApiPageType (ref), fFlagSduiChartsRequestPlaceholders (ref), getSduiTemplateStore (ref), appPage (ref), sduiResponseType (ref), fFlagSduiChartsPlaceholderMergeStrategySupport (ref), chartsMergeStrategyModule (ref), sduiApiStorePostConfigContentType (ref), fFlagSduiClientTemplateCache (ref), extractNextFeedPageToken (ref), getChartsPageUrlModule (ref)
-- FATAL: Failed to generate AST for `fetchChartsPage` function:
runtime : [KeyError] :11990: 115
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end