local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local validationModuleLoaderModule = require(parent.validationSystem.ValidationModuleLoader)
local fetchAllDesiredDataModule = require(parent.validationSystem.dataFetchModules.FetchAllDesiredData)
local validationReporterModule = require(parent.validationSystem.ValidationReporter)
local getFFlagDebugUGCValidationPrintNewStructureResultsModule = require(parent.flags.getFFlagDebugUGCValidationPrintNewStructureResults)
local getEngineFeatureEngineUGCValidationExpandReturnSchemaModule = require(parent.flags.getEngineFeatureEngineUGCValidationExpandReturnSchema)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getFFlagUGCValidationFetchErrorMethodModule = require(parent.flags.getFFlagUGCValidationFetchErrorMethod)
local validationConstantsModule = require(parent.validationSystem.ValidationConstants)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local telemetryService = game:GetService("TelemetryService")
game:DefineFastInt("SingleValidationTelemetryThrottleHundrethsPercent", 10000)
local t = {
	eventName = "UgcSingleValidationFinished",
	description = "Report single ugc validation result to EventIngest backend.",
	links = "https://create.roblox.com/docs/art/validation-errors",
	backends = { "EventIngest" },
	throttlingPercentage = game:GetFastInt("SingleValidationTelemetryThrottleHundrethsPercent"),
	lastUpdated = { 25, 9, 24 }
}

local function reportSingleResult(p0, p1, p2, p3, p4) --[[ line: 45 ]]
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogEvent(t, {
		customFields = {
			validationJobId = p1.jobId,
			validationSource = p1.consumerConfig.source,
			validationEnum = p0,
			status = p2,
			durationMs = p4,
			additional_info = p3
		}
	})
end

local function getMissingData(p5, p6) --[[ line: 64 ]]
	-- upvalues: fetchAllDesiredDataModule (ref)
	local t = {}
	
	for i, v in p6 do
		if p5[v] == nil or p5[v] == fetchAllDesiredDataModule.DATA_FETCH_FAILURE then
			table.insert(t, v)
		end
	end
	return t
end

local function checkAqsReturnSchema(p7, p8) --[[ line: 75 ]]
	-- upvalues: checkAqsReturnSchema (ref)
	if typeof(p7) ~= "table" then
		return false
	end
	for i, v in p8 do
		if type(v) ~= "table" or checkAqsReturnSchema(p7[i], v) then
			if type(v) == "string" and not tonumber(p7[v]) then
				return false
			end
		end
		return false
	end
	return true
end

local function _(p9, p10, p11) --[[ line: 91 | named "complete" ]]
	-- upvalues: reportSingleResult (ref)
	local var16 = p11:complete()
	reportSingleResult(p9, p10, var16.status, var16.telemetryContext, var16.duration)
	
	return var16
end

return function(p12, p13, p14) --[[ line: 97 | named "ValidationTestWrapper" ]]
	-- upvalues: validationModuleLoaderModule (ref), validationReporterModule (ref), getEngineFeatureEngineUGCValidationExpandReturnSchemaModule (ref), validationEnumsModule (ref), reportSingleResult (ref), getMissingData (ref), validationConstantsModule (ref), errorSourceStringsModule (ref), checkAqsReturnSchema (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), getFFlagUGCValidationFetchErrorMethodModule (ref), getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref)
	local v
	local validationModule = validationModuleLoaderModule.getValidationModule(p12)
	local var18 = validationReporterModule.new(p12, if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then p13 else nil)
	
	for i, v in validationModule.prereqTests do
		if p14[v] ~= validationEnumsModule.Status.PASS then
			local var32 = var18:complete()
			reportSingleResult(p12, p13, var32.status, var32.telemetryContext, var32.duration)
			
			return var32
		end
	end
	local var19 = getMissingData(p13, validationModule.requiredData)
	
	if #var19 > 0 then
		var18:err(`Missing required data: {table.concat(var19, ", ")}`)
		local var20 = var18:complete()
		reportSingleResult(p12, p13, var20.status, var20.telemetryContext, var20.duration)
		
		return var20
	elseif getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		if validationModule.isAssetQualityModule then
			local var21 = p13.aqsSummaryData[p12]
			
			if var21 and var21.Error then
				local var22 = false
				
				for i_1, v_1 in var21.Error do
					if validationModule.knownAqsUserErrors[v_1] == nil then
						if table.find(validationConstantsModule.AQSInternalErrorEnum, v_1) ~= nil and var22 == false then
							var18:fail(errorSourceStringsModule.Keys.AQSInternalError)
							var22 = true
							continue
						end
						var18:err(`Unexpected error enum {v_1}`)
						local var23 = var18:complete()
						reportSingleResult(p12, p13, var23.status, var23.telemetryContext, var23.duration)
						
						return var23
					else
						var18:fail(validationModule.knownAqsUserErrors[v_1])
					end
				end
				v = var18:complete()
				reportSingleResult(p12, p13, v.status, v.telemetryContext, v.duration)
				
				return v
			else
				var18:begin()
				
				if #getMissingData(p13, validationModule.conditionalData) > 0 then
					local var31 = var18:complete()
					reportSingleResult(p12, p13, var31.status, var31.telemetryContext, var31.duration)
					
					return var31
				end
				local ok, status = pcall(function() --[[ line: 196 ]]
					-- upvalues: validationModule (ref), var18 (ref), p13 (ref)
					validationModule.run(var18, p13)
				end)
				
				if not ok then
					if getFFlagUGCValidateMigrateSchemaPropertiesModule() and type(status) == "table" and status.__forceError then
						error(status.message, 0)
					end
					if getFFlagUGCValidationFetchErrorMethodModule() and type(status) == "table" and status.__fetchError then
						if p13.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend then
							error(status.message, 0)
						end
						var18:err(status.message)
						v = var18:complete()
						reportSingleResult(p12, p13, v.status, v.telemetryContext, v.duration)
						
						return v
					elseif getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
						print("Validation error:", status)
						print("As this is in debug mode, we will re-call the function for a full error trace: ")
						validationModule.run(var18, p13)
					end
					var18:err(status)
				end
				v = var18:complete()
				reportSingleResult(p12, p13, v.status, v.telemetryContext, v.duration)
				
				return v
			end
		end
	elseif not getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() and next(validationModule.expectedAqsData) ~= nil then
		local var28
		local var24 = false
		
		for i_1, v_1 in validationModule.expectedAqsData do
			local var27 = p13.aqsSummaryData[i_1]
			var28 = false
			
			if var27 and var27.Error then
				for i_2, v_2 in var27.Error do
					if validationModule.knownAqsUserErrors[v_2] == nil then
						if table.find(validationConstantsModule.AQSInternalErrorEnum, v_2) ~= nil and var28 == false then
							var18:err(`Unexpected error enum {v_2}`)
							local var30 = var18:complete()
							reportSingleResult(p12, p13, var30.status, var30.telemetryContext, var30.duration)
							
							return var30
						end
						var18:fail(errorSourceStringsModule.Keys.AQSInternalError)
						var24 = true
						var28 = true
					else
						var18:fail(validationModule.knownAqsUserErrors[v_2])
						var24 = true
					end
				end
				local var29 = var18:complete()
				reportSingleResult(p12, p13, var29.status, var29.telemetryContext, var29.duration)
				
				return var29
			end
		end
		if var24 then
			local var25 = var18:complete()
			reportSingleResult(p12, p13, var25.status, var25.telemetryContext, var25.duration)
			
			return var25
		elseif not checkAqsReturnSchema(p13.aqsSummaryData, validationModule.expectedAqsData) then
			var18:err("Missing expected AQS schema")
			local var26 = var18:complete()
			reportSingleResult(p12, p13, var26.status, var26.telemetryContext, var26.duration)
			
			return var26
		end
	end
end