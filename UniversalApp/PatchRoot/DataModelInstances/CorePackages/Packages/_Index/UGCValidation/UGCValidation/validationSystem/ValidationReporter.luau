local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local getFFlagDebugUGCValidationPrintNewStructureResultsModule = require(parent.flags.getFFlagDebugUGCValidationPrintNewStructureResults)
local getEngineFeatureEngineUGCValidationExpandReturnSchemaModule = require(parent.flags.getEngineFeatureEngineUGCValidationExpandReturnSchema)

local function getRelativePath(p0, p1) --[[ line: 12 ]]
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

function t.new(p2, p3) --[[ line: 28 ]]
	-- upvalues: t (ref), validationEnumsModule (ref), getEngineFeatureEngineUGCValidationExpandReturnSchemaModule (ref)
	local tbl = setmetatable({}, t)
	tbl._testEnum = p2
	tbl._status = validationEnumsModule.Status.CANNOT_START
	tbl._telemetryContext = ""
	tbl._currentInstance = nil
	
	if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		assert(p3, "ValidationReporter.new requires sharedData")
		tbl._rootInstance = p3.rootInstance
		tbl._failures = {}
		tbl._warnings = {}
		
		return tbl
	end
	tbl._failureMessages = {}
	
	return tbl
end

function t:begin() --[[ line: 47 ]]
	-- upvalues: getEngineFeatureEngineUGCValidationExpandReturnSchemaModule (ref), validationEnumsModule (ref)
	self._startTime = os.clock()
	self._status = if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then validationEnumsModule.Status.IN_PROGRESS else validationEnumsModule.Status.PASS
end

function t:setReportingInstance(p4) --[[ line: 56 ]]
	-- upvalues: getEngineFeatureEngineUGCValidationExpandReturnSchemaModule (ref)
	if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		self._currentInstance = p4
		
		return
	end
end

function t:fail(p5, p6, p7) --[[ line: 63 ]]
	-- upvalues: validationEnumsModule (ref), getEngineFeatureEngineUGCValidationExpandReturnSchemaModule (ref), getRelativePath (ref)
	self._status = validationEnumsModule.Status.FAIL
	
	if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		table.insert(self._failures, {
			failureStringKey = p5,
			failureStringParams = p6 or {},
			instancePath = getRelativePath(self._rootInstance, p7 or self._currentInstance)
		})
		
		return
	end
	table.insert(self._failureMessages, { key = p5, params = p6 or {} })
end

function t:warn(p8, p9, p10) --[[ line: 79 ]]
	-- upvalues: getEngineFeatureEngineUGCValidationExpandReturnSchemaModule (ref), getRelativePath (ref)
	if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		table.insert(self._warnings, {
			failureStringKey = p8,
			failureStringParams = p9 or {},
			instancePath = getRelativePath(self._rootInstance, p10 or self._currentInstance)
		})
		
		return
	end
end

function t.forceError(_, p11) --[[ line: 91 ]]
	error({ __forceError = true, message = p11 })
end

function t.fetchError(_, p12) --[[ line: 98 ]]
	error({ __fetchError = true, message = p12 })
end

function t:err(p13) --[[ line: 102 ]]
	-- upvalues: getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref), validationEnumsModule (ref), getEngineFeatureEngineUGCValidationExpandReturnSchemaModule (ref)
	if getFFlagDebugUGCValidationPrintNewStructureResultsModule() then
		print("Reporting:", self._testEnum, "has error:", p13)
	end
	self._status = validationEnumsModule.Status.ERROR
	self._telemetryContext = p13
	
	if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		self._failures = {}
		self._warnings = {}
		
		return
	end
	self._failureMessages = {}
end

function t:complete() --[[ line: 117 ]]
	-- upvalues: getEngineFeatureEngineUGCValidationExpandReturnSchemaModule (ref), validationEnumsModule (ref), getFFlagDebugUGCValidationPrintNewStructureResultsModule (ref)
	local var8 = if self._startTime then 1000 * (os.clock() - self._startTime) else 0
	
	if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		if self._status == validationEnumsModule.Status.IN_PROGRESS then
			self._status = validationEnumsModule.Status.PASS
		end
		if getFFlagDebugUGCValidationPrintNewStructureResultsModule() and self._status ~= validationEnumsModule.Status.PASS then
			print("Reporting:", self._testEnum, "has status", self._status, "in", var8)
		end
		return {
			validationEnum = self._testEnum,
			status = self._status,
			failures = self._failures,
			warnings = self._warnings,
			duration = var8,
			telemetryContext = self._telemetryContext
		}
	elseif getFFlagDebugUGCValidationPrintNewStructureResultsModule() and self._status ~= validationEnumsModule.Status.PASS then
		print("Reporting:", self._testEnum, "has status", self._status, "in", var8)
	end
	return {
		validationEnum = self._testEnum,
		status = self._status,
		errorTranslationContexts = self._failureMessages,
		duration = var8,
		telemetryContext = self._telemetryContext
	}
end

return t