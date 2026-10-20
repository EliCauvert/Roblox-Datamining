local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local GetFFlagDebugUGCValidationPrintNewStructureResultsModule = require(Parent.flags.getFFlagDebugUGCValidationPrintNewStructureResults)
local GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule = require(Parent.flags.getEngineFeatureEngineUGCValidationExpandReturnSchema)

local function getRelativePath(RootInstance, Object): string
	if Object == nil or Object == RootInstance then
		return ""
	else
		local Text = RootInstance:GetFullName() .. "."
		local FullName: string = Object:GetFullName()
		assert(string.sub(FullName, 1, #Text) == Text, `instance {FullName} is not a descendant of root {RootInstance:GetFullName()}`)
		
		return (string.sub(FullName, #Text + 1))
	end
end

local ValidationReporterModule = {}
ValidationReporterModule.__index = ValidationReporterModule

function ValidationReporterModule.new(_testEnum, p1)
	-- upvalues: ValidationReporterModule (copy), ValidationEnumsModule (copy), GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule (copy)
	local self = setmetatable({}, ValidationReporterModule)
	self._testEnum = _testEnum
	self._status = ValidationEnumsModule.Status.CANNOT_START
	self._telemetryContext = ""
	self._currentInstance = nil
	
	if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		assert(p1, "ValidationReporter.new requires sharedData")
		self._rootInstance = p1.rootInstance
		self._failures = {}
		self._warnings = {}
		
		return self
	else
		self._failureMessages = {}
		
		return self
	end
end

function ValidationReporterModule:begin()
	-- upvalues: GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule (copy), ValidationEnumsModule (copy)
	self._startTime = os.clock()
	self._status = if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then ValidationEnumsModule.Status.IN_PROGRESS else ValidationEnumsModule.Status.PASS
end

function ValidationReporterModule:setReportingInstance(_currentInstance)
	-- upvalues: GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule (copy)
	if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		self._currentInstance = _currentInstance
		
		return
	end
end

function ValidationReporterModule:fail(FailureStringKey, p1, p2)
	-- upvalues: ValidationEnumsModule (copy), GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule (copy), getRelativePath (copy)
	self._status = ValidationEnumsModule.Status.FAIL
	
	if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		table.insert(self._failures, {
			failureStringKey = FailureStringKey,
			failureStringParams = p1 or {},
			instancePath = getRelativePath(self._rootInstance, p2 or self._currentInstance)
		})
		
		return
	else
		table.insert(self._failureMessages, { key = FailureStringKey, params = p1 or {} })
	end
end

function ValidationReporterModule:warn(FailureStringKey, p1, p2)
	-- upvalues: GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule (copy), getRelativePath (copy)
	if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		table.insert(self._warnings, {
			failureStringKey = FailureStringKey,
			failureStringParams = p1 or {},
			instancePath = getRelativePath(self._rootInstance, p2 or self._currentInstance)
		})
		
		return
	end
end

function ValidationReporterModule:forceError(Message)
	error({ __forceError = true, message = Message })
end

function ValidationReporterModule:fetchError(Message)
	error({ __fetchError = true, message = Message })
end

function ValidationReporterModule:err(_telemetryContext)
	-- upvalues: GetFFlagDebugUGCValidationPrintNewStructureResultsModule (copy), ValidationEnumsModule (copy), GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule (copy)
	if GetFFlagDebugUGCValidationPrintNewStructureResultsModule() then
		print("Reporting:", self._testEnum, "has error:", _telemetryContext)
	end
	self._status = ValidationEnumsModule.Status.ERROR
	self._telemetryContext = _telemetryContext
	
	if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		self._failures = {}
		self._warnings = {}
		
		return
	else
		self._failureMessages = {}
	end
end

function ValidationReporterModule:complete()
	-- upvalues: GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule (copy), ValidationEnumsModule (copy), GetFFlagDebugUGCValidationPrintNewStructureResultsModule (copy)
	local ScaledClockTime: number = if self._startTime then 1000 * (os.clock() - self._startTime) else 0
	
	if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		if self._status == ValidationEnumsModule.Status.IN_PROGRESS then
			self._status = ValidationEnumsModule.Status.PASS
		end
		if GetFFlagDebugUGCValidationPrintNewStructureResultsModule() and self._status ~= ValidationEnumsModule.Status.PASS then
			print("Reporting:", self._testEnum, "has status", self._status, "in", ScaledClockTime)
		end
		return {
			validationEnum = self._testEnum,
			status = self._status,
			failures = self._failures,
			warnings = self._warnings,
			duration = ScaledClockTime,
			telemetryContext = self._telemetryContext
		}
	else
		if GetFFlagDebugUGCValidationPrintNewStructureResultsModule() and self._status ~= ValidationEnumsModule.Status.PASS then
			print("Reporting:", self._testEnum, "has status", self._status, "in", ScaledClockTime)
		end
		return {
			validationEnum = self._testEnum,
			status = self._status,
			errorTranslationContexts = self._failureMessages,
			duration = ScaledClockTime,
			telemetryContext = self._telemetryContext
		}
	end
end

return ValidationReporterModule