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
local DataHydrationModule = require(Parent.DataHydration)
local CreateDataCacheFunction = DataHydrationModule.createDataCache
local CreateDataResolverFunction = DataHydrationModule.createDataResolver
local SduiIntegrationTypesModule = require(SduiSharedUtilities.SduiIntegrationTypes)
local SduiRequestStatus = SduiIntegrationTypesModule.SduiRequestStatus
local _ = require(SduiSharedUtilities.SduiLoadTimer)
local SduiProtobufResponseHelpersModule = require(SduiSharedUtilities.SduiProtobufResponseHelpers)
local MakeProtoResponseDecoderFunction = SduiProtobufResponseHelpersModule.makeProtoResponseDecoder
local MakeProtobufJsonResponseDecoderFunction = SduiProtobufResponseHelpersModule.makeProtobufJsonResponseDecoder
local SduiResponseType = SduiIntegrationTypesModule.SduiResponseType
local HandleSduiApiResponseModule = require(SduiSharedUtilities.handleSduiApiResponse)
local SduiPageAnalyticsModule = require(SduiSharedUtilities.SduiPageAnalytics)
local SduiApiStorePostConfigModule = require(SduiSharedUtilities.SduiApiStorePostConfig)
local CreateSduiStreamingResponseHandlerModule = require(SduiSharedUtilities.createSduiStreamingResponseHandler)
local FFlagSduiProtobufJsonDecode = require(Parent.SharedFlags).FFlagSduiProtobufJsonDecode
local SduiEnableClearOnEmptyResponse = game:DefineFastFlag("SduiEnableClearOnEmptyResponse", false)
local FFlagSduiAllowNoConfigsBuilt = require(Parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local FFlagSduiChartsSupport = require(Parent.SharedFlags).FFlagSduiChartsSupport
local FFlagSduiConfigFetchTakesPostBody = require(Parent.SharedFlags).FFlagSduiConfigFetchTakesPostBody
local FFlagSduiClientTemplateCache = require(Parent.SharedFlags).FFlagSduiClientTemplateCache
local FFlagSduiAlwaysCacheWithIdentifier = require(Parent.SharedFlags).FFlagSduiAlwaysCacheWithIdentifier
local FFlagEnableSduiV2HomeInterleave = require(Parent.SharedFlags).FFlagEnableSduiV2HomeInterleave
local FFlagLuaAppSduiStreamingChunkedResponses = require(Parent.SharedFlags).FFlagLuaAppSduiStreamingChunkedResponses
local FFlagSduiErrorCleanup = require(Parent.SharedFlags).FFlagSduiErrorCleanup
local FFlagSduiInputDataMergeStrategy = require(Parent.SharedFlags).FFlagSduiInputDataMergeStrategy
local FFlagSduiDismissPromptAction = require(Parent.SharedFlags).FFlagSduiDismissPromptAction
local FFlagSduiApiStoreExposeGetInputData = require(Parent.SharedFlags).FFlagSduiApiStoreExposeGetInputData
local FFlagSduiRenderPerf = require(Parent.SharedFlags).FFlagSduiRenderPerf
local SduiPageRequestPriority = game:DefineFastInt("SduiPageRequestPriority", 1)
local ResolveSduiCacheEntryModule = require(SduiSharedUtilities.resolveSduiCacheEntry)
local AccumulateSduiCacheSubEntriesModule = require(SduiSharedUtilities.accumulateSduiCacheSubEntries)

return function()
	-- upvalues: CreateDataCacheFunction (copy), SignalsModule (copy), PromiseModule (copy), FFlagSduiProtobufJsonDecode (copy), SduiResponseType (copy), FFlagSduiConfigFetchTakesPostBody (copy), FFlagLuaAppSduiStreamingChunkedResponses (copy), MakeProtobufJsonResponseDecoderFunction (copy), MakeProtoResponseDecoderFunction (copy), HandleSduiApiResponseModule (copy), SduiProtobufResponseHelpersModule (copy), FFlagSduiAllowNoConfigsBuilt (copy), FFlagSduiInputDataMergeStrategy (copy), FFlagSduiClientTemplateCache (copy), CreateSduiStreamingResponseHandlerModule (copy), AccumulateSduiCacheSubEntriesModule (copy), HttpService (copy), SduiApiStorePostConfigModule (copy), FFlagSduiRenderPerf (copy), SduiPageRequestPriority (copy), SduiPageAnalyticsModule (copy), SduiRequestStatus (copy), FFlagSduiErrorCleanup (copy), SduiLogger (copy), SduiErrors (copy), FFlagSduiChartsSupport (copy), SduiParseHelpers (copy), SduiEnableClearOnEmptyResponse (copy), CryoModule (copy), CreateDataResolverFunction (copy), ResolveSduiCacheEntryModule (copy), FFlagSduiAlwaysCacheWithIdentifier (copy), FFlagEnableSduiV2HomeInterleave (copy), FFlagSduiDismissPromptAction (copy), FFlagSduiApiStoreExposeGetInputData (copy)
	local DataCache = CreateDataCacheFunction()
	local t = {}
	local t1 = {}
	local t2 = {}
	
	local function _(Key, p1, p2)
		-- upvalues: t2 (copy)
		local Entry = t2[Key]
		
		if Entry then
			t2[Key] = nil
			
			if p1 then
				Entry.resolve(p2)
				
				return
			end
			Entry.reject(p2)
		end
	end
	
	local function isInFlight(p1): boolean
		-- upvalues: t2 (copy), t1 (copy)
		return t2[p1] ~= nil or t1[p1] == true
	end
	
	local t3 = {}
	
	local function getInputDataSignals(Key)
		-- upvalues: t3 (copy), SignalsModule (upval)
		local Entry = t3[Key]
		
		if Entry == nil then
			local Signal, Signal2 = SignalsModule.createSignal(nil)
			Entry = { get = Signal, set = Signal2 }
			t3[Key] = Entry
		end
		return Entry
	end
	
	local DataResolver = CreateDataResolverFunction({
		queueProcessDelaySec = 0,
		supportsMultiGet = false,
		cache = DataCache,
		fetchFn = function(ConfigKey, p1)
			-- upvalues: t (copy), PromiseModule (upval), FFlagSduiProtobufJsonDecode (upval), SduiResponseType (upval), FFlagSduiConfigFetchTakesPostBody (upval), FFlagLuaAppSduiStreamingChunkedResponses (upval), MakeProtobufJsonResponseDecoderFunction (upval), MakeProtoResponseDecoderFunction (upval), HandleSduiApiResponseModule (upval), SduiProtobufResponseHelpersModule (upval), getInputDataSignals (copy), FFlagSduiAllowNoConfigsBuilt (upval), FFlagSduiInputDataMergeStrategy (upval), FFlagSduiClientTemplateCache (upval), CreateSduiStreamingResponseHandlerModule (upval), AccumulateSduiCacheSubEntriesModule (upval), DataCache (copy), HttpService (upval), SduiApiStorePostConfigModule (upval), FFlagSduiRenderPerf (upval), SduiPageRequestPriority (upval), t1 (copy), SduiPageAnalyticsModule (upval), SduiRequestStatus (upval), FFlagSduiErrorCleanup (upval), SduiLogger (upval), SduiErrors (upval), FFlagSduiChartsSupport (upval), t2 (copy), SduiParseHelpers (upval), SduiEnableClearOnEmptyResponse (upval), CryoModule (upval)
			local Entry = t[ConfigKey]
			
			if Entry then
				local Url = Entry.url
				local LoadTimer = Entry.loadTimer
				LoadTimer.logUiRequestSent()
				local IsResponseTypeMatch: boolean = FFlagSduiProtobufJsonDecode and Entry.responseType == SduiResponseType.ProtobufJson
				local PostConfig = Entry.postConfig
				local EnableStreaming = if FFlagLuaAppSduiStreamingChunkedResponses then Entry.enableStreaming else nil
				local ProtobufJsonResponseDecoder = if IsResponseTypeMatch then MakeProtobufJsonResponseDecoderFunction(Entry.apiProto) else MakeProtoResponseDecoderFunction(Entry.apiProto)
				
				local function processSduiResponse(Response)
					-- upvalues: Entry (copy), p1 (copy), HandleSduiApiResponseModule (upval), LoadTimer (copy), ProtobufJsonResponseDecoder (copy), SduiProtobufResponseHelpersModule (upval), getInputDataSignals (upval), FFlagLuaAppSduiStreamingChunkedResponses (upval), EnableStreaming (copy), FFlagSduiAllowNoConfigsBuilt (upval), FFlagSduiInputDataMergeStrategy (upval), FFlagSduiClientTemplateCache (upval)
					return HandleSduiApiResponseModule({
						response = Response,
						loadTimer = LoadTimer,
						surfaceKey = Entry.surfaceKey,
						configCacheKey = Entry.configKey,
						decodeResponse = ProtobufJsonResponseDecoder,
						parseHydrationDataFromResponse = SduiProtobufResponseHelpersModule.parseHydrationDataFromResponse,
						parseTemplateEntriesFromResponse = SduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse,
						parsePageEntriesFromResponse = SduiProtobufResponseHelpersModule.parsePageEntriesFromResponse,
						getInputDataSignalsForRequest = getInputDataSignals,
						enableStreamingMerge = if FFlagLuaAppSduiStreamingChunkedResponses then EnableStreaming else nil,
						paginateResponse = Entry.isPaginated and p1.data(false) ~= nil,
						buildNextPageUrl = Entry.buildNextPageUrl,
						allowNoConfigsBuilt = if FFlagSduiAllowNoConfigsBuilt then Entry.allowNoConfigsBuilt else nil,
						mergeStrategy = if FFlagSduiInputDataMergeStrategy then Entry.mergeStrategy else nil,
						enableTemplateCache = if FFlagSduiClientTemplateCache then Entry.enableTemplateCache else nil
					})
				end
				
				local SduiStreamingResponseHandlerModule = if FFlagLuaAppSduiStreamingChunkedResponses and EnableStreaming then CreateSduiStreamingResponseHandlerModule({
					configKey = ConfigKey,
					loadTimer = LoadTimer,
					processFrame = function(p2)
						-- upvalues: processSduiResponse (copy), AccumulateSduiCacheSubEntriesModule (upval), p1 (copy), DataCache (upval), ConfigKey (copy)
						local Success, Result = pcall(processSduiResponse, { Stats = {}, Body = buffer.fromstring(p2) })
						
						if Success then
							local AccumulateSduiCacheSubEntriesModuleResult = AccumulateSduiCacheSubEntriesModule(Result, p1.data(false))
							DataCache.updateItems({ [ConfigKey] = AccumulateSduiCacheSubEntriesModuleResult })
							
							return true, AccumulateSduiCacheSubEntriesModuleResult
						else
							return false, Result
						end
					end
				}) else nil
				local RequestInternalResult = HttpService:RequestInternal({
					Url = Url,
					Method = if FFlagSduiConfigFetchTakesPostBody and PostConfig then "POST" else "GET",
					Headers = {
						Accept = if IsResponseTypeMatch then "application/json" else "application/x-protobuf",
						["Content-Type"] = if FFlagSduiConfigFetchTakesPostBody and PostConfig then SduiApiStorePostConfigModule.getContentTypeHeaderFromPostConfig(PostConfig) else nil
					},
					Body = if FFlagSduiConfigFetchTakesPostBody and PostConfig then SduiApiStorePostConfigModule.getBodyFromPostConfig(PostConfig) else nil,
					OnMessage = if SduiStreamingResponseHandlerModule then SduiStreamingResponseHandlerModule.handleChunk else nil,
					Priority = if FFlagSduiRenderPerf then SduiPageRequestPriority else nil
				})
				
				return PromiseModule.new(function(Callback1, Callback)
					-- upvalues: RequestInternalResult (copy), LoadTimer (copy), t1 (upval), ConfigKey (copy), SduiPageAnalyticsModule (upval), Entry (copy), SduiRequestStatus (upval), FFlagSduiErrorCleanup (upval), SduiLogger (upval), SduiErrors (upval), Url (copy), FFlagSduiChartsSupport (upval), t2 (upval), SduiStreamingResponseHandlerModule (copy), SduiParseHelpers (upval), processSduiResponse (copy), p1 (copy), SduiEnableClearOnEmptyResponse (upval), CryoModule (upval)
					RequestInternalResult:Start(function(p2, p3)
						-- upvalues: LoadTimer (upval), t1 (upval), ConfigKey (upval), SduiPageAnalyticsModule (upval), Entry (upval), SduiRequestStatus (upval), FFlagSduiErrorCleanup (upval), SduiLogger (upval), SduiErrors (upval), Url (upval), FFlagSduiChartsSupport (upval), t2 (upval), Callback (copy), SduiStreamingResponseHandlerModule (upval), Callback1 (copy), SduiParseHelpers (upval), processSduiResponse (upval), p1 (upval), SduiEnableClearOnEmptyResponse (upval), CryoModule (upval)
						LoadTimer.logUiResponseReceived()
						t1[ConfigKey] = false
						SduiPageAnalyticsModule.sendPageStatusEvent(Entry.surfaceKey, p3.StatusCode, p3.HttpError)
						
						if p2 then
							local Number = if p3.StatusCode then tonumber(p3.StatusCode) else nil
							
							if Number and Number >= 400 or p3.HttpError and p3.HttpError ~= Enum.HttpError.OK then
								LoadTimer.updateRequestStatus(SduiRequestStatus.FailedToLoad)
								
								if not FFlagSduiErrorCleanup then
									SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToFetchPage, {
										message = `Http request not successful for {Url} StatusCode {p3.StatusCode} HttpError {p3.HttpError}`,
										name = Entry.surfaceKey
									}, Entry.surfaceKey)
								end
								if FFlagSduiChartsSupport then
									local Entry1 = t2[ConfigKey]
									
									if Entry1 then
										t2[ConfigKey] = nil
										Entry1.reject(p3)
									end
								end
								return Callback(p3)
							else
								LoadTimer.updateRequestStatus(SduiRequestStatus.LoadedFromNetwork)
								SduiPageAnalyticsModule.sendPagePayloadSizeEvent(Entry.surfaceKey, p3.Body)
								
								if SduiStreamingResponseHandlerModule then
									local FinalizeResult = SduiStreamingResponseHandlerModule.finalize(p3.Body)
									
									if FinalizeResult.ok then
										if FFlagSduiChartsSupport then
											local Value = FinalizeResult.value
											local Entry2 = t2[ConfigKey]
											
											if Entry2 then
												t2[ConfigKey] = nil
												Entry2.resolve(Value)
											end
										end
										return Callback1(FinalizeResult.value)
									else
										SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToFetchPage, {
											message = SduiParseHelpers.stringifyValue(FinalizeResult.value),
											name = Entry.surfaceKey
										}, Entry.surfaceKey)
										LoadTimer.updateRequestStatus(SduiRequestStatus.FailedToLoad)
										
										if FFlagSduiChartsSupport then
											local Value = FinalizeResult.value
											local Entry3 = t2[ConfigKey]
											
											if Entry3 then
												t2[ConfigKey] = nil
												Entry3.reject(Value)
											end
										end
										return Callback(FinalizeResult.value)
									end
								else
									local Success, Result = pcall(processSduiResponse, p3)
									
									if Success then
										local JoinResults = {}
										
										if SduiEnableClearOnEmptyResponse then
											if next(Result) then
												local DataResult1 = p1.data(false)
												
												for i1, value1 in Result do
													local v1 = DataResult1 and DataResult1[i1]
													JoinResults[i1] = if v1 then CryoModule.Dictionary.join(v1, value1) else value1
												end
											elseif Entry.clearOnEmptyResponse and Entry.configKey then
												JoinResults[Entry.configKey] = {}
											end
										else
											local DataResult = p1.data(false)
											
											for i, value in Result do
												local v2 = DataResult and DataResult[i]
												JoinResults[i] = if v2 then CryoModule.Dictionary.join(v2, value) else value
											end
										end
										if FFlagSduiChartsSupport then
											local Entry5 = t2[ConfigKey]
											
											if Entry5 then
												t2[ConfigKey] = nil
												Entry5.resolve(JoinResults)
											end
										end
										return Callback1(JoinResults)
									else
										SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToFetchPage, {
											message = `handleSduiApiResponse not successful for {Url} err {SduiParseHelpers.stringifyValue(Result)}`,
											name = Entry.surfaceKey
										}, Entry.surfaceKey)
										
										if FFlagSduiChartsSupport then
											local Entry4 = t2[ConfigKey]
											
											if Entry4 then
												t2[ConfigKey] = nil
												Entry4.reject(Result)
											end
										end
										return Callback(p1)
									end
								end
							end
						else
							if not FFlagSduiErrorCleanup then
								SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToFetchPage, {
									message = `Http request not successful for {Url} err {SduiParseHelpers.stringifyValue(p3)}`,
									name = Entry.surfaceKey
								}, Entry.surfaceKey)
							end
							if FFlagSduiChartsSupport then
								local Entry6 = t2[ConfigKey]
								
								if Entry6 then
									t2[ConfigKey] = nil
									Entry6.reject(p3)
								end
							end
							return Callback(p3)
						end
					end)
				end)
			else
				return PromiseModule.reject("No request config for key", ConfigKey)
			end
		end
	})
	
	local function fetchIfNeeded(JoinResult, p4)
		-- upvalues: FFlagSduiProtobufJsonDecode (upval), SduiResponseType (upval), FFlagSduiChartsSupport (upval), t (copy), DataResolver (copy), t2 (copy), PromiseModule (upval), FFlagSduiErrorCleanup (upval), SduiLogger (upval), SduiErrors (upval), SduiParseHelpers (upval), t1 (copy)
		if FFlagSduiProtobufJsonDecode and JoinResult.responseType == nil then
			JoinResult.responseType = SduiResponseType.Protobuf
		end
		local ConfigKey = JoinResult.configKey or JoinResult.url
		JoinResult.configKey = ConfigKey
		
		if FFlagSduiChartsSupport then
			JoinResult.loadTimer.logUiRequestQueued()
			t[ConfigKey] = JoinResult
			local _, AndFetchItem2 = DataResolver.getAndFetchItem(ConfigKey, if p4 then function(): boolean
				return true
			end else nil)
			
			if not AndFetchItem2 then
				return PromiseModule.resolve()
			end
			if not t2[ConfigKey] then
				local Resolve = nil
				local Reject = nil
				local NewPromise = PromiseModule.new(function(p5, p6)
					-- upvalues: Resolve (ref), Reject (ref)
					Resolve = p5
					Reject = p6
				end)
				NewPromise:catch(function(Err)
					-- upvalues: FFlagSduiErrorCleanup (upval), SduiLogger (upval), SduiErrors (upval), ConfigKey (copy), SduiParseHelpers (upval), JoinResult (copy)
					if not FFlagSduiErrorCleanup then
						SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToFetchPage, {
							message = `fetchIfNeeded promise rejected for {ConfigKey}: {SduiParseHelpers.stringifyValue(Err)}`
						}, JoinResult.surfaceKey)
					end
				end)
				t2[ConfigKey] = { promise = NewPromise, resolve = Resolve, reject = Reject }
			end
			return t2[ConfigKey].promise
		elseif t1[ConfigKey] then
			return nil
		else
			t1[ConfigKey] = true
			JoinResult.loadTimer.logUiRequestQueued()
			t[ConfigKey] = JoinResult
			
			return DataResolver.getAndFetchItem(ConfigKey, if p4 then function(): boolean
				return true
			end else nil)
		end
	end
	
	local function getInputData(p5, p6, p7)
		-- upvalues: ResolveSduiCacheEntryModule (upval), t3 (copy)
		local ResolveSduiCacheEntryModuleResult = ResolveSduiCacheEntryModule(t3, p5, if p6 and p6 ~= "" then `{p5}_{p6}` else nil)
		
		return if ResolveSduiCacheEntryModuleResult == nil then nil else ResolveSduiCacheEntryModuleResult.get(p7 ~= nil and p7)
	end
	
	local v3 = if FFlagEnableSduiV2HomeInterleave then function(p5)
		-- upvalues: t (copy), SduiResponseType (upval), DataResolver (copy), HandleSduiApiResponseModule (upval), SduiProtobufResponseHelpersModule (upval), getInputDataSignals (copy), SduiLogger (upval), SduiErrors (upval), SduiParseHelpers (upval), AccumulateSduiCacheSubEntriesModule (upval), DataCache (copy)
		local ConfigKey = p5.configKey
		local LoadTimer = p5.loadTimer
		LoadTimer.logUiRequestQueued()
		t[ConfigKey] = {
			url = `inline://{ConfigKey}`,
			surfaceKey = p5.surfaceKey,
			configKey = ConfigKey,
			loadTimer = LoadTimer,
			apiProto = p5.apiProto,
			responseType = SduiResponseType.Protobuf
		}
		local DataResult = DataResolver.getCachedItem(ConfigKey).data(false)
		local Success, Result = pcall(function()
			-- upvalues: HandleSduiApiResponseModule (upval), p5 (copy), LoadTimer (copy), ConfigKey (copy), SduiProtobufResponseHelpersModule (upval), getInputDataSignals (upval)
			return HandleSduiApiResponseModule({
				paginateResponse = false,
				cacheSingleEntryWithIdentifier = true,
				response = { StatusCode = 200, Body = p5.decodedResponse, Stats = {} },
				loadTimer = LoadTimer,
				surfaceKey = p5.surfaceKey,
				configCacheKey = ConfigKey,
				decodeResponse = function(p6)
					return p6
				end,
				parseHydrationDataFromResponse = SduiProtobufResponseHelpersModule.parseHydrationDataFromResponse,
				parseTemplateEntriesFromResponse = SduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse,
				parsePageEntriesFromResponse = SduiProtobufResponseHelpersModule.parsePageEntriesFromResponse,
				getInputDataSignalsForRequest = getInputDataSignals
			})
		end)
		
		if not Success then
			SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToFetchPage, {
				message = `seedFromDecodedResponse failed for {ConfigKey}: {SduiParseHelpers.stringifyValue(Result)}`,
				name = p5.surfaceKey
			}, p5.surfaceKey)
			error(Result)
		end
		DataCache.updateItems({
			[ConfigKey] = AccumulateSduiCacheSubEntriesModule(Result, DataResult)
		})
	end else nil
	
	local function dismissEntry(Title)
		-- upvalues: t (copy), DataResolver (copy), DataCache (copy)
		local List = {}
		
		if typeof(Title) ~= "string" or Title == "" then
			return List
		end
		for i in t do
			local DataResult = DataResolver.getCachedItem(i).data(false)
			
			if DataResult then
				local Flag = false
				local t4 = {}
				
				for i1, value in DataResult do
					if value and value.category ~= nil and value.title == Title then
						Flag = true
					else
						t4[i1] = value
					end
				end
				if Flag then
					DataCache.replaceItems({ [i] = t4 })
					table.insert(List, i)
				end
			end
		end
		return List
	end
	
	return {
		fetchIfNeeded = fetchIfNeeded,
		isInFlight = isInFlight,
		dismissEntry = if FFlagSduiDismissPromptAction then dismissEntry else nil,
		seedFromDecodedResponse = if FFlagEnableSduiV2HomeInterleave then v3 else nil,
		getData = DataResolver.getCachedItem,
		getInputData = if FFlagSduiApiStoreExposeGetInputData then getInputData else nil,
		getRootConfig = function(p6, p7, p8)
			-- upvalues: DataResolver (copy), FFlagSduiAlwaysCacheWithIdentifier (upval), ResolveSduiCacheEntryModule (upval)
			local DataResult = DataResolver.getCachedItem(p6).data(p7)
			local ResolveSduiCacheEntryModuleResult = if FFlagSduiAlwaysCacheWithIdentifier then ResolveSduiCacheEntryModule(DataResult, p6, p8) else DataResult and DataResult[p8 or p6]
			
			return if ResolveSduiCacheEntryModuleResult then ResolveSduiCacheEntryModuleResult.config else nil
		end,
		getTitle = function(p6, p7, p8)
			-- upvalues: DataResolver (copy), FFlagSduiAlwaysCacheWithIdentifier (upval), ResolveSduiCacheEntryModule (upval)
			local DataResult = DataResolver.getCachedItem(p6).data(p7)
			local ResolveSduiCacheEntryModuleResult = if FFlagSduiAlwaysCacheWithIdentifier then ResolveSduiCacheEntryModule(DataResult, p6, p8) else DataResult and DataResult[p8 or p6]
			
			return if ResolveSduiCacheEntryModuleResult and ResolveSduiCacheEntryModuleResult.title ~= "" then ResolveSduiCacheEntryModuleResult.title else nil
		end,
		getDataUpdatedTimestamp = function(p6, p7, p8)
			-- upvalues: DataResolver (copy), FFlagSduiAlwaysCacheWithIdentifier (upval), ResolveSduiCacheEntryModule (upval)
			local DataResult = DataResolver.getCachedItem(p6).data(p7)
			local ResolveSduiCacheEntryModuleResult = if FFlagSduiAlwaysCacheWithIdentifier then ResolveSduiCacheEntryModule(DataResult, p6, p8) else DataResult and DataResult[p8 or p6]
			
			return if ResolveSduiCacheEntryModuleResult then ResolveSduiCacheEntryModuleResult.dataUpdatedTimestamp else nil
		end,
		getEntrySurfacing = function(p6, p7, p8)
			-- upvalues: DataResolver (copy), FFlagSduiAlwaysCacheWithIdentifier (upval), ResolveSduiCacheEntryModule (upval)
			local DataResult = DataResolver.getCachedItem(p6).data(p8)
			local ResolveSduiCacheEntryModuleResult = if FFlagSduiAlwaysCacheWithIdentifier then ResolveSduiCacheEntryModule(DataResult, p6, p7) else DataResult and DataResult[p7 or p6]
			
			return if ResolveSduiCacheEntryModuleResult then ResolveSduiCacheEntryModuleResult.surfacing else nil
		end,
		loadMoreFromApi = function(p6)
			-- upvalues: FFlagSduiChartsSupport (upval), t4 (copy), t (copy), SduiLogger (upval), SduiErrors (upval), PromiseModule (upval), DataResolver (copy), FFlagSduiAlwaysCacheWithIdentifier (upval), ResolveSduiCacheEntryModule (upval), fetchIfNeeded (copy), CryoModule (upval)
			if not FFlagSduiChartsSupport and t4[p6.configKey] then
				return nil
			end
			local Entry = t[p6.configKey]
			
			if not Entry then
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToPaginateRequest, { message = `No requestData for {p6.configKey}` }, "unknown")
				
				return if FFlagSduiChartsSupport then PromiseModule.resolve() else nil
			end
			local DataResult = DataResolver.getCachedItem(p6.configKey).data(false)
			local ResolveSduiCacheEntryModuleResult = if FFlagSduiAlwaysCacheWithIdentifier then ResolveSduiCacheEntryModule(DataResult, p6.configKey, p6.identifier) else DataResult and DataResult[p6.identifier or p6.configKey]
			
			if not ResolveSduiCacheEntryModuleResult then
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToPaginateRequest, {
					message = `No entry data for {p6.configKey}`,
					name = Entry.surfaceKey
				}, Entry.surfaceKey)
				
				return if FFlagSduiChartsSupport then PromiseModule.resolve() else nil
			end
			local NextPageUrl = ResolveSduiCacheEntryModuleResult.nextPageUrl
			
			if not NextPageUrl or NextPageUrl == "" then
				return if FFlagSduiChartsSupport then PromiseModule.resolve() else nil
			elseif FFlagSduiChartsSupport then
				return fetchIfNeeded(CryoModule.Dictionary.join(Entry, {
					isPaginated = true,
					url = NextPageUrl,
					loadTimer = p6.loadTimer
				}), true)
			else
				fetchIfNeeded(CryoModule.Dictionary.join(Entry, {
					isPaginated = true,
					url = NextPageUrl,
					loadTimer = p6.loadTimer
				}), true)
				
				return nil
			end
		end,
		refreshFromApi = function(p7)
			-- upvalues: t (copy), SduiLogger (upval), SduiErrors (upval), FFlagSduiChartsSupport (upval), PromiseModule (upval), fetchIfNeeded (copy), CryoModule (upval)
			local Entry = t[p7.configKey]
			
			if Entry then
				return if FFlagSduiChartsSupport then fetchIfNeeded(CryoModule.Dictionary.join(Entry, {
					url = (if Entry.buildRefreshUrl then Entry.buildRefreshUrl() else nil) or Entry.url,
					loadTimer = p7.loadTimer,
					isPaginated = CryoModule.None
				}), true) else fetchIfNeeded(CryoModule.Dictionary.join(Entry, { loadTimer = p7.loadTimer }), true)
			else
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToFetchPage, { message = `No requestData for refresh: {p7.configKey}` }, "unknown")
				
				return if FFlagSduiChartsSupport then PromiseModule.resolve() else nil
			end
		end
	}
end