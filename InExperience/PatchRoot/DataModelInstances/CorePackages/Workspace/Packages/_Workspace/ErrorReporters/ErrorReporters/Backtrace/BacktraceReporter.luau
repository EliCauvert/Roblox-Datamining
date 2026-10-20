local Parent = script:FindFirstAncestor("ErrorReporters").Parent
local RunService = game:GetService("RunService")
local CryoModule = require(Parent.Cryo)
local TModule = require(Parent.t)
local BacktraceReportModule = require(script.Parent.BacktraceReport)
local ErrorQueueModule = require(script.Parent.Parent.ErrorQueue)
local FFlagLuaAppEnableBacktraceSessionInfoModule = require(script.Parent.Flags.FFlagLuaAppEnableBacktraceSessionInfo)
local IsStudio = RunService:IsStudio()
local FIntOldestUAVersionToReportErrorsModule = require(script.Parent.Parent.FIntOldestUAVersionToReportErrors)
local BacktraceReporterModule = {}
BacktraceReporterModule.__index = BacktraceReporterModule
local StrictInterfaceResult = TModule.strictInterface({
	httpService = TModule.some(TModule.instanceOf("HttpService"), TModule.interface({
		JSONEncode = TModule.callback,
		JSONDecode = TModule.callback,
		RequestInternal = TModule.callback
	})),
	token = TModule.string,
	processErrorReportMethod = TModule.optional(TModule.callback),
	queueOptions = TModule.optional(TModule.table),
	generateLogMethod = TModule.optional(TModule.callback),
	logIntervalInSeconds = TModule.optional(TModule.numberPositive)
})

function BacktraceReporterModule.new(p1)
	-- upvalues: StrictInterfaceResult (copy), IsStudio (copy), BacktraceReporterModule (copy), ErrorQueueModule (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(p1)
	local Config = nil
	
	if StrictInterfaceResultResult then
		Config = {
			_isEnabled = true,
			_errorQueue = nil,
			_lastLogTime = 0,
			_httpService = p1.httpService,
			_reportUrl = game:GetFastString("ErrorUploadToBacktraceBaseUrl") .. "token=" .. p1.token,
			_processErrorReportMethod = p1.processErrorReportMethod,
			_sharedAttributes = {},
			_sharedAnnotations = {},
			_generateLogMethod = p1.generateLogMethod,
			_logIntervalInSeconds = p1.logIntervalInSeconds or 60
		}
	elseif IsStudio or _G.__DEV__ then
		error("invalid arguments for BacktraceReporter: " .. StrictInterfaceResultResult2)
	else
		Config = { _isEnabled = false }
	end
	setmetatable(Config, BacktraceReporterModule)
	
	if Config._isEnabled then
		Config._errorQueue = ErrorQueueModule.new(function(...)
			-- upvalues: Config (ref)
			Config:_reportErrorFromErrorQueue(...)
		end, p1.queueOptions)
		Config._errorQueue:startTimer()
	end
	return Config
end

function BacktraceReporterModule:isTooOldToReportErrors(): boolean
	-- upvalues: RunService (copy), FIntOldestUAVersionToReportErrorsModule (copy)
	local Number: number? = tonumber(string.match(RunService:GetRobloxVersion(), ".(%d+)."))
	
	return Number and Number < FIntOldestUAVersionToReportErrorsModule or false
end

function BacktraceReporterModule:sendErrorReport(BacktraceReport, Log)
	-- upvalues: IsStudio (copy)
	if not self._isEnabled then return end
	if self:isTooOldToReportErrors() then return end
	if IsStudio or _G.__DEV__ then
		assert(BacktraceReport:validate())
	end
	local Success, Result = pcall(function()
		-- upvalues: self (copy), BacktraceReport (copy)
		return self._httpService:JSONEncode(BacktraceReport)
	end)
	
	if Success then
		pcall(function()
			-- upvalues: self (copy), Result (copy), Log (copy)
			self._httpService:RequestInternal({
				Method = "POST",
				Url = self._reportUrl .. "&format=json",
				Headers = { ["Content-Type"] = "application/json" },
				Body = Result
			}):Start(function(_, p1)
				-- upvalues: Log (upval), self (upval)
				if p1.StatusCode == 200 and Log ~= nil then
					local Success, Result = pcall(function()
						-- upvalues: self (upval), p1 (copy)
						return self._httpService:JSONDecode(p1.Body)
					end)
					
					if Success and Result._rxid ~= nil then
						self:_sendLogToReport(Result._rxid, Log)
					end
				end
			end)
		end)
		
		return
	else
		warn("Cannot convert report to Json")
	end
end

function BacktraceReporterModule._sendLogToReport(p1, Rxid, Body)
	if type(Body) == "string" and #Body ~= 0 then
		pcall(function()
			-- upvalues: p1 (copy), Rxid (copy), Body (copy)
			p1._httpService:RequestInternal({
				Method = "POST",
				Url = p1._reportUrl .. "&object=" .. Rxid .. "&attachment_name=log.txt",
				Headers = { ["Content-Type"] = "text/plain" },
				Body = Body
			}):Start(function(_, _) end)
		end)
		
		return
	end
end

function BacktraceReporterModule:_generateLog()
	if self._generateLogMethod ~= nil and self._logIntervalInSeconds < tick() - self._lastLogTime then
		self._lastLogTime = tick()
		local Success, Result = pcall(function()
			-- upvalues: self (copy)
			return self._generateLogMethod()
		end)
		
		if Success and type(Result) == "string" and #Result > 0 then
			return Result
		end
	end
	return nil
end

function BacktraceReporterModule:_generateErrorReport(p1, p2, StackDetails, p3)
	-- upvalues: BacktraceReportModule (copy), FFlagLuaAppEnableBacktraceSessionInfoModule (copy)
	local FromDetailsResult = if type(StackDetails) == "table" then BacktraceReportModule.fromDetails(StackDetails) else BacktraceReportModule.fromMessageAndStack(p1, p2)
	
	if FFlagLuaAppEnableBacktraceSessionInfoModule and p3 ~= nil then
		FromDetailsResult:addAttributes(p3)
	end
	FromDetailsResult:addAttributes(self._sharedAttributes)
	FromDetailsResult:addAnnotations(self._sharedAnnotations)
	
	if type(StackDetails) == "string" and StackDetails ~= "" then
		FromDetailsResult:addAnnotations({ stackDetails = StackDetails })
	end
	return FromDetailsResult
end

function BacktraceReporterModule:reportErrorImmediately(p1, p2, StackDetails, p3)
	if not self._isEnabled then return end
	local ErrorReport = self:_generateErrorReport(p1, p2, StackDetails, p3)
	
	if self._processErrorReportMethod ~= nil then
		ErrorReport = self._processErrorReportMethod(ErrorReport)
	end
	self:sendErrorReport(ErrorReport, (self:_generateLog()))
end

function BacktraceReporterModule:reportErrorDeferred(p1, p2, StackDetails, p3)
	if not self._isEnabled then return end
	local Formatted = string.format("%s | %s", p1, p2)
	local t = {}
	
	if not self._errorQueue:hasError(Formatted) then
		local ErrorReport = self:_generateErrorReport(p1, p2, StackDetails, p3)
		
		if self._processErrorReportMethod ~= nil then
			ErrorReport = self._processErrorReportMethod(ErrorReport)
		end
		t = { backtraceReport = ErrorReport, log = self:_generateLog() }
	end
	self._errorQueue:addError(Formatted, t)
end

function BacktraceReporterModule:_reportErrorFromErrorQueue(_, p1, ErrorCount)
	local BacktraceReport = p1.backtraceReport
	local Log = p1.log
	BacktraceReport:addAttributes({ ErrorCount = ErrorCount })
	self:sendErrorReport(BacktraceReport, Log)
end

local IAttributesFunction = BacktraceReportModule.IAttributes

function BacktraceReporterModule:updateSharedAttributes(p1)
	-- upvalues: CryoModule (copy), IAttributesFunction (copy), IsStudio (copy)
	local JoinResult = CryoModule.Dictionary.join(self._sharedAttributes, p1)
	local IAttributesResult, IAttributesResult2 = IAttributesFunction(JoinResult)
	
	if not IAttributesResult then
		if not IsStudio and not _G.__DEV__ then return end
		assert(IAttributesResult, IAttributesResult2)
	end
	self._sharedAttributes = JoinResult
end

local IAnnotationsFunction = BacktraceReportModule.IAnnotations

function BacktraceReporterModule:updateSharedAnnotations(p1)
	-- upvalues: CryoModule (copy), IAnnotationsFunction (copy), IsStudio (copy)
	local JoinResult = CryoModule.Dictionary.join(self._sharedAnnotations, p1)
	local IAnnotationsResult, IAnnotationsResult2 = IAnnotationsFunction(JoinResult)
	
	if not IAnnotationsResult then
		if not IsStudio and not _G.__DEV__ then return end
		assert(IAnnotationsResult, IAnnotationsResult2)
	end
	self._sharedAnnotations = JoinResult
end

function BacktraceReporterModule:reportAllErrors()
	if self._errorQueue ~= nil then
		self._errorQueue:reportAllErrors()
	end
end

function BacktraceReporterModule:stop()
	self._isEnabled = false
	
	if self._errorQueue ~= nil then
		self:reportAllErrors()
		self._errorQueue:stopTimer()
	end
end

return BacktraceReporterModule