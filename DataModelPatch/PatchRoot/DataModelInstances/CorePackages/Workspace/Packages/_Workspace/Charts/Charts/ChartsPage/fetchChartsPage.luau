local Charts = script:FindFirstAncestor("Charts")
local Parent = Charts.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableTopSongsSort = SharedFlagsModule.FFlagEnableTopSongsSort
local GetFStringTopSongsSortExploreApiPageTypeFunction = SharedFlagsModule.GetFStringTopSongsSortExploreApiPageType
local FFlagSduiChartsRequestPlaceholders = SharedFlagsModule.FFlagSduiChartsRequestPlaceholders
local FFlagSduiChartsPlaceholderMergeStrategySupport = SharedFlagsModule.FFlagSduiChartsPlaceholderMergeStrategySupport
local FFlagSduiChartsDedupSessionRotation = SharedFlagsModule.FFlagSduiChartsDedupSessionRotation
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetSduiClientPageScopeFunction = SduiSharedUtilitiesModule.getSduiClientPageScope
local ChartsPageSessionModule = require(Charts.ChartsPage.ChartsPageSession)
local GetChartsPageUrlModule = require(Charts.ChartsPage.getChartsPageUrl)
local ChartsConstantsModule = require(Charts.ChartsPage.ChartsConstants)
local ChartsPageScopeFieldsModule = require(Charts.ChartsPage.ChartsPageScopeFields)
local ChartsMergeStrategyModule = require(Charts.ChartsPage.chartsMergeStrategy)

local function _()
	-- upvalues: GetSduiClientPageScopeFunction (copy), ChartsConstantsModule (copy), ChartsPageScopeFieldsModule (copy)
	return GetSduiClientPageScopeFunction(ChartsConstantsModule.ConfigKey).get(ChartsPageScopeFieldsModule.FilterSelections)
end

local _ = function()
	-- upvalues: FFlagEnableTopSongsSort (copy), GetFStringTopSongsSortExploreApiPageTypeFunction (copy)
	return if FFlagEnableTopSongsSort then GetFStringTopSongsSortExploreApiPageTypeFunction() else nil
end

return function(LoadTimer, p1)
	-- upvalues: ChartsConstantsModule (copy), GetSduiApiStoreFunction (copy), FFlagSduiChartsDedupSessionRotation (copy), ChartsPageSessionModule (copy), GetChartsPageUrlModule (copy), GetSduiClientPageScopeFunction (copy), ChartsPageScopeFieldsModule (copy), FFlagEnableTopSongsSort (copy), GetFStringTopSongsSortExploreApiPageTypeFunction (copy), FFlagSduiChartsRequestPlaceholders (copy), Parent (copy), SduiResponseType (copy), AppPage (copy), FFlagSduiChartsPlaceholderMergeStrategySupport (copy), ChartsMergeStrategyModule (copy)
	local ConfigKey = ChartsConstantsModule.ConfigKey
	local SduiApiStore = GetSduiApiStoreFunction()
	local _, Data2 = SduiApiStore.getData(ConfigKey)
	
	if if FFlagSduiChartsDedupSessionRotation then if p1 then not SduiApiStore.isInFlight(ConfigKey) else Data2 and not SduiApiStore.isInFlight(ConfigKey) else p1 or Data2 then
		ChartsPageSessionModule:Refresh()
	end
	return SduiApiStore.fetchIfNeeded({
		responseType = SduiResponseType.Protobuf,
		url = GetChartsPageUrlModule({
			sessionId = ChartsPageSessionModule:Get(),
			filterSelections = GetSduiClientPageScopeFunction(ChartsConstantsModule.ConfigKey).get(ChartsPageScopeFieldsModule.FilterSelections),
			pageType = if FFlagEnableTopSongsSort then GetFStringTopSongsSortExploreApiPageTypeFunction() else nil,
			includePlaceholders = if FFlagSduiChartsRequestPlaceholders then true else nil
		}),
		surfaceKey = AppPage.Games,
		configKey = ConfigKey,
		loadTimer = LoadTimer,
		apiProto = require(Parent.ServiceContractsProto).apppageplatform.charts.charts_page.GetChartsPageResponse,
		mergeStrategy = if FFlagSduiChartsPlaceholderMergeStrategySupport then ChartsMergeStrategyModule else nil,
		buildNextPageUrl = function(p2)
			-- upvalues: GetChartsPageUrlModule (upval), ChartsPageSessionModule (upval), GetSduiClientPageScopeFunction (upval), ChartsConstantsModule (upval), ChartsPageScopeFieldsModule (upval), FFlagEnableTopSongsSort (upval), GetFStringTopSongsSortExploreApiPageTypeFunction (upval), FFlagSduiChartsRequestPlaceholders (upval)
			local PageEntries = p2 and p2.page_entries
			
			if not PageEntries then
				return nil
			end
			local NextPageToken = nil
			for _, pageEntry in PageEntries do
				local PageEntry = pageEntry.page_entry
				
				if PageEntry and PageEntry.identifier == "charts_feed" then
					local InputData = pageEntry.input_data
					local Kind = InputData and InputData.kind
					local Value = Kind and Kind.value
					NextPageToken = Value and Value.next_page_token
					
					if NextPageToken and NextPageToken ~= "" then
						return GetChartsPageUrlModule({
							feedPageToken = NextPageToken,
							sessionId = ChartsPageSessionModule:Get(),
							filterSelections = GetSduiClientPageScopeFunction(ChartsConstantsModule.ConfigKey).get(ChartsPageScopeFieldsModule.FilterSelections),
							pageType = if FFlagEnableTopSongsSort then GetFStringTopSongsSortExploreApiPageTypeFunction() else nil,
							includePlaceholders = if FFlagSduiChartsRequestPlaceholders then true else nil
						})
					end
				end
			end
			return nil
		end,
		buildRefreshUrl = function()
			-- upvalues: FFlagSduiChartsDedupSessionRotation (upval), SduiApiStore (copy), ConfigKey (copy), ChartsPageSessionModule (upval), GetChartsPageUrlModule (upval), GetSduiClientPageScopeFunction (upval), ChartsConstantsModule (upval), ChartsPageScopeFieldsModule (upval), FFlagEnableTopSongsSort (upval), GetFStringTopSongsSortExploreApiPageTypeFunction (upval), FFlagSduiChartsRequestPlaceholders (upval)
			if not FFlagSduiChartsDedupSessionRotation or not SduiApiStore.isInFlight(ConfigKey) then
				ChartsPageSessionModule:Refresh()
			end
			return GetChartsPageUrlModule({
				sessionId = ChartsPageSessionModule:Get(),
				filterSelections = GetSduiClientPageScopeFunction(ChartsConstantsModule.ConfigKey).get(ChartsPageScopeFieldsModule.FilterSelections),
				pageType = if FFlagEnableTopSongsSort then GetFStringTopSongsSortExploreApiPageTypeFunction() else nil,
				includePlaceholders = if FFlagSduiChartsRequestPlaceholders then true else nil
			})
		end
	}, p1), ConfigKey
end