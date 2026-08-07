-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:49 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local validationModuleLoaderModule = require(parent.validationSystem.ValidationModuleLoader)
local fetchAllDesiredDataModule = require(parent.validationSystem.dataFetchModules.FetchAllDesiredData)
local validationReporterModule = require(parent.validationSystem.ValidationReporter)
local getFFlagDebugUGCValidationPrintNewStructureResultsModule = require(parent.flags.getFFlagDebugUGCValidationPrintNewStructureResults)
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

local function reportSingleResult(p0, p1, p2, p3, p4) --[[ line: 43 ]]
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

local function getMissingData(p5, p6) --[[ line: 62 ]]
	-- upvalues: fetchAllDesiredDataModule (ref)
	local t = {}
	
	for i, v in p6 do
		if p5[v] == nil or p5[v] == fetchAllDesiredDataModule.DATA_FETCH_FAILURE then
			table.insert(t, v)
		end
	end
	return t
end

local function _(p7, p8, p9) --[[ line: 73 | named "complete" ]]
	-- upvalues: reportSingleResult (ref)
	local var14 = p9:complete()
	reportSingleResult(p7, p8, var14.status, var14.telemetryContext, var14.duration)
	
	return var14
end

return function(p10, p11, p12) --[[ line: 79 | named "ValidationTestWrapper" ]]
	-- upvalues: validationModuleLoaderModule (ref), validationReporterModule (ref), validationEnumsModule (ref), reportSingleResult (ref), getMissingData (ref), validationConstantsModule (ref), errorSourceStringsModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), getFFlagUGCValidationFetchErrorMethodModule (ref), getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref)
	local v
	local validationModule = validationModuleLoaderModule.getValidationModule(p10)
	local var16 = validationReporterModule.new(p10, p11)
	
	for i, v in validationModule.prereqTests do
		if p12[v] ~= validationEnumsModule.Status.PASS then
			local var22 = var16:complete()
			reportSingleResult(p10, p11, var22.status, var22.telemetryContext, var22.duration)
			
			return var22
		end
	end
	local status
	local var17 = getMissingData(p11, validationModule.requiredData)
	
	if #var17 > 0 then
		var16:err(`Missing required data: {table.concat(var17, ", ")}`)
		local var18 = var16:complete()
		reportSingleResult(p10, p11, var18.status, var18.telemetryContext, var18.duration)
		
		return var18
	elseif validationModule.isAssetQualityModule then
		local var19 = p11.aqsSummaryData[p10]
		
		if var19 and var19.Error then
			status = false
			
			for i_1, v_1 in var19.Error do
				if validationModule.knownAqsUserErrors[v_1] == nil then
					if table.find(validationConstantsModule.AQSInternalErrorEnum, v_1) ~= nil and status == false then
						var16:fail(errorSourceStringsModule.Keys.AQSInternalError)
						status = true
						continue
					end
					var16:err(`Unexpected error enum {v_1}`)
					local var21 = var16:complete()
					reportSingleResult(p10, p11, var21.status, var21.telemetryContext, var21.duration)
					
					return var21
				else
					var16:fail(validationModule.knownAqsUserErrors[v_1])
				end
			end
			v = var16:complete()
			reportSingleResult(p10, p11, v.status, v.telemetryContext, v.duration)
			
			return v
		else
			var16:begin()
			
			if #getMissingData(p11, validationModule.conditionalData) > 0 then
				status = var16:complete()
				reportSingleResult(p10, p11, status.status, status.telemetryContext, status.duration)
				
				return status
			end
			ok, status = pcall(function() --[[ line: 134 ]]
				-- upvalues: validationModule (ref), var16 (ref), p11 (ref)
				validationModule.run(var16, p11)
			end)
			
			if not ok then
				if getFFlagUGCValidateMigrateSchemaPropertiesModule() and type(status) == "table" and status.__forceError then
					error(status.message, 0)
				end
				if getFFlagUGCValidationFetchErrorMethodModule() and type(status) == "table" and status.__fetchError then
					if p11.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend then
						error(status.message, 0)
					end
					var16:err(status.message)
					v = var16:complete()
					reportSingleResult(p10, p11, v.status, v.telemetryContext, v.duration)
					
					return v
				elseif getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
					print("Validation error:", status)
					print("As this is in debug mode, we will re-call the function for a full error trace: ")
					validationModule.run(var16, p11)
				end
				var16:err(status)
			end
			v = var16:complete()
			reportSingleResult(p10, p11, v.status, v.telemetryContext, v.duration)
			
			return v
		end
	end
end