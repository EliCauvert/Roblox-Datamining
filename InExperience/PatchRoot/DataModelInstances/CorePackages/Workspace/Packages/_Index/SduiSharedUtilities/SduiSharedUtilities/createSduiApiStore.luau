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
local getLocalPlayerUserId = dataHydrationModule.DataHydrationUtils.getLocalPlayerUserId
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
local fFlagSduiAlwaysCacheWithIdentifier = require(parent.SharedFlags).FFlagSduiAlwaysCacheWithIdentifier
local fFlagLuaAppSduiStreamingChunkedResponses = require(parent.SharedFlags).FFlagLuaAppSduiStreamingChunkedResponses
local fFlagSduiDismissPromptAction = require(parent.SharedFlags).FFlagSduiDismissPromptAction
local fFlagSduiApiStoreExposeGetInputData = require(parent.SharedFlags).FFlagSduiApiStoreExposeGetInputData
local fFlagAppChatConversationTrustedFriendUpsellBanner = require(parent.SharedFlags).FFlagAppChatConversationTrustedFriendUpsellBanner
local fFlagSduiApiStoreOnSuccessAndRefresh = require(parent.SharedFlags).FFlagSduiApiStoreOnSuccessAndRefresh
local fFlagSduiUseHttpClientModule = require(sduiSharedUtilities.Flags.FFlagSduiUseHttpClient)
local fFlagSduiRequestCountersModule = require(sduiSharedUtilities.Flags.FFlagSduiRequestCounters)
local fFlagSduiMrRouterHeadersModule = require(sduiSharedUtilities.Flags.FFlagSduiMrRouterHeaders)
local fFlagSduiClientDrivenTemplates = require(parent.SharedFlags).FFlagSduiClientDrivenTemplates
local fFlagLuaAppSduiHomePageSupport = require(parent.SharedFlags).FFlagLuaAppSduiHomePageSupport
local fFlagHomeSduiOfflineCache = require(parent.SharedFlags).FFlagHomeSduiOfflineCache
local fFlagLuaAppEnableSduiHomePage = require(parent.SharedFlags).FFlagLuaAppEnableSduiHomePage
local fFlagSduiStreamingRefreshReplacesInputData = require(parent.SharedFlags).FFlagSduiStreamingRefreshReplacesInputData
local fFlagDataHydrationAccountReset = require(parent.SharedFlags).FFlagDataHydrationAccountReset
local fFlagHomePageRefetchOnDataHydrationAccountReset = require(parent.SharedFlags).FFlagHomePageRefetchOnDataHydrationAccountReset
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

local _ = function(p1, p2, p3)
	-- upvalues: sduiPageAnalyticsModule (ref)
	if p1.isCurrentRequest(p2.accountPlayerId, p2.accountGeneration) then
		return false
	end
	sduiPageAnalyticsModule.sendStaleResponseDiscarded(p2.surfaceKey, if p2.enableStreaming then "streaming" else "buffered", p3)
	
	return true
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
	-- upvalues: createDataCache (ref), fFlagDataHydrationAccountReset (ref), fFlagLuaAppEnableSduiHomePage (ref), fFlagSduiApiStoreOnSuccessAndRefresh (ref), signalsModule (ref), promiseModule (ref), fFlagSduiRequestCountersModule (ref), getSduiRequestEndpointForCounters (ref), fFlagSduiProtobufJsonDecode (ref), sduiResponseType (ref), fFlagLuaAppSduiStreamingChunkedResponses (ref), makeProtobufJsonResponseDecoder (ref), makeProtoResponseDecoder (ref), fFlagSduiStreamingRefreshReplacesInputData (ref), handleSduiApiResponseModule (ref), sduiProtobufResponseHelpersModule (ref), fFlagSduiClientDrivenTemplates (ref), fFlagSduiAllowNoConfigsBuilt (ref), fFlagHomeSduiOfflineCache (ref), sduiLogger (ref), sduiErrors (ref), sduiParseHelpers (ref), sduiRequestStatus (ref), createSduiStreamingResponseHandlerModule (ref), fFlagHomePageRefetchOnDataHydrationAccountReset (ref), sduiPageAnalyticsModule (ref), fFlagSduiUseHttpClientModule (ref), accumulateSduiCacheSubEntriesModule (ref), sduiEnableClearOnEmptyResponse (ref), cryoModule (ref), sduiApiStorePostConfigModule (ref), sduiRetryPolicyModule (ref), sduiPageRequestPriority (ref), sendSduiHttpRequestModule (ref), httpService (ref), fFlagSduiMrRouterHeadersModule (ref), buildSduiRequestHeadersModule (ref), createDataResolver (ref), sduiRequestConcurrencyPolicy (ref), getLocalPlayerUserId (ref), resolveSduiCacheEntryModule (ref), fFlagSduiAlwaysCacheWithIdentifier (ref), fFlagAppChatConversationTrustedFriendUpsellBanner (ref), fFlagSduiDismissPromptAction (ref), fFlagSduiApiStoreExposeGetInputData (ref), fFlagLuaAppSduiHomePageSupport (ref)
	local var1 = createDataCache(nil, nil, if fFlagDataHydrationAccountReset then { observeLocalUser = false } else nil)
	local t = {}
	local var2 = if fFlagLuaAppEnableSduiHomePage then {} else nil
	local t_1 = {}
	local t_2 = {}
	
	local function completeActiveRequest(p3, p4, p5, p6)
		-- upvalues: t_2 (write), fFlagSduiApiStoreOnSuccessAndRefresh (copy), t (write)
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
		-- upvalues: t_2 (write), t_1 (write)
		return if t_2[p3] == nil then t_1[p3] == true else true
	end
	
	local t_3 = {}
	local var3 = nil
	
	local function getInputDataSignals(value)
		-- upvalues: t_3 (write), signalsModule (copy)
		local var4 = t_3[value]
		
		if var4 == nil then
			local var5, var6 = signalsModule.createSignal(nil)
			var4 = { get = var5, set = var6 }
			t_3[value] = var4
		end
		return var4
	end
	
	local var4 = nil
	
	local function fetchFunction(p3, p4, p5, p6)
		-- upvalues: fFlagLuaAppEnableSduiHomePage (copy), t (write), promiseModule (copy), completeActiveRequest (ref), fFlagSduiApiStoreOnSuccessAndRefresh (copy), fFlagSduiRequestCountersModule (copy), getSduiRequestEndpointForCounters (copy), fFlagSduiProtobufJsonDecode (copy), sduiResponseType (copy), fFlagLuaAppSduiStreamingChunkedResponses (copy), makeProtobufJsonResponseDecoder (copy), makeProtoResponseDecoder (copy), fFlagSduiStreamingRefreshReplacesInputData (copy), handleSduiApiResponseModule (copy), sduiProtobufResponseHelpersModule (copy), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (ref), fFlagSduiAllowNoConfigsBuilt (copy), fFlagHomeSduiOfflineCache (copy), sduiLogger (copy), sduiErrors (copy), sduiParseHelpers (copy), var4 (write), sduiRequestStatus (copy), createSduiStreamingResponseHandlerModule (copy), fFlagHomePageRefetchOnDataHydrationAccountReset (copy), var3 (write), sduiPageAnalyticsModule (copy), fFlagSduiUseHttpClientModule (copy), accumulateSduiCacheSubEntriesModule (copy), var1 (ref), t_1 (write), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy), sduiApiStorePostConfigModule (copy), sduiRetryPolicyModule (copy), p2 (ref), sduiPageRequestPriority (copy), sendSduiHttpRequestModule (copy), httpService (copy), fFlagSduiMrRouterHeadersModule (copy), buildSduiRequestHeadersModule (copy)
		local var5 = fFlagLuaAppEnableSduiHomePage and p5 ~= nil
		local var6 = if fFlagLuaAppEnableSduiHomePage and var5 then p5 else t[p3]
		
		if not var6 then
			return promiseModule.reject("No request config for key", p3)
		end
		local var7 = if fFlagLuaAppEnableSduiHomePage and var5 then function(_, p7, p8, p9)
			-- upvalues: fFlagSduiApiStoreOnSuccessAndRefresh (copy), var6 (ref)
			if p7 and fFlagSduiApiStoreOnSuccessAndRefresh and var6.onSuccess then
				var6.onSuccess(p8, p9)
			end
		end else completeActiveRequest
		local url = var6.url
		local var8 = if fFlagSduiRequestCountersModule then getSduiRequestEndpointForCounters(url) else ""
		local loadTimer = var6.loadTimer
		loadTimer.logUiRequestSent()
		local var9 = fFlagSduiProtobufJsonDecode and var6.responseType == sduiResponseType.ProtobufJson
		local postConfig = var6.postConfig
		local var10 = if postConfig then "POST" else "GET"
		local var11 = if fFlagLuaAppSduiStreamingChunkedResponses then var6.enableStreaming else nil
		local var12 = if var9 then makeProtobufJsonResponseDecoder(var6.apiProto) else makeProtoResponseDecoder(var6.apiProto)
		local var13 = if fFlagSduiStreamingRefreshReplacesInputData then var6.enableInputDataMerge else nil
		
		local function processSduiResponse(p7)
			-- upvalues: var6 (ref), p4 (ref), fFlagLuaAppEnableSduiHomePage (copy), fFlagSduiStreamingRefreshReplacesInputData (copy), var13 (write), fFlagLuaAppSduiStreamingChunkedResponses (copy), var11 (ref), handleSduiApiResponseModule (copy), loadTimer (ref), var12 (ref), sduiProtobufResponseHelpersModule (copy), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (copy), fFlagSduiAllowNoConfigsBuilt (copy)
			local var14 = var6.isPaginated and p4.data(false) ~= nil
			local var15 = nil
			
			if fFlagLuaAppEnableSduiHomePage or fFlagSduiStreamingRefreshReplacesInputData then
				if var13 == nil then
					local var16
					if fFlagLuaAppSduiStreamingChunkedResponses then
						var16 = var11
						
						if not var16 then
							var16 = var6.enableInputDataMerge or nil
						end
						var15 = var16
					end
				else
					var15 = var13
				end
			end
			local var17, var18 = handleSduiApiResponseModule({
				response = p7,
				loadTimer = loadTimer,
				surfaceKey = var6.surfaceKey,
				configCacheKey = var6.configKey,
				decodeResponse = var12,
				parseHydrationDataFromResponse = sduiProtobufResponseHelpersModule.parseHydrationDataFromResponse,
				parseTemplateEntriesFromResponse = if fFlagSduiClientDrivenTemplates then var6.parseTemplateEntriesFromResponse or sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse else sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse,
				parsePageEntriesFromResponse = if fFlagSduiClientDrivenTemplates then var6.parsePageEntriesFromResponse or sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse else sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse,
				parseLocalizedLiteralsFromResponse = if fFlagSduiClientDrivenTemplates then var6.parseLocalizedLiteralsFromResponse or sduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse else nil,
				getInputDataSignalsForRequest = getInputDataSignals,
				enableStreamingMerge = if fFlagLuaAppSduiStreamingChunkedResponses then var11 else nil,
				enableInputDataMerge = var15,
				paginateResponse = var14,
				buildNextPageUrl = var6.buildNextPageUrl,
				buildNextPagePostBody = var6.buildNextPagePostBody,
				allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then var6.allowNoConfigsBuilt else nil,
				mergeStrategy = var6.mergeStrategy,
				cacheSingleEntryWithIdentifier = if fFlagLuaAppEnableSduiHomePage then var6.cacheSingleEntryWithIdentifier else nil,
				enableTemplateCache = var6.enableTemplateCache
			})
			
			if fFlagSduiStreamingRefreshReplacesInputData then
				var13 = nil
			end
			return var17, var18
		end
		
		local var14 = if fFlagHomeSduiOfflineCache then function(p7)
			-- upvalues: var6 (ref), p4 (ref), sduiLogger (copy), sduiErrors (copy), sduiParseHelpers (copy), var4 (copy), p3 (ref), loadTimer (ref), sduiRequestStatus (copy)
			local recoverFromError = var6.recoverFromError
			
			if recoverFromError == nil then
				return nil
			end
			local var15 = p4.data(false)
			
			if type(var15) == "table" and next(var15) ~= nil then
				return var15
			end
			local function _(p8)
				-- upvalues: sduiLogger (copy), sduiErrors (copy), var6 (copy)
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToApplyFallbackResponse, { message = p8, name = var6.surfaceKey }, var6.surfaceKey)
			end
			
			local ok, status = pcall(recoverFromError.getDecodedResponse, p7)
			
			if not ok then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToApplyFallbackResponse, {
					message = `recovery errored: {sduiParseHelpers.stringifyValue(status)}`,
					name = var6.surfaceKey
				}, var6.surfaceKey)
				
				return nil
			elseif status == nil then
				return nil
			end
			local ok_1, status_1 = pcall(var4, {
				surfaceKey = var6.surfaceKey,
				configKey = p3,
				decodedResponse = status,
				loadTimer = loadTimer,
				apiProto = var6.apiProto,
				requestConfig = var6
			})
			
			if not ok_1 then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToApplyFallbackResponse, {
					message = `recovery errored: {sduiParseHelpers.stringifyValue(status_1)}`,
					name = var6.surfaceKey
				}, var6.surfaceKey)
				
				return nil
			end
			local var16 = p4.data(false)
			
			if type(var16) ~= "table" or next(var16) == nil then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToApplyFallbackResponse, {
					message = "recovery built no configs",
					name = var6.surfaceKey
				}, var6.surfaceKey)
				
				return nil
			end
			loadTimer.updateRequestStatus(sduiRequestStatus.LoadedFromCache)
			
			if recoverFromError.onApplied ~= nil then
				recoverFromError.onApplied()
			end
			return var16
		end else nil
		local var15 = nil
		local var16 = if fFlagLuaAppSduiStreamingChunkedResponses and var11 then createSduiStreamingResponseHandlerModule({
			configKey = p3,
			loadTimer = loadTimer,
			processFrame = function(p7)
				-- upvalues: fFlagHomePageRefetchOnDataHydrationAccountReset (copy), var3 (copy), var6 (ref), sduiPageAnalyticsModule (copy), p4 (ref), fFlagLuaAppEnableSduiHomePage (copy), p6 (ref), processSduiResponse (ref), fFlagSduiUseHttpClientModule (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var15 (write), accumulateSduiCacheSubEntriesModule (copy), var1 (copy), p3 (ref)
				if fFlagHomePageRefetchOnDataHydrationAccountReset then
					local var17
					local var18 = var6
					
					if var3.isCurrentRequest(var18.accountPlayerId, var18.accountGeneration) then
						var17 = false
					else
						sduiPageAnalyticsModule.sendStaleResponseDiscarded(var18.surfaceKey, if var18.enableStreaming then "streaming" else "buffered", "streamFrame")
						var17 = true
					end
					local var19
					if var17 then
						return true, p4.data(false)
					elseif fFlagLuaAppEnableSduiHomePage then
						local var20
						local var21 = var6
						var19 = p6
						
						if var19 ~= nil then
							var20 = var19()
							
							if var20 then
								var20 = if var21.isResponseCurrent ~= nil then var21.isResponseCurrent() else true
							end
							if not var20 then
								return true, p4.data(false)
							end
						end
					end
					ok, status, var77 = pcall(processSduiResponse, if fFlagSduiUseHttpClientModule then {
						statusCode = 200,
						responseBody = buffer.fromstring(p7),
						stats = {}
					} else { Stats = {}, Body = buffer.fromstring(p7) })
					
					if not ok then
						return false, status
					elseif fFlagSduiApiStoreOnSuccessAndRefresh then
						var15 = var19
					end
					local var22 = accumulateSduiCacheSubEntriesModule(status, p4.data(false))
					var1.updateItems({ [p3] = var22 })
					
					return true, var22
				end
			end
		}) else nil
		
		local function createRequestPromise(p7)
			-- upvalues: promiseModule (copy), fFlagHomeSduiOfflineCache (copy), fFlagSduiRequestCountersModule (copy), sduiPageAnalyticsModule (copy), var6 (ref), var8 (ref), var14 (write), fFlagLuaAppEnableSduiHomePage (copy), var7 (write), completeActiveRequest (copy), p3 (ref), fFlagHomePageRefetchOnDataHydrationAccountReset (copy), var3 (copy), loadTimer (ref), var5 (ref), t_1 (copy), fFlagSduiUseHttpClientModule (copy), sduiRequestStatus (copy), p6 (ref), var16 (ref), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var15 (write), sduiParseHelpers (copy), sduiLogger (copy), sduiErrors (copy), processSduiResponse (ref), url (ref), p4 (ref), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
			return promiseModule.new(function(p8, p9, p10)
				-- upvalues: fFlagHomeSduiOfflineCache (copy), fFlagSduiRequestCountersModule (copy), sduiPageAnalyticsModule (copy), var6 (copy), var8 (copy), var14 (copy), fFlagLuaAppEnableSduiHomePage (copy), var7 (copy), completeActiveRequest (copy), p3 (copy), p7 (ref), fFlagHomePageRefetchOnDataHydrationAccountReset (copy), var3 (copy), loadTimer (copy), var5 (copy), t_1 (copy), fFlagSduiUseHttpClientModule (copy), sduiRequestStatus (copy), p6 (copy), var16 (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var15 (copy), sduiParseHelpers (copy), sduiLogger (copy), sduiErrors (copy), processSduiResponse (copy), url (copy), p4 (copy), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
				local var17 = if fFlagHomeSduiOfflineCache then p8 else nil
				local var18 = nil
				local var19 = nil
				
				if fFlagSduiRequestCountersModule then
					local var20 = p8
					local var21 = p9
					
					p8 = function(p11)
						-- upvalues: sduiPageAnalyticsModule (copy), var6 (copy), var8 (copy), var18 (write), var19 (write), var20 (ref)
						sduiPageAnalyticsModule.sendRequestOutcomeCounter(var6.surfaceKey, var8, "success", var18, var19)
						
						return var20(p11)
					end
					
					p9 = function(p11)
						-- upvalues: sduiPageAnalyticsModule (copy), var6 (copy), var8 (copy), var18 (write), var19 (write), var21 (ref)
						sduiPageAnalyticsModule.sendRequestOutcomeCounter(var6.surfaceKey, var8, "failure", var18, var19)
						
						return var21(p11)
					end
				end
				local var22 = if fFlagHomeSduiOfflineCache then function(p11, p12)
					-- upvalues: var14 (copy), fFlagSduiRequestCountersModule (copy), sduiPageAnalyticsModule (copy), var6 (copy), var8 (copy), var18 (write), var19 (write), var17 (write), fFlagLuaAppEnableSduiHomePage (copy), var7 (copy), completeActiveRequest (copy), p3 (copy), p9 (write)
					local var23 = var14(p11)
					
					if var23 == nil then
						(if fFlagLuaAppEnableSduiHomePage then var7 else completeActiveRequest)(p3, false, p11)
						
						return p9(if p12 ~= nil then p11 else p12)
					elseif fFlagSduiRequestCountersModule then
						sduiPageAnalyticsModule.sendRequestOutcomeCounter(var6.surfaceKey, var8, "failure", var18, var19)
					end
					var17(var23)
					
					return (if fFlagLuaAppEnableSduiHomePage then var7 else completeActiveRequest)(p3, false, p11)
				end else nil
				local var23 = p7(function(p11, p12)
					-- upvalues: fFlagHomePageRefetchOnDataHydrationAccountReset (copy), var3 (copy), var6 (copy), sduiPageAnalyticsModule (copy), p8 (ref), loadTimer (copy), fFlagLuaAppEnableSduiHomePage (copy), var5 (copy), t_1 (copy), p3 (copy), fFlagSduiUseHttpClientModule (copy), fFlagSduiRequestCountersModule (copy), var18 (write), var19 (write), sduiRequestStatus (copy), p6 (copy), p8 (write), fFlagHomeSduiOfflineCache (copy), var22 (write), var7 (copy), completeActiveRequest (copy), p9 (write), var16 (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var15 (copy), sduiParseHelpers (copy), sduiLogger (copy), sduiErrors (copy), processSduiResponse (copy), url (copy), p4 (copy), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
					if fFlagHomePageRefetchOnDataHydrationAccountReset then
						local var24
						local var25 = var6
						
						if var3.isCurrentRequest(var25.accountPlayerId, var25.accountGeneration) then
							var24 = false
						else
							sduiPageAnalyticsModule.sendStaleResponseDiscarded(var25.surfaceKey, if var25.enableStreaming then "streaming" else "buffered", "response")
							var24 = true
						end
						if var24 then
							return p8(nil)
						end
					end
					loadTimer.logUiResponseReceived()
					
					if not fFlagLuaAppEnableSduiHomePage or not var5 then
						t_1[p3] = false
					end
					local var26, var27
					sduiPageAnalyticsModule.sendPageStatusEvent(var6.surfaceKey, if fFlagSduiUseHttpClientModule then p12.statusCode else p12.StatusCode, if fFlagSduiUseHttpClientModule then p12.httpError else p12.HttpError)
					
					if fFlagSduiRequestCountersModule then
						var18 = if fFlagSduiUseHttpClientModule then p12.statusCode else p12.StatusCode
						var19 = if fFlagSduiUseHttpClientModule then p12.httpError else p12.HttpError
					end
					if p11 then
						local var28
						local var29 = if fFlagSduiUseHttpClientModule then p12.statusCode else p12.StatusCode
						var26 = if fFlagSduiUseHttpClientModule then p12.httpError else p12.HttpError
						var27 = if var29 then tonumber(var29) else nil
						
						if fFlagSduiUseHttpClientModule then
							var28 = p12.wasTransportFailure == true
							var28 = nil
						else
							var28 = false
						end
						local status
						if var27 and var27 >= 400 or var26 and var26 ~= Enum.HttpError.OK or var28 then
							loadTimer.updateRequestStatus(sduiRequestStatus.FailedToLoad)
							
							if fFlagLuaAppEnableSduiHomePage then
								local var30
								local var31 = var6
								status = p6
								
								if status ~= nil then
									var30 = status()
									
									if var30 then
										var30 = if var31.isResponseCurrent ~= nil then var31.isResponseCurrent() else true
									end
									if not var30 then
										return p8(nil)
									elseif fFlagHomeSduiOfflineCache then
										return var22(p12)
									end;
									(if fFlagLuaAppEnableSduiHomePage then var7 else completeActiveRequest)(p3, false, p12)
									
									return p9(p12)
								end
							end
						else
							loadTimer.updateRequestStatus(sduiRequestStatus.LoadedFromNetwork)
							
							if fFlagLuaAppEnableSduiHomePage then
								local var32
								local var33 = var6
								status = p6
								
								if status ~= nil then
									var32 = status()
									
									if var32 then
										var32 = if var33.isResponseCurrent ~= nil then var33.isResponseCurrent() else true
									end
									if not var32 then
										return p8(nil)
									end
								end
							end
							local var34 = if fFlagSduiUseHttpClientModule then p12.responseBody else p12.Body
							sduiPageAnalyticsModule.sendPagePayloadSizeEvent(var6.surfaceKey, var34)
							
							if var16 then
								local var35 = var16.finalize(var34)
								
								if var35.ok then
									(if fFlagLuaAppEnableSduiHomePage then var7 else completeActiveRequest)(p3, true, var35.value, if fFlagSduiApiStoreOnSuccessAndRefresh then var15 else nil)
									
									return p8(var35.value)
								end
								sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
									message = sduiParseHelpers.stringifyValue(var35.value),
									name = var6.surfaceKey
								}, var6.surfaceKey)
								loadTimer.updateRequestStatus(sduiRequestStatus.FailedToLoad)
								
								if fFlagHomeSduiOfflineCache then
									return var22(var35.value)
								end;
								(if fFlagLuaAppEnableSduiHomePage then var7 else completeActiveRequest)(p3, false, var35.value)
								
								return p9(var35.value)
							else
								ok, status, var100 = pcall(processSduiResponse, p12)
								
								if ok then
									local t = {}
									
									if not sduiEnableClearOnEmptyResponse then
										local var36 = p4.data(false)
										
										for i, v in status do
											local var37 = var36 and var36[i]
											t[i] = if var37 then cryoModule.Dictionary.join(var37, v) else v
										end
									elseif next(status) then
										local var38 = p4.data(false)
										
										for i, v in status do
											local var39 = var38 and var38[i]
											t[i] = if var39 then cryoModule.Dictionary.join(var39, v) else v
										end
									elseif var6.clearOnEmptyResponse and var6.configKey then
										t[var6.configKey] = {}
									end;
									(if fFlagLuaAppEnableSduiHomePage then var7 else completeActiveRequest)(p3, true, t, if fFlagSduiApiStoreOnSuccessAndRefresh then var100 else nil)
									
									return p8(t)
								else
									sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
										message = `handleSduiApiResponse not successful for {url} err {sduiParseHelpers.stringifyValue(status)}`,
										name = var6.surfaceKey
									}, var6.surfaceKey)
									
									if fFlagHomeSduiOfflineCache then
										return var22(status, p4)
									end;
									(if fFlagLuaAppEnableSduiHomePage then var7 else completeActiveRequest)(p3, false, status)
									
									return p9(p4)
								end
							end
						end
					elseif fFlagLuaAppEnableSduiHomePage then
						local var40
						var26 = var6
						var27 = p6
						
						if var27 ~= nil then
							var40 = var27()
							
							if var40 then
								var40 = if var26.isResponseCurrent ~= nil then var26.isResponseCurrent() else true
							end
							if not var40 then
								return p8(nil)
							elseif fFlagHomeSduiOfflineCache then
								return var22(p12)
							end;
							(if fFlagLuaAppEnableSduiHomePage then var7 else completeActiveRequest)(p3, false, p12)
							
							return p9(p12)
						end
					end
				end)
				
				if var23 ~= nil then
					p10(var23)
				end
			end)
		end
		
		if not fFlagSduiUseHttpClientModule then
			return createRequestPromise(function(p13)
				-- upvalues: httpService (copy), url (ref), var10 (ref), fFlagSduiMrRouterHeadersModule (copy), buildSduiRequestHeadersModule (copy), var9 (ref), postConfig (ref), sduiApiStorePostConfigModule (copy), var16 (ref), sduiPageRequestPriority (copy)
				httpService:RequestInternal({
					Url = url,
					Method = var10,
					Headers = if fFlagSduiMrRouterHeadersModule then buildSduiRequestHeadersModule(if var9 then "application/json" else "application/x-protobuf", if postConfig then sduiApiStorePostConfigModule.getContentTypeHeaderFromPostConfig(postConfig) else nil) else {
						Accept = if var9 then "application/json" else "application/x-protobuf",
						["Content-Type"] = if postConfig then sduiApiStorePostConfigModule.getContentTypeHeaderFromPostConfig(postConfig) else nil
					},
					Body = if postConfig then sduiApiStorePostConfigModule.getBodyFromPostConfig(postConfig) else nil,
					OnMessage = if var16 then var16.handleChunk else nil,
					Priority = sduiPageRequestPriority
				}):Start(p13)
				
				return nil
			end)
		end
		local var41 = if postConfig then sduiApiStorePostConfigModule.getBodyFromPostConfig(postConfig) else nil
		local var42 = if postConfig then sduiApiStorePostConfigModule.getContentTypeHeaderFromPostConfig(postConfig) else nil
		local var43 = sduiRetryPolicyModule.resolve(var6.retry)
		
		if fFlagSduiRequestCountersModule and var43 ~= nil then
			local onRetry = var43.onRetry
			var43 = cryoModule.Dictionary.join(var43, {
				onRetry = function(p13)
					-- upvalues: onRetry (ref), sduiPageAnalyticsModule (copy), var6 (ref), var8 (ref)
					if onRetry ~= nil then
						onRetry(p13)
					end
					sduiPageAnalyticsModule.sendRequestRetryCounter(var6.surfaceKey, var8, p13)
				end
			})
		end
		local t_2 = {
			url = url,
			method = var10,
			body = var41,
			contentType = var42,
			accept = if var9 then "application/json" else "application/x-protobuf",
			analyticsKey = var6.surfaceKey,
			priority = sduiPageRequestPriority,
			retry = var43,
			deadlineSec = if p2 and p2.requestDeadlineSec then p2.requestDeadlineSec else sduiRetryPolicyModule.getRequestDeadlineSec(),
			network = if p2 then p2.network else nil,
			delivery = if var16 then { mode = "streaming", onMessage = var16.handleChunk } else { mode = "buffered" }
		}
		
		return createRequestPromise(function(p13)
			-- upvalues: sendSduiHttpRequestModule (copy), t_2 (ref)
			local var44 = sendSduiHttpRequestModule(t_2)
			var44:andThen(function(p14)
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
				-- upvalues: var44 (ref)
				var44:cancel()
			end
		end)
	end
	
	var3 = createDataResolver({
		queueProcessDelaySec = 0,
		supportsMultiGet = false,
		cache = var1,
		fetchFn = fetchFunction,
		requestTimeoutSec = if fFlagSduiUseHttpClientModule then sduiRetryPolicyModule.getFetchTimeoutSec() else nil,
		onBeforeClear = if fFlagHomePageRefetchOnDataHydrationAccountReset then function()
			-- upvalues: t_2 (write), t_1 (write), t (write), var2 (write), t_3 (write)
			t_2 = {}
			t_1 = {}
			t = {}
			
			if var2 ~= nil then
				var2 = {}
			end
			for i, v in t_3 do
				v.set(nil)
			end
			t_3 = {}
			
			for i, v_1 in t_2 do
				v_1.resolve(nil)
			end
		end else nil
	})
	
	local function fetchIfNeeded(p11, p12)
		-- upvalues: fFlagSduiProtobufJsonDecode (copy), sduiResponseType (copy), fFlagLuaAppEnableSduiHomePage (copy), sduiRequestConcurrencyPolicy (copy), fFlagHomePageRefetchOnDataHydrationAccountReset (copy), var3 (write), getLocalPlayerUserId (copy), var2 (write), fetchFunction (ref), sduiPageAnalyticsModule (copy), var1 (ref), t (write), t_2 (write), promiseModule (copy)
		if fFlagSduiProtobufJsonDecode and p11.responseType == nil then
			p11.responseType = sduiResponseType.Protobuf
		end
		local configKey = p11.configKey or p11.url
		local var24 = fFlagLuaAppEnableSduiHomePage and p11.concurrencyPolicy == sduiRequestConcurrencyPolicy.LatestWins
		p11.configKey = configKey
		p11.loadTimer.logUiRequestQueued()
		
		if fFlagHomePageRefetchOnDataHydrationAccountReset then
			p11.accountGeneration = var3.getAccountGeneration(false)
			p11.accountPlayerId = getLocalPlayerUserId()
		end
		if fFlagLuaAppEnableSduiHomePage and var24 then
			local concurrencyKey = p11.concurrencyKey or configKey
			local var25 = var2
			local var26 = (var25[concurrencyKey] or 0) + 1
			var25[concurrencyKey] = var26
			
			return fetchFunction(configKey, var3.getCachedItem(configKey), p11, function()
				-- upvalues: var25 (ref), concurrencyKey (ref), var26 (ref)
				return var25[concurrencyKey] == var26
			end):andThen(function(p13)
				-- upvalues: fFlagHomePageRefetchOnDataHydrationAccountReset (copy), var3 (copy), p11 (ref), sduiPageAnalyticsModule (copy), var1 (copy), configKey (ref)
				if fFlagHomePageRefetchOnDataHydrationAccountReset and p13 ~= nil then
					local var27
					local var28 = p11
					
					if var3.isCurrentRequest(var28.accountPlayerId, var28.accountGeneration) then
						var27 = false
					else
						sduiPageAnalyticsModule.sendStaleResponseDiscarded(var28.surfaceKey, if var28.enableStreaming then "streaming" else "buffered", "cacheCommit")
						var27 = true
					end
					if var27 then
						return nil
					elseif p13 ~= nil and not p11.enableInputDataMerge then
						var1.updateItems({ [configKey] = p13 })
					end
					return p13
				end
			end)
		end
		t[configKey] = p11
		local _, andFetchItem = var3.getAndFetchItem(configKey, if p12 then function()
			return true
		end else nil, p11.staleTimeSec)
		
		if not andFetchItem then
			return promiseModule.resolve()
		elseif not t_2[configKey] then
			local var27 = nil
			local var28 = nil
			local var29 = promiseModule.new(function(p13, p14)
				-- upvalues: var27 (write), var28 (write)
				var27 = p13
				var28 = p14
			end)
			var29:catch(function(_) end)
			t_2[configKey] = { promise = var29, resolve = var27, reject = var28 }
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
			-- upvalues: t (write), var3 (write), var1 (ref)
			local t_1 = {}
			
			if typeof(p11) ~= "string" or p11 == "" then
				return t_1
			end
			for i in t do
				local var24 = var3.getCachedItem(i).data(false)
				
				if var24 then
					local var25 = false
					local t_2 = {}
					
					for i_1, v in var24 do
						if v and v.category ~= nil and v.title == p11 then
							var25 = true
						else
							t_2[i_1] = v
						end
					end
					if var25 then
						var1.replaceItems({ [i] = t_2 })
						table.insert(t_1, i)
					end
				end
			end
			return t_1
		end else nil,
		seedFromDecodedResponse = function(p12)
			-- upvalues: fFlagHomeSduiOfflineCache (copy), t (write), sduiResponseType (copy), var3 (write), handleSduiApiResponseModule (copy), fFlagSduiUseHttpClientModule (copy), sduiProtobufResponseHelpersModule (copy), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (ref), fFlagSduiAllowNoConfigsBuilt (copy), sduiLogger (copy), sduiErrors (copy), sduiParseHelpers (copy), fFlagAppChatConversationTrustedFriendUpsellBanner (copy), var1 (ref), accumulateSduiCacheSubEntriesModule (copy)
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
			local var26 = if fFlagHomeSduiOfflineCache then p12.requestConfig else nil
			local var27 = var3.getCachedItem(configKey).data(false)
			local ok, status = pcall(function()
				-- upvalues: handleSduiApiResponseModule (copy), fFlagSduiUseHttpClientModule (copy), p12 (ref), loadTimer (ref), configKey (ref), sduiProtobufResponseHelpersModule (copy), fFlagHomeSduiOfflineCache (copy), var26 (ref), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (copy), fFlagSduiAllowNoConfigsBuilt (copy)
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
					parseTemplateEntriesFromResponse = if fFlagHomeSduiOfflineCache and var26 ~= nil and fFlagSduiClientDrivenTemplates then var26.parseTemplateEntriesFromResponse or sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse else sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse,
					parsePageEntriesFromResponse = if fFlagHomeSduiOfflineCache and var26 ~= nil and fFlagSduiClientDrivenTemplates then var26.parsePageEntriesFromResponse or sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse else sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse,
					parseLocalizedLiteralsFromResponse = if not fFlagSduiClientDrivenTemplates then if fFlagHomeSduiOfflineCache and var26 ~= nil then var26.parseLocalizedLiteralsFromResponse or sduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse else sduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse else nil,
					getInputDataSignalsForRequest = getInputDataSignals,
					allowNoConfigsBuilt = if fFlagHomeSduiOfflineCache and var26 ~= nil and fFlagSduiAllowNoConfigsBuilt then var26.allowNoConfigsBuilt else nil,
					mergeStrategy = if fFlagHomeSduiOfflineCache and var26 ~= nil then var26.mergeStrategy else nil,
					enableTemplateCache = if fFlagHomeSduiOfflineCache and var26 ~= nil then var26.enableTemplateCache else nil
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
				[configKey] = accumulateSduiCacheSubEntriesModule(status, var27)
			})
		end,
		getData = var3.getCachedItem,
		getInputData = if fFlagSduiApiStoreExposeGetInputData or fFlagLuaAppSduiHomePageSupport then function(p13, p14, p15)
			-- upvalues: resolveSduiCacheEntryModule (copy), t_3 (write)
			local var28 = resolveSduiCacheEntryModule(t_3, p13, if p14 and p14 ~= "" then `{p13}_{p14}` else nil)
			
			return if var28 == nil then nil else var28.get(if p15 == nil then false else p15)
		end else nil,
		getRootConfig = function(p13, p14, p15)
			-- upvalues: var3 (write), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var28 = var3.getCachedItem(p13).data(p14)
			local var29 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var28, p13, p15) else var28 and var28[p15 or p13]
			
			return if var29 then var29.config else nil
		end,
		getTitle = function(p13, p14, p15)
			-- upvalues: var3 (write), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var28 = var3.getCachedItem(p13).data(p14)
			local var29 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var28, p13, p15) else var28 and var28[p15 or p13]
			
			return if var29 and var29.title ~= "" then var29.title else nil
		end,
		getDataUpdatedTimestamp = function(p13, p14, p15)
			-- upvalues: var3 (write), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var28 = var3.getCachedItem(p13).data(p14)
			local var29 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var28, p13, p15) else var28 and var28[p15 or p13]
			
			return if var29 then var29.dataUpdatedTimestamp else nil
		end,
		getAccountGeneration = if fFlagHomePageRefetchOnDataHydrationAccountReset then var3.getAccountGeneration else nil,
		getEntrySurfacing = function(p13, p14, p15)
			-- upvalues: var3 (write), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var28 = var3.getCachedItem(p13).data(p15)
			local var29 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var28, p13, p14) else var28 and var28[p14 or p13]
			
			return if var29 then var29.surfacing else nil
		end,
		loadMoreFromApi = function(p13)
			-- upvalues: t (write), sduiLogger (copy), sduiErrors (copy), promiseModule (copy), var3 (write), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy), cryoModule (copy), fetchIfNeeded (ref)
			local configKey = t[p13.configKey]
			
			if not configKey then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToPaginateRequest, { message = `No requestData for {p13.configKey}` }, "unknown")
				
				return promiseModule.resolve()
			end
			local var28
			local var29 = var3.getCachedItem(p13.configKey).data(false)
			
			if fFlagSduiAlwaysCacheWithIdentifier then
				var28 = resolveSduiCacheEntryModule(var29, p13.configKey, p13.identifier)
			else
				var28 = var29
				
				if var28 then
					var28 = var29[p13.identifier or p13.configKey]
				end
			end
			if not var28 then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToPaginateRequest, {
					message = `No entry data for {p13.configKey}`,
					name = configKey.surfaceKey
				}, configKey.surfaceKey)
				
				return promiseModule.resolve()
			end
			local nextPageUrl = var28.nextPageUrl
			
			if not nextPageUrl or nextPageUrl == "" then
				return promiseModule.resolve()
			end
			local t_1 = {
				isPaginated = true,
				url = nextPageUrl,
				loadTimer = p13.loadTimer
			}
			
			if configKey.postConfig and var28.nextPagePostBody then
				t_1.postConfig = cryoModule.Dictionary.join(configKey.postConfig, { body = var28.nextPagePostBody })
			end
			return fetchIfNeeded(cryoModule.Dictionary.join(configKey, t_1), true)
		end,
		refreshFromApi = function(p14)
			-- upvalues: t (write), sduiLogger (copy), sduiErrors (copy), promiseModule (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), cryoModule (copy), fFlagSduiStreamingRefreshReplacesInputData (copy), fetchIfNeeded (ref)
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
			
			if fFlagSduiStreamingRefreshReplacesInputData and not configKey.enableInputDataMerge then
				t_1.enableInputDataMerge = false
			end
			if configKey.postConfig then
				local var30 = if configKey.buildRefreshPostBody then configKey.buildRefreshPostBody() else nil
				
				if var30 then
					t_1.postConfig = cryoModule.Dictionary.join(configKey.postConfig, { body = var30 })
				end
			end
			return fetchIfNeeded(cryoModule.Dictionary.join(configKey, t_1), true)
		end
	}
end