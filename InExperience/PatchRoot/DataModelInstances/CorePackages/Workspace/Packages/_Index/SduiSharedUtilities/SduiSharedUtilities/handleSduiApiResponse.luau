local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local _ = require(parent.Signals)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiLogger = sduiCoreSystemModule.SduiLogger
local sduiUsageRecorder = sduiCoreSystemModule.SduiUsageRecorder
local recordTemplateUsage = sduiCoreSystemModule.recordTemplateUsage
local getSduiTemplateStoreModule = require(sduiSharedUtilities.getSduiTemplateStore)
local sduiProtobufResponseHelpersModule = require(sduiSharedUtilities.SduiProtobufResponseHelpers)
local _ = require(sduiSharedUtilities.SduiLoadTimer)
local sduiRequestStatus = require(sduiSharedUtilities.SduiIntegrationTypes).SduiRequestStatus
local sduiInputDataMergeModule = require(sduiSharedUtilities.SduiInputDataMerge)
local processClientHintsModule = require(sduiSharedUtilities.processClientHints)
local getSduiClientBindingBuilder = sduiCoreSystemModule.getSduiClientBindingBuilder
local createBuilderConfig = sduiCoreSystemModule.createBuilderConfig
local getSduiDataBinder = sduiCoreSystemModule.getSduiDataBinder
local fFlagSduiAllowNoConfigsBuilt = require(parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local fFlagSduiAlwaysCacheWithIdentifier = require(parent.SharedFlags).FFlagSduiAlwaysCacheWithIdentifier
local fFlagSduiNilHydrationGuard = require(parent.SharedFlags).FFlagSduiNilHydrationGuard
local fFlagSduiChartsSortDetailGenreFilter = require(parent.SharedFlags).FFlagSduiChartsSortDetailGenreFilter
local fFlagEnableSduiV2HomepagePrompts = require(parent.SharedFlags).FFlagEnableSduiV2HomepagePrompts
local fFlagEnableHomepagePromptsForModalsAndBanners = require(parent.SharedFlags).FFlagEnableHomepagePromptsForModalsAndBanners
local fFlagPromptsHandlerEnabled = require(parent.SharedFlags).FFlagPromptsHandlerEnabled
local fFlagSduiImprovedErrorDimensions = require(parent.SharedFlags).FFlagSduiImprovedErrorDimensions
local fFlagSduiUsageTelemetry = require(parent.SharedFlags).FFlagSduiUsageTelemetry
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagSduiEventDetailsSupport = require(parent.SharedFlags).FFlagSduiEventDetailsSupport
local fFlagLuaAppSduiStreamingChunkedResponses = require(parent.SharedFlags).FFlagLuaAppSduiStreamingChunkedResponses
local fFlagSduiClientTemplateCache = require(parent.SharedFlags).FFlagSduiClientTemplateCache
local fFlagSduiPaginatePostBody = require(parent.SharedFlags).FFlagSduiPaginatePostBody
local fFlagSduiGameIconSupport = require(parent.SharedFlags).FFlagSduiGameIconSupport
local fFlagSduiApiStoreOnSuccessAndRefresh = require(parent.SharedFlags).FFlagSduiApiStoreOnSuccessAndRefresh
local fFlagSduiUseHttpClientModule = require(sduiSharedUtilities.Flags.FFlagSduiUseHttpClient)
local fFlagSduiClientDrivenTemplates = require(parent.SharedFlags).FFlagSduiClientDrivenTemplates
local cryoModule = require(parent.Cryo)

local function mergeTables(p1, p2)
	-- upvalues: mergeTables (ref)
	for i, v in p2 do
		if typeof(v) ~= "table" then
			p1[i] = v
			continue
		end
		if p1[i] == nil then
			p1[i] = {}
		end
		if #v > 0 then
			for i_1, v_1 in v do
				table.insert(p1[i], v_1)
			end
		else
			mergeTables(p1[i], v)
		end
	end
end

return function(p3)
	-- upvalues: fFlagSduiClientDrivenTemplates (ref), fFlagSduiPaginatePostBody (ref), fFlagSduiAllowNoConfigsBuilt (ref), fFlagSduiUseHttpClientModule (ref), sduiRequestStatus (ref), sduiLogger (ref), sduiErrors (ref), fFlagSduiImprovedErrorDimensions (ref), fFlagSduiNilHydrationGuard (ref), getSduiDataBinder (ref), fFlagSduiClientTemplateCache (ref), getSduiTemplateStoreModule (ref), fFlagSduiUsageTelemetry (ref), recordTemplateUsage (ref), sduiUsageRecorder (ref), sduiProtobufResponseHelpersModule (ref), fFlagSduiAlwaysCacheWithIdentifier (ref), fFlagLuaAppSduiStreamingChunkedResponses (ref), sduiInputDataMergeModule (ref), createBuilderConfig (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagSduiChartsSortDetailGenreFilter (ref), getSduiClientBindingBuilder (ref), fFlagEnableSduiV2HomepagePrompts (ref), fFlagPromptsHandlerEnabled (ref), fFlagEnableHomepagePromptsForModalsAndBanners (ref), cryoModule (ref), fFlagSduiGameIconSupport (ref), processClientHintsModule (ref), fFlagSduiApiStoreOnSuccessAndRefresh (ref)
	local response = p3.response
	local decodeResponse = p3.decodeResponse
	local parsePageEntriesFromResponse = p3.parsePageEntriesFromResponse
	local parseHydrationDataFromResponse = p3.parseHydrationDataFromResponse
	local parseTemplateEntriesFromResponse = p3.parseTemplateEntriesFromResponse
	local var1 = if fFlagSduiClientDrivenTemplates then p3.parseLocalizedLiteralsFromResponse else nil
	local getInputDataSignalsForRequest = p3.getInputDataSignalsForRequest
	local loadTimer = p3.loadTimer
	local surfaceKey = p3.surfaceKey
	local configCacheKey = p3.configCacheKey or p3.surfaceKey
	local enableTemplateCache = p3.enableTemplateCache
	local paginateResponse = p3.paginateResponse
	local buildNextPageUrl = p3.buildNextPageUrl
	local var2 = if fFlagSduiPaginatePostBody then p3.buildNextPagePostBody else nil
	local var3 = if fFlagSduiAllowNoConfigsBuilt then p3.allowNoConfigsBuilt else nil
	local mergeStrategy = p3.mergeStrategy
	assert(configCacheKey, "configCacheKey must exist")
	loadTimer.logNetRequestStats(if fFlagSduiUseHttpClientModule then response.stats or {} else response.Stats)
	loadTimer.logResponseDecodeBegin()
	local ok, status = pcall(function()
		-- upvalues: decodeResponse (ref), fFlagSduiUseHttpClientModule (copy), response (ref)
		return decodeResponse(if fFlagSduiUseHttpClientModule then response.responseBody else response.Body)
	end)
	loadTimer.logResponseDecodeEnd()
	
	if not ok then
		loadTimer.updateRequestStatus(sduiRequestStatus.FailedToLoad)
		sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToDecodeResponse, {
			debugName = if fFlagSduiImprovedErrorDimensions then nil else configCacheKey,
			name = if fFlagSduiImprovedErrorDimensions then configCacheKey else nil,
			message = status
		}, surfaceKey)
		error("Failed to decode")
	end
	loadTimer.logResponseDataUpdateBegin()
	
	if parseHydrationDataFromResponse then
		local ok_1, status_1 = pcall(function()
			-- upvalues: parseHydrationDataFromResponse (ref), status (ref), fFlagSduiNilHydrationGuard (copy), getSduiDataBinder (copy)
			local var4 = parseHydrationDataFromResponse(status)
			
			if fFlagSduiNilHydrationGuard then
				if var4 == nil then
					return
				else
					getSduiDataBinder().updateDataStores(var4)
					
					return
				end
			else
				getSduiDataBinder().updateDataStores(var4)
			end
		end)
		
		if not ok_1 then
			sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToUpdateDataStores, {
				debugName = if fFlagSduiImprovedErrorDimensions then nil else configCacheKey,
				name = if fFlagSduiImprovedErrorDimensions then configCacheKey else nil,
				message = status_1
			}, surfaceKey)
		end
	end
	local t = {}
	
	if parseTemplateEntriesFromResponse then
		local ok_1, status_1 = pcall(function()
			-- upvalues: t (write), parseTemplateEntriesFromResponse (ref), status (ref), fFlagSduiClientTemplateCache (copy), enableTemplateCache (ref), getSduiTemplateStoreModule (copy), surfaceKey (ref), fFlagSduiUsageTelemetry (copy), recordTemplateUsage (copy), sduiUsageRecorder (copy)
			local _ = nil
			local _ = nil
			local var4, var5, var6 = parseTemplateEntriesFromResponse(status, if fFlagSduiClientTemplateCache then enableTemplateCache else nil)
			t = var5
			getSduiTemplateStoreModule().addTemplates(var4)
			
			if fFlagSduiClientTemplateCache and enableTemplateCache then
				getSduiTemplateStoreModule().recordSurfaceTemplates(surfaceKey, var6)
			end
			if fFlagSduiUsageTelemetry and var4 then
				for i, v in var4 do
					pcall(recordTemplateUsage, surfaceKey, v)
				end
				sduiUsageRecorder.scheduleFlush()
			end
		end)
		
		if not ok_1 then
			sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToAddTemplates, {
				debugName = if fFlagSduiImprovedErrorDimensions then nil else configCacheKey,
				name = if fFlagSduiImprovedErrorDimensions then configCacheKey else nil,
				message = status_1
			}, surfaceKey)
		end
	end
	loadTimer.logResponseDataUpdateEnd()
	loadTimer.logSduiTreeBuildBegin()
	local var4 = if parsePageEntriesFromResponse then parsePageEntriesFromResponse(status) else {}
	local var5 = if fFlagSduiClientDrivenTemplates and var1 then var1(status) else sduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse(status)
	
	local function resolveTemplateForRobloxComponent(p4)
		-- upvalues: t (write), getSduiTemplateStoreModule (copy), surfaceKey (ref), sduiLogger (copy), sduiErrors (copy), fFlagSduiImprovedErrorDimensions (copy), configCacheKey (ref)
		local var6 = t[p4]
		
		if var6 == nil then
			var6 = getSduiTemplateStoreModule().getTemplateForRobloxComponent(surfaceKey, p4)
		end
		if var6 == nil then
			sduiLogger.reportError(sduiErrors.SduiErrorType.MissingCachedTemplate, {
				debugName = if fFlagSduiImprovedErrorDimensions then nil else configCacheKey,
				name = p4,
				message = `Backend omitted template for {p4} but it could not be resolved from the surface cache + template store`
			}, surfaceKey)
		end
		return var6
	end
	
	local t_1 = {}
	local var7 = #var4 > 1
	
	for i, v in var4 do
		local var8
		local identifier = v.identifier
		local var9 = if (var7 or fFlagSduiAlwaysCacheWithIdentifier or p3.cacheSingleEntryWithIdentifier) and (identifier and identifier ~= "") then `{configCacheKey}_{identifier}` else configCacheKey
		local componentInputData = v.componentInputData
		local var10 = getInputDataSignalsForRequest(var9)
		local var11 = var10.get(false)
		local enableStreamingMerge = fFlagLuaAppSduiStreamingChunkedResponses and p3.enableStreamingMerge
		
		if not paginateResponse and not enableStreamingMerge or not var11 then
			var10.set(componentInputData)
		elseif componentInputData then
			var10.set(sduiInputDataMergeModule.merge(var10.get(false), componentInputData, mergeStrategy))
		end
		if not paginateResponse then
			var8 = enableStreamingMerge and var11
		end
		if var8 then
			var8 = v.robloxComponentType
			
			if var8 then
				local var12 = if fFlagSduiClientTemplateCache and enableTemplateCache then resolveTemplateForRobloxComponent(var8) else t[var8]
				
				if var12 then
					local ok_1, status_1 = pcall(function()
						-- upvalues: createBuilderConfig (copy), surfaceKey (ref), configCacheKey (ref), fFlagSduiClientTemplateCache (copy), enableTemplateCache (ref), resolveTemplateForRobloxComponent (ref), t (write), var5 (ref), fFlagSduiExperienceDetailsSupport (copy), fFlagSduiEventDetailsSupport (copy), fFlagSduiChartsSortDetailGenreFilter (copy), getSduiClientBindingBuilder (copy), var12 (ref), var10 (ref)
						return getSduiClientBindingBuilder().buildConfigForComponent(var12, var10.get, createBuilderConfig({
							appPage = surfaceKey,
							debugName = configCacheKey,
							getTemplateForRobloxComponent = function(p5)
								-- upvalues: fFlagSduiClientTemplateCache (copy), enableTemplateCache (copy), resolveTemplateForRobloxComponent (copy), t (copy)
								return if fFlagSduiClientTemplateCache and enableTemplateCache then resolveTemplateForRobloxComponent(p5) else t[p5]
							end,
							localizedLiterals = var5,
							configKey = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport or fFlagSduiChartsSortDetailGenreFilter then configCacheKey else nil
						}))
					end)
					
					if ok_1 then
						if t_1[var9] then
							sduiLogger.reportError(sduiErrors.SduiErrorType.DuplicateOrMissingIdentifier, {
								debugName = if fFlagSduiImprovedErrorDimensions then nil else var9,
								name = var8,
								message = `Existing config found for cacheKey {var9}. Need to specify identifer in page entry for multiple configs`
							}, surfaceKey)
						end
						t_1[var9] = {
							config = status_1,
							dataUpdatedTimestamp = os.clock(),
							identifier = if fFlagEnableSduiV2HomepagePrompts or fFlagPromptsHandlerEnabled then identifier else nil,
							robloxComponentType = if fFlagEnableSduiV2HomepagePrompts or fFlagPromptsHandlerEnabled then var8 else nil,
							category = if fFlagEnableHomepagePromptsForModalsAndBanners or fFlagPromptsHandlerEnabled then v.category else nil,
							surfacing = v.surfacing
						}
					else
						sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToBuildClientBindingConfig, {
							debugName = if fFlagSduiImprovedErrorDimensions then nil else configCacheKey,
							name = var8,
							message = `{status_1}`
						}, surfaceKey)
					end
					if v.title and t_1[var9] then
						t_1[var9].title = v.title
					end
				elseif not fFlagSduiClientTemplateCache or not enableTemplateCache then
					sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToMapRobloxComponentToTemplate, {
						debugName = if fFlagSduiImprovedErrorDimensions then nil else configCacheKey,
						name = var8,
						message = `Missing template for robloxComponentType {var8}`
					}, surfaceKey)
				end
			else
				sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToAddTemplates, {
					message = "Page entry missing robloxComponentType",
					debugName = if fFlagSduiImprovedErrorDimensions then nil else configCacheKey,
					name = if fFlagSduiImprovedErrorDimensions then configCacheKey else nil
				}, surfaceKey)
			end
		else
			t_1[var9] = t_1[var9] or {}
			
			if buildNextPageUrl then
				t_1[var9].nextPageUrl = buildNextPageUrl(status) or ""
			else
				t_1[var9].nextPageUrl = ""
			end
			if fFlagSduiPaginatePostBody and var2 then
				var8 = var2(status)
				t_1[var9].nextPagePostBody = var8 or cryoModule.None
			end
		end
	end
	if not next(t_1) and not paginateResponse and (if fFlagSduiAllowNoConfigsBuilt then not var3 else true) then
		sduiLogger.reportError(sduiErrors.SduiErrorType.NoComponentConfigsBuilt, {
			debugName = if fFlagSduiImprovedErrorDimensions then nil else configCacheKey,
			name = if fFlagSduiImprovedErrorDimensions then configCacheKey else nil,
			message = `No configs built when handling proto response for {configCacheKey}`
		}, surfaceKey)
	end
	loadTimer.logSduiTreeBuildEnd()
	
	if fFlagSduiGameIconSupport then
		local function getTemplateForRobloxComponent(p5)
			-- upvalues: fFlagSduiClientTemplateCache (copy), enableTemplateCache (ref), resolveTemplateForRobloxComponent (ref), t (write)
			return if fFlagSduiClientTemplateCache and enableTemplateCache then resolveTemplateForRobloxComponent(p5) else t[p5]
		end
		
		local function getKnownTemplates()
			-- upvalues: t (write), fFlagSduiClientTemplateCache (copy), enableTemplateCache (ref), getSduiTemplateStoreModule (copy), surfaceKey (ref)
			local t_1 = {}
			
			for i, v in t do
				table.insert(t_1, v)
			end
			if fFlagSduiClientTemplateCache and enableTemplateCache then
				local var13 = getSduiTemplateStoreModule()
				
				for i_1, v_1 in var13.getCachedRobloxComponentToTemplateId(surfaceKey) do
					local template = var13.getTemplate(v_1)
					
					if template ~= nil then
						table.insert(t_1, template)
					end
				end
			end
			return t_1
		end
		
		loadTimer.logSduiClientHintsBegin()
		local ok_1, status_1 = pcall(function()
			-- upvalues: processClientHintsModule (copy), var4 (ref), getTemplateForRobloxComponent (ref), getKnownTemplates (ref)
			processClientHintsModule({
				pageEntries = var4,
				getTemplateForRobloxComponent = getTemplateForRobloxComponent,
				getKnownTemplates = getKnownTemplates
			})
		end)
		loadTimer.logSduiClientHintsEnd()
		
		if not ok_1 then
			sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToProcessClientHints, { name = configCacheKey, message = status_1 }, surfaceKey)
		end
	end
	if fFlagSduiApiStoreOnSuccessAndRefresh then
		return t_1, status
	end
	return t_1
end