local Charts = script:FindFirstAncestor("Charts")
local Parent = Charts.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetSduiTemplateStoreFunction = SduiSharedUtilitiesModule.getSduiTemplateStore
local GetSduiClientPageScopeFunction = SduiSharedUtilitiesModule.getSduiClientPageScope
local SduiApiStorePostConfigContentType = SduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local SduiCapabilities = SduiSharedUtilitiesModule.SduiCapabilities
local ChartsPageSessionModule = require(Charts.ChartsPage.ChartsPageSession)
local GetChartsPagePostUrlModule = require(Charts.ChartsPage.getChartsPagePostUrl)
local GetChartsPageStreamUrlModule = require(Charts.ChartsPage.getChartsPageStreamUrl)
local ChartsConstantsModule = require(Charts.ChartsPage.ChartsConstants)
local ChartsPageScopeFieldsModule = require(Charts.ChartsPage.ChartsPageScopeFields)
local ChartsMergeStrategyModule = require(Charts.ChartsPage.chartsMergeStrategy)
local BuildChartsPageRequestModule = require(Charts.ChartsPage.buildChartsPageRequest)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableTopSongsSort = SharedFlagsModule.FFlagEnableTopSongsSort
local GetFStringTopSongsSortExploreApiPageTypeFunction = SharedFlagsModule.GetFStringTopSongsSortExploreApiPageType
local FFlagSduiChartsRequestPlaceholders = SharedFlagsModule.FFlagSduiChartsRequestPlaceholders
local FFlagSduiChartsPlaceholderMergeStrategySupport = SharedFlagsModule.FFlagSduiChartsPlaceholderMergeStrategySupport
local FFlagChartsHydrationStreaming = SharedFlagsModule.FFlagChartsHydrationStreaming
local FFlagSduiAdvertiseRuntimeSupportSets = SharedFlagsModule.FFlagSduiAdvertiseRuntimeSupportSets

local function _()
	-- upvalues: GetSduiClientPageScopeFunction (copy), ChartsConstantsModule (copy), ChartsPageScopeFieldsModule (copy)
	return GetSduiClientPageScopeFunction(ChartsConstantsModule.ConfigKey).get(ChartsPageScopeFieldsModule.FilterSelections)
end

local _ = function()
	-- upvalues: FFlagEnableTopSongsSort (copy), GetFStringTopSongsSortExploreApiPageTypeFunction (copy)
	return if FFlagEnableTopSongsSort then GetFStringTopSongsSortExploreApiPageTypeFunction() else nil
end

local function extractNextFeedPageToken(p1)
	local PageEntries = p1 and p1.page_entries
	
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
				return NextPageToken
			end
		end
	end
	return nil
end

return function(LoadTimer, p2)
	-- upvalues: ChartsConstantsModule (copy), GetSduiApiStoreFunction (copy), ChartsPageSessionModule (copy), FFlagChartsHydrationStreaming (copy), GetChartsPageStreamUrlModule (copy), GetChartsPagePostUrlModule (copy), Parent (copy), FFlagSduiAdvertiseRuntimeSupportSets (copy), SduiCapabilities (copy), BuildChartsPageRequestModule (copy), GetSduiClientPageScopeFunction (copy), ChartsPageScopeFieldsModule (copy), FFlagEnableTopSongsSort (copy), GetFStringTopSongsSortExploreApiPageTypeFunction (copy), FFlagSduiChartsRequestPlaceholders (copy), GetSduiTemplateStoreFunction (copy), AppPage (copy), SduiResponseType (copy), FFlagSduiChartsPlaceholderMergeStrategySupport (copy), ChartsMergeStrategyModule (copy), SduiApiStorePostConfigContentType (copy), extractNextFeedPageToken (copy)
	local ConfigKey = ChartsConstantsModule.ConfigKey
	local SduiApiStore = GetSduiApiStoreFunction()
	local _, Data2 = SduiApiStore.getData(ConfigKey)
	
	if if p2 then not SduiApiStore.isInFlight(ConfigKey) else Data2 and not SduiApiStore.isInFlight(ConfigKey) then
		ChartsPageSessionModule:Refresh()
	end
	local ChartsPageStreamUrlModule = if FFlagChartsHydrationStreaming then GetChartsPageStreamUrlModule() else GetChartsPagePostUrlModule()
	local ServiceContractsProtoModule = require(Parent.ServiceContractsProto)
	local ChartsPage = ServiceContractsProtoModule.apppageplatform.charts.charts_page
	local ClientCapabilities = ServiceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities
	local ClientCapabilities1 = nil
	ClientCapabilities1 = if FFlagSduiAdvertiseRuntimeSupportSets then SduiCapabilities.buildClientCapabilities() else ClientCapabilities.new({
		enabled_capabilities = SduiCapabilities.getEnabledCapabilityNumbers({ "CAPABILITY_SUPPORTS_HYDRATION_CLIENT_HINTS" })
	})
	
	local function buildBody(FeedPageToken)
		-- upvalues: BuildChartsPageRequestModule (upval), ChartsPage (copy), ChartsPageSessionModule (upval), GetSduiClientPageScopeFunction (upval), ChartsConstantsModule (upval), ChartsPageScopeFieldsModule (upval), FFlagEnableTopSongsSort (upval), GetFStringTopSongsSortExploreApiPageTypeFunction (upval), FFlagSduiChartsRequestPlaceholders (upval), FFlagChartsHydrationStreaming (upval), GetSduiTemplateStoreFunction (upval), AppPage (upval), ClientCapabilities1 (ref)
		return BuildChartsPageRequestModule(ChartsPage, {
			feedPageToken = FeedPageToken,
			sessionId = ChartsPageSessionModule:Get(),
			filterSelections = GetSduiClientPageScopeFunction(ChartsConstantsModule.ConfigKey).get(ChartsPageScopeFieldsModule.FilterSelections),
			pageType = if FFlagEnableTopSongsSort then GetFStringTopSongsSortExploreApiPageTypeFunction() else nil,
			includePlaceholders = if FFlagSduiChartsRequestPlaceholders then true else nil,
			hydrationStreamEnabled = if FFlagChartsHydrationStreaming then true else nil,
			cachedRobloxComponentToTemplateId = GetSduiTemplateStoreFunction().getCachedRobloxComponentToTemplateId(AppPage.Games),
			clientCapabilities = ClientCapabilities1
		})
	end
	
	return SduiApiStore.fetchIfNeeded({
		enableTemplateCache = true,
		responseType = SduiResponseType.Protobuf,
		url = ChartsPageStreamUrlModule,
		surfaceKey = AppPage.Games,
		configKey = ConfigKey,
		loadTimer = LoadTimer,
		apiProto = ChartsPage.GetChartsPageResponse,
		mergeStrategy = if FFlagSduiChartsPlaceholderMergeStrategySupport then ChartsMergeStrategyModule else nil,
		postConfig = {
			contentType = SduiApiStorePostConfigContentType.Proto,
			protoMessage = ChartsPage.GetChartsPageRequest,
			body = buildBody(nil)
		},
		enableStreaming = if FFlagChartsHydrationStreaming then true else nil,
		allowNoConfigsBuilt = if FFlagChartsHydrationStreaming then true else nil,
		buildNextPageUrl = function(p3)
			-- upvalues: extractNextFeedPageToken (upval), ChartsPageStreamUrlModule (copy)
			return if extractNextFeedPageToken(p3) then ChartsPageStreamUrlModule else nil
		end,
		buildNextPagePostBody = function(p3)
			-- upvalues: extractNextFeedPageToken (upval), buildBody (copy)
			local ExtractNextFeedPageTokenResult = extractNextFeedPageToken(p3)
			
			return if ExtractNextFeedPageTokenResult then buildBody(ExtractNextFeedPageTokenResult) else nil
		end,
		buildRefreshUrl = function()
			-- upvalues: SduiApiStore (copy), ConfigKey (copy), ChartsPageSessionModule (upval), ChartsPageStreamUrlModule (copy)
			if not SduiApiStore.isInFlight(ConfigKey) then
				ChartsPageSessionModule:Refresh()
			end
			return ChartsPageStreamUrlModule
		end,
		buildRefreshPostBody = function()
			-- upvalues: buildBody (copy)
			return buildBody(nil)
		end
	}, p2), ConfigKey
end