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

local function readFriendRecommendations(p1)
	-- upvalues: friendRecommendations (ref)
	local var1 = if type(p1) == "table" then p1.hydration_data else nil
	local var2 = if type(var1) == "table" then var1.friend_recommendation else nil
	
	return if type(var2) == "table" then friendRecommendations.mapFromProto(var2) else {}
end

local function commitHomeSession(_, p1)
	-- upvalues: homePageSessionModule (ref), getSduiServiceDependenciesStore (ref), appPage (ref), setPageSessionTimestamp (ref)
	local var1 = if type(p1) == "table" then p1.request_id else nil
	
	if homePageSessionModule:Commit(if var1 == nil or var1 == "" then nil else var1) then
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

local function fetchHomePage(p1, p2)
	-- upvalues: homeConstantsModule (ref), getSduiApiStore (ref), setHomePageDataStatuses (ref), retrievalStatus (ref), fFlagEnableHomePageSduiPrefetch (ref), homePageSessionModule (ref), prefetchProtocol (ref), parent (ref), fFlagSduiAdvertiseRuntimeSupportSets (ref), sduiCapabilities (ref), fFlagSduiPerSectionPoolSizing (ref), measureHomeCollectionLayoutModule (ref), homePageFocusedFetchUtilsModule (ref), promiseModule (ref), createHomePageRequestConfig (ref), sduiSharedUtilitiesModule (ref), fFlagLuaAppSduiHomePageSupport (ref), friendRecommendations (ref), readFriendRecommendations (ref), commitHomeSession (ref), fFlagLuaAppSduiHomeFeedStats (ref), sduiLogger (ref), buildHomeFeedStatsModule (ref), appPage (ref), fFlagHomeSduiOfflineCache (ref), sduiHomePageCachePayloadModule (ref), homeOmniFeedCache (ref), discoveryAvailabilityModule (ref), fFlagHomePageSduiPrefetchExtendedClientCapabilities (ref), writeHomePageSduiPrefetchClientCapabilitiesModule (ref), writeHomePageSduiPrefetchDescriptorModule (ref), fetchHomePage (ref)
	local configKey = homeConstantsModule.ConfigKey
	local var1 = getSduiApiStore()
	local var2 = if p2 then p2.forceRefresh else nil
	local var3 = if p2 then p2.contextualFeatures else nil
	local var4 = if p2 then p2.requestIntent else nil
	local var5 = if typeof(var4) == "string" and var4 ~= "" then var4 elseif var2 then homeConstantsModule.RequestIntent.ManualRefresh else homeConstantsModule.RequestIntent.LogIn
	var4 = if p2 then p2.focusedRefresh else nil
	local _, data = var1.getData(configKey)
	
	if (var2 or data) and (not var1.isInFlight(configKey) and not var4) then
		setHomePageDataStatuses(retrievalStatus.Fetching)
		local var6 = false
		
		if fFlagEnableHomePageSduiPrefetch and homePageSessionModule:GetCommitted() == nil then
			local var7 = prefetchProtocol.default:popPendingPrefetchGuid()
			
			if var7 ~= nil then
				var6 = homePageSessionModule:Adopt(var7)
			end
		end
		if not var6 then
			homePageSessionModule:Refresh()
		end
	end
	local enabledCapabilityNumbersWithoutExtendedMarker, var8
	local serviceContractsProtoModule = require(parent.ServiceContractsProto)
	local homePage = serviceContractsProtoModule.apppageplatform.home.home_page
	local clientCapabilities = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities
	local _ = nil
	local _ = nil
	
	if fFlagSduiAdvertiseRuntimeSupportSets then
		enabledCapabilityNumbersWithoutExtendedMarker = sduiCapabilities.getEnabledCapabilityNumbersWithoutExtendedMarker()
		var8 = sduiCapabilities.buildClientCapabilities()
	else
		enabledCapabilityNumbersWithoutExtendedMarker = sduiCapabilities.getEnabledCapabilityNumbers({
			"CAPABILITY_SUPPORTS_HYDRATION_CLIENT_HINTS",
			if fFlagSduiPerSectionPoolSizing then "CAPABILITY_SUPPORTS_MULTI_SIZE_POOL" else nil
		})
		var8 = clientCapabilities.new({
			enabled_capabilities = enabledCapabilityNumbersWithoutExtendedMarker
		})
	end
	local t = {
		pageTimer = p1,
		homeApi = homePage,
		requestIntent = var5,
		contextualFeatures = var3,
		clientCapabilities = var8,
		collectionLayout = if fFlagEnableHomePageSduiPrefetch then measureHomeCollectionLayoutModule() else nil
	}
	local var9 = if var4 then homePageFocusedFetchUtilsModule.register(var4) else nil
	
	if var4 and var9 == nil then
		return promiseModule.resolve(false), configKey
	end
	local var10 = createHomePageRequestConfig(t, {
		configKey = configKey,
		sessionId = homePageSessionModule:Get(),
		topicIds = if var4 then { var4.topicId } else nil
	})
	var10.mergeStrategy = sduiSharedUtilitiesModule.streamingFeedMergeStrategy
	
	if var9 then
		homePageFocusedFetchUtilsModule.applyToRequestConfig(var10, var9)
	end
	if var9 == nil then
		function var39.onSuccess(p3, p4)
			-- upvalues: fFlagLuaAppSduiHomePageSupport (copy), friendRecommendations (copy), readFriendRecommendations (copy), commitHomeSession (copy), fFlagLuaAppSduiHomeFeedStats (copy), sduiLogger (copy), buildHomeFeedStatsModule (copy), appPage (copy), setHomePageDataStatuses (copy), retrievalStatus (copy), fFlagHomeSduiOfflineCache (copy), sduiHomePageCachePayloadModule (copy), homeOmniFeedCache (copy), discoveryAvailabilityModule (copy), fFlagEnableHomePageSduiPrefetch (copy), fFlagHomePageSduiPrefetchExtendedClientCapabilities (copy), writeHomePageSduiPrefetchClientCapabilitiesModule (copy), var8 (write), writeHomePageSduiPrefetchDescriptorModule (copy), enabledCapabilityNumbersWithoutExtendedMarker (write)
			if fFlagLuaAppSduiHomePageSupport then
				friendRecommendations.getStore().replaceFriendRecommendations(readFriendRecommendations(p4))
			end
			commitHomeSession(p3, p4)
			
			if fFlagLuaAppSduiHomeFeedStats then
				local var11 = if type(p4) == "table" then p4.request_id else nil
				sduiLogger.reportSduiV2FeedStats(buildHomeFeedStatsModule(p4), appPage.Home, if var11 == nil or var11 == "" then nil else var11)
			end
			setHomePageDataStatuses(retrievalStatus.Done)
			
			if fFlagHomeSduiOfflineCache and p4 then
				task.defer(function()
					-- upvalues: sduiHomePageCachePayloadModule (copy), p4 (ref), homeOmniFeedCache (copy)
					local var12 = sduiHomePageCachePayloadModule.buildSduiHomePageCachePayload(p4)
					
					if var12 then
						homeOmniFeedCache.cacheSduiHomePageData(sduiHomePageCachePayloadModule.serializeSduiHomePageCache(var12))
					end
				end)
				discoveryAvailabilityModule.Signals.getCacheStore().setHomePageDataSource("API")
			end
			if fFlagEnableHomePageSduiPrefetch then
				if fFlagHomePageSduiPrefetchExtendedClientCapabilities then
					writeHomePageSduiPrefetchClientCapabilitiesModule(var8)
					
					return
				end
				writeHomePageSduiPrefetchDescriptorModule(enabledCapabilityNumbersWithoutExtendedMarker)
			end
		end
		
		var10.recoverFromError = if fFlagHomeSduiOfflineCache then {
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
		
		function var39.refresh(p3)
			-- upvalues: fetchHomePage (copy), var3 (ref)
			return fetchHomePage(p3, { forceRefresh = true, contextualFeatures = var3 })
		end
	end
	local var11 = var1.fetchIfNeeded(var10, if var9 then true else var2)
	
	if var9 then
		return homePageFocusedFetchUtilsModule.resolve(var11, var9), configKey
	end
	return var11 and var11:catch(function(_)
		-- upvalues: fFlagHomeSduiOfflineCache (copy), discoveryAvailabilityModule (copy), setHomePageDataStatuses (copy), retrievalStatus (copy)
		if not fFlagHomeSduiOfflineCache or discoveryAvailabilityModule.Signals.getCacheStore().getHomePageDataSource(false) ~= "Cache" then
			setHomePageDataStatuses(retrievalStatus.Failed)
		end
	end), configKey
end

return fetchHomePage