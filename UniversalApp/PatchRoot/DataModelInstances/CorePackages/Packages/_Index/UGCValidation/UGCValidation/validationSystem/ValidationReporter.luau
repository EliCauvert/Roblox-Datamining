local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local getFFlagDebugUGCValidationPrintNewStructureResultsModule = require(parent.flags.getFFlagDebugUGCValidationPrintNewStructureResults)
local getFFlagUGCValidationLogFailureInfoModule = require(parent.flags.getFFlagUGCValidationLogFailureInfo)
local UGCValidationLogFailureLength = game:DefineFastInt("UGCValidationLogFailureLength", 100)

local function getRelativePath(p1, p2)
	if p2 == nil or p2 == p1 then
		return ""
	end
	local text = p1:GetFullName() .. "."
	local fullName = p2:GetFullName()
	assert(string.sub(fullName, 1, #text) == text, `instance {fullName} is not a descendant of root {p1:GetFullName()}`)
	
	return string.sub(fullName, #text + 1)
end

local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: t (ref), validationEnumsModule (ref)
	local tbl = setmetatable({}, t)
	tbl._testEnum = p1
	tbl._status = validationEnumsModule.Status.CANNOT_START
	tbl._telemetryContext = ""
	tbl._currentInstance = nil
	assert(p2, "ValidationReporter.new requires sharedData")
	tbl._rootInstance = p2.rootInstance
	tbl._failures = {}
	tbl._warnings = {}
	
	return tbl
end

function t:begin()
	-- upvalues: validationEnumsModule (ref)
	self._startTime = os.clock()
	self._status = validationEnumsModule.Status.IN_PROGRESS
end

function t:setReportingInstance(p1)
	self._currentInstance = p1
end

function t:fail(p1, p2, p3)
	-- upvalues: validationEnumsModule (ref), getRelativePath (ref)
	self._status = validationEnumsModule.Status.FAIL
	table.insert(self._failures, {
		failureStringKey = p1,
		failureStringParams = p2 or {},
		instancePath = getRelativePath(self._rootInstance, p3 or self._currentInstance)
	})
end

function t:warn(p1, p2, p3)
	-- upvalues: getRelativePath (ref)
	table.insert(self._warnings, {
		failureStringKey = p1,
		failureStringParams = p2 or {},
		instancePath = getRelativePath(self._rootInstance, p3 or self._currentInstance)
	})
end

function t.forceError(_, p1)
	error({ __forceError = true, message = p1 })
end

function t.fetchError(_, p1)
	error({ __fetchError = true, message = p1 })
end

function t:err(p1)
	-- upvalues: getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref), validationEnumsModule (ref)
	if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
		print("Reporting:", self._testEnum, "has error:", p1)
	end
	self._status = validationEnumsModule.Status.ERROR
	self._telemetryContext = p1
	self._failures = {}
	self._warnings = {}
end

function t:complete()
	-- upvalues: validationEnumsModule (ref), getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref), getFFlagUGCValidationLogFailureInfoModule (ref), UGCValidationLogFailureLength (ref)
	local var1 = if self._startTime then 1000 * (os.clock() - self._startTime) else 0
	
	if self._status == validationEnumsModule.Status.IN_PROGRESS then
		self._status = validationEnumsModule.Status.PASS
	end
	if getFFlagDebugUGCValidationPrintNewStructureResultsModule() and self._status ~= validationEnumsModule.Status.PASS then
		print("Reporting:", self._testEnum, "has status", self._status, "in", var1)
	end
	if getFFlagUGCValidationLogFailureInfoModule() and self._status == validationEnumsModule.Status.FAIL then
		for i, v in self._failures do
			self._telemetryContext ..= v.failureStringKey .. ";"
			
			if v.failureStringParams then
				for i_1, v_1 in v.failureStringParams do
					self._telemetryContext ..= tostring(v_1) .. ";"
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
		duration = var1,
		telemetryContext = self._telemetryContext
	}
end

return t