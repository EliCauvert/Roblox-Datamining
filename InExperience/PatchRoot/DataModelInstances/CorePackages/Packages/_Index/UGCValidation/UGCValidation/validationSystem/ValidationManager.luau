local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local validationModuleLoaderModule = require(parent.validationSystem.ValidationModuleLoader)
local constantsModule = require(parent.Constants)
local validationTestWrapperModule = require(parent.validationSystem.ValidationTestWrapper)
local fetchAllDesiredDataModule = require(parent.validationSystem.dataFetchModules.FetchAllDesiredData)
local getUploadCategoryModule = require(parent.util.getUploadCategory)
local recreateSceneFromEditablesModule = require(parent.util.RecreateSceneFromEditables)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getEngineFeatureEngineAQSJsonParsingInLuaModule = require(parent.flags.getEngineFeatureEngineAQSJsonParsingInLua)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local getFFlagDebugAllowHRDUploadOnBundleBackendModule = require(parent.flags.getFFlagDebugAllowHRDUploadOnBundleBackend)
local getFFlagUGCValidationAnimationPackSupportModule = require(parent.flags.getFFlagUGCValidationAnimationPackSupport)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
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
local getEngineFeatureEngineAssetQualityEngineServiceModule = require(parent.flags.getEngineFeatureEngineAssetQualityEngineService)
local getFIntUGCValidationFetchQualityMaxRetryModule = require(parent.flags.getFIntUGCValidationFetchQualityMaxRetry)
local getEngineFeatureEngineUGCValidationExpandReturnSchemaModule = require(parent.flags.getEngineFeatureEngineUGCValidationExpandReturnSchema)
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

local function initRunVariables(p0, p1) --[[ line: 81 ]]
	-- upvalues: getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validationModuleLoaderModule (ref), getEngineFeatureEngineUGCValidationExpandReturnSchemaModule (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var39 = if getFFlagUGCValidateMigrateSchemaPropertiesModule() then p1.skipModules else {}
	
	for i, v in validationModuleLoaderModule.allModules do
		if not var39[i] and table.find(v.categories, p0) and (v.fflag() or v.shadowFlag()) then
			local var40 = v.shadowFlag() and not v.fflag()
			
			for i_1, v_2 in v.requiredData do
				t_2[v_2] = true
			end
			for i_1, v_2 in v.conditionalData do
				t_2[v_2] = true
			end
			local var41 = if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then v.isAssetQualityModule else next(v.expectedAqsData) ~= nil
			
			if var41 then
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
				isQuality = var41,
				isShadow = var40
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

local function fetchQualityResults(p2, p3) --[[ line: 155 ]]
	-- upvalues: getEngineFeatureEngineAssetQualityEngineServiceModule (ref), assetQualityService (ref), assetQualityFetchStatus (ref), getEngineFeatureEngineUGCValidationExpandReturnSchemaModule (ref), recreateSceneFromEditablesModule (ref), getFIntUGCValidationFetchQualityMaxRetryModule (ref), getEngineFeatureEngineAQSJsonParsingInLuaModule (ref), httpService (ref), getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref), fetchAllDesiredDataModule (ref)
	if not getEngineFeatureEngineAssetQualityEngineServiceModule() or not assetQualityService then
		p2.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchFailure
		p2.aqsFetchMetrics.fetchFailureReason = "Not enabled"
		
		return
	end
	local var45
	local _ = nil
	local var43 = nil
	local aqFetchData = nil
	local var44 = nil
	
	if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() and p2.consumerConfig.aqFetchStage ~= "scene" then
		if p2.consumerConfig.aqFetchStage == "gltf" then
			aqFetchData = p2.consumerConfig.aqFetchData
		end
		var45 = true
	else
		var44 = recreateSceneFromEditablesModule.createModelForGltfExport(p2)
		local ok, status = pcall(function() --[[ line: 173 ]]
			-- upvalues: aqFetchData (write), assetQualityService (copy), var44 (write)
			aqFetchData = assetQualityService:GenerateAssetQualityGltfFromInstanceAsync(var44)
		end)
		var45 = ok
		var43 = status
	end
	if var45 then
		for i = 1, 1 + getFIntUGCValidationFetchQualityMaxRetryModule() do
			local ok, status = pcall(function() --[[ line: 181 ]]
				-- upvalues: p2 (ref), i (ref), getEngineFeatureEngineUGCValidationExpandReturnSchemaModule (copy), assetQualityService (copy), p3 (ref), aqFetchData (write), getEngineFeatureEngineAQSJsonParsingInLuaModule (copy), httpService (copy)
				p2.aqsFetchMetrics.fetchAttemptCount = i
				local processTime = os.clock()
				local _ = nil
				local var47 = if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() and p2.consumerConfig.aqFetchStage == "jobId" then assetQualityService:FetchAssetQualitySummaryFromJobIdAsync(p2.consumerConfig.aqFetchData, p3) else assetQualityService:FetchAssetQualitySummaryFromGltfAsync(aqFetchData, p3)
				local var48 = 1000 * (os.clock() - processTime)
				p2.aqsFetchMetrics.visualizationUrl = var47.visualizationUrl
				p2.aqsFetchMetrics.fetchTimeMs = var48
				
				if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
					p2.aqsFetchMetrics.aqJobId = var47.aqJobId
				end
				if getEngineFeatureEngineAQSJsonParsingInLuaModule() then
					p2.aqsSummaryData = httpService:JSONDecode(var47.rawJson)
					
					return
				end
				p2.aqsFetchMetrics.returnVersion = var47.version
				p2.aqsSummaryData = var47
			end)
			var45 = ok
			var43 = status
			
			if var45 then break end
		end
	end
	if var45 then
		p2.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchSuccess
		
		if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
			print(string.format("AQS fetch success: aqJobId=%s attempts=%d fetchTimeMs=%d", p2.aqsFetchMetrics.aqJobId or "", p2.aqsFetchMetrics.fetchAttemptCount or 0, p2.aqsFetchMetrics.fetchTimeMs or 0))
			print(p2.aqsSummaryData)
		end
	else
		p2.aqsFetchMetrics.fetchFailureReason = var43
		p2.aqsSummaryData = fetchAllDesiredDataModule.DATA_FETCH_FAILURE
		p2.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchFailure
		
		if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
			print("AQS fetch failure:", var43)
		end
	end
	if var44 then
		var44:Destroy()
	end
end

local function getNextLayer(p4, p5) --[[ line: 243 ]]
	local t = {}
	
	for i, v in p4 do
		if next(v.prereqs) == nil and (p5 or not v.isQuality) then
			table.insert(t, i)
		end
	end
	return t
end

local function populateRelevantSourceStrings(p6) --[[ line: 258 ]]
	-- upvalues: errorSourceStringsModule (ref)
	local function _(p7) --[[ line: 259 | named "capture" ]]
		-- upvalues: errorSourceStringsModule (copy), p6 (ref)
		local var54 = p7:split(".")
		local var55 = errorSourceStringsModule.Values[var54[#var54]]
		
		if var55 then
			p6.relevantSourceStrings[p7] = var55
		end
	end
	
	for i, v in p6.failureMap do
		for i_2, v_1 in v do
			local failureStringKey = v_1.failureStringKey
			local var52 = failureStringKey:split(".")
			local var53 = errorSourceStringsModule.Values[var52[#var52]]
			
			if var53 then
				p6.relevantSourceStrings[failureStringKey] = var53
			end
		end
	end
	for i, v_1 in p6.warningMap do
		for i_2, v_2 in v_1 do
			local failureStringKey = v_2.failureStringKey
			local var50 = failureStringKey:split(".")
			local var51 = errorSourceStringsModule.Values[var50[#var50]]
			
			if var51 then
				p6.relevantSourceStrings[failureStringKey] = var51
			end
		end
	end
end

local function _(p8) --[[ line: 280 | named "getDebugLabel" ]]
	local uploadEnum = p8.uploadEnum
	
	return if uploadEnum.assetType then uploadEnum.assetType.Name elseif uploadEnum.bundleType then uploadEnum.bundleType.Name else "?"
end

local function reportFullResult(p9, p10, p11) --[[ line: 290 ]]
	-- upvalues: assetQualityFetchStatus (ref), rbxAnalyticsService (ref), getEngineFeatureEngineUGCValidationExpandReturnSchemaModule (ref), telemetryService (ref), t (ref), getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref)
	local var56 = p10.aqsFetchMetrics.fetchStatus ~= assetQualityFetchStatus.assetQualityFetchNA
	telemetryService:LogEvent(t, {
		customFields = {
			validationJobId = p10.jobId,
			bundleJobId = p10.consumerConfig.telemetryBundleId,
			rootInstanceId = p10.consumerConfig.telemetryRootId,
			studioSid = rbxAnalyticsService:GetSessionId(),
			clientId = rbxAnalyticsService:GetClientId(),
			placeId = game.PlaceId,
			validationSource = p10.consumerConfig.source,
			assetType = if p10.uploadEnum.assetType then p10.uploadEnum.assetType.Value else 0,
			bundleType = if p10.uploadEnum.bundleType then p10.uploadEnum.bundleType.Value else 0,
			numFailures = p9.numFailures,
			passed = p9.pass,
			durationMs = p11,
			uploadCategory = p10.uploadCategory,
			aqFetchStatus = p10.aqsFetchMetrics.fetchStatus,
			aqFetchAttemptCount = if var56 then p10.aqsFetchMetrics.fetchAttemptCount else 0,
			aqFetchTimeMs = if var56 then p10.aqsFetchMetrics.fetchTimeMs else 0,
			aqFetchFailureReason = if var56 then p10.aqsFetchMetrics.fetchFailureReason else "",
			aqJobId = if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then p10.aqsFetchMetrics.aqJobId or "" else nil
		}
	})
	
	if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
		if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
			local uploadEnum = p10.uploadEnum
			print(string.format("==== %s Validation end ==== pass=%s numFailures=%d numWarnings=%d durationMs=%d", if uploadEnum.assetType then uploadEnum.assetType.Name elseif uploadEnum.bundleType then uploadEnum.bundleType.Name else "?", tostring(p9.pass), p9.numFailures, p9.numWarnings, p11))
			
			for i, v in p9.failureMap do
				for i_1, v_1 in v do
					print(string.format("  FAIL %s: %s @ %s", i, v_1.failureStringKey, if v_1.instancePath ~= "" then "<root>" else v_1.instancePath))
				end
			end
		end
		print(p9)
	end
end

local function updateResultData_deprecated(p12, p13, p14, p15, p16) --[[ line: 346 ]]
	-- upvalues: validationEnumsModule (ref), errorSourceStringsModule (ref)
	local validationEnum = p14.validationEnum
	
	if p16 or not p13[validationEnum].isShadow then
		p12.states[validationEnum] = p14.status
		
		if #p14.errorTranslationContexts > 0 then
			table.move(p14.errorTranslationContexts, 1, #p14.errorTranslationContexts, #p12.errorTranslationContexts + 1, p12.errorTranslationContexts)
		end
		if p14.status ~= validationEnumsModule.Status.PASS then
			p12.pass = false
			p12.numFailures += 1
			
			if p14.status == validationEnumsModule.Status.ERROR and not p12.ranIntoInternalError then
				p12.ranIntoInternalError = true
				table.insert(p12.errorTranslationContexts, {
					key = errorSourceStringsModule.Keys.InternalError,
					params = { ValidationJobId = p15 }
				})
			end
		end
	end
	for i, v in p13[validationEnum].postreqs do
		p13[v].prereqs[validationEnum] = nil
	end
	p13[validationEnum] = nil
end

local function updateResultData(p17, p18, p19, _, p20) --[[ line: 389 ]]
	-- upvalues: validationEnumsModule (ref)
	local validationEnum = p19.validationEnum
	
	if p20 or not p18[validationEnum].isShadow then
		p17.states[validationEnum] = p19.status
		
		if p19.status ~= validationEnumsModule.Status.PASS then
			p17.pass = false
			p17.numFailures += math.max(1, #p19.failures)
		end
		if #p19.failures > 0 then
			p17.failureMap[validationEnum] = p19.failures
		end
		if #p19.warnings > 0 then
			p17.warningMap[validationEnum] = p19.warnings
			p17.numWarnings += #p19.warnings
		end
		if p19.status == validationEnumsModule.Status.ERROR then
			p17.ranIntoInternalError = true
		end
	end
	for i, v in p18[validationEnum].postreqs do
		p18[v].prereqs[validationEnum] = nil
	end
	p18[validationEnum] = nil
end

local function createConsumerConfigWithDefaults(p21) --[[ line: 427 ]]
	-- upvalues: getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), t_4 (ref)
	local cloned = table.clone(p21)
	
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

local function runValidationOnRootInstance(p22) --[[ line: 465 ]]
	-- upvalues: getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref), getEngineFeatureEngineUGCValidationExpandReturnSchemaModule (ref), getUploadCategoryModule (ref), initRunVariables (ref), assetQualityFetchStatus (ref), validationTestWrapperModule (ref), validationEnumsModule (ref), updateResultData (ref), updateResultData_deprecated (ref), populateRelevantSourceStrings (ref), reportFullResult (ref), fetchAllDesiredDataModule (ref), t_2 (ref), runService (ref), fetchQualityResults (ref), getNextLayer (ref), t_3 (ref)
	local processTime = os.clock()
	local rootInstance = p22.rootInstance
	local assetType = p22.uploadEnum.assetType
	local bundleType = p22.uploadEnum.bundleType
	local consumerConfig = p22.consumerConfig
	
	if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
		local uploadEnum = p22.uploadEnum
		print(string.format("==== %s Validation begin ==== jobId=%s source=%s", if uploadEnum.assetType then uploadEnum.assetType.Name elseif uploadEnum.bundleType then uploadEnum.bundleType.Name else "?", p22.jobId, p22.consumerConfig.source))
	end
	local t = {
		pass = true,
		numFailures = 0,
		numWarnings = 0,
		ranIntoInternalError = false,
		aqJobId = "",
		validationJobId = p22.jobId,
		states = {},
		failureMap = {},
		warningMap = {},
		relevantSourceStrings = {}
	}
	
	if not getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		t.errorTranslationContexts = {}
	end
	local var60 = getUploadCategoryModule(rootInstance, assetType, bundleType)
	local var61, var62, var63 = initRunVariables(var60, consumerConfig)
	p22.uploadCategory = var60
	p22.aqsFetchMetrics = {
		fetchStatus = assetQualityFetchStatus.assetQualityFetchNA,
		aqJobId = if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() and consumerConfig.aqFetchStage == "jobId" then consumerConfig.aqFetchData else nil
	}
	local var64 = validationTestWrapperModule(validationEnumsModule.ValidationModule.ExpectedRootSchema, p22, t.states)
	
	if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		updateResultData(t, var62, var64, p22.jobId, consumerConfig.enforceShadowValidations)
	else
		updateResultData_deprecated(t, var62, var64, p22.jobId, consumerConfig.enforceShadowValidations)
	end
	if t.states[validationEnumsModule.ValidationModule.ExpectedRootSchema] == validationEnumsModule.Status.PASS then
		fetchAllDesiredDataModule.storeDesiredData(p22, var63)
		
		if #var61 > 0 then
			p22.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchInProgress
			
			if t_2[consumerConfig.source] then
				runService:Run()
				fetchQualityResults(p22, var61)
				runService:Pause()
			else
				task.spawn(fetchQualityResults, p22, var61)
			end
		end
		while next(var62) ~= nil do
			local var65 = p22.aqsFetchMetrics.fetchStatus == assetQualityFetchStatus.assetQualityFetchInProgress
			local var66 = getNextLayer(var62, not var65)
			
			if #var66 == 0 and not var65 then
				error("Impossible to complete all layers")
			end
			for i, v in var66 do
				local var67 = validationTestWrapperModule(v, p22, t.states)
				
				if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
					updateResultData(t, var62, var67, p22.jobId, consumerConfig.enforceShadowValidations)
				else
					updateResultData_deprecated(t, var62, var67, p22.jobId, consumerConfig.enforceShadowValidations)
				end
				if t_3[consumerConfig.source] then
					task.wait()
				end
			end
			if var65 and not t_2[consumerConfig.source] then
				task.wait()
			end
		end
		if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
			populateRelevantSourceStrings(t)
			t.aqJobId = p22.aqsFetchMetrics.aqJobId or ""
		end
		reportFullResult(t, p22, 1000 * (os.clock() - processTime))
		
		return t
	elseif getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		populateRelevantSourceStrings(t)
		t.aqJobId = p22.aqsFetchMetrics.aqJobId or ""
	end
	reportFullResult(t, p22, -1)
	
	return t
end

local _ = function(p23) --[[ line: 600 | named "getRootInstance" ]]
	-- upvalues: constantsModule (ref)
	if #p23 == 0 then
		return nil
	end
	for i, v in p23 do
		if v.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
			return v
		end
	end
	return p23[1]
end

function t_1.ValidateAsset(value, p24, p25) --[[ line: 617 ]]
	-- upvalues: httpService (ref), constantsModule (ref), createConsumerConfigWithDefaults (ref), runValidationOnRootInstance (ref)
	local var69
	local t = {
		jobId = httpService:GenerateGUID(),
		entrypointInput = value
	}
	
	if #value == 0 then
		var69 = nil
	else
		for i, v in value do
			if v.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
				var69 = v
			end
		end
		var69 = value[1]
	end
	t.rootInstance = var69
	t.uploadEnum = { assetType = p24 }
	t.consumerConfig = createConsumerConfigWithDefaults(p25)
	t.hsrAssets = {}
	
	return runValidationOnRootInstance(t)
end

function t_1.ValidateFinalizedBundle(p26, p27, p28) --[[ line: 636 ]]
	-- upvalues: getFFlagDebugAllowHRDUploadOnBundleBackendModule (ref), r15plusUtilsModule (ref), getFFlagUGCValidationAnimationPackSupportModule (ref), constantsModule (ref), httpService (ref), createConsumerConfigWithDefaults (ref), runValidationOnRootInstance (ref)
	if getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
		r15plusUtilsModule.setIsBackendBundleUpload(if p28.source ~= "Publish" then p28.source == "Backend" else true)
	end
	local var71
	local _ = nil
	
	if getFFlagUGCValidationAnimationPackSupportModule() and p27 == Enum.BundleType.Animations then
		local model = Instance.new("Model")
		
		for i, v in p26 do
			local var74
			local allSelectedInstances = v.allSelectedInstances
			
			if #allSelectedInstances == 0 then
				var74 = nil
				if var74 ~= nil then
					var74:Clone().Parent = model
				end
			end
			for i_2, v_2 in allSelectedInstances do
				if v_2.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
					var74 = v_2
				end
			end
			var74 = allSelectedInstances[1]
		end
		var71 = model
	else
		local folder = Instance.new("Folder")
		
		for i, v in p26 do
			local var72
			local allSelectedInstances = v.allSelectedInstances
			
			if #allSelectedInstances == 0 then
				var72 = nil
				if var72 ~= nil then
					if var72:IsA("Folder") or var72:IsA("Model") then
						for i_2, i_1 in var72:GetChildren() do
							i_1:Clone().Parent = folder
						end
					else
						var72:Clone().Parent = folder
					end
				end
			end
			for i_1, v_1 in allSelectedInstances do
				if v_1.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
					var72 = v_1
				end
			end
			var72 = allSelectedInstances[1]
		end
		var71 = folder
	end
	local var75 = runValidationOnRootInstance({
		jobId = httpService:GenerateGUID(),
		entrypointInput = p26,
		rootInstance = var71,
		uploadEnum = { bundleType = p27 },
		consumerConfig = createConsumerConfigWithDefaults(p28),
		hsrAssets = {}
	})
	
	if getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
		r15plusUtilsModule.setIsBackendBundleUpload(false)
	end
	return var75
end

return t_1