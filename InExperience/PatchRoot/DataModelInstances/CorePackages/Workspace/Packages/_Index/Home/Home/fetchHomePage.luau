local home = script:FindFirstAncestor("Home")
local parent = home.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local setPageSessionTimestamp = require(parent.PageSessionRodux).SetPageSessionTimestamp
local getSduiServiceDependenciesStore = require(parent.SduiCoreSystem).getSduiServiceDependenciesStore
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getSduiTemplateStore = sduiSharedUtilitiesModule.getSduiTemplateStore
local sduiApiStorePostConfigContentType = sduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local sduiCapabilities = sduiSharedUtilitiesModule.SduiCapabilities
local homeConstantsModule = require(home.HomeConstants)
local homePageSessionModule = require(home.HomePageSession)
local getHomePageUrlModule = require(home.getHomePageUrl)
local buildHomePageRequestModule = require(home.buildHomePageRequest)
local fFlagSduiClientTemplateCache = require(parent.SharedFlags).FFlagSduiClientTemplateCache

local function _(p1, p2)
	-- upvalues: homeConstantsModule (ref)
	return if typeof(p1) == "string" and p1 ~= "" then p1 elseif p2 then homeConstantsModule.RequestIntent.ManualRefresh else homeConstantsModule.RequestIntent.LogIn
end

local _ = function(p1)
	local var1 = if type(p1) == "table" then p1.request_id else nil
	
	return if var1 == nil or var1 == "" then nil else var1
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

local function fetchHomePage(p1, p2)
	-- upvalues: homeConstantsModule (ref), getSduiApiStore (ref), homePageSessionModule (ref), parent (ref), sduiCapabilities (ref), sduiResponseType (ref), getHomePageUrlModule (ref), appPage (ref), sduiApiStorePostConfigContentType (ref), buildHomePageRequestModule (ref), fFlagSduiClientTemplateCache (ref), getSduiTemplateStore (ref), sduiSharedUtilitiesModule (ref), commitHomeSession (ref), fetchHomePage (ref)
	local configKey = homeConstantsModule.ConfigKey
	local var1 = getSduiApiStore()
	local var2 = if p2 then p2.forceRefresh else nil
	local var3 = if p2 then p2.contextualFeatures else nil
	local var4 = if p2 then p2.requestIntent else nil
	local var5 = if typeof(var4) == "string" and var4 ~= "" then var4 elseif var2 then homeConstantsModule.RequestIntent.ManualRefresh else homeConstantsModule.RequestIntent.LogIn
	var4, data = var1.getData(configKey)
	
	if (var2 or data) and not var1.isInFlight(configKey) then
		homePageSessionModule:Refresh()
	end
	local serviceContractsProtoModule = require(parent.ServiceContractsProto)
	local homePage = serviceContractsProtoModule.apppageplatform.home.home_page
	
	return var1.fetchIfNeeded({
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
				clientCapabilities = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities.new({
					enabled_capabilities = sduiCapabilities.getEnabledCapabilityNumbers({ "CAPABILITY_SUPPORTS_HYDRATION_CLIENT_HINTS" })
				})
			})
		},
		enableTemplateCache = if fFlagSduiClientTemplateCache then true else nil,
		mergeStrategy = sduiSharedUtilitiesModule.streamingFeedMergeStrategy,
		onSuccess = commitHomeSession,
		refresh = function(p3)
			-- upvalues: fetchHomePage (copy), var3 (ref)
			return fetchHomePage(p3, { forceRefresh = true, contextualFeatures = var3 })
		end
	}, var2), configKey
end

return fetchHomePage