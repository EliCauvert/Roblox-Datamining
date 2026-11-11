local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local _ = require(Parent.Signals)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiLogger = SduiCoreSystemModule.SduiLogger
local SduiUsageRecorder = SduiCoreSystemModule.SduiUsageRecorder
local RecordTemplateUsage = SduiCoreSystemModule.recordTemplateUsage
local GetSduiTemplateStoreModule = require(SduiSharedUtilities.getSduiTemplateStore)
local SduiProtobufResponseHelpersModule = require(SduiSharedUtilities.SduiProtobufResponseHelpers)
local _ = require(SduiSharedUtilities.SduiLoadTimer)
local SduiRequestStatus = require(SduiSharedUtilities.SduiIntegrationTypes).SduiRequestStatus
local SduiInputDataMergeModule = require(SduiSharedUtilities.SduiInputDataMerge)
local GetSduiClientBindingBuilderFunction = SduiCoreSystemModule.getSduiClientBindingBuilder
local CreateBuilderConfigFunction = SduiCoreSystemModule.createBuilderConfig
local GetSduiDataBinderFunction = SduiCoreSystemModule.getSduiDataBinder
local FFlagSduiAllowNoConfigsBuilt = require(Parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local FFlagSduiInputDataMergeStrategy = require(Parent.SharedFlags).FFlagSduiInputDataMergeStrategy
local FFlagSduiLocalizedLiterals = require(Parent.SharedFlags).FFlagSduiLocalizedLiterals
local FFlagSduiAlwaysCacheWithIdentifier = require(Parent.SharedFlags).FFlagSduiAlwaysCacheWithIdentifier
local FFlagSduiNilHydrationGuard = require(Parent.SharedFlags).FFlagSduiNilHydrationGuard
local FFlagSduiChartsSupport = require(Parent.SharedFlags).FFlagSduiChartsSupport
local FFlagEnableSduiV2HomepagePrompts = require(Parent.SharedFlags).FFlagEnableSduiV2HomepagePrompts
local FFlagEnableHomepagePromptsForModalsAndBanners = require(Parent.SharedFlags).FFlagEnableHomepagePromptsForModalsAndBanners
local FFlagPromptsHandlerEnabled = require(Parent.SharedFlags).FFlagPromptsHandlerEnabled
local FFlagSduiImprovedErrorDimensions = require(Parent.SharedFlags).FFlagSduiImprovedErrorDimensions
local FFlagSduiUsageTelemetry = require(Parent.SharedFlags).FFlagSduiUsageTelemetry
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local FFlagSduiEventDetailsSupport = require(Parent.SharedFlags).FFlagSduiEventDetailsSupport
local FFlagSduiPageEntrySurfacing = require(Parent.SharedFlags).FFlagSduiPageEntrySurfacing
local FFlagEnableSduiV2HomeInterleave = require(Parent.SharedFlags).FFlagEnableSduiV2HomeInterleave
local FFlagLuaAppSduiStreamingChunkedResponses = require(Parent.SharedFlags).FFlagLuaAppSduiStreamingChunkedResponses
local FFlagSduiClientTemplateCache = require(Parent.SharedFlags).FFlagSduiClientTemplateCache

local function mergeTables(p1, ComponentInputData)
	-- upvalues: mergeTables (copy)
	for i, value in ComponentInputData do
		if typeof(value) ~= "table" then
			p1[i] = value
			continue
		end
		if p1[i] == nil then
			p1[i] = {}
		end
		if #value > 0 then
			for _, value1 in value do
				table.insert(p1[i], value1)
			end
		else
			mergeTables(p1[i], value)
		end
	end
end

local function _(Tbl, p2)
	-- upvalues: mergeTables (copy)
	local Copy = table.clone(Tbl)
	mergeTables(Copy, p2)
	
	return Copy
end

return function(p2)
	-- upvalues: FFlagSduiAllowNoConfigsBuilt (copy), FFlagSduiInputDataMergeStrategy (copy), SduiRequestStatus (copy), SduiLogger (copy), SduiErrors (copy), FFlagSduiImprovedErrorDimensions (copy), FFlagSduiNilHydrationGuard (copy), GetSduiDataBinderFunction (copy), FFlagSduiClientTemplateCache (copy), GetSduiTemplateStoreModule (copy), FFlagSduiUsageTelemetry (copy), RecordTemplateUsage (copy), SduiUsageRecorder (copy), FFlagSduiLocalizedLiterals (copy), SduiProtobufResponseHelpersModule (copy), FFlagSduiAlwaysCacheWithIdentifier (copy), FFlagEnableSduiV2HomeInterleave (copy), FFlagLuaAppSduiStreamingChunkedResponses (copy), SduiInputDataMergeModule (copy), mergeTables (copy), CreateBuilderConfigFunction (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagSduiEventDetailsSupport (copy), GetSduiClientBindingBuilderFunction (copy), FFlagSduiChartsSupport (copy), FFlagEnableSduiV2HomepagePrompts (copy), FFlagPromptsHandlerEnabled (copy), FFlagEnableHomepagePromptsForModalsAndBanners (copy), FFlagSduiPageEntrySurfacing (copy)
	local Response = p2.response
	local DecodeResponseFunction = p2.decodeResponse
	local ParsePageEntriesFromResponseFunction = p2.parsePageEntriesFromResponse
	local ParseHydrationDataFromResponseFunction = p2.parseHydrationDataFromResponse
	local ParseTemplateEntriesFromResponseFunction = p2.parseTemplateEntriesFromResponse
	local GetInputDataSignalsForRequestFunction = p2.getInputDataSignalsForRequest
	local LoadTimer = p2.loadTimer
	local SurfaceKey = p2.surfaceKey
	local ConfigCacheKey = p2.configCacheKey or p2.surfaceKey
	local EnableTemplateCache = p2.enableTemplateCache
	local PaginateResponse = p2.paginateResponse
	local BuildNextPageUrlFunction = p2.buildNextPageUrl
	local AllowNoConfigsBuilt = if FFlagSduiAllowNoConfigsBuilt then p2.allowNoConfigsBuilt else nil
	local MergeStrategy = if FFlagSduiInputDataMergeStrategy then p2.mergeStrategy else nil
	assert(ConfigCacheKey, "configCacheKey must exist")
	LoadTimer.logNetRequestStats(Response.Stats)
	LoadTimer.logResponseDecodeBegin()
	local Success, Result = pcall(function()
		-- upvalues: DecodeResponseFunction (copy), Response (copy)
		return (DecodeResponseFunction(Response.Body))
	end)
	LoadTimer.logResponseDecodeEnd()
	
	if not Success then
		LoadTimer.updateRequestStatus(SduiRequestStatus.FailedToLoad)
		SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToDecodeResponse, {
			debugName = if FFlagSduiImprovedErrorDimensions then nil else ConfigCacheKey,
			name = if FFlagSduiImprovedErrorDimensions then ConfigCacheKey else nil,
			message = Result
		}, SurfaceKey)
		error("Failed to decode")
	end
	LoadTimer.logResponseDataUpdateBegin()
	
	if ParseHydrationDataFromResponseFunction then
		local Success1, Result1 = pcall(function()
			-- upvalues: ParseHydrationDataFromResponseFunction (copy), Result (copy), FFlagSduiNilHydrationGuard (upval), GetSduiDataBinderFunction (upval)
			local ParseHydrationDataFromResponseResult = ParseHydrationDataFromResponseFunction(Result)
			
			if not FFlagSduiNilHydrationGuard then
				GetSduiDataBinderFunction().updateDataStores(ParseHydrationDataFromResponseResult)
			elseif ParseHydrationDataFromResponseResult ~= nil then
				GetSduiDataBinderFunction().updateDataStores(ParseHydrationDataFromResponseResult)
				
				return
			end
		end)
		
		if not Success1 then
			SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToUpdateDataStores, {
				debugName = if FFlagSduiImprovedErrorDimensions then nil else ConfigCacheKey,
				name = if FFlagSduiImprovedErrorDimensions then ConfigCacheKey else nil,
				message = Result1
			}, SurfaceKey)
		end
	end
	local t = {}
	
	if ParseTemplateEntriesFromResponseFunction then
		local Success2, Result2 = pcall(function()
			-- upvalues: t (ref), ParseTemplateEntriesFromResponseFunction (copy), Result (copy), FFlagSduiClientTemplateCache (upval), EnableTemplateCache (copy), GetSduiTemplateStoreModule (upval), SurfaceKey (copy), FFlagSduiUsageTelemetry (upval), RecordTemplateUsage (upval), SduiUsageRecorder (upval)
			local ParseTemplateEntriesFromResponseResult, ParseTemplateEntriesFromResponseResult2, ParseTemplateEntriesFromResponseResult3 = ParseTemplateEntriesFromResponseFunction(Result, if FFlagSduiClientTemplateCache then EnableTemplateCache else nil)
			t = ParseTemplateEntriesFromResponseResult2
			GetSduiTemplateStoreModule().addTemplates(ParseTemplateEntriesFromResponseResult)
			
			if FFlagSduiClientTemplateCache and EnableTemplateCache then
				GetSduiTemplateStoreModule().recordSurfaceTemplates(SurfaceKey, ParseTemplateEntriesFromResponseResult3)
			end
			if FFlagSduiUsageTelemetry and ParseTemplateEntriesFromResponseResult then
				for _, value in ParseTemplateEntriesFromResponseResult do
					pcall(RecordTemplateUsage, SurfaceKey, value)
				end
				SduiUsageRecorder.scheduleFlush()
			end
		end)
		
		if not Success2 then
			SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToAddTemplates, {
				debugName = if FFlagSduiImprovedErrorDimensions then nil else ConfigCacheKey,
				name = if FFlagSduiImprovedErrorDimensions then ConfigCacheKey else nil,
				message = Result2
			}, SurfaceKey)
		end
	end
	LoadTimer.logResponseDataUpdateEnd()
	LoadTimer.logSduiTreeBuildBegin()
	local ParsePageEntriesFromResponseResult = if ParsePageEntriesFromResponseFunction then ParsePageEntriesFromResponseFunction(Result) else {}
	local ParseLocalizedLiteralsFromResponseResult = if FFlagSduiLocalizedLiterals then SduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse(Result) else nil
	
	local function resolveTemplateForRobloxComponent(Name)
		-- upvalues: t (ref), GetSduiTemplateStoreModule (upval), SurfaceKey (copy), SduiLogger (upval), SduiErrors (upval), FFlagSduiImprovedErrorDimensions (upval), ConfigCacheKey (copy)
		local Entry = t[Name]
		
		if Entry == nil then
			Entry = GetSduiTemplateStoreModule().getTemplateForRobloxComponent(SurfaceKey, Name)
		end
		if Entry == nil then
			SduiLogger.reportError(SduiErrors.SduiErrorType.MissingCachedTemplate, {
				debugName = if FFlagSduiImprovedErrorDimensions then nil else ConfigCacheKey,
				name = Name,
				message = `Backend omitted template for {Name} but it could not be resolved from the surface cache + template store`
			}, SurfaceKey)
		end
		return Entry
	end
	
	local t1 = {}
	local v1 = #ParsePageEntriesFromResponseResult > 1
	for _, value in ParsePageEntriesFromResponseResult do
		local Identifier = value.identifier
		local Text = if (v1 or FFlagSduiAlwaysCacheWithIdentifier or FFlagEnableSduiV2HomeInterleave and p2.cacheSingleEntryWithIdentifier) and (Identifier and Identifier ~= "") then `{ConfigCacheKey}_{Identifier}` else ConfigCacheKey
		local ComponentInputData = value.componentInputData
		local InputDataSignalsForRequest = GetInputDataSignalsForRequestFunction(Text)
		local GetResult = InputDataSignalsForRequest.get(false)
		local EnableStreamingMerge = FFlagLuaAppSduiStreamingChunkedResponses and p2.enableStreamingMerge
		
		if (PaginateResponse or EnableStreamingMerge) and GetResult then
			if ComponentInputData then
				local MergeResult = nil
				if FFlagSduiInputDataMergeStrategy then
					MergeResult = SduiInputDataMergeModule.merge(InputDataSignalsForRequest.get(false), ComponentInputData, MergeStrategy)
				else
					local Copy = table.clone((InputDataSignalsForRequest.get(false)))
					mergeTables(Copy, ComponentInputData)
					MergeResult = Copy
				end
				InputDataSignalsForRequest.set(MergeResult)
			end
		else
			InputDataSignalsForRequest.set(ComponentInputData)
		end
		if not (if PaginateResponse then GetResult else EnableStreamingMerge and GetResult) then
			local RobloxComponentType = value.robloxComponentType
			
			if not RobloxComponentType then
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToAddTemplates, {
					message = "Page entry missing robloxComponentType",
					debugName = if FFlagSduiImprovedErrorDimensions then nil else ConfigCacheKey,
					name = if FFlagSduiImprovedErrorDimensions then ConfigCacheKey else nil
				}, SurfaceKey)
				continue
			end
			local ResolveTemplateForRobloxComponentResult = if FFlagSduiClientTemplateCache and EnableTemplateCache then resolveTemplateForRobloxComponent(RobloxComponentType) else t[RobloxComponentType]
			
			if ResolveTemplateForRobloxComponentResult then
				local Success3, Result3 = pcall(function()
					-- upvalues: CreateBuilderConfigFunction (upval), SurfaceKey (copy), ConfigCacheKey (copy), FFlagSduiClientTemplateCache (upval), EnableTemplateCache (copy), resolveTemplateForRobloxComponent (copy), t (ref), ParseLocalizedLiteralsFromResponseResult (copy), FFlagSduiExperienceDetailsSupport (upval), FFlagSduiEventDetailsSupport (upval), GetSduiClientBindingBuilderFunction (upval), ResolveTemplateForRobloxComponentResult (copy), InputDataSignalsForRequest (copy)
					return (GetSduiClientBindingBuilderFunction().buildConfigForComponent(ResolveTemplateForRobloxComponentResult, InputDataSignalsForRequest.get, (CreateBuilderConfigFunction({
						appPage = SurfaceKey,
						debugName = ConfigCacheKey,
						getTemplateForRobloxComponent = function(Name)
							-- upvalues: FFlagSduiClientTemplateCache (upval), EnableTemplateCache (upval), resolveTemplateForRobloxComponent (upval), t (upval)
							return if FFlagSduiClientTemplateCache and EnableTemplateCache then resolveTemplateForRobloxComponent(Name) else t[Name]
						end,
						localizedLiterals = ParseLocalizedLiteralsFromResponseResult,
						configKey = if FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport then ConfigCacheKey else nil
					}))))
				end)
				
				if Success3 then
					if t1[Text] then
						SduiLogger.reportError(SduiErrors.SduiErrorType.DuplicateOrMissingIdentifier, {
							debugName = if FFlagSduiImprovedErrorDimensions then nil else Text,
							name = RobloxComponentType,
							message = `Existing config found for cacheKey {Text}. Need to specify identifer in page entry for multiple configs`
						}, SurfaceKey)
					end
					t1[Text] = {
						config = Result3,
						dataUpdatedTimestamp = if FFlagSduiChartsSupport or FFlagEnableSduiV2HomeInterleave then os.clock() else nil,
						identifier = if FFlagEnableSduiV2HomepagePrompts or FFlagPromptsHandlerEnabled then Identifier else nil,
						robloxComponentType = if FFlagEnableSduiV2HomepagePrompts or FFlagPromptsHandlerEnabled then RobloxComponentType else nil,
						category = if FFlagEnableHomepagePromptsForModalsAndBanners or FFlagPromptsHandlerEnabled then value.category else nil,
						surfacing = if FFlagSduiPageEntrySurfacing then value.surfacing else nil
					}
				else
					SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToBuildClientBindingConfig, {
						debugName = if FFlagSduiImprovedErrorDimensions then nil else ConfigCacheKey,
						name = RobloxComponentType,
						message = `{Result3}`
					}, SurfaceKey)
				end
				if value.title and t1[Text] then
					t1[Text].title = value.title
				end
			else
				if not FFlagSduiClientTemplateCache or not EnableTemplateCache then
					SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToMapRobloxComponentToTemplate, {
						debugName = if FFlagSduiImprovedErrorDimensions then nil else ConfigCacheKey,
						name = RobloxComponentType,
						message = `Missing template for robloxComponentType {RobloxComponentType}`
					}, SurfaceKey)
					continue
				end
				continue
			end
		end
		t1[Text] = t1[Text] or {}
		
		if BuildNextPageUrlFunction then
			t1[Text].nextPageUrl = BuildNextPageUrlFunction(Result) or ""
		else
			t1[Text].nextPageUrl = ""
		end
	end
	if not next(t1) and not PaginateResponse and (not FFlagSduiAllowNoConfigsBuilt or not AllowNoConfigsBuilt) then
		SduiLogger.reportError(SduiErrors.SduiErrorType.NoComponentConfigsBuilt, {
			debugName = if FFlagSduiImprovedErrorDimensions then nil else ConfigCacheKey,
			name = if FFlagSduiImprovedErrorDimensions then ConfigCacheKey else nil,
			message = `No configs built when handling proto response for {ConfigCacheKey}`
		}, SurfaceKey)
	end
	LoadTimer.logSduiTreeBuildEnd()
	
	return t1
end