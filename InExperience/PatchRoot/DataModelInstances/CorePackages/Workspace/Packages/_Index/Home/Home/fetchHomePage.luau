local home = script:FindFirstAncestor("Home")
local parent = home.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local discoveryAvailabilityModule = require(parent.DiscoveryAvailability)
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local setPageSessionTimestamp = require(parent.PageSessionRodux).SetPageSessionTimestamp
local getSduiServiceDependenciesStore = require(parent.SduiCoreSystem).getSduiServiceDependenciesStore
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getSduiTemplateStore = sduiSharedUtilitiesModule.getSduiTemplateStore
local sduiApiStorePostConfigContentType = sduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local sduiCapabilities = sduiSharedUtilitiesModule.SduiCapabilities
local getStartupStore = require(parent.StartupStore).GetStartupStore
local homeConstantsModule = require(home.HomeConstants)
local homePageSessionModule = require(home.HomePageSession)
local homeOmniFeedCache = require(parent.DiscoveryUtils).HomeOmniFeedCache
local sduiHomePageCachePayloadModule = require(home.SduiHomePageCachePayload)
local getHomePageUrlModule = require(home.getHomePageUrl)
local buildHomePageRequestModule = require(home.buildHomePageRequest)
local measureHomeCollectionLayoutModule = require(home.measureHomeCollectionLayout)
local writeHomePageSduiPrefetchDescriptorModule = require(home.writeHomePageSduiPrefetchDescriptor)
local prefetchProtocol = require(parent.PrefetchProtocol).PrefetchProtocol
local friendRecommendations = require(parent.HomeStore).FriendRecommendations
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiClientTemplateCache = sharedFlagsModule.FFlagSduiClientTemplateCache
local fFlagEnableHomePageSduiPrefetch = sharedFlagsModule.FFlagEnableHomePageSduiPrefetch
local fFlagUseSignalsForStartup = sharedFlagsModule.FFlagUseSignalsForStartup
local fFlagHomeSduiOfflineCache = sharedFlagsModule.FFlagHomeSduiOfflineCache
local fFlagLuaAppSduiHomePageSupport = sharedFlagsModule.FFlagLuaAppSduiHomePageSupport

local function _(p1, p2)
	-- upvalues: homeConstantsModule (ref)
	return if typeof(p1) == "string" and p1 ~= "" then p1 elseif p2 then homeConstantsModule.RequestIntent.ManualRefresh else homeConstantsModule.RequestIntent.LogIn
end

local _ = function(p1)
	local var1 = if type(p1) == "table" then p1.request_id else nil
	
	return if var1 == nil or var1 == "" then nil else var1
end

local _ = function(p1)
	local var1 = if type(p1) == "table" then p1.hydration_data else nil
	local var2 = if type(var1) == "table" then var1.friend_recommendation else nil
	
	return if type(var2) == "table" then var2 else {}
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
	-- upvalues: homeConstantsModule (ref), getSduiApiStore (ref), setHomePageDataStatuses (ref), retrievalStatus (ref), fFlagEnableHomePageSduiPrefetch (ref), homePageSessionModule (ref), prefetchProtocol (ref), parent (ref), sduiCapabilities (ref), measureHomeCollectionLayoutModule (ref), sduiResponseType (ref), getHomePageUrlModule (ref), appPage (ref), sduiApiStorePostConfigContentType (ref), buildHomePageRequestModule (ref), fFlagSduiClientTemplateCache (ref), getSduiTemplateStore (ref), sduiSharedUtilitiesModule (ref), fFlagLuaAppSduiHomePageSupport (ref), friendRecommendations (ref), commitHomeSession (ref), fFlagHomeSduiOfflineCache (ref), sduiHomePageCachePayloadModule (ref), homeOmniFeedCache (ref), discoveryAvailabilityModule (ref), writeHomePageSduiPrefetchDescriptorModule (ref), fetchHomePage (ref)
	local configKey = homeConstantsModule.ConfigKey
	local var1 = getSduiApiStore()
	local var2 = if p2 then p2.forceRefresh else nil
	local var3 = if p2 then p2.contextualFeatures else nil
	local var4 = if p2 then p2.requestIntent else nil
	local var5 = if typeof(var4) == "string" and var4 ~= "" then var4 elseif var2 then homeConstantsModule.RequestIntent.ManualRefresh else homeConstantsModule.RequestIntent.LogIn
	var4, data = var1.getData(configKey)
	
	if (var2 or data) and not var1.isInFlight(configKey) then
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
	local serviceContractsProtoModule = require(parent.ServiceContractsProto)
	local homePage = serviceContractsProtoModule.apppageplatform.home.home_page
	local enabledCapabilityNumbers = sduiCapabilities.getEnabledCapabilityNumbers({ "CAPABILITY_SUPPORTS_HYDRATION_CLIENT_HINTS" })
	local var8 = var1.fetchIfNeeded({
		enableStreaming = false,
		allowNoConfigsBuilt = true,
		responseType = sduiResponseType.Protobuf,
		url = getHomePageUrlModule(),
		surfaceKey = appPage.Home,
		configKey = configKey,
		loadTimer = p1,
		apiProto = homePage.HomePageResponse,
		postConfig = {
			contentType = sduiApiStorePostConfigContentType.Proto,
			protoMessage = homePage.HomePageRequest,
			body = buildHomePageRequestModule(homePage, {
				sessionId = homePageSessionModule:Get(),
				requestIntent = var5,
				contextualFeatures = var3,
				cachedRobloxComponentToTemplateId = if fFlagSduiClientTemplateCache then getSduiTemplateStore().getCachedRobloxComponentToTemplateId(appPage.Home) else nil,
				clientCapabilities = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities.new({ enabled_capabilities = enabledCapabilityNumbers }),
				collectionLayout = if fFlagEnableHomePageSduiPrefetch then measureHomeCollectionLayoutModule() else nil
			})
		},
		enableTemplateCache = if fFlagSduiClientTemplateCache then true else nil,
		mergeStrategy = sduiSharedUtilitiesModule.streamingFeedMergeStrategy,
		onSuccess = function(p3, p4)
			-- upvalues: fFlagLuaAppSduiHomePageSupport (copy), friendRecommendations (copy), commitHomeSession (copy), setHomePageDataStatuses (copy), retrievalStatus (copy), fFlagHomeSduiOfflineCache (copy), sduiHomePageCachePayloadModule (copy), homeOmniFeedCache (copy), discoveryAvailabilityModule (copy), fFlagEnableHomePageSduiPrefetch (copy), writeHomePageSduiPrefetchDescriptorModule (copy), enabledCapabilityNumbers (ref)
			if fFlagLuaAppSduiHomePageSupport then
				local replaceFriendRecommendations = friendRecommendations.getStore().replaceFriendRecommendations
				local var9 = if type(p4) == "table" then p4.hydration_data else nil
				local var10 = if type(var9) == "table" then var9.friend_recommendation else nil
				replaceFriendRecommendations(if type(var10) == "table" then var10 else {})
			end
			commitHomeSession(p3, p4)
			setHomePageDataStatuses(retrievalStatus.Done)
			
			if fFlagHomeSduiOfflineCache and p4 then
				task.defer(function()
					-- upvalues: sduiHomePageCachePayloadModule (copy), p4 (ref), homeOmniFeedCache (copy)
					local var11 = sduiHomePageCachePayloadModule.buildSduiHomePageCachePayload(p4)
					
					if var11 then
						homeOmniFeedCache.cacheSduiHomePageData(sduiHomePageCachePayloadModule.serializeSduiHomePageCache(var11))
					end
				end)
				discoveryAvailabilityModule.Signals.getCacheStore().setHomePageDataSource("API")
			end
			if fFlagEnableHomePageSduiPrefetch then
				writeHomePageSduiPrefetchDescriptorModule(enabledCapabilityNumbers)
			end
		end,
		recoverFromError = if fFlagHomeSduiOfflineCache then {
			getDecodedResponse = function()
				-- upvalues: sduiHomePageCachePayloadModule (copy), homeOmniFeedCache (copy)
				return sduiHomePageCachePayloadModule.deserializeSduiHomePageCache(homeOmniFeedCache.getCachedSduiHomePageData())
			end,
			onApplied = function()
				-- upvalues: discoveryAvailabilityModule (copy), setHomePageDataStatuses (copy), retrievalStatus (copy)
				discoveryAvailabilityModule.Signals.getCacheStore().setHomePageDataSource("Cache")
				setHomePageDataStatuses(retrievalStatus.Done)
			end
		} else nil,
		refresh = function(p3)
			-- upvalues: fetchHomePage (copy), var3 (ref)
			return fetchHomePage(p3, { forceRefresh = true, contextualFeatures = var3 })
		end
	}, var2)
	
	return var8 and var8:catch(function(_)
		-- upvalues: fFlagHomeSduiOfflineCache (copy), discoveryAvailabilityModule (copy), setHomePageDataStatuses (copy), retrievalStatus (copy)
		if not fFlagHomeSduiOfflineCache or discoveryAvailabilityModule.Signals.getCacheStore().getHomePageDataSource(false) ~= "Cache" then
			setHomePageDataStatuses(retrievalStatus.Failed)
		end
	end), configKey
end

return fetchHomePage