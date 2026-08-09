local httpService = game:GetService("HttpService")
local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiLogger = sduiCoreSystemModule.SduiLogger
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers
local promiseModule = require(parent.Promise)
local dataHydrationModule = require(parent.DataHydration)
local createDataCache = dataHydrationModule.createDataCache
local createDataResolver = dataHydrationModule.createDataResolver
local sduiIntegrationTypesModule = require(sduiSharedUtilities.SduiIntegrationTypes)
local sduiRequestStatus = sduiIntegrationTypesModule.SduiRequestStatus
local _ = require(sduiSharedUtilities.SduiLoadTimer)
local sduiProtobufResponseHelpersModule = require(sduiSharedUtilities.SduiProtobufResponseHelpers)
local makeProtoResponseDecoder = sduiProtobufResponseHelpersModule.makeProtoResponseDecoder
local makeProtobufJsonResponseDecoder = sduiProtobufResponseHelpersModule.makeProtobufJsonResponseDecoder
local sduiResponseType = sduiIntegrationTypesModule.SduiResponseType
local handleSduiApiResponseModule = require(sduiSharedUtilities.handleSduiApiResponse)
local sduiPageAnalyticsModule = require(sduiSharedUtilities.SduiPageAnalytics)
local sduiApiStorePostConfigModule = require(sduiSharedUtilities.SduiApiStorePostConfig)
local createSduiStreamingResponseHandlerModule = require(sduiSharedUtilities.createSduiStreamingResponseHandler)
local fFlagSduiProtobufJsonDecode = require(parent.SharedFlags).FFlagSduiProtobufJsonDecode
local sduiEnableClearOnEmptyResponse = game:DefineFastFlag("SduiEnableClearOnEmptyResponse", false)
local fFlagSduiAllowNoConfigsBuilt = require(parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local fFlagSduiChartsSupport = require(parent.SharedFlags).FFlagSduiChartsSupport
local fFlagSduiConfigFetchTakesPostBody = require(parent.SharedFlags).FFlagSduiConfigFetchTakesPostBody
local fFlagSduiClientTemplateCache = require(parent.SharedFlags).FFlagSduiClientTemplateCache
local fFlagSduiAlwaysCacheWithIdentifier = require(parent.SharedFlags).FFlagSduiAlwaysCacheWithIdentifier
local fFlagEnableSduiV2HomeInterleave = require(parent.SharedFlags).FFlagEnableSduiV2HomeInterleave
local fFlagLuaAppSduiStreamingChunkedResponses = require(parent.SharedFlags).FFlagLuaAppSduiStreamingChunkedResponses
local fFlagSduiErrorCleanup = require(parent.SharedFlags).FFlagSduiErrorCleanup
local fFlagSduiInputDataMergeStrategy = require(parent.SharedFlags).FFlagSduiInputDataMergeStrategy
local fFlagSduiDismissPromptAction = require(parent.SharedFlags).FFlagSduiDismissPromptAction
local fFlagSduiApiStoreExposeGetInputData = require(parent.SharedFlags).FFlagSduiApiStoreExposeGetInputData
local fFlagSduiRenderPerf = require(parent.SharedFlags).FFlagSduiRenderPerf
local sduiPageRequestPriority = game:DefineFastInt("SduiPageRequestPriority", 1)
local resolveSduiCacheEntryModule = require(sduiSharedUtilities.resolveSduiCacheEntry)
local accumulateSduiCacheSubEntriesModule = require(sduiSharedUtilities.accumulateSduiCacheSubEntries)

return function() --[[ line: 113 | named "createSduiApiStore" ]]
	-- upvalues: createDataCache (ref), signalsModule (ref), promiseModule (ref), fFlagSduiProtobufJsonDecode (ref), sduiResponseType (ref), fFlagSduiConfigFetchTakesPostBody (ref), fFlagLuaAppSduiStreamingChunkedResponses (ref), makeProtobufJsonResponseDecoder (ref), makeProtoResponseDecoder (ref), handleSduiApiResponseModule (ref), sduiProtobufResponseHelpersModule (ref), fFlagSduiAllowNoConfigsBuilt (ref), fFlagSduiInputDataMergeStrategy (ref), fFlagSduiClientTemplateCache (ref), createSduiStreamingResponseHandlerModule (ref), accumulateSduiCacheSubEntriesModule (ref), httpService (ref), sduiApiStorePostConfigModule (ref), fFlagSduiRenderPerf (ref), sduiPageRequestPriority (ref), sduiPageAnalyticsModule (ref), sduiRequestStatus (ref), fFlagSduiErrorCleanup (ref), sduiLogger (ref), sduiErrors (ref), fFlagSduiChartsSupport (ref), sduiParseHelpers (ref), sduiEnableClearOnEmptyResponse (ref), cryoModule (ref), createDataResolver (ref), resolveSduiCacheEntryModule (ref), fFlagSduiAlwaysCacheWithIdentifier (ref), fFlagEnableSduiV2HomeInterleave (ref), fFlagSduiDismissPromptAction (ref), fFlagSduiApiStoreExposeGetInputData (ref)
	local var17 = createDataCache()
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	local function _(p0, p1, p2) --[[ line: 127 | named "completeActiveRequest" ]]
		-- upvalues: t_2 (ref)
		local var26 = t_2[p0]
		
		if var26 then
			t_2[p0] = nil
			
			if p1 then
				var26.resolve(p2)
				
				return
			end
			var26.reject(p2)
		end
	end
	
	local function isInFlight(p3) --[[ line: 143 ]]
		-- upvalues: t_2 (ref), t_1 (ref)
		return if t_2[p3] == nil then t_1[p3] == true else true
	end
	
	local t_3 = {}
	
	local function getInputDataSignals(value) --[[ line: 158 ]]
		-- upvalues: t_3 (ref), signalsModule (copy)
		local var27 = t_3[value]
		
		if var27 == nil then
			local var28, var29 = signalsModule.createSignal(nil)
			var27 = { get = var28, set = var29 }
			t_3[value] = var27
		end
		return var27
	end
	
	local var24 = createDataResolver({
		queueProcessDelaySec = 0,
		supportsMultiGet = false,
		cache = var17,
		fetchFn = function(p4, p5) --[[ line: 174 ]]
			-- upvalues: t (ref), promiseModule (copy), fFlagSduiProtobufJsonDecode (copy), sduiResponseType (copy), fFlagSduiConfigFetchTakesPostBody (copy), fFlagLuaAppSduiStreamingChunkedResponses (copy), makeProtobufJsonResponseDecoder (copy), makeProtoResponseDecoder (copy), handleSduiApiResponseModule (copy), sduiProtobufResponseHelpersModule (copy), getInputDataSignals (ref), fFlagSduiAllowNoConfigsBuilt (copy), fFlagSduiInputDataMergeStrategy (copy), fFlagSduiClientTemplateCache (copy), createSduiStreamingResponseHandlerModule (copy), accumulateSduiCacheSubEntriesModule (copy), var17 (ref), httpService (copy), sduiApiStorePostConfigModule (copy), fFlagSduiRenderPerf (copy), sduiPageRequestPriority (copy), t_1 (ref), sduiPageAnalyticsModule (copy), sduiRequestStatus (copy), fFlagSduiErrorCleanup (copy), sduiLogger (copy), sduiErrors (copy), fFlagSduiChartsSupport (copy), t_2 (ref), sduiParseHelpers (copy), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
			local var30 = t[p4]
			
			if not var30 then
				return promiseModule.reject("No request config for key", p4)
			end
			local url = var30.url
			local loadTimer = var30.loadTimer
			loadTimer.logUiRequestSent()
			local var31 = fFlagSduiProtobufJsonDecode and var30.responseType == sduiResponseType.ProtobufJson
			local postConfig = var30.postConfig
			local var32 = if fFlagSduiConfigFetchTakesPostBody and postConfig then "POST" else "GET"
			local var33 = if fFlagLuaAppSduiStreamingChunkedResponses then var30.enableStreaming else nil
			local var34 = if var31 then makeProtobufJsonResponseDecoder(var30.apiProto) else makeProtoResponseDecoder(var30.apiProto)
			
			local function processSduiResponse(p6) --[[ line: 197 ]]
				-- upvalues: var30 (ref), p5 (ref), handleSduiApiResponseModule (copy), loadTimer (ref), var34 (ref), sduiProtobufResponseHelpersModule (copy), getInputDataSignals (copy), fFlagLuaAppSduiStreamingChunkedResponses (copy), var33 (ref), fFlagSduiAllowNoConfigsBuilt (copy), fFlagSduiInputDataMergeStrategy (copy), fFlagSduiClientTemplateCache (copy)
				return handleSduiApiResponseModule({
					response = p6,
					loadTimer = loadTimer,
					surfaceKey = var30.surfaceKey,
					configCacheKey = var30.configKey,
					decodeResponse = var34,
					parseHydrationDataFromResponse = sduiProtobufResponseHelpersModule.parseHydrationDataFromResponse,
					parseTemplateEntriesFromResponse = sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse,
					parsePageEntriesFromResponse = sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse,
					getInputDataSignalsForRequest = getInputDataSignals,
					enableStreamingMerge = if fFlagLuaAppSduiStreamingChunkedResponses then var33 else nil,
					paginateResponse = var30.isPaginated and p5.data(false) ~= nil,
					buildNextPageUrl = var30.buildNextPageUrl,
					allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then var30.allowNoConfigsBuilt else nil,
					mergeStrategy = if fFlagSduiInputDataMergeStrategy then var30.mergeStrategy else nil,
					enableTemplateCache = if fFlagSduiClientTemplateCache then var30.enableTemplateCache else nil
				})
			end
			
			local var36 = if fFlagLuaAppSduiStreamingChunkedResponses and var33 then createSduiStreamingResponseHandlerModule({
				configKey = p4,
				loadTimer = loadTimer,
				processFrame = function(p7) --[[ line: 222 ]]
					-- upvalues: processSduiResponse (ref), accumulateSduiCacheSubEntriesModule (copy), p5 (ref), var17 (copy), p4 (ref)
					local ok, status = pcall(processSduiResponse, { Stats = {}, Body = buffer.fromstring(p7) })
					
					if ok then
						local var38 = accumulateSduiCacheSubEntriesModule(status, p5.data(false))
						var17.updateItems({ [p4] = var38 })
						
						return true, var38
					end
					return false, status
				end
			}) else nil
			local var37 = httpService:RequestInternal({
				Url = url,
				Method = var32,
				Headers = {
					Accept = if var31 then "application/json" else "application/x-protobuf",
					["Content-Type"] = if fFlagSduiConfigFetchTakesPostBody and postConfig then sduiApiStorePostConfigModule.getContentTypeHeaderFromPostConfig(postConfig) else nil
				},
				Body = if fFlagSduiConfigFetchTakesPostBody and postConfig then sduiApiStorePostConfigModule.getBodyFromPostConfig(postConfig) else nil,
				OnMessage = if var36 then var36.handleChunk else nil,
				Priority = if fFlagSduiRenderPerf then sduiPageRequestPriority else nil
			})
			
			return promiseModule.new(function(p8, p9) --[[ line: 254 ]]
				-- upvalues: var37 (ref), loadTimer (ref), t_1 (copy), p4 (ref), sduiPageAnalyticsModule (copy), var30 (ref), sduiRequestStatus (copy), fFlagSduiErrorCleanup (copy), sduiLogger (copy), sduiErrors (copy), url (ref), fFlagSduiChartsSupport (copy), t_2 (copy), var36 (ref), sduiParseHelpers (copy), processSduiResponse (ref), p5 (ref), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
				var37:Start(function(p10, p11) --[[ line: 255 ]]
					-- upvalues: loadTimer (copy), t_1 (copy), p4 (copy), sduiPageAnalyticsModule (copy), var30 (copy), sduiRequestStatus (copy), fFlagSduiErrorCleanup (copy), sduiLogger (copy), sduiErrors (copy), url (copy), fFlagSduiChartsSupport (copy), t_2 (copy), p9 (ref), var36 (copy), p8 (ref), sduiParseHelpers (copy), processSduiResponse (copy), p5 (copy), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
					local var39
					loadTimer.logUiResponseReceived()
					t_1[p4] = false
					sduiPageAnalyticsModule.sendPageStatusEvent(var30.surfaceKey, p11.StatusCode, p11.HttpError)
					
					if p10 then
						var39 = if p11.StatusCode then tonumber(p11.StatusCode) else nil
						
						if var39 and var39 >= 400 or p11.HttpError and p11.HttpError ~= Enum.HttpError.OK then
							loadTimer.updateRequestStatus(sduiRequestStatus.FailedToLoad)
							
							if not fFlagSduiErrorCleanup then
								sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
									message = `Http request not successful for {url} StatusCode {p11.StatusCode} HttpError {p11.HttpError}`,
									name = var30.surfaceKey
								}, var30.surfaceKey)
							end
							if fFlagSduiChartsSupport then
								local var40 = p4
								local var41 = t_2[var40]
								
								if var41 then
									t_2[var40] = nil
									var41.reject(p11)
								end
							end
							return p9(p11)
						else
							loadTimer.updateRequestStatus(sduiRequestStatus.LoadedFromNetwork)
							sduiPageAnalyticsModule.sendPagePayloadSizeEvent(var30.surfaceKey, p11.Body)
							
							if var36 then
								local var42 = var36.finalize(p11.Body)
								
								if var42.ok then
									if fFlagSduiChartsSupport then
										local var43 = p4
										local value = var42.value
										local var44 = t_2[var43]
										
										if var44 then
											t_2[var43] = nil
											var44.resolve(value)
										end
									end
									return p8(var42.value)
								else
									sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
										message = sduiParseHelpers.stringifyValue(var42.value),
										name = var30.surfaceKey
									}, var30.surfaceKey)
									loadTimer.updateRequestStatus(sduiRequestStatus.FailedToLoad)
									
									if fFlagSduiChartsSupport then
										local var45 = p4
										local value = var42.value
										local var46 = t_2[var45]
										
										if var46 then
											t_2[var45] = nil
											var46.reject(value)
										end
									end
									return p9(var42.value)
								end
							else
								local ok, status = pcall(processSduiResponse, p11)
								
								if ok then
									local t = {}
									
									if not sduiEnableClearOnEmptyResponse then
										local var52 = p5.data(false)
										
										for i, v in status do
											local var53 = var52 and var52[i]
											t[i] = if var53 then cryoModule.Dictionary.join(var53, v) else v
										end
									elseif next(status) then
										local var50 = p5.data(false)
										
										for i, v in status do
											local var51 = var50 and var50[i]
											t[i] = if var51 then cryoModule.Dictionary.join(var51, v) else v
										end
									elseif var30.clearOnEmptyResponse and var30.configKey then
										t[var30.configKey] = {}
									end
									if fFlagSduiChartsSupport then
										local var54 = p4
										local var55 = t_2[var54]
										
										if var55 then
											t_2[var54] = nil
											var55.resolve(t)
										end
									end
									return p8(t)
								else
									sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
										message = `handleSduiApiResponse not successful for {url} err {sduiParseHelpers.stringifyValue(status)}`,
										name = var30.surfaceKey
									}, var30.surfaceKey)
									
									if fFlagSduiChartsSupport then
										local var47 = p4
										local var48 = t_2[var47]
										
										if var48 then
											t_2[var47] = nil
											var48.reject(status)
										end
									end
									return p9(p5)
								end
							end
						end
					elseif not fFlagSduiErrorCleanup then
						sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
							message = `Http request not successful for {url} err {sduiParseHelpers.stringifyValue(p11)}`,
							name = var30.surfaceKey
						}, var30.surfaceKey)
					end
					if fFlagSduiChartsSupport then
						var39 = p4
						local var56 = t_2[var39]
						
						if var56 then
							t_2[var39] = nil
							var56.reject(p11)
						end
					end
					return p9(p11)
				end)
			end)
		end
	})
	
	local function fetchIfNeeded(p12, p13) --[[ line: 385 ]]
		-- upvalues: fFlagSduiProtobufJsonDecode (copy), sduiResponseType (copy), fFlagSduiChartsSupport (copy), t (ref), var24 (ref), t_2 (ref), promiseModule (copy), fFlagSduiErrorCleanup (copy), sduiLogger (copy), sduiErrors (copy), sduiParseHelpers (copy), t_1 (ref)
		if fFlagSduiProtobufJsonDecode and p12.responseType == nil then
			p12.responseType = sduiResponseType.Protobuf
		end
		local configKey = p12.configKey or p12.url
		p12.configKey = configKey
		
		if fFlagSduiChartsSupport then
			p12.loadTimer.logUiRequestQueued()
			t[configKey] = p12
			local _, andFetchItem = var24.getAndFetchItem(configKey, if p13 then function() --[[ line: 401 ]]
				return true
			end else nil)
			
			if not andFetchItem then
				return promiseModule.resolve()
			elseif not t_2[configKey] then
				local var59 = nil
				local var60 = nil
				local var61 = promiseModule.new(function(p14, p15) --[[ line: 410 ]]
					-- upvalues: var59 (write), var60 (write)
					var59 = p14
					var60 = p15
				end)
				var61:catch(function(p16) --[[ line: 414 ]]
					-- upvalues: fFlagSduiErrorCleanup (copy), sduiLogger (copy), sduiErrors (copy), configKey (ref), sduiParseHelpers (copy), p12 (ref)
					if not fFlagSduiErrorCleanup then
						sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
							message = `fetchIfNeeded promise rejected for {configKey}: {sduiParseHelpers.stringifyValue(p16)}`
						}, p12.surfaceKey)
					end
				end)
				t_2[configKey] = { promise = var61, resolve = var59, reject = var60 }
			end
			return t_2[configKey].promise
		elseif t_1[configKey] then
			return nil
		end
		t_1[configKey] = true
		p12.loadTimer.logUiRequestQueued()
		t[configKey] = p12
		
		return var24.getAndFetchItem(configKey, if p13 then function() --[[ line: 451 ]]
			return true
		end else nil)
	end
	
	return {
		fetchIfNeeded = fetchIfNeeded,
		isInFlight = isInFlight,
		dismissEntry = if fFlagSduiDismissPromptAction then function(p17) --[[ line: 704 | named "dismissEntry" ]]
			-- upvalues: t (ref), var24 (ref), var17 (ref)
			local t_1 = {}
			
			if typeof(p17) ~= "string" or p17 == "" then
				return t_1
			end
			for i in t do
				local var63 = var24.getCachedItem(i).data(false)
				
				if var63 then
					local var64 = false
					local t_2 = {}
					
					for i_1, v in var63 do
						if v and v.category ~= nil and v.title == p17 then
							var64 = true
						else
							t_2[i_1] = v
						end
					end
					if var64 then
						var17.replaceItems({ [i] = t_2 })
						table.insert(t_1, i)
					end
				end
			end
			return t_1
		end else nil,
		seedFromDecodedResponse = if fFlagEnableSduiV2HomeInterleave then if fFlagEnableSduiV2HomeInterleave then function(p18) --[[ line: 638 ]]
			-- upvalues: t (ref), sduiResponseType (copy), var24 (ref), handleSduiApiResponseModule (copy), sduiProtobufResponseHelpersModule (copy), getInputDataSignals (ref), sduiLogger (copy), sduiErrors (copy), sduiParseHelpers (copy), accumulateSduiCacheSubEntriesModule (copy), var17 (ref)
			local configKey = p18.configKey
			local loadTimer = p18.loadTimer
			loadTimer.logUiRequestQueued()
			t[configKey] = {
				url = `inline://{configKey}`,
				surfaceKey = p18.surfaceKey,
				configKey = configKey,
				loadTimer = loadTimer,
				apiProto = p18.apiProto,
				responseType = sduiResponseType.Protobuf
			}
			local var66 = var24.getCachedItem(configKey).data(false)
			local ok, status = pcall(function() --[[ line: 661 ]]
				-- upvalues: handleSduiApiResponseModule (copy), p18 (ref), loadTimer (ref), configKey (ref), sduiProtobufResponseHelpersModule (copy), getInputDataSignals (copy)
				return handleSduiApiResponseModule({
					paginateResponse = false,
					cacheSingleEntryWithIdentifier = true,
					response = { StatusCode = 200, Body = p18.decodedResponse, Stats = {} },
					loadTimer = loadTimer,
					surfaceKey = p18.surfaceKey,
					configCacheKey = configKey,
					decodeResponse = function(p19) --[[ line: 671 ]]
						return p19
					end,
					parseHydrationDataFromResponse = sduiProtobufResponseHelpersModule.parseHydrationDataFromResponse,
					parseTemplateEntriesFromResponse = sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse,
					parsePageEntriesFromResponse = sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse,
					getInputDataSignalsForRequest = getInputDataSignals
				})
			end)
			
			if not ok then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
					message = `seedFromDecodedResponse failed for {configKey}: {sduiParseHelpers.stringifyValue(status)}`,
					name = p18.surfaceKey
				}, p18.surfaceKey)
				error(status)
			end
			var17.updateItems({
				[configKey] = accumulateSduiCacheSubEntriesModule(status, var66)
			})
		end else nil else nil,
		getData = var24.getCachedItem,
		getInputData = if fFlagSduiApiStoreExposeGetInputData then function(p20, p21, p22) --[[ line: 470 | named "getInputData" ]]
			-- upvalues: resolveSduiCacheEntryModule (copy), t_3 (ref)
			local var67 = resolveSduiCacheEntryModule(t_3, p20, if p21 and p21 ~= "" then `{p20}_{p21}` else nil)
			
			return if var67 == nil then nil else var67.get(if p22 == nil then false else p22)
		end else nil,
		getRootConfig = function(p23, p24, p25) --[[ line: 483 ]]
			-- upvalues: var24 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var68 = var24.getCachedItem(p23).data(p24)
			local var69 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var68, p23, p25) else var68 and var68[p25 or p23]
			
			return if var69 then var69.config else nil
		end,
		getTitle = function(p26, p27, p28) --[[ line: 499 ]]
			-- upvalues: var24 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var70 = var24.getCachedItem(p26).data(p27)
			local var71 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var70, p26, p28) else var70 and var70[p28 or p26]
			
			return if var71 and var71.title ~= "" then var71.title else nil
		end,
		getDataUpdatedTimestamp = function(p29, p30, p31) --[[ line: 511 ]]
			-- upvalues: var24 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var72 = var24.getCachedItem(p29).data(p30)
			local var73 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var72, p29, p31) else var72 and var72[p31 or p29]
			
			return if var73 then var73.dataUpdatedTimestamp else nil
		end,
		getEntrySurfacing = function(p32, p33, p34) --[[ line: 525 ]]
			-- upvalues: var24 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var74 = var24.getCachedItem(p32).data(p34)
			local var75 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var74, p32, p33) else var74 and var74[p33 or p32]
			
			return if var75 then var75.surfacing else nil
		end,
		loadMoreFromApi = function(p35) --[[ line: 537 ]]
			-- upvalues: fFlagSduiChartsSupport (copy), t_1 (ref), t (ref), sduiLogger (copy), sduiErrors (copy), promiseModule (copy), var24 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy), fetchIfNeeded (ref), cryoModule (copy)
			if not fFlagSduiChartsSupport and t_1[p35.configKey] then
				return nil
			end
			local configKey = t[p35.configKey]
			
			if configKey then
				local var77
				local var76 = var24.getCachedItem(p35.configKey).data(false)
				
				if fFlagSduiAlwaysCacheWithIdentifier then
					var77 = resolveSduiCacheEntryModule(var76, p35.configKey, p35.identifier)
				else
					var77 = var76
					
					if var77 then
						var77 = var76[p35.identifier or p35.configKey]
					end
				end
				if var77 then
					local nextPageUrl = var77.nextPageUrl
					
					if nextPageUrl and nextPageUrl ~= "" then
						if fFlagSduiChartsSupport then
							return fetchIfNeeded(cryoModule.Dictionary.join(configKey, {
								isPaginated = true,
								url = nextPageUrl,
								loadTimer = p35.loadTimer
							}), true)
						end
						fetchIfNeeded(cryoModule.Dictionary.join(configKey, {
							isPaginated = true,
							url = nextPageUrl,
							loadTimer = p35.loadTimer
						}), true)
						
						return nil
					else
						return if fFlagSduiChartsSupport then promiseModule.resolve() else nil
					end
				else
					sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToPaginateRequest, {
						message = `No entry data for {p35.configKey}`,
						name = configKey.surfaceKey
					}, configKey.surfaceKey)
					
					return if fFlagSduiChartsSupport then promiseModule.resolve() else nil
				end
			else
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToPaginateRequest, { message = `No requestData for {p35.configKey}` }, "unknown")
				
				return if fFlagSduiChartsSupport then promiseModule.resolve() else nil
			end
		end,
		refreshFromApi = function(p36) --[[ line: 601 ]]
			-- upvalues: t (ref), sduiLogger (copy), sduiErrors (copy), fFlagSduiChartsSupport (copy), promiseModule (copy), fetchIfNeeded (ref), cryoModule (copy)
			local configKey = t[p36.configKey]
			
			if configKey then
				return if fFlagSduiChartsSupport then fetchIfNeeded(cryoModule.Dictionary.join(configKey, {
					url = (if configKey.buildRefreshUrl then configKey.buildRefreshUrl() else nil) or configKey.url,
					loadTimer = p36.loadTimer,
					isPaginated = cryoModule.None
				}), true) else fetchIfNeeded(cryoModule.Dictionary.join(configKey, { loadTimer = p36.loadTimer }), true)
			end
			sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, { message = `No requestData for refresh: {p36.configKey}` }, "unknown")
			
			return if fFlagSduiChartsSupport then promiseModule.resolve() else nil
		end
	}
end