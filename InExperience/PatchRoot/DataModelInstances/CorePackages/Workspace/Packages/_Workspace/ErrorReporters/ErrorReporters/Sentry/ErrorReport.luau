local Parent = script:FindFirstAncestor("ErrorReporters").Parent
local CryoModule = require(Parent.Cryo)
local TModule = require(Parent.t)
local _ = require(Parent.SentrySdk)
local ProcessErrorStackModule = require(script.Parent.Parent.ProcessErrorStack)
local ConstantsModule = require(script.Parent.Constants)
local OptionalResult = TModule.optional(TModule.map(TModule.string, TModule.some(TModule.string, TModule.number, TModule.boolean)))
local OptionalResult1 = TModule.optional(TModule.map(TModule.string, function(p1)
	-- upvalues: TModule (copy)
	local function checkTypeRecursive(List)
		-- upvalues: checkTypeRecursive (copy), TModule (upval)
		if type(List) ~= "table" then
			return TModule.some(TModule.string, TModule.number, TModule.boolean)(List), nil
		end
		local CheckTypeRecursiveResult2 = nil
		for i, value in pairs(List) do
			local CheckTypeRecursiveResult
			CheckTypeRecursiveResult, CheckTypeRecursiveResult2 = checkTypeRecursive(value)
			
			if not CheckTypeRecursiveResult then
				return false, string.format("error when checking key: %s - %s", i, CheckTypeRecursiveResult2 or "unknown error")
			end
		end
		return true, nil
	end
	
	local CheckTypeRecursiveResult, CheckTypeRecursiveResult2 = checkTypeRecursive(p1)
	
	return CheckTypeRecursiveResult, CheckTypeRecursiveResult2
end))
local OptionalResult2 = TModule.optional(TModule.map(TModule.string, (TModule.map(TModule.string, TModule.some(TModule.string, TModule.number, TModule.boolean)))))
local OptionalResult3 = TModule.optional(TModule.array((TModule.interface({
	type = TModule.optional(TModule.string),
	category = TModule.optional(TModule.string),
	message = TModule.optional(TModule.string),
	data = TModule.optional(TModule.table),
	level = TModule.optional(TModule.string),
	timestamp = TModule.optional(TModule.number),
	origin = TModule.optional(TModule.string)
}))))
local IntersectionResult = TModule.intersection(TModule.strictInterface({
	threads = TModule.map(TModule.string, (TModule.strictInterface({
		name = TModule.optional(TModule.string),
		fault = TModule.optional(TModule.boolean),
		stack = TModule.optional(TModule.array((TModule.strictInterface({
			guessed_frame = TModule.optional(TModule.boolean),
			funcName = TModule.optional(TModule.string),
			address = TModule.optional(TModule.string),
			line = TModule.optional(TModule.string),
			column = TModule.optional(TModule.string),
			sourceCode = TModule.optional(TModule.string),
			library = TModule.optional(TModule.string),
			debug_identifier = TModule.optional(TModule.string),
			faulted = TModule.optional(TModule.boolean),
			registers = TModule.optional(TModule.map(TModule.string, TModule.some(TModule.string, TModule.number)))
		}))))
	}))),
	message = TModule.optional(TModule.string),
	level = TModule.optional(TModule.string),
	attributes = OptionalResult,
	annotations = OptionalResult1,
	tags = TModule.optional(TModule.map(TModule.string, TModule.string)),
	customMetadata = OptionalResult2,
	breadcrumbs = OptionalResult3,
	timestamp = TModule.optional(TModule.number)
}))
local ErrorReportModule = {
	IAttributes = OptionalResult,
	IAnnotations = OptionalResult1,
	ICustomMetadata = OptionalResult2,
	IBreadcrumbs = OptionalResult3
}
ErrorReportModule.__index = ErrorReportModule

function ErrorReportModule.validate(p2)
	-- upvalues: IntersectionResult (copy)
	return IntersectionResult(p2)
end

function ErrorReportModule.new()
	-- upvalues: ErrorReportModule (copy)
	local config = {
		threads = {},
		attributes = {},
		annotations = {},
		customMetadata = {},
		breadcrumbs = {}
	}
	setmetatable(config, ErrorReportModule)
	
	return config
end

function ErrorReportModule:addAttributes(p2)
	-- upvalues: CryoModule (copy)
	if type(p2) == "table" then
		self.attributes = CryoModule.Dictionary.join(self.attributes, p2)
		
		return
	else
		warn("Cannot add attributes of type: ", (type(p2)))
	end
end

function ErrorReportModule:addAnnotations(Annotations)
	-- upvalues: CryoModule (copy)
	if type(Annotations) == "table" then
		self.annotations = CryoModule.Dictionary.join(self.annotations, Annotations)
		
		return
	else
		warn("Cannot add annotations of type: ", (type(Annotations)))
	end
end

local function sanitizeCustomMetadataGroup(List)
	if type(List) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, value in pairs(List) do
		local ValueType = type(value)
		
		if ValueType == "string" or ValueType == "number" or ValueType == "boolean" then
			t[i] = value
		end
	end
	return if next(t) == nil then nil else t
end

function ErrorReportModule:addCustomMetadata(List)
	-- upvalues: sanitizeCustomMetadataGroup (copy), CryoModule (copy)
	if type(List) ~= "table" then
		warn("Cannot add custom metadata of type: ", (type(List)))
		
		return
	end
	local CustomMetadata = self.customMetadata
	
	for i, value in pairs(List) do
		local SanitizeCustomMetadataGroupResult = sanitizeCustomMetadataGroup(value)
		
		if SanitizeCustomMetadataGroupResult ~= nil then
			local CustomMeta = CustomMetadata[i]
			
			if CustomMeta == nil then
				CustomMetadata[i] = SanitizeCustomMetadataGroupResult
			else
				CustomMetadata[i] = CryoModule.Dictionary.join(CustomMeta, SanitizeCustomMetadataGroupResult)
			end
		end
	end
	self.customMetadata = CustomMetadata
end

function ErrorReportModule:addBreadcrumb(p2)
	if type(p2) == "table" then
		table.insert(self.breadcrumbs, {
			type = p2.type or "default",
			category = p2.category,
			message = p2.message,
			data = p2.data,
			level = p2.level or "info",
			origin = p2.origin,
			timestamp = p2.timestamp or os.time()
		})
		
		return
	else
		warn("Cannot add breadcrumb of type: ", (type(p2)))
	end
end

function ErrorReportModule:addBreadcrumbs(List)
	if type(List) ~= "table" then
		warn("Cannot add breadcrumbs of type: ", (type(List)))
		
		return
	end
	for _, value in ipairs(List) do
		self:addBreadcrumb(value)
	end
end

function ErrorReportModule.fromMessageAndStack(Message, Stack, Level)
	-- upvalues: ErrorReportModule (copy), ConstantsModule (copy), ProcessErrorStackModule (copy)
	local NewErrorReport = ErrorReportModule.new()
	NewErrorReport.message = Message
	NewErrorReport.level = Level or ConstantsModule.DEFAULT_ERROR_LEVEL
	local ProcessErrorStackModuleResult, ProcessErrorStackModuleResult2 = ProcessErrorStackModule(Stack)
	
	for _, value in ProcessErrorStackModuleResult do
		if value.sourceCode and ProcessErrorStackModuleResult2[value.sourceCode] then
			value.sourceCode = ProcessErrorStackModuleResult2[value.sourceCode].path
		end
	end
	NewErrorReport.threads = {
		main = { name = "main", stack = ProcessErrorStackModuleResult }
	}
	
	return NewErrorReport
end

function ErrorReportModule:fromDetails()
	-- upvalues: ErrorReportModule (copy), ConstantsModule (copy)
	local FromMessageAndStackResult = nil
	if self.stack then
		FromMessageAndStackResult = ErrorReportModule.fromMessageAndStack(self.message, self.stack, self.level)
	else
		FromMessageAndStackResult = ErrorReportModule.new()
		FromMessageAndStackResult.message = self.message
		FromMessageAndStackResult.level = self.level or ConstantsModule.DEFAULT_ERROR_LEVEL
	end
	if self.annotations then
		FromMessageAndStackResult:addAnnotations(self.annotations)
	end
	return FromMessageAndStackResult
end

return ErrorReportModule