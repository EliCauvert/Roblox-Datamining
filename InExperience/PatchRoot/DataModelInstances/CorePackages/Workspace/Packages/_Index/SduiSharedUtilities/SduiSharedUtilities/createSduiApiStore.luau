local HttpService = game:GetService("HttpService")
local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiLogger = SduiCoreSystemModule.SduiLogger
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.HttpClient)
local DataHydrationModule = require(Parent.DataHydration)
local CreateDataCacheFunction = DataHydrationModule.createDataCache
local CreateDataResolverFunction = DataHydrationModule.createDataResolver
local GetLocalPlayerUserIdFunction = DataHydrationModule.DataHydrationUtils.getLocalPlayerUserId
local SduiIntegrationTypesModule = require(SduiSharedUtilities.SduiIntegrationTypes)
local SduiRequestConcurrencyPolicy = SduiIntegrationTypesModule.SduiRequestConcurrencyPolicy
local SduiRequestStatus = SduiIntegrationTypesModule.SduiRequestStatus
local _ = require(SduiSharedUtilities.SduiLoadTimer)
local SduiProtobufResponseHelpersModule = require(SduiSharedUtilities.SduiProtobufResponseHelpers)
local MakeProtoResponseDecoderFunction = SduiProtobufResponseHelpersModule.makeProtoResponseDecoder
local MakeProtobufJsonResponseDecoderFunction = SduiProtobufResponseHelpersModule.makeProtobufJsonResponseDecoder
local SduiResponseType = SduiIntegrationTypesModule.SduiResponseType
local HandleSduiApiResponseModule = require(SduiSharedUtilities.handleSduiApiResponse)
local SduiPageAnalyticsModule = require(SduiSharedUtilities.SduiPageAnalytics)
local SduiApiStorePostConfigModule = require(SduiSharedUtilities.SduiApiStorePostConfig)
local _ = require(SduiSharedUtilities.SduiApiRequestConfig)
local BuildSduiRequestHeadersModule = require(SduiSharedUtilities.buildSduiRequestHeaders)
local CreateSduiStreamingResponseHandlerModule = require(SduiSharedUtilities.createSduiStreamingResponseHandler)
local SduiRetryPolicyModule = require(SduiSharedUtilities.SduiRetryPolicy)
local SendSduiHttpRequestModule = require(SduiSharedUtilities.sendSduiHttpRequest)
local FFlagSduiAllowNoConfigsBuilt = require(Parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local FFlagSduiAlwaysCacheWithIdentifier = require(Parent.SharedFlags).FFlagSduiAlwaysCacheWithIdentifier
local FFlagLuaAppSduiStreamingChunkedResponses = require(Parent.SharedFlags).FFlagLuaAppSduiStreamingChunkedResponses
local FFlagSduiDismissPromptAction = require(Parent.SharedFlags).FFlagSduiDismissPromptAction
local FFlagPromptsEdpOpenReplaceOnFetch = require(Parent.SharedFlags).FFlagPromptsEdpOpenReplaceOnFetch
local FFlagSduiApiStoreUpdateInputData = require(Parent.SharedFlags).FFlagSduiApiStoreUpdateInputData
local FFlagAppChatConversationTrustedFriendUpsellBanner = require(Parent.SharedFlags).FFlagAppChatConversationTrustedFriendUpsellBanner
local FFlagSduiUseHttpClientModule = require(SduiSharedUtilities.Flags.FFlagSduiUseHttpClient)
local FFlagSduiRequestCountersModule = require(SduiSharedUtilities.Flags.FFlagSduiRequestCounters)
local FFlagSduiFreshInputDataSignalOnRebuild = require(Parent.SharedFlags).FFlagSduiFreshInputDataSignalOnRebuild
local FFlagSduiMrRouterHeadersModule = require(SduiSharedUtilities.Flags.FFlagSduiMrRouterHeaders)
local FFlagHomeSduiOfflineCache = require(Parent.SharedFlags).FFlagHomeSduiOfflineCache
local FFlagLuaAppEnableSduiHomePage = require(Parent.SharedFlags).FFlagLuaAppEnableSduiHomePage
local FFlagSduiStreamingRefreshReplacesInputData = require(Parent.SharedFlags).FFlagSduiStreamingRefreshReplacesInputData
local FFlagDataHydrationAccountReset = require(Parent.SharedFlags).FFlagDataHydrationAccountReset
local FFlagHomePageRefetchOnDataHydrationAccountReset = require(Parent.SharedFlags).FFlagHomePageRefetchOnDataHydrationAccountReset
local SduiPageRequestPriority = game:DefineFastInt("SduiPageRequestPriority", 1)
local ResolveSduiCacheEntryModule = require(SduiSharedUtilities.resolveSduiCacheEntry)
local AccumulateSduiCacheSubEntriesModule = require(SduiSharedUtilities.accumulateSduiCacheSubEntries)

local function _(p1, Callback)
	return if Callback == nil then p1.isResponseCurrent == nil or p1.isResponseCurrent() else Callback() and (p1.isResponseCurrent == nil or p1.isResponseCurrent())
end

local _ = function(p1, p2, p3): boolean
	-- upvalues: SduiPageAnalyticsModule (copy)
	if p1.isCurrentRequest(p2.accountPlayerId, p2.accountGeneration) then
		return false
	else
		SduiPageAnalyticsModule.sendStaleResponseDiscarded(p2.surfaceKey, if p2.enableStreaming then "streaming" else "buffered", p3)
		
		return true
	end
end

local function getSduiRequestEndpointForCounters(Text: string): string
	if Text == nil or Text == "" then
		return "unknown"
	end
	local Match: string? = string.match(string.gsub(Text, "^%a[%w+.%-]*://", ""), "^[^?#]*")
	
	if Match == nil or Match == "" then
		return "unknown"
	end
	local Match1, Match2 = string.match(Match, "^([^/]*)(.*)$")
	local List = {}
	
	for i in string.gmatch(Match2, "[^/]+") do
		table.insert(List, if string.match(i, "^%d+$") == nil then i else "{id}")
	end
	return `{Match1}/{table.concat(List, "/")}`
end

return function(p1)
	-- upvalues: CreateDataCacheFunction (copy), FFlagDataHydrationAccountReset (copy), FFlagLuaAppEnableSduiHomePage (copy), SignalsModule (copy), PromiseModule (copy), FFlagSduiRequestCountersModule (copy), getSduiRequestEndpointForCounters (copy), SduiResponseType (copy), FFlagLuaAppSduiStreamingChunkedResponses (copy), MakeProtobufJsonResponseDecoderFunction (copy), MakeProtoResponseDecoderFunction (copy), FFlagSduiStreamingRefreshReplacesInputData (copy), HandleSduiApiResponseModule (copy), SduiProtobufResponseHelpersModule (copy), FFlagSduiFreshInputDataSignalOnRebuild (copy), FFlagSduiAllowNoConfigsBuilt (copy), FFlagHomeSduiOfflineCache (copy), SduiLogger (copy), SduiErrors (copy), SduiParseHelpers (copy), SduiRequestStatus (copy), CreateSduiStreamingResponseHandlerModule (copy), FFlagHomePageRefetchOnDataHydrationAccountReset (copy), SduiPageAnalyticsModule (copy), FFlagSduiUseHttpClientModule (copy), AccumulateSduiCacheSubEntriesModule (copy), FFlagPromptsEdpOpenReplaceOnFetch (copy), CryoModule (copy), SduiApiStorePostConfigModule (copy), SduiRetryPolicyModule (copy), SduiPageRequestPriority (copy), SendSduiHttpRequestModule (copy), HttpService (copy), FFlagSduiMrRouterHeadersModule (copy), BuildSduiRequestHeadersModule (copy), CreateDataResolverFunction (copy), SduiRequestConcurrencyPolicy (copy), GetLocalPlayerUserIdFunction (copy), ResolveSduiCacheEntryModule (copy), FFlagSduiAlwaysCacheWithIdentifier (copy), FFlagAppChatConversationTrustedFriendUpsellBanner (copy), FFlagSduiDismissPromptAction (copy), FFlagSduiApiStoreUpdateInputData (copy)
	local DataCache = CreateDataCacheFunction(nil, nil, if FFlagDataHydrationAccountReset then { observeLocalUser = false } else nil)
	local RequestConfigs = {}
	local T = if FFlagLuaAppEnableSduiHomePage then {} else nil
	local t = {}
	local t1 = {}
	
	local function completeActiveRequest(Key, p2, p3, p4)
		-- upvalues: t1 (ref), RequestConfigs (ref)
		local Entry = t1[Key]
		
		if Entry then
			t1[Key] = nil
			
			if p2 then
				Entry.resolve(p3)
			else
				Entry.reject(p3)
			end
		end
		if p2 then
			local RequestConfig = RequestConfigs[Key]
			
			if RequestConfig and RequestConfig.onSuccess then
				RequestConfig.onSuccess(p3, p4)
			end
		end
	end
	
	local function isInFlight(p2): boolean
		-- upvalues: t1 (ref), t (ref)
		return t1[p2] ~= nil or t[p2] == true
	end
	
	local t2 = {}
	local v1 = nil
	
	local function getInputDataSignals(Key)
		-- upvalues: t2 (ref), SignalsModule (upval)
		local Entry = t2[Key]
		
		if Entry == nil then
			local Signal, Signal2 = SignalsModule.createSignal(nil)
			Entry = { get = Signal, set = Signal2 }
			t2[Key] = Entry
		end
		return Entry
	end
	
	local t3 = {}
	
	local function _(Key)
		-- upvalues: t3 (copy), SignalsModule (upval)
		local Entry = t3[Key]
		
		if Entry == nil then
			local Signal, Signal2 = SignalsModule.createSignal(0)
			Entry = { get = Signal, set = Signal2 }
			t3[Key] = Entry
		end
		return Entry
	end
	
	local _ = function(Key)
		-- upvalues: t3 (copy), SignalsModule (upval)
		local Entry = t3[Key]
		
		if Entry == nil then
			local Signal, Signal2 = SignalsModule.createSignal(0)
			Entry = { get = Signal, set = Signal2 }
			t3[Key] = Entry
		end
		Entry.set(function(p2: number): number
			return p2 + 1
		end)
	end
	
	local function setInputDataSignals(Key, Key1, p2)
		-- upvalues: t2 (ref), t3 (copy), SignalsModule (upval)
		t2[Key1] = p2
		local Entry = t3[Key1]
		
		if Entry == nil then
			local Signal, Signal2 = SignalsModule.createSignal(0)
			Entry = { get = Signal, set = Signal2 }
			t3[Key1] = Entry
		end
		Entry.set(function(p3: number): number
			return p3 + 1
		end)
		
		if Key1 ~= Key then
			local Entry1 = t3[Key]
			
			if Entry1 == nil then
				local Signal1, Signal2_1 = SignalsModule.createSignal(0)
				Entry1 = { get = Signal1, set = Signal2_1 }
				t3[Key] = Entry1
			end
			Entry1.set(function(p3: number): number
				return p3 + 1
			end)
		end
	end
	
	local SeedFromDecodedResponse = nil
	
	local function fetchFunction(ConfigKey, CachedItem, p2, Callback)
		-- upvalues: FFlagLuaAppEnableSduiHomePage (upval), RequestConfigs (ref), PromiseModule (upval), completeActiveRequest (copy), FFlagSduiRequestCountersModule (upval), getSduiRequestEndpointForCounters (upval), SduiResponseType (upval), FFlagLuaAppSduiStreamingChunkedResponses (upval), MakeProtobufJsonResponseDecoderFunction (upval), MakeProtoResponseDecoderFunction (upval), FFlagSduiStreamingRefreshReplacesInputData (upval), HandleSduiApiResponseModule (upval), SduiProtobufResponseHelpersModule (upval), getInputDataSignals (copy), FFlagSduiFreshInputDataSignalOnRebuild (upval), setInputDataSignals (copy), FFlagSduiAllowNoConfigsBuilt (upval), FFlagHomeSduiOfflineCache (upval), SduiLogger (upval), SduiErrors (upval), SduiParseHelpers (upval), SeedFromDecodedResponse (ref), SduiRequestStatus (upval), CreateSduiStreamingResponseHandlerModule (upval), FFlagHomePageRefetchOnDataHydrationAccountReset (upval), v1 (ref), SduiPageAnalyticsModule (upval), FFlagSduiUseHttpClientModule (upval), AccumulateSduiCacheSubEntriesModule (upval), DataCache (copy), t (ref), FFlagPromptsEdpOpenReplaceOnFetch (upval), CryoModule (upval), SduiApiStorePostConfigModule (upval), SduiRetryPolicyModule (upval), p1 (copy), SduiPageRequestPriority (upval), SendSduiHttpRequestModule (upval), HttpService (upval), FFlagSduiMrRouterHeadersModule (upval), BuildSduiRequestHeadersModule (upval)
		local v2: boolean = FFlagLuaAppEnableSduiHomePage and p2 ~= nil
		local RequestConfig = if FFlagLuaAppEnableSduiHomePage and v2 then p2 else RequestConfigs[ConfigKey]
		
		if not RequestConfig then
			return PromiseModule.reject("No request config for key", ConfigKey)
		end
		local CompleteActiveRequest = if FFlagLuaAppEnableSduiHomePage and v2 then function(_, p3, p4, p5)
			-- upvalues: RequestConfig (copy)
			if p3 and RequestConfig.onSuccess then
				RequestConfig.onSuccess(p4, p5)
			end
		end else completeActiveRequest
		local Url = RequestConfig.url
		local SduiRequestEndpointForCounters = if FFlagSduiRequestCountersModule then getSduiRequestEndpointForCounters(Url) else ""
		local LoadTimer = RequestConfig.loadTimer
		LoadTimer.logUiRequestSent()
		local IsResponseTypeMatch = RequestConfig.responseType == SduiResponseType.ProtobufJson
		local PostConfig = RequestConfig.postConfig
		local POST: string = if PostConfig then "POST" else "GET"
		local EnableStreaming = if FFlagLuaAppSduiStreamingChunkedResponses then RequestConfig.enableStreaming else nil
		local ProtobufJsonResponseDecoder = if IsResponseTypeMatch then MakeProtobufJsonResponseDecoderFunction(RequestConfig.apiProto) else MakeProtoResponseDecoderFunction(RequestConfig.apiProto)
		local EnableInputDataMerge = if FFlagSduiStreamingRefreshReplacesInputData then RequestConfig.enableInputDataMerge else nil
		
		local function processSduiResponse(Response)
			-- upvalues: RequestConfig (copy), CachedItem (copy), FFlagLuaAppEnableSduiHomePage (upval), FFlagSduiStreamingRefreshReplacesInputData (upval), EnableInputDataMerge (ref), FFlagLuaAppSduiStreamingChunkedResponses (upval), EnableStreaming (copy), HandleSduiApiResponseModule (upval), LoadTimer (copy), ProtobufJsonResponseDecoder (copy), SduiProtobufResponseHelpersModule (upval), getInputDataSignals (upval), FFlagSduiFreshInputDataSignalOnRebuild (upval), setInputDataSignals (upval), FFlagSduiAllowNoConfigsBuilt (upval)
			local HandleSduiApiResponseModuleResult, HandleSduiApiResponseModuleResult2 = HandleSduiApiResponseModule({
				response = Response,
				loadTimer = LoadTimer,
				surfaceKey = RequestConfig.surfaceKey,
				configCacheKey = RequestConfig.configKey,
				decodeResponse = ProtobufJsonResponseDecoder,
				parseHydrationDataFromResponse = SduiProtobufResponseHelpersModule.parseHydrationDataFromResponse,
				parseTemplateEntriesFromResponse = RequestConfig.parseTemplateEntriesFromResponse or SduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse,
				parsePageEntriesFromResponse = RequestConfig.parsePageEntriesFromResponse or SduiProtobufResponseHelpersModule.parsePageEntriesFromResponse,
				parseLocalizedLiteralsFromResponse = RequestConfig.parseLocalizedLiteralsFromResponse or SduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse,
				getInputDataSignalsForRequest = getInputDataSignals,
				setInputDataSignalsForRequest = if FFlagSduiFreshInputDataSignalOnRebuild then setInputDataSignals else nil,
				enableStreamingMerge = if FFlagLuaAppSduiStreamingChunkedResponses then EnableStreaming else nil,
				enableInputDataMerge = if FFlagLuaAppEnableSduiHomePage or FFlagSduiStreamingRefreshReplacesInputData then if EnableInputDataMerge == nil then FFlagLuaAppSduiStreamingChunkedResponses and EnableStreaming or (RequestConfig.enableInputDataMerge or nil) else EnableInputDataMerge else nil,
				paginateResponse = RequestConfig.isPaginated and CachedItem.data(false) ~= nil,
				buildNextPageUrl = RequestConfig.buildNextPageUrl,
				buildNextPagePostBody = RequestConfig.buildNextPagePostBody,
				allowNoConfigsBuilt = if FFlagSduiAllowNoConfigsBuilt then RequestConfig.allowNoConfigsBuilt else nil,
				mergeStrategy = RequestConfig.mergeStrategy,
				cacheSingleEntryWithIdentifier = if FFlagLuaAppEnableSduiHomePage then RequestConfig.cacheSingleEntryWithIdentifier else nil,
				enableTemplateCache = RequestConfig.enableTemplateCache
			})
			
			if FFlagSduiStreamingRefreshReplacesInputData then
				EnableInputDataMerge = nil
			end
			return HandleSduiApiResponseModuleResult, HandleSduiApiResponseModuleResult2
		end
		
		local Callback1 = if FFlagHomeSduiOfflineCache then function(p3)
			-- upvalues: RequestConfig (copy), CachedItem (copy), SduiLogger (upval), SduiErrors (upval), SduiParseHelpers (upval), SeedFromDecodedResponse (upval), ConfigKey (copy), LoadTimer (copy), SduiRequestStatus (upval)
			local RecoverFromError = RequestConfig.recoverFromError
			
			if RecoverFromError == nil then
				return nil
			end
			local DataResult = CachedItem.data(false)
			
			if type(DataResult) == "table" and next(DataResult) ~= nil then
				return DataResult
			end
			local function _(Message)
				-- upvalues: SduiLogger (upval), SduiErrors (upval), RequestConfig (upval)
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToApplyFallbackResponse, { message = Message, name = RequestConfig.surfaceKey }, RequestConfig.surfaceKey)
			end
			
			local Success, Result = pcall(RecoverFromError.getDecodedResponse, p3)
			
			if not Success then
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToApplyFallbackResponse, {
					message = `recovery errored: {SduiParseHelpers.stringifyValue(Result)}`,
					name = RequestConfig.surfaceKey
				}, RequestConfig.surfaceKey)
				
				return nil
			end
			if Result == nil then
				return nil
			end
			local Success1, Result1 = pcall(SeedFromDecodedResponse, {
				surfaceKey = RequestConfig.surfaceKey,
				configKey = ConfigKey,
				decodedResponse = Result,
				loadTimer = LoadTimer,
				apiProto = RequestConfig.apiProto,
				requestConfig = RequestConfig
			})
			
			if not Success1 then
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToApplyFallbackResponse, {
					message = `recovery errored: {SduiParseHelpers.stringifyValue(Result1)}`,
					name = RequestConfig.surfaceKey
				}, RequestConfig.surfaceKey)
				
				return nil
			end
			local DataResult1 = CachedItem.data(false)
			
			if type(DataResult1) ~= "table" or next(DataResult1) == nil then
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToApplyFallbackResponse, {
					message = "recovery built no configs",
					name = RequestConfig.surfaceKey
				}, RequestConfig.surfaceKey)
				
				return nil
			end
			LoadTimer.updateRequestStatus(SduiRequestStatus.LoadedFromCache)
			
			if RecoverFromError.onApplied ~= nil then
				RecoverFromError.onApplied()
			end
			return DataResult1
		end else nil
		local v3 = nil
		local SduiStreamingResponseHandlerModule = if FFlagLuaAppSduiStreamingChunkedResponses and EnableStreaming then CreateSduiStreamingResponseHandlerModule({
			configKey = ConfigKey,
			loadTimer = LoadTimer,
			processFrame = function(p3)
				-- upvalues: FFlagHomePageRefetchOnDataHydrationAccountReset (upval), v1 (upval), RequestConfig (copy), SduiPageAnalyticsModule (upval), CachedItem (copy), FFlagLuaAppEnableSduiHomePage (upval), Callback (copy), processSduiResponse (copy), FFlagSduiUseHttpClientModule (upval), v3 (ref), AccumulateSduiCacheSubEntriesModule (upval), DataCache (upval), ConfigKey (copy)
				if FFlagHomePageRefetchOnDataHydrationAccountReset then
					local Flag = nil
					if v1.isCurrentRequest(RequestConfig.accountPlayerId, RequestConfig.accountGeneration) then
						Flag = false
					else
						SduiPageAnalyticsModule.sendStaleResponseDiscarded(RequestConfig.surfaceKey, if RequestConfig.enableStreaming then "streaming" else "buffered", "streamFrame")
						Flag = true
					end
					if Flag then
						return true, CachedItem.data(false)
					end
				end
				if FFlagLuaAppEnableSduiHomePage and not (if Callback == nil then RequestConfig.isResponseCurrent == nil or RequestConfig.isResponseCurrent() else Callback() and (RequestConfig.isResponseCurrent == nil or RequestConfig.isResponseCurrent())) then
					return true, CachedItem.data(false)
				end
				local Success, Result, Result3 = pcall(processSduiResponse, if FFlagSduiUseHttpClientModule then {
					statusCode = 200,
					responseBody = buffer.fromstring(p3),
					stats = {}
				} else { Stats = {}, Body = buffer.fromstring(p3) })
				
				if Success then
					v3 = Result3
					local AccumulateSduiCacheSubEntriesModuleResult = AccumulateSduiCacheSubEntriesModule(Result, CachedItem.data(false))
					DataCache.updateItems({ [ConfigKey] = AccumulateSduiCacheSubEntriesModuleResult })
					
					return true, AccumulateSduiCacheSubEntriesModuleResult
				else
					return false, Result
				end
			end
		}) else nil
		
		local function createRequestPromise(Callback2)
			-- upvalues: PromiseModule (upval), FFlagHomeSduiOfflineCache (upval), FFlagSduiRequestCountersModule (upval), SduiPageAnalyticsModule (upval), RequestConfig (copy), SduiRequestEndpointForCounters (copy), Callback1 (ref), FFlagLuaAppEnableSduiHomePage (upval), CompleteActiveRequest (ref), completeActiveRequest (upval), ConfigKey (copy), FFlagHomePageRefetchOnDataHydrationAccountReset (upval), v1 (upval), LoadTimer (copy), v2 (copy), t (upval), FFlagSduiUseHttpClientModule (upval), SduiRequestStatus (upval), Callback (copy), SduiStreamingResponseHandlerModule (copy), v3 (ref), SduiParseHelpers (upval), SduiLogger (upval), SduiErrors (upval), processSduiResponse (copy), Url (copy), CachedItem (copy), FFlagPromptsEdpOpenReplaceOnFetch (upval), CryoModule (upval)
			return PromiseModule.new(function(Callback10: (any) -> any, Callback9: (any) -> any, Callback3: (any) -> ())
				-- upvalues: FFlagHomeSduiOfflineCache (upval), FFlagSduiRequestCountersModule (upval), SduiPageAnalyticsModule (upval), RequestConfig (upval), SduiRequestEndpointForCounters (upval), Callback1 (upval), FFlagLuaAppEnableSduiHomePage (upval), CompleteActiveRequest (upval), completeActiveRequest (upval), ConfigKey (upval), Callback2 (copy), FFlagHomePageRefetchOnDataHydrationAccountReset (upval), v1 (upval), LoadTimer (upval), v2 (upval), t (upval), FFlagSduiUseHttpClientModule (upval), SduiRequestStatus (upval), Callback (upval), SduiStreamingResponseHandlerModule (upval), v3 (upval), SduiParseHelpers (upval), SduiLogger (upval), SduiErrors (upval), processSduiResponse (upval), Url (upval), CachedItem (upval), FFlagPromptsEdpOpenReplaceOnFetch (upval), CryoModule (upval)
				local Callback6 = Callback10
				local Callback5 = if FFlagHomeSduiOfflineCache then Callback10 else nil
				local StatusCode = nil
				local HttpError = nil
				
				if FFlagSduiRequestCountersModule then
					local Callback7 = Callback10
					local Callback8 = Callback9
					
					Callback10 = function(JoinResults)
						-- upvalues: SduiPageAnalyticsModule (upval), RequestConfig (upval), SduiRequestEndpointForCounters (upval), StatusCode (ref), HttpError (ref), Callback7 (copy)
						SduiPageAnalyticsModule.sendRequestOutcomeCounter(RequestConfig.surfaceKey, SduiRequestEndpointForCounters, "success", StatusCode, HttpError)
						
						return Callback7(JoinResults)
					end
					
					Callback9 = function(p3)
						-- upvalues: SduiPageAnalyticsModule (upval), RequestConfig (upval), SduiRequestEndpointForCounters (upval), StatusCode (ref), HttpError (ref), Callback8 (copy)
						SduiPageAnalyticsModule.sendRequestOutcomeCounter(RequestConfig.surfaceKey, SduiRequestEndpointForCounters, "failure", StatusCode, HttpError)
						
						return Callback8(p3)
					end
				end
				local Callback4 = if FFlagHomeSduiOfflineCache then function(p3, p4)
					-- upvalues: Callback1 (upval), FFlagSduiRequestCountersModule (upval), SduiPageAnalyticsModule (upval), RequestConfig (upval), SduiRequestEndpointForCounters (upval), StatusCode (ref), HttpError (ref), Callback5 (ref), FFlagLuaAppEnableSduiHomePage (upval), CompleteActiveRequest (upval), completeActiveRequest (upval), ConfigKey (upval), Callback9 (ref)
					local CallbackResult = Callback1(p3)
					
					if CallbackResult == nil then
						(if FFlagLuaAppEnableSduiHomePage then CompleteActiveRequest else completeActiveRequest)(ConfigKey, false, p3)
						
						return Callback9(if p4 == nil then p3 else p4)
					end
					if FFlagSduiRequestCountersModule then
						SduiPageAnalyticsModule.sendRequestOutcomeCounter(RequestConfig.surfaceKey, SduiRequestEndpointForCounters, "failure", StatusCode, HttpError)
					end
					Callback5(CallbackResult)
					
					return (if FFlagLuaAppEnableSduiHomePage then CompleteActiveRequest else completeActiveRequest)(ConfigKey, false, p3)
				end else nil
				local CallbackResult = Callback2(function(p3, p4)
					-- upvalues: FFlagHomePageRefetchOnDataHydrationAccountReset (upval), v1 (upval), RequestConfig (upval), SduiPageAnalyticsModule (upval), Callback6 (copy), LoadTimer (upval), FFlagLuaAppEnableSduiHomePage (upval), v2 (upval), t (upval), ConfigKey (upval), FFlagSduiUseHttpClientModule (upval), FFlagSduiRequestCountersModule (upval), StatusCode (ref), HttpError (ref), SduiRequestStatus (upval), Callback (upval), Callback10 (ref), FFlagHomeSduiOfflineCache (upval), Callback4 (ref), CompleteActiveRequest (upval), completeActiveRequest (upval), Callback9 (ref), SduiStreamingResponseHandlerModule (upval), v3 (upval), SduiParseHelpers (upval), SduiLogger (upval), SduiErrors (upval), processSduiResponse (upval), Url (upval), CachedItem (upval), FFlagPromptsEdpOpenReplaceOnFetch (upval), CryoModule (upval)
					if FFlagHomePageRefetchOnDataHydrationAccountReset then
						local Flag = nil
						if v1.isCurrentRequest(RequestConfig.accountPlayerId, RequestConfig.accountGeneration) then
							Flag = false
						else
							SduiPageAnalyticsModule.sendStaleResponseDiscarded(RequestConfig.surfaceKey, if RequestConfig.enableStreaming then "streaming" else "buffered", "response")
							Flag = true
						end
						if Flag then
							return Callback6(nil)
						end
					end
					LoadTimer.logUiResponseReceived()
					
					if not FFlagLuaAppEnableSduiHomePage or not v2 then
						t[ConfigKey] = false
					end
					SduiPageAnalyticsModule.sendPageStatusEvent(RequestConfig.surfaceKey, if FFlagSduiUseHttpClientModule then p4.statusCode else p4.StatusCode, if FFlagSduiUseHttpClientModule then p4.httpError else p4.HttpError)
					
					if FFlagSduiRequestCountersModule then
						StatusCode = if FFlagSduiUseHttpClientModule then p4.statusCode else p4.StatusCode
						HttpError = if FFlagSduiUseHttpClientModule then p4.httpError else p4.HttpError
					end
					if p3 then
						local StatusCode1 = if FFlagSduiUseHttpClientModule then p4.statusCode else p4.StatusCode
						local HttpError1 = if FFlagSduiUseHttpClientModule then p4.httpError else p4.HttpError
						local Number = if StatusCode1 then tonumber(StatusCode1) else nil
						local IsWasTransportFailure: boolean = if FFlagSduiUseHttpClientModule then p4.wasTransportFailure == true else false
						
						if Number and Number >= 400 or HttpError1 and HttpError1 ~= Enum.HttpError.OK or IsWasTransportFailure then
							LoadTimer.updateRequestStatus(SduiRequestStatus.FailedToLoad)
							
							if FFlagLuaAppEnableSduiHomePage and not (if Callback == nil then RequestConfig.isResponseCurrent == nil or RequestConfig.isResponseCurrent() else Callback() and (RequestConfig.isResponseCurrent == nil or RequestConfig.isResponseCurrent())) then
								return Callback10(nil)
							elseif FFlagHomeSduiOfflineCache then
								return Callback4(p4)
							else
								(if FFlagLuaAppEnableSduiHomePage then CompleteActiveRequest else completeActiveRequest)(ConfigKey, false, p4)
								
								return Callback9(p4)
							end
						else
							LoadTimer.updateRequestStatus(SduiRequestStatus.LoadedFromNetwork)
							
							if FFlagLuaAppEnableSduiHomePage and not (if Callback == nil then RequestConfig.isResponseCurrent == nil or RequestConfig.isResponseCurrent() else Callback() and (RequestConfig.isResponseCurrent == nil or RequestConfig.isResponseCurrent())) then
								return Callback10(nil)
							end
							local ResponseBody = if FFlagSduiUseHttpClientModule then p4.responseBody else p4.Body
							SduiPageAnalyticsModule.sendPagePayloadSizeEvent(RequestConfig.surfaceKey, ResponseBody)
							
							if SduiStreamingResponseHandlerModule then
								local FinalizeResult = SduiStreamingResponseHandlerModule.finalize(ResponseBody)
								
								if FinalizeResult.ok then
									(if FFlagLuaAppEnableSduiHomePage then CompleteActiveRequest else completeActiveRequest)(ConfigKey, true, FinalizeResult.value, v3)
									
									return Callback10(FinalizeResult.value)
								end
								SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToFetchPage, {
									message = SduiParseHelpers.stringifyValue(FinalizeResult.value),
									name = RequestConfig.surfaceKey
								}, RequestConfig.surfaceKey)
								LoadTimer.updateRequestStatus(SduiRequestStatus.FailedToLoad)
								
								if FFlagHomeSduiOfflineCache then
									return Callback4(FinalizeResult.value)
								else
									(if FFlagLuaAppEnableSduiHomePage then CompleteActiveRequest else completeActiveRequest)(ConfigKey, false, FinalizeResult.value)
									
									return Callback9(FinalizeResult.value)
								end
							else
								local Success, Result, Result3 = pcall(processSduiResponse, p4)
								
								if Success then
									local JoinResults = {}
									
									if FFlagPromptsEdpOpenReplaceOnFetch and RequestConfig.replaceOnFetch then
										local DataResult1 = CachedItem.data(false)
										
										for i, value in Result do
											JoinResults[i] = value
										end
										if DataResult1 then
											for i1 in DataResult1 do
												if Result[i1] == nil then
													JoinResults[i1] = CryoModule.None
												end
											end
										end
									elseif next(Result) then
										local DataResult = CachedItem.data(false)
										
										for i2, value1 in Result do
											local DataResultEntry = DataResult and DataResult[i2]
											JoinResults[i2] = if DataResultEntry then CryoModule.Dictionary.join(DataResultEntry, value1) else value1
										end
									elseif RequestConfig.clearOnEmptyResponse and RequestConfig.configKey then
										JoinResults[RequestConfig.configKey] = {}
									end;
									(if FFlagLuaAppEnableSduiHomePage then CompleteActiveRequest else completeActiveRequest)(ConfigKey, true, JoinResults, Result3)
									
									return Callback10(JoinResults)
								else
									SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToFetchPage, {
										message = `handleSduiApiResponse not successful for {Url} err {SduiParseHelpers.stringifyValue(Result)}`,
										name = RequestConfig.surfaceKey
									}, RequestConfig.surfaceKey)
									
									if FFlagHomeSduiOfflineCache then
										return Callback4(Result, CachedItem)
									else
										(if FFlagLuaAppEnableSduiHomePage then CompleteActiveRequest else completeActiveRequest)(ConfigKey, false, Result)
										
										return Callback9(CachedItem)
									end
								end
							end
						end
					elseif FFlagLuaAppEnableSduiHomePage and not (if Callback == nil then RequestConfig.isResponseCurrent == nil or RequestConfig.isResponseCurrent() else Callback() and (RequestConfig.isResponseCurrent == nil or RequestConfig.isResponseCurrent())) then
						return Callback10(nil)
					elseif FFlagHomeSduiOfflineCache then
						return Callback4(p4)
					else
						(if FFlagLuaAppEnableSduiHomePage then CompleteActiveRequest else completeActiveRequest)(ConfigKey, false, p4)
						
						return Callback9(p4)
					end
				end)
				
				if CallbackResult ~= nil then
					Callback3(CallbackResult)
				end
			end)
		end
		
		if not FFlagSduiUseHttpClientModule then
			return createRequestPromise(function(p5)
				-- upvalues: HttpService (upval), Url (copy), POST (copy), FFlagSduiMrRouterHeadersModule (upval), BuildSduiRequestHeadersModule (upval), IsResponseTypeMatch (copy), PostConfig (copy), SduiApiStorePostConfigModule (upval), SduiStreamingResponseHandlerModule (copy), SduiPageRequestPriority (upval)
				HttpService:RequestInternal({
					Url = Url,
					Method = POST,
					Headers = if FFlagSduiMrRouterHeadersModule then BuildSduiRequestHeadersModule(if IsResponseTypeMatch then "application/json" else "application/x-protobuf", if PostConfig then SduiApiStorePostConfigModule.getContentTypeHeaderFromPostConfig(PostConfig) else nil) else {
						Accept = if IsResponseTypeMatch then "application/json" else "application/x-protobuf",
						["Content-Type"] = if PostConfig then SduiApiStorePostConfigModule.getContentTypeHeaderFromPostConfig(PostConfig) else nil
					},
					Body = if PostConfig then SduiApiStorePostConfigModule.getBodyFromPostConfig(PostConfig) else nil,
					OnMessage = if SduiStreamingResponseHandlerModule then SduiStreamingResponseHandlerModule.handleChunk else nil,
					Priority = SduiPageRequestPriority
				}):Start(p5)
				
				return nil
			end)
		end
		local BodyFromPostConfig = if PostConfig then SduiApiStorePostConfigModule.getBodyFromPostConfig(PostConfig) else nil
		local ContentTypeHeaderFromPostConfig = if PostConfig then SduiApiStorePostConfigModule.getContentTypeHeaderFromPostConfig(PostConfig) else nil
		local ResolveResult = SduiRetryPolicyModule.resolve(RequestConfig.retry)
		
		if FFlagSduiRequestCountersModule and ResolveResult ~= nil then
			local OnRetryFunction = ResolveResult.onRetry
			ResolveResult = CryoModule.Dictionary.join(ResolveResult, {
				onRetry = function(p5)
					-- upvalues: OnRetryFunction (copy), SduiPageAnalyticsModule (upval), RequestConfig (copy), SduiRequestEndpointForCounters (copy)
					if OnRetryFunction ~= nil then
						OnRetryFunction(p5)
					end
					SduiPageAnalyticsModule.sendRequestRetryCounter(RequestConfig.surfaceKey, SduiRequestEndpointForCounters, p5)
				end
			})
		end
		local config = {
			url = Url,
			method = POST,
			body = BodyFromPostConfig,
			contentType = ContentTypeHeaderFromPostConfig,
			accept = if IsResponseTypeMatch then "application/json" else "application/x-protobuf",
			analyticsKey = RequestConfig.surfaceKey,
			priority = SduiPageRequestPriority,
			retry = ResolveResult,
			deadlineSec = if p1 and p1.requestDeadlineSec then p1.requestDeadlineSec else SduiRetryPolicyModule.getRequestDeadlineSec(),
			network = p1 and p1.network or nil,
			delivery = if SduiStreamingResponseHandlerModule then {
				mode = "streaming",
				onMessage = SduiStreamingResponseHandlerModule.handleChunk
			} else { mode = "buffered" }
		}
		
		return createRequestPromise(function(Callback)
			-- upvalues: SendSduiHttpRequestModule (upval), config (copy)
			local SendSduiHttpRequestModuleResult = SendSduiHttpRequestModule(config)
			SendSduiHttpRequestModuleResult:andThen(function(Result)
				-- upvalues: Callback (copy)
				Callback(true, Result)
			end, function(p5)
				-- upvalues: Callback (copy)
				if typeof(p5) == "table" and (p5.statusCode ~= nil or p5.httpError ~= nil) then
					Callback(true, p5)
					
					return
				else
					Callback(false, p5)
				end
			end)
			
			return function()
				-- upvalues: SendSduiHttpRequestModuleResult (copy)
				SendSduiHttpRequestModuleResult:cancel()
			end
		end)
	end
	
	v1 = CreateDataResolverFunction({
		queueProcessDelaySec = 0,
		supportsMultiGet = false,
		cache = DataCache,
		fetchFn = fetchFunction,
		requestTimeoutSec = if FFlagSduiUseHttpClientModule then SduiRetryPolicyModule.getFetchTimeoutSec() else nil,
		onBeforeClear = if FFlagHomePageRefetchOnDataHydrationAccountReset then function()
			-- upvalues: t1 (ref), t (ref), RequestConfigs (ref), T (ref), t2 (ref)
			local t4 = t1
			t1 = {}
			t = {}
			RequestConfigs = {}
			
			if T ~= nil then
				T = {}
			end
			t2 = {}
			
			for _, value in t4 do
				value.resolve(nil)
			end
		end else nil
	})
	
	local function fetchIfNeeded(JoinResult, p5)
		-- upvalues: SduiResponseType (upval), FFlagLuaAppEnableSduiHomePage (upval), SduiRequestConcurrencyPolicy (upval), FFlagHomePageRefetchOnDataHydrationAccountReset (upval), v1 (ref), GetLocalPlayerUserIdFunction (upval), T (ref), fetchFunction (copy), SduiPageAnalyticsModule (upval), DataCache (copy), RequestConfigs (ref), t1 (ref), PromiseModule (upval)
		if JoinResult.responseType == nil then
			JoinResult.responseType = SduiResponseType.Protobuf
		end
		local ConfigKey = JoinResult.configKey or JoinResult.url
		local IsConcurrencyPolicyMatch: boolean = FFlagLuaAppEnableSduiHomePage and JoinResult.concurrencyPolicy == SduiRequestConcurrencyPolicy.LatestWins
		JoinResult.configKey = ConfigKey
		JoinResult.loadTimer.logUiRequestQueued()
		
		if FFlagHomePageRefetchOnDataHydrationAccountReset then
			JoinResult.accountGeneration = v1.getAccountGeneration(false)
			JoinResult.accountPlayerId = GetLocalPlayerUserIdFunction()
		end
		if FFlagLuaAppEnableSduiHomePage and IsConcurrencyPolicyMatch then
			local ConcurrencyKey = JoinResult.concurrencyKey or ConfigKey
			local T1 = T
			local v4 = (T1[ConcurrencyKey] or 0) + 1
			T1[ConcurrencyKey] = v4
			
			return fetchFunction(ConfigKey, v1.getCachedItem(ConfigKey), JoinResult, function(): boolean
				-- upvalues: T1 (copy), ConcurrencyKey (copy), v4 (copy)
				return T1[ConcurrencyKey] == v4
			end):andThen(function(Result)
				-- upvalues: FFlagHomePageRefetchOnDataHydrationAccountReset (upval), v1 (upval), JoinResult (copy), SduiPageAnalyticsModule (upval), DataCache (upval), ConfigKey (copy)
				if FFlagHomePageRefetchOnDataHydrationAccountReset and Result ~= nil then
					local Flag = nil
					if v1.isCurrentRequest(JoinResult.accountPlayerId, JoinResult.accountGeneration) then
						Flag = false
					else
						SduiPageAnalyticsModule.sendStaleResponseDiscarded(JoinResult.surfaceKey, if JoinResult.enableStreaming then "streaming" else "buffered", "cacheCommit")
						Flag = true
					end
					if Flag then
						return nil
					end
				end
				if Result ~= nil and not JoinResult.enableInputDataMerge then
					DataCache.updateItems({ [ConfigKey] = Result })
				end
				return Result
			end)
		end
		RequestConfigs[ConfigKey] = JoinResult
		local _, AndFetchItem2 = v1.getAndFetchItem(ConfigKey, if p5 then function(): boolean
			return true
		end else nil, JoinResult.staleTimeSec)
		
		if not AndFetchItem2 then
			return PromiseModule.resolve()
		end
		if not t1[ConfigKey] then
			local Resolve = nil
			local Reject = nil
			local NewPromise = PromiseModule.new(function(p6, p7)
				-- upvalues: Resolve (ref), Reject (ref)
				Resolve = p6
				Reject = p7
			end)
			NewPromise:catch(function(_) end)
			t1[ConfigKey] = { promise = NewPromise, resolve = Resolve, reject = Reject }
		end
		return t1[ConfigKey].promise
	end
	
	local function forEachInputData(p5, Callback)
		-- upvalues: v1 (ref), t2 (ref)
		local DataResult = v1.getCachedItem(p5).data(false)
		
		if DataResult == nil then return end
		for i in DataResult do
			local Entry = t2[i]
			local GetResult = if Entry then Entry.get(false) else nil
			
			if GetResult ~= nil and Callback(i, GetResult) then break end
		end
	end
	
	local function setInputDataField(p6, p7, Key, p8): boolean
		-- upvalues: v1 (ref), t2 (ref)
		local DataResult = v1.getCachedItem(p6).data(false)
		local Entry = t2[p7]
		
		if DataResult == nil or DataResult[p7] == nil or Entry == nil then
			return false
		end
		local GetResult = Entry.get(false)
		local GetResultEntry = if GetResult then GetResult[Key] else nil
		
		if GetResultEntry == nil or p8 == nil or typeof(p8) ~= typeof(GetResultEntry) then
			return false
		else
			local Copy = table.clone(GetResult)
			Copy[Key] = p8
			Entry.set(Copy)
			
			return true
		end
	end
	
	SeedFromDecodedResponse = function(p6)
		-- upvalues: FFlagHomeSduiOfflineCache (upval), RequestConfigs (ref), SduiResponseType (upval), v1 (ref), HandleSduiApiResponseModule (upval), FFlagSduiUseHttpClientModule (upval), SduiProtobufResponseHelpersModule (upval), getInputDataSignals (copy), FFlagSduiFreshInputDataSignalOnRebuild (upval), setInputDataSignals (copy), FFlagSduiAllowNoConfigsBuilt (upval), SduiLogger (upval), SduiErrors (upval), SduiParseHelpers (upval), FFlagAppChatConversationTrustedFriendUpsellBanner (upval), DataCache (copy), AccumulateSduiCacheSubEntriesModule (upval)
		local ConfigKey = p6.configKey
		local LoadTimer = p6.loadTimer
		
		if FFlagHomeSduiOfflineCache and p6.requestConfig ~= nil then
			RequestConfigs[ConfigKey] = p6.requestConfig
		else
			LoadTimer.logUiRequestQueued()
			RequestConfigs[ConfigKey] = {
				url = `inline://{ConfigKey}`,
				surfaceKey = p6.surfaceKey,
				configKey = ConfigKey,
				loadTimer = LoadTimer,
				apiProto = p6.apiProto,
				responseType = SduiResponseType.Protobuf
			}
		end
		local RequestConfig = if FFlagHomeSduiOfflineCache then p6.requestConfig else nil
		local DataResult = v1.getCachedItem(ConfigKey).data(false)
		local Success, Result = pcall(function()
			-- upvalues: HandleSduiApiResponseModule (upval), FFlagSduiUseHttpClientModule (upval), p6 (copy), LoadTimer (copy), ConfigKey (copy), SduiProtobufResponseHelpersModule (upval), FFlagHomeSduiOfflineCache (upval), RequestConfig (copy), getInputDataSignals (upval), FFlagSduiFreshInputDataSignalOnRebuild (upval), setInputDataSignals (upval), FFlagSduiAllowNoConfigsBuilt (upval)
			return HandleSduiApiResponseModule({
				paginateResponse = false,
				cacheSingleEntryWithIdentifier = true,
				response = if FFlagSduiUseHttpClientModule then {
					statusCode = 200,
					responseBody = p6.decodedResponse,
					stats = {}
				} else { StatusCode = 200, Body = p6.decodedResponse, Stats = {} },
				loadTimer = LoadTimer,
				surfaceKey = p6.surfaceKey,
				configCacheKey = ConfigKey,
				decodeResponse = function(p7)
					return p7
				end,
				parseHydrationDataFromResponse = SduiProtobufResponseHelpersModule.parseHydrationDataFromResponse,
				parseTemplateEntriesFromResponse = FFlagHomeSduiOfflineCache and RequestConfig ~= nil and RequestConfig.parseTemplateEntriesFromResponse or SduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse,
				parsePageEntriesFromResponse = FFlagHomeSduiOfflineCache and RequestConfig ~= nil and RequestConfig.parsePageEntriesFromResponse or SduiProtobufResponseHelpersModule.parsePageEntriesFromResponse,
				parseLocalizedLiteralsFromResponse = FFlagHomeSduiOfflineCache and RequestConfig ~= nil and RequestConfig.parseLocalizedLiteralsFromResponse or SduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse,
				getInputDataSignalsForRequest = getInputDataSignals,
				setInputDataSignalsForRequest = if FFlagSduiFreshInputDataSignalOnRebuild then setInputDataSignals else nil,
				allowNoConfigsBuilt = if FFlagHomeSduiOfflineCache and RequestConfig ~= nil and FFlagSduiAllowNoConfigsBuilt then RequestConfig.allowNoConfigsBuilt else nil,
				mergeStrategy = if FFlagHomeSduiOfflineCache and RequestConfig ~= nil then RequestConfig.mergeStrategy else nil,
				enableTemplateCache = if FFlagHomeSduiOfflineCache and RequestConfig ~= nil then RequestConfig.enableTemplateCache else nil
			})
		end)
		
		if not Success then
			SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToFetchPage, {
				message = `seedFromDecodedResponse failed for {ConfigKey}: {SduiParseHelpers.stringifyValue(Result)}`,
				name = p6.surfaceKey
			}, p6.surfaceKey)
			error(Result)
		end
		if FFlagAppChatConversationTrustedFriendUpsellBanner and p6.replace then
			DataCache.replaceItems({ [ConfigKey] = Result })
			
			return
		else
			DataCache.updateItems({
				[ConfigKey] = AccumulateSduiCacheSubEntriesModule(Result, DataResult)
			})
		end
	end
	
	local function dismissEntry(Title)
		-- upvalues: RequestConfigs (ref), v1 (ref), DataCache (copy)
		local List = {}
		
		if typeof(Title) ~= "string" or Title == "" then
			return List
		end
		for requestConfig in RequestConfigs do
			local DataResult = v1.getCachedItem(requestConfig).data(false)
			
			if DataResult then
				local Flag = false
				local t = {}
				
				for i, value in DataResult do
					if value and value.category ~= nil and value.title == Title then
						Flag = true
					else
						t[i] = value
					end
				end
				if Flag then
					DataCache.replaceItems({ [requestConfig] = t })
					table.insert(List, requestConfig)
				end
			end
		end
		return List
	end
	
	local function clearConfigEntries(p7)
		-- upvalues: DataCache (copy)
		if typeof(p7) == "string" and p7 ~= "" then
			DataCache.replaceItems({ [p7] = {} })
			
			return
		end
	end
	
	return {
		fetchIfNeeded = fetchIfNeeded,
		isInFlight = isInFlight,
		clearConfigEntries = if FFlagAppChatConversationTrustedFriendUpsellBanner then clearConfigEntries else nil,
		dismissEntry = if FFlagSduiDismissPromptAction then dismissEntry else nil,
		seedFromDecodedResponse = SeedFromDecodedResponse,
		getData = v1.getCachedItem,
		getInputData = function(p7, p8, p9)
			-- upvalues: FFlagSduiFreshInputDataSignalOnRebuild (upval), t4 (copy), SignalsModule (upval), ResolveSduiCacheEntryModule (upval), t2 (ref)
			local Text = if p8 and p8 ~= "" then `{p7}_{p8}` else nil
			
			if FFlagSduiFreshInputDataSignalOnRebuild and p9 then
				local Text1 = Text or p7
				local Entry = t4[Text1]
				
				if Entry == nil then
					local Signal, Signal2 = SignalsModule.createSignal(0)
					Entry = { get = Signal, set = Signal2 }
					t4[Text1] = Entry
				end
				Entry.get(p9)
			end
			local ResolveSduiCacheEntryModuleResult = ResolveSduiCacheEntryModule(t2, p7, Text)
			
			return if ResolveSduiCacheEntryModuleResult == nil then nil else ResolveSduiCacheEntryModuleResult.get(p9 ~= nil and p9)
		end,
		forEachInputData = if FFlagSduiApiStoreUpdateInputData then forEachInputData else nil,
		setInputDataField = if FFlagSduiApiStoreUpdateInputData then setInputDataField else nil,
		getRootConfig = function(p7, p8, p9)
			-- upvalues: v1 (ref), FFlagSduiAlwaysCacheWithIdentifier (upval), ResolveSduiCacheEntryModule (upval)
			local DataResult = v1.getCachedItem(p7).data(p8)
			local ResolveSduiCacheEntryModuleResult = if FFlagSduiAlwaysCacheWithIdentifier then ResolveSduiCacheEntryModule(DataResult, p7, p9) else DataResult and DataResult[p9 or p7]
			
			return if ResolveSduiCacheEntryModuleResult then ResolveSduiCacheEntryModuleResult.config else nil
		end,
		getTitle = function(p7, p8, p9)
			-- upvalues: v1 (ref), FFlagSduiAlwaysCacheWithIdentifier (upval), ResolveSduiCacheEntryModule (upval)
			local DataResult = v1.getCachedItem(p7).data(p8)
			local ResolveSduiCacheEntryModuleResult = if FFlagSduiAlwaysCacheWithIdentifier then ResolveSduiCacheEntryModule(DataResult, p7, p9) else DataResult and DataResult[p9 or p7]
			
			return if ResolveSduiCacheEntryModuleResult and ResolveSduiCacheEntryModuleResult.title ~= "" then ResolveSduiCacheEntryModuleResult.title else nil
		end,
		getDataUpdatedTimestamp = function(p7, p8, p9)
			-- upvalues: v1 (ref), FFlagSduiAlwaysCacheWithIdentifier (upval), ResolveSduiCacheEntryModule (upval)
			local DataResult = v1.getCachedItem(p7).data(p8)
			local ResolveSduiCacheEntryModuleResult = if FFlagSduiAlwaysCacheWithIdentifier then ResolveSduiCacheEntryModule(DataResult, p7, p9) else DataResult and DataResult[p9 or p7]
			
			return if ResolveSduiCacheEntryModuleResult then ResolveSduiCacheEntryModuleResult.dataUpdatedTimestamp else nil
		end,
		getAccountGeneration = if FFlagHomePageRefetchOnDataHydrationAccountReset then v1.getAccountGeneration else nil,
		getEntrySurfacing = function(p7, p8, p9)
			-- upvalues: v1 (ref), FFlagSduiAlwaysCacheWithIdentifier (upval), ResolveSduiCacheEntryModule (upval)
			local DataResult = v1.getCachedItem(p7).data(p9)
			local ResolveSduiCacheEntryModuleResult = if FFlagSduiAlwaysCacheWithIdentifier then ResolveSduiCacheEntryModule(DataResult, p7, p8) else DataResult and DataResult[p8 or p7]
			
			return if ResolveSduiCacheEntryModuleResult then ResolveSduiCacheEntryModuleResult.surfacing else nil
		end,
		loadMoreFromApi = function(p7)
			-- upvalues: RequestConfigs (ref), SduiLogger (upval), SduiErrors (upval), PromiseModule (upval), v1 (ref), FFlagSduiAlwaysCacheWithIdentifier (upval), ResolveSduiCacheEntryModule (upval), CryoModule (upval), fetchIfNeeded (copy)
			local RequestConfig = RequestConfigs[p7.configKey]
			
			if not RequestConfig then
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToPaginateRequest, { message = `No requestData for {p7.configKey}` }, "unknown")
				
				return PromiseModule.resolve()
			end
			local DataResult = v1.getCachedItem(p7.configKey).data(false)
			local ResolveSduiCacheEntryModuleResult = if FFlagSduiAlwaysCacheWithIdentifier then ResolveSduiCacheEntryModule(DataResult, p7.configKey, p7.identifier) else DataResult and DataResult[p7.identifier or p7.configKey]
			
			if not ResolveSduiCacheEntryModuleResult then
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToPaginateRequest, {
					message = `No entry data for {p7.configKey}`,
					name = RequestConfig.surfaceKey
				}, RequestConfig.surfaceKey)
				
				return PromiseModule.resolve()
			end
			local NextPageUrl = ResolveSduiCacheEntryModuleResult.nextPageUrl
			
			if not NextPageUrl or NextPageUrl == "" then
				return PromiseModule.resolve()
			end
			local config = {
				isPaginated = true,
				url = NextPageUrl,
				loadTimer = p7.loadTimer
			}
			
			if RequestConfig.postConfig and ResolveSduiCacheEntryModuleResult.nextPagePostBody then
				config.postConfig = CryoModule.Dictionary.join(RequestConfig.postConfig, {
					body = ResolveSduiCacheEntryModuleResult.nextPagePostBody
				})
			end
			return fetchIfNeeded(CryoModule.Dictionary.join(RequestConfig, config), true)
		end,
		refreshFromApi = function(p8)
			-- upvalues: RequestConfigs (ref), SduiLogger (upval), SduiErrors (upval), PromiseModule (upval), CryoModule (upval), FFlagSduiStreamingRefreshReplacesInputData (upval), fetchIfNeeded (copy)
			local RequestConfig = RequestConfigs[p8.configKey]
			
			if not RequestConfig then
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToFetchPage, { message = `No requestData for refresh: {p8.configKey}` }, "unknown")
				
				return PromiseModule.resolve()
			end
			if RequestConfig.refresh then
				return RequestConfig.refresh(p8.loadTimer)
			end
			local config = {
				url = (if RequestConfig.buildRefreshUrl then RequestConfig.buildRefreshUrl() else nil) or RequestConfig.url,
				loadTimer = p8.loadTimer,
				isPaginated = CryoModule.None
			}
			
			if FFlagSduiStreamingRefreshReplacesInputData and not RequestConfig.enableInputDataMerge then
				config.enableInputDataMerge = false
			end
			if RequestConfig.postConfig then
				local RefreshPostBody = if RequestConfig.buildRefreshPostBody then RequestConfig.buildRefreshPostBody() else nil
				
				if RefreshPostBody then
					config.postConfig = CryoModule.Dictionary.join(RequestConfig.postConfig, { body = RefreshPostBody })
				end
			end
			return fetchIfNeeded(CryoModule.Dictionary.join(RequestConfig, config), true)
		end
	}
end