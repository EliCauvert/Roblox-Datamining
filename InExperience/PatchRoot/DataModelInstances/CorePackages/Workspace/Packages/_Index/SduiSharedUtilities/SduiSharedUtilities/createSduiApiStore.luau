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
local fFlagSduiDismissPromptAction = require(parent.SharedFlags).FFlagSduiDismissPromptAction
local fFlagSduiApiStoreExposeGetInputData = require(parent.SharedFlags).FFlagSduiApiStoreExposeGetInputData
local fFlagAppChatConversationTrustedFriendUpsellBanner = require(parent.SharedFlags).FFlagAppChatConversationTrustedFriendUpsellBanner
local fFlagSduiApiStoreOnSuccessAndRefresh = require(parent.SharedFlags).FFlagSduiApiStoreOnSuccessAndRefresh
local fFlagSduiPaginatePostBody = require(parent.SharedFlags).FFlagSduiPaginatePostBody
local sduiPageRequestPriority = game:DefineFastInt("SduiPageRequestPriority", 1)
local resolveSduiCacheEntryModule = require(sduiSharedUtilities.resolveSduiCacheEntry)
local accumulateSduiCacheSubEntriesModule = require(sduiSharedUtilities.accumulateSduiCacheSubEntries)

return function()
	-- upvalues: createDataCache (ref), fFlagSduiApiStoreOnSuccessAndRefresh (ref), signalsModule (ref), promiseModule (ref), fFlagSduiProtobufJsonDecode (ref), sduiResponseType (ref), fFlagSduiConfigFetchTakesPostBody (ref), fFlagLuaAppSduiStreamingChunkedResponses (ref), makeProtobufJsonResponseDecoder (ref), makeProtoResponseDecoder (ref), handleSduiApiResponseModule (ref), sduiProtobufResponseHelpersModule (ref), fFlagSduiPaginatePostBody (ref), fFlagSduiAllowNoConfigsBuilt (ref), fFlagSduiClientTemplateCache (ref), createSduiStreamingResponseHandlerModule (ref), accumulateSduiCacheSubEntriesModule (ref), httpService (ref), sduiApiStorePostConfigModule (ref), sduiPageRequestPriority (ref), sduiPageAnalyticsModule (ref), sduiRequestStatus (ref), fFlagSduiErrorCleanup (ref), sduiLogger (ref), sduiErrors (ref), fFlagSduiChartsSupport (ref), sduiParseHelpers (ref), sduiEnableClearOnEmptyResponse (ref), cryoModule (ref), createDataResolver (ref), resolveSduiCacheEntryModule (ref), fFlagSduiAlwaysCacheWithIdentifier (ref), fFlagAppChatConversationTrustedFriendUpsellBanner (ref), fFlagSduiDismissPromptAction (ref), fFlagSduiApiStoreExposeGetInputData (ref)
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
			-- upvalues: t (ref), promiseModule (copy), fFlagSduiProtobufJsonDecode (copy), sduiResponseType (copy), fFlagSduiConfigFetchTakesPostBody (copy), fFlagLuaAppSduiStreamingChunkedResponses (copy), makeProtobufJsonResponseDecoder (copy), makeProtoResponseDecoder (copy), handleSduiApiResponseModule (copy), sduiProtobufResponseHelpersModule (copy), getInputDataSignals (ref), fFlagSduiPaginatePostBody (copy), fFlagSduiAllowNoConfigsBuilt (copy), fFlagSduiClientTemplateCache (copy), createSduiStreamingResponseHandlerModule (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), accumulateSduiCacheSubEntriesModule (copy), var1 (ref), httpService (copy), sduiApiStorePostConfigModule (copy), sduiPageRequestPriority (copy), t_1 (ref), sduiPageAnalyticsModule (copy), sduiRequestStatus (copy), fFlagSduiErrorCleanup (copy), sduiLogger (copy), sduiErrors (copy), fFlagSduiChartsSupport (copy), t_2 (ref), sduiParseHelpers (copy), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
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
				-- upvalues: var3 (ref), p2 (ref), handleSduiApiResponseModule (copy), loadTimer (ref), var7 (ref), sduiProtobufResponseHelpersModule (copy), getInputDataSignals (copy), fFlagLuaAppSduiStreamingChunkedResponses (copy), var6 (ref), fFlagSduiPaginatePostBody (copy), fFlagSduiAllowNoConfigsBuilt (copy), fFlagSduiClientTemplateCache (copy)
				return handleSduiApiResponseModule({
					response = p3,
					loadTimer = loadTimer,
					surfaceKey = var3.surfaceKey,
					configCacheKey = var3.configKey,
					decodeResponse = var7,
					parseHydrationDataFromResponse = sduiProtobufResponseHelpersModule.parseHydrationDataFromResponse,
					parseTemplateEntriesFromResponse = sduiProtobufResponseHelpersModule.parseTemplateEntriesFromResponse,
					parsePageEntriesFromResponse = sduiProtobufResponseHelpersModule.parsePageEntriesFromResponse,
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
				-- upvalues: var10 (ref), loadTimer (ref), t_1 (copy), p1 (ref), sduiPageAnalyticsModule (copy), var3 (ref), sduiRequestStatus (copy), fFlagSduiErrorCleanup (copy), sduiLogger (copy), sduiErrors (copy), url (ref), fFlagSduiChartsSupport (copy), t_2 (copy), var9 (ref), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var8 (write), t (copy), sduiParseHelpers (copy), processSduiResponse (ref), p2 (ref), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
				var10:Start(function(p5, p6)
					-- upvalues: loadTimer (copy), t_1 (copy), p1 (copy), sduiPageAnalyticsModule (copy), var3 (copy), sduiRequestStatus (copy), fFlagSduiErrorCleanup (copy), sduiLogger (copy), sduiErrors (copy), url (copy), fFlagSduiChartsSupport (copy), t_2 (copy), p4 (ref), var9 (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), var8 (copy), t (copy), p3 (ref), sduiParseHelpers (copy), processSduiResponse (copy), p2 (copy), sduiEnableClearOnEmptyResponse (copy), cryoModule (copy)
					local var11
					loadTimer.logUiResponseReceived()
					t_1[p1] = false
					sduiPageAnalyticsModule.sendPageStatusEvent(var3.surfaceKey, p6.StatusCode, p6.HttpError)
					
					if p5 then
						var11 = if p6.StatusCode then tonumber(p6.StatusCode) else nil
						
						if var11 and var11 >= 400 or p6.HttpError and p6.HttpError ~= Enum.HttpError.OK then
							loadTimer.updateRequestStatus(sduiRequestStatus.FailedToLoad)
							
							if not fFlagSduiErrorCleanup then
								sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
									message = `Http request not successful for {url} StatusCode {p6.StatusCode} HttpError {p6.HttpError}`,
									name = var3.surfaceKey
								}, var3.surfaceKey)
							end
							if fFlagSduiChartsSupport then
								local var12 = p1
								local var13 = t_2[var12]
								
								if var13 then
									t_2[var12] = nil
									var13.reject(p6)
								end
							end
							return p4(p6)
						else
							loadTimer.updateRequestStatus(sduiRequestStatus.LoadedFromNetwork)
							sduiPageAnalyticsModule.sendPagePayloadSizeEvent(var3.surfaceKey, p6.Body)
							
							if var9 then
								local var14 = var9.finalize(p6.Body)
								
								if var14.ok then
									if fFlagSduiChartsSupport then
										local var15 = p1
										local value = var14.value
										local var16 = if fFlagSduiApiStoreOnSuccessAndRefresh then var8 else nil
										local var17 = t_2[var15]
										
										if var17 then
											t_2[var15] = nil
											var17.resolve(value)
										end
										if fFlagSduiApiStoreOnSuccessAndRefresh then
											local var18 = t[var15]
											
											if var18 and var18.onSuccess then
												var18.onSuccess(value, var16)
											end
										end
									end
									return p3(var14.value)
								else
									sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
										message = sduiParseHelpers.stringifyValue(var14.value),
										name = var3.surfaceKey
									}, var3.surfaceKey)
									loadTimer.updateRequestStatus(sduiRequestStatus.FailedToLoad)
									
									if fFlagSduiChartsSupport then
										local var19 = p1
										local value = var14.value
										local var20 = t_2[var19]
										
										if var20 then
											t_2[var19] = nil
											var20.reject(value)
										end
									end
									return p4(var14.value)
								end
							else
								local ok, status, var21 = pcall(processSduiResponse, p6)
								
								if ok then
									local t_3 = {}
									
									if not sduiEnableClearOnEmptyResponse then
										local var22 = p2.data(false)
										
										for i, v in status do
											local var23 = var22 and var22[i]
											t_3[i] = if var23 then cryoModule.Dictionary.join(var23, v) else v
										end
									elseif next(status) then
										local var24 = p2.data(false)
										
										for i, v in status do
											local var25 = var24 and var24[i]
											t_3[i] = if var25 then cryoModule.Dictionary.join(var25, v) else v
										end
									elseif var3.clearOnEmptyResponse and var3.configKey then
										t_3[var3.configKey] = {}
									end
									if fFlagSduiChartsSupport then
										local var26 = p1
										local var27 = if fFlagSduiApiStoreOnSuccessAndRefresh then var21 else nil
										local var28 = t_2[var26]
										
										if var28 then
											t_2[var26] = nil
											var28.resolve(t_3)
										end
										if fFlagSduiApiStoreOnSuccessAndRefresh then
											local var29 = t[var26]
											
											if var29 and var29.onSuccess then
												var29.onSuccess(t_3, var27)
											end
										end
									end
									return p3(t_3)
								else
									sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
										message = `handleSduiApiResponse not successful for {url} err {sduiParseHelpers.stringifyValue(status)}`,
										name = var3.surfaceKey
									}, var3.surfaceKey)
									
									if fFlagSduiChartsSupport then
										local var30 = p1
										local var31 = t_2[var30]
										
										if var31 then
											t_2[var30] = nil
											var31.reject(status)
										end
									end
									return p4(p2)
								end
							end
						end
					elseif not fFlagSduiErrorCleanup then
						sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
							message = `Http request not successful for {url} err {sduiParseHelpers.stringifyValue(p6)}`,
							name = var3.surfaceKey
						}, var3.surfaceKey)
					end
					if fFlagSduiChartsSupport then
						var11 = p1
						local var32 = t_2[var11]
						
						if var32 then
							t_2[var11] = nil
							var32.reject(p6)
						end
					end
					return p4(p6)
				end)
			end)
		end
	})
	
	local function fetchIfNeeded(p7, p8)
		-- upvalues: fFlagSduiProtobufJsonDecode (copy), sduiResponseType (copy), fFlagSduiChartsSupport (copy), t (ref), var2 (ref), t_2 (ref), promiseModule (copy), fFlagSduiErrorCleanup (copy), sduiLogger (copy), sduiErrors (copy), sduiParseHelpers (copy), t_1 (ref)
		if fFlagSduiProtobufJsonDecode and p7.responseType == nil then
			p7.responseType = sduiResponseType.Protobuf
		end
		local configKey = p7.configKey or p7.url
		p7.configKey = configKey
		
		if fFlagSduiChartsSupport then
			p7.loadTimer.logUiRequestQueued()
			t[configKey] = p7
			local _, andFetchItem = var2.getAndFetchItem(configKey, if p8 then function()
				return true
			end else nil)
			
			if not andFetchItem then
				return promiseModule.resolve()
			elseif not t_2[configKey] then
				local var33 = nil
				local var34 = nil
				local var35 = promiseModule.new(function(p9, p10)
					-- upvalues: var33 (write), var34 (write)
					var33 = p9
					var34 = p10
				end)
				var35:catch(function(p9)
					-- upvalues: fFlagSduiErrorCleanup (copy), sduiLogger (copy), sduiErrors (copy), configKey (ref), sduiParseHelpers (copy), p7 (ref)
					if not fFlagSduiErrorCleanup then
						sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, {
							message = `fetchIfNeeded promise rejected for {configKey}: {sduiParseHelpers.stringifyValue(p9)}`
						}, p7.surfaceKey)
					end
				end)
				t_2[configKey] = { promise = var35, resolve = var33, reject = var34 }
			end
			return t_2[configKey].promise
		elseif t_1[configKey] then
			return nil
		end
		t_1[configKey] = true
		p7.loadTimer.logUiRequestQueued()
		t[configKey] = p7
		
		return var2.getAndFetchItem(configKey, if p8 then function()
			return true
		end else nil)
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
				local var36 = var2.getCachedItem(i).data(false)
				
				if var36 then
					local var37 = false
					local t_2 = {}
					
					for i_1, v in var36 do
						if v and v.category ~= nil and v.title == p9 then
							var37 = true
						else
							t_2[i_1] = v
						end
					end
					if var37 then
						var1.replaceItems({ [i] = t_2 })
						table.insert(t_1, i)
					end
				end
			end
			return t_1
		end else nil,
		seedFromDecodedResponse = function(p10)
			-- upvalues: t (ref), sduiResponseType (copy), var2 (ref), handleSduiApiResponseModule (copy), sduiProtobufResponseHelpersModule (copy), getInputDataSignals (ref), sduiLogger (copy), sduiErrors (copy), sduiParseHelpers (copy), fFlagAppChatConversationTrustedFriendUpsellBanner (copy), var1 (ref), accumulateSduiCacheSubEntriesModule (copy)
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
			local var38 = var2.getCachedItem(configKey).data(false)
			local ok, status = pcall(function()
				-- upvalues: handleSduiApiResponseModule (copy), p10 (ref), loadTimer (ref), configKey (ref), sduiProtobufResponseHelpersModule (copy), getInputDataSignals (copy)
				return handleSduiApiResponseModule({
					paginateResponse = false,
					cacheSingleEntryWithIdentifier = true,
					response = { StatusCode = 200, Body = p10.decodedResponse, Stats = {} },
					loadTimer = loadTimer,
					surfaceKey = p10.surfaceKey,
					configCacheKey = configKey,
					decodeResponse = function(p11)
						return p11
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
					name = p10.surfaceKey
				}, p10.surfaceKey)
				error(status)
			end
			if fFlagAppChatConversationTrustedFriendUpsellBanner and p10.replace then
				var1.replaceItems({ [configKey] = status })
				
				return
			end
			var1.updateItems({
				[configKey] = accumulateSduiCacheSubEntriesModule(status, var38)
			})
		end,
		getData = var2.getCachedItem,
		getInputData = if fFlagSduiApiStoreExposeGetInputData then function(p11, p12, p13)
			-- upvalues: resolveSduiCacheEntryModule (copy), t_3 (ref)
			local var39 = resolveSduiCacheEntryModule(t_3, p11, if p12 and p12 ~= "" then `{p11}_{p12}` else nil)
			
			return if var39 == nil then nil else var39.get(if p13 == nil then false else p13)
		end else nil,
		getRootConfig = function(p11, p12, p13)
			-- upvalues: var2 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var39 = var2.getCachedItem(p11).data(p12)
			local var40 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var39, p11, p13) else var39 and var39[p13 or p11]
			
			return if var40 then var40.config else nil
		end,
		getTitle = function(p11, p12, p13)
			-- upvalues: var2 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var39 = var2.getCachedItem(p11).data(p12)
			local var40 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var39, p11, p13) else var39 and var39[p13 or p11]
			
			return if var40 and var40.title ~= "" then var40.title else nil
		end,
		getDataUpdatedTimestamp = function(p11, p12, p13)
			-- upvalues: var2 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var39 = var2.getCachedItem(p11).data(p12)
			local var40 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var39, p11, p13) else var39 and var39[p13 or p11]
			
			return if var40 then var40.dataUpdatedTimestamp else nil
		end,
		getEntrySurfacing = function(p11, p12, p13)
			-- upvalues: var2 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy)
			local var39 = var2.getCachedItem(p11).data(p13)
			local var40 = if fFlagSduiAlwaysCacheWithIdentifier then resolveSduiCacheEntryModule(var39, p11, p12) else var39 and var39[p12 or p11]
			
			return if var40 then var40.surfacing else nil
		end,
		loadMoreFromApi = function(p11)
			-- upvalues: fFlagSduiChartsSupport (copy), t_1 (ref), t (ref), sduiLogger (copy), sduiErrors (copy), promiseModule (copy), var2 (ref), fFlagSduiAlwaysCacheWithIdentifier (copy), resolveSduiCacheEntryModule (copy), fFlagSduiPaginatePostBody (copy), cryoModule (copy), fetchIfNeeded (ref)
			if not fFlagSduiChartsSupport and t_1[p11.configKey] then
				return nil
			end
			local configKey = t[p11.configKey]
			
			if configKey then
				local var39
				local var40 = var2.getCachedItem(p11.configKey).data(false)
				
				if fFlagSduiAlwaysCacheWithIdentifier then
					var39 = resolveSduiCacheEntryModule(var40, p11.configKey, p11.identifier)
				else
					var39 = var40
					
					if var39 then
						var39 = var40[p11.identifier or p11.configKey]
					end
				end
				if var39 then
					local nextPageUrl = var39.nextPageUrl
					
					if nextPageUrl and nextPageUrl ~= "" then
						local t_2 = {
							isPaginated = true,
							url = nextPageUrl,
							loadTimer = p11.loadTimer
						}
						
						if fFlagSduiPaginatePostBody and configKey.postConfig and var39.nextPagePostBody then
							t_2.postConfig = cryoModule.Dictionary.join(configKey.postConfig, { body = var39.nextPagePostBody })
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
						message = `No entry data for {p11.configKey}`,
						name = configKey.surfaceKey
					}, configKey.surfaceKey)
					
					return if fFlagSduiChartsSupport then promiseModule.resolve() else nil
				end
			else
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToPaginateRequest, { message = `No requestData for {p11.configKey}` }, "unknown")
				
				return if fFlagSduiChartsSupport then promiseModule.resolve() else nil
			end
		end,
		refreshFromApi = function(p12)
			-- upvalues: t (ref), sduiLogger (copy), sduiErrors (copy), fFlagSduiChartsSupport (copy), promiseModule (copy), fFlagSduiApiStoreOnSuccessAndRefresh (copy), cryoModule (copy), fFlagSduiPaginatePostBody (copy), fetchIfNeeded (ref)
			local configKey = t[p12.configKey]
			
			if configKey then
				if not fFlagSduiChartsSupport then
					return fetchIfNeeded(cryoModule.Dictionary.join(configKey, { loadTimer = p12.loadTimer }), true)
				elseif fFlagSduiApiStoreOnSuccessAndRefresh and configKey.refresh then
					return configKey.refresh(p12.loadTimer)
				end
				local t_1 = {
					url = (if configKey.buildRefreshUrl then configKey.buildRefreshUrl() else nil) or configKey.url,
					loadTimer = p12.loadTimer,
					isPaginated = cryoModule.None
				}
				
				if fFlagSduiPaginatePostBody and configKey.postConfig then
					local var41 = if configKey.buildRefreshPostBody then configKey.buildRefreshPostBody() else nil
					
					if var41 then
						t_1.postConfig = cryoModule.Dictionary.join(configKey.postConfig, { body = var41 })
					end
				end
				return fetchIfNeeded(cryoModule.Dictionary.join(configKey, t_1), true)
			else
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFetchPage, { message = `No requestData for refresh: {p12.configKey}` }, "unknown")
				
				return if fFlagSduiChartsSupport then promiseModule.resolve() else nil
			end
		end
	}
end