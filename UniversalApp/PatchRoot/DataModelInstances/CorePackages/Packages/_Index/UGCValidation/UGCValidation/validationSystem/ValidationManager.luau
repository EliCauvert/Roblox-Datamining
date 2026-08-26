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
local getFFlagDebugAllowHRDUploadOnBundleBackendModule = require(parent.flags.getFFlagDebugAllowHRDUploadOnBundleBackend)
local getFFlagUGCValidationAnimationPackSupportModule = require(parent.flags.getFFlagUGCValidationAnimationPackSupport)
local getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule = require(parent.flags.getEngineFeatureEngineUGCValidateInstanceTreesEquivalent)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
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
	lastUpdated = { 25, 11, 18 }
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
	-- upvalues: getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validationModuleLoaderModule (ref), getFFlagDebugUGCDisableAssetQualityChecksModule (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var1 = if getFFlagUGCValidateMigrateSchemaPropertiesModule() then p2.skipModules else {}
	
	for i, v in validationModuleLoaderModule.allModules do
		if not var1[i] and (not getFFlagDebugUGCDisableAssetQualityChecksModule() or not p2.skipAssetQualityChecks or not v.isAssetQualityModule) and (table.find(v.categories, p1) and (v.fflag() or v.shadowFlag())) then
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
	-- upvalues: assetQualityService (ref), assetQualityFetchStatus (ref), recreateSceneFromEditablesModule (ref), getEngineFeatureEngineUGCValidateEmoteAnimationExportModule (ref), validationEnumsModule (ref), stripMeshFromGltfModule (ref), getFIntUGCValidationFetchQualityMaxRetryModule (ref), httpService (ref), getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref), fetchAllDesiredDataModule (ref)
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
				for i = 1, 1 + getFIntUGCValidationFetchQualityMaxRetryModule() do
					local ok, status = pcall(function()
						-- upvalues: p3 (ref), i (ref), assetQualityService (copy), p4 (ref), var5 (write), httpService (copy)
						p3.aqsFetchMetrics.fetchAttemptCount = i
						local var7 = if p3.consumerConfig.aqFetchStage == "jobId" then assetQualityService:FetchAssetQualitySummaryFromJobIdAsync(p3.consumerConfig.aqFetchData, p4) else assetQualityService:FetchAssetQualitySummaryFromGltfAsync(var5, p4)
						local var8 = 1000 * (os.clock() - os.clock())
						p3.aqsFetchMetrics.visualizationUrl = var7.visualizationUrl
						p3.aqsFetchMetrics.fetchTimeMs = var8
						p3.aqsFetchMetrics.aqJobId = var7.aqJobId
						p3.aqsSummaryData = httpService:JSONDecode(var7.rawJson)
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
		local var7 = p8:split(".")
		local var8 = errorSourceStringsModule.Values[var7[#var7]]
		
		if var8 then
			p7.relevantSourceStrings[p8] = var8
		end
	end
	
	for i, v in p7.failureMap do
		for i_2, v_1 in v do
			local failureStringKey = v_1.failureStringKey
			local var7 = failureStringKey:split(".")
			local var8 = errorSourceStringsModule.Values[var7[#var7]]
			
			if var8 then
				p7.relevantSourceStrings[failureStringKey] = var8
			end
		end
	end
	for i, v_1 in p7.warningMap do
		for i_2, v_2 in v_1 do
			local failureStringKey = v_2.failureStringKey
			local var9 = failureStringKey:split(".")
			local var10 = errorSourceStringsModule.Values[var9[#var9]]
			
			if var10 then
				p7.relevantSourceStrings[failureStringKey] = var10
			end
		end
	end
end

local function _(p8)
	local uploadEnum = p8.uploadEnum
	
	return if uploadEnum.assetType then uploadEnum.assetType.Name elseif uploadEnum.bundleType then uploadEnum.bundleType.Name else "?"
end

local function reportFullResult(p8, p9, p10)
	-- upvalues: assetQualityFetchStatus (ref), rbxAnalyticsService (ref), telemetryService (ref), t (ref), getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref)
	local var11 = p9.aqsFetchMetrics.fetchStatus ~= assetQualityFetchStatus.assetQualityFetchNA
	telemetryService:LogEvent(t, {
		customFields = {
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
			aqFetchAttemptCount = if var11 then p9.aqsFetchMetrics.fetchAttemptCount else 0,
			aqFetchTimeMs = if var11 then p9.aqsFetchMetrics.fetchTimeMs else 0,
			aqFetchFailureReason = if var11 then p9.aqsFetchMetrics.fetchFailureReason else "",
			aqJobId = p9.aqsFetchMetrics.aqJobId or ""
		}
	})
	
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
	-- upvalues: getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), t_4 (ref)
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
	
	if getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		cloned.consumerEnv = t_4[cloned.source]
		assert(cloned.consumerEnv ~= nil, `unknown consumer source: {tostring(cloned.source)}`)
		cloned.backendConfigs = cloned.backendConfigs or {}
		cloned.iecConfigs = cloned.iecConfigs or {}
	end
	cloned.aqFetchStage = cloned.aqFetchStage or "scene"
	cloned.aqFetchData = cloned.aqFetchData or ""
	assert(cloned.aqFetchStage == "scene" == (cloned.aqFetchData == ""), `aqFetchData must be non-empty iff aqFetchStage is "gltf" or "jobId" (got stage="{cloned.aqFetchStage}")`)
	
	return cloned
end

local function runValidationOnRootInstance(p15)
	-- upvalues: getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref), getUploadCategoryModule (ref), initRunVariables (ref), assetQualityFetchStatus (ref), validationTestWrapperModule (ref), validationEnumsModule (ref), updateResultData (ref), populateRelevantSourceStrings (ref), reportFullResult (ref), fetchAllDesiredDataModule (ref), t_2 (ref), runService (ref), fetchQualityResults (ref), getNextLayer (ref), t_3 (ref)
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
		states = {},
		failureMap = {},
		warningMap = {},
		relevantSourceStrings = {}
	}
	local var12 = getUploadCategoryModule(rootInstance, assetType, bundleType)
	local var13, var14, var15 = initRunVariables(var12, consumerConfig)
	p15.uploadCategory = var12
	p15.aqsFetchMetrics = {
		fetchStatus = assetQualityFetchStatus.assetQualityFetchNA,
		aqJobId = if consumerConfig.aqFetchStage == "jobId" then consumerConfig.aqFetchData else nil
	}
	updateResultData(t, var14, validationTestWrapperModule(validationEnumsModule.ValidationModule.ExpectedRootSchema, p15, t.states), p15.jobId, consumerConfig.enforceShadowValidations)
	
	if t.states[validationEnumsModule.ValidationModule.ExpectedRootSchema] ~= validationEnumsModule.Status.PASS then
		populateRelevantSourceStrings(t)
		t.aqJobId = p15.aqsFetchMetrics.aqJobId or ""
		reportFullResult(t, p15, -1)
		
		return t
	end
	fetchAllDesiredDataModule.storeDesiredData(p15, var15)
	
	if #var13 > 0 then
		p15.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchInProgress
		
		if t_2[consumerConfig.source] then
			runService:Run()
			fetchQualityResults(p15, var13)
			runService:Pause()
		else
			task.spawn(fetchQualityResults, p15, var13)
		end
	end
	while next(var14) ~= nil do
		local var16 = p15.aqsFetchMetrics.fetchStatus == assetQualityFetchStatus.assetQualityFetchInProgress
		local var17 = getNextLayer(var14, not var16)
		
		if #var17 == 0 and not var16 then
			error("Impossible to complete all layers")
		end
		for i, v in var17 do
			updateResultData(t, var14, validationTestWrapperModule(v, p15, t.states), p15.jobId, consumerConfig.enforceShadowValidations)
			
			if t_3[consumerConfig.source] then
				task.wait()
			end
		end
		if var16 and not t_2[consumerConfig.source] then
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
		local var18
		local allSelectedInstances = v.allSelectedInstances
		
		for i_1, v_1 in allSelectedInstances do
			if v_1.Name == p21 then
				var18 = v_1
				if var18 ~= nil then
					if var18:IsA("Folder") or var18:IsA("Model") then
						for i_2, i_1 in var18:GetChildren() do
							i_1:Clone().Parent = folder
						end
					else
						var18:Clone().Parent = folder
					end
				end
			end
		end
		var18 = if p22 then allSelectedInstances[1] else nil
	end
	return folder
end

function t_1.ValidateAsset(value, p23, p24)
	-- upvalues: httpService (ref), constantsModule (ref), getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (ref), createConsumerConfigWithDefaults (ref), runValidationOnRootInstance (ref)
	local var19
	local t = {
		jobId = httpService:GenerateGUID(),
		entrypointInput = value
	}
	
	if #value == 0 then
		var19 = nil
	else
		for i, v in value do
			if v.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
				var19 = v
			end
		end
		var19 = value[1]
	end
	local var20
	t.rootInstance = var19
	
	if getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() then
		local r15Fixed = constantsModule.FOLDER_NAMES.R15Fixed
		
		for v, v in value do
			if v.Name == r15Fixed then
				var20 = v
			end
		end
		var20 = nil
	else
		var20 = nil
	end
	t.r15LegacyDuplicateRoot = var20
	t.uploadEnum = { assetType = p23 }
	t.consumerConfig = createConsumerConfigWithDefaults(p24)
	t.hsrAssets = {}
	
	return runValidationOnRootInstance(t)
end

function t_1.ValidateFinalizedBundle(p25, p26, p27)
	-- upvalues: getFFlagDebugAllowHRDUploadOnBundleBackendModule (ref), r15plusUtilsModule (ref), getFFlagUGCValidationAnimationPackSupportModule (ref), constantsModule (ref), getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (ref), synthesizeRootFromFolders (ref), httpService (ref), createConsumerConfigWithDefaults (ref), runValidationOnRootInstance (ref)
	if getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
		r15plusUtilsModule.setIsBackendBundleUpload(if p27.source ~= "Publish" then p27.source == "Backend" else true)
	end
	local var21
	local _ = nil
	local var22 = nil
	
	if getFFlagUGCValidationAnimationPackSupportModule() and p26 == Enum.BundleType.Animations then
		local model = Instance.new("Model")
		
		for i, v in p25 do
			local var23
			local allSelectedInstances = v.allSelectedInstances
			
			if #allSelectedInstances == 0 then
				var23 = nil
				if var23 ~= nil then
					var23:Clone().Parent = model
				end
			end
			for i_2, v_2 in allSelectedInstances do
				if v_2.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
					var23 = v_2
				end
			end
			var23 = allSelectedInstances[1]
		end
		var21 = model
	elseif getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() then
		var21 = synthesizeRootFromFolders(p25, constantsModule.FOLDER_NAMES.R15ArtistIntent, true)
		var22 = synthesizeRootFromFolders(p25, constantsModule.FOLDER_NAMES.R15Fixed, true)
	else
		local folder = Instance.new("Folder")
		
		for i, v in p25 do
			local var24
			local allSelectedInstances = v.allSelectedInstances
			
			if #allSelectedInstances == 0 then
				var24 = nil
				if var24 ~= nil then
					if var24:IsA("Folder") or var24:IsA("Model") then
						for i_2, i_1 in var24:GetChildren() do
							i_1:Clone().Parent = folder
						end
					else
						var24:Clone().Parent = folder
					end
				end
			end
			for i_1, v_1 in allSelectedInstances do
				if v_1.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
					var24 = v_1
				end
			end
			var24 = allSelectedInstances[1]
		end
		var21 = folder
	end
	local var25 = runValidationOnRootInstance({
		jobId = httpService:GenerateGUID(),
		entrypointInput = p25,
		rootInstance = var21,
		r15LegacyDuplicateRoot = var22,
		uploadEnum = { bundleType = p26 },
		consumerConfig = createConsumerConfigWithDefaults(p27),
		hsrAssets = {}
	})
	
	if getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
		r15plusUtilsModule.setIsBackendBundleUpload(false)
	end
	return var25
end

return t_1