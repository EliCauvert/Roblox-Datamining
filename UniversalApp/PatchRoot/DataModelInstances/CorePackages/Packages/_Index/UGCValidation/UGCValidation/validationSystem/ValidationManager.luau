local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local validationModuleLoaderModule = require(parent.validationSystem.ValidationModuleLoader)
local constantsModule = require(parent.Constants)
local validationTestWrapperModule = require(parent.validationSystem.ValidationTestWrapper)
local fetchAllDesiredDataModule = require(parent.validationSystem.dataFetchModules.FetchAllDesiredData)
local fetchContentIdsModule = require(parent.validationSystem.dataFetchModules.FetchContentIds)
local getUploadCategoryModule = require(parent.util.getUploadCategory)
local recreateSceneFromEditablesModule = require(parent.util.RecreateSceneFromEditables)
local stripMeshFromGltfModule = require(parent.util.stripMeshFromGltf)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local resetPhysicsDataModule = require(parent.util.resetPhysicsData)
local getFFlagDebugAllowHRDUploadOnBundleBackendModule = require(parent.flags.getFFlagDebugAllowHRDUploadOnBundleBackend)
local getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule = require(parent.flags.getEngineFeatureEngineUGCValidateInstanceTreesEquivalent)
local getFFlagUGCValidationAllowFullVaasModule = require(parent.flags.getFFlagUGCValidationAllowFullVaas)
local getFFlagDebugUGCDisableAssetQualityChecksModule = require(parent.flags.getFFlagDebugUGCDisableAssetQualityChecks)
local getEngineFeatureEngineDebugUGCValidationViaLocalRCCModule = require(parent.flags.getEngineFeatureEngineDebugUGCValidationViaLocalRCC)
local getEngineFeatureEngineUGCValidateEmoteAnimationExportModule = require(parent.flags.getEngineFeatureEngineUGCValidateEmoteAnimationExport)
local httpService = game:GetService("HttpService")
local telemetryService = game:GetService("TelemetryService")
local runService = game:GetService("RunService")
local assetQualityService = game:GetService("AssetQualityService")
game:DefineFastInt("FullValidationTelemetryThrottleHundrethsPercent", 10000)
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local t = {
	eventName = "UgcFullValidationFinished",
	description = "Report result of ugc validation suite",
	links = "https://create.roblox.com/docs/art/validation-errors",
	backends = { "EventIngest" },
	throttlingPercentage = game:GetFastInt("FullValidationTelemetryThrottleHundrethsPercent"),
	lastUpdated = { 26, 9, 4 }
}
local getFFlagDebugUGCValidationPrintNewStructureResultsModule = require(parent.flags.getFFlagDebugUGCValidationPrintNewStructureResults)
local getFIntUGCValidationFetchQualityMaxRetryModule = require(parent.flags.getFIntUGCValidationFetchQualityMaxRetry)
local getEngineFeatureEngineAssetQualityV2SummaryFromUrlModule = require(parent.flags.getEngineFeatureEngineAssetQualityV2SummaryFromUrl)
local getFIntUGCValidationFetchQualityRetryDelayMsModule = require(parent.flags.getFIntUGCValidationFetchQualityRetryDelayMs)
local t_1 = {}
local t_2 = { Publish = true, Backend = true, Internal = true }
local t_3 = { InExpServer = true, InExpClient = true }
local t_4 = {
	Toolbox = validationEnumsModule.ConsumerEnv.Studio,
	AutoSetup = validationEnumsModule.ConsumerEnv.Studio,
	Publish = validationEnumsModule.ConsumerEnv.Backend,
	Backend = validationEnumsModule.ConsumerEnv.Backend,
	Internal = validationEnumsModule.ConsumerEnv.Backend,
	InExpServer = validationEnumsModule.ConsumerEnv.IEC,
	InExpClient = validationEnumsModule.ConsumerEnv.IEC
}
local assetQualityFetchStatus = validationEnumsModule.AssetQualityFetchStatus
local var1 = if getEngineFeatureEngineDebugUGCValidationViaLocalRCCModule() then {
	[validationEnumsModule.ValidationModule.DescendantIdsAllowed] = true,
	[validationEnumsModule.ValidationModule.DescendantIdsPublished] = true
} else nil

local function initRunVariables(p1, p2)
	-- upvalues: validationModuleLoaderModule (ref), getFFlagDebugUGCDisableAssetQualityChecksModule (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local skipModules = p2.skipModules
	
	for i, v in validationModuleLoaderModule.allModules do
		if not skipModules[i] and (not getFFlagDebugUGCDisableAssetQualityChecksModule() or not p2.skipAssetQualityChecks or not v.isAssetQualityModule) and (table.find(v.categories, p1) and (v.fflag() or v.shadowFlag())) then
			local var2 = v.shadowFlag() and not v.fflag()
			
			for i_1, v_2 in v.requiredData do
				t_2[v_2] = true
			end
			for i_1, v_2 in v.conditionalData do
				t_2[v_2] = true
			end
			local isAssetQualityModule = v.isAssetQualityModule
			
			if isAssetQualityModule then
				table.insert(t, i)
			end
			local t_3 = {}
			
			for i_3, v_4 in v.prereqTests do
				t_3[v_4] = true
			end
			t_1[i] = {
				name = i,
				prereqs = t_3,
				postreqs = {},
				isQuality = isAssetQualityModule,
				isShadow = var2
			}
		end
	end
	for i_1, v in t_1 do
		for i_2, v_2 in v.prereqs do
			if t_1[i_2] == nil then
				error(string.format("%s is needed for %s to run, but is not an included test", i_2, i_1))
			end
			table.insert(t_1[i_2].postreqs, i_1)
		end
	end
	return t, t_1, t_2
end

local function fetchQualityResults(p3, p4)
	-- upvalues: assetQualityService (ref), assetQualityFetchStatus (ref), recreateSceneFromEditablesModule (ref), getEngineFeatureEngineUGCValidateEmoteAnimationExportModule (ref), validationEnumsModule (ref), stripMeshFromGltfModule (ref), getFIntUGCValidationFetchQualityRetryDelayMsModule (ref), getFIntUGCValidationFetchQualityMaxRetryModule (ref), getEngineFeatureEngineAssetQualityV2SummaryFromUrlModule (ref), getFFlagUGCValidationAllowFullVaasModule (ref), httpService (ref), getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref), fetchAllDesiredDataModule (ref)
	if not assetQualityService then
		p3.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchFailure
		p3.aqsFetchMetrics.fetchFailureReason = "Not enabled"
		
		return
	end
	local var3
	local _ = nil
	local var4 = nil
	local var5 = nil
	local var6 = nil
	
	if p3.consumerConfig.aqFetchStage == "scene" then
		local ok, status = pcall(function()
			-- upvalues: var6 (write), recreateSceneFromEditablesModule (copy), p3 (ref), var5 (write), assetQualityService (copy)
			var6 = recreateSceneFromEditablesModule.createModelForGltfExport(p3)
			var5 = assetQualityService:GenerateAssetQualityGltfFromInstanceAsync(var6)
		end)
		var3 = ok
		var4 = status
		
		if getEngineFeatureEngineUGCValidateEmoteAnimationExportModule() then
			if var3 then
				local var7 = getFIntUGCValidationFetchQualityRetryDelayMsModule()
				
				for i = 1, 1 + getFIntUGCValidationFetchQualityMaxRetryModule() do
					if i > 1 and var7 > 0 then
						task.wait(var7 / 1000)
					end
					local ok, status = pcall(function()
						-- upvalues: p3 (ref), i (ref), getEngineFeatureEngineAssetQualityV2SummaryFromUrlModule (copy), getFFlagUGCValidationAllowFullVaasModule (copy), assetQualityService (copy), p4 (ref), var5 (write), httpService (copy)
						local var8, var9
						p3.aqsFetchMetrics.fetchAttemptCount = i
						local processTime = os.clock()
						local _ = nil
						
						if p3.consumerConfig.aqFetchStage == "jobId" then
							var8 = if getEngineFeatureEngineAssetQualityV2SummaryFromUrlModule() then p3.consumerConfig.aqJobId else p3.consumerConfig.aqFetchData
							var9 = if getFFlagUGCValidationAllowFullVaasModule() and var8 ~= nil and var8 ~= "" then assetQualityService:FetchAssetQualitySummaryFromJobIdV2Async(var8, p4) else assetQualityService:FetchAssetQualitySummaryFromJobIdAsync(var8, p4)
						else
							var9 = if p3.consumerConfig.aqFetchStage == "summaryUrl" then assetQualityService:FetchAssetQualitySummaryFromUrlAsync(p3.consumerConfig.aqSummaryUrl, p3.consumerConfig.aqJobId, p4) else assetQualityService:FetchAssetQualitySummaryFromGltfAsync(var5, p4)
						end
						var8 = 1000 * (os.clock() - processTime)
						p3.aqsFetchMetrics.visualizationUrl = var9.visualizationUrl
						p3.aqsFetchMetrics.fetchTimeMs = var8
						p3.aqsFetchMetrics.aqJobId = var9.aqJobId
						p3.aqsSummaryData = httpService:JSONDecode(var9.rawJson)
					end)
					var3 = ok
					var4 = status
					
					if var3 then break end
				end
			end
			if var3 then
				p3.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchSuccess
				
				if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
					print(string.format("AQS fetch success: aqJobId=%s attempts=%d fetchTimeMs=%d", p3.aqsFetchMetrics.aqJobId or "", p3.aqsFetchMetrics.fetchAttemptCount or 0, p3.aqsFetchMetrics.fetchTimeMs or 0))
					print(p3.aqsSummaryData)
				end
			else
				p3.aqsFetchMetrics.fetchFailureReason = var4
				p3.aqsSummaryData = fetchAllDesiredDataModule.DATA_FETCH_FAILURE
				p3.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchFailure
				
				if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
					print("AQS fetch failure:", var4)
				end
			end
			return
		end
	elseif p3.consumerConfig.aqFetchStage == "gltf" then
		var5 = p3.consumerConfig.aqFetchData
	end
	var3 = true
end

local function getNextLayer(p5, p6)
	local t = {}
	
	for i, v in p5 do
		if next(v.prereqs) == nil and (p6 or not v.isQuality) then
			table.insert(t, i)
		end
	end
	return t
end

local function populateRelevantSourceStrings(p7)
	-- upvalues: errorSourceStringsModule (ref)
	local function _(p8)
		-- upvalues: errorSourceStringsModule (copy), p7 (ref)
		local var8 = p8:split(".")
		local var9 = errorSourceStringsModule.Values[var8[#var8]]
		
		if var9 then
			p7.relevantSourceStrings[p8] = var9
		end
	end
	
	for i, v in p7.failureMap do
		for i_2, v_1 in v do
			local failureStringKey = v_1.failureStringKey
			local var8 = failureStringKey:split(".")
			local var9 = errorSourceStringsModule.Values[var8[#var8]]
			
			if var9 then
				p7.relevantSourceStrings[failureStringKey] = var9
			end
		end
	end
	for i, v_1 in p7.warningMap do
		for i_2, v_2 in v_1 do
			local failureStringKey = v_2.failureStringKey
			local var10 = failureStringKey:split(".")
			local var11 = errorSourceStringsModule.Values[var10[#var10]]
			
			if var11 then
				p7.relevantSourceStrings[failureStringKey] = var11
			end
		end
	end
end

local function _(p8)
	local uploadEnum = p8.uploadEnum
	
	return if uploadEnum.assetType then uploadEnum.assetType.Name elseif uploadEnum.bundleType then uploadEnum.bundleType.Name else "?"
end

local function reportFullResult(p8, p9, p10)
	-- upvalues: assetQualityFetchStatus (ref), rbxAnalyticsService (ref), getFFlagUGCValidationAllowFullVaasModule (ref), telemetryService (ref), t (ref), getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref)
	local var12 = p9.aqsFetchMetrics.fetchStatus ~= assetQualityFetchStatus.assetQualityFetchNA
	local t_1 = {
		validationJobId = p9.jobId,
		bundleJobId = p9.consumerConfig.telemetryBundleId,
		rootInstanceId = p9.consumerConfig.telemetryRootId,
		studioSid = rbxAnalyticsService:GetSessionId(),
		clientId = rbxAnalyticsService:GetClientId(),
		placeId = game.PlaceId,
		validationSource = p9.consumerConfig.source,
		assetType = if p9.uploadEnum.assetType then p9.uploadEnum.assetType.Value else 0,
		bundleType = if p9.uploadEnum.bundleType then p9.uploadEnum.bundleType.Value else 0,
		numFailures = p8.numFailures,
		passed = p8.pass,
		durationMs = p10,
		uploadCategory = p9.uploadCategory,
		aqFetchStatus = p9.aqsFetchMetrics.fetchStatus,
		aqFetchAttemptCount = if var12 then p9.aqsFetchMetrics.fetchAttemptCount else 0,
		aqFetchTimeMs = if var12 then p9.aqsFetchMetrics.fetchTimeMs else 0,
		aqFetchFailureReason = if var12 then p9.aqsFetchMetrics.fetchFailureReason else "",
		aqJobId = p9.aqsFetchMetrics.aqJobId or ""
	}
	
	if getFFlagUGCValidationAllowFullVaasModule() then
		t_1.isVaas = p9.consumerConfig.isVaaS or false
		t_1.aqFetchStage = p9.consumerConfig.aqFetchStage
	end
	telemetryService:LogEvent(t, { customFields = t_1 })
	
	if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
		local uploadEnum = p9.uploadEnum
		print(string.format("==== %s Validation end ==== pass=%s numFailures=%d numWarnings=%d durationMs=%d", if uploadEnum.assetType then uploadEnum.assetType.Name elseif uploadEnum.bundleType then uploadEnum.bundleType.Name else "?", tostring(p8.pass), p8.numFailures, p8.numWarnings, p10))
		
		for i, v in p8.failureMap do
			for i_1, v_1 in v do
				print(string.format("  FAIL %s: %s @ %s", i, v_1.failureStringKey, if v_1.instancePath ~= "" then "<root>" else v_1.instancePath))
			end
		end
		print(p8)
	end
end

local function updateResultData(p11, p12, p13, _, p14)
	-- upvalues: validationEnumsModule (ref)
	local validationEnum = p13.validationEnum
	
	if p14 or not p12[validationEnum].isShadow then
		p11.states[validationEnum] = p13.status
		
		if p13.status ~= validationEnumsModule.Status.PASS then
			p11.pass = false
			p11.numFailures += math.max(1, #p13.failures)
		end
		if #p13.failures > 0 then
			p11.failureMap[validationEnum] = p13.failures
		end
		if #p13.warnings > 0 then
			p11.warningMap[validationEnum] = p13.warnings
			p11.numWarnings += #p13.warnings
		end
		if p13.status == validationEnumsModule.Status.ERROR then
			p11.ranIntoInternalError = true
		end
	end
	for i, v in p12[validationEnum].postreqs do
		p12[v].prereqs[validationEnum] = nil
	end
	p12[validationEnum] = nil
end

local function createConsumerConfigWithDefaults(p15)
	-- upvalues: var1 (ref), t_4 (ref), getFFlagUGCValidationAllowFullVaasModule (ref), validationEnumsModule (ref), getEngineFeatureEngineAssetQualityV2SummaryFromUrlModule (ref)
	local cloned = table.clone(p15)
	
	if cloned.enforceR15FolderStructure == nil then
		cloned.enforceR15FolderStructure = true
	end
	if cloned.enforceShadowValidations == nil then
		cloned.enforceShadowValidations = false
	end
	cloned.telemetryBundleId = cloned.telemetryBundleId or ""
	cloned.telemetryRootId = cloned.telemetryRootId or ""
	cloned.preloadedEditableMeshes = cloned.preloadedEditableMeshes or {}
	cloned.preloadedEditableImages = cloned.preloadedEditableImages or {}
	cloned.preloadedHsrAssets = cloned.preloadedHsrAssets or {}
	cloned.preloadedCurveAnimations = cloned.preloadedCurveAnimations or {}
	cloned.skipModules = cloned.skipModules or {}
	
	if var1 then
		cloned.skipModules = table.clone(cloned.skipModules)
		
		for i in var1 do
			cloned.skipModules[i] = true
		end
	end
	cloned.skipAssetQualityChecks = cloned.skipAssetQualityChecks or false
	cloned.skipPhysicsDataReset = cloned.skipPhysicsDataReset or false
	cloned.isVaaS = cloned.isVaaS or false
	cloned.consumerEnv = t_4[cloned.source]
	assert(cloned.consumerEnv ~= nil, `unknown consumer source: {tostring(cloned.source)}`)
	
	if getFFlagUGCValidationAllowFullVaasModule() and cloned.isVaaS then
		cloned.validationEnv = validationEnumsModule.ValidationEnv.Backend
	else
		cloned.validationEnv = cloned.consumerEnv
	end
	cloned.backendConfigs = cloned.backendConfigs or {}
	cloned.iecConfigs = cloned.iecConfigs or {}
	cloned.aqFetchStage = cloned.aqFetchStage or "scene"
	cloned.aqFetchData = cloned.aqFetchData or ""
	local aqFetchData = cloned.aqFetchData
	
	if getEngineFeatureEngineAssetQualityV2SummaryFromUrlModule() then
		cloned.aqJobId = cloned.aqJobId or ""
		cloned.aqSummaryUrl = cloned.aqSummaryUrl or ""
		
		if cloned.aqFetchStage == "jobId" then
			aqFetchData = cloned.aqJobId
		elseif cloned.aqFetchStage == "summaryUrl" then
			aqFetchData = cloned.aqSummaryUrl
		end
	else
		assert(cloned.aqFetchStage ~= "summaryUrl", "aqFetchStage \"summaryUrl\" requires EngineAssetQualityV2SummaryFromUrl")
	end
	assert(cloned.aqFetchStage == "scene" == (aqFetchData == ""), `aqFetchData/aqJobId/aqSummaryUrl (per stage) must be non-empty iff aqFetchStage is not "scene" (got stage="{cloned.aqFetchStage}")`)
	
	return cloned
end

local function runValidationOnRootInstance(p16)
	-- upvalues: getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref), getFFlagUGCValidationAllowFullVaasModule (ref), getUploadCategoryModule (ref), initRunVariables (ref), assetQualityFetchStatus (ref), getEngineFeatureEngineAssetQualityV2SummaryFromUrlModule (ref), validationTestWrapperModule (ref), validationEnumsModule (ref), updateResultData (ref), populateRelevantSourceStrings (ref), reportFullResult (ref), fetchContentIdsModule (ref), resetPhysicsDataModule (ref), t_2 (ref), fetchAllDesiredDataModule (ref), runService (ref), fetchQualityResults (ref), getNextLayer (ref), t_3 (ref)
	local processTime = os.clock()
	local rootInstance = p16.rootInstance
	local assetType = p16.uploadEnum.assetType
	local bundleType = p16.uploadEnum.bundleType
	local consumerConfig = p16.consumerConfig
	
	if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
		local uploadEnum = p16.uploadEnum
		print(string.format("==== %s Validation begin ==== jobId=%s source=%s", if uploadEnum.assetType then uploadEnum.assetType.Name elseif uploadEnum.bundleType then uploadEnum.bundleType.Name else "?", p16.jobId, p16.consumerConfig.source))
	end
	local t = {
		pass = true,
		numFailures = 0,
		numWarnings = 0,
		ranIntoInternalError = false,
		aqJobId = "",
		validationJobId = p16.jobId,
		telemetryBundleId = if getFFlagUGCValidationAllowFullVaasModule() then consumerConfig.telemetryBundleId else nil,
		states = {},
		failureMap = {},
		warningMap = {},
		relevantSourceStrings = {}
	}
	local var13 = getUploadCategoryModule(rootInstance, assetType, bundleType)
	local var14, var15, var16 = initRunVariables(var13, consumerConfig)
	p16.uploadCategory = var13
	p16.aqsFetchMetrics = {
		fetchStatus = assetQualityFetchStatus.assetQualityFetchNA,
		aqJobId = if getEngineFeatureEngineAssetQualityV2SummaryFromUrlModule() then consumerConfig.aqJobId elseif consumerConfig.aqFetchStage == "jobId" then consumerConfig.aqFetchData else nil
	}
	updateResultData(t, var15, validationTestWrapperModule(validationEnumsModule.ValidationModule.ExpectedRootSchema, p16, t.states), p16.jobId, consumerConfig.enforceShadowValidations)
	
	if t.states[validationEnumsModule.ValidationModule.ExpectedRootSchema] ~= validationEnumsModule.Status.PASS then
		populateRelevantSourceStrings(t)
		t.aqJobId = p16.aqsFetchMetrics.aqJobId or ""
		reportFullResult(t, p16, -1)
		
		return t
	end
	local descendantIdsPublished = validationEnumsModule.ValidationModule.DescendantIdsPublished
	
	if var15[descendantIdsPublished] then
		p16.contentIds = fetchContentIdsModule.getData(p16)
		updateResultData(t, var15, validationTestWrapperModule(descendantIdsPublished, p16, t.states), p16.jobId, consumerConfig.enforceShadowValidations)
		local var17 = t.states[descendantIdsPublished]
		
		if var17 ~= nil and var17 ~= validationEnumsModule.Status.PASS then
			populateRelevantSourceStrings(t)
			t.aqJobId = p16.aqsFetchMetrics.aqJobId or ""
			reportFullResult(t, p16, 1000 * (os.clock() - processTime))
			
			return t
		elseif getFFlagUGCValidationAllowFullVaasModule() and p16.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend then
			resetPhysicsDataModule({ p16.rootInstance }, {
				isServer = true,
				bypassFlags = {
					skipPhysicsDataReset = p16.consumerConfig.skipPhysicsDataReset
				}
			})
		end
		local source = t_2[consumerConfig.source] or consumerConfig.validationEnv == validationEnumsModule.ValidationEnv.Backend
		fetchAllDesiredDataModule.storeDesiredData(p16, var16)
		
		if #var14 > 0 then
			p16.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchInProgress
			
			if source then
				runService:Run()
				fetchQualityResults(p16, var14)
				runService:Pause()
			else
				task.spawn(fetchQualityResults, p16, var14)
			end
		end
		while next(var15) ~= nil do
			local var18 = p16.aqsFetchMetrics.fetchStatus == assetQualityFetchStatus.assetQualityFetchInProgress
			local var19 = getNextLayer(var15, not var18)
			
			if #var19 == 0 and not var18 then
				error("Impossible to complete all layers")
			end
			for i, v in var19 do
				updateResultData(t, var15, validationTestWrapperModule(v, p16, t.states), p16.jobId, consumerConfig.enforceShadowValidations)
				
				if t_3[consumerConfig.source] and not source then
					task.wait()
				end
			end
			if var18 and not source then
				task.wait()
			end
		end
		populateRelevantSourceStrings(t)
		t.aqJobId = p16.aqsFetchMetrics.aqJobId or ""
		reportFullResult(t, p16, 1000 * (os.clock() - processTime))
		
		return t
	end
end

local _ = function(p17)
	-- upvalues: constantsModule (ref)
	if #p17 == 0 then
		return nil
	end
	for i, v in p17 do
		if v.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
			return v
		end
	end
	return p17[1]
end

local _ = function(p18, p19, p20)
	for i, v in p18 do
		if v.Name == p19 then
			return v
		end
	end
	return if p20 then p18[1] else nil
end

local function synthesizeRootFromFolders(p21, p22, p23)
	local folder = Instance.new("Folder")
	
	for i, v in p21 do
		local var20
		local allSelectedInstances = v.allSelectedInstances
		
		for i_1, v_1 in allSelectedInstances do
			if v_1.Name == p22 then
				var20 = v_1
				if var20 ~= nil then
					if var20:IsA("Folder") or var20:IsA("Model") then
						for i_2, i_1 in var20:GetChildren() do
							i_1:Clone().Parent = folder
						end
					else
						var20:Clone().Parent = folder
					end
				end
			end
		end
		var20 = if p23 then allSelectedInstances[1] else nil
	end
	return folder
end

function t_1.ValidateAsset(value, p24, p25)
	-- upvalues: httpService (ref), constantsModule (ref), getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (ref), createConsumerConfigWithDefaults (ref), runValidationOnRootInstance (ref)
	local var21
	local t = {
		jobId = httpService:GenerateGUID(),
		entrypointInput = value
	}
	
	if #value == 0 then
		var21 = nil
	else
		for i, v in value do
			if v.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
				var21 = v
			end
		end
		var21 = value[1]
	end
	local var22
	t.rootInstance = var21
	
	if getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() then
		local r15Fixed = constantsModule.FOLDER_NAMES.R15Fixed
		
		for v, v in value do
			if v.Name == r15Fixed then
				var22 = v
			end
		end
		var22 = nil
	else
		var22 = nil
	end
	t.r15LegacyDuplicateRoot = var22
	t.uploadEnum = { assetType = p24 }
	t.consumerConfig = createConsumerConfigWithDefaults(p25)
	t.hsrAssets = {}
	
	return runValidationOnRootInstance(t)
end

function t_1.ValidateFinalizedBundle(p26, p27, p28)
	-- upvalues: getFFlagDebugAllowHRDUploadOnBundleBackendModule (ref), r15plusUtilsModule (ref), constantsModule (ref), getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (ref), synthesizeRootFromFolders (ref), httpService (ref), createConsumerConfigWithDefaults (ref), runValidationOnRootInstance (ref)
	if getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
		r15plusUtilsModule.setIsBackendBundleUpload(if p28.source ~= "Publish" then p28.source == "Backend" else true)
	end
	local var23
	local _ = nil
	local var24 = nil
	
	if p27 == Enum.BundleType.Animations then
		local model = Instance.new("Model")
		
		for i, v in p26 do
			local var25
			local allSelectedInstances = v.allSelectedInstances
			
			if #allSelectedInstances == 0 then
				var25 = nil
				if var25 ~= nil then
					var25:Clone().Parent = model
				end
			end
			for i_1, v_1 in allSelectedInstances do
				if v_1.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
					var25 = v_1
				end
			end
			var25 = allSelectedInstances[1]
		end
		var23 = model
	elseif getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() then
		var23 = synthesizeRootFromFolders(p26, constantsModule.FOLDER_NAMES.R15ArtistIntent, true)
		var24 = synthesizeRootFromFolders(p26, constantsModule.FOLDER_NAMES.R15Fixed, true)
	else
		local folder = Instance.new("Folder")
		
		for i, v in p26 do
			local var26
			local allSelectedInstances = v.allSelectedInstances
			
			if #allSelectedInstances == 0 then
				var26 = nil
				if var26 ~= nil then
					if var26:IsA("Folder") or var26:IsA("Model") then
						for i_2, i_1 in var26:GetChildren() do
							i_1:Clone().Parent = folder
						end
					else
						var26:Clone().Parent = folder
					end
				end
			end
			for i_1, v_1 in allSelectedInstances do
				if v_1.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
					var26 = v_1
				end
			end
			var26 = allSelectedInstances[1]
		end
		var23 = folder
	end
	local var27 = runValidationOnRootInstance({
		jobId = httpService:GenerateGUID(),
		entrypointInput = p26,
		rootInstance = var23,
		r15LegacyDuplicateRoot = var24,
		uploadEnum = { bundleType = p27 },
		consumerConfig = createConsumerConfigWithDefaults(p28),
		hsrAssets = {}
	})
	
	if getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
		r15plusUtilsModule.setIsBackendBundleUpload(false)
	end
	return var27
end

return t_1