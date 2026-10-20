local Home = script:FindFirstAncestor("Home")
local Parent = Home.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local DiscoveryAvailabilityModule = require(Parent.DiscoveryAvailability)
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local PromiseModule = require(Parent.Promise)
local SetPageSessionTimestampFunction = require(Parent.PageSessionRodux).SetPageSessionTimestamp
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local GetSduiServiceDependenciesStoreFunction = SduiCoreSystemModule.getSduiServiceDependenciesStore
local SduiPoolStore = SduiCoreSystemModule.SduiPoolStore
local SduiLogger = SduiCoreSystemModule.SduiLogger
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local OneByTwoTileTelemetry = require(Parent.SponsoredTilesTelemetry).OneByTwoTileTelemetry
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetSduiTemplateStoreFunction = SduiSharedUtilitiesModule.getSduiTemplateStore
local SduiApiStorePostConfigContentType = SduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local SduiCapabilities = SduiSharedUtilitiesModule.SduiCapabilities
local GetStartupStoreFunction = require(Parent.StartupStore).GetStartupStore
local HomeConstantsModule = require(Home.HomeConstants)
local HomePageFocusedFetchUtilsModule = require(Home.HomePageFocusedFetchUtils)
local HomePageSessionModule = require(Home.HomePageSession)
local HomeOmniFeedCache = require(Parent.DiscoveryUtils).HomeOmniFeedCache
local SduiHomePageCachePayloadModule = require(Home.SduiHomePageCachePayload)
local GetHomePageUrlModule = require(Home.getHomePageUrl)
local BuildHomePageRequestModule = require(Home.buildHomePageRequest)
local BuildHomeFeedStatsModule = require(Home.buildHomeFeedStats)
local MeasureHomeCollectionLayoutModule = require(Home.measureHomeCollectionLayout)
local WriteHomePageSduiPrefetchDescriptorModule = require(Home.writeHomePageSduiPrefetchDescriptor)
local WriteHomePageSduiPrefetchClientCapabilitiesModule = require(Home.writeHomePageSduiPrefetchClientCapabilities)
local PrefetchProtocol = require(Parent.PrefetchProtocol).PrefetchProtocol
local FriendRecommendations = require(Parent.HomeStore).FriendRecommendations
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableHomePageSduiPrefetch = SharedFlagsModule.FFlagEnableHomePageSduiPrefetch
local FFlagUseSignalsForStartup = SharedFlagsModule.FFlagUseSignalsForStartup
local FFlagHomeSduiOfflineCache = SharedFlagsModule.FFlagHomeSduiOfflineCache
local FFlagSduiAdvertiseRuntimeSupportSets = SharedFlagsModule.FFlagSduiAdvertiseRuntimeSupportSets
local FFlagHomePageSduiPrefetchExtendedClientCapabilities = SharedFlagsModule.FFlagHomePageSduiPrefetchExtendedClientCapabilities
local FFlagLuaAppSduiHomePageSupport = SharedFlagsModule.FFlagLuaAppSduiHomePageSupport
local FFlagLuaAppSduiHomeFeedStats = SharedFlagsModule.FFlagLuaAppSduiHomeFeedStats
local FFlagLuaAppAddHasOneByTwoFieldSdui = SharedFlagsModule.FFlagLuaAppAddHasOneByTwoFieldSdui
local FFlagSduiPerSectionPoolSizing = SharedFlagsModule.FFlagSduiPerSectionPoolSizing
local FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui = SharedFlagsModule.FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui
local FFlagLuaAppHomeMomentVideoFallback = SharedFlagsModule.FFlagLuaAppHomeMomentVideoFallback

local function _(p1, p2)
	-- upvalues: HomeConstantsModule (copy)
	return if typeof(p1) == "string" and p1 ~= "" then p1 elseif p2 then HomeConstantsModule.RequestIntent.ManualRefresh else HomeConstantsModule.RequestIntent.LogIn
end

local function createHomePageRequestConfig(p1, p2)
	-- upvalues: SduiResponseType (copy), GetHomePageUrlModule (copy), AppPage (copy), SduiApiStorePostConfigContentType (copy), BuildHomePageRequestModule (copy), GetSduiTemplateStoreFunction (copy)
	local HomeApi = p1.homeApi
	
	return {
		enableTemplateCache = true,
		enableStreaming = false,
		allowNoConfigsBuilt = true,
		responseType = SduiResponseType.Protobuf,
		url = GetHomePageUrlModule(),
		surfaceKey = AppPage.Home,
		configKey = p2.configKey,
		loadTimer = p1.pageTimer,
		apiProto = HomeApi.HomePageResponse,
		postConfig = {
			contentType = SduiApiStorePostConfigContentType.Proto,
			protoMessage = HomeApi.HomePageRequest,
			body = BuildHomePageRequestModule(HomeApi, {
				sessionId = p2.sessionId,
				topicIds = p2.topicIds,
				requestIntent = p1.requestIntent,
				contextualFeatures = p1.contextualFeatures,
				cachedRobloxComponentToTemplateId = GetSduiTemplateStoreFunction().getCachedRobloxComponentToTemplateId(AppPage.Home),
				clientCapabilities = p1.clientCapabilities,
				collectionLayout = p1.collectionLayout
			})
		}
	}
end

local _ = function(p1)
	local RequestId = if type(p1) == "table" then p1.request_id else nil
	
	return if RequestId == nil or RequestId == "" then nil else RequestId
end

local function hasOneByTwoInResponse(p1): boolean
	if type(p1) ~= "table" then
		return false
	end
	local PageEntries = p1.page_entries or {}
	for _, pageEntry in PageEntries do
		local InputData = pageEntry.input_data
		local Value = if InputData and InputData.kind then InputData.kind.value else nil
		local ContentPools = if Value then Value.content_pools else nil
		
		if ContentPools then
			for _, contentPool in ContentPools do
				local Items = contentPool.items or {}
				for _, item in Items do
					local Layout = item.layout
					local ColSpan = if Layout then Layout.col_span or 1 else nil
					
					if Layout and Layout.row_span == 2 and ColSpan == 1 then
						return true
					end
				end
			end
		end
	end
	return false
end

local function readFriendRecommendations(p2)
	-- upvalues: FriendRecommendations (copy)
	local HydrationData = if type(p2) == "table" then p2.hydration_data else nil
	local FriendRecommendation = if type(HydrationData) == "table" then HydrationData.friend_recommendation else nil
	
	return if type(FriendRecommendation) == "table" then FriendRecommendations.mapFromProto(FriendRecommendation) else {}
end

local SduiPoolStore1 = nil

local _ = function()
	-- upvalues: SduiPoolStore1 (ref), SduiPoolStore (copy), HomeConstantsModule (copy), OneByTwoTileTelemetry (copy)
	SduiPoolStore1 = SduiPoolStore.getSduiPoolStore(HomeConstantsModule.ConfigKey)
	SduiPoolStore1.setOneByTwoTileFunnelListener({
		onPlaced = OneByTwoTileTelemetry.logOneByTwoTilePlaced,
		onSkipped = OneByTwoTileTelemetry.logOneByTwoTileSkipped
	})
end

local function logOneByTwoTileResponseReceivedFromDecodedResponse(p2)
	-- upvalues: SduiCoreSystemModule (copy), OneByTwoTileTelemetry (copy)
	if type(p2) ~= "table" then return end
	local PageEntries = p2.page_entries or {}
	for _, pageEntry in PageEntries do
		local Value = pageEntry.input_data and (pageEntry.input_data.kind and pageEntry.input_data.kind.value)
		local ContentPools = Value and Value.content_pools
		
		if ContentPools then
			for _, value in SduiCoreSystemModule.getOneByTwoTileFlowIdsFromPools(ContentPools) do
				OneByTwoTileTelemetry.logOneByTwoTileResponseReceived({
					componentType = "OneByTwoTile",
					isSdui = true,
					oneByTwoTileFlowId = value.oneByTwoTileFlowId,
					contentType = value.contentType,
					adId = value.adId,
					alignmentType = value.alignmentType
				})
			end
		end
	end
end

local function commitHomeSession(_, p3)
	-- upvalues: HomePageSessionModule (copy), GetSduiServiceDependenciesStoreFunction (copy), AppPage (copy), SetPageSessionTimestampFunction (copy)
	local RequestId = if type(p3) == "table" then p3.request_id else nil
	
	if HomePageSessionModule:Commit(if RequestId == nil or RequestId == "" then nil else RequestId) then
		local Dependencies = GetSduiServiceDependenciesStoreFunction().getDependencies(AppPage.Home)
		assert(Dependencies, "dependencies is nil")
		Dependencies.dispatch(SetPageSessionTimestampFunction(AppPage.Home))
		
		return
	end
end

local _ = function(p3)
	-- upvalues: DiscoveryAvailabilityModule (copy)
	DiscoveryAvailabilityModule.Signals.getCacheStore().setHomePageDataSource(p3)
end

local _ = function(): boolean
	-- upvalues: DiscoveryAvailabilityModule (copy)
	return DiscoveryAvailabilityModule.Signals.getCacheStore().getHomePageDataSource(false) == "Cache"
end

local function setHomePageDataStatuses(Status)
	-- upvalues: FFlagUseSignalsForStartup (copy), GetStartupStoreFunction (copy), GetSduiServiceDependenciesStoreFunction (copy), AppPage (copy)
	if FFlagUseSignalsForStartup then
		GetStartupStoreFunction(false).setHomePageDataStatus(Status)
		GetStartupStoreFunction(false).setFetchHomePageDataStatusAll(Status)
		
		return
	end
	local Dependencies = GetSduiServiceDependenciesStoreFunction().getDependencies(AppPage.Home)
	
	if Dependencies ~= nil then
		Dependencies.dispatch({ type = "SetHomePageDataStatus", status = Status })
		Dependencies.dispatch({ type = "SetFetchHomePageDataStatusAll", status = Status })
		
		return
	end
end

local function fetchHomePage(PageTimer, p3)
	-- upvalues: FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui (copy), SduiPoolStore1 (ref), SduiPoolStore (copy), HomeConstantsModule (copy), OneByTwoTileTelemetry (copy), GetSduiApiStoreFunction (copy), setHomePageDataStatuses (copy), RetrievalStatus (copy), FFlagEnableHomePageSduiPrefetch (copy), HomePageSessionModule (copy), PrefetchProtocol (copy), Parent (copy), FFlagSduiAdvertiseRuntimeSupportSets (copy), SduiCapabilities (copy), FFlagSduiPerSectionPoolSizing (copy), FFlagLuaAppHomeMomentVideoFallback (copy), MeasureHomeCollectionLayoutModule (copy), HomePageFocusedFetchUtilsModule (copy), PromiseModule (copy), createHomePageRequestConfig (copy), SduiSharedUtilitiesModule (copy), FFlagLuaAppSduiHomePageSupport (copy), FriendRecommendations (copy), readFriendRecommendations (copy), commitHomeSession (copy), FFlagLuaAppSduiHomeFeedStats (copy), SduiLogger (copy), BuildHomeFeedStatsModule (copy), AppPage (copy), FFlagLuaAppAddHasOneByTwoFieldSdui (copy), hasOneByTwoInResponse (copy), logOneByTwoTileResponseReceivedFromDecodedResponse (copy), SduiErrors (copy), SduiParseHelpers (copy), FFlagHomeSduiOfflineCache (copy), SduiHomePageCachePayloadModule (copy), HomeOmniFeedCache (copy), DiscoveryAvailabilityModule (copy), FFlagHomePageSduiPrefetchExtendedClientCapabilities (copy), WriteHomePageSduiPrefetchClientCapabilitiesModule (copy), WriteHomePageSduiPrefetchDescriptorModule (copy), fetchHomePage (copy)
	if FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui then
		SduiPoolStore1 = SduiPoolStore.getSduiPoolStore(HomeConstantsModule.ConfigKey)
		SduiPoolStore1.setOneByTwoTileFunnelListener({
			onPlaced = OneByTwoTileTelemetry.logOneByTwoTilePlaced,
			onSkipped = OneByTwoTileTelemetry.logOneByTwoTileSkipped
		})
	end
	local ConfigKey = HomeConstantsModule.ConfigKey
	local SduiApiStore = GetSduiApiStoreFunction()
	local ForceRefresh = if p3 then p3.forceRefresh else nil
	local ContextualFeatures = if p3 then p3.contextualFeatures else nil
	local RequestIntent = if p3 then p3.requestIntent else nil
	local RequestIntent1 = if typeof(RequestIntent) == "string" and RequestIntent ~= "" then RequestIntent elseif ForceRefresh then HomeConstantsModule.RequestIntent.ManualRefresh else HomeConstantsModule.RequestIntent.LogIn
	local FocusedRefresh = if p3 then p3.focusedRefresh else nil
	local _, Data2 = SduiApiStore.getData(ConfigKey)
	
	if (ForceRefresh or Data2) and (not SduiApiStore.isInFlight(ConfigKey) and not FocusedRefresh) then
		setHomePageDataStatuses(RetrievalStatus.Fetching)
		local AdoptResult = false
		
		if FFlagEnableHomePageSduiPrefetch and HomePageSessionModule:GetCommitted() == nil then
			local PopPendingPrefetchGuidResult = PrefetchProtocol.default:popPendingPrefetchGuid()
			
			if PopPendingPrefetchGuidResult ~= nil then
				AdoptResult = HomePageSessionModule:Adopt(PopPendingPrefetchGuidResult)
			end
		end
		if not AdoptResult then
			HomePageSessionModule:Refresh()
		end
	end
	local ServiceContractsProtoModule = require(Parent.ServiceContractsProto)
	local HomePage = ServiceContractsProtoModule.apppageplatform.home.home_page
	local ClientCapabilities = ServiceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities
	local EnabledCapabilityNumbersWithoutExtendedMarker = nil
	local ClientCapabilities1 = nil
	
	if FFlagSduiAdvertiseRuntimeSupportSets then
		EnabledCapabilityNumbersWithoutExtendedMarker = SduiCapabilities.getEnabledCapabilityNumbersWithoutExtendedMarker()
		ClientCapabilities1 = SduiCapabilities.buildClientCapabilities()
	else
		EnabledCapabilityNumbersWithoutExtendedMarker = SduiCapabilities.getEnabledCapabilityNumbers({
			"CAPABILITY_SUPPORTS_HYDRATION_CLIENT_HINTS",
			if FFlagSduiPerSectionPoolSizing then "CAPABILITY_SUPPORTS_MULTI_SIZE_POOL" else nil,
			if FFlagLuaAppHomeMomentVideoFallback then "CAPABILITY_SUPPORTS_VIDEO_PLAYER_ACCESS_CONTEXT" else nil
		})
		ClientCapabilities1 = ClientCapabilities.new({
			enabled_capabilities = EnabledCapabilityNumbersWithoutExtendedMarker
		})
	end
	local config = {
		pageTimer = PageTimer,
		homeApi = HomePage,
		requestIntent = RequestIntent1,
		contextualFeatures = ContextualFeatures,
		clientCapabilities = ClientCapabilities1,
		collectionLayout = if FFlagEnableHomePageSduiPrefetch then MeasureHomeCollectionLayoutModule() else nil
	}
	local RegisterResult = if FocusedRefresh then HomePageFocusedFetchUtilsModule.register(FocusedRefresh) else nil
	
	if FocusedRefresh and RegisterResult == nil then
		return PromiseModule.resolve(false), ConfigKey
	end
	local HomePageRequestConfig = createHomePageRequestConfig(config, {
		configKey = ConfigKey,
		sessionId = HomePageSessionModule:Get(),
		topicIds = if FocusedRefresh then { FocusedRefresh.topicId } else nil
	})
	HomePageRequestConfig.mergeStrategy = SduiSharedUtilitiesModule.streamingFeedMergeStrategy
	
	if RegisterResult then
		HomePageFocusedFetchUtilsModule.applyToRequestConfig(HomePageRequestConfig, RegisterResult)
	end
	if RegisterResult == nil then
		function HomePageRequestConfig.onSuccess(p4, p5)
			-- upvalues: FFlagLuaAppSduiHomePageSupport (upval), FriendRecommendations (upval), readFriendRecommendations (upval), commitHomeSession (upval), FFlagLuaAppSduiHomeFeedStats (upval), SduiLogger (upval), BuildHomeFeedStatsModule (upval), AppPage (upval), FFlagLuaAppAddHasOneByTwoFieldSdui (upval), hasOneByTwoInResponse (upval), FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui (upval), logOneByTwoTileResponseReceivedFromDecodedResponse (upval), SduiErrors (upval), SduiParseHelpers (upval), setHomePageDataStatuses (upval), RetrievalStatus (upval), FFlagHomeSduiOfflineCache (upval), SduiHomePageCachePayloadModule (upval), HomeOmniFeedCache (upval), DiscoveryAvailabilityModule (upval), FFlagEnableHomePageSduiPrefetch (upval), FFlagHomePageSduiPrefetchExtendedClientCapabilities (upval), WriteHomePageSduiPrefetchClientCapabilitiesModule (upval), ClientCapabilities1 (ref), WriteHomePageSduiPrefetchDescriptorModule (upval), EnabledCapabilityNumbersWithoutExtendedMarker (ref)
			if FFlagLuaAppSduiHomePageSupport then
				FriendRecommendations.getStore().replaceFriendRecommendations((readFriendRecommendations(p5)))
			end
			commitHomeSession(p4, p5)
			
			if FFlagLuaAppSduiHomeFeedStats then
				local RequestId = if type(p5) == "table" then p5.request_id else nil
				SduiLogger.reportSduiV2FeedStats(BuildHomeFeedStatsModule(p5), AppPage.Home, if RequestId == nil or RequestId == "" then nil else RequestId, nil, if FFlagLuaAppAddHasOneByTwoFieldSdui then hasOneByTwoInResponse(p5) else nil)
			end
			if FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui then
				local Success, Result = pcall(function()
					-- upvalues: logOneByTwoTileResponseReceivedFromDecodedResponse (upval), p5 (copy)
					logOneByTwoTileResponseReceivedFromDecodedResponse(p5)
					
					return nil
				end)
				
				if not Success then
					SduiLogger.reportError(SduiErrors.SduiErrorType.CodeError, {
						name = "OneByTwoTileResponseReceived",
						message = SduiParseHelpers.stringifyValue(Result)
					}, AppPage.Home)
				end
			end
			setHomePageDataStatuses(RetrievalStatus.Done)
			
			if FFlagHomeSduiOfflineCache and p5 then
				task.defer(function()
					-- upvalues: SduiHomePageCachePayloadModule (upval), p5 (copy), HomeOmniFeedCache (upval)
					local SduiHomePageCachePayload = SduiHomePageCachePayloadModule.buildSduiHomePageCachePayload(p5)
					
					if SduiHomePageCachePayload then
						HomeOmniFeedCache.cacheSduiHomePageData(SduiHomePageCachePayloadModule.serializeSduiHomePageCache(SduiHomePageCachePayload))
					end
				end)
				DiscoveryAvailabilityModule.Signals.getCacheStore().setHomePageDataSource("API")
			end
			if FFlagEnableHomePageSduiPrefetch then
				if FFlagHomePageSduiPrefetchExtendedClientCapabilities then
					WriteHomePageSduiPrefetchClientCapabilitiesModule(ClientCapabilities1)
					
					return
				end
				WriteHomePageSduiPrefetchDescriptorModule(EnabledCapabilityNumbersWithoutExtendedMarker)
			end
		end
		
		HomePageRequestConfig.recoverFromError = if FFlagHomeSduiOfflineCache then {
			getDecodedResponse = function()
				-- upvalues: SduiHomePageCachePayloadModule (upval), HomeOmniFeedCache (upval)
				return SduiHomePageCachePayloadModule.deserializeSduiHomePageCache(HomeOmniFeedCache.getCachedSduiHomePageData())
			end,
			onApplied = function()
				-- upvalues: DiscoveryAvailabilityModule (upval), setHomePageDataStatuses (upval), RetrievalStatus (upval)
				DiscoveryAvailabilityModule.Signals.getCacheStore().setHomePageDataSource("Cache")
				setHomePageDataStatuses(RetrievalStatus.Done)
			end
		} else nil
		
		function HomePageRequestConfig.refresh(PageTimer)
			-- upvalues: fetchHomePage (upval), ContextualFeatures (copy)
			return (fetchHomePage(PageTimer, {
				forceRefresh = true,
				contextualFeatures = ContextualFeatures
			}))
		end
	end
	local IfNeeded = SduiApiStore.fetchIfNeeded(HomePageRequestConfig, if RegisterResult then true else ForceRefresh)
	
	if RegisterResult then
		return HomePageFocusedFetchUtilsModule.resolve(IfNeeded, RegisterResult), ConfigKey
	end
	if IfNeeded then
		IfNeeded = IfNeeded:catch(function(_)
			-- upvalues: FFlagHomeSduiOfflineCache (upval), DiscoveryAvailabilityModule (upval), setHomePageDataStatuses (upval), RetrievalStatus (upval)
			if not FFlagHomeSduiOfflineCache or DiscoveryAvailabilityModule.Signals.getCacheStore().getHomePageDataSource(false) ~= "Cache" then
				setHomePageDataStatuses(RetrievalStatus.Failed)
			end
		end)
	end
	return IfNeeded, ConfigKey
end

return fetchHomePage