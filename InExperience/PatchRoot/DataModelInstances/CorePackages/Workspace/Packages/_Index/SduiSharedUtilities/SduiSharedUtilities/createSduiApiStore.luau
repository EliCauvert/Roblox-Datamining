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
local _ = require(sduiSharedUtilities.SduiApiRequestConfig)
local createSduiStreamingResponseHandlerModule = require(sduiSharedUtilities.createSduiStreamingResponseHandler)
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
local fFlagSduiClientDrivenTemplates = require(parent.SharedFlags).FFlagSduiClientDrivenTemplates
local sduiPageRequestPriority = game:DefineFastInt("SduiPageRequestPriority", 1)
local resolveSduiCacheEntryModule = require(sduiSharedUtilities.resolveSduiCacheEntry)
local accumulateSduiCacheSubEntriesModule = require(sduiSharedUtilities.accumulateSduiCacheSubEntries)

return function()
	-- upvalues: createDataCache (ref), fFlagSduiApiStoreOnSuccessAndRefresh (ref), signalsModule (ref), promiseModule (ref), fFlagSduiProtobufJsonDecode (ref), sduiResponseType (ref), fFlagSduiConfigFetchTakesPostBody (ref), fFlagLuaAppSduiStreamingChunkedResponses (ref), makeProtobufJsonResponseDecoder (ref), makeProtoResponseDecoder (ref), handleSduiApiResponseModule (ref), sduiProtobufResponseHelpersModule (ref), fFlagSduiClientDrivenTemplates (ref), fFlagSduiPaginatePostBody (ref), fFlagSduiAllowNoConfigsBuilt (ref), fFlagSduiClientTemplateCache (ref), createSduiStreamingResponseHandlerModule (ref), accumulateSduiCacheSubEntriesModule (ref), httpService (ref), sduiApiStorePostConfigModule (ref), sduiPageRequestPriority (ref), sduiPageAnalyticsModule (ref), sduiRequestStatus (ref), sduiParseHelpers (ref), sduiLogger (ref), sduiErrors (ref), sduiEnableClearOnEmptyResponse (ref), cryoModule (ref), createDataResolver (ref), resolveSduiCacheEntryModule (ref), fFlagSduiAlwaysCacheWithIdentifier (ref), fFlagAppChatConversationTrustedFriendUpsellBanner (ref), fFlagSduiDismissPromptAction (ref), fFlagSduiApiStoreExposeGetInputData (ref)
	local var1 = createDataCache()
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	local function _(p1, p2, p3, p4)
		-- upvalues: t_2 (ref), fFlagSduiApiStoreOnSuccessAndRefresh (copy), t (ref)
		local var2 = t_2[p1]
		
		if var2 then
			t_2[p1] = nil
			
			if p2 then
				var2.resolve(p3)
			else
				var2.reject(p3)
			end
		end
		if fFlagSduiApiStoreOnSuccessAndRefresh and p2 then
			local var3 = t[p1]
			
			if var3 and var3.onSuccess then
				var3.onSuccess(p3, p4)
			end
		end
	end
	
	local function isInFlight(p1)
		-- upvalues: t_2 (ref), t_1 (ref)
		return if t_2[p1] == nil then t_1[p1] == true else true
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
		fetchFn = function(p1, p2)
			-- upvalues: t (ref), promiseModule (copy), fFlagSduiProtobufJsonDecode (copy), sduiResponseType (copy), fFlagSduiConfigFetchTakesPostBody (copy), fFlagLuaAppSduiStreamingChunkedResponses (copy), makeProtobufJsonResponseDecoder (copy), makeProtoResponseDecoder (copy), handleSduiApiResponseModule (copy), sduiProtobufResponseHelpersModule (copy), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (ref), fFlagSduiPaginatePostBody (copy), fFlagSduiAllowNoConfigsBuilt (copy), fFlagSduiClientTemplateCache (copy), createSduiStreamingResponseHandlerModule (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), accumulateSduiCacheSubEntriesModule (copy), var1 (ref), httpService (copy), sduiApiStorePostConfigModule (copy), sduiPageRequestPriority (copy), t_1 (ref), sduiPageAnalyticsModule (copy), sduiRequestStatus (copy), t_2 (ref), sduiParseHelpers (copy), sduiLogger (copy), sduiErrors (copy), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
			local var3 = t[p1]
			
			if not var3 then
				return promiseModule.reject("No request config for key", p1)
			end
			local url = var3.url
			local loadTimer = var3.loadTimer
			loadTimer.logUiRequestSent()
			local var4 = fFlagSduiProtobufJsonDecode and var3.responseType == sduiResponseType.ProtobufJson
			local postConfig = var3.postConfig
			local var5 = if fFlagSduiConfigFetchTakesPostBody and postConfig then "POST" else "GET"
			local var6 = if fFlagLuaAppSduiStreamingChunkedResponses then var3.enableStreaming else nil
			local var7 = if var4 then makeProtobufJsonResponseDecoder(var3.apiProto) else makeProtoResponseDecoder(var3.apiProto)
			
			local function processSduiResponse(p3)
				-- upvalues: var3 (ref), p2 (ref), handleSduiApiResponseModule (copy), loadTimer (ref), var7 (ref), sduiProtobufResponseHelpersModule (copy), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (copy), fFlagLuaAppSduiStreamingChunkedResponses (copy), var6 (ref), fFlagSduiPaginatePostBody (copy), fFlagSduiAllowNoConfigsBuilt (copy), fFlagSduiClientTemplateCache (copy)
				return handleSduiApiResponseModule({
					response = p3,
					loadTimer = loadTimer,
					surfaceKey = var3.surfaceKey,
					configCacheKey = var3.configKey,
					decodeResponse = var7,
					parseHydrationDataFromResponse = sduiProtobufResponseHelpersModule.parseHydrationDataFromResponse,
					parseTemplateEntriesFromResponse = if fFlagSduiClientDrivenTemplates then var3.parseTemplateEntriesFromResponse or sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse else sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse,
					parsePageEntriesFromResponse = if fFlagSduiClientDrivenTemplates then var3.parsePageEntriesFromResponse or sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse else sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse,
					parseLocalizedLiteralsFromResponse = if fFlagSduiClientDrivenTemplates then var3.parseLocalizedLiteralsFromResponse or sduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse else nil,
					getInputDataSignalsForRequest = getInputDataSignals,
					enableStreamingMerge = if fFlagLuaAppSduiStreamingChunkedResponses then var6 else nil,
					paginateResponse = var3.isPaginated and p2.data(false) ~= nil,
					buildNextPageUrl = var3.buildNextPageUrl,
					buildNextPagePostBody = if fFlagSduiPaginatePostBody then var3.buildNextPagePostBody else nil,
					allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then var3.allowNoConfigsBuilt else nil,
					mergeStrategy = var3.mergeStrategy,
					enableTemplateCache = if fFlagSduiClientTemplateCache then var3.enableTemplateCache else nil
				})
			end
			
			local var8 = nil
			local var9 = if fFlagLuaAppSduiStreamingChunkedResponses and var6 then createSduiStreamingResponseHandlerModule({
				configKey = p1,
				loadTimer = loadTimer,
				processFrame = function(p3)
					-- upvalues: processSduiResponse (ref), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var8 (write), accumulateSduiCacheSubEntriesModule (copy), p2 (ref), var1 (copy), p1 (ref)
					local ok, status, var10 = pcall(processSduiResponse, { Stats = {}, Body = buffer.fromstring(p3) })
					
					if not ok then
						return false, status
					elseif fFlagSduiApiStoreOnSuccessAndRefresh then
						var8 = var10
					end
					local var11 = accumulateSduiCacheSubEntriesModule(status, p2.data(false))
					var1.updateItems({ [p1] = var11 })
					
					return true, var11
				end
			}) else nil
			local var10 = httpService:RequestInternal({
				Url = url,
				Method = var5,
				Headers = {
					Accept = if var4 then "application/json" else "application/x-protobuf",
					["Content-Type"] = if fFlagSduiConfigFetchTakesPostBody and postConfig then sduiApiStorePostConfigModule.getContentTypeHeaderFromPostConfig(postConfig) else nil
				},
				Body = if fFlagSduiConfigFetchTakesPostBody and postConfig then sduiApiStorePostConfigModule.getBodyFromPostConfig(postConfig) else nil,
				OnMessage = if var9 then var9.handleChunk else nil,
				Priority = sduiPageRequestPriority
			})
			
			return promiseModule.new(function(p3, p4)
				-- upvalues: var10 (ref), loadTimer (ref), t_1 (copy), p1 (ref), sduiPageAnalyticsModule (copy), var3 (ref), sduiRequestStatus (copy), t_2 (copy), var9 (ref), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var8 (write), t (copy), sduiParseHelpers (copy), sduiLogger (copy), sduiErrors (copy), processSduiResponse (ref), url (ref), p2 (ref), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
				var10:Start(function(p5, p6)
					-- upvalues: loadTimer (copy), t_1 (copy), p1 (copy), sduiPageAnalyticsModule (copy), var3 (copy), sduiRequestStatus (copy), t_2 (copy), p4 (ref), var9 (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var8 (copy), t (copy), p3 (ref), sduiParseHelpers (copy), sduiLogger (copy), sduiErrors (copy), processSduiResponse (copy), url (copy), p2 (copy), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
					loadTimer.logUiResponseReceived()
					t_1[p1] = false
					sduiPageAnalyticsModule.sendPageStatusEvent(var3.surfaceKey, p6.StatusCode, p6.HttpError)
					
					if p5 then
						local var11 = if p6.StatusCode then tonumber(p6.StatusCode) else nil
						
						if var11 and var11 >= 400 or p6.HttpError and p6.HttpError ~= Enum.HttpError.OK then
							loadTimer.updateRequestStatus(sduiRequestStatus.FailedToLoad)
							local var12 = t_2[p1]
							
							if var12 then
								t_2[p1] = nil
								var12.reject(p6)
							end
							return p4(p6)
						else
							loadTimer.updateRequestStatus(sduiRequestStatus.LoadedFromNetwork)
							sduiPageAnalyticsModule.sendPagePayloadSizeEvent(var3.surfaceKey, p6.Body)
							
							if var9 then
								local var13 = var9.finalize(p6.Body)
								
								if var13.ok then
									local value = var13.value
									local var14 = if fFlagSduiApiStoreOnSuccessAndRefresh then var8 else nil
									local var15 = t_2[p1]
									
									if var15 then
										t_2[p1] = nil
										var15.resolve(value)
									end
									if fFlagSduiApiStoreOnSuccessAndRefresh then
										local var16 = t[p1]
										
										if var16 and var16.onSuccess then
											var16.onSuccess(value, var14)
										end
									end
									return p3(var13.value)
								else
									sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
										message = sduiParseHelpers.stringifyValue(var13.value),
										name = var3.surfaceKey
									}, var3.surfaceKey)
									loadTimer.updateRequestStatus(sduiRequestStatus.FailedToLoad)
									local value = var13.value
									local var17 = t_2[p1]
									
									if var17 then
										t_2[p1] = nil
										var17.reject(value)
									end
									return p4(var13.value)
								end
							else
								local ok, status, var18 = pcall(processSduiResponse, p6)
								
								if ok then
									local t_3 = {}
									
									if not sduiEnableClearOnEmptyResponse then
										local var19 = p2.data(false)
										
										for i, v in status do
											local var20 = var19 and var19[i]
											t_3[i] = if var20 then cryoModule.Dictionary.join(var20, v) else v
										end
									elseif next(status) then
										local var21 = p2.data(false)
										
										for i, v in status do
											local var22 = var21 and var21[i]
											t_3[i] = if var22 then cryoModule.Dictionary.join(var22, v) else v
										end
									elseif var3.clearOnEmptyResponse and var3.configKey then
										t_3[var3.configKey] = {}
									end
									local var23 = if fFlagSduiApiStoreOnSuccessAndRefresh then var18 else nil
									local var24 = t_2[p1]
									
									if var24 then
										t_2[p1] = nil
										var24.resolve(t_3)
									end
									if fFlagSduiApiStoreOnSuccessAndRefresh then
										local var25 = t[p1]
										
										if var25 and var25.onSuccess then
											var25.onSuccess(t_3, var23)
										end
									end
									return p3(t_3)
								else
									sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
										message = `handleSduiApiResponse not successful for {url} err {sduiParseHelpers.stringifyValue(status)}`,
										name = var3.surfaceKey
									}, var3.surfaceKey)
									local var26 = t_2[p1]
									
									if var26 then
										t_2[p1] = nil
										var26.reject(status)
									end
									return p4(p2)
								end
							end
						end
					else
						local var27 = t_2[p1]
						
						if var27 then
							t_2[p1] = nil
							var27.reject(p6)
						end
						return p4(p6)
					end
				end)
			end)
		end
	})
	
	local function fetchIfNeeded(p7, p8)
		-- upvalues: fFlagSduiProtobufJsonDecode (copy), sduiResponseType (copy), t (ref), var2 (ref), t_2 (ref), promiseModule (copy)
		if fFlagSduiProtobufJsonDecode and p7.responseType == nil then
			p7.responseType = sduiResponseType.Protobuf
		end
		local configKey = p7.configKey or p7.url
		p7.configKey = configKey
		p7.loadTimer.logUiRequestQueued()
		t[configKey] = p7
		local _, andFetchItem = var2.getAndFetchItem(configKey, if p8 then function()
			return true
		end else nil)
		
		if not andFetchItem then
			return promiseModule.resolve()
		elseif not t_2[configKey] then
			local var28 = nil
			local var29 = nil
			local var30 = promiseModule.new(function(p9, p10)
				-- upvalues: var28 (write), var29 (write)
				var28 = p9
				var29 = p10
			end)
			var30:catch(function(_) end)
			t_2[configKey] = { promise = var30, resolve = var28, reject = var29 }
		end
		return t_2[configKey].promise
	end
	
	return {
		fetchIfNeeded = fetchIfNeeded,
		isInFlight = isInFlight,
		clearConfigEntries = if fFlagAppChatConversationTrustedFriendUpsellBanner then function(p7)
			-- upvalues: var1 (ref)
			if typeof(p7) == "string" and p7 ~= "" then
				var1.replaceItems({ [p7] = {} })
				
				return
			end
		end else nil,
		dismissEntry = if fFlagSduiDismissPromptAction then function(p7)
			-- upvalues: t (ref), var2 (ref), var1 (ref)
			local t_1 = {}
			
			if typeof(p7) ~= "string" or p7 == "" then
				return t_1
			end
			for i in t do
				local var28 = var2.getCachedItem(i).data(false)
				
				if var28 then
					local var29 = false
					local t_2 = {}
					
					for i_1, v in var28 do
						if v and v.category ~= nil and v.title == p7 then
							var29 = true
						else
							t_2[i_1] = v
						end
					end
					if var29 then
						var1.replaceItems({ [i] = t_2 })
						table.insert(t_1, i)
					end
				end
			end
			return t_1
		end else nil,
		seedFromDecodedResponse = function(p8)
			-- upvalues: t (ref), sduiResponseType (copy), var2 (ref), handleSduiApiResponseModule (copy), sduiProtobufResponseHelpersModule (copy), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (ref), sduiLogger (copy), sduiErrors (copy), sduiParseHelpers (copy), fFlagAppChatConversationTrustedFriendUpsellBanner (copy), var1 (ref), accumulateSduiCacheSubEntriesModule (copy)
			local configKey = p8.configKey
			local loadTimer = p8.loadTimer
			loadTimer.logUiRequestQueued()
			t[configKey] = {
				url = `inline://{configKey}`,
				surfaceKey = p8.surfaceKey,
				configKey = configKey,
				loadTimer = loadTimer,
				apiProto = p8.apiProto,
				responseType = sduiResponseType.Protobuf
			}
			local var30 = var2.getCachedItem(configKey).data(false)
			local ok, status = pcall(function()
				-- upvalues: handleSduiApiResponseModule (copy), p8 (ref), loadTimer (ref), configKey (ref), sduiProtobufResponseHelpersModule (copy), fFlagSduiClientDrivenTemplates (copy), getInputDataSignals (copy)
				return handleSduiApiResponseModule({
					paginateResponse = false,
					cacheSingleEntryWithIdentifier = true,
					response = { StatusCode = 200, Body = p8.decodedResponse, Stats = {} },
					loadTimer = loadTimer,
					surfaceKey = p8.surfaceKey,
					configCacheKey = configKey,
					decodeResponse = function(p9)
						return p9
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
					name = p8.surfaceKey
				}, p8.surfaceKey)
				error(status)
			end
			if fFlagAppChatConversationTrustedFriendUpsellBanner and p8.replace then
				var1.replaceItems({ [configKey] = status })
				
				return
			end
			var1.updateItems({
				[configKey] = accumulateSduiCacheSubEntriesModule(status, var30)
			})
		end,
		getData = var2.getCachedItem,
		getInputData = if fFlagSduiApiStoreExposeGetInputData then function(p9, p10, p11)
			-- upvalues: resolveSduiCacheEntryModule (copy), t_3 (ref)
			local var31 = resolveSduiCacheEntryModule(t_3, p9, if p10 and p10 ~= "" then `{p9}_{p10}` else nil)
			
			return if var31 == nil then nil else var31.get(if p11 == nil then false else p11)
		end else nil,
		getRootConfig = function(p9, p10, p11)
			-- upvalues: var2 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var31 = var2.getCachedItem(p9).data(p10)
			local var32 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var31, p9, p11) else var31 and var31[p11 or p9]
			
			return if var32 then var32.config else nil
		end,
		getTitle = function(p9, p10, p11)
			-- upvalues: var2 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var31 = var2.getCachedItem(p9).data(p10)
			local var32 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var31, p9, p11) else var31 and var31[p11 or p9]
			
			return if var32 and var32.title ~= "" then var32.title else nil
		end,
		getDataUpdatedTimestamp = function(p9, p10, p11)
			-- upvalues: var2 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var31 = var2.getCachedItem(p9).data(p10)
			local var32 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var31, p9, p11) else var31 and var31[p11 or p9]
			
			return if var32 then var32.dataUpdatedTimestamp else nil
		end,
		getEntrySurfacing = function(p9, p10, p11)
			-- upvalues: var2 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var31 = var2.getCachedItem(p9).data(p11)
			local var32 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var31, p9, p10) else var31 and var31[p10 or p9]
			
			return if var32 then var32.surfacing else nil
		end,
		loadMoreFromApi = function(p9)
			-- upvalues: t (ref), sduiLogger (copy), sduiErrors (copy), promiseModule (copy), var2 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy), fFlagSduiPaginatePostBody (copy), cryoModule (copy), fetchIfNeeded (ref)
			local configKey = t[p9.configKey]
			
			if not configKey then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToPaginateRequest, { message = `No requestData for {p9.configKey}` }, "unknown")
				
				return promiseModule.resolve()
			end
			local var31
			local var32 = var2.getCachedItem(p9.configKey).data(false)
			
			if fFlagSduiAlwaysCacheWithIdentifier then
				var31 = resolveSduiCacheEntryModule(var32, p9.configKey, p9.identifier)
			else
				var31 = var32
				
				if var31 then
					var31 = var32[p9.identifier or p9.configKey]
				end
			end
			if not var31 then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToPaginateRequest, {
					message = `No entry data for {p9.configKey}`,
					name = configKey.surfaceKey
				}, configKey.surfaceKey)
				
				return promiseModule.resolve()
			end
			local nextPageUrl = var31.nextPageUrl
			
			if not nextPageUrl or nextPageUrl == "" then
				return promiseModule.resolve()
			end
			local t_1 = {
				isPaginated = true,
				url = nextPageUrl,
				loadTimer = p9.loadTimer
			}
			
			if fFlagSduiPaginatePostBody and configKey.postConfig and var31.nextPagePostBody then
				t_1.postConfig = cryoModule.Dictionary.join(configKey.postConfig, { body = var31.nextPagePostBody })
			end
			return fetchIfNeeded(cryoModule.Dictionary.join(configKey, t_1), true)
		end,
		refreshFromApi = function(p10)
			-- upvalues: t (ref), sduiLogger (copy), sduiErrors (copy), promiseModule (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), cryoModule (copy), fFlagSduiPaginatePostBody (copy), fetchIfNeeded (ref)
			local configKey = t[p10.configKey]
			
			if not configKey then
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, { message = `No requestData for refresh: {p10.configKey}` }, "unknown")
				
				return promiseModule.resolve()
			elseif fFlagSduiApiStoreOnSuccessAndRefresh and configKey.refresh then
				return configKey.refresh(p10.loadTimer)
			end
			local t_1 = {
				url = (if configKey.buildRefreshUrl then configKey.buildRefreshUrl() else nil) or configKey.url,
				loadTimer = p10.loadTimer,
				isPaginated = cryoModule.None
			}
			
			if fFlagSduiPaginatePostBody and configKey.postConfig then
				local var33 = if configKey.buildRefreshPostBody then configKey.buildRefreshPostBody() else nil
				
				if var33 then
					t_1.postConfig = cryoModule.Dictionary.join(configKey.postConfig, { body = var33 })
				end
			end
			return fetchIfNeeded(cryoModule.Dictionary.join(configKey, t_1), true)
		end
	}
end