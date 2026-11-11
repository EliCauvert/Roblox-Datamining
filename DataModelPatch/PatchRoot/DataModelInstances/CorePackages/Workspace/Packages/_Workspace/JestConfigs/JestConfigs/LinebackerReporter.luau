local Result1 = nil
local Result2_1 = nil

local function _(ServiceName)
	local Success, Result = pcall(function()
		-- upvalues: ServiceName (copy)
		local ServiceName1 = game:GetService(ServiceName)
		local _ = ServiceName1.Name
		
		return ServiceName1
	end)
	
	return Success and Result or nil
end

local ServiceName = "FileSystemService"
local Success, Result = pcall(function()
	-- upvalues: ServiceName (copy)
	local ServiceName1 = game:GetService(ServiceName)
	local _ = ServiceName1.Name
	
	return ServiceName1
end)
Result1 = Success and Result or nil
local ServiceName1 = "HttpService"
local Success1, Result2 = pcall(function()
	-- upvalues: ServiceName1 (copy)
	local ServiceName1 = game:GetService(ServiceName1)
	local _ = ServiceName1.Name
	
	return ServiceName1
end)
Result2_1 = Success1 and Result2 or nil
local LinebackerReporterModule = {}
LinebackerReporterModule.__index = LinebackerReporterModule

function LinebackerReporterModule.new(_globalConfig, _options, _context)
	-- upvalues: LinebackerReporterModule (copy)
	local self = setmetatable({}, LinebackerReporterModule)
	self._globalConfig = _globalConfig
	self._options = _options
	self._context = _context
	self._results = {}
	
	return self
end

local _ = function(p1)
	return p1:match("([^/\\]+)%.json$") or (p1:match("([^/\\]+)$") or "")
end

local _ = function(Text: string): string
	return if Text:sub(-16) == "-fastFlags-allOn" then "allOn" elseif Text:sub(-17) == "-fastFlags-allOff" then "allOff" else "default"
end

local _ = function(Text: string)
	return (Text:gsub("%-fastFlags%-allOn$", ""):gsub("%-fastFlags%-allOff$", ""))
end

local function formatTestResults(p1, Suite, FastFlagVariant)
	-- upvalues: Result2_1 (ref)
	local config = {
		summary = {
			totalTests = p1.numTotalTests,
			passed = p1.numPassedTests,
			failed = p1.numFailedTests,
			pending = p1.numPendingTests
		}
	}
	local TestResults = {}
	local FlakyTests = 0
	
	for _, testResult in p1.testResults do
		for _, testResult1 in testResult.testResults do
			local FormatTestAssertionResult = formatTestAssertion(testResult1)
			FormatTestAssertionResult.suite = Suite
			FormatTestAssertionResult.fastFlagVariant = FastFlagVariant
			FormatTestAssertionResult.testFile = testResult.testFilePath
			
			if FormatTestAssertionResult.flaky then
				FlakyTests += 1
			end
			table.insert(TestResults, FormatTestAssertionResult)
		end
	end
	config.testResults = TestResults
	config.summary.flakyTests = FlakyTests
	
	return Result2_1:JSONEncode(config)
end

function formatTestAssertion(p2)
	return {
		testName = p2.fullName,
		status = p2.status,
		durationMs = p2.duration,
		flaky = p2.invocations > 1,
		failureMessages = p2.failureMessages or {},
		retryReasons = p2.retryReasons or {}
	}
end

function LinebackerReporterModule:onRunComplete(_, p2)
	-- upvalues: Result1 (ref), Result2_1 (ref), formatTestResults (copy)
	if Result1 and Result2_1 then
		local OutputFile = self._options.outputFile
		local Json = OutputFile:match("([^/\\]+)%.json$") or (OutputFile:match("([^/\\]+)$") or "")
		Result1:WriteFile(self._options.outputFile, formatTestResults(p2, Json:gsub("%-fastFlags%-allOn$", ""):gsub("%-fastFlags%-allOff$", ""), if Json:sub(-16) == "-fastFlags-allOn" then "allOn" elseif Json:sub(-17) == "-fastFlags-allOff" then "allOff" else "default"))
		print(string.format("Test results written to: %s\n", (tostring(self._options.outputFile))))
	end
end

return LinebackerReporterModule