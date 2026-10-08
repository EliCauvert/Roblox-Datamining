local home = script:FindFirstAncestor("Home")
local parent = home.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local discoveryAvailabilityModule = require(parent.DiscoveryAvailability)
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local promiseModule = require(parent.Promise)
local setPageSessionTimestamp = require(parent.PageSessionRodux).SetPageSessionTimestamp
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local getSduiServiceDependenciesStore = sduiCoreSystemModule.getSduiServiceDependenciesStore
local sduiPoolStore = sduiCoreSystemModule.SduiPoolStore
local sduiLogger = sduiCoreSystemModule.SduiLogger
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers
local oneByTwoTileTelemetry = require(parent.SponsoredTilesTelemetry).OneByTwoTileTelemetry
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getSduiTemplateStore = sduiSharedUtilitiesModule.getSduiTemplateStore
local sduiApiStorePostConfigContentType = sduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local sduiCapabilities = sduiSharedUtilitiesModule.SduiCapabilities
local getStartupStore = require(parent.StartupStore).GetStartupStore
local homeConstantsModule = require(home.HomeConstants)
local homePageFocusedFetchUtilsModule = require(home.HomePageFocusedFetchUtils)
local homePageSessionModule = require(home.HomePageSession)
local homeOmniFeedCache = require(parent.DiscoveryUtils).HomeOmniFeedCache
local sduiHomePageCachePayloadModule = require(home.SduiHomePageCachePayload)
local getHomePageUrlModule = require(home.getHomePageUrl)
local buildHomePageRequestModule = require(home.buildHomePageRequest)
local buildHomeFeedStatsModule = require(home.buildHomeFeedStats)
local measureHomeCollectionLayoutModule = require(home.measureHomeCollectionLayout)
local writeHomePageSduiPrefetchDescriptorModule = require(home.writeHomePageSduiPrefetchDescriptor)
local writeHomePageSduiPrefetchClientCapabilitiesModule = require(home.writeHomePageSduiPrefetchClientCapabilities)
local prefetchProtocol = require(parent.PrefetchProtocol).PrefetchProtocol
local friendRecommendations = require(parent.HomeStore).FriendRecommendations
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableHomePageSduiPrefetch = sharedFlagsModule.FFlagEnableHomePageSduiPrefetch
local fFlagUseSignalsForStartup = sharedFlagsModule.FFlagUseSignalsForStartup
local fFlagHomeSduiOfflineCache = sharedFlagsModule.FFlagHomeSduiOfflineCache
local fFlagSduiAdvertiseRuntimeSupportSets = sharedFlagsModule.FFlagSduiAdvertiseRuntimeSupportSets
local fFlagHomePageSduiPrefetchExtendedClientCapabilities = sharedFlagsModule.FFlagHomePageSduiPrefetchExtendedClientCapabilities
local fFlagLuaAppSduiHomePageSupport = sharedFlagsModule.FFlagLuaAppSduiHomePageSupport
local fFlagLuaAppSduiHomeFeedStats = sharedFlagsModule.FFlagLuaAppSduiHomeFeedStats
local fFlagLuaAppAddHasOneByTwoFieldSdui = sharedFlagsModule.FFlagLuaAppAddHasOneByTwoFieldSdui
local fFlagSduiPerSectionPoolSizing = sharedFlagsModule.FFlagSduiPerSectionPoolSizing
local fFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui = sharedFlagsModule.FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui
local fFlagLuaAppHomeMomentVideoFallback = sharedFlagsModule.FFlagLuaAppHomeMomentVideoFallback

local function _(p1, p2)
	-- upvalues: homeConstantsModule (ref)
	return if typeof(p1) == "string" and p1 ~= "" then p1 elseif p2 then homeConstantsModule.RequestIntent.ManualRefresh else homeConstantsModule.RequestIntent.LogIn
end

local function createHomePageRequestConfig(p1, p2)
	-- upvalues: sduiResponseType (ref), getHomePageUrlModule (ref), appPage (ref), sduiApiStorePostConfigContentType (ref), buildHomePageRequestModule (ref), getSduiTemplateStore (ref)
	local homeApi = p1.homeApi
	
	return {
		enableTemplateCache = true,
		enableStreaming = false,
		allowNoConfigsBuilt = true,
		responseType = sduiResponseType.Protobuf,
		url = getHomePageUrlModule(),
		surfaceKey = appPage.Home,
		configKey = p2.configKey,
		loadTimer = p1.pageTimer,
		apiProto = homeApi.HomePageResponse,
		postConfig = {
			contentType = sduiApiStorePostConfigContentType.Proto,
			protoMessage = homeApi.HomePageRequest,
			body = buildHomePageRequestModule(homeApi, {
				sessionId = p2.sessionId,
				topicIds = p2.topicIds,
				requestIntent = p1.requestIntent,
				contextualFeatures = p1.contextualFeatures,
				cachedRobloxComponentToTemplateId = getSduiTemplateStore().getCachedRobloxComponentToTemplateId(appPage.Home),
				clientCapabilities = p1.clientCapabilities,
				collectionLayout = p1.collectionLayout
			})
		}
	}
end

local _ = function(p1)
	local var1 = if type(p1) == "table" then p1.request_id else nil
	
	return if var1 == nil or var1 == "" then nil else var1
end

local function hasOneByTwoInResponse(p1)
	if type(p1) ~= "table" then
		return false
	end
	for i, v in p1.page_entries or {} do
		local inputData = v.input_data
		local var1 = if inputData and inputData.kind then inputData.kind.value else nil
		local var2 = if var1 then var1.content_pools else nil
		
		if var2 then
			for i_1, v_1 in var2 do
				for i_2, v_2 in v_1.items or {} do
					local layout = v_2.layout
					
					if layout and layout.row_span == 2 and (if layout then layout.col_span or 1 else nil) == 1 then
						return true
					end
				end
			end
		end
	end
	return false
end

local function readFriendRecommendations(p2)
	-- upvalues: friendRecommendations (ref)
	local var3 = if type(p2) == "table" then p2.hydration_data else nil
	local var4 = if type(var3) == "table" then var3.friend_recommendation else nil
	
	return if type(var4) == "table" then friendRecommendations.mapFromProto(var4) else {}
end

local var3 = nil

local _ = function()
	-- upvalues: var3 (write), sduiPoolStore (ref), homeConstantsModule (ref), oneByTwoTileTelemetry (ref)
	var3 = sduiPoolStore.getSduiPoolStore(homeConstantsModule.ConfigKey)
	var3.setOneByTwoTileFunnelListener({
		onPlaced = oneByTwoTileTelemetry.logOneByTwoTilePlaced,
		onSkipped = oneByTwoTileTelemetry.logOneByTwoTileSkipped
	})
end

local function logOneByTwoTileResponseReceivedFromDecodedResponse(p2)
	-- upvalues: sduiCoreSystemModule (ref), oneByTwoTileTelemetry (ref)
	if type(p2) ~= "table" then return end
	for i, v in p2.page_entries or {} do
		local value = v.input_data and (v.input_data.kind and v.input_data.kind.value)
		local contentPools = value and value.content_pools
		
		if contentPools then
			for i_1, v_1 in sduiCoreSystemModule.getOneByTwoTileFlowIdsFromPools(contentPools) do
				oneByTwoTileTelemetry.logOneByTwoTileResponseReceived({
					componentType = "OneByTwoTile",
					isSdui = true,
					oneByTwoTileFlowId = v_1.oneByTwoTileFlowId,
					contentType = v_1.contentType,
					adId = v_1.adId,
					alignmentType = v_1.alignmentType
				})
			end
		end
	end
end

local function commitHomeSession(_, p3)
	-- upvalues: homePageSessionModule (ref), getSduiServiceDependenciesStore (ref), appPage (ref), setPageSessionTimestamp (ref)
	local var4 = if type(p3) == "table" then p3.request_id else nil
	
	if homePageSessionModule:Commit(if var4 == nil or var4 == "" then nil else var4) then
		local dependencies = getSduiServiceDependenciesStore().getDependencies(appPage.Home)
		assert(dependencies, "dependencies is nil")
		dependencies.dispatch(setPageSessionTimestamp(appPage.Home))
		
		return
	end
end

local _ = function(value)
	-- upvalues: discoveryAvailabilityModule (ref)
	discoveryAvailabilityModule.Signals.getCacheStore().setHomePageDataSource(value)
end

local _ = function()
	-- upvalues: discoveryAvailabilityModule (ref)
	return discoveryAvailabilityModule.Signals.getCacheStore().getHomePageDataSource(false) == "Cache"
end

local function setHomePageDataStatuses(value)
	-- upvalues: fFlagUseSignalsForStartup (ref), getStartupStore (ref), getSduiServiceDependenciesStore (ref), appPage (ref)
	if fFlagUseSignalsForStartup then
		getStartupStore(false).setHomePageDataStatus(value)
		getStartupStore(false).setFetchHomePageDataStatusAll(value)
		
		return
	end
	local dependencies = getSduiServiceDependenciesStore().getDependencies(appPage.Home)
	
	if dependencies == nil then
		return
	end
	dependencies.dispatch({ type = "SetHomePageDataStatus", status = value })
	dependencies.dispatch({ type = "SetFetchHomePageDataStatusAll", status = value })
end

local function fetchHomePage(p3, p4)
	-- upvalues: fFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui (ref), var3 (write), sduiPoolStore (ref), homeConstantsModule (ref), oneByTwoTileTelemetry (ref), getSduiApiStore (ref), setHomePageDataStatuses (ref), retrievalStatus (ref), fFlagEnableHomePageSduiPrefetch (ref), homePageSessionModule (ref), prefetchProtocol (ref), parent (ref), fFlagSduiAdvertiseRuntimeSupportSets (ref), sduiCapabilities (ref), fFlagSduiPerSectionPoolSizing (ref), fFlagLuaAppHomeMomentVideoFallback (ref), measureHomeCollectionLayoutModule (ref), homePageFocusedFetchUtilsModule (ref), promiseModule (ref), createHomePageRequestConfig (ref), sduiSharedUtilitiesModule (ref), fFlagLuaAppSduiHomePageSupport (ref), friendRecommendations (ref), readFriendRecommendations (ref), commitHomeSession (ref), fFlagLuaAppSduiHomeFeedStats (ref), sduiLogger (ref), buildHomeFeedStatsModule (ref), appPage (ref), fFlagLuaAppAddHasOneByTwoFieldSdui (ref), hasOneByTwoInResponse (ref), logOneByTwoTileResponseReceivedFromDecodedResponse (ref), sduiErrors (ref), sduiParseHelpers (ref), fFlagHomeSduiOfflineCache (ref), sduiHomePageCachePayloadModule (ref), homeOmniFeedCache (ref), discoveryAvailabilityModule (ref), fFlagHomePageSduiPrefetchExtendedClientCapabilities (ref), writeHomePageSduiPrefetchClientCapabilitiesModule (ref), writeHomePageSduiPrefetchDescriptorModule (ref), fetchHomePage (ref)
	if fFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui then
		var3 = sduiPoolStore.getSduiPoolStore(homeConstantsModule.ConfigKey)
		var3.setOneByTwoTileFunnelListener({
			onPlaced = oneByTwoTileTelemetry.logOneByTwoTilePlaced,
			onSkipped = oneByTwoTileTelemetry.logOneByTwoTileSkipped
		})
	end
	local configKey = homeConstantsModule.ConfigKey
	local var4 = getSduiApiStore()
	local var5 = if p4 then p4.forceRefresh else nil
	local var6 = if p4 then p4.contextualFeatures else nil
	local var7 = if p4 then p4.requestIntent else nil
	local var8 = if typeof(var7) == "string" and var7 ~= "" then var7 elseif var5 then homeConstantsModule.RequestIntent.ManualRefresh else homeConstantsModule.RequestIntent.LogIn
	var7 = if p4 then p4.focusedRefresh else nil
	local _, data = var4.getData(configKey)
	
	if (var5 or data) and (not var4.isInFlight(configKey) and not var7) then
		setHomePageDataStatuses(retrievalStatus.Fetching)
		local var9 = false
		
		if fFlagEnableHomePageSduiPrefetch and homePageSessionModule:GetCommitted() == nil then
			local var10 = prefetchProtocol.default:popPendingPrefetchGuid()
			
			if var10 ~= nil then
				var9 = homePageSessionModule:Adopt(var10)
			end
		end
		if not var9 then
			homePageSessionModule:Refresh()
		end
	end
	local enabledCapabilityNumbersWithoutExtendedMarker, var11
	local serviceContractsProtoModule = require(parent.ServiceContractsProto)
	local homePage = serviceContractsProtoModule.apppageplatform.home.home_page
	local clientCapabilities = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities
	local _ = nil
	local _ = nil
	
	if fFlagSduiAdvertiseRuntimeSupportSets then
		enabledCapabilityNumbersWithoutExtendedMarker = sduiCapabilities.getEnabledCapabilityNumbersWithoutExtendedMarker()
		var11 = sduiCapabilities.buildClientCapabilities()
	else
		enabledCapabilityNumbersWithoutExtendedMarker = sduiCapabilities.getEnabledCapabilityNumbers({
			"CAPABILITY_SUPPORTS_HYDRATION_CLIENT_HINTS",
			if fFlagSduiPerSectionPoolSizing then "CAPABILITY_SUPPORTS_MULTI_SIZE_POOL" else nil,
			if fFlagLuaAppHomeMomentVideoFallback then "CAPABILITY_SUPPORTS_VIDEO_PLAYER_ACCESS_CONTEXT" else nil
		})
		var11 = clientCapabilities.new({
			enabled_capabilities = enabledCapabilityNumbersWithoutExtendedMarker
		})
	end
	local t = {
		pageTimer = p3,
		homeApi = homePage,
		requestIntent = var8,
		contextualFeatures = var6,
		clientCapabilities = var11,
		collectionLayout = if fFlagEnableHomePageSduiPrefetch then measureHomeCollectionLayoutModule() else nil
	}
	local var12 = if var7 then homePageFocusedFetchUtilsModule.register(var7) else nil
	
	if var7 and var12 == nil then
		return promiseModule.resolve(false), configKey
	end
	local var13 = createHomePageRequestConfig(t, {
		configKey = configKey,
		sessionId = homePageSessionModule:Get(),
		topicIds = if var7 then { var7.topicId } else nil
	})
	var13.mergeStrategy = sduiSharedUtilitiesModule.streamingFeedMergeStrategy
	
	if var12 then
		homePageFocusedFetchUtilsModule.applyToRequestConfig(var13, var12)
	end
	if var12 == nil then
		function var47.onSuccess(p5, p6)
			-- upvalues: fFlagLuaAppSduiHomePageSupport (copy), friendRecommendations (copy), readFriendRecommendations (copy), commitHomeSession (copy), fFlagLuaAppSduiHomeFeedStats (copy), sduiLogger (copy), buildHomeFeedStatsModule (copy), appPage (copy), fFlagLuaAppAddHasOneByTwoFieldSdui (copy), hasOneByTwoInResponse (copy), fFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui (copy), logOneByTwoTileResponseReceivedFromDecodedResponse (copy), sduiErrors (copy), sduiParseHelpers (copy), setHomePageDataStatuses (copy), retrievalStatus (copy), fFlagHomeSduiOfflineCache (copy), sduiHomePageCachePayloadModule (copy), homeOmniFeedCache (copy), discoveryAvailabilityModule (copy), fFlagEnableHomePageSduiPrefetch (copy), fFlagHomePageSduiPrefetchExtendedClientCapabilities (copy), writeHomePageSduiPrefetchClientCapabilitiesModule (copy), var11 (write), writeHomePageSduiPrefetchDescriptorModule (copy), enabledCapabilityNumbersWithoutExtendedMarker (write)
			if fFlagLuaAppSduiHomePageSupport then
				friendRecommendations.getStore().replaceFriendRecommendations(readFriendRecommendations(p6))
			end
			commitHomeSession(p5, p6)
			
			if fFlagLuaAppSduiHomeFeedStats then
				local var14 = if type(p6) == "table" then p6.request_id else nil
				sduiLogger.reportSduiV2FeedStats(buildHomeFeedStatsModule(p6), appPage.Home, if var14 == nil or var14 == "" then nil else var14, nil, if fFlagLuaAppAddHasOneByTwoFieldSdui then hasOneByTwoInResponse(p6) else nil)
			end
			if fFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui then
				local ok, status = pcall(function()
					-- upvalues: logOneByTwoTileResponseReceivedFromDecodedResponse (copy), p6 (ref)
					logOneByTwoTileResponseReceivedFromDecodedResponse(p6)
					
					return nil
				end)
				
				if not ok then
					sduiLogger.reportError(sduiErrors.SduiErrorType.CodeError, {
						name = "OneByTwoTileResponseReceived",
						message = sduiParseHelpers.stringifyValue(status)
					}, appPage.Home)
				end
			end
			setHomePageDataStatuses(retrievalStatus.Done)
			
			if fFlagHomeSduiOfflineCache and p6 then
				task.defer(function()
					-- upvalues: sduiHomePageCachePayloadModule (copy), p6 (ref), homeOmniFeedCache (copy)
					local var15 = sduiHomePageCachePayloadModule.buildSduiHomePageCachePayload(p6)
					
					if var15 then
						homeOmniFeedCache.cacheSduiHomePageData(sduiHomePageCachePayloadModule.serializeSduiHomePageCache(var15))
					end
				end)
				discoveryAvailabilityModule.Signals.getCacheStore().setHomePageDataSource("API")
			end
			if fFlagEnableHomePageSduiPrefetch then
				if fFlagHomePageSduiPrefetchExtendedClientCapabilities then
					writeHomePageSduiPrefetchClientCapabilitiesModule(var11)
					
					return
				end
				writeHomePageSduiPrefetchDescriptorModule(enabledCapabilityNumbersWithoutExtendedMarker)
			end
		end
		
		var13.recoverFromError = if fFlagHomeSduiOfflineCache then {
			getDecodedResponse = function()
				-- upvalues: sduiHomePageCachePayloadModule (copy), homeOmniFeedCache (copy)
				return sduiHomePageCachePayloadModule.deserializeSduiHomePageCache(homeOmniFeedCache.getCachedSduiHomePageData())
			end,
			onApplied = function()
				-- upvalues: discoveryAvailabilityModule (copy), setHomePageDataStatuses (copy), retrievalStatus (copy)
				discoveryAvailabilityModule.Signals.getCacheStore().setHomePageDataSource("Cache")
				setHomePageDataStatuses(retrievalStatus.Done)
			end
		} else nil
		
		function var47.refresh(p5)
			-- upvalues: fetchHomePage (copy), var6 (ref)
			return fetchHomePage(p5, { forceRefresh = true, contextualFeatures = var6 })
		end
	end
	local var14 = var4.fetchIfNeeded(var13, if var12 then true else var5)
	
	if var12 then
		return homePageFocusedFetchUtilsModule.resolve(var14, var12), configKey
	end
	return var14 and var14:catch(function(_)
		-- upvalues: fFlagHomeSduiOfflineCache (copy), discoveryAvailabilityModule (copy), setHomePageDataStatuses (copy), retrievalStatus (copy)
		if not fFlagHomeSduiOfflineCache or discoveryAvailabilityModule.Signals.getCacheStore().getHomePageDataSource(false) ~= "Cache" then
			setHomePageDataStatuses(retrievalStatus.Failed)
		end
	end), configKey
end

return fetchHomePage