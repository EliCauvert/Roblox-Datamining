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
local ProcessClientHintsModule = require(SduiSharedUtilities.processClientHints)
local GetSduiClientBindingBuilderFunction = SduiCoreSystemModule.getSduiClientBindingBuilder
local CreateBuilderConfigFunction = SduiCoreSystemModule.createBuilderConfig
local GetSduiDataBinderFunction = SduiCoreSystemModule.getSduiDataBinder
local FFlagSduiAllowNoConfigsBuilt = require(Parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local FFlagSduiAlwaysCacheWithIdentifier = require(Parent.SharedFlags).FFlagSduiAlwaysCacheWithIdentifier
local FFlagEnableSduiV2HomepagePrompts = require(Parent.SharedFlags).FFlagEnableSduiV2HomepagePrompts
local FFlagEnableHomepagePromptsForModalsAndBanners = require(Parent.SharedFlags).FFlagEnableHomepagePromptsForModalsAndBanners
local FFlagPromptsHandlerEnabled = require(Parent.SharedFlags).FFlagPromptsHandlerEnabled
local FFlagLuaAppSduiStreamingChunkedResponses = require(Parent.SharedFlags).FFlagLuaAppSduiStreamingChunkedResponses
local FFlagLuaAppEnableSduiHomePage = require(Parent.SharedFlags).FFlagLuaAppEnableSduiHomePage
local FFlagSduiStreamingRefreshReplacesInputData = require(Parent.SharedFlags).FFlagSduiStreamingRefreshReplacesInputData
local FFlagSduiUseHttpClientModule = require(SduiSharedUtilities.Flags.FFlagSduiUseHttpClient)
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

return function(p2)
	-- upvalues: FFlagSduiAllowNoConfigsBuilt (copy), FFlagLuaAppEnableSduiHomePage (copy), FFlagSduiStreamingRefreshReplacesInputData (copy), FFlagSduiUseHttpClientModule (copy), SduiRequestStatus (copy), SduiLogger (copy), SduiErrors (copy), GetSduiDataBinderFunction (copy), GetSduiTemplateStoreModule (copy), RecordTemplateUsage (copy), SduiUsageRecorder (copy), SduiProtobufResponseHelpersModule (copy), FFlagSduiAlwaysCacheWithIdentifier (copy), FFlagLuaAppSduiStreamingChunkedResponses (copy), SduiInputDataMergeModule (copy), CreateBuilderConfigFunction (copy), GetSduiClientBindingBuilderFunction (copy), FFlagLuaAppSduiHomePageSupport (copy), FFlagEnableSduiV2HomepagePrompts (copy), FFlagPromptsHandlerEnabled (copy), FFlagEnableHomepagePromptsForModalsAndBanners (copy), CryoModule (copy), ProcessClientHintsModule (copy)
	local Response = p2.response
	local DecodeResponseFunction = p2.decodeResponse
	local ParsePageEntriesFromResponseFunction = p2.parsePageEntriesFromResponse
	local ParseHydrationDataFromResponseFunction = p2.parseHydrationDataFromResponse
	local ParseTemplateEntriesFromResponseFunction = p2.parseTemplateEntriesFromResponse
	local ParseLocalizedLiteralsFromResponseFunction = p2.parseLocalizedLiteralsFromResponse
	local GetInputDataSignalsForRequestFunction = p2.getInputDataSignalsForRequest
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
	
	if ParseTemplateEntriesFromResponseFunction then
		local Success2, Result2 = pcall(function()
			-- upvalues: t (ref), ParseTemplateEntriesFromResponseFunction (copy), Result (copy), EnableTemplateCache (copy), GetSduiTemplateStoreModule (upval), SurfaceKey (copy), RecordTemplateUsage (upval), SduiUsageRecorder (upval)
			local ParseTemplateEntriesFromResponseResult, ParseTemplateEntriesFromResponseResult2, ParseTemplateEntriesFromResponseResult3 = ParseTemplateEntriesFromResponseFunction(Result, EnableTemplateCache)
			t = ParseTemplateEntriesFromResponseResult2
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
	LoadTimer.logResponseDataUpdateEnd()
	LoadTimer.logSduiTreeBuildBegin()
	local ParsePageEntriesFromResponseResult = if ParsePageEntriesFromResponseFunction then ParsePageEntriesFromResponseFunction(Result) else {}
	local ParseLocalizedLiteralsFromResponseResult = if ParseLocalizedLiteralsFromResponseFunction then ParseLocalizedLiteralsFromResponseFunction(Result) else SduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse(Result)
	
	local function resolveTemplateForRobloxComponent(Name)
		-- upvalues: t (ref), GetSduiTemplateStoreModule (upval), SurfaceKey (copy), SduiLogger (upval), SduiErrors (upval)
		local Entry = t[Name]
		
		if Entry == nil then
			Entry = GetSduiTemplateStoreModule().getTemplateForRobloxComponent(SurfaceKey, Name)
		end
		if Entry == nil then
			SduiLogger.reportError(SduiErrors.SduiErrorType.MissingCachedTemplate, {
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
		local Text = if (v1 or FFlagSduiAlwaysCacheWithIdentifier or p2.cacheSingleEntryWithIdentifier) and (Identifier and Identifier ~= "") then `{ConfigCacheKey}_{Identifier}` else ConfigCacheKey
		local ComponentInputData = value.componentInputData
		local InputDataSignalsForRequest = GetInputDataSignalsForRequestFunction(Text)
		local GetResult = InputDataSignalsForRequest.get(false)
		local EnableStreamingMerge = FFlagLuaAppSduiStreamingChunkedResponses and p2.enableStreamingMerge
		
		if (PaginateResponse or (if FFlagLuaAppEnableSduiHomePage or FFlagSduiStreamingRefreshReplacesInputData then EnableInputDataMerge else EnableStreamingMerge)) and GetResult then
			if ComponentInputData then
				InputDataSignalsForRequest.set((SduiInputDataMergeModule.merge(InputDataSignalsForRequest.get(false), ComponentInputData, MergeStrategy)))
			end
		else
			InputDataSignalsForRequest.set(ComponentInputData)
		end
		if not (if PaginateResponse then GetResult else (if FFlagLuaAppEnableSduiHomePage or FFlagSduiStreamingRefreshReplacesInputData then EnableInputDataMerge else EnableStreamingMerge) and GetResult) then
			local RobloxComponentType = value.robloxComponentType
			
			if not RobloxComponentType then
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToAddTemplates, {
					message = "Page entry missing robloxComponentType",
					name = ConfigCacheKey
				}, SurfaceKey)
				continue
			end
			local ResolveTemplateForRobloxComponentResult = if EnableTemplateCache then resolveTemplateForRobloxComponent(RobloxComponentType) else t[RobloxComponentType]
			
			if not ResolveTemplateForRobloxComponentResult then
				if not EnableTemplateCache then
					SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToMapRobloxComponentToTemplate, {
						name = RobloxComponentType,
						message = `Missing template for robloxComponentType {RobloxComponentType}`
					}, SurfaceKey)
					continue
				end
				continue
			end
			local Success3, Result3 = pcall(function()
				-- upvalues: CreateBuilderConfigFunction (upval), SurfaceKey (copy), ConfigCacheKey (copy), EnableTemplateCache (copy), resolveTemplateForRobloxComponent (copy), t (ref), ParseLocalizedLiteralsFromResponseResult (copy), GetSduiClientBindingBuilderFunction (upval), ResolveTemplateForRobloxComponentResult (copy), FFlagLuaAppSduiHomePageSupport (upval), value (copy), InputDataSignalsForRequest (copy)
				return (GetSduiClientBindingBuilderFunction().buildConfigForComponent(ResolveTemplateForRobloxComponentResult, if FFlagLuaAppSduiHomePageSupport and value.componentInputDataGetter then value.componentInputDataGetter else InputDataSignalsForRequest.get, (CreateBuilderConfigFunction({
					appPage = SurfaceKey,
					debugName = ConfigCacheKey,
					getTemplateForRobloxComponent = function(Name)
						-- upvalues: EnableTemplateCache (upval), resolveTemplateForRobloxComponent (upval), t (upval)
						return if EnableTemplateCache then resolveTemplateForRobloxComponent(Name) else t[Name]
					end,
					localizedLiterals = ParseLocalizedLiteralsFromResponseResult,
					configKey = ConfigCacheKey
				}))))
			end)
			
			if Success3 then
				if t1[Text] then
					SduiLogger.reportError(SduiErrors.SduiErrorType.DuplicateOrMissingIdentifier, {
						name = RobloxComponentType,
						message = `Existing config found for cacheKey {Text}. Need to specify identifer in page entry for multiple configs`
					}, SurfaceKey)
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
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToBuildClientBindingConfig, { name = RobloxComponentType, message = `{Result3}` }, SurfaceKey)
			end
			if value.title and t1[Text] then
				t1[Text].title = value.title
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