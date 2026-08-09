local charts = script:FindFirstAncestor("Charts")
local parent = charts.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableTopSongsSort = sharedFlagsModule.FFlagEnableTopSongsSort
local getFStringTopSongsSortExploreApiPageType = sharedFlagsModule.GetFStringTopSongsSortExploreApiPageType
local fFlagSduiChartsRequestPlaceholders = sharedFlagsModule.FFlagSduiChartsRequestPlaceholders
local fFlagSduiChartsPlaceholderMergeStrategySupport = sharedFlagsModule.FFlagSduiChartsPlaceholderMergeStrategySupport
local fFlagSduiChartsDedupSessionRotation = sharedFlagsModule.FFlagSduiChartsDedupSessionRotation
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getSduiClientPageScope = sduiSharedUtilitiesModule.getSduiClientPageScope
local chartsPageSessionModule = require(charts.ChartsPage.ChartsPageSession)
local getChartsPageUrlModule = require(charts.ChartsPage.getChartsPageUrl)
local chartsConstantsModule = require(charts.ChartsPage.ChartsConstants)
local chartsPageScopeFieldsModule = require(charts.ChartsPage.ChartsPageScopeFields)
local chartsMergeStrategyModule = require(charts.ChartsPage.chartsMergeStrategy)

local function _() --[[ line: 24 | named "getCurrentFilterSelections" ]]
	-- upvalues: getSduiClientPageScope (ref), chartsConstantsModule (ref), chartsPageScopeFieldsModule (ref)
	return getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
end

local _ = function() --[[ line: 28 | named "getCurrentPageType" ]]
	-- upvalues: fFlagEnableTopSongsSort (ref), getFStringTopSongsSortExploreApiPageType (ref)
	return if fFlagEnableTopSongsSort then getFStringTopSongsSortExploreApiPageType() else nil
end

return function(p0, p1) --[[ line: 32 | named "fetchChartsPage" ]]
	-- upvalues: chartsConstantsModule (ref), getSduiApiStore (ref), fFlagSduiChartsDedupSessionRotation (ref), chartsPageSessionModule (ref), getChartsPageUrlModule (ref), getSduiClientPageScope (ref), chartsPageScopeFieldsModule (ref), fFlagEnableTopSongsSort (ref), getFStringTopSongsSortExploreApiPageType (ref), fFlagSduiChartsRequestPlaceholders (ref), parent (ref), sduiResponseType (ref), appPage (ref), fFlagSduiChartsPlaceholderMergeStrategySupport (ref), chartsMergeStrategyModule (ref)
	local var11
	local configKey = chartsConstantsModule.ConfigKey
	local var8 = getSduiApiStore()
	local _, data = var8.getData(configKey)
	local _ = nil
	
	if fFlagSduiChartsDedupSessionRotation then
		local var10
		if not p1 then
			var10 = data
			
			if var10 then
				var10 = not var8.isInFlight(configKey)
			end
			var11 = var10
		end
	else
		var11 = p1 or data
	end
	if var11 then
		chartsPageSessionModule:Refresh()
	end
	return var8.fetchIfNeeded({
		responseType = sduiResponseType.Protobuf,
		url = getChartsPageUrlModule({
			sessionId = chartsPageSessionModule:Get(),
			filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
			pageType = if fFlagEnableTopSongsSort then getFStringTopSongsSortExploreApiPageType() else nil,
			includePlaceholders = if fFlagSduiChartsRequestPlaceholders then true else nil
		}),
		surfaceKey = appPage.Games,
		configKey = configKey,
		loadTimer = p0,
		apiProto = require(parent.ServiceContractsProto).apppageplatform.charts.charts_page.GetChartsPageResponse,
		mergeStrategy = if fFlagSduiChartsPlaceholderMergeStrategySupport then chartsMergeStrategyModule else nil,
		buildNextPageUrl = function(p2) --[[ line: 70 ]]
			-- upvalues: getChartsPageUrlModule (copy), chartsPageSessionModule (copy), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy), fFlagEnableTopSongsSort (copy), getFStringTopSongsSortExploreApiPageType (copy), fFlagSduiChartsRequestPlaceholders (copy)
			local pageEntries = p2 and p2.page_entries
			
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
						return getChartsPageUrlModule({
							feedPageToken = nextPageToken,
							sessionId = chartsPageSessionModule:Get(),
							filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
							pageType = if fFlagEnableTopSongsSort then getFStringTopSongsSortExploreApiPageType() else nil,
							includePlaceholders = if fFlagSduiChartsRequestPlaceholders then true else nil
						})
					end
				end
			end
			return nil
		end,
		buildRefreshUrl = function() --[[ line: 95 ]]
			-- upvalues: fFlagSduiChartsDedupSessionRotation (copy), var8 (ref), configKey (ref), chartsPageSessionModule (copy), getChartsPageUrlModule (copy), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy), fFlagEnableTopSongsSort (copy), getFStringTopSongsSortExploreApiPageType (copy), fFlagSduiChartsRequestPlaceholders (copy)
			if not fFlagSduiChartsDedupSessionRotation or not var8.isInFlight(configKey) then
				chartsPageSessionModule:Refresh()
			end
			return getChartsPageUrlModule({
				sessionId = chartsPageSessionModule:Get(),
				filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
				pageType = if fFlagEnableTopSongsSort then getFStringTopSongsSortExploreApiPageType() else nil,
				includePlaceholders = if fFlagSduiChartsRequestPlaceholders then true else nil
			})
		end
	}, p1), configKey
end