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
local sduiRequestConcurrencyPolicy = sduiIntegrationTypesModule.SduiRequestConcurrencyPolicy
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
local buildSduiRequestHeadersModule = require(sduiSharedUtilities.buildSduiRequestHeaders)
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
local fFlagSduiMrRouterHeadersModule = require(sduiSharedUtilities.Flags.FFlagSduiMrRouterHeaders)
local fFlagSduiClientDrivenTemplates = require(parent.SharedFlags).FFlagSduiClientDrivenTemplates
local fFlagLuaAppSduiHomePageSupport = require(parent.SharedFlags).FFlagLuaAppSduiHomePageSupport
local fFlagHomeSduiOfflineCache = require(parent.SharedFlags).FFlagHomeSduiOfflineCache
local fFlagLuaAppEnableSduiHomePage = require(parent.SharedFlags).FFlagLuaAppEnableSduiHomePage
local sduiPageRequestPriority = game:DefineFastInt("SduiPageRequestPriority", 1)
local resolveSduiCacheEntryModule = require(sduiSharedUtilities.resolveSduiCacheEntry)
local accumulateSduiCacheSubEntriesModule = require(sduiSharedUtilities.accumulateSduiCacheSubEntries)

local function _(p1, p2)
	local var1
	if p2 ~= nil then
		var1 = p2()
		
		if var1 then
			var1 = if p1.isResponseCurrent ~= nil then p1.isResponseCurrent() else true
		end
		return var1
	end
end

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
	-- upvalues: createDataCache (ref), fFlagLuaAppEnableSduiHomePage (ref), fFlagSduiApiStoreOnSuccessAndRefresh (ref), signalsModule (ref), promiseModule (ref), fFlagSduiRequestCountersModule (ref), getSduiRequestEndpointForCounters (ref), fFlagSduiProtobufJsonDecode (ref), sduiResponseType (ref), fFlagLuaAppSduiStreamingChunkedResponses (ref), makeProtobufJsonResponseDecoder (ref), makeProtoResponseDecoder (ref), handleSduiApiResponseModule (ref), sduiProtobufResponseHelpersModule (ref), fFlagSduiClientDrivenTemplates (ref), fFlagSduiPaginatePostBody (ref), fFlagSduiAllowNoConfigsBuilt (ref), fFlagSduiClientTemplateCache (ref), fFlagHomeSduiOfflineCache (ref), sduiLogger (ref), sduiErrors (ref), sduiParseHelpers (ref), sduiRequestStatus (ref), createSduiStreamingResponseHandlerModule (ref), fFlagSduiUseHttpClientModule (ref), accumulateSduiCacheSubEntriesModule (ref), sduiPageAnalyticsModule (ref), sduiEnableClearOnEmptyResponse (ref), cryoModule (ref), sduiApiStorePostConfigModule (ref), sduiRetryPolicyModule (ref), sduiPageRequestPriority (ref), sendSduiHttpRequestModule (ref), httpService (ref), fFlagSduiMrRouterHeadersModule (ref), buildSduiRequestHeadersModule (ref), createDataResolver (ref), sduiRequestConcurrencyPolicy (ref), resolveSduiCacheEntryModule (ref), fFlagSduiAlwaysCacheWithIdentifier (ref), fFlagAppChatConversationTrustedFriendUpsellBanner (ref), fFlagSduiDismissPromptAction (ref), fFlagSduiApiStoreExposeGetInputData (ref), fFlagLuaAppSduiHomePageSupport (ref)
	local var1 = createDataCache()
	local t = {}
	local var2 = if fFlagLuaAppEnableSduiHomePage then {} else nil
	local t_1 = {}
	local t_2 = {}
	
	local function completeActiveRequest(p3, p4, p5, p6)
		-- upvalues: t_2 (ref), fFlagSduiApiStoreOnSuccessAndRefresh (copy), t (ref)
		local var3 = t_2[p3]
		
		if var3 then
			t_2[p3] = nil
			
			if p4 then
				var3.resolve(p5)
			else
				var3.reject(p5)
			end
		end
		if fFlagSduiApiStoreOnSuccessAndRefresh and p4 then
			local var4 = t[p3]
			
			if var4 and var4.onSuccess then
				var4.onSuccess(p5, p6)
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
		local var3 = t_3[value]
		
		if var3 == nil then
			local var4, var5 = signalsModule.createSignal(nil)
			var3 = { get = var4, set = var5 }
			t_3[value] = var3
		end
		return var3
	end
	
	local var3 = nil
	
	local function fetchFunction(p3, p4, p5, p6)
		-- upvalues: fFlagLuaAppEnableSduiHomePage (copy), t (ref), promiseModule (copy), completeActiveRequest (ref), fFlagSduiApiStoreOnSuccessAndRefresh (copy), fFlagSduiRequestCountersModule (copy), getSduiRequestEndpointForCounters (copy), fFlagSduiProtobufJsonDecode (copy), sduiResponseType (copy), fFlagLuaAppSduiStreamingChunkedResponses (copy), makeProtobufJsonResponseDecoder (copy), makeProtoResponseDecoder (copy), handleSduiApiResponseModule (copy), sduiProtobufResponseHelpersModule (copy), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (ref), fFlagSduiPaginatePostBody (copy), fFlagSduiAllowNoConfigsBuilt (copy), fFlagSduiClientTemplateCache (copy), fFlagHomeSduiOfflineCache (copy), sduiLogger (copy), sduiErrors (copy), sduiParseHelpers (copy), var3 (write), sduiRequestStatus (copy), createSduiStreamingResponseHandlerModule (copy), fFlagSduiUseHttpClientModule (copy), accumulateSduiCacheSubEntriesModule (copy), var1 (ref), sduiPageAnalyticsModule (copy), t_1 (ref), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy), sduiApiStorePostConfigModule (copy), sduiRetryPolicyModule (copy), p2 (ref), sduiPageRequestPriority (copy), sendSduiHttpRequestModule (copy), httpService (copy), fFlagSduiMrRouterHeadersModule (copy), buildSduiRequestHeadersModule (copy)
		local var4 = fFlagLuaAppEnableSduiHomePage and p5 ~= nil
		local var5 = if fFlagLuaAppEnableSduiHomePage and var4 then p5 else t[p3]
		
		if not var5 then
			return promiseModule.reject("No request config for key", p3)
		end
		local var6 = if fFlagLuaAppEnableSduiHomePage and var4 then function(_, p7, p8, p9)
			-- upvalues: fFlagSduiApiStoreOnSuccessAndRefresh (copy), var5 (ref)
			if p7 and fFlagSduiApiStoreOnSuccessAndRefresh and var5.onSuccess then
				var5.onSuccess(p8, p9)
			end
		end else completeActiveRequest
		local url = var5.url
		local var7 = if fFlagSduiRequestCountersModule then getSduiRequestEndpointForCounters(url) else ""
		local loadTimer = var5.loadTimer
		loadTimer.logUiRequestSent()
		local var8 = fFlagSduiProtobufJsonDecode and var5.responseType == sduiResponseType.ProtobufJson
		local postConfig = var5.postConfig
		local var9 = if postConfig then "POST" else "GET"
		local var10 = if fFlagLuaAppSduiStreamingChunkedResponses then var5.enableStreaming else nil
		local var11 = if var8 then makeProtobufJsonResponseDecoder(var5.apiProto) else makeProtoResponseDecoder(var5.apiProto)
		
		local function processSduiResponse(p7)
			-- upvalues: var5 (ref), p4 (ref), handleSduiApiResponseModule (copy), loadTimer (ref), var11 (ref), sduiProtobufResponseHelpersModule (copy), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (copy), fFlagLuaAppSduiStreamingChunkedResponses (copy), var10 (ref), fFlagLuaAppEnableSduiHomePage (copy), fFlagSduiPaginatePostBody (copy), fFlagSduiAllowNoConfigsBuilt (copy), fFlagSduiClientTemplateCache (copy)
			return handleSduiApiResponseModule({
				response = p7,
				loadTimer = loadTimer,
				surfaceKey = var5.surfaceKey,
				configCacheKey = var5.configKey,
				decodeResponse = var11,
				parseHydrationDataFromResponse = sduiProtobufResponseHelpersModule.parseHydrationDataFromResponse,
				parseTemplateEntriesFromResponse = if fFlagSduiClientDrivenTemplates then var5.parseTemplateEntriesFromResponse or sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse else sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse,
				parsePageEntriesFromResponse = if fFlagSduiClientDrivenTemplates then var5.parsePageEntriesFromResponse or sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse else sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse,
				parseLocalizedLiteralsFromResponse = if fFlagSduiClientDrivenTemplates then var5.parseLocalizedLiteralsFromResponse or sduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse else nil,
				getInputDataSignalsForRequest = getInputDataSignals,
				enableStreamingMerge = if fFlagLuaAppSduiStreamingChunkedResponses then var10 else nil,
				enableInputDataMerge = if fFlagLuaAppEnableSduiHomePage then if fFlagLuaAppSduiStreamingChunkedResponses then var10 else var5.enableInputDataMerge or nil else nil,
				paginateResponse = var5.isPaginated and p4.data(false) ~= nil,
				buildNextPageUrl = var5.buildNextPageUrl,
				buildNextPagePostBody = if fFlagSduiPaginatePostBody then var5.buildNextPagePostBody else nil,
				allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then var5.allowNoConfigsBuilt else nil,
				mergeStrategy = var5.mergeStrategy,
				cacheSingleEntryWithIdentifier = if fFlagLuaAppEnableSduiHomePage then var5.cacheSingleEntryWithIdentifier else nil,
				enableTemplateCache = if fFlagSduiClientTemplateCache then var5.enableTemplateCache else nil
			})
		end
		
		local var12 = if fFlagHomeSduiOfflineCache then function(p7)
			-- upvalues: var5 (ref), p4 (ref), sduiLogger (copy), sduiErrors (copy), sduiParseHelpers (copy), var3 (copy), p3 (ref), loadTimer (ref), sduiRequestStatus (copy)
			local recoverFromError = var5.recoverFromError
			
			if recoverFromError == nil then
				return nil
			end
			local var13 = p4.data(false)
			
			if type(var13) == "table" and next(var13) ~= nil then
				return var13
			end
			local function _(p8)
				-- upvalues: sduiLogger (copy), sduiErrors (copy), var5 (copy)
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToApplyFallbackResponse, { message = p8, name = var5.surfaceKey }, var5.surfaceKey)
			end
			
			local ok, status = pcall(recoverFromError.getDecodedResponse, p7)
			
			if not ok then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToApplyFallbackResponse, {
					message = `recovery errored: {sduiParseHelpers.stringifyValue(status)}`,
					name = var5.surfaceKey
				}, var5.surfaceKey)
				
				return nil
			elseif status == nil then
				return nil
			end
			local ok_1, status_1 = pcall(var3, {
				surfaceKey = var5.surfaceKey,
				configKey = p3,
				decodedResponse = status,
				loadTimer = loadTimer,
				apiProto = var5.apiProto,
				requestConfig = var5
			})
			
			if not ok_1 then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToApplyFallbackResponse, {
					message = `recovery errored: {sduiParseHelpers.stringifyValue(status_1)}`,
					name = var5.surfaceKey
				}, var5.surfaceKey)
				
				return nil
			end
			local var14 = p4.data(false)
			
			if type(var14) ~= "table" or next(var14) == nil then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToApplyFallbackResponse, {
					message = "recovery built no configs",
					name = var5.surfaceKey
				}, var5.surfaceKey)
				
				return nil
			end
			loadTimer.updateRequestStatus(sduiRequestStatus.LoadedFromCache)
			
			if recoverFromError.onApplied ~= nil then
				recoverFromError.onApplied()
			end
			return var14
		end else nil
		local var13 = nil
		local var14 = if fFlagLuaAppSduiStreamingChunkedResponses and var10 then createSduiStreamingResponseHandlerModule({
			configKey = p3,
			loadTimer = loadTimer,
			processFrame = function(p7)
				-- upvalues: fFlagLuaAppEnableSduiHomePage (copy), var5 (ref), p6 (ref), p4 (ref), processSduiResponse (ref), fFlagSduiUseHttpClientModule (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var13 (write), accumulateSduiCacheSubEntriesModule (copy), var1 (copy), p3 (ref)
				local var15
				if fFlagLuaAppEnableSduiHomePage then
					local var16
					local var17 = var5
					var15 = p6
					
					if var15 ~= nil then
						var16 = var15()
						
						if var16 then
							var16 = if var17.isResponseCurrent ~= nil then var17.isResponseCurrent() else true
						end
						if not var16 then
							return true, p4.data(false)
						end
					end
				end
				ok, status, var69 = pcall(processSduiResponse, if fFlagSduiUseHttpClientModule then {
					statusCode = 200,
					responseBody = buffer.fromstring(p7),
					stats = {}
				} else { Stats = {}, Body = buffer.fromstring(p7) })
				
				if not ok then
					return false, status
				elseif fFlagSduiApiStoreOnSuccessAndRefresh then
					var13 = var15
				end
				local var18 = accumulateSduiCacheSubEntriesModule(status, p4.data(false))
				var1.updateItems({ [p3] = var18 })
				
				return true, var18
			end
		}) else nil
		
		local function createRequestPromise(p7)
			-- upvalues: promiseModule (copy), fFlagHomeSduiOfflineCache (copy), fFlagSduiRequestCountersModule (copy), sduiPageAnalyticsModule (copy), var5 (ref), var7 (ref), var12 (write), fFlagLuaAppEnableSduiHomePage (copy), var6 (write), completeActiveRequest (copy), p3 (ref), loadTimer (ref), var4 (ref), t_1 (copy), fFlagSduiUseHttpClientModule (copy), sduiRequestStatus (copy), p6 (ref), var14 (ref), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var13 (write), sduiParseHelpers (copy), sduiLogger (copy), sduiErrors (copy), processSduiResponse (ref), url (ref), p4 (ref), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
			return promiseModule.new(function(p8, p9, p10)
				-- upvalues: fFlagHomeSduiOfflineCache (copy), fFlagSduiRequestCountersModule (copy), sduiPageAnalyticsModule (copy), var5 (copy), var7 (copy), var12 (copy), fFlagLuaAppEnableSduiHomePage (copy), var6 (copy), completeActiveRequest (copy), p3 (copy), p7 (ref), loadTimer (copy), var4 (copy), t_1 (copy), fFlagSduiUseHttpClientModule (copy), sduiRequestStatus (copy), p6 (copy), var14 (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var13 (copy), sduiParseHelpers (copy), sduiLogger (copy), sduiErrors (copy), processSduiResponse (copy), url (copy), p4 (copy), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
				local var15 = if fFlagHomeSduiOfflineCache then p8 else nil
				local var16 = nil
				local var17 = nil
				
				if fFlagSduiRequestCountersModule then
					local var18 = p8
					local var19 = p9
					
					p8 = function(p11)
						-- upvalues: sduiPageAnalyticsModule (copy), var5 (copy), var7 (copy), var16 (write), var17 (write), var18 (ref)
						sduiPageAnalyticsModule.sendRequestOutcomeCounter(var5.surfaceKey, var7, "success", var16, var17)
						
						return var18(p11)
					end
					
					p9 = function(p11)
						-- upvalues: sduiPageAnalyticsModule (copy), var5 (copy), var7 (copy), var16 (write), var17 (write), var19 (ref)
						sduiPageAnalyticsModule.sendRequestOutcomeCounter(var5.surfaceKey, var7, "failure", var16, var17)
						
						return var19(p11)
					end
				end
				local var20 = if fFlagHomeSduiOfflineCache then function(p11, p12)
					-- upvalues: var12 (copy), fFlagSduiRequestCountersModule (copy), sduiPageAnalyticsModule (copy), var5 (copy), var7 (copy), var16 (write), var17 (write), var15 (write), fFlagLuaAppEnableSduiHomePage (copy), var6 (copy), completeActiveRequest (copy), p3 (copy), p9 (write)
					local var21 = var12(p11)
					
					if var21 == nil then
						(if fFlagLuaAppEnableSduiHomePage then var6 else completeActiveRequest)(p3, false, p11)
						
						return p9(if p12 ~= nil then p11 else p12)
					elseif fFlagSduiRequestCountersModule then
						sduiPageAnalyticsModule.sendRequestOutcomeCounter(var5.surfaceKey, var7, "failure", var16, var17)
					end
					var15(var21)
					
					return (if fFlagLuaAppEnableSduiHomePage then var6 else completeActiveRequest)(p3, false, p11)
				end else nil
				local var21 = p7(function(p11, p12)
					-- upvalues: loadTimer (copy), fFlagLuaAppEnableSduiHomePage (copy), var4 (copy), t_1 (copy), p3 (copy), sduiPageAnalyticsModule (copy), var5 (copy), fFlagSduiUseHttpClientModule (copy), fFlagSduiRequestCountersModule (copy), var16 (write), var17 (write), sduiRequestStatus (copy), p6 (copy), p8 (write), fFlagHomeSduiOfflineCache (copy), var20 (write), var6 (copy), completeActiveRequest (copy), p9 (write), var14 (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var13 (copy), sduiParseHelpers (copy), sduiLogger (copy), sduiErrors (copy), processSduiResponse (copy), url (copy), p4 (copy), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
					loadTimer.logUiResponseReceived()
					
					if not fFlagLuaAppEnableSduiHomePage or not var4 then
						t_1[p3] = false
					end
					local var22, var23
					sduiPageAnalyticsModule.sendPageStatusEvent(var5.surfaceKey, if fFlagSduiUseHttpClientModule then p12.statusCode else p12.StatusCode, if fFlagSduiUseHttpClientModule then p12.httpError else p12.HttpError)
					
					if fFlagSduiRequestCountersModule then
						var16 = if fFlagSduiUseHttpClientModule then p12.statusCode else p12.StatusCode
						var17 = if fFlagSduiUseHttpClientModule then p12.httpError else p12.HttpError
					end
					if p11 then
						local var24
						local var25 = if fFlagSduiUseHttpClientModule then p12.statusCode else p12.StatusCode
						var22 = if fFlagSduiUseHttpClientModule then p12.httpError else p12.HttpError
						var23 = if var25 then tonumber(var25) else nil
						
						if fFlagSduiUseHttpClientModule then
							var24 = p12.wasTransportFailure == true
							var24 = nil
						else
							var24 = false
						end
						local status
						if var23 and var23 >= 400 or var22 and var22 ~= Enum.HttpError.OK or var24 then
							loadTimer.updateRequestStatus(sduiRequestStatus.FailedToLoad)
							
							if fFlagLuaAppEnableSduiHomePage then
								local var26
								local var27 = var5
								status = p6
								
								if status ~= nil then
									var26 = status()
									
									if var26 then
										var26 = if var27.isResponseCurrent ~= nil then var27.isResponseCurrent() else true
									end
									if not var26 then
										return p8(nil)
									elseif fFlagHomeSduiOfflineCache then
										return var20(p12)
									end;
									(if fFlagLuaAppEnableSduiHomePage then var6 else completeActiveRequest)(p3, false, p12)
									
									return p9(p12)
								end
							end
						else
							loadTimer.updateRequestStatus(sduiRequestStatus.LoadedFromNetwork)
							
							if fFlagLuaAppEnableSduiHomePage then
								local var28
								local var29 = var5
								status = p6
								
								if status ~= nil then
									var28 = status()
									
									if var28 then
										var28 = if var29.isResponseCurrent ~= nil then var29.isResponseCurrent() else true
									end
									if not var28 then
										return p8(nil)
									end
								end
							end
							local var30 = if fFlagSduiUseHttpClientModule then p12.responseBody else p12.Body
							sduiPageAnalyticsModule.sendPagePayloadSizeEvent(var5.surfaceKey, var30)
							
							if var14 then
								local var31 = var14.finalize(var30)
								
								if var31.ok then
									(if fFlagLuaAppEnableSduiHomePage then var6 else completeActiveRequest)(p3, true, var31.value, if fFlagSduiApiStoreOnSuccessAndRefresh then var13 else nil)
									
									return p8(var31.value)
								end
								sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
									message = sduiParseHelpers.stringifyValue(var31.value),
									name = var5.surfaceKey
								}, var5.surfaceKey)
								loadTimer.updateRequestStatus(sduiRequestStatus.FailedToLoad)
								
								if fFlagHomeSduiOfflineCache then
									return var20(var31.value)
								end;
								(if fFlagLuaAppEnableSduiHomePage then var6 else completeActiveRequest)(p3, false, var31.value)
								
								return p9(var31.value)
							else
								ok, status, var90 = pcall(processSduiResponse, p12)
								
								if ok then
									local t = {}
									
									if not sduiEnableClearOnEmptyResponse then
										local var32 = p4.data(false)
										
										for i, v in status do
											local var33 = var32 and var32[i]
											t[i] = if var33 then cryoModule.Dictionary.join(var33, v) else v
										end
									elseif next(status) then
										local var34 = p4.data(false)
										
										for i, v in status do
											local var35 = var34 and var34[i]
											t[i] = if var35 then cryoModule.Dictionary.join(var35, v) else v
										end
									elseif var5.clearOnEmptyResponse and var5.configKey then
										t[var5.configKey] = {}
									end;
									(if fFlagLuaAppEnableSduiHomePage then var6 else completeActiveRequest)(p3, true, t, if fFlagSduiApiStoreOnSuccessAndRefresh then var90 else nil)
									
									return p8(t)
								else
									sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
										message = `handleSduiApiResponse not successful for {url} err {sduiParseHelpers.stringifyValue(status)}`,
										name = var5.surfaceKey
									}, var5.surfaceKey)
									
									if fFlagHomeSduiOfflineCache then
										return var20(status, p4)
									end;
									(if fFlagLuaAppEnableSduiHomePage then var6 else completeActiveRequest)(p3, false, status)
									
									return p9(p4)
								end
							end
						end
					elseif fFlagLuaAppEnableSduiHomePage then
						local var36
						var22 = var5
						var23 = p6
						
						if var23 ~= nil then
							var36 = var23()
							
							if var36 then
								var36 = if var22.isResponseCurrent ~= nil then var22.isResponseCurrent() else true
							end
							if not var36 then
								return p8(nil)
							elseif fFlagHomeSduiOfflineCache then
								return var20(p12)
							end;
							(if fFlagLuaAppEnableSduiHomePage then var6 else completeActiveRequest)(p3, false, p12)
							
							return p9(p12)
						end
					end
				end)
				
				if var21 ~= nil then
					p10(var21)
				end
			end)
		end
		
		if not fFlagSduiUseHttpClientModule then
			return createRequestPromise(function(p13)
				-- upvalues: httpService (copy), url (ref), var9 (ref), fFlagSduiMrRouterHeadersModule (copy), buildSduiRequestHeadersModule (copy), var8 (ref), postConfig (ref), sduiApiStorePostConfigModule (copy), var14 (ref), sduiPageRequestPriority (copy)
				httpService:RequestInternal({
					Url = url,
					Method = var9,
					Headers = if fFlagSduiMrRouterHeadersModule then buildSduiRequestHeadersModule(if var8 then "application/json" else "application/x-protobuf", if postConfig then sduiApiStorePostConfigModule.getContentTypeHeaderFromPostConfig(postConfig) else nil) else {
						Accept = if var8 then "application/json" else "application/x-protobuf",
						["Content-Type"] = if postConfig then sduiApiStorePostConfigModule.getContentTypeHeaderFromPostConfig(postConfig) else nil
					},
					Body = if postConfig then sduiApiStorePostConfigModule.getBodyFromPostConfig(postConfig) else nil,
					OnMessage = if var14 then var14.handleChunk else nil,
					Priority = sduiPageRequestPriority
				}):Start(p13)
				
				return nil
			end)
		end
		local var37 = if postConfig then sduiApiStorePostConfigModule.getBodyFromPostConfig(postConfig) else nil
		local var38 = if postConfig then sduiApiStorePostConfigModule.getContentTypeHeaderFromPostConfig(postConfig) else nil
		local var39 = sduiRetryPolicyModule.resolve(var5.retry)
		
		if fFlagSduiRequestCountersModule and var39 ~= nil then
			local onRetry = var39.onRetry
			var39 = cryoModule.Dictionary.join(var39, {
				onRetry = function(p13)
					-- upvalues: onRetry (ref), sduiPageAnalyticsModule (copy), var5 (ref), var7 (ref)
					if onRetry ~= nil then
						onRetry(p13)
					end
					sduiPageAnalyticsModule.sendRequestRetryCounter(var5.surfaceKey, var7, p13)
				end
			})
		end
		local t_2 = {
			url = url,
			method = var9,
			body = var37,
			contentType = var38,
			accept = if var8 then "application/json" else "application/x-protobuf",
			analyticsKey = var5.surfaceKey,
			priority = sduiPageRequestPriority,
			retry = var39,
			deadlineSec = if p2 and p2.requestDeadlineSec then p2.requestDeadlineSec else sduiRetryPolicyModule.getRequestDeadlineSec(),
			network = if p2 then p2.network else nil,
			delivery = if var14 then { mode = "streaming", onMessage = var14.handleChunk } else { mode = "buffered" }
		}
		
		return createRequestPromise(function(p13)
			-- upvalues: sendSduiHttpRequestModule (copy), t_2 (ref)
			local var40 = sendSduiHttpRequestModule(t_2)
			var40:andThen(function(p14)
				-- upvalues: p13 (ref)
				p13(true, p14)
			end, function(p14)
				-- upvalues: p13 (ref)
				if typeof(p14) == "table" and (p14.statusCode ~= nil or p14.httpError ~= nil) then
					p13(true, p14)
					
					return
				end
				p13(false, p14)
			end)
			
			return function()
				-- upvalues: var40 (ref)
				var40:cancel()
			end
		end)
	end
	
	local var22 = createDataResolver({
		queueProcessDelaySec = 0,
		supportsMultiGet = false,
		cache = var1,
		fetchFn = fetchFunction,
		requestTimeoutSec = if fFlagSduiUseHttpClientModule then sduiRetryPolicyModule.getFetchTimeoutSec() else nil
	})
	
	local function fetchIfNeeded(p11, p12)
		-- upvalues: fFlagSduiProtobufJsonDecode (copy), sduiResponseType (copy), fFlagLuaAppEnableSduiHomePage (copy), sduiRequestConcurrencyPolicy (copy), var2 (ref), fetchFunction (ref), var22 (ref), var1 (ref), t (ref), t_2 (ref), promiseModule (copy)
		if fFlagSduiProtobufJsonDecode and p11.responseType == nil then
			p11.responseType = sduiResponseType.Protobuf
		end
		local configKey = p11.configKey or p11.url
		local var23 = fFlagLuaAppEnableSduiHomePage and p11.concurrencyPolicy == sduiRequestConcurrencyPolicy.LatestWins
		p11.configKey = configKey
		p11.loadTimer.logUiRequestQueued()
		
		if fFlagLuaAppEnableSduiHomePage and var23 then
			local concurrencyKey = p11.concurrencyKey or configKey
			local var24 = var2
			local var25 = (var24[concurrencyKey] or 0) + 1
			var24[concurrencyKey] = var25
			
			return fetchFunction(configKey, var22.getCachedItem(configKey), p11, function()
				-- upvalues: var24 (ref), concurrencyKey (ref), var25 (ref)
				return var24[concurrencyKey] == var25
			end):andThen(function(p13)
				-- upvalues: p11 (ref), var1 (copy), configKey (ref)
				if p13 ~= nil and not p11.enableInputDataMerge then
					var1.updateItems({ [configKey] = p13 })
				end
				return p13
			end)
		end
		t[configKey] = p11
		local _, andFetchItem = var22.getAndFetchItem(configKey, if p12 then function()
			return true
		end else nil)
		
		if not andFetchItem then
			return promiseModule.resolve()
		elseif not t_2[configKey] then
			local var26 = nil
			local var27 = nil
			local var28 = promiseModule.new(function(p13, p14)
				-- upvalues: var26 (write), var27 (write)
				var26 = p13
				var27 = p14
			end)
			var28:catch(function(_) end)
			t_2[configKey] = { promise = var28, resolve = var26, reject = var27 }
		end
		return t_2[configKey].promise
	end
	
	return {
		fetchIfNeeded = fetchIfNeeded,
		isInFlight = isInFlight,
		clearConfigEntries = if fFlagAppChatConversationTrustedFriendUpsellBanner then function(p11)
			-- upvalues: var1 (ref)
			if typeof(p11) == "string" and p11 ~= "" then
				var1.replaceItems({ [p11] = {} })
				
				return
			end
		end else nil,
		dismissEntry = if fFlagSduiDismissPromptAction then function(p11)
			-- upvalues: t (ref), var22 (ref), var1 (ref)
			local t_1 = {}
			
			if typeof(p11) ~= "string" or p11 == "" then
				return t_1
			end
			for i in t do
				local var23 = var22.getCachedItem(i).data(false)
				
				if var23 then
					local var24 = false
					local t_2 = {}
					
					for i_1, v in var23 do
						if v and v.category ~= nil and v.title == p11 then
							var24 = true
						else
							t_2[i_1] = v
						end
					end
					if var24 then
						var1.replaceItems({ [i] = t_2 })
						table.insert(t_1, i)
					end
				end
			end
			return t_1
		end else nil,
		seedFromDecodedResponse = function(p12)
			-- upvalues: fFlagHomeSduiOfflineCache (copy), t (ref), sduiResponseType (copy), var22 (ref), handleSduiApiResponseModule (copy), fFlagSduiUseHttpClientModule (copy), sduiProtobufResponseHelpersModule (copy), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (ref), fFlagSduiAllowNoConfigsBuilt (copy), fFlagSduiClientTemplateCache (copy), sduiLogger (copy), sduiErrors (copy), sduiParseHelpers (copy), fFlagAppChatConversationTrustedFriendUpsellBanner (copy), var1 (ref), accumulateSduiCacheSubEntriesModule (copy)
			local configKey = p12.configKey
			local loadTimer = p12.loadTimer
			
			if fFlagHomeSduiOfflineCache and p12.requestConfig ~= nil then
				t[configKey] = p12.requestConfig
			else
				loadTimer.logUiRequestQueued()
				t[configKey] = {
					url = `inline://{configKey}`,
					surfaceKey = p12.surfaceKey,
					configKey = configKey,
					loadTimer = loadTimer,
					apiProto = p12.apiProto,
					responseType = sduiResponseType.Protobuf
				}
			end
			local var25 = if fFlagHomeSduiOfflineCache then p12.requestConfig else nil
			local var26 = var22.getCachedItem(configKey).data(false)
			local ok, status = pcall(function()
				-- upvalues: handleSduiApiResponseModule (copy), fFlagSduiUseHttpClientModule (copy), p12 (ref), loadTimer (ref), configKey (ref), sduiProtobufResponseHelpersModule (copy), fFlagHomeSduiOfflineCache (copy), var25 (ref), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (copy), fFlagSduiAllowNoConfigsBuilt (copy), fFlagSduiClientTemplateCache (copy)
				return handleSduiApiResponseModule({
					paginateResponse = false,
					cacheSingleEntryWithIdentifier = true,
					response = if fFlagSduiUseHttpClientModule then {
						statusCode = 200,
						responseBody = p12.decodedResponse,
						stats = {}
					} else { StatusCode = 200, Body = p12.decodedResponse, Stats = {} },
					loadTimer = loadTimer,
					surfaceKey = p12.surfaceKey,
					configCacheKey = configKey,
					decodeResponse = function(p13)
						return p13
					end,
					parseHydrationDataFromResponse = sduiProtobufResponseHelpersModule.parseHydrationDataFromResponse,
					parseTemplateEntriesFromResponse = if fFlagHomeSduiOfflineCache and var25 ~= nil and fFlagSduiClientDrivenTemplates then var25.parseTemplateEntriesFromResponse or sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse else sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse,
					parsePageEntriesFromResponse = if fFlagHomeSduiOfflineCache and var25 ~= nil and fFlagSduiClientDrivenTemplates then var25.parsePageEntriesFromResponse or sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse else sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse,
					parseLocalizedLiteralsFromResponse = if not fFlagSduiClientDrivenTemplates then if fFlagHomeSduiOfflineCache and var25 ~= nil then var25.parseLocalizedLiteralsFromResponse or sduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse else sduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse else nil,
					getInputDataSignalsForRequest = getInputDataSignals,
					allowNoConfigsBuilt = if fFlagHomeSduiOfflineCache and var25 ~= nil and fFlagSduiAllowNoConfigsBuilt then var25.allowNoConfigsBuilt else nil,
					mergeStrategy = if fFlagHomeSduiOfflineCache and var25 ~= nil then var25.mergeStrategy else nil,
					enableTemplateCache = if fFlagHomeSduiOfflineCache and var25 ~= nil and fFlagSduiClientTemplateCache then var25.enableTemplateCache else nil
				})
			end)
			
			if not ok then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
					message = `seedFromDecodedResponse failed for {configKey}: {sduiParseHelpers.stringifyValue(status)}`,
					name = p12.surfaceKey
				}, p12.surfaceKey)
				error(status)
			end
			if fFlagAppChatConversationTrustedFriendUpsellBanner and p12.replace then
				var1.replaceItems({ [configKey] = status })
				
				return
			end
			var1.updateItems({
				[configKey] = accumulateSduiCacheSubEntriesModule(status, var26)
			})
		end,
		getData = var22.getCachedItem,
		getInputData = if fFlagSduiApiStoreExposeGetInputData or fFlagLuaAppSduiHomePageSupport then function(p13, p14, p15)
			-- upvalues: resolveSduiCacheEntryModule (copy), t_3 (ref)
			local var27 = resolveSduiCacheEntryModule(t_3, p13, if p14 and p14 ~= "" then `{p13}_{p14}` else nil)
			
			return if var27 == nil then nil else var27.get(if p15 == nil then false else p15)
		end else nil,
		getRootConfig = function(p13, p14, p15)
			-- upvalues: var22 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var27 = var22.getCachedItem(p13).data(p14)
			local var28 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var27, p13, p15) else var27 and var27[p15 or p13]
			
			return if var28 then var28.config else nil
		end,
		getTitle = function(p13, p14, p15)
			-- upvalues: var22 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var27 = var22.getCachedItem(p13).data(p14)
			local var28 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var27, p13, p15) else var27 and var27[p15 or p13]
			
			return if var28 and var28.title ~= "" then var28.title else nil
		end,
		getDataUpdatedTimestamp = function(p13, p14, p15)
			-- upvalues: var22 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var27 = var22.getCachedItem(p13).data(p14)
			local var28 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var27, p13, p15) else var27 and var27[p15 or p13]
			
			return if var28 then var28.dataUpdatedTimestamp else nil
		end,
		getEntrySurfacing = function(p13, p14, p15)
			-- upvalues: var22 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var27 = var22.getCachedItem(p13).data(p15)
			local var28 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var27, p13, p14) else var27 and var27[p14 or p13]
			
			return if var28 then var28.surfacing else nil
		end,
		loadMoreFromApi = function(p13)
			-- upvalues: t (ref), sduiLogger (copy), sduiErrors (copy), promiseModule (copy), var22 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy), fFlagSduiPaginatePostBody (copy), cryoModule (copy), fetchIfNeeded (ref)
			local configKey = t[p13.configKey]
			
			if not configKey then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToPaginateRequest, { message = `No requestData for {p13.configKey}` }, "unknown")
				
				return promiseModule.resolve()
			end
			local var27
			local var28 = var22.getCachedItem(p13.configKey).data(false)
			
			if fFlagSduiAlwaysCacheWithIdentifier then
				var27 = resolveSduiCacheEntryModule(var28, p13.configKey, p13.identifier)
			else
				var27 = var28
				
				if var27 then
					var27 = var28[p13.identifier or p13.configKey]
				end
			end
			if not var27 then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToPaginateRequest, {
					message = `No entry data for {p13.configKey}`,
					name = configKey.surfaceKey
				}, configKey.surfaceKey)
				
				return promiseModule.resolve()
			end
			local nextPageUrl = var27.nextPageUrl
			
			if not nextPageUrl or nextPageUrl == "" then
				return promiseModule.resolve()
			end
			local t_1 = {
				isPaginated = true,
				url = nextPageUrl,
				loadTimer = p13.loadTimer
			}
			
			if fFlagSduiPaginatePostBody and configKey.postConfig and var27.nextPagePostBody then
				t_1.postConfig = cryoModule.Dictionary.join(configKey.postConfig, { body = var27.nextPagePostBody })
			end
			return fetchIfNeeded(cryoModule.Dictionary.join(configKey, t_1), true)
		end,
		refreshFromApi = function(p14)
			-- upvalues: t (ref), sduiLogger (copy), sduiErrors (copy), promiseModule (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), cryoModule (copy), fFlagSduiPaginatePostBody (copy), fetchIfNeeded (ref)
			local configKey = t[p14.configKey]
			
			if not configKey then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, { message = `No requestData for refresh: {p14.configKey}` }, "unknown")
				
				return promiseModule.resolve()
			elseif fFlagSduiApiStoreOnSuccessAndRefresh and configKey.refresh then
				return configKey.refresh(p14.loadTimer)
			end
			local t_1 = {
				url = (if configKey.buildRefreshUrl then configKey.buildRefreshUrl() else nil) or configKey.url,
				loadTimer = p14.loadTimer,
				isPaginated = cryoModule.None
			}
			
			if fFlagSduiPaginatePostBody and configKey.postConfig then
				local var29 = if configKey.buildRefreshPostBody then configKey.buildRefreshPostBody() else nil
				
				if var29 then
					t_1.postConfig = cryoModule.Dictionary.join(configKey.postConfig, { body = var29 })
				end
			end
			return fetchIfNeeded(cryoModule.Dictionary.join(configKey, t_1), true)
		end
	}
end