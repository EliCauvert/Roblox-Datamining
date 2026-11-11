local Parent = script:FindFirstAncestor("ErrorReporters").Parent
local Client = require(Parent.SentrySdk).Client
local RunService = game:GetService("RunService")
local CryoModule = require(Parent.Cryo)
local TModule = require(Parent.t)
local ErrorQueueModule = require(script.Parent.Parent.ErrorQueue)
local FIntOldestUAVersionToReportErrorsModule = require(script.Parent.Parent.FIntOldestUAVersionToReportErrors)
local ErrorReportModule = require(script.Parent.ErrorReport)
local SentryReporterUtilityModule = require(script.Parent.SentryReporterUtility)
local ConstantsModule = require(script.Parent.Constants)
local IAttributesFunction = ErrorReportModule.IAttributes
local IAnnotationsFunction = ErrorReportModule.IAnnotations
local IsStudio = RunService:IsStudio()

local function _(Text: string)
	local Length = string.len(Text)
	
	if Length <= 20971520 then
		return Text, false
	else
		local Formatted = string.format("[LOG TRUNCATED - Original size: %.2f MB, kept latest %.2f MB]\n\n", Length / 1048576, 20)
		
		return Formatted .. string.sub(Text, Length - (20971520 - string.len(Formatted)) + 1), true
	end
end

local SentryReporterModule = {}
SentryReporterModule.__index = SentryReporterModule

local _ = function(Dsn, Environment, Release, p1)
	-- upvalues: Client (copy)
	return Client:new({ dsn = Dsn, environment = Environment, release = Release }, p1)
end

local _ = function(p1, p2): string
	return string.format("%s | %s", p1 or "", p2 or "")
end

local StrictInterfaceResult = TModule.strictInterface({
	httpService = TModule.some(TModule.instanceOf("HttpService"), TModule.interface({
		JSONEncode = TModule.callback,
		JSONDecode = TModule.callback,
		RequestInternal = TModule.callback
	})),
	processErrorReportMethod = TModule.optional(TModule.callback),
	queueOptions = TModule.optional(TModule.table),
	generateLogMethod = TModule.optional(TModule.callback),
	logIntervalInSeconds = TModule.optional(TModule.numberPositive),
	dsn = TModule.string,
	environment = TModule.optional(TModule.string),
	release = TModule.optional(TModule.string),
	sentryClientSuccessCallback = TModule.optional(TModule.callback),
	sentryClientFailureCallback = TModule.optional(TModule.callback),
	logAttachmentSuccessCallback = TModule.optional(TModule.callback),
	logAttachmentFailureCallback = TModule.optional(TModule.callback)
})

function SentryReporterModule.new(p1)
	-- upvalues: StrictInterfaceResult (copy), IsStudio (copy), Client (copy), SentryReporterModule (copy), ErrorQueueModule (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(p1)
	
	if not StrictInterfaceResultResult then
		if not IsStudio then
			return nil
		end
		error("invalid arguments for SentryReporter: " .. StrictInterfaceResultResult2)
	end
	local config = {
		_isEnabled = true,
		_errorQueue = nil,
		_lastLogTime = 0,
		_httpService = p1.httpService,
		_processErrorReportMethod = p1.processErrorReportMethod,
		_sharedAttributes = {},
		_sharedAnnotations = {},
		_generateLogMethod = p1.generateLogMethod,
		_logIntervalInSeconds = p1.logIntervalInSeconds or 5,
		_dsn = p1.dsn,
		_environment = p1.environment,
		_release = p1.release,
		_sentryClient = Client:new({
			dsn = p1.dsn,
			environment = p1.environment,
			release = p1.release
		}, p1.httpService),
		_sentryClientSuccessCallback = p1.sentryClientSuccessCallback or nil,
		_sentryClientFailureCallback = p1.sentryClientFailureCallback or nil,
		_logAttachmentSuccessCallback = p1.logAttachmentSuccessCallback or nil,
		_logAttachmentFailureCallback = p1.logAttachmentFailureCallback or nil
	}
	setmetatable(config, SentryReporterModule)
	local NewErrorQueue = ErrorQueueModule.new(function(_, p2, _)
		-- upvalues: config (copy)
		config:sendErrorReport(p2.errorReport, p2.log)
	end, p1.queueOptions)
	config._errorQueue = NewErrorQueue
	NewErrorQueue:startTimer()
	
	return config
end

function SentryReporterModule:isTooOldToReportErrors(): boolean
	-- upvalues: RunService (copy), FIntOldestUAVersionToReportErrorsModule (copy)
	local Number: number? = tonumber(string.match(RunService:GetRobloxVersion(), ".(%d+)."))
	
	return Number and Number < FIntOldestUAVersionToReportErrorsModule or false
end

function SentryReporterModule:_sendLogAttachment(p1, Text: string)
	-- upvalues: IsStudio (copy)
	local Length = string.len(Text)
	local Length1 = string.len(Text)
	local Data = nil
	local Flag = nil
	
	if Length1 <= 20971520 then
		Data = Text
		Flag = false
	else
		local Formatted = string.format("[LOG TRUNCATED - Original size: %.2f MB, kept latest %.2f MB]\n\n", Length1 / 1048576, 20)
		Data = Formatted .. string.sub(Text, Length1 - (20971520 - string.len(Formatted)) + 1)
		Flag = true
	end
	if Flag and IsStudio then
		print("[Sentry] " .. string.format("Log attachment truncated: original %.2f MB, sending latest %.2f MB", Length / 1048576, 20))
	end
	local list = {
		{
			filename = "app.log",
			content_type = "text/plain",
			data = Data
		}
	}
	
	if IsStudio and not Flag then
		print("[Sentry] " .. string.format("Sending log attachment for event: %s (%.2f KB)", p1, Length / 1024))
	end
	self._sentryClient:send_event_with_attachments(p1, list, function(p2, p3, _)
		-- upvalues: IsStudio (upval), p1 (copy), self (copy)
		if p2 then
			if IsStudio then
				print("[Sentry] Successfully attached log to event:", p1)
			end
			if self._logAttachmentSuccessCallback ~= nil then
				self._logAttachmentSuccessCallback()
				
				return
			end
		else
			if IsStudio then
				warn("[Sentry] Failed to attach log:", if type(p3) == "table" then p3.error or "unknown error" else tostring(p3))
			end
			if self._logAttachmentFailureCallback ~= nil then
				self._logAttachmentFailureCallback(p3)
			end
		end
	end)
end

function SentryReporterModule:_handleSentryExceptionCallback(p1, p2, p3, p4)
	-- upvalues: IsStudio (copy)
	if p1 then
		if IsStudio then
			print("[Sentry] Successfully reported error to Sentry:", p3)
		end
		if self._sentryClientSuccessCallback ~= nil then
			self._sentryClientSuccessCallback()
		end
		if p4 and p3 then
			self:_sendLogAttachment(p3, p4)
			
			return
		end
	else
		if IsStudio then
			warn("[Sentry] Failed to report error to Sentry:", if type(p2) == "table" then p2.error or "unknown error" else tostring(p2))
		end
		if self._sentryClientFailureCallback ~= nil then
			self._sentryClientFailureCallback(p2)
		end
	end
end

function SentryReporterModule:sendErrorReport(ErrorReport, Log)
	-- upvalues: IsStudio (copy), ConstantsModule (copy), SentryReporterUtilityModule (copy)
	if not self._isEnabled then return end
	if self:isTooOldToReportErrors() then return end
	if IsStudio then
		assert(ErrorReport:validate())
	end
	local Message = ErrorReport.message or "Unknown error message"
	local Level = ErrorReport.level or ConstantsModule.DEFAULT_ERROR_LEVEL
	local ParseErrorToContextResult = SentryReporterUtilityModule.parseErrorToContext(ErrorReport)
	local ParseThreadsToSentryResult = SentryReporterUtilityModule.parseThreadsToSentry(ErrorReport.threads)
	local Stacktrace = nil
	
	if ParseThreadsToSentryResult and ParseThreadsToSentryResult.values then
		for _, value in ipairs(ParseThreadsToSentryResult.values) do
			if value.main == true or value.crashed == true then
				Stacktrace = value.stacktrace
				break
			end
		end
	end
	if IsStudio then
		print("[Sentry] Report Context:", ParseErrorToContextResult)
		print("[Sentry] Threads:", ParseThreadsToSentryResult)
		print("[Sentry] Main Stacktrace:", Stacktrace)
		print("[Sentry] Level:", Level)
	end
	self._sentryClient:capture_exception({
		type = "LuaError",
		message = Message,
		stacktrace = Stacktrace
	}, Level, ParseErrorToContextResult, ParseThreadsToSentryResult, function(p1, p2, p3)
		-- upvalues: self (copy), Log (copy)
		self:_handleSentryExceptionCallback(p1, p2, p3, Log)
	end)
end

function SentryReporterModule:_sendLogToReport(_, p1)
	if type(p1) == "string" and #p1 ~= 0 then
		pcall(function() end)
		
		return
	end
end

function SentryReporterModule:_generateLog()
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

function SentryReporterModule:_generateErrorReport(p1, p2, StackDetails, p3, Level)
	-- upvalues: CryoModule (copy), ErrorReportModule (copy)
	local FromDetailsResult = nil
	if type(StackDetails) == "table" then
		FromDetailsResult = ErrorReportModule.fromDetails(if Level == nil then StackDetails else CryoModule.Dictionary.join(StackDetails, { level = Level }))
	else
		FromDetailsResult = ErrorReportModule.fromMessageAndStack(p1, p2, Level)
		
		if type(StackDetails) == "string" then
			FromDetailsResult:addAnnotations({ stackDetails = StackDetails })
		end
	end
	if p3 ~= nil then
		FromDetailsResult:addCustomMetadata(p3)
	end
	FromDetailsResult:addAttributes(self._sharedAttributes)
	
	if self._sharedAnnotations and next(self._sharedAnnotations) ~= nil then
		FromDetailsResult:addAnnotations(self._sharedAnnotations)
	end
	if self._processErrorReportMethod ~= nil then
		FromDetailsResult = self._processErrorReportMethod(FromDetailsResult)
	end
	return FromDetailsResult, (self:_generateLog())
end

function SentryReporterModule:reportErrorImmediately(p1, p2, StackDetails, p3, Level)
	if self._isEnabled then
		local ErrorReport, ErrorReport2 = self:_generateErrorReport(p1, p2, StackDetails, p3, Level)
		self:sendErrorReport(ErrorReport, ErrorReport2)
		
		return
	end
end

function SentryReporterModule:reportErrorDeferred(p1, p2, StackDetails, p3, Level)
	if not self._isEnabled then return end
	local Formatted = string.format("%s | %s", p1 or "", p2 or "")
	local config = { errorReport = nil, log = nil }
	
	if not self._errorQueue:hasError(Formatted) then
		local ErrorReport, ErrorReport2 = self:_generateErrorReport(p1, p2, StackDetails, p3, Level)
		config = { errorReport = ErrorReport, log = ErrorReport2 }
	end
	self._errorQueue:addError(Formatted, config)
end

function SentryReporterModule:reportAllErrors()
	if self._errorQueue ~= nil then
		self._errorQueue:reportAllErrors()
	end
end

function SentryReporterModule:stop()
	self._isEnabled = false
	
	if self._errorQueue ~= nil then
		self:reportAllErrors()
		self._errorQueue:stopTimer()
	end
end

function SentryReporterModule:updateSharedAttributes(p1)
	-- upvalues: CryoModule (copy), IAttributesFunction (copy), IsStudio (copy)
	local JoinResult = CryoModule.Dictionary.join(self._sharedAttributes, p1)
	local IAttributesResult, IAttributesResult2 = IAttributesFunction(JoinResult)
	
	if not IAttributesResult then
		if not IsStudio then return end
		assert(IAttributesResult, IAttributesResult2)
	end
	self._sharedAttributes = JoinResult
end

function SentryReporterModule:setTag(p1, p2)
	self._sentryClient:set_tag(p1, p2)
end

function SentryReporterModule:setUser(p1)
	self._sentryClient:set_user(p1)
end

function SentryReporterModule:updateSharedAnnotations(p1)
	-- upvalues: CryoModule (copy), IAnnotationsFunction (copy), IsStudio (copy)
	local JoinResult = CryoModule.Dictionary.join(self._sharedAnnotations, p1)
	local IAnnotationsResult, IAnnotationsResult2 = IAnnotationsFunction(JoinResult)
	
	if not IAnnotationsResult then
		if not IsStudio then return end
		assert(IAnnotationsResult, IAnnotationsResult2)
	end
	self._sharedAnnotations = JoinResult
end

return SentryReporterModule