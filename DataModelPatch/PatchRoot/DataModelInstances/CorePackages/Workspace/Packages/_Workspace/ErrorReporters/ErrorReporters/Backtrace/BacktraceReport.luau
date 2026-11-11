local Parent = script:FindFirstAncestor("ErrorReporters").Parent
local HttpService = game:GetService("HttpService")
local CryoModule = require(Parent.Cryo)
local TModule = require(Parent.t)
local ProcessErrorStackModule = require(script.Parent.Parent.ProcessErrorStack)
local OptionalResult = TModule.optional(TModule.map(TModule.string, TModule.some(TModule.string, TModule.number, TModule.boolean)))
local OptionalResult1 = TModule.optional(TModule.map(TModule.string, function(p1)
	-- upvalues: TModule (copy)
	local function checkTypeRecursive(List)
		-- upvalues: checkTypeRecursive (copy), TModule (upval)
		if type(List) ~= "table" then
			return TModule.some(TModule.string, TModule.number, TModule.boolean)(List)
		end
		local CheckTypeRecursiveResult2 = nil
		for i, value in pairs(List) do
			local CheckTypeRecursiveResult
			CheckTypeRecursiveResult, CheckTypeRecursiveResult2 = checkTypeRecursive(value)
			
			if not CheckTypeRecursiveResult then
				return false, string.format("error when checking key: %s - %s", i, CheckTypeRecursiveResult2)
			end
		end
		return true
	end
	
	return checkTypeRecursive(p1)
end))
local IntersectionResult = TModule.intersection(TModule.strictInterface({
	uuid = TModule.string,
	timestamp = TModule.number,
	lang = TModule.string,
	langVersion = TModule.string,
	agent = TModule.string,
	agentVersion = TModule.string,
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
	mainThread = TModule.string,
	attributes = OptionalResult,
	annotations = OptionalResult1,
	symbolication = TModule.optional(TModule.literal("minidump")),
	entryThread = TModule.optional(TModule.string),
	arch = TModule.optional((TModule.strictInterface({
		name = TModule.string,
		registers = TModule.map(TModule.string, TModule.string)
	}))),
	fingerprint = TModule.optional(TModule.string),
	classifiers = TModule.optional(TModule.array(TModule.string)),
	sourceCode = TModule.optional(TModule.map(TModule.string, (TModule.strictInterface({
		text = TModule.optional(TModule.string),
		startLine = TModule.optional(TModule.number),
		startColumn = TModule.optional(TModule.number),
		startPos = TModule.optional(TModule.number),
		path = TModule.optional(TModule.string),
		tabWidth = TModule.optional(TModule.number)
	})))),
	memory = TModule.optional(TModule.array((TModule.strictInterface({
		start = TModule.string,
		size = TModule.optional(TModule.number),
		data = TModule.optional(TModule.string),
		perms = TModule.optional((TModule.strictInterface({
			read = TModule.boolean,
			write = TModule.boolean,
			exec = TModule.boolean
		})))
	})))),
	modules = TModule.optional(TModule.array((TModule.strictInterface({
		start = TModule.string,
		size = TModule.number,
		code_file = TModule.optional(TModule.string),
		version = TModule.optional(TModule.string),
		debug_file = TModule.optional(TModule.string),
		debug_identifier = TModule.optional(TModule.string),
		debug_file_exists = TModule.optional(TModule.boolean)
	}))))
}), function(p2)
	local Flag = false
	
	for _, thread in pairs(p2.threads) do
		local Stack = thread.stack
		
		if Stack ~= nil then
			for _, value in ipairs(Stack) do
				if value.registers ~= nil then
					Flag = true
					break
				end
			end
		end
		if Flag then break end
	end
	if Flag and p2.arch == nil then
		return false, "arch must exist if you want to have registers in the stack"
	else
		return true
	end
end)
local BacktraceReportModule = {
	IAttributes = OptionalResult,
	IAnnotations = OptionalResult1
}
BacktraceReportModule.__index = BacktraceReportModule

local function _(p3)
	-- upvalues: CryoModule (copy)
	if p3 and type(p3) == "table" then
		local KeysResult = CryoModule.Dictionary.keys(p3)
		
		if #KeysResult > 0 then
			local v1 = p3[KeysResult[1]]
			
			if v1 and v1.path ~= nil then
				return v1.path
			end
		end
	end
	return ""
end

function BacktraceReportModule.validate(p3)
	-- upvalues: IntersectionResult (copy)
	return IntersectionResult(p3)
end

function BacktraceReportModule.new()
	-- upvalues: HttpService (copy), BacktraceReportModule (copy)
	local config = {
		lang = "lua",
		langVersion = "Roblox",
		agent = "backtrace-Lua",
		agentVersion = "0.1.0",
		mainThread = "default",
		uuid = HttpService:GenerateGUID(false):lower(),
		timestamp = os.time(),
		threads = {}
	}
	setmetatable(config, BacktraceReportModule)
	
	return config
end

function BacktraceReportModule:addAttributes(p3)
	-- upvalues: CryoModule (copy)
	if type(p3) == "table" then
		self.attributes = CryoModule.Dictionary.join(self.attributes or {}, p3)
		
		return
	else
		warn("Cannot add attributes of type: ", (type(p3)))
	end
end

function BacktraceReportModule:addAnnotations(Annotations)
	-- upvalues: CryoModule (copy)
	if type(Annotations) == "table" then
		self.annotations = CryoModule.Dictionary.join(self.annotations or {}, Annotations)
		
		return
	else
		warn("Cannot add annotations of type: ", (type(Annotations)))
	end
end

function BacktraceReportModule:addStackToThread(Stack, Name)
	-- upvalues: CryoModule (copy)
	self.threads = CryoModule.Dictionary.join(self.threads, { [Name] = { name = Name, stack = Stack } })
end

function BacktraceReportModule:addStackToMainThread(Stack)
	self:addStackToThread(Stack, self.mainThread)
end

function BacktraceReportModule.fromMessageAndStack(p3, p4)
	-- upvalues: BacktraceReportModule (copy), ProcessErrorStackModule (copy), CryoModule (copy)
	local NewBacktraceReport = BacktraceReportModule.new()
	NewBacktraceReport:addAttributes({ ["error.message"] = p3 })
	local ProcessErrorStackModuleResult, ProcessErrorStackModuleResult2 = ProcessErrorStackModule(p4)
	NewBacktraceReport:addStackToMainThread(ProcessErrorStackModuleResult)
	NewBacktraceReport.sourceCode = ProcessErrorStackModuleResult2
	local t = {}
	local SourceCode = NewBacktraceReport.sourceCode
	local Path = nil
	repeat
		if SourceCode and type(SourceCode) == "table" then
			local KeysResult = CryoModule.Dictionary.keys(SourceCode)
			
			if #KeysResult > 0 then
				local SourceCodeEntry = SourceCode[KeysResult[1]]
				
				if SourceCodeEntry and SourceCodeEntry.path ~= nil then
					Path = SourceCodeEntry.path
					break
				end
			end
		end
		Path = ""
	until true
	t.MainSourcePath = Path
	NewBacktraceReport:addAttributes(t)
	
	return NewBacktraceReport
end

function BacktraceReportModule:fromDetails()
	-- upvalues: BacktraceReportModule (copy), ProcessErrorStackModule (copy), CryoModule (copy)
	local NewBacktraceReport = BacktraceReportModule.new()
	NewBacktraceReport:addAttributes({ ["error.message"] = self.message })
	NewBacktraceReport.sourceCode = {}
	local v1 = 0
	
	for i, stack in ipairs(self.stacks) do
		local ProcessErrorStackModuleResult, ProcessErrorStackModuleResult2, ProcessErrorStackModuleResult3 = ProcessErrorStackModule(stack, v1)
		
		if i == 1 then
			NewBacktraceReport:addStackToMainThread(ProcessErrorStackModuleResult)
		else
			NewBacktraceReport:addStackToThread(ProcessErrorStackModuleResult, "stack" .. i)
		end
		NewBacktraceReport.sourceCode = CryoModule.Dictionary.join(NewBacktraceReport.sourceCode, ProcessErrorStackModuleResult2)
		v1 = ProcessErrorStackModuleResult3
	end
	NewBacktraceReport:addAnnotations(self.annotations)
	local t = {}
	local SourceCode = NewBacktraceReport.sourceCode
	local Path = nil
	repeat
		if SourceCode and type(SourceCode) == "table" then
			local KeysResult = CryoModule.Dictionary.keys(SourceCode)
			
			if #KeysResult > 0 then
				local SourceCodeEntry = SourceCode[KeysResult[1]]
				
				if SourceCodeEntry and SourceCodeEntry.path ~= nil then
					Path = SourceCodeEntry.path
					break
				end
			end
		end
		Path = ""
	until true
	t.MainSourcePath = Path
	NewBacktraceReport:addAttributes(t)
	
	return NewBacktraceReport
end

return BacktraceReportModule