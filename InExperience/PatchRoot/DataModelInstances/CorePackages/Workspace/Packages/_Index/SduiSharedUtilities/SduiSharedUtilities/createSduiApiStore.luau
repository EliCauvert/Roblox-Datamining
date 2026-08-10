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
local fFlagLuaAppSduiStreamingChunkedResponses = require(parent.SharedFlags).FFlagLuaAppSduiStreamingChunkedResponses
local fFlagSduiErrorCleanup = require(parent.SharedFlags).FFlagSduiErrorCleanup
local fFlagSduiInputDataMergeStrategy = require(parent.SharedFlags).FFlagSduiInputDataMergeStrategy
local fFlagSduiDismissPromptAction = require(parent.SharedFlags).FFlagSduiDismissPromptAction
local fFlagSduiApiStoreExposeGetInputData = require(parent.SharedFlags).FFlagSduiApiStoreExposeGetInputData
local fFlagSduiApiStoreOnSuccessAndRefresh = require(parent.SharedFlags).FFlagSduiApiStoreOnSuccessAndRefresh
local fFlagSduiRenderPerf = require(parent.SharedFlags).FFlagSduiRenderPerf
local fFlagSduiPaginatePostBody = require(parent.SharedFlags).FFlagSduiPaginatePostBody
local sduiPageRequestPriority = game:DefineFastInt("SduiPageRequestPriority", 1)
local resolveSduiCacheEntryModule = require(sduiSharedUtilities.resolveSduiCacheEntry)
local accumulateSduiCacheSubEntriesModule = require(sduiSharedUtilities.accumulateSduiCacheSubEntries)

return function() --[[ line: 131 | named "createSduiApiStore" ]]
	-- upvalues: createDataCache (ref), fFlagSduiApiStoreOnSuccessAndRefresh (ref), signalsModule (ref), promiseModule (ref), fFlagSduiProtobufJsonDecode (ref), sduiResponseType (ref), fFlagSduiConfigFetchTakesPostBody (ref), fFlagLuaAppSduiStreamingChunkedResponses (ref), makeProtobufJsonResponseDecoder (ref), makeProtoResponseDecoder (ref), handleSduiApiResponseModule (ref), sduiProtobufResponseHelpersModule (ref), fFlagSduiPaginatePostBody (ref), fFlagSduiAllowNoConfigsBuilt (ref), fFlagSduiInputDataMergeStrategy (ref), fFlagSduiClientTemplateCache (ref), createSduiStreamingResponseHandlerModule (ref), accumulateSduiCacheSubEntriesModule (ref), httpService (ref), sduiApiStorePostConfigModule (ref), fFlagSduiRenderPerf (ref), sduiPageRequestPriority (ref), sduiPageAnalyticsModule (ref), sduiRequestStatus (ref), fFlagSduiErrorCleanup (ref), sduiLogger (ref), sduiErrors (ref), fFlagSduiChartsSupport (ref), sduiParseHelpers (ref), sduiEnableClearOnEmptyResponse (ref), cryoModule (ref), createDataResolver (ref), resolveSduiCacheEntryModule (ref), fFlagSduiAlwaysCacheWithIdentifier (ref), fFlagSduiDismissPromptAction (ref), fFlagSduiApiStoreExposeGetInputData (ref)
	local var17 = createDataCache()
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	local function _(p0, p1, p2, p3) --[[ line: 145 | named "completeActiveRequest" ]]
		-- upvalues: t_2 (ref), fFlagSduiApiStoreOnSuccessAndRefresh (copy), t (ref)
		local var26 = t_2[p0]
		
		if var26 then
			t_2[p0] = nil
			
			if p1 then
				var26.resolve(p2)
			else
				var26.reject(p2)
			end
		end
		if fFlagSduiApiStoreOnSuccessAndRefresh and p1 then
			local var27 = t[p0]
			
			if var27 and var27.onSuccess then
				var27.onSuccess(p2, p3)
			end
		end
	end
	
	local function isInFlight(p4) --[[ line: 168 ]]
		-- upvalues: t_2 (ref), t_1 (ref)
		return if t_2[p4] == nil then t_1[p4] == true else true
	end
	
	local t_3 = {}
	
	local function getInputDataSignals(value) --[[ line: 183 ]]
		-- upvalues: t_3 (ref), signalsModule (copy)
		local var28 = t_3[value]
		
		if var28 == nil then
			local var29, var30 = signalsModule.createSignal(nil)
			var28 = { get = var29, set = var30 }
			t_3[value] = var28
		end
		return var28
	end
	
	local var24 = createDataResolver({
		queueProcessDelaySec = 0,
		supportsMultiGet = false,
		cache = var17,
		fetchFn = function(p5, p6) --[[ line: 199 ]]
			-- upvalues: t (ref), promiseModule (copy), fFlagSduiProtobufJsonDecode (copy), sduiResponseType (copy), fFlagSduiConfigFetchTakesPostBody (copy), fFlagLuaAppSduiStreamingChunkedResponses (copy), makeProtobufJsonResponseDecoder (copy), makeProtoResponseDecoder (copy), handleSduiApiResponseModule (copy), sduiProtobufResponseHelpersModule (copy), getInputDataSignals (ref), fFlagSduiPaginatePostBody (copy), fFlagSduiAllowNoConfigsBuilt (copy), fFlagSduiInputDataMergeStrategy (copy), fFlagSduiClientTemplateCache (copy), createSduiStreamingResponseHandlerModule (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), accumulateSduiCacheSubEntriesModule (copy), var17 (ref), httpService (copy), sduiApiStorePostConfigModule (copy), fFlagSduiRenderPerf (copy), sduiPageRequestPriority (copy), t_1 (ref), sduiPageAnalyticsModule (copy), sduiRequestStatus (copy), fFlagSduiErrorCleanup (copy), sduiLogger (copy), sduiErrors (copy), fFlagSduiChartsSupport (copy), t_2 (ref), sduiParseHelpers (copy), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
			local var31 = t[p5]
			
			if not var31 then
				return promiseModule.reject("No request config for key", p5)
			end
			local url = var31.url
			local loadTimer = var31.loadTimer
			loadTimer.logUiRequestSent()
			local var32 = fFlagSduiProtobufJsonDecode and var31.responseType == sduiResponseType.ProtobufJson
			local postConfig = var31.postConfig
			local var33 = if fFlagSduiConfigFetchTakesPostBody and postConfig then "POST" else "GET"
			local var34 = if fFlagLuaAppSduiStreamingChunkedResponses then var31.enableStreaming else nil
			local var35 = if var32 then makeProtobufJsonResponseDecoder(var31.apiProto) else makeProtoResponseDecoder(var31.apiProto)
			
			local function processSduiResponse(p7) --[[ line: 222 ]]
				-- upvalues: var31 (ref), p6 (ref), handleSduiApiResponseModule (copy), loadTimer (ref), var35 (ref), sduiProtobufResponseHelpersModule (copy), getInputDataSignals (copy), fFlagLuaAppSduiStreamingChunkedResponses (copy), var34 (ref), fFlagSduiPaginatePostBody (copy), fFlagSduiAllowNoConfigsBuilt (copy), fFlagSduiInputDataMergeStrategy (copy), fFlagSduiClientTemplateCache (copy)
				return handleSduiApiResponseModule({
					response = p7,
					loadTimer = loadTimer,
					surfaceKey = var31.surfaceKey,
					configCacheKey = var31.configKey,
					decodeResponse = var35,
					parseHydrationDataFromResponse = sduiProtobufResponseHelpersModule.parseHydrationDataFromResponse,
					parseTemplateEntriesFromResponse = sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse,
					parsePageEntriesFromResponse = sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse,
					getInputDataSignalsForRequest = getInputDataSignals,
					enableStreamingMerge = if fFlagLuaAppSduiStreamingChunkedResponses then var34 else nil,
					paginateResponse = var31.isPaginated and p6.data(false) ~= nil,
					buildNextPageUrl = var31.buildNextPageUrl,
					buildNextPagePostBody = if fFlagSduiPaginatePostBody then var31.buildNextPagePostBody else nil,
					allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then var31.allowNoConfigsBuilt else nil,
					mergeStrategy = if fFlagSduiInputDataMergeStrategy then var31.mergeStrategy else nil,
					enableTemplateCache = if fFlagSduiClientTemplateCache then var31.enableTemplateCache else nil
				})
			end
			
			local var37 = nil
			local var38 = if fFlagLuaAppSduiStreamingChunkedResponses and var34 then createSduiStreamingResponseHandlerModule({
				configKey = p5,
				loadTimer = loadTimer,
				processFrame = function(p8) --[[ line: 250 ]]
					-- upvalues: processSduiResponse (ref), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var37 (write), accumulateSduiCacheSubEntriesModule (copy), p6 (ref), var17 (copy), p5 (ref)
					local ok, status, var40 = pcall(processSduiResponse, { Stats = {}, Body = buffer.fromstring(p8) })
					
					if not ok then
						return false, status
					elseif fFlagSduiApiStoreOnSuccessAndRefresh then
						var37 = var40
					end
					local var41 = accumulateSduiCacheSubEntriesModule(status, p6.data(false))
					var17.updateItems({ [p5] = var41 })
					
					return true, var41
				end
			}) else nil
			local var39 = httpService:RequestInternal({
				Url = url,
				Method = var33,
				Headers = {
					Accept = if var32 then "application/json" else "application/x-protobuf",
					["Content-Type"] = if fFlagSduiConfigFetchTakesPostBody and postConfig then sduiApiStorePostConfigModule.getContentTypeHeaderFromPostConfig(postConfig) else nil
				},
				Body = if fFlagSduiConfigFetchTakesPostBody and postConfig then sduiApiStorePostConfigModule.getBodyFromPostConfig(postConfig) else nil,
				OnMessage = if var38 then var38.handleChunk else nil,
				Priority = if fFlagSduiRenderPerf then sduiPageRequestPriority else nil
			})
			
			return promiseModule.new(function(p9, p10) --[[ line: 285 ]]
				-- upvalues: var39 (ref), loadTimer (ref), t_1 (copy), p5 (ref), sduiPageAnalyticsModule (copy), var31 (ref), sduiRequestStatus (copy), fFlagSduiErrorCleanup (copy), sduiLogger (copy), sduiErrors (copy), url (ref), fFlagSduiChartsSupport (copy), t_2 (copy), var38 (ref), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var37 (write), t (copy), sduiParseHelpers (copy), processSduiResponse (ref), p6 (ref), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
				var39:Start(function(p11, p12) --[[ line: 286 ]]
					-- upvalues: loadTimer (copy), t_1 (copy), p5 (copy), sduiPageAnalyticsModule (copy), var31 (copy), sduiRequestStatus (copy), fFlagSduiErrorCleanup (copy), sduiLogger (copy), sduiErrors (copy), url (copy), fFlagSduiChartsSupport (copy), t_2 (copy), p10 (ref), var38 (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var37 (copy), t (copy), p9 (ref), sduiParseHelpers (copy), processSduiResponse (copy), p6 (copy), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
					local var42
					loadTimer.logUiResponseReceived()
					t_1[p5] = false
					sduiPageAnalyticsModule.sendPageStatusEvent(var31.surfaceKey, p12.StatusCode, p12.HttpError)
					
					if p11 then
						var42 = if p12.StatusCode then tonumber(p12.StatusCode) else nil
						
						if var42 and var42 >= 400 or p12.HttpError and p12.HttpError ~= Enum.HttpError.OK then
							loadTimer.updateRequestStatus(sduiRequestStatus.FailedToLoad)
							
							if not fFlagSduiErrorCleanup then
								sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
									message = `Http request not successful for {url} StatusCode {p12.StatusCode} HttpError {p12.HttpError}`,
									name = var31.surfaceKey
								}, var31.surfaceKey)
							end
							if fFlagSduiChartsSupport then
								local var43 = p5
								local var44 = t_2[var43]
								
								if var44 then
									t_2[var43] = nil
									var44.reject(p12)
								end
							end
							return p10(p12)
						else
							loadTimer.updateRequestStatus(sduiRequestStatus.LoadedFromNetwork)
							sduiPageAnalyticsModule.sendPagePayloadSizeEvent(var31.surfaceKey, p12.Body)
							
							if var38 then
								local var45 = var38.finalize(p12.Body)
								
								if var45.ok then
									if fFlagSduiChartsSupport then
										local var46 = p5
										local value = var45.value
										local var47 = if fFlagSduiApiStoreOnSuccessAndRefresh then var37 else nil
										local var48 = t_2[var46]
										
										if var48 then
											t_2[var46] = nil
											var48.resolve(value)
										end
										if fFlagSduiApiStoreOnSuccessAndRefresh then
											local var49 = t[var46]
											
											if var49 and var49.onSuccess then
												var49.onSuccess(value, var47)
											end
										end
									end
									return p9(var45.value)
								else
									sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
										message = sduiParseHelpers.stringifyValue(var45.value),
										name = var31.surfaceKey
									}, var31.surfaceKey)
									loadTimer.updateRequestStatus(sduiRequestStatus.FailedToLoad)
									
									if fFlagSduiChartsSupport then
										local var50 = p5
										local value = var45.value
										local var51 = t_2[var50]
										
										if var51 then
											t_2[var50] = nil
											var51.reject(value)
										end
									end
									return p10(var45.value)
								end
							else
								local ok, status, var52 = pcall(processSduiResponse, p12)
								
								if ok then
									local t_3 = {}
									
									if not sduiEnableClearOnEmptyResponse then
										local var58 = p6.data(false)
										
										for i, v in status do
											local var59 = var58 and var58[i]
											t_3[i] = if var59 then cryoModule.Dictionary.join(var59, v) else v
										end
									elseif next(status) then
										local var56 = p6.data(false)
										
										for i, v in status do
											local var57 = var56 and var56[i]
											t_3[i] = if var57 then cryoModule.Dictionary.join(var57, v) else v
										end
									elseif var31.clearOnEmptyResponse and var31.configKey then
										t_3[var31.configKey] = {}
									end
									if fFlagSduiChartsSupport then
										local var60 = p5
										local var61 = if fFlagSduiApiStoreOnSuccessAndRefresh then var52 else nil
										local var62 = t_2[var60]
										
										if var62 then
											t_2[var60] = nil
											var62.resolve(t_3)
										end
										if fFlagSduiApiStoreOnSuccessAndRefresh then
											local var63 = t[var60]
											
											if var63 and var63.onSuccess then
												var63.onSuccess(t_3, var61)
											end
										end
									end
									return p9(t_3)
								else
									sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
										message = `handleSduiApiResponse not successful for {url} err {sduiParseHelpers.stringifyValue(status)}`,
										name = var31.surfaceKey
									}, var31.surfaceKey)
									
									if fFlagSduiChartsSupport then
										local var53 = p5
										local var54 = t_2[var53]
										
										if var54 then
											t_2[var53] = nil
											var54.reject(status)
										end
									end
									return p10(p6)
								end
							end
						end
					elseif not fFlagSduiErrorCleanup then
						sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
							message = `Http request not successful for {url} err {sduiParseHelpers.stringifyValue(p12)}`,
							name = var31.surfaceKey
						}, var31.surfaceKey)
					end
					if fFlagSduiChartsSupport then
						var42 = p5
						local var64 = t_2[var42]
						
						if var64 then
							t_2[var42] = nil
							var64.reject(p12)
						end
					end
					return p10(p12)
				end)
			end)
		end
	})
	
	local function fetchIfNeeded(p13, p14) --[[ line: 426 ]]
		-- upvalues: fFlagSduiProtobufJsonDecode (copy), sduiResponseType (copy), fFlagSduiChartsSupport (copy), t (ref), var24 (ref), t_2 (ref), promiseModule (copy), fFlagSduiErrorCleanup (copy), sduiLogger (copy), sduiErrors (copy), sduiParseHelpers (copy), t_1 (ref)
		if fFlagSduiProtobufJsonDecode and p13.responseType == nil then
			p13.responseType = sduiResponseType.Protobuf
		end
		local configKey = p13.configKey or p13.url
		p13.configKey = configKey
		
		if fFlagSduiChartsSupport then
			p13.loadTimer.logUiRequestQueued()
			t[configKey] = p13
			local _, andFetchItem = var24.getAndFetchItem(configKey, if p14 then function() --[[ line: 442 ]]
				return true
			end else nil)
			
			if not andFetchItem then
				return promiseModule.resolve()
			elseif not t_2[configKey] then
				local var67 = nil
				local var68 = nil
				local var69 = promiseModule.new(function(p15, p16) --[[ line: 451 ]]
					-- upvalues: var67 (write), var68 (write)
					var67 = p15
					var68 = p16
				end)
				var69:catch(function(p17) --[[ line: 455 ]]
					-- upvalues: fFlagSduiErrorCleanup (copy), sduiLogger (copy), sduiErrors (copy), configKey (ref), sduiParseHelpers (copy), p13 (ref)
					if not fFlagSduiErrorCleanup then
						sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
							message = `fetchIfNeeded promise rejected for {configKey}: {sduiParseHelpers.stringifyValue(p17)}`
						}, p13.surfaceKey)
					end
				end)
				t_2[configKey] = { promise = var69, resolve = var67, reject = var68 }
			end
			return t_2[configKey].promise
		elseif t_1[configKey] then
			return nil
		end
		t_1[configKey] = true
		p13.loadTimer.logUiRequestQueued()
		t[configKey] = p13
		
		return var24.getAndFetchItem(configKey, if p14 then function() --[[ line: 492 ]]
			return true
		end else nil)
	end
	
	return {
		fetchIfNeeded = fetchIfNeeded,
		isInFlight = isInFlight,
		dismissEntry = if fFlagSduiDismissPromptAction then function(p18) --[[ line: 746 | named "dismissEntry" ]]
			-- upvalues: t (ref), var24 (ref), var17 (ref)
			local t_1 = {}
			
			if typeof(p18) ~= "string" or p18 == "" then
				return t_1
			end
			for i in t do
				local var71 = var24.getCachedItem(i).data(false)
				
				if var71 then
					local var72 = false
					local t_2 = {}
					
					for i_1, v in var71 do
						if v and v.category ~= nil and v.title == p18 then
							var72 = true
						else
							t_2[i_1] = v
						end
					end
					if var72 then
						var17.replaceItems({ [i] = t_2 })
						table.insert(t_1, i)
					end
				end
			end
			return t_1
		end else nil,
		seedFromDecodedResponse = function(p19) --[[ line: 683 ]]
			-- upvalues: t (ref), sduiResponseType (copy), var24 (ref), handleSduiApiResponseModule (copy), sduiProtobufResponseHelpersModule (copy), getInputDataSignals (ref), sduiLogger (copy), sduiErrors (copy), sduiParseHelpers (copy), accumulateSduiCacheSubEntriesModule (copy), var17 (ref)
			local configKey = p19.configKey
			local loadTimer = p19.loadTimer
			loadTimer.logUiRequestQueued()
			t[configKey] = {
				url = `inline://{configKey}`,
				surfaceKey = p19.surfaceKey,
				configKey = configKey,
				loadTimer = loadTimer,
				apiProto = p19.apiProto,
				responseType = sduiResponseType.Protobuf
			}
			local var74 = var24.getCachedItem(configKey).data(false)
			local ok, status = pcall(function() --[[ line: 706 ]]
				-- upvalues: handleSduiApiResponseModule (copy), p19 (ref), loadTimer (ref), configKey (ref), sduiProtobufResponseHelpersModule (copy), getInputDataSignals (copy)
				return handleSduiApiResponseModule({
					paginateResponse = false,
					cacheSingleEntryWithIdentifier = true,
					response = { StatusCode = 200, Body = p19.decodedResponse, Stats = {} },
					loadTimer = loadTimer,
					surfaceKey = p19.surfaceKey,
					configCacheKey = configKey,
					decodeResponse = function(p20) --[[ line: 716 ]]
						return p20
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
					name = p19.surfaceKey
				}, p19.surfaceKey)
				error(status)
			end
			var17.updateItems({
				[configKey] = accumulateSduiCacheSubEntriesModule(status, var74)
			})
		end,
		getData = var24.getCachedItem,
		getInputData = if fFlagSduiApiStoreExposeGetInputData then function(p21, p22, p23) --[[ line: 511 | named "getInputData" ]]
			-- upvalues: resolveSduiCacheEntryModule (copy), t_3 (ref)
			local var75 = resolveSduiCacheEntryModule(t_3, p21, if p22 and p22 ~= "" then `{p21}_{p22}` else nil)
			
			return if var75 == nil then nil else var75.get(if p23 == nil then false else p23)
		end else nil,
		getRootConfig = function(p24, p25, p26) --[[ line: 524 ]]
			-- upvalues: var24 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var76 = var24.getCachedItem(p24).data(p25)
			local var77 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var76, p24, p26) else var76 and var76[p26 or p24]
			
			return if var77 then var77.config else nil
		end,
		getTitle = function(p27, p28, p29) --[[ line: 540 ]]
			-- upvalues: var24 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var78 = var24.getCachedItem(p27).data(p28)
			local var79 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var78, p27, p29) else var78 and var78[p29 or p27]
			
			return if var79 and var79.title ~= "" then var79.title else nil
		end,
		getDataUpdatedTimestamp = function(p30, p31, p32) --[[ line: 552 ]]
			-- upvalues: var24 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var80 = var24.getCachedItem(p30).data(p31)
			local var81 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var80, p30, p32) else var80 and var80[p32 or p30]
			
			return if var81 then var81.dataUpdatedTimestamp else nil
		end,
		getEntrySurfacing = function(p33, p34, p35) --[[ line: 566 ]]
			-- upvalues: var24 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var82 = var24.getCachedItem(p33).data(p35)
			local var83 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var82, p33, p34) else var82 and var82[p34 or p33]
			
			return if var83 then var83.surfacing else nil
		end,
		loadMoreFromApi = function(p36) --[[ line: 578 ]]
			-- upvalues: fFlagSduiChartsSupport (copy), t_1 (ref), t (ref), sduiLogger (copy), sduiErrors (copy), promiseModule (copy), var24 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy), fFlagSduiPaginatePostBody (copy), cryoModule (copy), fetchIfNeeded (ref)
			if not fFlagSduiChartsSupport and t_1[p36.configKey] then
				return nil
			end
			local configKey = t[p36.configKey]
			
			if configKey then
				local var85
				local var84 = var24.getCachedItem(p36.configKey).data(false)
				
				if fFlagSduiAlwaysCacheWithIdentifier then
					var85 = resolveSduiCacheEntryModule(var84, p36.configKey, p36.identifier)
				else
					var85 = var84
					
					if var85 then
						var85 = var84[p36.identifier or p36.configKey]
					end
				end
				if var85 then
					local nextPageUrl = var85.nextPageUrl
					
					if nextPageUrl and nextPageUrl ~= "" then
						local t_2 = {
							isPaginated = true,
							url = nextPageUrl,
							loadTimer = p36.loadTimer
						}
						
						if fFlagSduiPaginatePostBody and configKey.postConfig and var85.nextPagePostBody then
							t_2.postConfig = cryoModule.Dictionary.join(configKey.postConfig, { body = var85.nextPagePostBody })
						end
						if fFlagSduiChartsSupport then
							return fetchIfNeeded(cryoModule.Dictionary.join(configKey, t_2), true)
						end
						fetchIfNeeded(cryoModule.Dictionary.join(configKey, t_2), true)
						
						return nil
					else
						return if fFlagSduiChartsSupport then promiseModule.resolve() else nil
					end
				else
					sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToPaginateRequest, {
						message = `No entry data for {p36.configKey}`,
						name = configKey.surfaceKey
					}, configKey.surfaceKey)
					
					return if fFlagSduiChartsSupport then promiseModule.resolve() else nil
				end
			else
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToPaginateRequest, { message = `No requestData for {p36.configKey}` }, "unknown")
				
				return if fFlagSduiChartsSupport then promiseModule.resolve() else nil
			end
		end,
		refreshFromApi = function(p37) --[[ line: 636 ]]
			-- upvalues: t (ref), sduiLogger (copy), sduiErrors (copy), fFlagSduiChartsSupport (copy), promiseModule (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), cryoModule (copy), fFlagSduiPaginatePostBody (copy), fetchIfNeeded (ref)
			local configKey = t[p37.configKey]
			
			if configKey then
				if not fFlagSduiChartsSupport then
					return fetchIfNeeded(cryoModule.Dictionary.join(configKey, { loadTimer = p37.loadTimer }), true)
				elseif fFlagSduiApiStoreOnSuccessAndRefresh and configKey.refresh then
					return configKey.refresh(p37.loadTimer)
				end
				local t_1 = {
					url = (if configKey.buildRefreshUrl then configKey.buildRefreshUrl() else nil) or configKey.url,
					loadTimer = p37.loadTimer,
					isPaginated = cryoModule.None
				}
				
				if fFlagSduiPaginatePostBody and configKey.postConfig then
					local var88 = if configKey.buildRefreshPostBody then configKey.buildRefreshPostBody() else nil
					
					if var88 then
						t_1.postConfig = cryoModule.Dictionary.join(configKey.postConfig, { body = var88 })
					end
				end
				return fetchIfNeeded(cryoModule.Dictionary.join(configKey, t_1), true)
			else
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, { message = `No requestData for refresh: {p37.configKey}` }, "unknown")
				
				return if fFlagSduiChartsSupport then promiseModule.resolve() else nil
			end
		end
	}
end