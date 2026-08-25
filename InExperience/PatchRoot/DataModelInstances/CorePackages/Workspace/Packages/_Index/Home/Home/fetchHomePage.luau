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

local function _(p0, p1)
	-- upvalues: homeConstantsModule (ref)
	return if typeof(p0) == "string" and p0 ~= "" then p0 elseif p1 then homeConstantsModule.RequestIntent.ManualRefresh else homeConstantsModule.RequestIntent.LogIn
end

local _ = function(p2)
	local var8 = if type(p2) == "table" then p2.request_id else nil
	
	return if var8 == nil or var8 == "" then nil else var8
end

local function commitHomeSession(_, p3)
	-- upvalues: homePageSessionModule (ref), getSduiServiceDependenciesStore (ref), appPage (ref), setPageSessionTimestamp (ref)
	local var9 = if type(p3) == "table" then p3.request_id else nil
	
	if homePageSessionModule:Commit(if var9 == nil or var9 == "" then nil else var9) then
		local dependencies = getSduiServiceDependenciesStore().getDependencies(appPage.Home)
		assert(dependencies, "dependencies is nil")
		dependencies.dispatch(setPageSessionTimestamp(appPage.Home))
		
		return
	end
end

local function fetchHomePage(p4, p5)
	-- upvalues: homeConstantsModule (ref), getSduiApiStore (ref), homePageSessionModule (ref), parent (ref), sduiCapabilities (ref), sduiResponseType (ref), getHomePageUrlModule (ref), appPage (ref), sduiApiStorePostConfigContentType (ref), buildHomePageRequestModule (ref), fFlagSduiClientTemplateCache (ref), getSduiTemplateStore (ref), sduiSharedUtilitiesModule (ref), commitHomeSession (ref), fetchHomePage (ref)
	local configKey = homeConstantsModule.ConfigKey
	local var11 = getSduiApiStore()
	local var12 = if p5 then p5.forceRefresh else nil
	local var13 = if p5 then p5.contextualFeatures else nil
	local var14 = if p5 then p5.requestIntent else nil
	local var15 = if typeof(var14) == "string" and var14 ~= "" then var14 elseif var12 then homeConstantsModule.RequestIntent.ManualRefresh else homeConstantsModule.RequestIntent.LogIn
	var14, data = var11.getData(configKey)
	
	if (var12 or data) and not var11.isInFlight(configKey) then
		homePageSessionModule:Refresh()
	end
	local serviceContractsProtoModule = require(parent.ServiceContractsProto)
	local homePage = serviceContractsProtoModule.apppageplatform.home.home_page
	
	return var11.fetchIfNeeded({
		enableStreaming = false,
		allowNoConfigsBuilt = true,
		responseType = sduiResponseType.Protobuf,
		url = getHomePageUrlModule(),
		surfaceKey = appPage.Home,
		configKey = configKey,
		loadTimer = p4,
		apiProto = homePage.HomePageResponse,
		postConfig = {
			contentType = sduiApiStorePostConfigContentType.Proto,
			protoMessage = homePage.HomePageRequest,
			body = buildHomePageRequestModule(homePage, {
				sessionId = homePageSessionModule:Get(),
				requestIntent = var15,
				contextualFeatures = var13,
				cachedRobloxComponentToTemplateId = if fFlagSduiClientTemplateCache then getSduiTemplateStore().getCachedRobloxComponentToTemplateId(appPage.Home) else nil,
				clientCapabilities = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities.new({
					enabled_capabilities = sduiCapabilities.getEnabledCapabilityNumbers({ "CAPABILITY_SUPPORTS_HYDRATION_CLIENT_HINTS" })
				})
			})
		},
		enableTemplateCache = if fFlagSduiClientTemplateCache then true else nil,
		mergeStrategy = sduiSharedUtilitiesModule.streamingFeedMergeStrategy,
		onSuccess = commitHomeSession,
		refresh = function(p6)
			-- upvalues: fetchHomePage (copy), var13 (ref)
			return fetchHomePage(p6, { forceRefresh = true, contextualFeatures = var13 })
		end
	}, var12), configKey
end

return fetchHomePage