local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local validationModuleLoaderModule = require(parent.validationSystem.ValidationModuleLoader)
local constantsModule = require(parent.Constants)
local validationTestWrapperModule = require(parent.validationSystem.ValidationTestWrapper)
local fetchAllDesiredDataModule = require(parent.validationSystem.dataFetchModules.FetchAllDesiredData)
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

local function initRunVariables(p1, p2)
	-- upvalues: validationModuleLoaderModule (ref), getFFlagDebugUGCDisableAssetQualityChecksModule (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local skipModules = p2.skipModules
	
	for i, v in validationModuleLoaderModule.allModules do
		if not skipModules[i] and (not getFFlagDebugUGCDisableAssetQualityChecksModule() or not p2.skipAssetQualityChecks or not v.isAssetQualityModule) and (table.find(v.categories, p1) and (v.fflag() or v.shadowFlag())) then
			local var1 = v.shadowFlag() and not v.fflag()
			
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
				isShadow = var1
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
	-- upvalues: assetQualityService (ref), assetQualityFetchStatus (ref), recreateSceneFromEditablesModule (ref), getEngineFeatureEngineUGCValidateEmoteAnimationExportModule (ref), validationEnumsModule (ref), stripMeshFromGltfModule (ref), getFIntUGCValidationFetchQualityMaxRetryModule (ref), getFFlagUGCValidationAllowFullVaasModule (ref), httpService (ref), getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref), fetchAllDesiredDataModule (ref)
	if not assetQualityService then
		p3.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchFailure
		p3.aqsFetchMetrics.fetchFailureReason = "Not enabled"
		
		return
	end
	local var2
	local _ = nil
	local var3 = nil
	local var4 = nil
	local var5 = nil
	
	if p3.consumerConfig.aqFetchStage == "scene" then
		local ok, status = pcall(function()
			-- upvalues: var5 (write), recreateSceneFromEditablesModule (copy), p3 (ref), var4 (write), assetQualityService (copy)
			var5 = recreateSceneFromEditablesModule.createModelForGltfExport(p3)
			var4 = assetQualityService:GenerateAssetQualityGltfFromInstanceAsync(var5)
		end)
		var2 = ok
		var3 = status
		
		if getEngineFeatureEngineUGCValidateEmoteAnimationExportModule() then
			if var2 then
				for i = 1, 1 + getFIntUGCValidationFetchQualityMaxRetryModule() do
					local ok, status = pcall(function()
						-- upvalues: p3 (ref), i (ref), getFFlagUGCValidationAllowFullVaasModule (copy), assetQualityService (copy), p4 (ref), var4 (write), httpService (copy)
						local aqFetchData, var6
						p3.aqsFetchMetrics.fetchAttemptCount = i
						local processTime = os.clock()
						local _ = nil
						
						if p3.consumerConfig.aqFetchStage == "jobId" then
							aqFetchData = p3.consumerConfig.aqFetchData
							var6 = if getFFlagUGCValidationAllowFullVaasModule() and aqFetchData ~= nil and aqFetchData ~= "" then assetQualityService:FetchAssetQualitySummaryFromJobIdV2Async(aqFetchData, p4) else assetQualityService:FetchAssetQualitySummaryFromJobIdAsync(aqFetchData, p4)
						else
							var6 = assetQualityService:FetchAssetQualitySummaryFromGltfAsync(var4, p4)
						end
						aqFetchData = 1000 * (os.clock() - processTime)
						p3.aqsFetchMetrics.visualizationUrl = var6.visualizationUrl
						p3.aqsFetchMetrics.fetchTimeMs = aqFetchData
						p3.aqsFetchMetrics.aqJobId = var6.aqJobId
						p3.aqsSummaryData = httpService:JSONDecode(var6.rawJson)
					end)
					var2 = ok
					var3 = status
					
					if var2 then break end
				end
			end
			if var2 then
				p3.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchSuccess
				
				if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
					print(string.format("AQS fetch success: aqJobId=%s attempts=%d fetchTimeMs=%d", p3.aqsFetchMetrics.aqJobId or "", p3.aqsFetchMetrics.fetchAttemptCount or 0, p3.aqsFetchMetrics.fetchTimeMs or 0))
					print(p3.aqsSummaryData)
				end
			else
				p3.aqsFetchMetrics.fetchFailureReason = var3
				p3.aqsSummaryData = fetchAllDesiredDataModule.DATA_FETCH_FAILURE
				p3.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchFailure
				
				if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
					print("AQS fetch failure:", var3)
				end
			end
			return
		end
	elseif p3.consumerConfig.aqFetchStage == "gltf" then
		var4 = p3.consumerConfig.aqFetchData
	end
	var2 = true
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
		local var6 = p8:split(".")
		local var7 = errorSourceStringsModule.Values[var6[#var6]]
		
		if var7 then
			p7.relevantSourceStrings[p8] = var7
		end
	end
	
	for i, v in p7.failureMap do
		for i_2, v_1 in v do
			local failureStringKey = v_1.failureStringKey
			local var6 = failureStringKey:split(".")
			local var7 = errorSourceStringsModule.Values[var6[#var6]]
			
			if var7 then
				p7.relevantSourceStrings[failureStringKey] = var7
			end
		end
	end
	for i, v_1 in p7.warningMap do
		for i_2, v_2 in v_1 do
			local failureStringKey = v_2.failureStringKey
			local var8 = failureStringKey:split(".")
			local var9 = errorSourceStringsModule.Values[var8[#var8]]
			
			if var9 then
				p7.relevantSourceStrings[failureStringKey] = var9
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
	local var10 = p9.aqsFetchMetrics.fetchStatus ~= assetQualityFetchStatus.assetQualityFetchNA
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
		aqFetchAttemptCount = if var10 then p9.aqsFetchMetrics.fetchAttemptCount else 0,
		aqFetchTimeMs = if var10 then p9.aqsFetchMetrics.fetchTimeMs else 0,
		aqFetchFailureReason = if var10 then p9.aqsFetchMetrics.fetchFailureReason else "",
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
	-- upvalues: t_4 (ref), getFFlagUGCValidationAllowFullVaasModule (ref), validationEnumsModule (ref)
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
	cloned.skipModules = cloned.skipModules or {}
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
	assert(cloned.aqFetchStage == "scene" == (cloned.aqFetchData == ""), `aqFetchData must be non-empty iff aqFetchStage is "gltf" or "jobId" (got stage="{cloned.aqFetchStage}")`)
	
	return cloned
end

local function runValidationOnRootInstance(p15)
	-- upvalues: getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref), getFFlagUGCValidationAllowFullVaasModule (ref), getUploadCategoryModule (ref), initRunVariables (ref), assetQualityFetchStatus (ref), validationTestWrapperModule (ref), validationEnumsModule (ref), updateResultData (ref), populateRelevantSourceStrings (ref), reportFullResult (ref), resetPhysicsDataModule (ref), t_2 (ref), fetchAllDesiredDataModule (ref), runService (ref), fetchQualityResults (ref), getNextLayer (ref), t_3 (ref)
	local processTime = os.clock()
	local rootInstance = p15.rootInstance
	local assetType = p15.uploadEnum.assetType
	local bundleType = p15.uploadEnum.bundleType
	local consumerConfig = p15.consumerConfig
	
	if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
		local uploadEnum = p15.uploadEnum
		print(string.format("==== %s Validation begin ==== jobId=%s source=%s", if uploadEnum.assetType then uploadEnum.assetType.Name elseif uploadEnum.bundleType then uploadEnum.bundleType.Name else "?", p15.jobId, p15.consumerConfig.source))
	end
	local t = {
		pass = true,
		numFailures = 0,
		numWarnings = 0,
		ranIntoInternalError = false,
		aqJobId = "",
		validationJobId = p15.jobId,
		telemetryBundleId = if getFFlagUGCValidationAllowFullVaasModule() then consumerConfig.telemetryBundleId else nil,
		states = {},
		failureMap = {},
		warningMap = {},
		relevantSourceStrings = {}
	}
	local var11 = getUploadCategoryModule(rootInstance, assetType, bundleType)
	local var12, var13, var14 = initRunVariables(var11, consumerConfig)
	p15.uploadCategory = var11
	p15.aqsFetchMetrics = {
		fetchStatus = assetQualityFetchStatus.assetQualityFetchNA,
		aqJobId = if consumerConfig.aqFetchStage == "jobId" then consumerConfig.aqFetchData else nil
	}
	updateResultData(t, var13, validationTestWrapperModule(validationEnumsModule.ValidationModule.ExpectedRootSchema, p15, t.states), p15.jobId, consumerConfig.enforceShadowValidations)
	
	if t.states[validationEnumsModule.ValidationModule.ExpectedRootSchema] ~= validationEnumsModule.Status.PASS then
		populateRelevantSourceStrings(t)
		t.aqJobId = p15.aqsFetchMetrics.aqJobId or ""
		reportFullResult(t, p15, -1)
		
		return t
	elseif getFFlagUGCValidationAllowFullVaasModule() and p15.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend then
		resetPhysicsDataModule({ p15.rootInstance }, {
			isServer = true,
			bypassFlags = {
				skipPhysicsDataReset = p15.consumerConfig.skipPhysicsDataReset
			}
		})
	end
	local source = t_2[consumerConfig.source] or consumerConfig.validationEnv == validationEnumsModule.ValidationEnv.Backend
	fetchAllDesiredDataModule.storeDesiredData(p15, var14)
	
	if #var12 > 0 then
		p15.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchInProgress
		
		if source then
			runService:Run()
			fetchQualityResults(p15, var12)
			runService:Pause()
		else
			task.spawn(fetchQualityResults, p15, var12)
		end
	end
	while next(var13) ~= nil do
		local var15 = p15.aqsFetchMetrics.fetchStatus == assetQualityFetchStatus.assetQualityFetchInProgress
		local var16 = getNextLayer(var13, not var15)
		
		if #var16 == 0 and not var15 then
			error("Impossible to complete all layers")
		end
		for i, v in var16 do
			updateResultData(t, var13, validationTestWrapperModule(v, p15, t.states), p15.jobId, consumerConfig.enforceShadowValidations)
			
			if t_3[consumerConfig.source] and not source then
				task.wait()
			end
		end
		if var15 and not source then
			task.wait()
		end
	end
	populateRelevantSourceStrings(t)
	t.aqJobId = p15.aqsFetchMetrics.aqJobId or ""
	reportFullResult(t, p15, 1000 * (os.clock() - processTime))
	
	return t
end

local _ = function(p16)
	-- upvalues: constantsModule (ref)
	if #p16 == 0 then
		return nil
	end
	for i, v in p16 do
		if v.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
			return v
		end
	end
	return p16[1]
end

local _ = function(p17, p18, p19)
	for i, v in p17 do
		if v.Name == p18 then
			return v
		end
	end
	return if p19 then p17[1] else nil
end

local function synthesizeRootFromFolders(p20, p21, p22)
	local folder = Instance.new("Folder")
	
	for i, v in p20 do
		local var17
		local allSelectedInstances = v.allSelectedInstances
		
		for i_1, v_1 in allSelectedInstances do
			if v_1.Name == p21 then
				var17 = v_1
				if var17 ~= nil then
					if var17:IsA("Folder") or var17:IsA("Model") then
						for i_2, i_1 in var17:GetChildren() do
							i_1:Clone().Parent = folder
						end
					else
						var17:Clone().Parent = folder
					end
				end
			end
		end
		var17 = if p22 then allSelectedInstances[1] else nil
	end
	return folder
end

function t_1.ValidateAsset(value, p23, p24)
	-- upvalues: httpService (ref), constantsModule (ref), getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (ref), createConsumerConfigWithDefaults (ref), runValidationOnRootInstance (ref)
	local var18
	local t = {
		jobId = httpService:GenerateGUID(),
		entrypointInput = value
	}
	
	if #value == 0 then
		var18 = nil
	else
		for i, v in value do
			if v.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
				var18 = v
			end
		end
		var18 = value[1]
	end
	local var19
	t.rootInstance = var18
	
	if getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() then
		local r15Fixed = constantsModule.FOLDER_NAMES.R15Fixed
		
		for v, v in value do
			if v.Name == r15Fixed then
				var19 = v
			end
		end
		var19 = nil
	else
		var19 = nil
	end
	t.r15LegacyDuplicateRoot = var19
	t.uploadEnum = { assetType = p23 }
	t.consumerConfig = createConsumerConfigWithDefaults(p24)
	t.hsrAssets = {}
	
	return runValidationOnRootInstance(t)
end

function t_1.ValidateFinalizedBundle(p25, p26, p27)
	-- upvalues: getFFlagDebugAllowHRDUploadOnBundleBackendModule (ref), r15plusUtilsModule (ref), constantsModule (ref), getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (ref), synthesizeRootFromFolders (ref), httpService (ref), createConsumerConfigWithDefaults (ref), runValidationOnRootInstance (ref)
	if getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
		r15plusUtilsModule.setIsBackendBundleUpload(if p27.source ~= "Publish" then p27.source == "Backend" else true)
	end
	local var20
	local _ = nil
	local var21 = nil
	
	if p26 == Enum.BundleType.Animations then
		local model = Instance.new("Model")
		
		for i, v in p25 do
			local var22
			local allSelectedInstances = v.allSelectedInstances
			
			if #allSelectedInstances == 0 then
				var22 = nil
				if var22 ~= nil then
					var22:Clone().Parent = model
				end
			end
			for i_1, v_1 in allSelectedInstances do
				if v_1.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
					var22 = v_1
				end
			end
			var22 = allSelectedInstances[1]
		end
		var20 = model
	elseif getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() then
		var20 = synthesizeRootFromFolders(p25, constantsModule.FOLDER_NAMES.R15ArtistIntent, true)
		var21 = synthesizeRootFromFolders(p25, constantsModule.FOLDER_NAMES.R15Fixed, true)
	else
		local folder = Instance.new("Folder")
		
		for i, v in p25 do
			local var23
			local allSelectedInstances = v.allSelectedInstances
			
			if #allSelectedInstances == 0 then
				var23 = nil
				if var23 ~= nil then
					if var23:IsA("Folder") or var23:IsA("Model") then
						for i_2, i_1 in var23:GetChildren() do
							i_1:Clone().Parent = folder
						end
					else
						var23:Clone().Parent = folder
					end
				end
			end
			for i_1, v_1 in allSelectedInstances do
				if v_1.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
					var23 = v_1
				end
			end
			var23 = allSelectedInstances[1]
		end
		var20 = folder
	end
	local var24 = runValidationOnRootInstance({
		jobId = httpService:GenerateGUID(),
		entrypointInput = p25,
		rootInstance = var20,
		r15LegacyDuplicateRoot = var21,
		uploadEnum = { bundleType = p26 },
		consumerConfig = createConsumerConfigWithDefaults(p27),
		hsrAssets = {}
	})
	
	if getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
		r15plusUtilsModule.setIsBackendBundleUpload(false)
	end
	return var24
end

return t_1