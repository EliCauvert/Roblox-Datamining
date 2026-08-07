-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:49 2026 Pacific Standard Time.

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
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local getFFlagDebugAllowHRDUploadOnBundleBackendModule = require(parent.flags.getFFlagDebugAllowHRDUploadOnBundleBackend)
local getFFlagUGCValidationAnimationPackSupportModule = require(parent.flags.getFFlagUGCValidationAnimationPackSupport)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getFFlagDebugUGCDisableAssetQualityChecksModule = require(parent.flags.getFFlagDebugUGCDisableAssetQualityChecks)
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

local function initRunVariables(p0, p1) --[[ line: 77 ]]
	-- upvalues: getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validationModuleLoaderModule (ref), getFFlagDebugUGCDisableAssetQualityChecksModule (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var36 = if getFFlagUGCValidateMigrateSchemaPropertiesModule() then p1.skipModules else {}
	
	for i, v in validationModuleLoaderModule.allModules do
		if not var36[i] and (not getFFlagDebugUGCDisableAssetQualityChecksModule() or not p1.skipAssetQualityChecks or not v.isAssetQualityModule) and (table.find(v.categories, p0) and (v.fflag() or v.shadowFlag())) then
			local var37 = v.shadowFlag() and not v.fflag()
			
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
				isShadow = var37
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

local function fetchQualityResults(p2, p3) --[[ line: 153 ]]
	-- upvalues: assetQualityService (ref), assetQualityFetchStatus (ref), recreateSceneFromEditablesModule (ref), getFIntUGCValidationFetchQualityMaxRetryModule (ref), httpService (ref), getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref), fetchAllDesiredDataModule (ref)
	if not assetQualityService then
		p2.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchFailure
		p2.aqsFetchMetrics.fetchFailureReason = "Not enabled"
		
		return
	end
	local var41
	local _ = nil
	local var39 = nil
	local aqFetchData = nil
	local var40 = nil
	
	if p2.consumerConfig.aqFetchStage == "scene" then
		var40 = recreateSceneFromEditablesModule.createModelForGltfExport(p2)
		local ok, status = pcall(function() --[[ line: 168 ]]
			-- upvalues: aqFetchData (write), assetQualityService (copy), var40 (write)
			aqFetchData = assetQualityService:GenerateAssetQualityGltfFromInstanceAsync(var40)
		end)
		var41 = ok
		var39 = status
	elseif p2.consumerConfig.aqFetchStage == "gltf" then
		aqFetchData = p2.consumerConfig.aqFetchData
	end
	var41 = true
	if var41 then
		for i = 1, 1 + getFIntUGCValidationFetchQualityMaxRetryModule() do
			local ok, status = pcall(function() --[[ line: 176 ]]
				-- upvalues: p2 (ref), i (ref), assetQualityService (copy), p3 (ref), aqFetchData (write), httpService (copy)
				p2.aqsFetchMetrics.fetchAttemptCount = i
				local var42 = if p2.consumerConfig.aqFetchStage == "jobId" then assetQualityService:FetchAssetQualitySummaryFromJobIdAsync(p2.consumerConfig.aqFetchData, p3) else assetQualityService:FetchAssetQualitySummaryFromGltfAsync(aqFetchData, p3)
				local var43 = 1000 * (os.clock() - os.clock())
				p2.aqsFetchMetrics.visualizationUrl = var42.visualizationUrl
				p2.aqsFetchMetrics.fetchTimeMs = var43
				p2.aqsFetchMetrics.aqJobId = var42.aqJobId
				p2.aqsSummaryData = httpService:JSONDecode(var42.rawJson)
			end)
			var41 = ok
			var39 = status
			
			if var41 then break end
		end
	end
	if var41 then
		p2.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchSuccess
		
		if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
			print(string.format("AQS fetch success: aqJobId=%s attempts=%d fetchTimeMs=%d", p2.aqsFetchMetrics.aqJobId or "", p2.aqsFetchMetrics.fetchAttemptCount or 0, p2.aqsFetchMetrics.fetchTimeMs or 0))
			print(p2.aqsSummaryData)
		end
	else
		p2.aqsFetchMetrics.fetchFailureReason = var39
		p2.aqsSummaryData = fetchAllDesiredDataModule.DATA_FETCH_FAILURE
		p2.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchFailure
		
		if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
			print("AQS fetch failure:", var39)
		end
	end
	if var40 then
		var40:Destroy()
	end
end

local function getNextLayer(p4, p5) --[[ line: 228 ]]
	local t = {}
	
	for i, v in p4 do
		if next(v.prereqs) == nil and (p5 or not v.isQuality) then
			table.insert(t, i)
		end
	end
	return t
end

local function populateRelevantSourceStrings(p6) --[[ line: 243 ]]
	-- upvalues: errorSourceStringsModule (ref)
	local function _(p7) --[[ line: 244 | named "capture" ]]
		-- upvalues: errorSourceStringsModule (copy), p6 (ref)
		local var49 = p7:split(".")
		local var50 = errorSourceStringsModule.Values[var49[#var49]]
		
		if var50 then
			p6.relevantSourceStrings[p7] = var50
		end
	end
	
	for i, v in p6.failureMap do
		for i_2, v_1 in v do
			local failureStringKey = v_1.failureStringKey
			local var47 = failureStringKey:split(".")
			local var48 = errorSourceStringsModule.Values[var47[#var47]]
			
			if var48 then
				p6.relevantSourceStrings[failureStringKey] = var48
			end
		end
	end
	for i, v_1 in p6.warningMap do
		for i_2, v_2 in v_1 do
			local failureStringKey = v_2.failureStringKey
			local var45 = failureStringKey:split(".")
			local var46 = errorSourceStringsModule.Values[var45[#var45]]
			
			if var46 then
				p6.relevantSourceStrings[failureStringKey] = var46
			end
		end
	end
end

local function _(p8) --[[ line: 265 | named "getDebugLabel" ]]
	local uploadEnum = p8.uploadEnum
	
	return if uploadEnum.assetType then uploadEnum.assetType.Name elseif uploadEnum.bundleType then uploadEnum.bundleType.Name else "?"
end

local function reportFullResult(p9, p10, p11) --[[ line: 275 ]]
	-- upvalues: assetQualityFetchStatus (ref), rbxAnalyticsService (ref), telemetryService (ref), t (ref), getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref)
	local var51 = p10.aqsFetchMetrics.fetchStatus ~= assetQualityFetchStatus.assetQualityFetchNA
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
			aqFetchAttemptCount = if var51 then p10.aqsFetchMetrics.fetchAttemptCount else 0,
			aqFetchTimeMs = if var51 then p10.aqsFetchMetrics.fetchTimeMs else 0,
			aqFetchFailureReason = if var51 then p10.aqsFetchMetrics.fetchFailureReason else "",
			aqJobId = p10.aqsFetchMetrics.aqJobId or ""
		}
	})
	
	if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
		local uploadEnum = p10.uploadEnum
		print(string.format("==== %s Validation end ==== pass=%s numFailures=%d numWarnings=%d durationMs=%d", if uploadEnum.assetType then uploadEnum.assetType.Name elseif uploadEnum.bundleType then uploadEnum.bundleType.Name else "?", tostring(p9.pass), p9.numFailures, p9.numWarnings, p11))
		
		for i, v in p9.failureMap do
			for i_1, v_1 in v do
				print(string.format("  FAIL %s: %s @ %s", i, v_1.failureStringKey, if v_1.instancePath ~= "" then "<root>" else v_1.instancePath))
			end
		end
		print(p9)
	end
end

local function updateResultData(p12, p13, p14, _, p15) --[[ line: 327 ]]
	-- upvalues: validationEnumsModule (ref)
	local validationEnum = p14.validationEnum
	
	if p15 or not p13[validationEnum].isShadow then
		p12.states[validationEnum] = p14.status
		
		if p14.status ~= validationEnumsModule.Status.PASS then
			p12.pass = false
			p12.numFailures += math.max(1, #p14.failures)
		end
		if #p14.failures > 0 then
			p12.failureMap[validationEnum] = p14.failures
		end
		if #p14.warnings > 0 then
			p12.warningMap[validationEnum] = p14.warnings
			p12.numWarnings += #p14.warnings
		end
		if p14.status == validationEnumsModule.Status.ERROR then
			p12.ranIntoInternalError = true
		end
	end
	for i, v in p13[validationEnum].postreqs do
		p13[v].prereqs[validationEnum] = nil
	end
	p13[validationEnum] = nil
end

local function createConsumerConfigWithDefaults(p16) --[[ line: 365 ]]
	-- upvalues: getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), t_4 (ref)
	local cloned = table.clone(p16)
	
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

local function runValidationOnRootInstance(p17) --[[ line: 404 ]]
	-- upvalues: getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref), getUploadCategoryModule (ref), initRunVariables (ref), assetQualityFetchStatus (ref), validationTestWrapperModule (ref), validationEnumsModule (ref), updateResultData (ref), populateRelevantSourceStrings (ref), reportFullResult (ref), fetchAllDesiredDataModule (ref), t_2 (ref), runService (ref), fetchQualityResults (ref), getNextLayer (ref), t_3 (ref)
	local processTime = os.clock()
	local rootInstance = p17.rootInstance
	local assetType = p17.uploadEnum.assetType
	local bundleType = p17.uploadEnum.bundleType
	local consumerConfig = p17.consumerConfig
	
	if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
		local uploadEnum = p17.uploadEnum
		print(string.format("==== %s Validation begin ==== jobId=%s source=%s", if uploadEnum.assetType then uploadEnum.assetType.Name elseif uploadEnum.bundleType then uploadEnum.bundleType.Name else "?", p17.jobId, p17.consumerConfig.source))
	end
	local t = {
		pass = true,
		numFailures = 0,
		numWarnings = 0,
		ranIntoInternalError = false,
		aqJobId = "",
		validationJobId = p17.jobId,
		states = {},
		failureMap = {},
		warningMap = {},
		relevantSourceStrings = {}
	}
	local var55 = getUploadCategoryModule(rootInstance, assetType, bundleType)
	local var56, var57, var58 = initRunVariables(var55, consumerConfig)
	p17.uploadCategory = var55
	p17.aqsFetchMetrics = {
		fetchStatus = assetQualityFetchStatus.assetQualityFetchNA,
		aqJobId = if consumerConfig.aqFetchStage == "jobId" then consumerConfig.aqFetchData else nil
	}
	updateResultData(t, var57, validationTestWrapperModule(validationEnumsModule.ValidationModule.ExpectedRootSchema, p17, t.states), p17.jobId, consumerConfig.enforceShadowValidations)
	
	if t.states[validationEnumsModule.ValidationModule.ExpectedRootSchema] ~= validationEnumsModule.Status.PASS then
		populateRelevantSourceStrings(t)
		t.aqJobId = p17.aqsFetchMetrics.aqJobId or ""
		reportFullResult(t, p17, -1)
		
		return t
	end
	fetchAllDesiredDataModule.storeDesiredData(p17, var58)
	
	if #var56 > 0 then
		p17.aqsFetchMetrics.fetchStatus = assetQualityFetchStatus.assetQualityFetchInProgress
		
		if t_2[consumerConfig.source] then
			runService:Run()
			fetchQualityResults(p17, var56)
			runService:Pause()
		else
			task.spawn(fetchQualityResults, p17, var56)
		end
	end
	while next(var57) ~= nil do
		local var59 = p17.aqsFetchMetrics.fetchStatus == assetQualityFetchStatus.assetQualityFetchInProgress
		local var60 = getNextLayer(var57, not var59)
		
		if #var60 == 0 and not var59 then
			error("Impossible to complete all layers")
		end
		for i, v in var60 do
			updateResultData(t, var57, validationTestWrapperModule(v, p17, t.states), p17.jobId, consumerConfig.enforceShadowValidations)
			
			if t_3[consumerConfig.source] then
				task.wait()
			end
		end
		if var59 and not t_2[consumerConfig.source] then
			task.wait()
		end
	end
	populateRelevantSourceStrings(t)
	t.aqJobId = p17.aqsFetchMetrics.aqJobId or ""
	reportFullResult(t, p17, 1000 * (os.clock() - processTime))
	
	return t
end

local _ = function(p18) --[[ line: 509 | named "getRootInstance" ]]
	-- upvalues: constantsModule (ref)
	if #p18 == 0 then
		return nil
	end
	for i, v in p18 do
		if v.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
			return v
		end
	end
	return p18[1]
end

function t_1.ValidateAsset(value, p19, p20) --[[ line: 526 ]]
	-- upvalues: httpService (ref), constantsModule (ref), createConsumerConfigWithDefaults (ref), runValidationOnRootInstance (ref)
	local var62
	local t = {
		jobId = httpService:GenerateGUID(),
		entrypointInput = value
	}
	
	if #value == 0 then
		var62 = nil
	else
		for i, v in value do
			if v.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
				var62 = v
			end
		end
		var62 = value[1]
	end
	t.rootInstance = var62
	t.uploadEnum = { assetType = p19 }
	t.consumerConfig = createConsumerConfigWithDefaults(p20)
	t.hsrAssets = {}
	
	return runValidationOnRootInstance(t)
end

function t_1.ValidateFinalizedBundle(p21, p22, p23) --[[ line: 545 ]]
	-- upvalues: getFFlagDebugAllowHRDUploadOnBundleBackendModule (ref), r15plusUtilsModule (ref), getFFlagUGCValidationAnimationPackSupportModule (ref), constantsModule (ref), httpService (ref), createConsumerConfigWithDefaults (ref), runValidationOnRootInstance (ref)
	if getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
		r15plusUtilsModule.setIsBackendBundleUpload(if p23.source ~= "Publish" then p23.source == "Backend" else true)
	end
	local var64
	local _ = nil
	
	if getFFlagUGCValidationAnimationPackSupportModule() and p22 == Enum.BundleType.Animations then
		local model = Instance.new("Model")
		
		for i, v in p21 do
			local var67
			local allSelectedInstances = v.allSelectedInstances
			
			if #allSelectedInstances == 0 then
				var67 = nil
				if var67 ~= nil then
					var67:Clone().Parent = model
				end
			end
			for i_2, v_2 in allSelectedInstances do
				if v_2.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
					var67 = v_2
				end
			end
			var67 = allSelectedInstances[1]
		end
		var64 = model
	else
		local folder = Instance.new("Folder")
		
		for i, v in p21 do
			local var65
			local allSelectedInstances = v.allSelectedInstances
			
			if #allSelectedInstances == 0 then
				var65 = nil
				if var65 ~= nil then
					if var65:IsA("Folder") or var65:IsA("Model") then
						for i_2, i_1 in var65:GetChildren() do
							i_1:Clone().Parent = folder
						end
					else
						var65:Clone().Parent = folder
					end
				end
			end
			for i_1, v_1 in allSelectedInstances do
				if v_1.Name == constantsModule.FOLDER_NAMES.R15ArtistIntent then
					var65 = v_1
				end
			end
			var65 = allSelectedInstances[1]
		end
		var64 = folder
	end
	local var68 = runValidationOnRootInstance({
		jobId = httpService:GenerateGUID(),
		entrypointInput = p21,
		rootInstance = var64,
		uploadEnum = { bundleType = p22 },
		consumerConfig = createConsumerConfigWithDefaults(p23),
		hsrAssets = {}
	})
	
	if getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
		r15plusUtilsModule.setIsBackendBundleUpload(false)
	end
	return var68
end

return t_1