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

local function reportSingleResult(p1, p2, p3, p4, p5)
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogEvent(t, {
		customFields = {
			validationJobId = p2.jobId,
			validationSource = p2.consumerConfig.source,
			validationEnum = p1,
			status = p3,
			durationMs = p5,
			additional_info = p4
		}
	})
end

local function getMissingData(p1, p2)
	-- upvalues: fetchAllDesiredDataModule (ref)
	local t = {}
	
	for i, v in p2 do
		if p1[v] == nil or p1[v] == fetchAllDesiredDataModule.DATA_FETCH_FAILURE then
			table.insert(t, v)
		end
	end
	return t
end

local function _(p3, p4, p5)
	-- upvalues: reportSingleResult (ref)
	local var1 = p5:complete()
	reportSingleResult(p3, p4, var1.status, var1.telemetryContext, var1.duration)
	
	return var1
end

return function(p3, p4, p5)
	-- upvalues: validationModuleLoaderModule (ref), validationReporterModule (ref), validationEnumsModule (ref), reportSingleResult (ref), getMissingData (ref), validationConstantsModule (ref), errorSourceStringsModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), getFFlagUGCValidationFetchErrorMethodModule (ref), getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref)
	local v
	local validationModule = validationModuleLoaderModule.getValidationModule(p3)
	local var1 = validationReporterModule.new(p3, p4)
	
	for i, v in validationModule.prereqTests do
		if p5[v] ~= validationEnumsModule.Status.PASS then
			local var2 = var1:complete()
			reportSingleResult(p3, p4, var2.status, var2.telemetryContext, var2.duration)
			
			return var2
		end
	end
	local status
	local var3 = getMissingData(p4, validationModule.requiredData)
	
	if #var3 > 0 then
		var1:err(`Missing required data: {table.concat(var3, ", ")}`)
		local var4 = var1:complete()
		reportSingleResult(p3, p4, var4.status, var4.telemetryContext, var4.duration)
		
		return var4
	elseif validationModule.isAssetQualityModule then
		local var5 = p4.aqsSummaryData[p3]
		
		if var5 and var5.Error then
			status = false
			
			for i_1, v_1 in var5.Error do
				if validationModule.knownAqsUserErrors[v_1] == nil then
					if table.find(validationConstantsModule.AQSInternalErrorEnum, v_1) ~= nil and status == false then
						var1:fail(errorSourceStringsModule.Keys.AQSInternalError)
						status = true
						continue
					end
					var1:err(`Unexpected error enum {v_1}`)
					local var6 = var1:complete()
					reportSingleResult(p3, p4, var6.status, var6.telemetryContext, var6.duration)
					
					return var6
				else
					var1:fail(validationModule.knownAqsUserErrors[v_1])
				end
			end
			v = var1:complete()
			reportSingleResult(p3, p4, v.status, v.telemetryContext, v.duration)
			
			return v
		else
			var1:begin()
			
			if #getMissingData(p4, validationModule.conditionalData) > 0 then
				status = var1:complete()
				reportSingleResult(p3, p4, status.status, status.telemetryContext, status.duration)
				
				return status
			end
			ok, status = pcall(function()
				-- upvalues: validationModule (ref), var1 (ref), p4 (ref)
				validationModule.run(var1, p4)
			end)
			
			if not ok then
				if getFFlagUGCValidateMigrateSchemaPropertiesModule() and type(status) == "table" and status.__forceError then
					error(status.message, 0)
				end
				if getFFlagUGCValidationFetchErrorMethodModule() and type(status) == "table" and status.__fetchError then
					if p4.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend then
						error(status.message, 0)
					end
					var1:err(status.message)
					v = var1:complete()
					reportSingleResult(p3, p4, v.status, v.telemetryContext, v.duration)
					
					return v
				elseif getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
					print("Validation error:", status)
					print("As this is in debug mode, we will re-call the function for a full error trace: ")
					validationModule.run(var1, p4)
				end
				var1:err(status)
			end
			v = var1:complete()
			reportSingleResult(p3, p4, v.status, v.telemetryContext, v.duration)
			
			return v
		end
	end
end