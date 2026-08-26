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

return function(p2, p3)
	-- upvalues: chartsConstantsModule (ref), getSduiApiStore (ref), fFlagSduiChartsDedupSessionRotation (ref), chartsPageSessionModule (ref), fFlagChartsHydrationStreaming (ref), fFlagSduiChartsPostBody (ref), getChartsPageStreamUrlModule (ref), getChartsPagePostUrlModule (ref), parent (ref), sduiCapabilities (ref), buildChartsPageRequestModule (ref), getSduiClientPageScope (ref), chartsPageScopeFieldsModule (ref), fFlagEnableTopSongsSort (ref), getFStringTopSongsSortExploreApiPageType (ref), fFlagSduiChartsRequestPlaceholders (ref), getSduiTemplateStore (ref), appPage (ref), sduiResponseType (ref), fFlagSduiChartsPlaceholderMergeStrategySupport (ref), chartsMergeStrategyModule (ref), sduiApiStorePostConfigContentType (ref), fFlagSduiClientTemplateCache (ref), extractNextFeedPageToken (ref), getChartsPageUrlModule (ref)
	local var1
	local configKey = chartsConstantsModule.ConfigKey
	local var2 = getSduiApiStore()
	local _, data = var2.getData(configKey)
	local _ = nil
	
	if fFlagSduiChartsDedupSessionRotation then
		local var3
		if not p3 then
			var3 = data
			
			if var3 then
				var3 = not var2.isInFlight(configKey)
			end
			var1 = var3
		end
	else
		var1 = p3 or data
	end
	if var1 then
		chartsPageSessionModule:Refresh()
	end
	local var4
	local _ = nil
	
	if fFlagChartsHydrationStreaming or fFlagSduiChartsPostBody then
		local var5 = if fFlagChartsHydrationStreaming then getChartsPageStreamUrlModule() else getChartsPagePostUrlModule()
		local serviceContractsProtoModule = require(parent.ServiceContractsProto)
		local chartsPage = serviceContractsProtoModule.apppageplatform.charts.charts_page
		local var6 = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities.new({
			enabled_capabilities = sduiCapabilities.getEnabledCapabilityNumbers({ "CAPABILITY_SUPPORTS_HYDRATION_CLIENT_HINTS" })
		})
		
		local function buildBody(p4)
			-- upvalues: buildChartsPageRequestModule (copy), chartsPage (ref), chartsPageSessionModule (copy), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy), fFlagEnableTopSongsSort (copy), getFStringTopSongsSortExploreApiPageType (copy), fFlagSduiChartsRequestPlaceholders (copy), fFlagChartsHydrationStreaming (copy), getSduiTemplateStore (copy), appPage (copy), var6 (ref)
			return buildChartsPageRequestModule(chartsPage, {
				feedPageToken = p4,
				sessionId = chartsPageSessionModule:Get(),
				filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
				pageType = if fFlagEnableTopSongsSort then getFStringTopSongsSortExploreApiPageType() else nil,
				includePlaceholders = if fFlagSduiChartsRequestPlaceholders then true else nil,
				hydrationStreamEnabled = if fFlagChartsHydrationStreaming then true else nil,
				cachedRobloxComponentToTemplateId = getSduiTemplateStore().getCachedRobloxComponentToTemplateId(appPage.Games),
				clientCapabilities = var6
			})
		end
		
		var4 = var2.fetchIfNeeded({
			responseType = sduiResponseType.Protobuf,
			url = var5,
			surfaceKey = appPage.Games,
			configKey = configKey,
			loadTimer = p2,
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
				-- upvalues: extractNextFeedPageToken (copy), var5 (ref)
				return if extractNextFeedPageToken(p4) then var5 else nil
			end,
			buildNextPagePostBody = function(p4)
				-- upvalues: extractNextFeedPageToken (copy), buildBody (ref)
				local var7 = extractNextFeedPageToken(p4)
				
				return if var7 then buildBody(var7) else nil
			end,
			buildRefreshUrl = function()
				-- upvalues: fFlagSduiChartsDedupSessionRotation (copy), var2 (ref), configKey (ref), chartsPageSessionModule (copy), var5 (ref)
				if not fFlagSduiChartsDedupSessionRotation or not var2.isInFlight(configKey) then
					chartsPageSessionModule:Refresh()
				end
				return var5
			end,
			buildRefreshPostBody = function()
				-- upvalues: buildBody (ref)
				return buildBody(nil)
			end
		}, p3)
	else
		var4 = var2.fetchIfNeeded({
			responseType = sduiResponseType.Protobuf,
			url = getChartsPageUrlModule({
				sessionId = chartsPageSessionModule:Get(),
				filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
				pageType = if fFlagEnableTopSongsSort then getFStringTopSongsSortExploreApiPageType() else nil,
				includePlaceholders = if fFlagSduiChartsRequestPlaceholders then true else nil
			}),
			surfaceKey = appPage.Games,
			configKey = configKey,
			loadTimer = p2,
			apiProto = require(parent.ServiceContractsProto).apppageplatform.charts.charts_page.GetChartsPageResponse,
			mergeStrategy = if fFlagSduiChartsPlaceholderMergeStrategySupport then chartsMergeStrategyModule else nil,
			buildNextPageUrl = function(p4)
				-- upvalues: extractNextFeedPageToken (copy), getChartsPageUrlModule (copy), chartsPageSessionModule (copy), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy), fFlagEnableTopSongsSort (copy), getFStringTopSongsSortExploreApiPageType (copy), fFlagSduiChartsRequestPlaceholders (copy)
				local var7 = extractNextFeedPageToken(p4)
				
				return if var7 then getChartsPageUrlModule({
					feedPageToken = var7,
					sessionId = chartsPageSessionModule:Get(),
					filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
					pageType = if fFlagEnableTopSongsSort then getFStringTopSongsSortExploreApiPageType() else nil,
					includePlaceholders = if fFlagSduiChartsRequestPlaceholders then true else nil
				}) else nil
			end,
			buildRefreshUrl = function()
				-- upvalues: fFlagSduiChartsDedupSessionRotation (copy), var2 (ref), configKey (ref), chartsPageSessionModule (copy), getChartsPageUrlModule (copy), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy), fFlagEnableTopSongsSort (copy), getFStringTopSongsSortExploreApiPageType (copy), fFlagSduiChartsRequestPlaceholders (copy)
				if not fFlagSduiChartsDedupSessionRotation or not var2.isInFlight(configKey) then
					chartsPageSessionModule:Refresh()
				end
				return getChartsPageUrlModule({
					sessionId = chartsPageSessionModule:Get(),
					filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
					pageType = if fFlagEnableTopSongsSort then getFStringTopSongsSortExploreApiPageType() else nil,
					includePlaceholders = if fFlagSduiChartsRequestPlaceholders then true else nil
				})
			end
		}, p3)
	end
	return var4, configKey
end