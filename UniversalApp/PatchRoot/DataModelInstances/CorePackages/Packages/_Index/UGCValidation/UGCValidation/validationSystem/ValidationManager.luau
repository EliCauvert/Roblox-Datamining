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

local function fetchQualityResults(p1, p2)
	-- upvalues: assetQualityService (ref), assetQualityFetchStatus (ref), recreateSceneFromEditablesModule (ref), getEngineFeatureEngineUGCValidateEmoteAnimationExportModule (ref), validationEnumsModule (ref), stripMeshFromGltfModule (ref), getFIntUGCValidationFetchQualityMaxRetryModule (ref), httpService (ref), getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref), fetchAllDesiredDataModule (ref)
	if not assetQualityService then
		p1.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchFailure
		p1.aqsFetchMetrics.fetchFailureReason = "Not enabled"
		
		return
	end
	local var1
	local _ = nil
	local var2 = nil
	local var3 = nil
	local var4 = nil
	
	if p1.consumerConfig.aqFetchStage == "scene" then
		local ok, status = pcall(function()
			-- upvalues: var4 (write), recreateSceneFromEditablesModule (copy), p1 (ref), var3 (write), assetQualityService (copy)
			var4 = recreateSceneFromEditablesModule.createModelForGltfExport(p1)
			var3 = assetQualityService:GenerateAssetQualityGltfFromInstanceAsync(var4)
		end)
		var1 = ok
		var2 = status
		
		if getEngineFeatureEngineUGCValidateEmoteAnimationExportModule() then
			if var1 then
				for i = 1, 1 + getFIntUGCValidationFetchQualityMaxRetryModule() do
					local ok, status = pcall(function()
						-- upvalues: p1 (ref), i (ref), assetQualityService (copy), p2 (ref), var3 (write), httpService (copy)
						p1.aqsFetchMetrics.fetchAttemptCount = i
						local var1 = if p1.consumerConfig.aqFetchStage == "jobId" then assetQualityService:FetchAssetQualitySummaryFromJobIdAsync(p1.consumerConfig.aqFetchData, p2) else assetQualityService:FetchAssetQualitySummaryFromGltfAsync(var3, p2)
						local var2 = 1000 * (os.clock() - os.clock())
						p1.aqsFetchMetrics.visualizationUrl = var1.visualizationUrl
						p1.aqsFetchMetrics.fetchTimeMs = var2
						p1.aqsFetchMetrics.aqJobId = var1.aqJobId
						p1.aqsSummaryData = httpService:JSONDecode(var1.rawJson)
					end)
					var1 = ok
					var2 = status
					
					if var1 then break end
				end
			end
			if var1 then
				p1.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchSuccess
				
				if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
					print(string.format("AQS fetch success: aqJobId=%s attempts=%d fetchTimeMs=%d", p1.aqsFetchMetrics.aqJobId or "", p1.aqsFetchMetrics.fetchAttemptCount or 0, p1.aqsFetchMetrics.fetchTimeMs or 0))
					print(p1.aqsSummaryData)
				end
			else
				p1.aqsFetchMetrics.fetchFailureReason = var2
				p1.aqsSummaryData = fetchAllDesiredDataModule.DATA_FETCH_FAILURE
				p1.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchFailure
				
				if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
					print("AQS fetch failure:", var2)
				end
			end
			return
		end
	elseif p1.consumerConfig.aqFetchStage == "gltf" then
		var3 = p1.consumerConfig.aqFetchData
	end
	var1 = true
end

local function getNextLayer(p1, p2)
	local t = {}
	
	for i, v in p1 do
		if next(v.prereqs) == nil and (p2 or not v.isQuality) then
			table.insert(t, i)
		end
	end
	return t
end

local function populateRelevantSourceStrings(p1)
	-- upvalues: errorSourceStringsModule (ref)
	local function _(p1)
		-- upvalues: errorSourceStringsModule (copy), p1 (ref)
		local var1 = p1:split(".")
		local var2 = errorSourceStringsModule.Values[var1[#var1]]
		
		if var2 then
			p1.relevantSourceStrings[p1] = var2
		end
	end
	
	for i, v in p1.failureMap do
		for i_2, v_1 in v do
			local failureStringKey = v_1.failureStringKey
			local var1 = failureStringKey:split(".")
			local var2 = errorSourceStringsModule.Values[var1[#var1]]
			
			if var2 then
				p1.relevantSourceStrings[failureStringKey] = var2
			end
		end
	end
	for i, v_1 in p1.warningMap do
		for i_2, v_2 in v_1 do
			local failureStringKey = v_2.failureStringKey
			local var3 = failureStringKey:split(".")
			local var4 = errorSourceStringsModule.Values[var3[#var3]]
			
			if var4 then
				p1.relevantSourceStrings[failureStringKey] = var4
			end
		end
	end
end

local function _(p1)
	local uploadEnum = p1.uploadEnum
	
	return if uploadEnum.assetType then uploadEnum.assetType.Name elseif uploadEnum.bundleType then uploadEnum.bundleType.Name else "?"
end

local function reportFullResult(p1, p2, p3)
	-- upvalues: assetQualityFetchStatus (ref), rbxAnalyticsService (ref), telemetryService (ref), t (ref), getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref)
	local var1 = p2.aqsFetchMetrics.fetchStatus ~= assetQualityFetchStatus.assetQualityFetchNA
	telemetryService:LogEvent(t, {
		customFields = {
			validationJobId = p2.jobId,
			bundleJobId = p2.consumerConfig.telemetryBundleId,
			rootInstanceId = p2.consumerConfig.telemetryRootId,
			studioSid = rbxAnalyticsService:GetSessionId(),
			clientId = rbxAnalyticsService:GetClientId(),
			placeId = game.PlaceId,
			validationSource = p2.consumerConfig.source,
			assetType = if p2.uploadEnum.assetType then p2.uploadEnum.assetType.Value else 0,
			bundleType = if p2.uploadEnum.bundleType then p2.uploadEnum.bundleType.Value else 0,
			numFailures = p1.numFailures,
			passed = p1.pass,
			durationMs = p3,
			uploadCategory = p2.uploadCategory,
			aqFetchStatus = p2.aqsFetchMetrics.fetchStatus,
			aqFetchAttemptCount = if var1 then p2.aqsFetchMetrics.fetchAttemptCount else 0,
			aqFetchTimeMs = if var1 then p2.aqsFetchMetrics.fetchTimeMs else 0,
			aqFetchFailureReason = if var1 then p2.aqsFetchMetrics.fetchFailureReason else "",
			aqJobId = p2.aqsFetchMetrics.aqJobId or ""
		}
	})
	
	if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
		local uploadEnum = p2.uploadEnum
		print(string.format("==== %s Validation end ==== pass=%s numFailures=%d numWarnings=%d durationMs=%d", if uploadEnum.assetType then uploadEnum.assetType.Name elseif uploadEnum.bundleType then uploadEnum.bundleType.Name else "?", tostring(p1.pass), p1.numFailures, p1.numWarnings, p3))
		
		for i, v in p1.failureMap do
			for i_1, v_1 in v do
				print(string.format("  FAIL %s: %s @ %s", i, v_1.failureStringKey, if v_1.instancePath ~= "" then "<root>" else v_1.instancePath))
			end
		end
		print(p1)
	end
end

local function updateResultData(p1, p2, p3, _, p4)
	-- upvalues: validationEnumsModule (ref)
	local validationEnum = p3.validationEnum
	
	if p4 or not p2[validationEnum].isShadow then
		p1.states[validationEnum] = p3.status
		
		if p3.status ~= validationEnumsModule.Status.PASS then
			p1.pass = false
			p1.numFailures += math.max(1, #p3.failures)
		end
		if #p3.failures > 0 then
			p1.failureMap[validationEnum] = p3.failures
		end
		if #p3.warnings > 0 then
			p1.warningMap[validationEnum] = p3.warnings
			p1.numWarnings += #p3.warnings
		end
		if p3.status == validationEnumsModule.Status.ERROR then
			p1.ranIntoInternalError = true
		end
	end
	for i, v in p2[validationEnum].postreqs do
		p2[v].prereqs[validationEnum] = nil
	end
	p2[validationEnum] = nil
end

local function createConsumerConfigWithDefaults(p1)
	-- upvalues: getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), t_4 (ref)
	local cloned = table.clone(p1)
	
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

local function runValidationOnRootInstance(p1)
	-- upvalues: getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref), getUploadCategoryModule (ref), initRunVariables (ref), assetQualityFetchStatus (ref), validationTestWrapperModule (ref), validationEnumsModule (ref), updateResultData (ref), populateRelevantSourceStrings (ref), reportFullResult (ref), fetchAllDesiredDataModule (ref), t_2 (ref), runService (ref), fetchQualityResults (ref), getNextLayer (ref), t_3 (ref)
	local processTime = os.clock()
	local rootInstance = p1.rootInstance
	local assetType = p1.uploadEnum.assetType
	local bundleType = p1.uploadEnum.bundleType
	local consumerConfig = p1.consumerConfig
	
	if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
		local uploadEnum = p1.uploadEnum
		print(string.format("==== %s Validation begin ==== jobId=%s source=%s", if uploadEnum.assetType then uploadEnum.assetType.Name elseif uploadEnum.bundleType then uploadEnum.bundleType.Name else "?", p1.jobId, p1.consumerConfig.source))
	end
	local t = {
		pass = true,
		numFailures = 0,
		numWarnings = 0,
		ranIntoInternalError = false,
		aqJobId = "",
		validationJobId = p1.jobId,
		states = {},
		failureMap = {},
		warningMap = {},
		relevantSourceStrings = {}
	}
	local var1 = getUploadCategoryModule(rootInstance, assetType, bundleType)
	local var2, var3, var4 = initRunVariables(var1, consumerConfig)
	p1.uploadCategory = var1
	p1.aqsFetchMetrics = {
		fetchStatus = assetQualityFetchStatus.assetQualityFetchNA,
		aqJobId = if consumerConfig.aqFetchStage == "jobId" then consumerConfig.aqFetchData else nil
	}
	updateResultData(t, var3, validationTestWrapperModule(validationEnumsModule.ValidationModule.ExpectedRootSchema, p1, t.states), p1.jobId, consumerConfig.enforceShadowValidations)
	
	if t.states[validationEnumsModule.ValidationModule.ExpectedRootSchema] ~= validationEnumsModule.Status.PASS then
		populateRelevantSourceStrings(t)
		t.aqJobId = p1.aqsFetchMetrics.aqJobId or ""
		reportFullResult(t, p1, -1)
		
		return t
	end
	fetchAllDesiredDataModule.storeDesiredData(p1, var4)
	
	if #var2 > 0 then
		p1.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchInProgress
		
		if t_2[consumerConfig.source] then
			runService:Run()
			fetchQualityResults(p1, var2)
			runService:Pause()
		else
			task.spawn(fetchQualityResults, p1, var2)
		end
	end
	while next(var3) ~= nil do
		local var5 = p1.aqsFetchMetrics.fetchStatus == assetQualityFetchStatus.assetQualityFetchInProgress
		local var6 = getNextLayer(var3, not var5)
		
		if #var6 == 0 and not var5 then
			error("Impossible to complete all layers")
		end
		for i, v in var6 do
			updateResultData(t, var3, validationTestWrapperModule(v, p1, t.states), p1.jobId, consumerConfig.enforceShadowValidations)
			
			if t_3[consumerConfig.source] then
				task.wait()
			end
		end
		if var5 and not t_2[consumerConfig.source] then
			task.wait()
		end
	end
	populateRelevantSourceStrings(t)
	t.aqJobId = p1.aqsFetchMetrics.aqJobId or ""
	reportFullResult(t, p1, 1000 * (os.clock() - processTime))
	
	return t
end

local _ = function(p1)
	-- upvalues: constantsModule (ref)
	if #p1 == 0 then
		return nil
	end
	for i, v in p1 do
		if v.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
			return v
		end
	end
	return p1[1]
end

function t_1.ValidateAsset(value, p1, p2)
	-- upvalues: httpService (ref), constantsModule (ref), createConsumerConfigWithDefaults (ref), runValidationOnRootInstance (ref)
	local var1
	local t = {
		jobId = httpService:GenerateGUID(),
		entrypointInput = value
	}
	
	if #value == 0 then
		var1 = nil
	else
		for i, v in value do
			if v.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
				var1 = v
			end
		end
		var1 = value[1]
	end
	t.rootInstance = var1
	t.uploadEnum = { assetType = p1 }
	t.consumerConfig = createConsumerConfigWithDefaults(p2)
	t.hsrAssets = {}
	
	return runValidationOnRootInstance(t)
end

function t_1.ValidateFinalizedBundle(p1, p2, p3)
	-- upvalues: getFFlagDebugAllowHRDUploadOnBundleBackendModule (ref), r15plusUtilsModule (ref), getFFlagUGCValidationAnimationPackSupportModule (ref), constantsModule (ref), httpService (ref), createConsumerConfigWithDefaults (ref), runValidationOnRootInstance (ref)
	if getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
		r15plusUtilsModule.setIsBackendBundleUpload(if p3.source ~= "Publish" then p3.source == "Backend" else true)
	end
	local var1
	local _ = nil
	
	if getFFlagUGCValidationAnimationPackSupportModule() and p2 == Enum.BundleType.Animations then
		local model = Instance.new("Model")
		
		for i, v in p1 do
			local var2
			local allSelectedInstances = v.allSelectedInstances
			
			if #allSelectedInstances == 0 then
				var2 = nil
				if var2 ~= nil then
					var2:Clone().Parent = model
				end
			end
			for i_2, v_2 in allSelectedInstances do
				if v_2.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
					var2 = v_2
				end
			end
			var2 = allSelectedInstances[1]
		end
		var1 = model
	else
		local folder = Instance.new("Folder")
		
		for i, v in p1 do
			local var3
			local allSelectedInstances = v.allSelectedInstances
			
			if #allSelectedInstances == 0 then
				var3 = nil
				if var3 ~= nil then
					if var3:IsA("Folder") or var3:IsA("Model") then
						for i_2, i_1 in var3:GetChildren() do
							i_1:Clone().Parent = folder
						end
					else
						var3:Clone().Parent = folder
					end
				end
			end
			for i_1, v_1 in allSelectedInstances do
				if v_1.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
					var3 = v_1
				end
			end
			var3 = allSelectedInstances[1]
		end
		var1 = folder
	end
	local var4 = runValidationOnRootInstance({
		jobId = httpService:GenerateGUID(),
		entrypointInput = p1,
		rootInstance = var1,
		uploadEnum = { bundleType = p2 },
		consumerConfig = createConsumerConfigWithDefaults(p3),
		hsrAssets = {}
	})
	
	if getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
		r15plusUtilsModule.setIsBackendBundleUpload(false)
	end
	return var4
end

return t_1