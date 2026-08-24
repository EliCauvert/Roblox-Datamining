local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local getFFlagDebugUGCValidationPrintNewStructureResultsModule = require(parent.flags.getFFlagDebugUGCValidationPrintNewStructureResults)
local getFFlagUGCValidationLogFailureInfoModule = require(parent.flags.getFFlagUGCValidationLogFailureInfo)
local UGCValidationLogFailureLength = game:DefineFastInt("UGCValidationLogFailureLength", 100)

local function getRelativePath(p0, p1)
	if p1 == nil or p1 == p0 then
		return ""
	end
	local text = p0:GetFullName() .. "."
	local fullName = p1:GetFullName()
	assert(string.sub(fullName, 1, #text) == text, `instance {fullName} is not a descendant of root {p0:GetFullName()}`)
	
	return string.sub(fullName, #text + 1)
end

local t = {}
t.__index = t

function t.new(p2, p3)
	-- upvalues: t (ref), validationEnumsModule (ref)
	local tbl = setmetatable({}, t)
	tbl._testEnum = p2
	tbl._status = validationEnumsModule.Status.CANNOT_START
	tbl._telemetryContext = ""
	tbl._currentInstance = nil
	assert(p3, "ValidationReporter.new requires sharedData")
	tbl._rootInstance = p3.rootInstance
	tbl._failures = {}
	tbl._warnings = {}
	
	return tbl
end

function t:begin()
	-- upvalues: validationEnumsModule (ref)
	self._startTime = os.clock()
	self._status = validationEnumsModule.Status.IN_PROGRESS
end

function t:setReportingInstance(p4)
	self._currentInstance = p4
end

function t:fail(p5, p6, p7)
	-- upvalues: validationEnumsModule (ref), getRelativePath (ref)
	self._status = validationEnumsModule.Status.FAIL
	table.insert(self._failures, {
		failureStringKey = p5,
		failureStringParams = p6 or {},
		instancePath = getRelativePath(self._rootInstance, p7 or self._currentInstance)
	})
end

function t:warn(p8, p9, p10)
	-- upvalues: getRelativePath (ref)
	table.insert(self._warnings, {
		failureStringKey = p8,
		failureStringParams = p9 or {},
		instancePath = getRelativePath(self._rootInstance, p10 or self._currentInstance)
	})
end

function t.forceError(_, p11)
	error({ __forceError = true, message = p11 })
end

function t.fetchError(_, p12)
	error({ __fetchError = true, message = p12 })
end

function t:err(p13)
	-- upvalues: getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref), validationEnumsModule (ref)
	if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
		print("Reporting:", self._testEnum, "has error:", p13)
	end
	self._status = validationEnumsModule.Status.ERROR
	self._telemetryContext = p13
	self._failures = {}
	self._warnings = {}
end

function t:complete()
	-- upvalues: validationEnumsModule (ref), getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref), getFFlagUGCValidationLogFailureInfoModule (ref), UGCValidationLogFailureLength (ref)
	local var9 = if self._startTime then 1000 * (os.clock() - self._startTime) else 0
	
	if self._status == validationEnumsModule.Status.IN_PROGRESS then
		self._status = validationEnumsModule.Status.PASS
	end
	if getFFlagDebugUGCValidationPrintNewStructureResultsModule() and self._status ~= validationEnumsModule.Status.PASS then
		print("Reporting:", self._testEnum, "has status", self._status, "in", var9)
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
		duration = var9,
		telemetryContext = self._telemetryContext
	}
end

return t