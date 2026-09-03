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
local _ = require(parent.HttpClient)
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
local _ = require(sduiSharedUtilities.SduiApiRequestConfig)
local createSduiStreamingResponseHandlerModule = require(sduiSharedUtilities.createSduiStreamingResponseHandler)
local sduiRetryPolicyModule = require(sduiSharedUtilities.SduiRetryPolicy)
local sendSduiHttpRequestModule = require(sduiSharedUtilities.sendSduiHttpRequest)
local fFlagSduiProtobufJsonDecode = require(parent.SharedFlags).FFlagSduiProtobufJsonDecode
local sduiEnableClearOnEmptyResponse = game:DefineFastFlag("SduiEnableClearOnEmptyResponse", false)
local fFlagSduiAllowNoConfigsBuilt = require(parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local fFlagSduiConfigFetchTakesPostBody = require(parent.SharedFlags).FFlagSduiConfigFetchTakesPostBody
local fFlagSduiClientTemplateCache = require(parent.SharedFlags).FFlagSduiClientTemplateCache
local fFlagSduiAlwaysCacheWithIdentifier = require(parent.SharedFlags).FFlagSduiAlwaysCacheWithIdentifier
local fFlagLuaAppSduiStreamingChunkedResponses = require(parent.SharedFlags).FFlagLuaAppSduiStreamingChunkedResponses
local fFlagSduiDismissPromptAction = require(parent.SharedFlags).FFlagSduiDismissPromptAction
local fFlagSduiApiStoreExposeGetInputData = require(parent.SharedFlags).FFlagSduiApiStoreExposeGetInputData
local fFlagAppChatConversationTrustedFriendUpsellBanner = require(parent.SharedFlags).FFlagAppChatConversationTrustedFriendUpsellBanner
local fFlagSduiApiStoreOnSuccessAndRefresh = require(parent.SharedFlags).FFlagSduiApiStoreOnSuccessAndRefresh
local fFlagSduiPaginatePostBody = require(parent.SharedFlags).FFlagSduiPaginatePostBody
local fFlagSduiUseHttpClientModule = require(sduiSharedUtilities.Flags.FFlagSduiUseHttpClient)
local fFlagSduiRequestCountersModule = require(sduiSharedUtilities.Flags.FFlagSduiRequestCounters)
local fFlagSduiClientDrivenTemplates = require(parent.SharedFlags).FFlagSduiClientDrivenTemplates
local sduiPageRequestPriority = game:DefineFastInt("SduiPageRequestPriority", 1)
local resolveSduiCacheEntryModule = require(sduiSharedUtilities.resolveSduiCacheEntry)
local accumulateSduiCacheSubEntriesModule = require(sduiSharedUtilities.accumulateSduiCacheSubEntries)

local function getSduiRequestEndpointForCounters(p1)
	if p1 == nil or p1 == "" then
		return "unknown"
	end
	local match = string.match(string.gsub(p1, "^%a[%w+.%-]*://", ""), "^[^?#]*")
	
	if match == nil or match == "" then
		return "unknown"
	end
	local match_1, match_2 = string.match(match, "^([^/]*)(.*)$")
	local t = {}
	
	for i in string.gmatch(match_2, "[^/]+") do
		table.insert(t, if string.match(i, "^%d+$") ~= nil then i else "{id}")
	end
	return `{match_1}/{table.concat(t, "/")}`
end

return function(p2)
	-- upvalues: createDataCache (ref), fFlagSduiApiStoreOnSuccessAndRefresh (ref), signalsModule (ref), promiseModule (ref), fFlagSduiRequestCountersModule (ref), getSduiRequestEndpointForCounters (ref), fFlagSduiProtobufJsonDecode (ref), sduiResponseType (ref), fFlagSduiConfigFetchTakesPostBody (ref), fFlagLuaAppSduiStreamingChunkedResponses (ref), makeProtobufJsonResponseDecoder (ref), makeProtoResponseDecoder (ref), handleSduiApiResponseModule (ref), sduiProtobufResponseHelpersModule (ref), fFlagSduiClientDrivenTemplates (ref), fFlagSduiPaginatePostBody (ref), fFlagSduiAllowNoConfigsBuilt (ref), fFlagSduiClientTemplateCache (ref), createSduiStreamingResponseHandlerModule (ref), fFlagSduiUseHttpClientModule (ref), accumulateSduiCacheSubEntriesModule (ref), sduiPageAnalyticsModule (ref), sduiRequestStatus (ref), sduiParseHelpers (ref), sduiLogger (ref), sduiErrors (ref), sduiEnableClearOnEmptyResponse (ref), cryoModule (ref), sduiApiStorePostConfigModule (ref), sduiRetryPolicyModule (ref), sduiPageRequestPriority (ref), sendSduiHttpRequestModule (ref), httpService (ref), createDataResolver (ref), resolveSduiCacheEntryModule (ref), fFlagSduiAlwaysCacheWithIdentifier (ref), fFlagAppChatConversationTrustedFriendUpsellBanner (ref), fFlagSduiDismissPromptAction (ref), fFlagSduiApiStoreExposeGetInputData (ref)
	local var1 = createDataCache()
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	local function _(p3, p4, p5, p6)
		-- upvalues: t_2 (ref), fFlagSduiApiStoreOnSuccessAndRefresh (copy), t (ref)
		local var2 = t_2[p3]
		
		if var2 then
			t_2[p3] = nil
			
			if p4 then
				var2.resolve(p5)
			else
				var2.reject(p5)
			end
		end
		if fFlagSduiApiStoreOnSuccessAndRefresh and p4 then
			local var3 = t[p3]
			
			if var3 and var3.onSuccess then
				var3.onSuccess(p5, p6)
			end
		end
	end
	
	local function isInFlight(p3)
		-- upvalues: t_2 (ref), t_1 (ref)
		return if t_2[p3] == nil then t_1[p3] == true else true
	end
	
	local t_3 = {}
	
	local function getInputDataSignals(value)
		-- upvalues: t_3 (ref), signalsModule (copy)
		local var2 = t_3[value]
		
		if var2 == nil then
			local var3, var4 = signalsModule.createSignal(nil)
			var2 = { get = var3, set = var4 }
			t_3[value] = var2
		end
		return var2
	end
	
	local var2 = createDataResolver({
		queueProcessDelaySec = 0,
		supportsMultiGet = false,
		cache = var1,
		fetchFn = function(p3, p4)
			-- upvalues: t (ref), promiseModule (copy), fFlagSduiRequestCountersModule (copy), getSduiRequestEndpointForCounters (copy), fFlagSduiProtobufJsonDecode (copy), sduiResponseType (copy), fFlagSduiConfigFetchTakesPostBody (copy), fFlagLuaAppSduiStreamingChunkedResponses (copy), makeProtobufJsonResponseDecoder (copy), makeProtoResponseDecoder (copy), handleSduiApiResponseModule (copy), sduiProtobufResponseHelpersModule (copy), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (ref), fFlagSduiPaginatePostBody (copy), fFlagSduiAllowNoConfigsBuilt (copy), fFlagSduiClientTemplateCache (copy), createSduiStreamingResponseHandlerModule (copy), fFlagSduiUseHttpClientModule (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), accumulateSduiCacheSubEntriesModule (copy), var1 (ref), sduiPageAnalyticsModule (copy), t_1 (ref), sduiRequestStatus (copy), t_2 (ref), sduiParseHelpers (copy), sduiLogger (copy), sduiErrors (copy), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy), sduiApiStorePostConfigModule (copy), sduiRetryPolicyModule (copy), p2 (ref), sduiPageRequestPriority (copy), sendSduiHttpRequestModule (copy), httpService (copy)
			local var3 = t[p3]
			
			if not var3 then
				return promiseModule.reject("No request config for key", p3)
			end
			local url = var3.url
			local var4 = if fFlagSduiRequestCountersModule then getSduiRequestEndpointForCounters(url) else ""
			local loadTimer = var3.loadTimer
			loadTimer.logUiRequestSent()
			local var5 = fFlagSduiProtobufJsonDecode and var3.responseType == sduiResponseType.ProtobufJson
			local postConfig = var3.postConfig
			local var6 = if fFlagSduiConfigFetchTakesPostBody and postConfig then "POST" else "GET"
			local var7 = if fFlagLuaAppSduiStreamingChunkedResponses then var3.enableStreaming else nil
			local var8 = if var5 then makeProtobufJsonResponseDecoder(var3.apiProto) else makeProtoResponseDecoder(var3.apiProto)
			
			local function processSduiResponse(p5)
				-- upvalues: var3 (ref), p4 (ref), handleSduiApiResponseModule (copy), loadTimer (ref), var8 (ref), sduiProtobufResponseHelpersModule (copy), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (copy), fFlagLuaAppSduiStreamingChunkedResponses (copy), var7 (ref), fFlagSduiPaginatePostBody (copy), fFlagSduiAllowNoConfigsBuilt (copy), fFlagSduiClientTemplateCache (copy)
				return handleSduiApiResponseModule({
					response = p5,
					loadTimer = loadTimer,
					surfaceKey = var3.surfaceKey,
					configCacheKey = var3.configKey,
					decodeResponse = var8,
					parseHydrationDataFromResponse = sduiProtobufResponseHelpersModule.parseHydrationDataFromResponse,
					parseTemplateEntriesFromResponse = if fFlagSduiClientDrivenTemplates then var3.parseTemplateEntriesFromResponse or sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse else sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse,
					parsePageEntriesFromResponse = if fFlagSduiClientDrivenTemplates then var3.parsePageEntriesFromResponse or sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse else sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse,
					parseLocalizedLiteralsFromResponse = if fFlagSduiClientDrivenTemplates then var3.parseLocalizedLiteralsFromResponse or sduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse else nil,
					getInputDataSignalsForRequest = getInputDataSignals,
					enableStreamingMerge = if fFlagLuaAppSduiStreamingChunkedResponses then var7 else nil,
					paginateResponse = var3.isPaginated and p4.data(false) ~= nil,
					buildNextPageUrl = var3.buildNextPageUrl,
					buildNextPagePostBody = if fFlagSduiPaginatePostBody then var3.buildNextPagePostBody else nil,
					allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then var3.allowNoConfigsBuilt else nil,
					mergeStrategy = var3.mergeStrategy,
					enableTemplateCache = if fFlagSduiClientTemplateCache then var3.enableTemplateCache else nil
				})
			end
			
			local var9 = nil
			local var10 = if fFlagLuaAppSduiStreamingChunkedResponses and var7 then createSduiStreamingResponseHandlerModule({
				configKey = p3,
				loadTimer = loadTimer,
				processFrame = function(p5)
					-- upvalues: processSduiResponse (ref), fFlagSduiUseHttpClientModule (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var9 (write), accumulateSduiCacheSubEntriesModule (copy), p4 (ref), var1 (copy), p3 (ref)
					local ok, status, var11 = pcall(processSduiResponse, if fFlagSduiUseHttpClientModule then {
						statusCode = 200,
						responseBody = buffer.fromstring(p5),
						stats = {}
					} else { Stats = {}, Body = buffer.fromstring(p5) })
					
					if not ok then
						return false, status
					elseif fFlagSduiApiStoreOnSuccessAndRefresh then
						var9 = var11
					end
					local var12 = accumulateSduiCacheSubEntriesModule(status, p4.data(false))
					var1.updateItems({ [p3] = var12 })
					
					return true, var12
				end
			}) else nil
			
			local function createRequestPromise(p5)
				-- upvalues: promiseModule (copy), fFlagSduiRequestCountersModule (copy), sduiPageAnalyticsModule (copy), var3 (ref), var4 (ref), loadTimer (ref), t_1 (copy), p3 (ref), fFlagSduiUseHttpClientModule (copy), sduiRequestStatus (copy), t_2 (copy), var10 (ref), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var9 (write), t (copy), sduiParseHelpers (copy), sduiLogger (copy), sduiErrors (copy), processSduiResponse (ref), url (ref), p4 (ref), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
				return promiseModule.new(function(p6, p7, p8)
					-- upvalues: fFlagSduiRequestCountersModule (copy), sduiPageAnalyticsModule (copy), var3 (copy), var4 (copy), p5 (ref), loadTimer (copy), t_1 (copy), p3 (copy), fFlagSduiUseHttpClientModule (copy), sduiRequestStatus (copy), t_2 (copy), var10 (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var9 (copy), t (copy), sduiParseHelpers (copy), sduiLogger (copy), sduiErrors (copy), processSduiResponse (copy), url (copy), p4 (copy), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
					local var11 = nil
					local var12 = nil
					
					if fFlagSduiRequestCountersModule then
						local var13 = p6
						local var14 = p7
						
						p6 = function(p9)
							-- upvalues: sduiPageAnalyticsModule (copy), var3 (copy), var4 (copy), var11 (write), var12 (write), var13 (ref)
							sduiPageAnalyticsModule.sendRequestOutcomeCounter(var3.surfaceKey, var4, "success", var11, var12)
							
							return var13(p9)
						end
						
						p7 = function(p9)
							-- upvalues: sduiPageAnalyticsModule (copy), var3 (copy), var4 (copy), var11 (write), var12 (write), var14 (ref)
							sduiPageAnalyticsModule.sendRequestOutcomeCounter(var3.surfaceKey, var4, "failure", var11, var12)
							
							return var14(p9)
						end
					end
					local var15 = p5(function(p9, p10)
						-- upvalues: loadTimer (copy), t_1 (copy), p3 (copy), sduiPageAnalyticsModule (copy), var3 (copy), fFlagSduiUseHttpClientModule (copy), fFlagSduiRequestCountersModule (copy), var11 (write), var12 (write), sduiRequestStatus (copy), t_2 (copy), p7 (write), var10 (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var9 (copy), t (copy), p6 (write), sduiParseHelpers (copy), sduiLogger (copy), sduiErrors (copy), processSduiResponse (copy), url (copy), p4 (copy), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
						local var16
						loadTimer.logUiResponseReceived()
						t_1[p3] = false
						sduiPageAnalyticsModule.sendPageStatusEvent(var3.surfaceKey, if fFlagSduiUseHttpClientModule then p10.statusCode else p10.StatusCode, if fFlagSduiUseHttpClientModule then p10.httpError else p10.HttpError)
						
						if fFlagSduiRequestCountersModule then
							var11 = if fFlagSduiUseHttpClientModule then p10.statusCode else p10.StatusCode
							var12 = if fFlagSduiUseHttpClientModule then p10.httpError else p10.HttpError
						end
						if p9 then
							local var17
							local var18 = if fFlagSduiUseHttpClientModule then p10.statusCode else p10.StatusCode
							var16 = if fFlagSduiUseHttpClientModule then p10.httpError else p10.HttpError
							local var19 = if var18 then tonumber(var18) else nil
							
							if fFlagSduiUseHttpClientModule then
								var17 = p10.wasTransportFailure == true
								var17 = nil
							else
								var17 = false
							end
							if var19 and var19 >= 400 or var16 and var16 ~= Enum.HttpError.OK or var17 then
								loadTimer.updateRequestStatus(sduiRequestStatus.FailedToLoad)
								local var20 = t_2[p3]
								
								if var20 then
									t_2[p3] = nil
									var20.reject(p10)
								end
								return p7(p10)
							else
								loadTimer.updateRequestStatus(sduiRequestStatus.LoadedFromNetwork)
								local var21 = if fFlagSduiUseHttpClientModule then p10.responseBody else p10.Body
								sduiPageAnalyticsModule.sendPagePayloadSizeEvent(var3.surfaceKey, var21)
								
								if var10 then
									local var22 = var10.finalize(var21)
									
									if var22.ok then
										local value = var22.value
										local var23 = if fFlagSduiApiStoreOnSuccessAndRefresh then var9 else nil
										local var24 = t_2[p3]
										
										if var24 then
											t_2[p3] = nil
											var24.resolve(value)
										end
										if fFlagSduiApiStoreOnSuccessAndRefresh then
											local var25 = t[p3]
											
											if var25 and var25.onSuccess then
												var25.onSuccess(value, var23)
											end
										end
										return p6(var22.value)
									else
										sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
											message = sduiParseHelpers.stringifyValue(var22.value),
											name = var3.surfaceKey
										}, var3.surfaceKey)
										loadTimer.updateRequestStatus(sduiRequestStatus.FailedToLoad)
										local value = var22.value
										local var26 = t_2[p3]
										
										if var26 then
											t_2[p3] = nil
											var26.reject(value)
										end
										return p7(var22.value)
									end
								else
									local ok, status, var27 = pcall(processSduiResponse, p10)
									
									if ok then
										local t_3 = {}
										
										if not sduiEnableClearOnEmptyResponse then
											local var28 = p4.data(false)
											
											for i, v in status do
												local var29 = var28 and var28[i]
												t_3[i] = if var29 then cryoModule.Dictionary.join(var29, v) else v
											end
										elseif next(status) then
											local var30 = p4.data(false)
											
											for i, v in status do
												local var31 = var30 and var30[i]
												t_3[i] = if var31 then cryoModule.Dictionary.join(var31, v) else v
											end
										elseif var3.clearOnEmptyResponse and var3.configKey then
											t_3[var3.configKey] = {}
										end
										local var32 = if fFlagSduiApiStoreOnSuccessAndRefresh then var27 else nil
										local var33 = t_2[p3]
										
										if var33 then
											t_2[p3] = nil
											var33.resolve(t_3)
										end
										if fFlagSduiApiStoreOnSuccessAndRefresh then
											local var34 = t[p3]
											
											if var34 and var34.onSuccess then
												var34.onSuccess(t_3, var32)
											end
										end
										return p6(t_3)
									else
										sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
											message = `handleSduiApiResponse not successful for {url} err {sduiParseHelpers.stringifyValue(status)}`,
											name = var3.surfaceKey
										}, var3.surfaceKey)
										local var35 = t_2[p3]
										
										if var35 then
											t_2[p3] = nil
											var35.reject(status)
										end
										return p7(p4)
									end
								end
							end
						else
							var16 = t_2[p3]
							
							if var16 then
								t_2[p3] = nil
								var16.reject(p10)
							end
							return p7(p10)
						end
					end)
					
					if var15 ~= nil then
						p8(var15)
					end
				end)
			end
			
			if not fFlagSduiUseHttpClientModule then
				return createRequestPromise(function(p11)
					-- upvalues: httpService (copy), url (ref), var6 (ref), var5 (ref), fFlagSduiConfigFetchTakesPostBody (copy), postConfig (ref), sduiApiStorePostConfigModule (copy), var10 (ref), sduiPageRequestPriority (copy)
					httpService:RequestInternal({
						Url = url,
						Method = var6,
						Headers = {
							Accept = if var5 then "application/json" else "application/x-protobuf",
							["Content-Type"] = if fFlagSduiConfigFetchTakesPostBody and postConfig then sduiApiStorePostConfigModule.getContentTypeHeaderFromPostConfig(postConfig) else nil
						},
						Body = if fFlagSduiConfigFetchTakesPostBody and postConfig then sduiApiStorePostConfigModule.getBodyFromPostConfig(postConfig) else nil,
						OnMessage = if var10 then var10.handleChunk else nil,
						Priority = sduiPageRequestPriority
					}):Start(p11)
					
					return nil
				end)
			end
			local var36 = if fFlagSduiConfigFetchTakesPostBody and postConfig then sduiApiStorePostConfigModule.getBodyFromPostConfig(postConfig) else nil
			local var37 = if fFlagSduiConfigFetchTakesPostBody and postConfig then sduiApiStorePostConfigModule.getContentTypeHeaderFromPostConfig(postConfig) else nil
			local var38 = sduiRetryPolicyModule.resolve(var3.retry)
			
			if fFlagSduiRequestCountersModule and var38 ~= nil then
				local onRetry = var38.onRetry
				var38 = cryoModule.Dictionary.join(var38, {
					onRetry = function(p11)
						-- upvalues: onRetry (ref), sduiPageAnalyticsModule (copy), var3 (ref), var4 (ref)
						if onRetry ~= nil then
							onRetry(p11)
						end
						sduiPageAnalyticsModule.sendRequestRetryCounter(var3.surfaceKey, var4, p11)
					end
				})
			end
			local t_3 = {
				url = url,
				method = var6,
				body = var36,
				contentType = var37,
				accept = if var5 then "application/json" else "application/x-protobuf",
				analyticsKey = var3.surfaceKey,
				priority = sduiPageRequestPriority,
				retry = var38,
				deadlineSec = if p2 and p2.requestDeadlineSec then p2.requestDeadlineSec else sduiRetryPolicyModule.getRequestDeadlineSec(),
				network = if p2 then p2.network else nil,
				delivery = if var10 then { mode = "streaming", onMessage = var10.handleChunk } else { mode = "buffered" }
			}
			
			return createRequestPromise(function(p11)
				-- upvalues: sendSduiHttpRequestModule (copy), t_3 (ref)
				local var39 = sendSduiHttpRequestModule(t_3)
				var39:andThen(function(p12)
					-- upvalues: p11 (ref)
					p11(true, p12)
				end, function(p12)
					-- upvalues: p11 (ref)
					if typeof(p12) == "table" and (p12.statusCode ~= nil or p12.httpError ~= nil) then
						p11(true, p12)
						
						return
					end
					p11(false, p12)
				end)
				
				return function()
					-- upvalues: var39 (ref)
					var39:cancel()
				end
			end)
		end,
		requestTimeoutSec = if fFlagSduiUseHttpClientModule then sduiRetryPolicyModule.getFetchTimeoutSec() else nil
	})
	
	local function fetchIfNeeded(p9, p10)
		-- upvalues: fFlagSduiProtobufJsonDecode (copy), sduiResponseType (copy), t (ref), var2 (ref), t_2 (ref), promiseModule (copy)
		if fFlagSduiProtobufJsonDecode and p9.responseType == nil then
			p9.responseType = sduiResponseType.Protobuf
		end
		local configKey = p9.configKey or p9.url
		p9.configKey = configKey
		p9.loadTimer.logUiRequestQueued()
		t[configKey] = p9
		local _, andFetchItem = var2.getAndFetchItem(configKey, if p10 then function()
			return true
		end else nil)
		
		if not andFetchItem then
			return promiseModule.resolve()
		elseif not t_2[configKey] then
			local var16 = nil
			local var17 = nil
			local var18 = promiseModule.new(function(p11, p12)
				-- upvalues: var16 (write), var17 (write)
				var16 = p11
				var17 = p12
			end)
			var18:catch(function(_) end)
			t_2[configKey] = { promise = var18, resolve = var16, reject = var17 }
		end
		return t_2[configKey].promise
	end
	
	return {
		fetchIfNeeded = fetchIfNeeded,
		isInFlight = isInFlight,
		clearConfigEntries = if fFlagAppChatConversationTrustedFriendUpsellBanner then function(p9)
			-- upvalues: var1 (ref)
			if typeof(p9) == "string" and p9 ~= "" then
				var1.replaceItems({ [p9] = {} })
				
				return
			end
		end else nil,
		dismissEntry = if fFlagSduiDismissPromptAction then function(p9)
			-- upvalues: t (ref), var2 (ref), var1 (ref)
			local t_1 = {}
			
			if typeof(p9) ~= "string" or p9 == "" then
				return t_1
			end
			for i in t do
				local var16 = var2.getCachedItem(i).data(false)
				
				if var16 then
					local var17 = false
					local t_2 = {}
					
					for i_1, v in var16 do
						if v and v.category ~= nil and v.title == p9 then
							var17 = true
						else
							t_2[i_1] = v
						end
					end
					if var17 then
						var1.replaceItems({ [i] = t_2 })
						table.insert(t_1, i)
					end
				end
			end
			return t_1
		end else nil,
		seedFromDecodedResponse = function(p10)
			-- upvalues: t (ref), sduiResponseType (copy), var2 (ref), handleSduiApiResponseModule (copy), fFlagSduiUseHttpClientModule (copy), sduiProtobufResponseHelpersModule (copy), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (ref), sduiLogger (copy), sduiErrors (copy), sduiParseHelpers (copy), fFlagAppChatConversationTrustedFriendUpsellBanner (copy), var1 (ref), accumulateSduiCacheSubEntriesModule (copy)
			local configKey = p10.configKey
			local loadTimer = p10.loadTimer
			loadTimer.logUiRequestQueued()
			t[configKey] = {
				url = `inline://{configKey}`,
				surfaceKey = p10.surfaceKey,
				configKey = configKey,
				loadTimer = loadTimer,
				apiProto = p10.apiProto,
				responseType = sduiResponseType.Protobuf
			}
			local var18 = var2.getCachedItem(configKey).data(false)
			local ok, status = pcall(function()
				-- upvalues: handleSduiApiResponseModule (copy), fFlagSduiUseHttpClientModule (copy), p10 (ref), loadTimer (ref), configKey (ref), sduiProtobufResponseHelpersModule (copy), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (copy)
				return handleSduiApiResponseModule({
					paginateResponse = false,
					cacheSingleEntryWithIdentifier = true,
					response = if fFlagSduiUseHttpClientModule then {
						statusCode = 200,
						responseBody = p10.decodedResponse,
						stats = {}
					} else { StatusCode = 200, Body = p10.decodedResponse, Stats = {} },
					loadTimer = loadTimer,
					surfaceKey = p10.surfaceKey,
					configCacheKey = configKey,
					decodeResponse = function(p11)
						return p11
					end,
					parseHydrationDataFromResponse = sduiProtobufResponseHelpersModule.parseHydrationDataFromResponse,
					parseTemplateEntriesFromResponse = sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse,
					parsePageEntriesFromResponse = sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse,
					parseLocalizedLiteralsFromResponse = if fFlagSduiClientDrivenTemplates then sduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse else nil,
					getInputDataSignalsForRequest = getInputDataSignals
				})
			end)
			
			if not ok then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
					message = `seedFromDecodedResponse failed for {configKey}: {sduiParseHelpers.stringifyValue(status)}`,
					name = p10.surfaceKey
				}, p10.surfaceKey)
				error(status)
			end
			if fFlagAppChatConversationTrustedFriendUpsellBanner and p10.replace then
				var1.replaceItems({ [configKey] = status })
				
				return
			end
			var1.updateItems({
				[configKey] = accumulateSduiCacheSubEntriesModule(status, var18)
			})
		end,
		getData = var2.getCachedItem,
		getInputData = if fFlagSduiApiStoreExposeGetInputData then function(p11, p12, p13)
			-- upvalues: resolveSduiCacheEntryModule (copy), t_3 (ref)
			local var19 = resolveSduiCacheEntryModule(t_3, p11, if p12 and p12 ~= "" then `{p11}_{p12}` else nil)
			
			return if var19 == nil then nil else var19.get(if p13 == nil then false else p13)
		end else nil,
		getRootConfig = function(p11, p12, p13)
			-- upvalues: var2 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var19 = var2.getCachedItem(p11).data(p12)
			local var20 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var19, p11, p13) else var19 and var19[p13 or p11]
			
			return if var20 then var20.config else nil
		end,
		getTitle = function(p11, p12, p13)
			-- upvalues: var2 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var19 = var2.getCachedItem(p11).data(p12)
			local var20 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var19, p11, p13) else var19 and var19[p13 or p11]
			
			return if var20 and var20.title ~= "" then var20.title else nil
		end,
		getDataUpdatedTimestamp = function(p11, p12, p13)
			-- upvalues: var2 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var19 = var2.getCachedItem(p11).data(p12)
			local var20 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var19, p11, p13) else var19 and var19[p13 or p11]
			
			return if var20 then var20.dataUpdatedTimestamp else nil
		end,
		getEntrySurfacing = function(p11, p12, p13)
			-- upvalues: var2 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var19 = var2.getCachedItem(p11).data(p13)
			local var20 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var19, p11, p12) else var19 and var19[p12 or p11]
			
			return if var20 then var20.surfacing else nil
		end,
		loadMoreFromApi = function(p11)
			-- upvalues: t (ref), sduiLogger (copy), sduiErrors (copy), promiseModule (copy), var2 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy), fFlagSduiPaginatePostBody (copy), cryoModule (copy), fetchIfNeeded (ref)
			local configKey = t[p11.configKey]
			
			if not configKey then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToPaginateRequest, { message = `No requestData for {p11.configKey}` }, "unknown")
				
				return promiseModule.resolve()
			end
			local var19
			local var20 = var2.getCachedItem(p11.configKey).data(false)
			
			if fFlagSduiAlwaysCacheWithIdentifier then
				var19 = resolveSduiCacheEntryModule(var20, p11.configKey, p11.identifier)
			else
				var19 = var20
				
				if var19 then
					var19 = var20[p11.identifier or p11.configKey]
				end
			end
			if not var19 then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToPaginateRequest, {
					message = `No entry data for {p11.configKey}`,
					name = configKey.surfaceKey
				}, configKey.surfaceKey)
				
				return promiseModule.resolve()
			end
			local nextPageUrl = var19.nextPageUrl
			
			if not nextPageUrl or nextPageUrl == "" then
				return promiseModule.resolve()
			end
			local t_1 = {
				isPaginated = true,
				url = nextPageUrl,
				loadTimer = p11.loadTimer
			}
			
			if fFlagSduiPaginatePostBody and configKey.postConfig and var19.nextPagePostBody then
				t_1.postConfig = cryoModule.Dictionary.join(configKey.postConfig, { body = var19.nextPagePostBody })
			end
			return fetchIfNeeded(cryoModule.Dictionary.join(configKey, t_1), true)
		end,
		refreshFromApi = function(p12)
			-- upvalues: t (ref), sduiLogger (copy), sduiErrors (copy), promiseModule (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), cryoModule (copy), fFlagSduiPaginatePostBody (copy), fetchIfNeeded (ref)
			local configKey = t[p12.configKey]
			
			if not configKey then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, { message = `No requestData for refresh: {p12.configKey}` }, "unknown")
				
				return promiseModule.resolve()
			elseif fFlagSduiApiStoreOnSuccessAndRefresh and configKey.refresh then
				return configKey.refresh(p12.loadTimer)
			end
			local t_1 = {
				url = (if configKey.buildRefreshUrl then configKey.buildRefreshUrl() else nil) or configKey.url,
				loadTimer = p12.loadTimer,
				isPaginated = cryoModule.None
			}
			
			if fFlagSduiPaginatePostBody and configKey.postConfig then
				local var21 = if configKey.buildRefreshPostBody then configKey.buildRefreshPostBody() else nil
				
				if var21 then
					t_1.postConfig = cryoModule.Dictionary.join(configKey.postConfig, { body = var21 })
				end
			end
			return fetchIfNeeded(cryoModule.Dictionary.join(configKey, t_1), true)
		end
	}
end