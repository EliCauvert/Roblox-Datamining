local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ValidationModuleLoaderModule = require(Parent.validationSystem.ValidationModuleLoader)
local ConstantsModule = require(Parent.Constants)
local ValidationTestWrapperModule = require(Parent.validationSystem.ValidationTestWrapper)
local FetchAllDesiredDataModule = require(Parent.validationSystem.dataFetchModules.FetchAllDesiredData)
local GetUploadCategoryModule = require(Parent.util.getUploadCategory)
local RecreateSceneFromEditablesModule = require(Parent.util.RecreateSceneFromEditables)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetEngineFeatureEngineAQSJsonParsingInLuaModule = require(Parent.flags.getEngineFeatureEngineAQSJsonParsingInLua)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local GetFFlagDebugAllowHRDUploadOnBundleBackendModule = require(Parent.flags.getFFlagDebugAllowHRDUploadOnBundleBackend)
local GetFFlagUGCValidationAnimationPackSupportModule = require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)
local GetFFlagUGCValidateMigrateSchemaPropertiesModule = require(Parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local HttpService = game:GetService("HttpService")
local TelemetryService = game:GetService("TelemetryService")
local RunService = game:GetService("RunService")
local AssetQualityService = game:GetService("AssetQualityService")
game:DefineFastInt("FullValidationTelemetryThrottleHundrethsPercent", 10000)
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local config = {
	eventName = "UgcFullValidationFinished",
	description = "Report result of ugc validation suite",
	links = "https://create.roblox.com/docs/art/validation-errors",
	backends = { "EventIngest" },
	throttlingPercentage = game:GetFastInt("FullValidationTelemetryThrottleHundrethsPercent"),
	lastUpdated = { 25, 11, 18 }
}
local GetFFlagDebugUGCValidationPrintNewStructureResultsModule = require(Parent.flags.getFFlagDebugUGCValidationPrintNewStructureResults)
local GetEngineFeatureEngineAssetQualityEngineServiceModule = require(Parent.flags.getEngineFeatureEngineAssetQualityEngineService)
local GetFIntUGCValidationFetchQualityMaxRetryModule = require(Parent.flags.getFIntUGCValidationFetchQualityMaxRetry)
local GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule = require(Parent.flags.getEngineFeatureEngineUGCValidationExpandReturnSchema)
local config1 = { Publish = true, Backend = true, Internal = true }
local config2 = { InExpServer = true, InExpClient = true }
local config3 = {
	Toolbox = ValidationEnumsModule.ConsumerEnv.Studio,
	AutoSetup = ValidationEnumsModule.ConsumerEnv.Studio,
	Publish = ValidationEnumsModule.ConsumerEnv.Backend,
	Backend = ValidationEnumsModule.ConsumerEnv.Backend,
	Internal = ValidationEnumsModule.ConsumerEnv.Backend,
	InExpServer = ValidationEnumsModule.ConsumerEnv.IEC,
	InExpClient = ValidationEnumsModule.ConsumerEnv.IEC
}
local AssetQualityFetchStatus = ValidationEnumsModule.AssetQualityFetchStatus

local function initRunVariables(Value, ConsumerConfig)
	-- upvalues: GetFFlagUGCValidateMigrateSchemaPropertiesModule (copy), ValidationModuleLoaderModule (copy), GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule (copy)
	local List = {}
	local t = {}
	local t1 = {}
	local SkipModules = if GetFFlagUGCValidateMigrateSchemaPropertiesModule() then ConsumerConfig.skipModules else {}
	for Name, allModule in ValidationModuleLoaderModule.allModules do
		if not SkipModules[Name] and table.find(allModule.categories, Value) and (allModule.fflag() or allModule.shadowFlag()) then
			local Inverted: boolean = allModule.shadowFlag() and not allModule.fflag()
			for _, value in allModule.requiredData do
				t1[value] = true
			end
			for _, value1 in allModule.conditionalData do
				t1[value1] = true
			end
			local IsAssetQualityModule = if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then allModule.isAssetQualityModule else next(allModule.expectedAqsData) ~= nil
			
			if IsAssetQualityModule then
				table.insert(List, Name)
			end
			local Prereqs = {}
			
			for _, prereqTest in allModule.prereqTests do
				Prereqs[prereqTest] = true
			end
			t[Name] = {
				name = Name,
				prereqs = Prereqs,
				postreqs = {},
				isQuality = IsAssetQualityModule,
				isShadow = Inverted
			}
		end
	end
	for i, value2 in t do
		for i1, _ in value2.prereqs do
			if t[i1] == nil then
				error(string.format("%s is needed for %s to run, but is not an included test", i1, i))
			end
			table.insert(t[i1].postreqs, i)
		end
	end
	return List, t, t1
end

local function fetchQualityResults(p1, DesiredQualityChecks)
	-- upvalues: GetEngineFeatureEngineAssetQualityEngineServiceModule (copy), AssetQualityService (copy), AssetQualityFetchStatus (copy), GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule (copy), RecreateSceneFromEditablesModule (copy), GetFIntUGCValidationFetchQualityMaxRetryModule (copy), GetEngineFeatureEngineAQSJsonParsingInLuaModule (copy), HttpService (copy), GetFFlagDebugUGCValidationPrintNewStructureResultsModule (copy), FetchAllDesiredDataModule (copy)
	if not GetEngineFeatureEngineAssetQualityEngineServiceModule() or not AssetQualityService then
		p1.aqsFetchMetrics.fetchStatus = AssetQualityFetchStatus.assetQualityFetchFailure
		p1.aqsFetchMetrics.fetchFailureReason = "Not enabled"
		
		return
	end
	local FetchFailureReason = nil
	local AssetQualityGltfFromInstanceAsync = nil
	local ModelForGltfExport = nil
	local Success = nil
	
	if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() and p1.consumerConfig.aqFetchStage ~= "scene" then
		if p1.consumerConfig.aqFetchStage == "gltf" then
			AssetQualityGltfFromInstanceAsync = p1.consumerConfig.aqFetchData
		end
		Success = true
	else
		ModelForGltfExport = RecreateSceneFromEditablesModule.createModelForGltfExport(p1)
		Success, FetchFailureReason = pcall(function()
			-- upvalues: AssetQualityGltfFromInstanceAsync (ref), AssetQualityService (upval), ModelForGltfExport (ref)
			AssetQualityGltfFromInstanceAsync = AssetQualityService:GenerateAssetQualityGltfFromInstanceAsync(ModelForGltfExport)
		end)
	end
	if Success then
		for i = 1, 1 + GetFIntUGCValidationFetchQualityMaxRetryModule() do
			Success, FetchFailureReason = pcall(function()
				-- upvalues: p1 (copy), i (copy), GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule (upval), AssetQualityService (upval), DesiredQualityChecks (copy), AssetQualityGltfFromInstanceAsync (ref), GetEngineFeatureEngineAQSJsonParsingInLuaModule (upval), HttpService (upval)
				p1.aqsFetchMetrics.fetchAttemptCount = i
				local AssetQualitySummaryFromJobIdAsync = if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() and p1.consumerConfig.aqFetchStage == "jobId" then AssetQualityService:FetchAssetQualitySummaryFromJobIdAsync(p1.consumerConfig.aqFetchData, DesiredQualityChecks) else AssetQualityService:FetchAssetQualitySummaryFromGltfAsync(AssetQualityGltfFromInstanceAsync, DesiredQualityChecks)
				local ScaledClockTime = 1000 * (os.clock() - os.clock())
				p1.aqsFetchMetrics.visualizationUrl = AssetQualitySummaryFromJobIdAsync.visualizationUrl
				p1.aqsFetchMetrics.fetchTimeMs = ScaledClockTime
				
				if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
					p1.aqsFetchMetrics.aqJobId = AssetQualitySummaryFromJobIdAsync.aqJobId
				end
				if GetEngineFeatureEngineAQSJsonParsingInLuaModule() then
					p1.aqsSummaryData = HttpService:JSONDecode(AssetQualitySummaryFromJobIdAsync.rawJson)
					
					return
				else
					p1.aqsFetchMetrics.returnVersion = AssetQualitySummaryFromJobIdAsync.version
					p1.aqsSummaryData = AssetQualitySummaryFromJobIdAsync
				end
			end)
			
			if Success then break end
		end
	end
	if Success then
		p1.aqsFetchMetrics.fetchStatus = AssetQualityFetchStatus.assetQualityFetchSuccess
		
		if GetFFlagDebugUGCValidationPrintNewStructureResultsModule() then
			print(string.format("AQS fetch success: aqJobId=%s attempts=%d fetchTimeMs=%d", p1.aqsFetchMetrics.aqJobId or "", p1.aqsFetchMetrics.fetchAttemptCount or 0, p1.aqsFetchMetrics.fetchTimeMs or 0))
			print(p1.aqsSummaryData)
		end
	else
		p1.aqsFetchMetrics.fetchFailureReason = FetchFailureReason
		p1.aqsSummaryData = FetchAllDesiredDataModule.DATA_FETCH_FAILURE
		p1.aqsFetchMetrics.fetchStatus = AssetQualityFetchStatus.assetQualityFetchFailure
		
		if GetFFlagDebugUGCValidationPrintNewStructureResultsModule() then
			print("AQS fetch failure:", FetchFailureReason)
		end
	end
	if ModelForGltfExport then
		ModelForGltfExport:Destroy()
	end
end

local function getNextLayer(List, p2)
	local List1 = {}
	
	for i, value in List do
		if next(value.prereqs) == nil and (p2 or not value.isQuality) then
			table.insert(List1, i)
		end
	end
	return List1
end

local function populateRelevantSourceStrings(p3)
	-- upvalues: ErrorSourceStringsModule (copy)
	local function _(Text: string)
		-- upvalues: ErrorSourceStringsModule (upval), p3 (copy)
		local v1 = Text:split(".")
		local Value = ErrorSourceStringsModule.Values[v1[#v1]]
		
		if Value then
			p3.relevantSourceStrings[Text] = Value
		end
	end
	
	for _, value in p3.failureMap do
		for _, value1 in value do
			local FailureStringKey: string = value1.failureStringKey
			local v1 = FailureStringKey:split(".")
			local Value = ErrorSourceStringsModule.Values[v1[#v1]]
			
			if Value then
				p3.relevantSourceStrings[FailureStringKey] = Value
			end
		end
	end
	for _, value2 in p3.warningMap do
		for _, value3 in value2 do
			local FailureStringKey: string = value3.failureStringKey
			local v2 = FailureStringKey:split(".")
			local Value = ErrorSourceStringsModule.Values[v2[#v2]]
			
			if Value then
				p3.relevantSourceStrings[FailureStringKey] = Value
			end
		end
	end
end

local function _(p4)
	local UploadEnum = p4.uploadEnum
	
	return if UploadEnum.assetType then UploadEnum.assetType.Name elseif UploadEnum.bundleType then UploadEnum.bundleType.Name else "?"
end

local function reportFullResult(p4, p5, DurationMs)
	-- upvalues: AssetQualityFetchStatus (copy), RbxAnalyticsService (copy), GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule (copy), TelemetryService (copy), config (copy), GetFFlagDebugUGCValidationPrintNewStructureResultsModule (copy)
	local IsNotFetchStatusMatch = p5.aqsFetchMetrics.fetchStatus ~= AssetQualityFetchStatus.assetQualityFetchNA
	TelemetryService:LogEvent(config, {
		customFields = {
			validationJobId = p5.jobId,
			bundleJobId = p5.consumerConfig.telemetryBundleId,
			rootInstanceId = p5.consumerConfig.telemetryRootId,
			studioSid = RbxAnalyticsService:GetSessionId(),
			clientId = RbxAnalyticsService:GetClientId(),
			placeId = game.PlaceId,
			validationSource = p5.consumerConfig.source,
			assetType = p5.uploadEnum.assetType and p5.uploadEnum.assetType.Value or 0,
			bundleType = p5.uploadEnum.bundleType and p5.uploadEnum.bundleType.Value or 0,
			numFailures = p4.numFailures,
			passed = p4.pass,
			durationMs = DurationMs,
			uploadCategory = p5.uploadCategory,
			aqFetchStatus = p5.aqsFetchMetrics.fetchStatus,
			aqFetchAttemptCount = IsNotFetchStatusMatch and p5.aqsFetchMetrics.fetchAttemptCount or 0,
			aqFetchTimeMs = IsNotFetchStatusMatch and p5.aqsFetchMetrics.fetchTimeMs or 0,
			aqFetchFailureReason = IsNotFetchStatusMatch and p5.aqsFetchMetrics.fetchFailureReason or "",
			aqJobId = if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then p5.aqsFetchMetrics.aqJobId or "" else nil
		}
	})
	
	if GetFFlagDebugUGCValidationPrintNewStructureResultsModule() then
		if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
			local UploadEnum = p5.uploadEnum
			print(string.format("==== %s Validation end ==== pass=%s numFailures=%d numWarnings=%d durationMs=%d", if UploadEnum.assetType then UploadEnum.assetType.Name elseif UploadEnum.bundleType then UploadEnum.bundleType.Name else "?", tostring(p4.pass), p4.numFailures, p4.numWarnings, DurationMs))
			
			for i, value in p4.failureMap do
				for _, value1 in value do
					print(string.format("  FAIL %s: %s @ %s", i, value1.failureStringKey, if value1.instancePath == "" then "<root>" else value1.instancePath))
				end
			end
		end
		print(p4)
	end
end

local function updateResultData_deprecated(p6, p7, p8, JobId, EnforceShadowValidations)
	-- upvalues: ValidationEnumsModule (copy), ErrorSourceStringsModule (copy)
	local ValidationEnum = p8.validationEnum
	
	if EnforceShadowValidations or not p7[ValidationEnum].isShadow then
		p6.states[ValidationEnum] = p8.status
		
		if #p8.errorTranslationContexts > 0 then
			table.move(p8.errorTranslationContexts, 1, #p8.errorTranslationContexts, #p6.errorTranslationContexts + 1, p6.errorTranslationContexts)
		end
		if p8.status ~= ValidationEnumsModule.Status.PASS then
			p6.pass = false
			p6.numFailures += 1
			
			if p8.status == ValidationEnumsModule.Status.ERROR and not p6.ranIntoInternalError then
				p6.ranIntoInternalError = true
				table.insert(p6.errorTranslationContexts, {
					key = ErrorSourceStringsModule.Keys.InternalError,
					params = { ValidationJobId = JobId }
				})
			end
		end
	end
	for _, postreq in p7[ValidationEnum].postreqs do
		p7[postreq].prereqs[ValidationEnum] = nil
	end
	p7[ValidationEnum] = nil
end

local function updateResultData(p9, p10, p11, _, EnforceShadowValidations)
	-- upvalues: ValidationEnumsModule (copy)
	local ValidationEnum = p11.validationEnum
	
	if EnforceShadowValidations or not p10[ValidationEnum].isShadow then
		p9.states[ValidationEnum] = p11.status
		
		if p11.status ~= ValidationEnumsModule.Status.PASS then
			p9.pass = false
			p9.numFailures += math.max(1, #p11.failures)
		end
		if #p11.failures > 0 then
			p9.failureMap[ValidationEnum] = p11.failures
		end
		if #p11.warnings > 0 then
			p9.warningMap[ValidationEnum] = p11.warnings
			p9.numWarnings += #p11.warnings
		end
		if p11.status == ValidationEnumsModule.Status.ERROR then
			p9.ranIntoInternalError = true
		end
	end
	for _, postreq in p10[ValidationEnum].postreqs do
		p10[postreq].prereqs[ValidationEnum] = nil
	end
	p10[ValidationEnum] = nil
end

local function createConsumerConfigWithDefaults(Tbl)
	-- upvalues: GetFFlagUGCValidateMigrateSchemaPropertiesModule (copy), config3 (copy)
	local Copy = table.clone(Tbl)
	
	if Copy.enforceR15FolderStructure == nil then
		Copy.enforceR15FolderStructure = true
	end
	if Copy.enforceShadowValidations == nil then
		Copy.enforceShadowValidations = false
	end
	Copy.telemetryBundleId = Copy.telemetryBundleId or ""
	Copy.telemetryRootId = Copy.telemetryRootId or ""
	Copy.preloadedEditableMeshes = Copy.preloadedEditableMeshes or {}
	Copy.preloadedEditableImages = Copy.preloadedEditableImages or {}
	Copy.preloadedHsrAssets = Copy.preloadedHsrAssets or {}
	Copy.skipModules = Copy.skipModules or {}
	
	if GetFFlagUGCValidateMigrateSchemaPropertiesModule() then
		Copy.consumerEnv = config3[Copy.source]
		assert(Copy.consumerEnv ~= nil, `unknown consumer source: {tostring(Copy.source)}`)
		Copy.backendConfigs = Copy.backendConfigs or {}
		Copy.iecConfigs = Copy.iecConfigs or {}
	end
	Copy.aqFetchStage = Copy.aqFetchStage or "scene"
	Copy.aqFetchData = Copy.aqFetchData or ""
	assert(Copy.aqFetchStage == "scene" == (Copy.aqFetchData == ""), `aqFetchData must be non-empty iff aqFetchStage is "gltf" or "jobId" (got stage="{Copy.aqFetchStage}")`)
	
	return Copy
end

local function runValidationOnRootInstance(p12)
	-- upvalues: GetFFlagDebugUGCValidationPrintNewStructureResultsModule (copy), GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule (copy), GetUploadCategoryModule (copy), initRunVariables (copy), AssetQualityFetchStatus (copy), ValidationTestWrapperModule (copy), ValidationEnumsModule (copy), updateResultData (copy), updateResultData_deprecated (copy), populateRelevantSourceStrings (copy), reportFullResult (copy), FetchAllDesiredDataModule (copy), config1 (copy), RunService (copy), fetchQualityResults (copy), getNextLayer (copy), config2 (copy)
	local ClockTime = os.clock()
	local RootInstance = p12.rootInstance
	local AssetType = p12.uploadEnum.assetType
	local BundleType = p12.uploadEnum.bundleType
	local ConsumerConfig = p12.consumerConfig
	
	if GetFFlagDebugUGCValidationPrintNewStructureResultsModule() then
		local UploadEnum = p12.uploadEnum
		print(string.format("==== %s Validation begin ==== jobId=%s source=%s", if UploadEnum.assetType then UploadEnum.assetType.Name elseif UploadEnum.bundleType then UploadEnum.bundleType.Name else "?", p12.jobId, p12.consumerConfig.source))
	end
	local config = {
		pass = true,
		numFailures = 0,
		numWarnings = 0,
		ranIntoInternalError = false,
		aqJobId = "",
		validationJobId = p12.jobId,
		states = {},
		failureMap = {},
		warningMap = {},
		relevantSourceStrings = {}
	}
	
	if not GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		config.errorTranslationContexts = {}
	end
	local UploadCategoryModule = GetUploadCategoryModule(RootInstance, AssetType, BundleType)
	local InitRunVariablesResult, InitRunVariablesResult2, InitRunVariablesResult3 = initRunVariables(UploadCategoryModule, ConsumerConfig)
	p12.uploadCategory = UploadCategoryModule
	p12.aqsFetchMetrics = {
		fetchStatus = AssetQualityFetchStatus.assetQualityFetchNA,
		aqJobId = if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() and ConsumerConfig.aqFetchStage == "jobId" then ConsumerConfig.aqFetchData else nil
	}
	local ValidationTestWrapperModuleResult = ValidationTestWrapperModule(ValidationEnumsModule.ValidationModule.ExpectedRootSchema, p12, config.states)
	
	if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		updateResultData(config, InitRunVariablesResult2, ValidationTestWrapperModuleResult, p12.jobId, ConsumerConfig.enforceShadowValidations)
	else
		updateResultData_deprecated(config, InitRunVariablesResult2, ValidationTestWrapperModuleResult, p12.jobId, ConsumerConfig.enforceShadowValidations)
	end
	if config.states[ValidationEnumsModule.ValidationModule.ExpectedRootSchema] == ValidationEnumsModule.Status.PASS then
		FetchAllDesiredDataModule.storeDesiredData(p12, InitRunVariablesResult3)
		
		if #InitRunVariablesResult > 0 then
			p12.aqsFetchMetrics.fetchStatus = AssetQualityFetchStatus.assetQualityFetchInProgress
			
			if config1[ConsumerConfig.source] then
				RunService:Run()
				fetchQualityResults(p12, InitRunVariablesResult)
				RunService:Pause()
			else
				task.spawn(fetchQualityResults, p12, InitRunVariablesResult)
			end
		end
		while next(InitRunVariablesResult2) ~= nil do
			local IsFetchStatusMatch = p12.aqsFetchMetrics.fetchStatus == AssetQualityFetchStatus.assetQualityFetchInProgress
			local NextLayer = getNextLayer(InitRunVariablesResult2, not IsFetchStatusMatch)
			
			if #NextLayer == 0 and not IsFetchStatusMatch then
				error("Impossible to complete all layers")
			end
			for _, value in NextLayer do
				local ValidationTestWrapperModuleResult1 = ValidationTestWrapperModule(value, p12, config.states)
				
				if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
					updateResultData(config, InitRunVariablesResult2, ValidationTestWrapperModuleResult1, p12.jobId, ConsumerConfig.enforceShadowValidations)
				else
					updateResultData_deprecated(config, InitRunVariablesResult2, ValidationTestWrapperModuleResult1, p12.jobId, ConsumerConfig.enforceShadowValidations)
				end
				if config2[ConsumerConfig.source] then
					task.wait()
				end
			end
			if IsFetchStatusMatch and not config1[ConsumerConfig.source] then
				task.wait()
			end
		end
		if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
			populateRelevantSourceStrings(config)
			config.aqJobId = p12.aqsFetchMetrics.aqJobId or ""
		end
		reportFullResult(config, p12, 1000 * (os.clock() - ClockTime))
		
		return config
	else
		if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
			populateRelevantSourceStrings(config)
			config.aqJobId = p12.aqsFetchMetrics.aqJobId or ""
		end
		reportFullResult(config, p12, -1)
		
		return config
	end
end

local _ = function(Entry)
	-- upvalues: ConstantsModule (copy)
	if #Entry == 0 then
		return nil
	end
	for _, value in Entry do
		if value.Name == ConstantsModule.FOLDER_NAMES.R15ArtistIntent then
			return value
		end
	end
	return Entry[1]
end

return {
	ValidateAsset = function(Entry, AssetType, p13)
		-- upvalues: HttpService (copy), ConstantsModule (copy), createConsumerConfigWithDefaults (copy), runValidationOnRootInstance (copy)
		local config = {
			jobId = HttpService:GenerateGUID(),
			entrypointInput = Entry
		}
		local RootInstance = nil
		
		if #Entry == 0 then
			RootInstance = nil
		else
			for _, value in Entry do
				if value.Name == ConstantsModule.FOLDER_NAMES.R15ArtistIntent then
					RootInstance = value
				else
					continue
				end
			end
			RootInstance = Entry[1]
		end
		config.rootInstance = RootInstance
		config.uploadEnum = { assetType = AssetType }
		config.consumerConfig = createConsumerConfigWithDefaults(p13)
		config.hsrAssets = {}
		
		return (runValidationOnRootInstance(config))
	end,
	ValidateFinalizedBundle = function(EntrypointInput, BundleType, p14)
		-- upvalues: GetFFlagDebugAllowHRDUploadOnBundleBackendModule (copy), R15plusUtilsModule (copy), GetFFlagUGCValidationAnimationPackSupportModule (copy), ConstantsModule (copy), HttpService (copy), createConsumerConfigWithDefaults (copy), runValidationOnRootInstance (copy)
		if GetFFlagDebugAllowHRDUploadOnBundleBackendModule() then
			R15plusUtilsModule.setIsBackendBundleUpload(p14.source == "Publish" or p14.source == "Backend")
		end
		local Model1 = nil
		if GetFFlagUGCValidationAnimationPackSupportModule() and BundleType == Enum.BundleType.Animations then
			local Model = Instance.new("Model")
			
			for _, value in EntrypointInput do
				local AllSelectedInstances = value.allSelectedInstances
				local Object = nil
				
				if #AllSelectedInstances == 0 then
					Object = nil
				else
					for _, allSelectedInstance in AllSelectedInstances do
						if allSelectedInstance.Name == ConstantsModule.FOLDER_NAMES.R15ArtistIntent then
							Object = allSelectedInstance
						else
							continue
						end
					end
					Object = AllSelectedInstances[1]
				end
				if Object ~= nil then
					Object:Clone().Parent = Model
				end
			end
			Model1 = Model
		else
			local Folder = Instance.new("Folder")
			
			for _, value1 in EntrypointInput do
				local AllSelectedInstances = value1.allSelectedInstances
				local Object = nil
				
				if #AllSelectedInstances == 0 then
					Object = nil
				else
					for _, allSelectedInstance1 in AllSelectedInstances do
						if allSelectedInstance1.Name == ConstantsModule.FOLDER_NAMES.R15ArtistIntent then
							Object = allSelectedInstance1
						else
							continue
						end
					end
					Object = AllSelectedInstances[1]
				end
				if Object ~= nil then
					if Object:IsA("Folder") or Object:IsA("Model") then
						for _, child in Object:GetChildren() do
							child:Clone().Parent = Folder
						end
					else
						Object:Clone().Parent = Folder
					end
				end
			end
			Model1 = Folder
		end
		local RunValidationOnRootInstanceResult = runValidationOnRootInstance({
			jobId = HttpService:GenerateGUID(),
			entrypointInput = EntrypointInput,
			rootInstance = Model1,
			uploadEnum = { bundleType = BundleType },
			consumerConfig = createConsumerConfigWithDefaults(p14),
			hsrAssets = {}
		})
		
		if GetFFlagDebugAllowHRDUploadOnBundleBackendModule() then
			R15plusUtilsModule.setIsBackendBundleUpload(false)
		end
		return RunValidationOnRootInstanceResult
	end
}