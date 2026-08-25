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
local fFlagSduiChartsDedupSessionRotation = sharedFlagsModule.FFlagSduiChartsDedupSessionRotation
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

local function extractNextFeedPageToken(p0)
	local pageEntries = p0 and p0.page_entries
	
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

return function(p1, p2)
	-- upvalues: chartsConstantsModule (ref), getSduiApiStore (ref), fFlagSduiChartsDedupSessionRotation (ref), chartsPageSessionModule (ref), fFlagChartsHydrationStreaming (ref), fFlagSduiChartsPostBody (ref), getChartsPageStreamUrlModule (ref), getChartsPagePostUrlModule (ref), parent (ref), sduiCapabilities (ref), buildChartsPageRequestModule (ref), getSduiClientPageScope (ref), chartsPageScopeFieldsModule (ref), fFlagEnableTopSongsSort (ref), getFStringTopSongsSortExploreApiPageType (ref), fFlagSduiChartsRequestPlaceholders (ref), getSduiTemplateStore (ref), appPage (ref), sduiResponseType (ref), fFlagSduiChartsPlaceholderMergeStrategySupport (ref), chartsMergeStrategyModule (ref), sduiApiStorePostConfigContentType (ref), fFlagSduiClientTemplateCache (ref), extractNextFeedPageToken (ref), getChartsPageUrlModule (ref)
	local var19
	local configKey = chartsConstantsModule.ConfigKey
	local var16 = getSduiApiStore()
	local _, data = var16.getData(configKey)
	local _ = nil
	
	if fFlagSduiChartsDedupSessionRotation then
		local var18
		if not p2 then
			var18 = data
			
			if var18 then
				var18 = not var16.isInFlight(configKey)
			end
			var19 = var18
		end
	else
		var19 = p2 or data
	end
	if var19 then
		chartsPageSessionModule:Refresh()
	end
	local var20
	local _ = nil
	
	if fFlagChartsHydrationStreaming or fFlagSduiChartsPostBody then
		local var21 = if fFlagChartsHydrationStreaming then getChartsPageStreamUrlModule() else getChartsPagePostUrlModule()
		local serviceContractsProtoModule = require(parent.ServiceContractsProto)
		local chartsPage = serviceContractsProtoModule.apppageplatform.charts.charts_page
		local var23 = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities.new({
			enabled_capabilities = sduiCapabilities.getEnabledCapabilityNumbers({ "CAPABILITY_SUPPORTS_HYDRATION_CLIENT_HINTS" })
		})
		
		local function buildBody(p3)
			-- upvalues: buildChartsPageRequestModule (copy), chartsPage (ref), chartsPageSessionModule (copy), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy), fFlagEnableTopSongsSort (copy), getFStringTopSongsSortExploreApiPageType (copy), fFlagSduiChartsRequestPlaceholders (copy), fFlagChartsHydrationStreaming (copy), getSduiTemplateStore (copy), appPage (copy), var23 (ref)
			return buildChartsPageRequestModule(chartsPage, {
				feedPageToken = p3,
				sessionId = chartsPageSessionModule:Get(),
				filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
				pageType = if fFlagEnableTopSongsSort then getFStringTopSongsSortExploreApiPageType() else nil,
				includePlaceholders = if fFlagSduiChartsRequestPlaceholders then true else nil,
				hydrationStreamEnabled = if fFlagChartsHydrationStreaming then true else nil,
				cachedRobloxComponentToTemplateId = getSduiTemplateStore().getCachedRobloxComponentToTemplateId(appPage.Games),
				clientCapabilities = var23
			})
		end
		
		var20 = var16.fetchIfNeeded({
			responseType = sduiResponseType.Protobuf,
			url = var21,
			surfaceKey = appPage.Games,
			configKey = configKey,
			loadTimer = p1,
			apiProto = chartsPage.GetChartsPageResponse,
			mergeStrategy = if fFlagSduiChartsPlaceholderMergeStrategySupport then chartsMergeStrategyModule else nil,
			postConfig = {
				contentType = sduiApiStorePostConfigContentType.Proto,
				protoMessage = chartsPage.GetChartsPageRequest,
				body = buildBody(nil)
			},
			enableTemplateCache = if fFlagSduiClientTemplateCache then true else nil,
			enableStreaming = if fFlagChartsHydrationStreaming then true else nil,
			allowNoConfigsBuilt = if fFlagChartsHydrationStreaming then true else nil,
			buildNextPageUrl = function(p4)
				-- upvalues: extractNextFeedPageToken (copy), var21 (ref)
				return if extractNextFeedPageToken(p4) then var21 else nil
			end,
			buildNextPagePostBody = function(p5)
				-- upvalues: extractNextFeedPageToken (copy), buildBody (ref)
				local var25 = extractNextFeedPageToken(p5)
				
				return if var25 then buildBody(var25) else nil
			end,
			buildRefreshUrl = function()
				-- upvalues: fFlagSduiChartsDedupSessionRotation (copy), var16 (ref), configKey (ref), chartsPageSessionModule (copy), var21 (ref)
				if not fFlagSduiChartsDedupSessionRotation or not var16.isInFlight(configKey) then
					chartsPageSessionModule:Refresh()
				end
				return var21
			end,
			buildRefreshPostBody = function()
				-- upvalues: buildBody (ref)
				return buildBody(nil)
			end
		}, p2)
	else
		var20 = var16.fetchIfNeeded({
			responseType = sduiResponseType.Protobuf,
			url = getChartsPageUrlModule({
				sessionId = chartsPageSessionModule:Get(),
				filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
				pageType = if fFlagEnableTopSongsSort then getFStringTopSongsSortExploreApiPageType() else nil,
				includePlaceholders = if fFlagSduiChartsRequestPlaceholders then true else nil
			}),
			surfaceKey = appPage.Games,
			configKey = configKey,
			loadTimer = p1,
			apiProto = require(parent.ServiceContractsProto).apppageplatform.charts.charts_page.GetChartsPageResponse,
			mergeStrategy = if fFlagSduiChartsPlaceholderMergeStrategySupport then chartsMergeStrategyModule else nil,
			buildNextPageUrl = function(p6)
				-- upvalues: extractNextFeedPageToken (copy), getChartsPageUrlModule (copy), chartsPageSessionModule (copy), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy), fFlagEnableTopSongsSort (copy), getFStringTopSongsSortExploreApiPageType (copy), fFlagSduiChartsRequestPlaceholders (copy)
				local var26 = extractNextFeedPageToken(p6)
				
				return if var26 then getChartsPageUrlModule({
					feedPageToken = var26,
					sessionId = chartsPageSessionModule:Get(),
					filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
					pageType = if fFlagEnableTopSongsSort then getFStringTopSongsSortExploreApiPageType() else nil,
					includePlaceholders = if fFlagSduiChartsRequestPlaceholders then true else nil
				}) else nil
			end,
			buildRefreshUrl = function()
				-- upvalues: fFlagSduiChartsDedupSessionRotation (copy), var16 (ref), configKey (ref), chartsPageSessionModule (copy), getChartsPageUrlModule (copy), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy), fFlagEnableTopSongsSort (copy), getFStringTopSongsSortExploreApiPageType (copy), fFlagSduiChartsRequestPlaceholders (copy)
				if not fFlagSduiChartsDedupSessionRotation or not var16.isInFlight(configKey) then
					chartsPageSessionModule:Refresh()
				end
				return getChartsPageUrlModule({
					sessionId = chartsPageSessionModule:Get(),
					filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
					pageType = if fFlagEnableTopSongsSort then getFStringTopSongsSortExploreApiPageType() else nil,
					includePlaceholders = if fFlagSduiChartsRequestPlaceholders then true else nil
				})
			end
		}, p2)
	end
	return var20, configKey
end