local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ValidationModuleLoaderModule = require(Parent.validationSystem.ValidationModuleLoader)
local FetchAllDesiredDataModule = require(Parent.validationSystem.dataFetchModules.FetchAllDesiredData)
local ValidationReporterModule = require(Parent.validationSystem.ValidationReporter)
local GetFFlagDebugUGCValidationPrintNewStructureResultsModule = require(Parent.flags.getFFlagDebugUGCValidationPrintNewStructureResults)
local GetFFlagUGCValidationFetchErrorMethodModule = require(Parent.flags.getFFlagUGCValidationFetchErrorMethod)
local ValidationConstantsModule = require(Parent.validationSystem.ValidationConstants)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local TelemetryService = game:GetService("TelemetryService")
game:DefineFastInt("SingleValidationTelemetryThrottleHundrethsPercent", 10000)
local config = {
	eventName = "UgcSingleValidationFinished",
	description = "Report single ugc validation result to EventIngest backend.",
	links = "https://create.roblox.com/docs/art/validation-errors",
	backends = { "EventIngest" },
	throttlingPercentage = game:GetFastInt("SingleValidationTelemetryThrottleHundrethsPercent"),
	lastUpdated = { 25, 9, 24 }
}

local function reportSingleResult(ValidationEnum, p1, Status, TelemetryContext, Duration)
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config, {
		customFields = {
			validationJobId = p1.jobId,
			validationSource = p1.consumerConfig.source,
			validationEnum = ValidationEnum,
			status = Status,
			durationMs = Duration,
			additional_info = TelemetryContext
		}
	})
end

local function getMissingData(p1, ConditionalData)
	-- upvalues: FetchAllDesiredDataModule (copy)
	local List = {}
	
	for _, value in ConditionalData do
		if p1[value] == nil or p1[value] == FetchAllDesiredDataModule.DATA_FETCH_FAILURE then
			table.insert(List, value)
		end
	end
	return List
end

local function _(ValidationEnum, p2, p3)
	-- upvalues: reportSingleResult (copy)
	local CompleteResult = p3:complete()
	reportSingleResult(ValidationEnum, p2, CompleteResult.status, CompleteResult.telemetryContext, CompleteResult.duration)
	
	return CompleteResult
end

return function(ValidationEnum, p2, p3)
	-- upvalues: ValidationModuleLoaderModule (copy), ValidationReporterModule (copy), ValidationEnumsModule (copy), reportSingleResult (copy), getMissingData (copy), ValidationConstantsModule (copy), ErrorSourceStringsModule (copy), GetFFlagUGCValidationFetchErrorMethodModule (copy), GetFFlagDebugUGCValidationPrintNewStructureResultsModule (copy)
	local ValidationModule = ValidationModuleLoaderModule.getValidationModule(ValidationEnum)
	local NewValidationReporter = ValidationReporterModule.new(ValidationEnum, p2)
	
	for _, prereqTest in ValidationModule.prereqTests do
		if p3[prereqTest] ~= ValidationEnumsModule.Status.PASS then
			local CompleteResult = NewValidationReporter:complete()
			reportSingleResult(ValidationEnum, p2, CompleteResult.status, CompleteResult.telemetryContext, CompleteResult.duration)
			
			return CompleteResult
		end
	end
	local MissingData = getMissingData(p2, ValidationModule.requiredData)
	
	if #MissingData > 0 then
		NewValidationReporter:err(`Missing required data: {table.concat(MissingData, ", ")}`)
		local CompleteResult = NewValidationReporter:complete()
		reportSingleResult(ValidationEnum, p2, CompleteResult.status, CompleteResult.telemetryContext, CompleteResult.duration)
		
		return CompleteResult
	end
	if ValidationModule.isAssetQualityModule then
		local AqsSummary = p2.aqsSummaryData[ValidationEnum]
		
		if AqsSummary and AqsSummary.Error then
			local Enabled = false
			
			for _, value in AqsSummary.Error do
				if ValidationModule.knownAqsUserErrors[value] ~= nil then
					NewValidationReporter:fail(ValidationModule.knownAqsUserErrors[value])
					continue
				end
				if table.find(ValidationConstantsModule.AQSInternalErrorEnum, value) == nil or Enabled ~= false then
					NewValidationReporter:err(`Unexpected error enum {value}`)
					local CompleteResult = NewValidationReporter:complete()
					reportSingleResult(ValidationEnum, p2, CompleteResult.status, CompleteResult.telemetryContext, CompleteResult.duration)
					
					return CompleteResult
				end
				NewValidationReporter:fail(ErrorSourceStringsModule.Keys.AQSInternalError)
				Enabled = true
			end
			local CompleteResult = NewValidationReporter:complete()
			reportSingleResult(ValidationEnum, p2, CompleteResult.status, CompleteResult.telemetryContext, CompleteResult.duration)
			
			return CompleteResult
		end
	end
	NewValidationReporter:begin()
	
	if #getMissingData(p2, ValidationModule.conditionalData) > 0 then
		local CompleteResult = NewValidationReporter:complete()
		reportSingleResult(ValidationEnum, p2, CompleteResult.status, CompleteResult.telemetryContext, CompleteResult.duration)
		
		return CompleteResult
	end
	local Success, Result = pcall(function()
		-- upvalues: ValidationModule (copy), NewValidationReporter (copy), p2 (copy)
		ValidationModule.run(NewValidationReporter, p2)
	end)
	
	if not Success then
		if type(Result) == "table" and Result.__forceError then
			error(Result.message, 0)
		end
		if GetFFlagUGCValidationFetchErrorMethodModule() and type(Result) == "table" and Result.__fetchError then
			local Inverted: boolean = ValidationModule.shadowFlag() and not ValidationModule.fflag()
			
			if p2.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.Backend and not Inverted then
				error(Result.message, 0)
			end
			NewValidationReporter:err(Result.message)
			local CompleteResult = NewValidationReporter:complete()
			reportSingleResult(ValidationEnum, p2, CompleteResult.status, CompleteResult.telemetryContext, CompleteResult.duration)
			
			return CompleteResult
		else
			if GetFFlagDebugUGCValidationPrintNewStructureResultsModule() then
				print("Validation error:", Result)
				print("As this is in debug mode, we will re-call the function for a full error trace: ")
				ValidationModule.run(NewValidationReporter, p2)
			end
			NewValidationReporter:err(Result)
		end
	end
	local CompleteResult = NewValidationReporter:complete()
	reportSingleResult(ValidationEnum, p2, CompleteResult.status, CompleteResult.telemetryContext, CompleteResult.duration)
	
	return CompleteResult
end