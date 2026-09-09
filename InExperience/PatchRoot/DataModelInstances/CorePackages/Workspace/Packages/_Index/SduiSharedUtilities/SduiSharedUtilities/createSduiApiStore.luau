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
local fFlagHomeSduiOfflineCache = require(parent.SharedFlags).FFlagHomeSduiOfflineCache
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
	-- upvalues: createDataCache (ref), fFlagSduiApiStoreOnSuccessAndRefresh (ref), signalsModule (ref), promiseModule (ref), fFlagSduiRequestCountersModule (ref), getSduiRequestEndpointForCounters (ref), fFlagSduiProtobufJsonDecode (ref), sduiResponseType (ref), fFlagLuaAppSduiStreamingChunkedResponses (ref), makeProtobufJsonResponseDecoder (ref), makeProtoResponseDecoder (ref), handleSduiApiResponseModule (ref), sduiProtobufResponseHelpersModule (ref), fFlagSduiClientDrivenTemplates (ref), fFlagSduiPaginatePostBody (ref), fFlagSduiAllowNoConfigsBuilt (ref), fFlagSduiClientTemplateCache (ref), fFlagHomeSduiOfflineCache (ref), sduiLogger (ref), sduiErrors (ref), sduiParseHelpers (ref), sduiRequestStatus (ref), createSduiStreamingResponseHandlerModule (ref), fFlagSduiUseHttpClientModule (ref), accumulateSduiCacheSubEntriesModule (ref), sduiPageAnalyticsModule (ref), sduiEnableClearOnEmptyResponse (ref), cryoModule (ref), sduiApiStorePostConfigModule (ref), sduiRetryPolicyModule (ref), sduiPageRequestPriority (ref), sendSduiHttpRequestModule (ref), httpService (ref), createDataResolver (ref), resolveSduiCacheEntryModule (ref), fFlagSduiAlwaysCacheWithIdentifier (ref), fFlagAppChatConversationTrustedFriendUpsellBanner (ref), fFlagSduiDismissPromptAction (ref), fFlagSduiApiStoreExposeGetInputData (ref)
	local var1 = createDataCache()
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	local function completeActiveRequest(p3, p4, p5, p6)
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
	
	local var2 = nil
	local var3 = createDataResolver({
		queueProcessDelaySec = 0,
		supportsMultiGet = false,
		cache = var1,
		fetchFn = function(p3, p4)
			-- upvalues: t (ref), promiseModule (copy), fFlagSduiRequestCountersModule (copy), getSduiRequestEndpointForCounters (copy), fFlagSduiProtobufJsonDecode (copy), sduiResponseType (copy), fFlagLuaAppSduiStreamingChunkedResponses (copy), makeProtobufJsonResponseDecoder (copy), makeProtoResponseDecoder (copy), handleSduiApiResponseModule (copy), sduiProtobufResponseHelpersModule (copy), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (ref), fFlagSduiPaginatePostBody (copy), fFlagSduiAllowNoConfigsBuilt (copy), fFlagSduiClientTemplateCache (copy), fFlagHomeSduiOfflineCache (copy), sduiLogger (copy), sduiErrors (copy), sduiParseHelpers (copy), var2 (write), sduiRequestStatus (copy), createSduiStreamingResponseHandlerModule (copy), fFlagSduiUseHttpClientModule (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), accumulateSduiCacheSubEntriesModule (copy), var1 (ref), sduiPageAnalyticsModule (copy), completeActiveRequest (ref), t_2 (ref), t_1 (ref), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy), sduiApiStorePostConfigModule (copy), sduiRetryPolicyModule (copy), p2 (ref), sduiPageRequestPriority (copy), sendSduiHttpRequestModule (copy), httpService (copy)
			local var4 = t[p3]
			
			if not var4 then
				return promiseModule.reject("No request config for key", p3)
			end
			local url = var4.url
			local var5 = if fFlagSduiRequestCountersModule then getSduiRequestEndpointForCounters(url) else ""
			local loadTimer = var4.loadTimer
			loadTimer.logUiRequestSent()
			local var6 = fFlagSduiProtobufJsonDecode and var4.responseType == sduiResponseType.ProtobufJson
			local postConfig = var4.postConfig
			local var7 = if postConfig then "POST" else "GET"
			local var8 = if fFlagLuaAppSduiStreamingChunkedResponses then var4.enableStreaming else nil
			local var9 = if var6 then makeProtobufJsonResponseDecoder(var4.apiProto) else makeProtoResponseDecoder(var4.apiProto)
			
			local function processSduiResponse(p5)
				-- upvalues: var4 (ref), p4 (ref), handleSduiApiResponseModule (copy), loadTimer (ref), var9 (ref), sduiProtobufResponseHelpersModule (copy), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (copy), fFlagLuaAppSduiStreamingChunkedResponses (copy), var8 (ref), fFlagSduiPaginatePostBody (copy), fFlagSduiAllowNoConfigsBuilt (copy), fFlagSduiClientTemplateCache (copy)
				return handleSduiApiResponseModule({
					response = p5,
					loadTimer = loadTimer,
					surfaceKey = var4.surfaceKey,
					configCacheKey = var4.configKey,
					decodeResponse = var9,
					parseHydrationDataFromResponse = sduiProtobufResponseHelpersModule.parseHydrationDataFromResponse,
					parseTemplateEntriesFromResponse = if fFlagSduiClientDrivenTemplates then var4.parseTemplateEntriesFromResponse or sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse else sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse,
					parsePageEntriesFromResponse = if fFlagSduiClientDrivenTemplates then var4.parsePageEntriesFromResponse or sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse else sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse,
					parseLocalizedLiteralsFromResponse = if fFlagSduiClientDrivenTemplates then var4.parseLocalizedLiteralsFromResponse or sduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse else nil,
					getInputDataSignalsForRequest = getInputDataSignals,
					enableStreamingMerge = if fFlagLuaAppSduiStreamingChunkedResponses then var8 else nil,
					paginateResponse = var4.isPaginated and p4.data(false) ~= nil,
					buildNextPageUrl = var4.buildNextPageUrl,
					buildNextPagePostBody = if fFlagSduiPaginatePostBody then var4.buildNextPagePostBody else nil,
					allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then var4.allowNoConfigsBuilt else nil,
					mergeStrategy = var4.mergeStrategy,
					enableTemplateCache = if fFlagSduiClientTemplateCache then var4.enableTemplateCache else nil
				})
			end
			
			local var10 = if fFlagHomeSduiOfflineCache then function(p5)
				-- upvalues: var4 (ref), p4 (ref), sduiLogger (copy), sduiErrors (copy), sduiParseHelpers (copy), var2 (copy), p3 (ref), loadTimer (ref), sduiRequestStatus (copy)
				local recoverFromError = var4.recoverFromError
				
				if recoverFromError == nil then
					return nil
				end
				local var11 = p4.data(false)
				
				if type(var11) == "table" and next(var11) ~= nil then
					return var11
				end
				local function _(p6)
					-- upvalues: sduiLogger (copy), sduiErrors (copy), var4 (copy)
					sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToApplyFallbackResponse, { message = p6, name = var4.surfaceKey }, var4.surfaceKey)
				end
				
				local ok, status = pcall(recoverFromError.getDecodedResponse, p5)
				
				if not ok then
					sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToApplyFallbackResponse, {
						message = `recovery errored: {sduiParseHelpers.stringifyValue(status)}`,
						name = var4.surfaceKey
					}, var4.surfaceKey)
					
					return nil
				elseif status == nil then
					return nil
				end
				local ok_1, status_1 = pcall(var2, {
					surfaceKey = var4.surfaceKey,
					configKey = p3,
					decodedResponse = status,
					loadTimer = loadTimer,
					apiProto = var4.apiProto,
					requestConfig = var4
				})
				
				if not ok_1 then
					sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToApplyFallbackResponse, {
						message = `recovery errored: {sduiParseHelpers.stringifyValue(status_1)}`,
						name = var4.surfaceKey
					}, var4.surfaceKey)
					
					return nil
				end
				local var12 = p4.data(false)
				
				if type(var12) ~= "table" or next(var12) == nil then
					sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToApplyFallbackResponse, {
						message = "recovery built no configs",
						name = var4.surfaceKey
					}, var4.surfaceKey)
					
					return nil
				end
				loadTimer.updateRequestStatus(sduiRequestStatus.LoadedFromCache)
				
				if recoverFromError.onApplied ~= nil then
					recoverFromError.onApplied()
				end
				return var12
			end else nil
			local var11 = nil
			local var12 = if fFlagLuaAppSduiStreamingChunkedResponses and var8 then createSduiStreamingResponseHandlerModule({
				configKey = p3,
				loadTimer = loadTimer,
				processFrame = function(p5)
					-- upvalues: processSduiResponse (ref), fFlagSduiUseHttpClientModule (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var11 (write), accumulateSduiCacheSubEntriesModule (copy), p4 (ref), var1 (copy), p3 (ref)
					local ok, status, var13 = pcall(processSduiResponse, if fFlagSduiUseHttpClientModule then {
						statusCode = 200,
						responseBody = buffer.fromstring(p5),
						stats = {}
					} else { Stats = {}, Body = buffer.fromstring(p5) })
					
					if not ok then
						return false, status
					elseif fFlagSduiApiStoreOnSuccessAndRefresh then
						var11 = var13
					end
					local var14 = accumulateSduiCacheSubEntriesModule(status, p4.data(false))
					var1.updateItems({ [p3] = var14 })
					
					return true, var14
				end
			}) else nil
			
			local function createRequestPromise(p5)
				-- upvalues: promiseModule (copy), fFlagHomeSduiOfflineCache (copy), fFlagSduiRequestCountersModule (copy), sduiPageAnalyticsModule (copy), var4 (ref), var5 (ref), var10 (write), completeActiveRequest (copy), p3 (ref), t_2 (copy), loadTimer (ref), t_1 (copy), fFlagSduiUseHttpClientModule (copy), sduiRequestStatus (copy), var12 (ref), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var11 (write), t (copy), sduiParseHelpers (copy), sduiLogger (copy), sduiErrors (copy), processSduiResponse (ref), url (ref), p4 (ref), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
				return promiseModule.new(function(p6, p7, p8)
					-- upvalues: fFlagHomeSduiOfflineCache (copy), fFlagSduiRequestCountersModule (copy), sduiPageAnalyticsModule (copy), var4 (copy), var5 (copy), var10 (copy), completeActiveRequest (copy), p3 (copy), t_2 (copy), p5 (ref), loadTimer (copy), t_1 (copy), fFlagSduiUseHttpClientModule (copy), sduiRequestStatus (copy), var12 (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var11 (copy), t (copy), sduiParseHelpers (copy), sduiLogger (copy), sduiErrors (copy), processSduiResponse (copy), url (copy), p4 (copy), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
					local var13 = if fFlagHomeSduiOfflineCache then p6 else nil
					local var14 = nil
					local var15 = nil
					
					if fFlagSduiRequestCountersModule then
						local var16 = p6
						local var17 = p7
						
						p6 = function(p9)
							-- upvalues: sduiPageAnalyticsModule (copy), var4 (copy), var5 (copy), var14 (write), var15 (write), var16 (ref)
							sduiPageAnalyticsModule.sendRequestOutcomeCounter(var4.surfaceKey, var5, "success", var14, var15)
							
							return var16(p9)
						end
						
						p7 = function(p9)
							-- upvalues: sduiPageAnalyticsModule (copy), var4 (copy), var5 (copy), var14 (write), var15 (write), var17 (ref)
							sduiPageAnalyticsModule.sendRequestOutcomeCounter(var4.surfaceKey, var5, "failure", var14, var15)
							
							return var17(p9)
						end
					end
					local var18 = if fFlagHomeSduiOfflineCache then function(p9, p10)
						-- upvalues: var10 (copy), fFlagSduiRequestCountersModule (copy), sduiPageAnalyticsModule (copy), var4 (copy), var5 (copy), var14 (write), var15 (write), var13 (write), completeActiveRequest (copy), p3 (copy), t_2 (copy), p7 (write)
						local var19 = var10(p9)
						
						if var19 == nil then
							local var20 = t_2[p3]
							
							if var20 then
								t_2[p3] = nil
								var20.reject(p9)
							end
							return p7(if p10 ~= nil then p9 else p10)
						elseif fFlagSduiRequestCountersModule then
							sduiPageAnalyticsModule.sendRequestOutcomeCounter(var4.surfaceKey, var5, "failure", var14, var15)
						end
						var13(var19)
						
						return completeActiveRequest(p3, false, p9)
					end else nil
					local var19 = p5(function(p9, p10)
						-- upvalues: loadTimer (copy), t_1 (copy), p3 (copy), sduiPageAnalyticsModule (copy), var4 (copy), fFlagSduiUseHttpClientModule (copy), fFlagSduiRequestCountersModule (copy), var14 (write), var15 (write), sduiRequestStatus (copy), fFlagHomeSduiOfflineCache (copy), var18 (write), t_2 (copy), p7 (write), var12 (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var11 (copy), t (copy), p6 (write), sduiParseHelpers (copy), sduiLogger (copy), sduiErrors (copy), processSduiResponse (copy), url (copy), p4 (copy), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
						local var20
						loadTimer.logUiResponseReceived()
						t_1[p3] = false
						sduiPageAnalyticsModule.sendPageStatusEvent(var4.surfaceKey, if fFlagSduiUseHttpClientModule then p10.statusCode else p10.StatusCode, if fFlagSduiUseHttpClientModule then p10.httpError else p10.HttpError)
						
						if fFlagSduiRequestCountersModule then
							var14 = if fFlagSduiUseHttpClientModule then p10.statusCode else p10.StatusCode
							var15 = if fFlagSduiUseHttpClientModule then p10.httpError else p10.HttpError
						end
						if p9 then
							local var21
							local var22 = if fFlagSduiUseHttpClientModule then p10.statusCode else p10.StatusCode
							var20 = if fFlagSduiUseHttpClientModule then p10.httpError else p10.HttpError
							local var23 = if var22 then tonumber(var22) else nil
							
							if fFlagSduiUseHttpClientModule then
								var21 = p10.wasTransportFailure == true
								var21 = nil
							else
								var21 = false
							end
							if var23 and var23 >= 400 or var20 and var20 ~= Enum.HttpError.OK or var21 then
								loadTimer.updateRequestStatus(sduiRequestStatus.FailedToLoad)
								
								if fFlagHomeSduiOfflineCache then
									return var18(p10)
								end
								local var24 = t_2[p3]
								
								if var24 then
									t_2[p3] = nil
									var24.reject(p10)
								end
								return p7(p10)
							else
								loadTimer.updateRequestStatus(sduiRequestStatus.LoadedFromNetwork)
								local var25 = if fFlagSduiUseHttpClientModule then p10.responseBody else p10.Body
								sduiPageAnalyticsModule.sendPagePayloadSizeEvent(var4.surfaceKey, var25)
								
								if var12 then
									local var26 = var12.finalize(var25)
									
									if var26.ok then
										local value = var26.value
										local var27 = if fFlagSduiApiStoreOnSuccessAndRefresh then var11 else nil
										local var28 = t_2[p3]
										
										if var28 then
											t_2[p3] = nil
											var28.resolve(value)
										end
										if fFlagSduiApiStoreOnSuccessAndRefresh then
											local var29 = t[p3]
											
											if var29 and var29.onSuccess then
												var29.onSuccess(value, var27)
											end
										end
										return p6(var26.value)
									else
										sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
											message = sduiParseHelpers.stringifyValue(var26.value),
											name = var4.surfaceKey
										}, var4.surfaceKey)
										loadTimer.updateRequestStatus(sduiRequestStatus.FailedToLoad)
										
										if fFlagHomeSduiOfflineCache then
											return var18(var26.value)
										end
										local value = var26.value
										local var30 = t_2[p3]
										
										if var30 then
											t_2[p3] = nil
											var30.reject(value)
										end
										return p7(var26.value)
									end
								else
									local ok, status, var31 = pcall(processSduiResponse, p10)
									
									if ok then
										local t_3 = {}
										
										if not sduiEnableClearOnEmptyResponse then
											local var32 = p4.data(false)
											
											for i, v in status do
												local var33 = var32 and var32[i]
												t_3[i] = if var33 then cryoModule.Dictionary.join(var33, v) else v
											end
										elseif next(status) then
											local var34 = p4.data(false)
											
											for i, v in status do
												local var35 = var34 and var34[i]
												t_3[i] = if var35 then cryoModule.Dictionary.join(var35, v) else v
											end
										elseif var4.clearOnEmptyResponse and var4.configKey then
											t_3[var4.configKey] = {}
										end
										local var36 = if fFlagSduiApiStoreOnSuccessAndRefresh then var31 else nil
										local var37 = t_2[p3]
										
										if var37 then
											t_2[p3] = nil
											var37.resolve(t_3)
										end
										if fFlagSduiApiStoreOnSuccessAndRefresh then
											local var38 = t[p3]
											
											if var38 and var38.onSuccess then
												var38.onSuccess(t_3, var36)
											end
										end
										return p6(t_3)
									else
										sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
											message = `handleSduiApiResponse not successful for {url} err {sduiParseHelpers.stringifyValue(status)}`,
											name = var4.surfaceKey
										}, var4.surfaceKey)
										
										if fFlagHomeSduiOfflineCache then
											return var18(status, p4)
										end
										local var39 = t_2[p3]
										
										if var39 then
											t_2[p3] = nil
											var39.reject(status)
										end
										return p7(p4)
									end
								end
							end
						elseif fFlagHomeSduiOfflineCache then
							return var18(p10)
						end
						var20 = t_2[p3]
						
						if var20 then
							t_2[p3] = nil
							var20.reject(p10)
						end
						return p7(p10)
					end)
					
					if var19 ~= nil then
						p8(var19)
					end
				end)
			end
			
			if not fFlagSduiUseHttpClientModule then
				return createRequestPromise(function(p11)
					-- upvalues: httpService (copy), url (ref), var7 (ref), var6 (ref), postConfig (ref), sduiApiStorePostConfigModule (copy), var12 (ref), sduiPageRequestPriority (copy)
					httpService:RequestInternal({
						Url = url,
						Method = var7,
						Headers = {
							Accept = if var6 then "application/json" else "application/x-protobuf",
							["Content-Type"] = if postConfig then sduiApiStorePostConfigModule.getContentTypeHeaderFromPostConfig(postConfig) else nil
						},
						Body = if postConfig then sduiApiStorePostConfigModule.getBodyFromPostConfig(postConfig) else nil,
						OnMessage = if var12 then var12.handleChunk else nil,
						Priority = sduiPageRequestPriority
					}):Start(p11)
					
					return nil
				end)
			end
			local var40 = if postConfig then sduiApiStorePostConfigModule.getBodyFromPostConfig(postConfig) else nil
			local var41 = if postConfig then sduiApiStorePostConfigModule.getContentTypeHeaderFromPostConfig(postConfig) else nil
			local var42 = sduiRetryPolicyModule.resolve(var4.retry)
			
			if fFlagSduiRequestCountersModule and var42 ~= nil then
				local onRetry = var42.onRetry
				var42 = cryoModule.Dictionary.join(var42, {
					onRetry = function(p11)
						-- upvalues: onRetry (ref), sduiPageAnalyticsModule (copy), var4 (ref), var5 (ref)
						if onRetry ~= nil then
							onRetry(p11)
						end
						sduiPageAnalyticsModule.sendRequestRetryCounter(var4.surfaceKey, var5, p11)
					end
				})
			end
			local t_3 = {
				url = url,
				method = var7,
				body = var40,
				contentType = var41,
				accept = if var6 then "application/json" else "application/x-protobuf",
				analyticsKey = var4.surfaceKey,
				priority = sduiPageRequestPriority,
				retry = var42,
				deadlineSec = if p2 and p2.requestDeadlineSec then p2.requestDeadlineSec else sduiRetryPolicyModule.getRequestDeadlineSec(),
				network = if p2 then p2.network else nil,
				delivery = if var12 then { mode = "streaming", onMessage = var12.handleChunk } else { mode = "buffered" }
			}
			
			return createRequestPromise(function(p11)
				-- upvalues: sendSduiHttpRequestModule (copy), t_3 (ref)
				local var43 = sendSduiHttpRequestModule(t_3)
				var43:andThen(function(p12)
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
					-- upvalues: var43 (ref)
					var43:cancel()
				end
			end)
		end,
		requestTimeoutSec = if fFlagSduiUseHttpClientModule then sduiRetryPolicyModule.getFetchTimeoutSec() else nil
	})
	
	local function fetchIfNeeded(p9, p10)
		-- upvalues: fFlagSduiProtobufJsonDecode (copy), sduiResponseType (copy), t (ref), var3 (ref), t_2 (ref), promiseModule (copy)
		if fFlagSduiProtobufJsonDecode and p9.responseType == nil then
			p9.responseType = sduiResponseType.Protobuf
		end
		local configKey = p9.configKey or p9.url
		p9.configKey = configKey
		p9.loadTimer.logUiRequestQueued()
		t[configKey] = p9
		local _, andFetchItem = var3.getAndFetchItem(configKey, if p10 then function()
			return true
		end else nil)
		
		if not andFetchItem then
			return promiseModule.resolve()
		elseif not t_2[configKey] then
			local var20 = nil
			local var21 = nil
			local var22 = promiseModule.new(function(p11, p12)
				-- upvalues: var20 (write), var21 (write)
				var20 = p11
				var21 = p12
			end)
			var22:catch(function(_) end)
			t_2[configKey] = { promise = var22, resolve = var20, reject = var21 }
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
			-- upvalues: t (ref), var3 (ref), var1 (ref)
			local t_1 = {}
			
			if typeof(p9) ~= "string" or p9 == "" then
				return t_1
			end
			for i in t do
				local var20 = var3.getCachedItem(i).data(false)
				
				if var20 then
					local var21 = false
					local t_2 = {}
					
					for i_1, v in var20 do
						if v and v.category ~= nil and v.title == p9 then
							var21 = true
						else
							t_2[i_1] = v
						end
					end
					if var21 then
						var1.replaceItems({ [i] = t_2 })
						table.insert(t_1, i)
					end
				end
			end
			return t_1
		end else nil,
		seedFromDecodedResponse = function(p10)
			-- upvalues: fFlagHomeSduiOfflineCache (copy), t (ref), sduiResponseType (copy), var3 (ref), handleSduiApiResponseModule (copy), fFlagSduiUseHttpClientModule (copy), sduiProtobufResponseHelpersModule (copy), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (ref), fFlagSduiAllowNoConfigsBuilt (copy), fFlagSduiClientTemplateCache (copy), sduiLogger (copy), sduiErrors (copy), sduiParseHelpers (copy), fFlagAppChatConversationTrustedFriendUpsellBanner (copy), var1 (ref), accumulateSduiCacheSubEntriesModule (copy)
			local configKey = p10.configKey
			local loadTimer = p10.loadTimer
			
			if fFlagHomeSduiOfflineCache and p10.requestConfig ~= nil then
				t[configKey] = p10.requestConfig
			else
				loadTimer.logUiRequestQueued()
				t[configKey] = {
					url = `inline://{configKey}`,
					surfaceKey = p10.surfaceKey,
					configKey = configKey,
					loadTimer = loadTimer,
					apiProto = p10.apiProto,
					responseType = sduiResponseType.Protobuf
				}
			end
			local var22 = if fFlagHomeSduiOfflineCache then p10.requestConfig else nil
			local var23 = var3.getCachedItem(configKey).data(false)
			local ok, status = pcall(function()
				-- upvalues: handleSduiApiResponseModule (copy), fFlagSduiUseHttpClientModule (copy), p10 (ref), loadTimer (ref), configKey (ref), sduiProtobufResponseHelpersModule (copy), fFlagHomeSduiOfflineCache (copy), var22 (ref), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (copy), fFlagSduiAllowNoConfigsBuilt (copy), fFlagSduiClientTemplateCache (copy)
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
					parseTemplateEntriesFromResponse = if fFlagHomeSduiOfflineCache and var22 ~= nil and fFlagSduiClientDrivenTemplates then var22.parseTemplateEntriesFromResponse or sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse else sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse,
					parsePageEntriesFromResponse = if fFlagHomeSduiOfflineCache and var22 ~= nil and fFlagSduiClientDrivenTemplates then var22.parsePageEntriesFromResponse or sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse else sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse,
					parseLocalizedLiteralsFromResponse = if not fFlagSduiClientDrivenTemplates then if fFlagHomeSduiOfflineCache and var22 ~= nil then var22.parseLocalizedLiteralsFromResponse or sduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse else sduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse else nil,
					getInputDataSignalsForRequest = getInputDataSignals,
					allowNoConfigsBuilt = if fFlagHomeSduiOfflineCache and var22 ~= nil and fFlagSduiAllowNoConfigsBuilt then var22.allowNoConfigsBuilt else nil,
					mergeStrategy = if fFlagHomeSduiOfflineCache and var22 ~= nil then var22.mergeStrategy else nil,
					enableTemplateCache = if fFlagHomeSduiOfflineCache and var22 ~= nil and fFlagSduiClientTemplateCache then var22.enableTemplateCache else nil
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
				[configKey] = accumulateSduiCacheSubEntriesModule(status, var23)
			})
		end,
		getData = var3.getCachedItem,
		getInputData = if fFlagSduiApiStoreExposeGetInputData then function(p11, p12, p13)
			-- upvalues: resolveSduiCacheEntryModule (copy), t_3 (ref)
			local var24 = resolveSduiCacheEntryModule(t_3, p11, if p12 and p12 ~= "" then `{p11}_{p12}` else nil)
			
			return if var24 == nil then nil else var24.get(if p13 == nil then false else p13)
		end else nil,
		getRootConfig = function(p11, p12, p13)
			-- upvalues: var3 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var24 = var3.getCachedItem(p11).data(p12)
			local var25 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var24, p11, p13) else var24 and var24[p13 or p11]
			
			return if var25 then var25.config else nil
		end,
		getTitle = function(p11, p12, p13)
			-- upvalues: var3 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var24 = var3.getCachedItem(p11).data(p12)
			local var25 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var24, p11, p13) else var24 and var24[p13 or p11]
			
			return if var25 and var25.title ~= "" then var25.title else nil
		end,
		getDataUpdatedTimestamp = function(p11, p12, p13)
			-- upvalues: var3 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var24 = var3.getCachedItem(p11).data(p12)
			local var25 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var24, p11, p13) else var24 and var24[p13 or p11]
			
			return if var25 then var25.dataUpdatedTimestamp else nil
		end,
		getEntrySurfacing = function(p11, p12, p13)
			-- upvalues: var3 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var24 = var3.getCachedItem(p11).data(p13)
			local var25 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var24, p11, p12) else var24 and var24[p12 or p11]
			
			return if var25 then var25.surfacing else nil
		end,
		loadMoreFromApi = function(p11)
			-- upvalues: t (ref), sduiLogger (copy), sduiErrors (copy), promiseModule (copy), var3 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy), fFlagSduiPaginatePostBody (copy), cryoModule (copy), fetchIfNeeded (ref)
			local configKey = t[p11.configKey]
			
			if not configKey then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToPaginateRequest, { message = `No requestData for {p11.configKey}` }, "unknown")
				
				return promiseModule.resolve()
			end
			local var24
			local var25 = var3.getCachedItem(p11.configKey).data(false)
			
			if fFlagSduiAlwaysCacheWithIdentifier then
				var24 = resolveSduiCacheEntryModule(var25, p11.configKey, p11.identifier)
			else
				var24 = var25
				
				if var24 then
					var24 = var25[p11.identifier or p11.configKey]
				end
			end
			if not var24 then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToPaginateRequest, {
					message = `No entry data for {p11.configKey}`,
					name = configKey.surfaceKey
				}, configKey.surfaceKey)
				
				return promiseModule.resolve()
			end
			local nextPageUrl = var24.nextPageUrl
			
			if not nextPageUrl or nextPageUrl == "" then
				return promiseModule.resolve()
			end
			local t_1 = {
				isPaginated = true,
				url = nextPageUrl,
				loadTimer = p11.loadTimer
			}
			
			if fFlagSduiPaginatePostBody and configKey.postConfig and var24.nextPagePostBody then
				t_1.postConfig = cryoModule.Dictionary.join(configKey.postConfig, { body = var24.nextPagePostBody })
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
				local var26 = if configKey.buildRefreshPostBody then configKey.buildRefreshPostBody() else nil
				
				if var26 then
					t_1.postConfig = cryoModule.Dictionary.join(configKey.postConfig, { body = var26 })
				end
			end
			return fetchIfNeeded(cryoModule.Dictionary.join(configKey, t_1), true)
		end
	}
end