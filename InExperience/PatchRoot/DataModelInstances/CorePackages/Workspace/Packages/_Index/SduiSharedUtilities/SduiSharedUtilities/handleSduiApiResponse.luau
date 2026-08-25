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
local fFlagSduiInputDataMergeStrategy = require(parent.SharedFlags).FFlagSduiInputDataMergeStrategy
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
local fFlagSduiPageEntrySurfacing = require(parent.SharedFlags).FFlagSduiPageEntrySurfacing
local fFlagLuaAppSduiStreamingChunkedResponses = require(parent.SharedFlags).FFlagLuaAppSduiStreamingChunkedResponses
local fFlagSduiClientTemplateCache = require(parent.SharedFlags).FFlagSduiClientTemplateCache
local fFlagSduiPaginatePostBody = require(parent.SharedFlags).FFlagSduiPaginatePostBody
local fFlagSduiGameIconSupport = require(parent.SharedFlags).FFlagSduiGameIconSupport
local fFlagSduiApiStoreOnSuccessAndRefresh = require(parent.SharedFlags).FFlagSduiApiStoreOnSuccessAndRefresh
local cryoModule = require(parent.Cryo)

local function mergeTables(p0, p1)
	-- upvalues: mergeTables (ref)
	for i, v in p1 do
		if typeof(v) ~= "table" then
			p0[i] = v
			continue
		end
		if p0[i] == nil then
			p0[i] = {}
		end
		if #v > 0 then
			for i_1, v_1 in v do
				table.insert(p0[i], v_1)
			end
		else
			mergeTables(p0[i], v)
		end
	end
end

local function _(p2, p3)
	-- upvalues: mergeTables (ref)
	local cloned = table.clone(p2)
	mergeTables(cloned, p3)
	
	return cloned
end

return function(p4)
	-- upvalues: fFlagSduiPaginatePostBody (ref), fFlagSduiAllowNoConfigsBuilt (ref), fFlagSduiInputDataMergeStrategy (ref), sduiRequestStatus (ref), sduiLogger (ref), sduiErrors (ref), fFlagSduiImprovedErrorDimensions (ref), fFlagSduiNilHydrationGuard (ref), getSduiDataBinder (ref), fFlagSduiClientTemplateCache (ref), getSduiTemplateStoreModule (ref), fFlagSduiUsageTelemetry (ref), recordTemplateUsage (ref), sduiUsageRecorder (ref), sduiProtobufResponseHelpersModule (ref), fFlagSduiAlwaysCacheWithIdentifier (ref), fFlagLuaAppSduiStreamingChunkedResponses (ref), sduiInputDataMergeModule (ref), mergeTables (ref), createBuilderConfig (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagSduiChartsSortDetailGenreFilter (ref), getSduiClientBindingBuilder (ref), fFlagEnableSduiV2HomepagePrompts (ref), fFlagPromptsHandlerEnabled (ref), fFlagEnableHomepagePromptsForModalsAndBanners (ref), fFlagSduiPageEntrySurfacing (ref), cryoModule (ref), fFlagSduiGameIconSupport (ref), processClientHintsModule (ref), fFlagSduiApiStoreOnSuccessAndRefresh (ref)
	local response = p4.response
	local decodeResponse = p4.decodeResponse
	local parsePageEntriesFromResponse = p4.parsePageEntriesFromResponse
	local parseHydrationDataFromResponse = p4.parseHydrationDataFromResponse
	local parseTemplateEntriesFromResponse = p4.parseTemplateEntriesFromResponse
	local getInputDataSignalsForRequest = p4.getInputDataSignalsForRequest
	local loadTimer = p4.loadTimer
	local surfaceKey = p4.surfaceKey
	local configCacheKey = p4.configCacheKey or p4.surfaceKey
	local enableTemplateCache = p4.enableTemplateCache
	local paginateResponse = p4.paginateResponse
	local buildNextPageUrl = p4.buildNextPageUrl
	local var10 = if fFlagSduiPaginatePostBody then p4.buildNextPagePostBody else nil
	local var11 = if fFlagSduiAllowNoConfigsBuilt then p4.allowNoConfigsBuilt else nil
	local var12 = if fFlagSduiInputDataMergeStrategy then p4.mergeStrategy else nil
	assert(configCacheKey, "configCacheKey must exist")
	loadTimer.logNetRequestStats(response.Stats)
	loadTimer.logResponseDecodeBegin()
	local ok, status = pcall(function()
		-- upvalues: decodeResponse (ref), response (ref)
		return decodeResponse(response.Body)
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
			local var29 = parseHydrationDataFromResponse(status)
			
			if fFlagSduiNilHydrationGuard then
				if var29 == nil then
					return
				else
					getSduiDataBinder().updateDataStores(var29)
					
					return
				end
			else
				getSduiDataBinder().updateDataStores(var29)
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
			local var30, var31, var32 = parseTemplateEntriesFromResponse(status, if fFlagSduiClientTemplateCache then enableTemplateCache else nil)
			t = var31
			getSduiTemplateStoreModule().addTemplates(var30)
			
			if fFlagSduiClientTemplateCache and enableTemplateCache then
				getSduiTemplateStoreModule().recordSurfaceTemplates(surfaceKey, var32)
			end
			if fFlagSduiUsageTelemetry and var30 then
				for i, v in var30 do
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
	local var14 = if parsePageEntriesFromResponse then parsePageEntriesFromResponse(status) else {}
	local var15 = sduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse(status)
	
	local function resolveTemplateForRobloxComponent(p5)
		-- upvalues: t (write), getSduiTemplateStoreModule (copy), surfaceKey (ref), sduiLogger (copy), sduiErrors (copy), fFlagSduiImprovedErrorDimensions (copy), configCacheKey (ref)
		local var33 = t[p5]
		
		if var33 == nil then
			var33 = getSduiTemplateStoreModule().getTemplateForRobloxComponent(surfaceKey, p5)
		end
		if var33 == nil then
			sduiLogger.reportError(sduiErrors.SduiErrorType.MissingCachedTemplate, {
				debugName = if fFlagSduiImprovedErrorDimensions then nil else configCacheKey,
				name = p5,
				message = `Backend omitted template for {p5} but it could not be resolved from the surface cache + template store`
			}, surfaceKey)
		end
		return var33
	end
	
	local t_1 = {}
	local var18 = #var14 > 1
	
	for i, v in var14 do
		local var23_1
		local identifier = v.identifier
		local var21 = if (var18 or fFlagSduiAlwaysCacheWithIdentifier or p4.cacheSingleEntryWithIdentifier) and (identifier and identifier ~= "") then `{configCacheKey}_{identifier}` else configCacheKey
		local componentInputData = v.componentInputData
		local var22 = getInputDataSignalsForRequest(var21)
		local var23 = var22.get(false)
		local enableStreamingMerge = fFlagLuaAppSduiStreamingChunkedResponses and p4.enableStreamingMerge
		
		if not paginateResponse and not enableStreamingMerge or not var23 then
			var22.set(componentInputData)
		elseif componentInputData then
			local var25
			local _ = nil
			
			if fFlagSduiInputDataMergeStrategy then
				var25 = sduiInputDataMergeModule.merge(var22.get(false), componentInputData, var12)
			else
				local cloned = table.clone(var22.get(false))
				mergeTables(cloned, componentInputData)
				var25 = cloned
			end
			var22.set(var25)
		end
		if not paginateResponse then
			var23_1 = enableStreamingMerge and var23
		end
		if var23_1 then
			var23_1 = v.robloxComponentType
			
			if var23_1 then
				local var28 = if fFlagSduiClientTemplateCache and enableTemplateCache then resolveTemplateForRobloxComponent(var23_1) else t[var23_1]
				
				if var28 then
					local ok_1, status_1 = pcall(function()
						-- upvalues: createBuilderConfig (copy), surfaceKey (ref), configCacheKey (ref), fFlagSduiClientTemplateCache (copy), enableTemplateCache (ref), resolveTemplateForRobloxComponent (ref), t (write), var15 (ref), fFlagSduiExperienceDetailsSupport (copy), fFlagSduiEventDetailsSupport (copy), fFlagSduiChartsSortDetailGenreFilter (copy), getSduiClientBindingBuilder (copy), var28 (ref), var22 (ref)
						return getSduiClientBindingBuilder().buildConfigForComponent(var28, var22.get, createBuilderConfig({
							appPage = surfaceKey,
							debugName = configCacheKey,
							getTemplateForRobloxComponent = function(p6)
								-- upvalues: fFlagSduiClientTemplateCache (copy), enableTemplateCache (copy), resolveTemplateForRobloxComponent (copy), t (copy)
								return if fFlagSduiClientTemplateCache and enableTemplateCache then resolveTemplateForRobloxComponent(p6) else t[p6]
							end,
							localizedLiterals = var15,
							configKey = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport or fFlagSduiChartsSortDetailGenreFilter then configCacheKey else nil
						}))
					end)
					
					if ok_1 then
						if t_1[var21] then
							sduiLogger.reportError(sduiErrors.SduiErrorType.DuplicateOrMissingIdentifier, {
								debugName = if fFlagSduiImprovedErrorDimensions then nil else var21,
								name = var23_1,
								message = `Existing config found for cacheKey {var21}. Need to specify identifer in page entry for multiple configs`
							}, surfaceKey)
						end
						t_1[var21] = {
							config = status_1,
							dataUpdatedTimestamp = os.clock(),
							identifier = if fFlagEnableSduiV2HomepagePrompts or fFlagPromptsHandlerEnabled then identifier else nil,
							robloxComponentType = if fFlagEnableSduiV2HomepagePrompts or fFlagPromptsHandlerEnabled then var23_1 else nil,
							category = if fFlagEnableHomepagePromptsForModalsAndBanners or fFlagPromptsHandlerEnabled then v.category else nil,
							surfacing = if fFlagSduiPageEntrySurfacing then v.surfacing else nil
						}
					else
						sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToBuildClientBindingConfig, {
							debugName = if fFlagSduiImprovedErrorDimensions then nil else configCacheKey,
							name = var23_1,
							message = `{status_1}`
						}, surfaceKey)
					end
					if v.title and t_1[var21] then
						t_1[var21].title = v.title
					end
				elseif not fFlagSduiClientTemplateCache or not enableTemplateCache then
					sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToMapRobloxComponentToTemplate, {
						debugName = if fFlagSduiImprovedErrorDimensions then nil else configCacheKey,
						name = var23_1,
						message = `Missing template for robloxComponentType {var23_1}`
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
			t_1[var21] = t_1[var21] or {}
			
			if buildNextPageUrl then
				t_1[var21].nextPageUrl = buildNextPageUrl(status) or ""
			else
				t_1[var21].nextPageUrl = ""
			end
			if fFlagSduiPaginatePostBody and var10 then
				var23_1 = var10(status)
				t_1[var21].nextPagePostBody = var23_1 or cryoModule.None
			end
		end
	end
	if not next(t_1) and not paginateResponse and (if fFlagSduiAllowNoConfigsBuilt then not var11 else true) then
		sduiLogger.reportError(sduiErrors.SduiErrorType.NoComponentConfigsBuilt, {
			debugName = if fFlagSduiImprovedErrorDimensions then nil else configCacheKey,
			name = if fFlagSduiImprovedErrorDimensions then configCacheKey else nil,
			message = `No configs built when handling proto response for {configCacheKey}`
		}, surfaceKey)
	end
	loadTimer.logSduiTreeBuildEnd()
	
	if fFlagSduiGameIconSupport then
		local function getTemplateForRobloxComponent(p7)
			-- upvalues: fFlagSduiClientTemplateCache (copy), enableTemplateCache (ref), resolveTemplateForRobloxComponent (ref), t (write)
			return if fFlagSduiClientTemplateCache and enableTemplateCache then resolveTemplateForRobloxComponent(p7) else t[p7]
		end
		
		local function getKnownTemplates()
			-- upvalues: t (write), fFlagSduiClientTemplateCache (copy), enableTemplateCache (ref), getSduiTemplateStoreModule (copy), surfaceKey (ref)
			local t_1 = {}
			
			for i, v in t do
				table.insert(t_1, v)
			end
			if fFlagSduiClientTemplateCache and enableTemplateCache then
				local var35 = getSduiTemplateStoreModule()
				
				for i_1, v_1 in var35.getCachedRobloxComponentToTemplateId(surfaceKey) do
					local template = var35.getTemplate(v_1)
					
					if template ~= nil then
						table.insert(t_1, template)
					end
				end
			end
			return t_1
		end
		
		loadTimer.logSduiClientHintsBegin()
		local ok_1, status_1 = pcall(function()
			-- upvalues: processClientHintsModule (copy), var14 (ref), getTemplateForRobloxComponent (ref), getKnownTemplates (ref)
			processClientHintsModule({
				pageEntries = var14,
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