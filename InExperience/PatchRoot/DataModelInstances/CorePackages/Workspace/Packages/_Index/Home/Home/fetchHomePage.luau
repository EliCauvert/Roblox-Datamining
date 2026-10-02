local home = script:FindFirstAncestor("Home")
local parent = home.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local discoveryAvailabilityModule = require(parent.DiscoveryAvailability)
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local promiseModule = require(parent.Promise)
local setPageSessionTimestamp = require(parent.PageSessionRodux).SetPageSessionTimestamp
local getSduiServiceDependenciesStore = require(parent.SduiCoreSystem).getSduiServiceDependenciesStore
local sduiLogger = require(parent.SduiCoreSystem).SduiLogger
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
local fFlagSduiClientTemplateCache = sharedFlagsModule.FFlagSduiClientTemplateCache
local fFlagEnableHomePageSduiPrefetch = sharedFlagsModule.FFlagEnableHomePageSduiPrefetch
local fFlagUseSignalsForStartup = sharedFlagsModule.FFlagUseSignalsForStartup
local fFlagHomeSduiOfflineCache = sharedFlagsModule.FFlagHomeSduiOfflineCache
local fFlagSduiAdvertiseRuntimeSupportSets = sharedFlagsModule.FFlagSduiAdvertiseRuntimeSupportSets
local fFlagHomePageSduiPrefetchExtendedClientCapabilities = sharedFlagsModule.FFlagHomePageSduiPrefetchExtendedClientCapabilities
local fFlagLuaAppSduiHomePageSupport = sharedFlagsModule.FFlagLuaAppSduiHomePageSupport
local fFlagLuaAppSduiHomeFeedStats = sharedFlagsModule.FFlagLuaAppSduiHomeFeedStats
local fFlagLuaAppAddHasOneByTwoFieldSdui = sharedFlagsModule.FFlagLuaAppAddHasOneByTwoFieldSdui
local fFlagSduiPerSectionPoolSizing = sharedFlagsModule.FFlagSduiPerSectionPoolSizing

local function _(p1, p2)
	-- upvalues: homeConstantsModule (ref)
	return if typeof(p1) == "string" and p1 ~= "" then p1 elseif p2 then homeConstantsModule.RequestIntent.ManualRefresh else homeConstantsModule.RequestIntent.LogIn
end

local function createHomePageRequestConfig(p1, p2)
	-- upvalues: sduiResponseType (ref), getHomePageUrlModule (ref), appPage (ref), sduiApiStorePostConfigContentType (ref), buildHomePageRequestModule (ref), fFlagSduiClientTemplateCache (ref), getSduiTemplateStore (ref)
	local homeApi = p1.homeApi
	
	return {
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
				cachedRobloxComponentToTemplateId = if fFlagSduiClientTemplateCache then getSduiTemplateStore().getCachedRobloxComponentToTemplateId(appPage.Home) else nil,
				clientCapabilities = p1.clientCapabilities,
				collectionLayout = p1.collectionLayout
			})
		},
		enableTemplateCache = if fFlagSduiClientTemplateCache then true else nil
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

local function commitHomeSession(_, p2)
	-- upvalues: homePageSessionModule (ref), getSduiServiceDependenciesStore (ref), appPage (ref), setPageSessionTimestamp (ref)
	local var3 = if type(p2) == "table" then p2.request_id else nil
	
	if homePageSessionModule:Commit(if var3 == nil or var3 == "" then nil else var3) then
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

local function fetchHomePage(p2, p3)
	-- upvalues: homeConstantsModule (ref), getSduiApiStore (ref), setHomePageDataStatuses (ref), retrievalStatus (ref), fFlagEnableHomePageSduiPrefetch (ref), homePageSessionModule (ref), prefetchProtocol (ref), parent (ref), fFlagSduiAdvertiseRuntimeSupportSets (ref), sduiCapabilities (ref), fFlagSduiPerSectionPoolSizing (ref), measureHomeCollectionLayoutModule (ref), homePageFocusedFetchUtilsModule (ref), promiseModule (ref), createHomePageRequestConfig (ref), sduiSharedUtilitiesModule (ref), fFlagLuaAppSduiHomePageSupport (ref), friendRecommendations (ref), readFriendRecommendations (ref), commitHomeSession (ref), fFlagLuaAppSduiHomeFeedStats (ref), sduiLogger (ref), buildHomeFeedStatsModule (ref), appPage (ref), fFlagLuaAppAddHasOneByTwoFieldSdui (ref), hasOneByTwoInResponse (ref), fFlagHomeSduiOfflineCache (ref), sduiHomePageCachePayloadModule (ref), homeOmniFeedCache (ref), discoveryAvailabilityModule (ref), fFlagHomePageSduiPrefetchExtendedClientCapabilities (ref), writeHomePageSduiPrefetchClientCapabilitiesModule (ref), writeHomePageSduiPrefetchDescriptorModule (ref), fetchHomePage (ref)
	local configKey = homeConstantsModule.ConfigKey
	local var3 = getSduiApiStore()
	local var4 = if p3 then p3.forceRefresh else nil
	local var5 = if p3 then p3.contextualFeatures else nil
	local var6 = if p3 then p3.requestIntent else nil
	local var7 = if typeof(var6) == "string" and var6 ~= "" then var6 elseif var4 then homeConstantsModule.RequestIntent.ManualRefresh else homeConstantsModule.RequestIntent.LogIn
	var6 = if p3 then p3.focusedRefresh else nil
	local _, data = var3.getData(configKey)
	
	if (var4 or data) and (not var3.isInFlight(configKey) and not var6) then
		setHomePageDataStatuses(retrievalStatus.Fetching)
		local var8 = false
		
		if fFlagEnableHomePageSduiPrefetch and homePageSessionModule:GetCommitted() == nil then
			local var9 = prefetchProtocol.default:popPendingPrefetchGuid()
			
			if var9 ~= nil then
				var8 = homePageSessionModule:Adopt(var9)
			end
		end
		if not var8 then
			homePageSessionModule:Refresh()
		end
	end
	local enabledCapabilityNumbersWithoutExtendedMarker, var10
	local serviceContractsProtoModule = require(parent.ServiceContractsProto)
	local homePage = serviceContractsProtoModule.apppageplatform.home.home_page
	local clientCapabilities = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities
	local _ = nil
	local _ = nil
	
	if fFlagSduiAdvertiseRuntimeSupportSets then
		enabledCapabilityNumbersWithoutExtendedMarker = sduiCapabilities.getEnabledCapabilityNumbersWithoutExtendedMarker()
		var10 = sduiCapabilities.buildClientCapabilities()
	else
		enabledCapabilityNumbersWithoutExtendedMarker = sduiCapabilities.getEnabledCapabilityNumbers({
			"CAPABILITY_SUPPORTS_HYDRATION_CLIENT_HINTS",
			if fFlagSduiPerSectionPoolSizing then "CAPABILITY_SUPPORTS_MULTI_SIZE_POOL" else nil
		})
		var10 = clientCapabilities.new({
			enabled_capabilities = enabledCapabilityNumbersWithoutExtendedMarker
		})
	end
	local t = {
		pageTimer = p2,
		homeApi = homePage,
		requestIntent = var7,
		contextualFeatures = var5,
		clientCapabilities = var10,
		collectionLayout = if fFlagEnableHomePageSduiPrefetch then measureHomeCollectionLayoutModule() else nil
	}
	local var11 = if var6 then homePageFocusedFetchUtilsModule.register(var6) else nil
	
	if var6 and var11 == nil then
		return promiseModule.resolve(false), configKey
	end
	local var12 = createHomePageRequestConfig(t, {
		configKey = configKey,
		sessionId = homePageSessionModule:Get(),
		topicIds = if var6 then { var6.topicId } else nil
	})
	var12.mergeStrategy = sduiSharedUtilitiesModule.streamingFeedMergeStrategy
	
	if var11 then
		homePageFocusedFetchUtilsModule.applyToRequestConfig(var12, var11)
	end
	if var11 == nil then
		function var42.onSuccess(p4, p5)
			-- upvalues: fFlagLuaAppSduiHomePageSupport (copy), friendRecommendations (copy), readFriendRecommendations (copy), commitHomeSession (copy), fFlagLuaAppSduiHomeFeedStats (copy), sduiLogger (copy), buildHomeFeedStatsModule (copy), appPage (copy), fFlagLuaAppAddHasOneByTwoFieldSdui (copy), hasOneByTwoInResponse (copy), setHomePageDataStatuses (copy), retrievalStatus (copy), fFlagHomeSduiOfflineCache (copy), sduiHomePageCachePayloadModule (copy), homeOmniFeedCache (copy), discoveryAvailabilityModule (copy), fFlagEnableHomePageSduiPrefetch (copy), fFlagHomePageSduiPrefetchExtendedClientCapabilities (copy), writeHomePageSduiPrefetchClientCapabilitiesModule (copy), var10 (write), writeHomePageSduiPrefetchDescriptorModule (copy), enabledCapabilityNumbersWithoutExtendedMarker (write)
			if fFlagLuaAppSduiHomePageSupport then
				friendRecommendations.getStore().replaceFriendRecommendations(readFriendRecommendations(p5))
			end
			commitHomeSession(p4, p5)
			
			if fFlagLuaAppSduiHomeFeedStats then
				local var13 = if type(p5) == "table" then p5.request_id else nil
				sduiLogger.reportSduiV2FeedStats(buildHomeFeedStatsModule(p5), appPage.Home, if var13 == nil or var13 == "" then nil else var13, nil, if fFlagLuaAppAddHasOneByTwoFieldSdui then hasOneByTwoInResponse(p5) else nil)
			end
			setHomePageDataStatuses(retrievalStatus.Done)
			
			if fFlagHomeSduiOfflineCache and p5 then
				task.defer(function()
					-- upvalues: sduiHomePageCachePayloadModule (copy), p5 (ref), homeOmniFeedCache (copy)
					local var14 = sduiHomePageCachePayloadModule.buildSduiHomePageCachePayload(p5)
					
					if var14 then
						homeOmniFeedCache.cacheSduiHomePageData(sduiHomePageCachePayloadModule.serializeSduiHomePageCache(var14))
					end
				end)
				discoveryAvailabilityModule.Signals.getCacheStore().setHomePageDataSource("API")
			end
			if fFlagEnableHomePageSduiPrefetch then
				if fFlagHomePageSduiPrefetchExtendedClientCapabilities then
					writeHomePageSduiPrefetchClientCapabilitiesModule(var10)
					
					return
				end
				writeHomePageSduiPrefetchDescriptorModule(enabledCapabilityNumbersWithoutExtendedMarker)
			end
		end
		
		var12.recoverFromError = if fFlagHomeSduiOfflineCache then {
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
		
		function var42.refresh(p4)
			-- upvalues: fetchHomePage (copy), var5 (ref)
			return fetchHomePage(p4, { forceRefresh = true, contextualFeatures = var5 })
		end
	end
	local var13 = var3.fetchIfNeeded(var12, if var11 then true else var4)
	
	if var11 then
		return homePageFocusedFetchUtilsModule.resolve(var13, var11), configKey
	end
	return var13 and var13:catch(function(_)
		-- upvalues: fFlagHomeSduiOfflineCache (copy), discoveryAvailabilityModule (copy), setHomePageDataStatuses (copy), retrievalStatus (copy)
		if not fFlagHomeSduiOfflineCache or discoveryAvailabilityModule.Signals.getCacheStore().getHomePageDataSource(false) ~= "Cache" then
			setHomePageDataStatuses(retrievalStatus.Failed)
		end
	end), configKey
end

return fetchHomePage