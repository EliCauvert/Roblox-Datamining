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
local getSduiClientBindingBuilder = sduiCoreSystemModule.getSduiClientBindingBuilder
local createBuilderConfig = sduiCoreSystemModule.createBuilderConfig
local getSduiDataBinder = sduiCoreSystemModule.getSduiDataBinder
local fFlagSduiAllowNoConfigsBuilt = require(parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local fFlagSduiInputDataMergeStrategy = require(parent.SharedFlags).FFlagSduiInputDataMergeStrategy
local fFlagSduiLocalizedLiterals = require(parent.SharedFlags).FFlagSduiLocalizedLiterals
local fFlagSduiAlwaysCacheWithIdentifier = require(parent.SharedFlags).FFlagSduiAlwaysCacheWithIdentifier
local fFlagSduiNilHydrationGuard = require(parent.SharedFlags).FFlagSduiNilHydrationGuard
local fFlagSduiChartsSupport = require(parent.SharedFlags).FFlagSduiChartsSupport
local fFlagEnableSduiV2HomepagePrompts = require(parent.SharedFlags).FFlagEnableSduiV2HomepagePrompts
local fFlagEnableHomepagePromptsForModalsAndBanners = require(parent.SharedFlags).FFlagEnableHomepagePromptsForModalsAndBanners
local fFlagPromptsHandlerEnabled = require(parent.SharedFlags).FFlagPromptsHandlerEnabled
local fFlagSduiImprovedErrorDimensions = require(parent.SharedFlags).FFlagSduiImprovedErrorDimensions
local fFlagSduiUsageTelemetry = require(parent.SharedFlags).FFlagSduiUsageTelemetry
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagSduiEventDetailsSupport = require(parent.SharedFlags).FFlagSduiEventDetailsSupport
local fFlagSduiPageEntrySurfacing = require(parent.SharedFlags).FFlagSduiPageEntrySurfacing
local fFlagEnableSduiV2HomeInterleave = require(parent.SharedFlags).FFlagEnableSduiV2HomeInterleave
local fFlagLuaAppSduiStreamingChunkedResponses = require(parent.SharedFlags).FFlagLuaAppSduiStreamingChunkedResponses
local fFlagSduiClientTemplateCache = require(parent.SharedFlags).FFlagSduiClientTemplateCache

local function mergeTables(p0, p1) --[[ line: 54 ]]
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

local function _(p2, p3) --[[ line: 76 | named "getUpdatedInputData" ]]
	-- upvalues: mergeTables (ref)
	local cloned = table.clone(p2)
	mergeTables(cloned, p3)
	
	return cloned
end

return function(p4) --[[ line: 93 | named "handleSduiApiResponse" ]]
	-- upvalues: fFlagSduiAllowNoConfigsBuilt (ref), fFlagSduiInputDataMergeStrategy (ref), sduiRequestStatus (ref), sduiLogger (ref), sduiErrors (ref), fFlagSduiImprovedErrorDimensions (ref), fFlagSduiNilHydrationGuard (ref), getSduiDataBinder (ref), fFlagSduiClientTemplateCache (ref), getSduiTemplateStoreModule (ref), fFlagSduiUsageTelemetry (ref), recordTemplateUsage (ref), sduiUsageRecorder (ref), fFlagSduiLocalizedLiterals (ref), sduiProtobufResponseHelpersModule (ref), fFlagSduiAlwaysCacheWithIdentifier (ref), fFlagEnableSduiV2HomeInterleave (ref), fFlagLuaAppSduiStreamingChunkedResponses (ref), sduiInputDataMergeModule (ref), mergeTables (ref), createBuilderConfig (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref), getSduiClientBindingBuilder (ref), fFlagSduiChartsSupport (ref), fFlagEnableSduiV2HomepagePrompts (ref), fFlagPromptsHandlerEnabled (ref), fFlagEnableHomepagePromptsForModalsAndBanners (ref), fFlagSduiPageEntrySurfacing (ref)
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
	local var8 = if fFlagSduiAllowNoConfigsBuilt then p4.allowNoConfigsBuilt else nil
	local var9 = if fFlagSduiInputDataMergeStrategy then p4.mergeStrategy else nil
	assert(configCacheKey, "configCacheKey must exist")
	loadTimer.logNetRequestStats(response.Stats)
	loadTimer.logResponseDecodeBegin()
	local ok, status = pcall(function() --[[ line: 147 ]]
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
		local ok_1, status_1 = pcall(function() --[[ line: 171 ]]
			-- upvalues: parseHydrationDataFromResponse (ref), status (ref), fFlagSduiNilHydrationGuard (copy), getSduiDataBinder (copy)
			local var24 = parseHydrationDataFromResponse(status)
			
			if fFlagSduiNilHydrationGuard then
				if var24 == nil then
					return
				else
					getSduiDataBinder().updateDataStores(var24)
					
					return
				end
			else
				getSduiDataBinder().updateDataStores(var24)
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
		local ok_1, status_1 = pcall(function() --[[ line: 196 ]]
			-- upvalues: t (write), parseTemplateEntriesFromResponse (ref), status (ref), fFlagSduiClientTemplateCache (copy), enableTemplateCache (ref), getSduiTemplateStoreModule (copy), surfaceKey (ref), fFlagSduiUsageTelemetry (copy), recordTemplateUsage (copy), sduiUsageRecorder (copy)
			local _ = nil
			local _ = nil
			local var25, var26, var27 = parseTemplateEntriesFromResponse(status, if fFlagSduiClientTemplateCache then enableTemplateCache else nil)
			t = var26
			getSduiTemplateStoreModule().addTemplates(var25)
			
			if fFlagSduiClientTemplateCache and enableTemplateCache then
				getSduiTemplateStoreModule().recordSurfaceTemplates(surfaceKey, var27)
			end
			if fFlagSduiUsageTelemetry and var25 then
				for i, v in var25 do
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
	local var11 = if parsePageEntriesFromResponse then parsePageEntriesFromResponse(status) else {}
	local var12 = if fFlagSduiLocalizedLiterals then sduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse(status) else nil
	
	local function resolveTemplateForRobloxComponent(p5) --[[ line: 256 ]]
		-- upvalues: t (write), getSduiTemplateStoreModule (copy), surfaceKey (ref), sduiLogger (copy), sduiErrors (copy), fFlagSduiImprovedErrorDimensions (copy), configCacheKey (ref)
		local var28 = t[p5]
		
		if var28 == nil then
			var28 = getSduiTemplateStoreModule().getTemplateForRobloxComponent(surfaceKey, p5)
		end
		if var28 == nil then
			sduiLogger.reportError(sduiErrors.SduiErrorType.MissingCachedTemplate, {
				debugName = if fFlagSduiImprovedErrorDimensions then nil else configCacheKey,
				name = p5,
				message = `Backend omitted template for {p5} but it could not be resolved from the surface cache + template store`
			}, surfaceKey)
		end
		return var28
	end
	
	local t_1 = {}
	local var15 = #var11 > 1
	
	for i, v in var11 do
		local var18_1
		local identifier = v.identifier
		local var16 = if (var15 or fFlagSduiAlwaysCacheWithIdentifier or fFlagEnableSduiV2HomeInterleave and p4.cacheSingleEntryWithIdentifier) and (identifier and identifier ~= "") then `{configCacheKey}_{identifier}` else configCacheKey
		local componentInputData = v.componentInputData
		local var17 = getInputDataSignalsForRequest(var16)
		local var18 = var17.get(false)
		local enableStreamingMerge = fFlagLuaAppSduiStreamingChunkedResponses and p4.enableStreamingMerge
		
		if not paginateResponse and not enableStreamingMerge or not var18 then
			var17.set(componentInputData)
		elseif componentInputData then
			local var20
			local _ = nil
			
			if fFlagSduiInputDataMergeStrategy then
				var20 = sduiInputDataMergeModule.merge(var17.get(false), componentInputData, var9)
			else
				local cloned = table.clone(var17.get(false))
				mergeTables(cloned, componentInputData)
				var20 = cloned
			end
			var17.set(var20)
		end
		if not paginateResponse then
			var18_1 = enableStreamingMerge and var18
		end
		if var18_1 then
			var18_1 = v.robloxComponentType
			
			if var18_1 then
				local var23 = if fFlagSduiClientTemplateCache and enableTemplateCache then resolveTemplateForRobloxComponent(var18_1) else t[var18_1]
				
				if var23 then
					local ok_1, status_1 = pcall(function() --[[ line: 334 ]]
						-- upvalues: createBuilderConfig (copy), surfaceKey (ref), configCacheKey (ref), fFlagSduiClientTemplateCache (copy), enableTemplateCache (ref), resolveTemplateForRobloxComponent (ref), t (write), var12 (ref), fFlagSduiExperienceDetailsSupport (copy), fFlagSduiEventDetailsSupport (copy), getSduiClientBindingBuilder (copy), var23 (ref), var17 (ref)
						return getSduiClientBindingBuilder().buildConfigForComponent(var23, var17.get, createBuilderConfig({
							appPage = surfaceKey,
							debugName = configCacheKey,
							getTemplateForRobloxComponent = function(p6) --[[ line: 338 ]]
								-- upvalues: fFlagSduiClientTemplateCache (copy), enableTemplateCache (copy), resolveTemplateForRobloxComponent (copy), t (copy)
								return if fFlagSduiClientTemplateCache and enableTemplateCache then resolveTemplateForRobloxComponent(p6) else t[p6]
							end,
							localizedLiterals = var12,
							configKey = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then configCacheKey else nil
						}))
					end)
					
					if ok_1 then
						if t_1[var16] then
							sduiLogger.reportError(sduiErrors.SduiErrorType.DuplicateOrMissingIdentifier, {
								debugName = if fFlagSduiImprovedErrorDimensions then nil else var16,
								name = var18_1,
								message = `Existing config found for cacheKey {var16}. Need to specify identifer in page entry for multiple configs`
							}, surfaceKey)
						end
						t_1[var16] = {
							config = status_1,
							dataUpdatedTimestamp = if fFlagSduiChartsSupport or fFlagEnableSduiV2HomeInterleave then os.clock() else nil,
							identifier = if fFlagEnableSduiV2HomepagePrompts or fFlagPromptsHandlerEnabled then identifier else nil,
							robloxComponentType = if fFlagEnableSduiV2HomepagePrompts or fFlagPromptsHandlerEnabled then var18_1 else nil,
							category = if fFlagEnableHomepagePromptsForModalsAndBanners or fFlagPromptsHandlerEnabled then v.category else nil,
							surfacing = if fFlagSduiPageEntrySurfacing then v.surfacing else nil
						}
					else
						sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToBuildClientBindingConfig, {
							debugName = if fFlagSduiImprovedErrorDimensions then nil else configCacheKey,
							name = var18_1,
							message = `{status_1}`
						}, surfaceKey)
					end
					if v.title and t_1[var16] then
						t_1[var16].title = v.title
					end
				elseif not fFlagSduiClientTemplateCache or not enableTemplateCache then
					sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToMapRobloxComponentToTemplate, {
						debugName = if fFlagSduiImprovedErrorDimensions then nil else configCacheKey,
						name = var18_1,
						message = `Missing template for robloxComponentType {var18_1}`
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
			t_1[var16] = t_1[var16] or {}
			
			if buildNextPageUrl then
				t_1[var16].nextPageUrl = buildNextPageUrl(status) or ""
			else
				t_1[var16].nextPageUrl = ""
			end
		end
	end
	if not next(t_1) and not paginateResponse and (if fFlagSduiAllowNoConfigsBuilt then not var8 else true) then
		sduiLogger.reportError(sduiErrors.SduiErrorType.NoComponentConfigsBuilt, {
			debugName = if fFlagSduiImprovedErrorDimensions then nil else configCacheKey,
			name = if fFlagSduiImprovedErrorDimensions then configCacheKey else nil,
			message = `No configs built when handling proto response for {configCacheKey}`
		}, surfaceKey)
	end
	loadTimer.logSduiTreeBuildEnd()
	
	return t_1
end