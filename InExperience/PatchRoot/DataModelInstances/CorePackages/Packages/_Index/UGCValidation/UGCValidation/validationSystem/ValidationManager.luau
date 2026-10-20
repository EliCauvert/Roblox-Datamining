local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ValidationModuleLoaderModule = require(Parent.validationSystem.ValidationModuleLoader)
local ConstantsModule = require(Parent.Constants)
local ValidationTestWrapperModule = require(Parent.validationSystem.ValidationTestWrapper)
local FetchAllDesiredDataModule = require(Parent.validationSystem.dataFetchModules.FetchAllDesiredData)
local FetchContentIdsModule = require(Parent.validationSystem.dataFetchModules.FetchContentIds)
local GetUploadCategoryModule = require(Parent.util.getUploadCategory)
local RecreateSceneFromEditablesModule = require(Parent.util.RecreateSceneFromEditables)
local StripMeshFromGltfModule = require(Parent.util.stripMeshFromGltf)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local ResetPhysicsDataModule = require(Parent.util.resetPhysicsData)
local GetFFlagDebugAllowHRDUploadOnBundleBackendModule = require(Parent.flags.getFFlagDebugAllowHRDUploadOnBundleBackend)
local GetEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule = require(Parent.flags.getEngineFeatureEngineUGCValidateInstanceTreesEquivalent)
local GetFFlagUGCValidationAllowFullVaasModule = require(Parent.flags.getFFlagUGCValidationAllowFullVaas)
local GetFFlagDebugUGCDisableAssetQualityChecksModule = require(Parent.flags.getFFlagDebugUGCDisableAssetQualityChecks)
local GetEngineFeatureEngineDebugUGCValidationViaLocalRCCModule = require(Parent.flags.getEngineFeatureEngineDebugUGCValidationViaLocalRCC)
local GetEngineFeatureEngineUGCValidateEmoteAnimationExportModule = require(Parent.flags.getEngineFeatureEngineUGCValidateEmoteAnimationExport)
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
	lastUpdated = { 26, 9, 4 }
}
local GetFFlagDebugUGCValidationPrintNewStructureResultsModule = require(Parent.flags.getFFlagDebugUGCValidationPrintNewStructureResults)
local GetFIntUGCValidationFetchQualityMaxRetryModule = require(Parent.flags.getFIntUGCValidationFetchQualityMaxRetry)
local GetEngineFeatureEngineAssetQualityV2SummaryFromUrlModule = require(Parent.flags.getEngineFeatureEngineAssetQualityV2SummaryFromUrl)
local GetFIntUGCValidationFetchQualityRetryDelayMsModule = require(Parent.flags.getFIntUGCValidationFetchQualityRetryDelayMs)
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
local Config = if GetEngineFeatureEngineDebugUGCValidationViaLocalRCCModule() then {
	[ValidationEnumsModule.ValidationModule.DescendantIdsAllowed] = true,
	[ValidationEnumsModule.ValidationModule.DescendantIdsPublished] = true
} else nil

local function initRunVariables(Value, ConsumerConfig)
	-- upvalues: ValidationModuleLoaderModule (copy), GetFFlagDebugUGCDisableAssetQualityChecksModule (copy)
	local List = {}
	local t = {}
	local t1 = {}
	local SkipModules = ConsumerConfig.skipModules
	
	for Name, allModule in ValidationModuleLoaderModule.allModules do
		if not SkipModules[Name] and (not GetFFlagDebugUGCDisableAssetQualityChecksModule() or not ConsumerConfig.skipAssetQualityChecks or not allModule.isAssetQualityModule) and (table.find(allModule.categories, Value) and (allModule.fflag() or allModule.shadowFlag())) then
			local Inverted: boolean = allModule.shadowFlag() and not allModule.fflag()
			for _, value in allModule.requiredData do
				t1[value] = true
			end
			for _, value1 in allModule.conditionalData do
				t1[value1] = true
			end
			local IsAssetQualityModule = allModule.isAssetQualityModule
			
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
	-- upvalues: AssetQualityService (copy), AssetQualityFetchStatus (copy), RecreateSceneFromEditablesModule (copy), GetEngineFeatureEngineUGCValidateEmoteAnimationExportModule (copy), ValidationEnumsModule (copy), StripMeshFromGltfModule (copy), GetFIntUGCValidationFetchQualityRetryDelayMsModule (copy), GetFIntUGCValidationFetchQualityMaxRetryModule (copy), GetEngineFeatureEngineAssetQualityV2SummaryFromUrlModule (copy), GetFFlagUGCValidationAllowFullVaasModule (copy), HttpService (copy), GetFFlagDebugUGCValidationPrintNewStructureResultsModule (copy), FetchAllDesiredDataModule (copy)
	if not AssetQualityService then
		p1.aqsFetchMetrics.fetchStatus = AssetQualityFetchStatus.assetQualityFetchFailure
		p1.aqsFetchMetrics.fetchFailureReason = "Not enabled"
		
		return
	end
	local FetchFailureReason = nil
	local AssetQualityGltfFromInstanceAsync = nil
	local ModelForGltfExport = nil
	local Success = nil
	
	if p1.consumerConfig.aqFetchStage == "scene" then
		Success, FetchFailureReason = pcall(function()
			-- upvalues: ModelForGltfExport (ref), RecreateSceneFromEditablesModule (upval), p1 (copy), AssetQualityGltfFromInstanceAsync (ref), AssetQualityService (upval)
			ModelForGltfExport = RecreateSceneFromEditablesModule.createModelForGltfExport(p1)
			AssetQualityGltfFromInstanceAsync = AssetQualityService:GenerateAssetQualityGltfFromInstanceAsync(ModelForGltfExport)
		end)
		
		if GetEngineFeatureEngineUGCValidateEmoteAnimationExportModule() and Success and AssetQualityGltfFromInstanceAsync and p1.uploadCategory == ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION then
			local Success1, Result = pcall(StripMeshFromGltfModule, AssetQualityGltfFromInstanceAsync)
			
			if Success1 then
				AssetQualityGltfFromInstanceAsync = Result
			end
		end
	else
		if p1.consumerConfig.aqFetchStage == "gltf" then
			AssetQualityGltfFromInstanceAsync = p1.consumerConfig.aqFetchData
		end
		Success = true
	end
	if Success then
		local FIntUGCValidationFetchQualityRetryDelayMsModule: number = GetFIntUGCValidationFetchQualityRetryDelayMsModule()
		
		for i = 1, 1 + GetFIntUGCValidationFetchQualityMaxRetryModule() do
			if i > 1 and FIntUGCValidationFetchQualityRetryDelayMsModule > 0 then
				task.wait(FIntUGCValidationFetchQualityRetryDelayMsModule / 1000)
			end
			Success, FetchFailureReason = pcall(function()
				-- upvalues: p1 (copy), i (copy), GetEngineFeatureEngineAssetQualityV2SummaryFromUrlModule (upval), GetFFlagUGCValidationAllowFullVaasModule (upval), AssetQualityService (upval), DesiredQualityChecks (copy), AssetQualityGltfFromInstanceAsync (ref), HttpService (upval)
				p1.aqsFetchMetrics.fetchAttemptCount = i
				local ClockTime = os.clock()
				local AssetQualitySummaryFromJobIdV2Async = nil
				
				if p1.consumerConfig.aqFetchStage == "jobId" then
					local AqJobId = if GetEngineFeatureEngineAssetQualityV2SummaryFromUrlModule() then p1.consumerConfig.aqJobId else p1.consumerConfig.aqFetchData
					AssetQualitySummaryFromJobIdV2Async = if GetFFlagUGCValidationAllowFullVaasModule() and AqJobId ~= nil and AqJobId ~= "" then AssetQualityService:FetchAssetQualitySummaryFromJobIdV2Async(AqJobId, DesiredQualityChecks) else AssetQualityService:FetchAssetQualitySummaryFromJobIdAsync(AqJobId, DesiredQualityChecks)
				else
					AssetQualitySummaryFromJobIdV2Async = if p1.consumerConfig.aqFetchStage == "summaryUrl" then AssetQualityService:FetchAssetQualitySummaryFromUrlAsync(p1.consumerConfig.aqSummaryUrl, p1.consumerConfig.aqJobId, DesiredQualityChecks) else AssetQualityService:FetchAssetQualitySummaryFromGltfAsync(AssetQualityGltfFromInstanceAsync, DesiredQualityChecks)
				end
				local ScaledClockTime = 1000 * (os.clock() - ClockTime)
				p1.aqsFetchMetrics.visualizationUrl = AssetQualitySummaryFromJobIdV2Async.visualizationUrl
				p1.aqsFetchMetrics.fetchTimeMs = ScaledClockTime
				p1.aqsFetchMetrics.aqJobId = AssetQualitySummaryFromJobIdV2Async.aqJobId
				p1.aqsSummaryData = HttpService:JSONDecode(AssetQualitySummaryFromJobIdV2Async.rawJson)
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

local function reportFullResult(p4, p5, ScaledClockTime)
	-- upvalues: AssetQualityFetchStatus (copy), RbxAnalyticsService (copy), GetFFlagUGCValidationAllowFullVaasModule (copy), TelemetryService (copy), config (copy), GetFFlagDebugUGCValidationPrintNewStructureResultsModule (copy)
	local IsNotFetchStatusMatch = p5.aqsFetchMetrics.fetchStatus ~= AssetQualityFetchStatus.assetQualityFetchNA
	local CustomFields = {
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
		durationMs = ScaledClockTime,
		uploadCategory = p5.uploadCategory,
		aqFetchStatus = p5.aqsFetchMetrics.fetchStatus,
		aqFetchAttemptCount = IsNotFetchStatusMatch and p5.aqsFetchMetrics.fetchAttemptCount or 0,
		aqFetchTimeMs = IsNotFetchStatusMatch and p5.aqsFetchMetrics.fetchTimeMs or 0,
		aqFetchFailureReason = IsNotFetchStatusMatch and p5.aqsFetchMetrics.fetchFailureReason or "",
		aqJobId = p5.aqsFetchMetrics.aqJobId or ""
	}
	
	if GetFFlagUGCValidationAllowFullVaasModule() then
		CustomFields.isVaas = p5.consumerConfig.isVaaS or false
		CustomFields.aqFetchStage = p5.consumerConfig.aqFetchStage
	end
	TelemetryService:LogEvent(config, { customFields = CustomFields })
	
	if GetFFlagDebugUGCValidationPrintNewStructureResultsModule() then
		local UploadEnum = p5.uploadEnum
		print(string.format("==== %s Validation end ==== pass=%s numFailures=%d numWarnings=%d durationMs=%d", if UploadEnum.assetType then UploadEnum.assetType.Name elseif UploadEnum.bundleType then UploadEnum.bundleType.Name else "?", tostring(p4.pass), p4.numFailures, p4.numWarnings, ScaledClockTime))
		
		for i, value in p4.failureMap do
			for _, value1 in value do
				print(string.format("  FAIL %s: %s @ %s", i, value1.failureStringKey, if value1.instancePath == "" then "<root>" else value1.instancePath))
			end
		end
		print(p4)
	end
end

local function updateResultData(p6, p7, p8, _, EnforceShadowValidations)
	-- upvalues: ValidationEnumsModule (copy)
	local ValidationEnum = p8.validationEnum
	
	if EnforceShadowValidations or not p7[ValidationEnum].isShadow then
		p6.states[ValidationEnum] = p8.status
		
		if p8.status ~= ValidationEnumsModule.Status.PASS then
			p6.pass = false
			p6.numFailures += math.max(1, #p8.failures)
		end
		if #p8.failures > 0 then
			p6.failureMap[ValidationEnum] = p8.failures
		end
		if #p8.warnings > 0 then
			p6.warningMap[ValidationEnum] = p8.warnings
			p6.numWarnings += #p8.warnings
		end
		if p8.status == ValidationEnumsModule.Status.ERROR then
			p6.ranIntoInternalError = true
		end
	end
	for _, postreq in p7[ValidationEnum].postreqs do
		p7[postreq].prereqs[ValidationEnum] = nil
	end
	p7[ValidationEnum] = nil
end

local function createConsumerConfigWithDefaults(Tbl)
	-- upvalues: Config (copy), config3 (copy), GetFFlagUGCValidationAllowFullVaasModule (copy), ValidationEnumsModule (copy), GetEngineFeatureEngineAssetQualityV2SummaryFromUrlModule (copy)
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
	Copy.preloadedCurveAnimations = Copy.preloadedCurveAnimations or {}
	Copy.skipModules = Copy.skipModules or {}
	
	if Config then
		Copy.skipModules = table.clone(Copy.skipModules)
		
		for i in Config do
			Copy.skipModules[i] = true
		end
	end
	Copy.skipAssetQualityChecks = Copy.skipAssetQualityChecks or false
	Copy.skipPhysicsDataReset = Copy.skipPhysicsDataReset or false
	Copy.isVaaS = Copy.isVaaS or false
	Copy.consumerEnv = config3[Copy.source]
	assert(Copy.consumerEnv ~= nil, `unknown consumer source: {tostring(Copy.source)}`)
	
	if GetFFlagUGCValidationAllowFullVaasModule() and Copy.isVaaS then
		Copy.validationEnv = ValidationEnumsModule.ValidationEnv.Backend
	else
		Copy.validationEnv = Copy.consumerEnv
	end
	Copy.backendConfigs = Copy.backendConfigs or {}
	Copy.iecConfigs = Copy.iecConfigs or {}
	Copy.aqFetchStage = Copy.aqFetchStage or "scene"
	Copy.aqFetchData = Copy.aqFetchData or ""
	local AqFetchData = Copy.aqFetchData
	
	if GetEngineFeatureEngineAssetQualityV2SummaryFromUrlModule() then
		Copy.aqJobId = Copy.aqJobId or ""
		Copy.aqSummaryUrl = Copy.aqSummaryUrl or ""
		
		if Copy.aqFetchStage == "jobId" then
			AqFetchData = Copy.aqJobId
		elseif Copy.aqFetchStage == "summaryUrl" then
			AqFetchData = Copy.aqSummaryUrl
		end
	else
		assert(Copy.aqFetchStage ~= "summaryUrl", "aqFetchStage \"summaryUrl\" requires EngineAssetQualityV2SummaryFromUrl")
	end
	assert(Copy.aqFetchStage == "scene" == (AqFetchData == ""), `aqFetchData/aqJobId/aqSummaryUrl (per stage) must be non-empty iff aqFetchStage is not "scene" (got stage="{Copy.aqFetchStage}")`)
	
	return Copy
end

local function runValidationOnRootInstance(p9)
	-- upvalues: GetFFlagDebugUGCValidationPrintNewStructureResultsModule (copy), GetFFlagUGCValidationAllowFullVaasModule (copy), GetUploadCategoryModule (copy), initRunVariables (copy), AssetQualityFetchStatus (copy), GetEngineFeatureEngineAssetQualityV2SummaryFromUrlModule (copy), ValidationTestWrapperModule (copy), ValidationEnumsModule (copy), updateResultData (copy), populateRelevantSourceStrings (copy), reportFullResult (copy), FetchContentIdsModule (copy), ResetPhysicsDataModule (copy), config1 (copy), FetchAllDesiredDataModule (copy), RunService (copy), fetchQualityResults (copy), getNextLayer (copy), config2 (copy)
	local ClockTime = os.clock()
	local RootInstance = p9.rootInstance
	local AssetType = p9.uploadEnum.assetType
	local BundleType = p9.uploadEnum.bundleType
	local ConsumerConfig = p9.consumerConfig
	
	if GetFFlagDebugUGCValidationPrintNewStructureResultsModule() then
		local UploadEnum = p9.uploadEnum
		print(string.format("==== %s Validation begin ==== jobId=%s source=%s", if UploadEnum.assetType then UploadEnum.assetType.Name elseif UploadEnum.bundleType then UploadEnum.bundleType.Name else "?", p9.jobId, p9.consumerConfig.source))
	end
	local config = {
		pass = true,
		numFailures = 0,
		numWarnings = 0,
		ranIntoInternalError = false,
		aqJobId = "",
		validationJobId = p9.jobId,
		telemetryBundleId = if GetFFlagUGCValidationAllowFullVaasModule() then ConsumerConfig.telemetryBundleId else nil,
		states = {},
		failureMap = {},
		warningMap = {},
		relevantSourceStrings = {}
	}
	local UploadCategoryModule = GetUploadCategoryModule(RootInstance, AssetType, BundleType)
	local InitRunVariablesResult, InitRunVariablesResult2, InitRunVariablesResult3 = initRunVariables(UploadCategoryModule, ConsumerConfig)
	p9.uploadCategory = UploadCategoryModule
	p9.aqsFetchMetrics = {
		fetchStatus = AssetQualityFetchStatus.assetQualityFetchNA,
		aqJobId = if GetEngineFeatureEngineAssetQualityV2SummaryFromUrlModule() then ConsumerConfig.aqJobId elseif ConsumerConfig.aqFetchStage == "jobId" then ConsumerConfig.aqFetchData else nil
	}
	updateResultData(config, InitRunVariablesResult2, ValidationTestWrapperModule(ValidationEnumsModule.ValidationModule.ExpectedRootSchema, p9, config.states), p9.jobId, ConsumerConfig.enforceShadowValidations)
	
	if config.states[ValidationEnumsModule.ValidationModule.ExpectedRootSchema] ~= ValidationEnumsModule.Status.PASS then
		populateRelevantSourceStrings(config)
		config.aqJobId = p9.aqsFetchMetrics.aqJobId or ""
		reportFullResult(config, p9, -1)
		
		return config
	end
	local DescendantIdsPublished = ValidationEnumsModule.ValidationModule.DescendantIdsPublished
	
	if InitRunVariablesResult2[DescendantIdsPublished] then
		p9.contentIds = FetchContentIdsModule.getData(p9)
		updateResultData(config, InitRunVariablesResult2, ValidationTestWrapperModule(DescendantIdsPublished, p9, config.states), p9.jobId, ConsumerConfig.enforceShadowValidations)
		local State = config.states[DescendantIdsPublished]
		
		if State ~= nil and State ~= ValidationEnumsModule.Status.PASS then
			populateRelevantSourceStrings(config)
			config.aqJobId = p9.aqsFetchMetrics.aqJobId or ""
			reportFullResult(config, p9, 1000 * (os.clock() - ClockTime))
			
			return config
		end
	end
	if GetFFlagUGCValidationAllowFullVaasModule() and p9.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.Backend then
		ResetPhysicsDataModule({ p9.rootInstance }, {
			isServer = true,
			bypassFlags = {
				skipPhysicsDataReset = p9.consumerConfig.skipPhysicsDataReset
			}
		})
	end
	local Entry = config1[ConsumerConfig.source] or ConsumerConfig.validationEnv == ValidationEnumsModule.ValidationEnv.Backend
	FetchAllDesiredDataModule.storeDesiredData(p9, InitRunVariablesResult3)
	
	if #InitRunVariablesResult > 0 then
		p9.aqsFetchMetrics.fetchStatus = AssetQualityFetchStatus.assetQualityFetchInProgress
		
		if Entry then
			RunService:Run()
			fetchQualityResults(p9, InitRunVariablesResult)
			RunService:Pause()
		else
			task.spawn(fetchQualityResults, p9, InitRunVariablesResult)
		end
	end
	while next(InitRunVariablesResult2) ~= nil do
		local IsFetchStatusMatch = p9.aqsFetchMetrics.fetchStatus == AssetQualityFetchStatus.assetQualityFetchInProgress
		local NextLayer = getNextLayer(InitRunVariablesResult2, not IsFetchStatusMatch)
		
		if #NextLayer == 0 and not IsFetchStatusMatch then
			error("Impossible to complete all layers")
		end
		for _, value in NextLayer do
			updateResultData(config, InitRunVariablesResult2, ValidationTestWrapperModule(value, p9, config.states), p9.jobId, ConsumerConfig.enforceShadowValidations)
			
			if config2[ConsumerConfig.source] and not Entry then
				task.wait()
			end
		end
		if IsFetchStatusMatch and not Entry then
			task.wait()
		end
	end
	populateRelevantSourceStrings(config)
	config.aqJobId = p9.aqsFetchMetrics.aqJobId or ""
	reportFullResult(config, p9, 1000 * (os.clock() - ClockTime))
	
	return config
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

local _ = function(Entry, Name, p10)
	for _, value in Entry do
		if value.Name == Name then
			return value
		end
	end
	return if p10 then Entry[1] else nil
end

local function synthesizeRootFromFolders(EntrypointInput, R15ArtistIntent, p11)
	local Folder = Instance.new("Folder")
	
	for _, value in EntrypointInput do
		local AllSelectedInstances = value.allSelectedInstances
		local Object = nil
		
		for _, allSelectedInstance in AllSelectedInstances do
			if allSelectedInstance.Name == R15ArtistIntent then
				Object = allSelectedInstance
				if Object ~= nil then
					if Object:IsA("Folder") or Object:IsA("Model") then
						for _, child in Object:GetChildren() do
							child:Clone().Parent = Folder
						end
					else
						Object:Clone().Parent = Folder
					end
				end
			else
				continue
			end
		end
		Object = if p11 then AllSelectedInstances[1] else nil
	end
	return Folder
end

return {
	ValidateAsset = function(Entry, AssetType, p12)
		-- upvalues: HttpService (copy), ConstantsModule (copy), GetEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (copy), createConsumerConfigWithDefaults (copy), runValidationOnRootInstance (copy)
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
		local R15LegacyDuplicateRoot = nil
		
		if GetEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() then
			local R15Fixed = ConstantsModule.FOLDER_NAMES.R15Fixed
			R15LegacyDuplicateRoot = nil
			
			for _, value1 in Entry do
				if value1.Name == R15Fixed then
					R15LegacyDuplicateRoot = value1
					break
				end
			end
		else
			R15LegacyDuplicateRoot = nil
		end
		config.r15LegacyDuplicateRoot = R15LegacyDuplicateRoot
		config.uploadEnum = { assetType = AssetType }
		config.consumerConfig = createConsumerConfigWithDefaults(p12)
		config.hsrAssets = {}
		
		return (runValidationOnRootInstance(config))
	end,
	ValidateFinalizedBundle = function(EntrypointInput, BundleType, p13)
		-- upvalues: GetFFlagDebugAllowHRDUploadOnBundleBackendModule (copy), R15plusUtilsModule (copy), ConstantsModule (copy), GetEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (copy), synthesizeRootFromFolders (copy), HttpService (copy), createConsumerConfigWithDefaults (copy), runValidationOnRootInstance (copy)
		if GetFFlagDebugAllowHRDUploadOnBundleBackendModule() then
			R15plusUtilsModule.setIsBackendBundleUpload(p13.source == "Publish" or p13.source == "Backend")
		end
		local R15LegacyDuplicateRoot = nil
		local Model1 = nil
		
		if BundleType == Enum.BundleType.Animations then
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
		elseif GetEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() then
			Model1 = synthesizeRootFromFolders(EntrypointInput, ConstantsModule.FOLDER_NAMES.R15ArtistIntent, true)
			R15LegacyDuplicateRoot = synthesizeRootFromFolders(EntrypointInput, ConstantsModule.FOLDER_NAMES.R15Fixed, true)
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
			r15LegacyDuplicateRoot = R15LegacyDuplicateRoot,
			uploadEnum = { bundleType = BundleType },
			consumerConfig = createConsumerConfigWithDefaults(p13),
			hsrAssets = {}
		})
		
		if GetFFlagDebugAllowHRDUploadOnBundleBackendModule() then
			R15plusUtilsModule.setIsBackendBundleUpload(false)
		end
		return RunValidationOnRootInstanceResult
	end
}