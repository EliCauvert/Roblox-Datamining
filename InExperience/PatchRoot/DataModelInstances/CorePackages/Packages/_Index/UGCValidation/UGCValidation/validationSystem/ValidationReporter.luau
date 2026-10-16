local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local GetFFlagDebugUGCValidationPrintNewStructureResultsModule = require(Parent.flags.getFFlagDebugUGCValidationPrintNewStructureResults)
local GetFFlagUGCValidationLogFailureInfoModule = require(Parent.flags.getFFlagUGCValidationLogFailureInfo)
local UGCValidationLogFailureLength = game:DefineFastInt("UGCValidationLogFailureLength", 100)

local function getRelativePath(RootInstance, Object): string --[[ Line: 14 ]]
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

function ValidationReporterModule.new(_testEnum, p1) --[[ Line: 30 ]]
	-- upvalues: ValidationReporterModule (copy), ValidationEnumsModule (copy)
	local self = setmetatable({}, ValidationReporterModule)
	self._testEnum = _testEnum
	self._status = ValidationEnumsModule.Status.CANNOT_START
	self._telemetryContext = ""
	self._currentInstance = nil
	assert(p1, "ValidationReporter.new requires sharedData")
	self._rootInstance = p1.rootInstance
	self._failures = {}
	self._warnings = {}
	
	return self
end

function ValidationReporterModule:begin() --[[ Line: 45 ]]
	-- upvalues: ValidationEnumsModule (copy)
	self._startTime = os.clock()
	self._status = ValidationEnumsModule.Status.IN_PROGRESS
end

function ValidationReporterModule:setReportingInstance(_currentInstance) --[[ Line: 52 ]]
	self._currentInstance = _currentInstance
end

function ValidationReporterModule:setReportingRoot(_rootInstance) --[[ Line: 58 ]]
	self._rootInstance = _rootInstance
end

function ValidationReporterModule:setTelemetryContext(_telemetryContext) --[[ Line: 63 ]]
	self._telemetryContext = _telemetryContext
end

function ValidationReporterModule:fail(FailureStringKey, p1, p2) --[[ Line: 67 ]]
	-- upvalues: ValidationEnumsModule (copy), getRelativePath (copy)
	self._status = ValidationEnumsModule.Status.FAIL
	table.insert(self._failures, {
		failureStringKey = FailureStringKey,
		failureStringParams = p1 or {},
		instancePath = getRelativePath(self._rootInstance, p2 or self._currentInstance)
	})
end

function ValidationReporterModule:warn(FailureStringKey, p1, p2) --[[ Line: 76 ]]
	-- upvalues: getRelativePath (copy)
	table.insert(self._warnings, {
		failureStringKey = FailureStringKey,
		failureStringParams = p1 or {},
		instancePath = getRelativePath(self._rootInstance, p2 or self._currentInstance)
	})
end

function ValidationReporterModule:forceError(Message) --[[ Line: 85 ]]
	error({ __forceError = true, message = Message })
end

function ValidationReporterModule:fetchError(Message) --[[ Line: 92 ]]
	error({ __fetchError = true, message = Message })
end

function ValidationReporterModule:err(_telemetryContext) --[[ Line: 96 ]]
	-- upvalues: GetFFlagDebugUGCValidationPrintNewStructureResultsModule (copy), ValidationEnumsModule (copy)
	if GetFFlagDebugUGCValidationPrintNewStructureResultsModule() then
		print("Reporting:", self._testEnum, "has error:", _telemetryContext)
	end
	self._status = ValidationEnumsModule.Status.ERROR
	self._telemetryContext = _telemetryContext
	self._failures = {}
	self._warnings = {}
end

function ValidationReporterModule:complete() --[[ Line: 107 ]]
	-- upvalues: ValidationEnumsModule (copy), GetFFlagDebugUGCValidationPrintNewStructureResultsModule (copy), GetFFlagUGCValidationLogFailureInfoModule (copy), UGCValidationLogFailureLength (copy)
	local ScaledClockTime: number = if self._startTime then 1000 * (os.clock() - self._startTime) else 0
	
	if self._status == ValidationEnumsModule.Status.IN_PROGRESS then
		self._status = ValidationEnumsModule.Status.PASS
	end
	if GetFFlagDebugUGCValidationPrintNewStructureResultsModule() and self._status ~= ValidationEnumsModule.Status.PASS then
		print("Reporting:", self._testEnum, "has status", self._status, "in", ScaledClockTime)
	end
	if GetFFlagUGCValidationLogFailureInfoModule() and self._status == ValidationEnumsModule.Status.FAIL then
		for _, failure in self._failures do
			self._telemetryContext ..= failure.failureStringKey .. ";"
			
			if failure.failureStringParams then
				for _, failureStringParam in failure.failureStringParams do
					self._telemetryContext ..= tostring(failureStringParam) .. ";"
				end
			end
		end
		self._telemetryContext = string.sub(self._telemetryContext, 1, UGCValidationLogFailureLength)
	end
	return {
		validationEnum = self._testEnum,
		status = self._status,
		failures = self._failures,
		warnings = self._warnings,
		duration = ScaledClockTime,
		telemetryContext = self._telemetryContext
	}
end

return ValidationReporterModule