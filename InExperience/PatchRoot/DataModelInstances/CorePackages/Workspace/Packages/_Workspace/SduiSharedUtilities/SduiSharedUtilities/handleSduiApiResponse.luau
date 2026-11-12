local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local SignalsModule = require(Parent.Signals)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrors = SduiCoreSystemModule.SduiErrors
local AddSduiErrorContextFieldsFunction = SduiCoreSystemModule.addSduiErrorContextFields
local SduiLogger = SduiCoreSystemModule.SduiLogger
local SduiUsageRecorder = SduiCoreSystemModule.SduiUsageRecorder
local RecordTemplateUsage = SduiCoreSystemModule.recordTemplateUsage
local GetSduiTemplateStoreModule = require(SduiSharedUtilities.getSduiTemplateStore)
local SduiProtobufResponseHelpersModule = require(SduiSharedUtilities.SduiProtobufResponseHelpers)
local _ = require(SduiSharedUtilities.SduiLoadTimer)
local SduiRequestStatus = require(SduiSharedUtilities.SduiIntegrationTypes).SduiRequestStatus
local SduiInputDataMergeModule = require(SduiSharedUtilities.SduiInputDataMerge)
local ProcessClientHintsModule = require(SduiSharedUtilities.processClientHints)
local GetSduiClientBindingBuilderFunction = SduiCoreSystemModule.getSduiClientBindingBuilder
local CreateBuilderConfigFunction = SduiCoreSystemModule.createBuilderConfig
local GetSduiDataBinderFunction = SduiCoreSystemModule.getSduiDataBinder
local FFlagSduiErrorPaths = require(Parent.SharedFlags).FFlagSduiErrorPaths
local FFlagSduiAllowNoConfigsBuilt = require(Parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local FFlagSduiAlwaysCacheWithIdentifier = require(Parent.SharedFlags).FFlagSduiAlwaysCacheWithIdentifier
local FFlagEnableSduiV2HomepagePrompts = require(Parent.SharedFlags).FFlagEnableSduiV2HomepagePrompts
local FFlagEnableHomepagePromptsForModalsAndBanners = require(Parent.SharedFlags).FFlagEnableHomepagePromptsForModalsAndBanners
local FFlagPromptsHandlerEnabled = require(Parent.SharedFlags).FFlagPromptsHandlerEnabled
local FFlagLuaAppSduiStreamingChunkedResponses = require(Parent.SharedFlags).FFlagLuaAppSduiStreamingChunkedResponses
local FFlagLuaAppEnableSduiHomePage = require(Parent.SharedFlags).FFlagLuaAppEnableSduiHomePage
local FFlagSduiStreamingRefreshReplacesInputData = require(Parent.SharedFlags).FFlagSduiStreamingRefreshReplacesInputData
local FFlagSduiUseHttpClientModule = require(SduiSharedUtilities.Flags.FFlagSduiUseHttpClient)
local FFlagSduiFreshInputDataSignalOnRebuild = require(Parent.SharedFlags).FFlagSduiFreshInputDataSignalOnRebuild
local FFlagSduiSharedLocalizedLiterals = require(Parent.SharedFlags).FFlagSduiSharedLocalizedLiterals
local FFlagLuaAppSduiHomePageSupport = require(Parent.SharedFlags).FFlagLuaAppSduiHomePageSupport
local CryoModule = require(Parent.Cryo)

local function mergeTables(p1, List)
	-- upvalues: mergeTables (copy)
	for i, value in List do
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

local function getLocalizedLiteral(p2)
	-- upvalues: GetSduiTemplateStoreModule (copy)
	return GetSduiTemplateStoreModule().getLocalizedLiterals()[p2]
end

return function(p2)
	-- upvalues: FFlagSduiAllowNoConfigsBuilt (copy), FFlagLuaAppEnableSduiHomePage (copy), FFlagSduiStreamingRefreshReplacesInputData (copy), FFlagSduiUseHttpClientModule (copy), SduiRequestStatus (copy), SduiLogger (copy), SduiErrors (copy), GetSduiDataBinderFunction (copy), FFlagSduiErrorPaths (copy), GetSduiTemplateStoreModule (copy), RecordTemplateUsage (copy), SduiUsageRecorder (copy), SduiProtobufResponseHelpersModule (copy), FFlagSduiSharedLocalizedLiterals (copy), AddSduiErrorContextFieldsFunction (copy), FFlagSduiAlwaysCacheWithIdentifier (copy), FFlagLuaAppSduiStreamingChunkedResponses (copy), SduiInputDataMergeModule (copy), FFlagSduiFreshInputDataSignalOnRebuild (copy), SignalsModule (copy), CreateBuilderConfigFunction (copy), getLocalizedLiteral (copy), GetSduiClientBindingBuilderFunction (copy), FFlagLuaAppSduiHomePageSupport (copy), FFlagEnableSduiV2HomepagePrompts (copy), FFlagPromptsHandlerEnabled (copy), FFlagEnableHomepagePromptsForModalsAndBanners (copy), CryoModule (copy), ProcessClientHintsModule (copy)
	local Response = p2.response
	local DecodeResponseFunction = p2.decodeResponse
	local ParsePageEntriesFromResponseFunction = p2.parsePageEntriesFromResponse
	local ParseHydrationDataFromResponseFunction = p2.parseHydrationDataFromResponse
	local ParseTemplateEntriesFromResponseFunction = p2.parseTemplateEntriesFromResponse
	local ParseLocalizedLiteralsFromResponseFunction = p2.parseLocalizedLiteralsFromResponse
	local GetInputDataSignalsForRequestFunction = p2.getInputDataSignalsForRequest
	local SetInputDataSignalsForRequestFunction: (any, any, any) -> () = p2.setInputDataSignalsForRequest
	local LoadTimer = p2.loadTimer
	local SurfaceKey = p2.surfaceKey
	local ConfigCacheKey = p2.configCacheKey or p2.surfaceKey
	local EnableTemplateCache = p2.enableTemplateCache
	local PaginateResponse = p2.paginateResponse
	local BuildNextPageUrlFunction = p2.buildNextPageUrl
	local BuildNextPagePostBodyFunction = p2.buildNextPagePostBody
	local AllowNoConfigsBuilt = if FFlagSduiAllowNoConfigsBuilt then p2.allowNoConfigsBuilt else nil
	local MergeStrategy = p2.mergeStrategy
	local EnableInputDataMerge = if FFlagLuaAppEnableSduiHomePage then p2.enableInputDataMerge else FFlagSduiStreamingRefreshReplacesInputData and p2.enableInputDataMerge
	assert(ConfigCacheKey, "configCacheKey must exist")
	LoadTimer.logNetRequestStats(if FFlagSduiUseHttpClientModule then Response.stats or {} else Response.Stats)
	LoadTimer.logResponseDecodeBegin()
	local Success, Result = pcall(function()
		-- upvalues: DecodeResponseFunction (copy), FFlagSduiUseHttpClientModule (upval), Response (copy)
		return (DecodeResponseFunction(if FFlagSduiUseHttpClientModule then Response.responseBody else Response.Body))
	end)
	LoadTimer.logResponseDecodeEnd()
	
	if not Success then
		LoadTimer.updateRequestStatus(SduiRequestStatus.FailedToLoad)
		SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToDecodeResponse, { name = ConfigCacheKey, message = Result }, SurfaceKey)
		error("Failed to decode")
	end
	LoadTimer.logResponseDataUpdateBegin()
	
	if ParseHydrationDataFromResponseFunction then
		local Success1, Result1 = pcall(function()
			-- upvalues: ParseHydrationDataFromResponseFunction (copy), Result (copy), GetSduiDataBinderFunction (upval)
			local ParseHydrationDataFromResponseResult = ParseHydrationDataFromResponseFunction(Result)
			
			if ParseHydrationDataFromResponseResult ~= nil then
				GetSduiDataBinderFunction().updateDataStores(ParseHydrationDataFromResponseResult)
			end
		end)
		
		if not Success1 then
			SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToUpdateDataStores, { name = ConfigCacheKey, message = Result1 }, SurfaceKey)
		end
	end
	local t = {}
	local v1 = nil
	
	if ParseTemplateEntriesFromResponseFunction then
		local Success2, Result2 = pcall(function()
			-- upvalues: t (ref), ParseTemplateEntriesFromResponseFunction (copy), Result (copy), FFlagSduiErrorPaths (upval), EnableTemplateCache (copy), v1 (ref), GetSduiTemplateStoreModule (upval), SurfaceKey (copy), RecordTemplateUsage (upval), SduiUsageRecorder (upval)
			local ParseTemplateEntriesFromResponseResult, ParseTemplateEntriesFromResponseResult2, ParseTemplateEntriesFromResponseResult3 = ParseTemplateEntriesFromResponseFunction(Result, if FFlagSduiErrorPaths then true else EnableTemplateCache)
			t = ParseTemplateEntriesFromResponseResult2
			
			if FFlagSduiErrorPaths and not EnableTemplateCache then
				v1 = ParseTemplateEntriesFromResponseResult3
			end
			GetSduiTemplateStoreModule().addTemplates(ParseTemplateEntriesFromResponseResult)
			
			if EnableTemplateCache then
				GetSduiTemplateStoreModule().recordSurfaceTemplates(SurfaceKey, ParseTemplateEntriesFromResponseResult3)
			end
			if ParseTemplateEntriesFromResponseResult then
				for _, value in ParseTemplateEntriesFromResponseResult do
					pcall(RecordTemplateUsage, SurfaceKey, value)
				end
				SduiUsageRecorder.scheduleFlush()
			end
		end)
		
		if not Success2 then
			SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToAddTemplates, { name = ConfigCacheKey, message = Result2 }, SurfaceKey)
		end
	end
	local function getTemplateIdForRCT(p3)
		-- upvalues: EnableTemplateCache (copy), GetSduiTemplateStoreModule (upval), SurfaceKey (copy), v1 (ref)
		return if EnableTemplateCache then GetSduiTemplateStoreModule().getCachedRobloxComponentToTemplateId(SurfaceKey)[p3] else v1 and v1[p3]
	end
	
	local function createErrorContextForRCT(RobloxComponentType, p3)
		-- upvalues: SurfaceKey (copy), EnableTemplateCache (copy), GetSduiTemplateStoreModule (upval), v1 (ref)
		local FullName = nil
		
		if p3 then
			FullName = if RobloxComponentType then `{SurfaceKey}.{RobloxComponentType}` else SurfaceKey
			local Identifier = p3.identifier
			
			if Identifier and Identifier ~= "" then
				FullName = `{FullName}[{Identifier}]`
			end
		end
		return {
			fullName = FullName,
			rctPath = RobloxComponentType,
			templateId = if RobloxComponentType then if EnableTemplateCache then GetSduiTemplateStoreModule().getCachedRobloxComponentToTemplateId(SurfaceKey)[RobloxComponentType] else v1 and v1[RobloxComponentType] else nil
		}
	end
	
	LoadTimer.logResponseDataUpdateEnd()
	LoadTimer.logSduiTreeBuildBegin()
	local ParsePageEntriesFromResponseResult = if ParsePageEntriesFromResponseFunction then ParsePageEntriesFromResponseFunction(Result) else {}
	local ParseLocalizedLiteralsFromResponseResult = if ParseLocalizedLiteralsFromResponseFunction then ParseLocalizedLiteralsFromResponseFunction(Result) else SduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse(Result)
	
	if FFlagSduiSharedLocalizedLiterals and ParseLocalizedLiteralsFromResponseResult then
		GetSduiTemplateStoreModule().addLocalizedLiterals(ParseLocalizedLiteralsFromResponseResult)
	end
	local function resolveTemplateForRobloxComponent(Name, p3)
		-- upvalues: t (ref), GetSduiTemplateStoreModule (upval), SurfaceKey (copy), FFlagSduiErrorPaths (upval), AddSduiErrorContextFieldsFunction (upval), createErrorContextForRCT (copy), SduiLogger (upval), SduiErrors (upval)
		local Entry = t[Name]
		
		if Entry == nil then
			Entry = GetSduiTemplateStoreModule().getTemplateForRobloxComponent(SurfaceKey, Name)
		end
		if Entry == nil then
			local config = {
				name = Name,
				message = `Backend omitted template for {Name} but it could not be resolved from the surface cache + template store`
			}
			
			if FFlagSduiErrorPaths then
				AddSduiErrorContextFieldsFunction(config, (createErrorContextForRCT(Name, p3)))
			end
			SduiLogger.reportError(SduiErrors.SduiErrorType.MissingCachedTemplate, config, SurfaceKey)
		end
		return Entry
	end
	
	local t1 = {}
	local v2 = nil
	local v3 = #ParsePageEntriesFromResponseResult > 1
	for _, value in ParsePageEntriesFromResponseResult do
		local Identifier = value.identifier
		local Text = if (v3 or FFlagSduiAlwaysCacheWithIdentifier or p2.cacheSingleEntryWithIdentifier) and (Identifier and Identifier ~= "") then `{ConfigCacheKey}_{Identifier}` else ConfigCacheKey
		local ComponentInputData = value.componentInputData
		local InputDataSignalsForRequest = GetInputDataSignalsForRequestFunction(Text)
		local GetResult = InputDataSignalsForRequest.get(false)
		local EnableStreamingMerge = FFlagLuaAppSduiStreamingChunkedResponses and p2.enableStreamingMerge
		
		if (PaginateResponse or (if FFlagLuaAppEnableSduiHomePage or FFlagSduiStreamingRefreshReplacesInputData then EnableInputDataMerge else EnableStreamingMerge)) and GetResult then
			if ComponentInputData then
				InputDataSignalsForRequest.set((SduiInputDataMergeModule.merge(InputDataSignalsForRequest.get(false), ComponentInputData, MergeStrategy)))
			end
		else
			if FFlagSduiFreshInputDataSignalOnRebuild and SetInputDataSignalsForRequestFunction then
				local Signal, Signal2 = SignalsModule.createSignal(nil)
				InputDataSignalsForRequest = { get = Signal, set = Signal2 }
			end
			InputDataSignalsForRequest.set(ComponentInputData)
		end
		if not (if PaginateResponse then GetResult else (if FFlagLuaAppEnableSduiHomePage or FFlagSduiStreamingRefreshReplacesInputData then EnableInputDataMerge else EnableStreamingMerge) and GetResult) then
			local RobloxComponentType = value.robloxComponentType
			
			if RobloxComponentType then
				local ResolveTemplateForRobloxComponentResult = if EnableTemplateCache then resolveTemplateForRobloxComponent(RobloxComponentType, if FFlagSduiErrorPaths then value else nil) else t[RobloxComponentType]
				
				if not ResolveTemplateForRobloxComponentResult then
					if not EnableTemplateCache then
						local config = {
							name = RobloxComponentType,
							message = `Missing template for robloxComponentType {RobloxComponentType}`
						}
						
						if FFlagSduiErrorPaths then
							AddSduiErrorContextFieldsFunction(config, (createErrorContextForRCT(RobloxComponentType, value)))
						end
						SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToMapRobloxComponentToTemplate, config, SurfaceKey)
						continue
					end
					continue
				end
				local Success3, Result3 = pcall(function()
					-- upvalues: CreateBuilderConfigFunction (upval), SurfaceKey (copy), ConfigCacheKey (copy), EnableTemplateCache (copy), resolveTemplateForRobloxComponent (copy), t (ref), FFlagSduiErrorPaths (upval), getTemplateIdForRCT (copy), FFlagSduiSharedLocalizedLiterals (upval), ParseLocalizedLiteralsFromResponseResult (copy), getLocalizedLiteral (upval), GetSduiClientBindingBuilderFunction (upval), ResolveTemplateForRobloxComponentResult (copy), FFlagLuaAppSduiHomePageSupport (upval), value (copy), InputDataSignalsForRequest (ref), RobloxComponentType (copy), Identifier (copy)
					return (GetSduiClientBindingBuilderFunction().buildConfigForComponent(ResolveTemplateForRobloxComponentResult, if FFlagLuaAppSduiHomePageSupport and value.componentInputDataGetter then value.componentInputDataGetter else InputDataSignalsForRequest.get, CreateBuilderConfigFunction({
						appPage = SurfaceKey,
						debugName = ConfigCacheKey,
						getTemplateForRobloxComponent = function(Name)
							-- upvalues: EnableTemplateCache (upval), resolveTemplateForRobloxComponent (upval), t (upval)
							return if EnableTemplateCache then resolveTemplateForRobloxComponent(Name) else t[Name]
						end,
						getTemplateIdForRCT = if FFlagSduiErrorPaths then getTemplateIdForRCT else nil,
						localizedLiterals = if FFlagSduiSharedLocalizedLiterals then nil else ParseLocalizedLiteralsFromResponseResult,
						getLocalizedLiteral = if FFlagSduiSharedLocalizedLiterals then getLocalizedLiteral else nil,
						configKey = ConfigCacheKey
					}), nil, nil, nil, nil, if FFlagSduiErrorPaths then RobloxComponentType else nil, if FFlagSduiErrorPaths then Identifier else nil))
				end)
				
				if Success3 then
					if FFlagSduiFreshInputDataSignalOnRebuild and SetInputDataSignalsForRequestFunction then
						if v2 == nil then
							v2 = {}
						end
						v2[Text] = InputDataSignalsForRequest
					end
					if t1[Text] then
						local config1 = {
							name = RobloxComponentType,
							message = `Existing config found for cacheKey {Text}. Need to specify identifer in page entry for multiple configs`
						}
						
						if FFlagSduiErrorPaths then
							AddSduiErrorContextFieldsFunction(config1, Result3 and Result3.errorContext)
						end
						SduiLogger.reportError(SduiErrors.SduiErrorType.DuplicateOrMissingIdentifier, config1, SurfaceKey)
					end
					t1[Text] = {
						config = Result3,
						dataUpdatedTimestamp = os.clock(),
						identifier = if FFlagEnableSduiV2HomepagePrompts or FFlagPromptsHandlerEnabled then Identifier else nil,
						robloxComponentType = if FFlagEnableSduiV2HomepagePrompts or FFlagPromptsHandlerEnabled then RobloxComponentType else nil,
						category = if FFlagEnableHomepagePromptsForModalsAndBanners or FFlagPromptsHandlerEnabled then value.category else nil,
						surfacing = value.surfacing
					}
				else
					local config = { name = RobloxComponentType, message = `{Result3}` }
					
					if FFlagSduiErrorPaths then
						AddSduiErrorContextFieldsFunction(config, (createErrorContextForRCT(RobloxComponentType, value)))
					end
					SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToBuildClientBindingConfig, config, SurfaceKey)
				end
				if value.title and t1[Text] then
					t1[Text].title = value.title
				end
			else
				local config = {
					message = "Page entry missing robloxComponentType",
					name = ConfigCacheKey
				}
				
				if FFlagSduiErrorPaths then
					local FullName: string? = nil
					
					if value then
						FullName = SurfaceKey
						local Identifier1 = value.identifier
						
						if Identifier1 and Identifier1 ~= "" then
							FullName = `{FullName}[{Identifier1}]`
						end
					end
					AddSduiErrorContextFieldsFunction(config, { rctPath = nil, templateId = nil, fullName = FullName })
				end
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToAddTemplates, config, SurfaceKey)
				continue
			end
		end
		t1[Text] = t1[Text] or {}
		
		if BuildNextPageUrlFunction then
			t1[Text].nextPageUrl = BuildNextPageUrlFunction(Result) or ""
		else
			t1[Text].nextPageUrl = ""
		end
		if BuildNextPagePostBodyFunction then
			local NextPagePostBody = BuildNextPagePostBodyFunction(Result)
			t1[Text].nextPagePostBody = if NextPagePostBody then NextPagePostBody else CryoModule.None
		end
	end
	if FFlagSduiFreshInputDataSignalOnRebuild and SetInputDataSignalsForRequestFunction and v2 then
		for i, value1 in v2 do
			SetInputDataSignalsForRequestFunction(ConfigCacheKey, i, value1)
		end
	end
	if not next(t1) and not PaginateResponse and (not FFlagSduiAllowNoConfigsBuilt or not AllowNoConfigsBuilt) then
		SduiLogger.reportError(SduiErrors.SduiErrorType.NoComponentConfigsBuilt, {
			name = ConfigCacheKey,
			message = `No configs built when handling proto response for {ConfigCacheKey}`
		}, SurfaceKey)
	end
	LoadTimer.logSduiTreeBuildEnd()
	
	local function getTemplateForRobloxComponent(Name)
		-- upvalues: EnableTemplateCache (copy), resolveTemplateForRobloxComponent (copy), t (ref)
		return if EnableTemplateCache then resolveTemplateForRobloxComponent(Name) else t[Name]
	end
	
	local function getKnownTemplates()
		-- upvalues: t (ref), EnableTemplateCache (copy), GetSduiTemplateStoreModule (upval), SurfaceKey (copy)
		local List = {}
		
		for _, value in t do
			table.insert(List, value)
		end
		if EnableTemplateCache then
			local SduiTemplateStoreModule = GetSduiTemplateStoreModule()
			
			for _, value1 in SduiTemplateStoreModule.getCachedRobloxComponentToTemplateId(SurfaceKey) do
				local Template = SduiTemplateStoreModule.getTemplate(value1)
				
				if Template ~= nil then
					table.insert(List, Template)
				end
			end
		end
		return List
	end
	
	LoadTimer.logSduiClientHintsBegin()
	local Success4, Result4 = pcall(function()
		-- upvalues: ProcessClientHintsModule (upval), ParsePageEntriesFromResponseResult (copy), getTemplateForRobloxComponent (copy), getKnownTemplates (copy)
		ProcessClientHintsModule({
			pageEntries = ParsePageEntriesFromResponseResult,
			getTemplateForRobloxComponent = getTemplateForRobloxComponent,
			getKnownTemplates = getKnownTemplates
		})
	end)
	LoadTimer.logSduiClientHintsEnd()
	
	if not Success4 then
		SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToProcessClientHints, { name = ConfigCacheKey, message = Result4 }, SurfaceKey)
	end
	return t1, Result
end