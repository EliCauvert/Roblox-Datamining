local Parent = script:FindFirstAncestor("ErrorReporters").Parent
local Client = require(Parent.SentrySdk).Client
local RunService = game:GetService("RunService")
local CryoModule = require(Parent.Cryo)
local TModule = require(Parent.t)
local ErrorQueueModule = require(script.Parent.Parent.ErrorQueue)
local FIntOldestUAVersionToReportErrorsModule = require(script.Parent.Parent.FIntOldestUAVersionToReportErrors)
local FIntSentryErrorLevelQueueTimeLimitSecondsModule = require(script.Parent.Parent.FIntSentryErrorLevelQueueTimeLimitSeconds)
local FIntSentryDebugLevelQueueTimeLimitSecondsModule = require(script.Parent.Parent.FIntSentryDebugLevelQueueTimeLimitSeconds)
local FFlagSentrySplitQueuesBySeverityModule = require(script.Parent.Parent.FFlagSentrySplitQueuesBySeverity)
local ErrorReportModule = require(script.Parent.ErrorReport)
local SentryReporterUtilityModule = require(script.Parent.SentryReporterUtility)
local ConstantsModule = require(script.Parent.Constants)
local FFlagLuaAppSentryStampOccurrenceTimeModule = require(script.Parent.Flags.FFlagLuaAppSentryStampOccurrenceTime)
local IAttributesFunction = ErrorReportModule.IAttributes
local IAnnotationsFunction = ErrorReportModule.IAnnotations
local IsDevelopmentModeModule = require(script.Parent.isDevelopmentMode)
local SentryReportBreadcrumbs = game:DefineFastFlag("SentryReportBreadcrumbs", false)

local function _(p1) --[[ Line: 55 | Named "latestBreadcrumbs" ]]
	local CountP0 = #p1
	
	if CountP0 <= 100 then
		return p1
	end
	local List = {}
	
	for i = CountP0 - 100 + 1, CountP0 do
		table.insert(List, p1[i])
	end
	return List
end

local _ = function(Text: string) --[[ Line: 75 | Named "truncateLog" ]]
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

local _ = function(Dsn, Environment, Release, p2) --[[ Line: 110 | Named "createSentryClient" ]]
	-- upvalues: Client (copy)
	return Client:new({ dsn = Dsn, environment = Environment, release = Release }, p2)
end

local _ = function(p2, p3): string --[[ Line: 157 | Named "buildErrorKey" ]]
	return string.format("%s | %s", p2 or "", p3 or "")
end

local StrictInterfaceResult = TModule.strictInterface({
	httpService = TModule.some(TModule.instanceOf("HttpService"), TModule.interface({
		JSONEncode = TModule.callback,
		JSONDecode = TModule.callback,
		RequestInternal = TModule.callback
	})),
	processErrorReportMethod = TModule.optional(TModule.callback),
	debugQueueOptions = TModule.optional(TModule.table),
	errorQueueOptions = TModule.optional(TModule.table),
	generateLogMethod = TModule.optional(TModule.callback),
	logIntervalInSeconds = TModule.optional(TModule.numberPositive),
	dsn = TModule.string,
	environment = TModule.optional(TModule.string),
	release = TModule.optional(TModule.string),
	errorQueuedCallback = TModule.optional(TModule.callback),
	errorFlushedCallback = TModule.optional(TModule.callback),
	sentryClientSuccessCallback = TModule.optional(TModule.callback),
	sentryClientFailureCallback = TModule.optional(TModule.callback),
	logAttachmentSuccessCallback = TModule.optional(TModule.callback),
	logAttachmentFailureCallback = TModule.optional(TModule.callback),
	disableDevelopmentLogging = TModule.optional(TModule.boolean)
})

function SentryReporterModule.new(ReportQueuedError) --[[ Line: 195 ]]
	-- upvalues: StrictInterfaceResult (copy), IsDevelopmentModeModule (copy), Client (copy), SentryReporterModule (copy), FFlagSentrySplitQueuesBySeverityModule (copy), CryoModule (copy), FIntSentryDebugLevelQueueTimeLimitSecondsModule (copy), ErrorQueueModule (copy), FIntSentryErrorLevelQueueTimeLimitSecondsModule (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(ReportQueuedError)
	
	if not StrictInterfaceResultResult then
		if not IsDevelopmentModeModule then
			return nil
		end
		error("invalid arguments for SentryReporter: " .. StrictInterfaceResultResult2)
	end
	local config = {
		_isEnabled = true,
		_debugLevelQueue = nil,
		_errorLevelQueue = nil,
		_lastLogTime = 0,
		_httpService = ReportQueuedError.httpService,
		_processErrorReportMethod = ReportQueuedError.processErrorReportMethod,
		_sharedAttributes = {},
		_sharedAnnotations = {},
		_generateLogMethod = ReportQueuedError.generateLogMethod,
		_logIntervalInSeconds = ReportQueuedError.logIntervalInSeconds or 5,
		_dsn = ReportQueuedError.dsn,
		_environment = ReportQueuedError.environment,
		_release = ReportQueuedError.release,
		_sentryClient = Client:new({
			dsn = ReportQueuedError.dsn,
			environment = ReportQueuedError.environment,
			release = ReportQueuedError.release
		}, ReportQueuedError.httpService),
		_errorQueuedCallback = ReportQueuedError.errorQueuedCallback or nil,
		_errorFlushedCallback = ReportQueuedError.errorFlushedCallback or nil,
		_sentryClientSuccessCallback = ReportQueuedError.sentryClientSuccessCallback or nil,
		_sentryClientFailureCallback = ReportQueuedError.sentryClientFailureCallback or nil,
		_logAttachmentSuccessCallback = ReportQueuedError.logAttachmentSuccessCallback or nil,
		_logAttachmentFailureCallback = ReportQueuedError.logAttachmentFailureCallback or nil,
		_shouldLogDevelopmentInfo = IsDevelopmentModeModule and ReportQueuedError.disableDevelopmentLogging ~= true
	}
	setmetatable(config, SentryReporterModule)
	
	local function reportQueuedError(_, p2, p3) --[[ Line: 242 ]]
		-- upvalues: config (copy)
		if config:sendErrorReport(p2.errorReport, p2.log) and config._errorFlushedCallback ~= nil then
			config._errorFlushedCallback(p3)
		end
	end
	
	local NewErrorQueue = ErrorQueueModule.new(reportQueuedError, if FFlagSentrySplitQueuesBySeverityModule then CryoModule.Dictionary.join({
		queueTimeLimit = FIntSentryDebugLevelQueueTimeLimitSecondsModule
	}, ReportQueuedError.debugQueueOptions or {}) else ReportQueuedError.debugQueueOptions)
	config._debugLevelQueue = NewErrorQueue
	NewErrorQueue:startTimer()
	
	if FFlagSentrySplitQueuesBySeverityModule then
		local NewErrorQueue1 = ErrorQueueModule.new(reportQueuedError, CryoModule.Dictionary.join({
			flushImmediately = true,
			queueTimeLimit = FIntSentryErrorLevelQueueTimeLimitSecondsModule
		}, ReportQueuedError.errorQueueOptions or {}))
		config._errorLevelQueue = NewErrorQueue1
		NewErrorQueue1:startTimer()
	end
	return config
end

function SentryReporterModule:isTooOldToReportErrors(): boolean --[[ Line: 287 ]]
	-- upvalues: RunService (copy), FIntOldestUAVersionToReportErrorsModule (copy)
	local Number: number? = tonumber(string.match(RunService:GetRobloxVersion(), ".(%d+)."))
	
	return Number and Number < FIntOldestUAVersionToReportErrorsModule or false
end

function SentryReporterModule:_sendLogAttachment(p2, Text: string) --[[ Line: 311 ]]
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
	if Flag and self._shouldLogDevelopmentInfo then
		print("[Sentry] " .. string.format("Log attachment truncated: original %.2f MB, sending latest %.2f MB", Length / 1048576, 20))
	end
	local list = {
		{
			filename = "app.log",
			content_type = "text/plain",
			data = Data
		}
	}
	
	if self._shouldLogDevelopmentInfo and not Flag then
		print("[Sentry] " .. string.format("Sending log attachment for event: %s (%.2f KB)", p2, Length / 1024))
	end
	self._sentryClient:send_event_with_attachments(p2, list, function(p3, p4, _) --[[ Line: 342 ]]
		-- upvalues: self (copy), p2 (copy)
		if p3 then
			if self._shouldLogDevelopmentInfo then
				print("[Sentry] Successfully attached log to event:", p2)
			end
			if self._logAttachmentSuccessCallback ~= nil then
				self._logAttachmentSuccessCallback()
				
				return
			end
		else
			if self._shouldLogDevelopmentInfo then
				warn("[Sentry] Failed to attach log:", if type(p4) == "table" then p4.error or "unknown error" else tostring(p4))
			end
			if self._logAttachmentFailureCallback ~= nil then
				self._logAttachmentFailureCallback(p4)
			end
		end
	end)
end

function SentryReporterModule:_handleSentryExceptionCallback(p2, p3, p4, p5) --[[ Line: 375 ]]
	if p2 then
		if self._shouldLogDevelopmentInfo then
			print("[Sentry] Successfully reported error to Sentry:", p4)
		end
		if self._sentryClientSuccessCallback ~= nil then
			self._sentryClientSuccessCallback()
		end
		if p5 and p4 then
			self:_sendLogAttachment(p4, p5)
			
			return
		end
	else
		if self._shouldLogDevelopmentInfo then
			warn("[Sentry] Failed to report error to Sentry:", if type(p3) == "table" then p3.error or "unknown error" else tostring(p3))
		end
		if self._sentryClientFailureCallback ~= nil then
			self._sentryClientFailureCallback(p3)
		end
	end
end

function SentryReporterModule:sendErrorReport(ErrorReport, Log): boolean --[[ Line: 407 ]]
	-- upvalues: IsDevelopmentModeModule (copy), ConstantsModule (copy), SentryReporterUtilityModule (copy), SentryReportBreadcrumbs (copy), FFlagLuaAppSentryStampOccurrenceTimeModule (copy)
	if not self._isEnabled then
		return false
	end
	if self:isTooOldToReportErrors() then
		return false
	end
	if IsDevelopmentModeModule then
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
	local v1 = nil
	
	if SentryReportBreadcrumbs and ErrorReport.breadcrumbs and #ErrorReport.breadcrumbs > 0 then
		local Breadcrumbs = ErrorReport.breadcrumbs
		local CountBreadcrumbs = #Breadcrumbs
		
		if CountBreadcrumbs <= 100 then
			v1 = Breadcrumbs
		else
			local List = {}
			
			for i = CountBreadcrumbs - 100 + 1, CountBreadcrumbs do
				table.insert(List, Breadcrumbs[i])
			end
			v1 = List
		end
	end
	if self._shouldLogDevelopmentInfo then
		print("[Sentry] Report Context:", ParseErrorToContextResult)
		print("[Sentry] Threads:", ParseThreadsToSentryResult)
		print("[Sentry] Main Stacktrace:", Stacktrace)
		print("[Sentry] Level:", Level)
		print("[Sentry] Breadcrumbs:", v1)
	end
	self._sentryClient:capture_exception({
		type = "LuaError",
		message = Message,
		stacktrace = Stacktrace
	}, Level, ParseErrorToContextResult, ParseThreadsToSentryResult, function(p2, p3, p4) --[[ Line: 467 ]]
		-- upvalues: self (copy), Log (copy)
		self:_handleSentryExceptionCallback(p2, p3, p4, Log)
	end, v1, if FFlagLuaAppSentryStampOccurrenceTimeModule then ErrorReport.timestamp else nil, ErrorReport.tags)
	
	return true
end

function SentryReporterModule:_sendLogToReport(_, p2) --[[ Line: 484 ]]
	if type(p2) == "string" and #p2 ~= 0 then
		pcall(function() --[[ Line: 489 ]] end)
		
		return
	end
end

function SentryReporterModule:_generateLog() --[[ Line: 499 ]]
	if self._generateLogMethod ~= nil and self._logIntervalInSeconds < tick() - self._lastLogTime then
		self._lastLogTime = tick()
		local Success, Result = pcall(function() --[[ Line: 503 ]]
			-- upvalues: self (copy)
			return self._generateLogMethod()
		end)
		
		if Success and type(Result) == "string" and #Result > 0 then
			return Result
		end
	end
	return nil
end

function SentryReporterModule:_generateErrorReport(p2, p3, StackDetails, p4, Level) --[[ Line: 525 ]]
	-- upvalues: CryoModule (copy), ErrorReportModule (copy), FFlagLuaAppSentryStampOccurrenceTimeModule (copy)
	local FromDetailsResult = nil
	if type(StackDetails) == "table" then
		FromDetailsResult = ErrorReportModule.fromDetails(if Level == nil then StackDetails else CryoModule.Dictionary.join(StackDetails, { level = Level }))
	else
		FromDetailsResult = ErrorReportModule.fromMessageAndStack(p2, p3, Level)
		
		if type(StackDetails) == "string" then
			FromDetailsResult:addAnnotations({ stackDetails = StackDetails })
		end
	end
	if FFlagLuaAppSentryStampOccurrenceTimeModule then
		FromDetailsResult.timestamp = os.time()
	end
	if p4 ~= nil then
		FromDetailsResult:addCustomMetadata(p4)
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

function SentryReporterModule:reportErrorImmediately(p2, p3, StackDetails, p4, Level) --[[ Line: 589 ]]
	if self._isEnabled then
		local ErrorReport, ErrorReport2 = self:_generateErrorReport(p2, p3, StackDetails, p4, Level)
		self:sendErrorReport(ErrorReport, ErrorReport2)
		
		return
	end
end

function SentryReporterModule:_getQueueForLevel(p2) --[[ Line: 605 ]]
	-- upvalues: ConstantsModule (copy)
	if self._errorLevelQueue == nil or (p2 or ConstantsModule.DEFAULT_ERROR_LEVEL) ~= "error" then
		return self._debugLevelQueue
	else
		return self._errorLevelQueue
	end
end

function SentryReporterModule:reportErrorDeferred(p2, p3, StackDetails, p4, Level) --[[ Line: 623 ]]
	if not self._isEnabled then return end
	local Formatted = string.format("%s | %s", p2 or "", p3 or "")
	local QueueForLevel = self:_getQueueForLevel(Level)
	local config = { errorReport = nil, log = nil }
	
	if not QueueForLevel:hasError(Formatted) then
		local ErrorReport, ErrorReport2 = self:_generateErrorReport(p2, p3, StackDetails, p4, Level)
		config = { errorReport = ErrorReport, log = ErrorReport2 }
	end
	if self._errorQueuedCallback ~= nil then
		self._errorQueuedCallback()
	end
	QueueForLevel:addError(Formatted, config)
end

function SentryReporterModule:reportAllErrors() --[[ Line: 664 ]]
	if self._debugLevelQueue ~= nil then
		self._debugLevelQueue:reportAllErrors()
	end
	if self._errorLevelQueue ~= nil then
		self._errorLevelQueue:reportAllErrors()
	end
end

function SentryReporterModule:stop() --[[ Line: 677 ]]
	self._isEnabled = false
	
	if self._debugLevelQueue ~= nil then
		self:reportAllErrors()
		self._debugLevelQueue:stopTimer()
	end
	if self._errorLevelQueue ~= nil then
		self._errorLevelQueue:stopTimer()
	end
end

function SentryReporterModule:updateSharedAttributes(p2) --[[ Line: 699 ]]
	-- upvalues: CryoModule (copy), IAttributesFunction (copy), IsDevelopmentModeModule (copy)
	local JoinResult = CryoModule.Dictionary.join(self._sharedAttributes, p2)
	local IAttributesResult, IAttributesResult2 = IAttributesFunction(JoinResult)
	
	if not IAttributesResult then
		if not IsDevelopmentModeModule then return end
		assert(IAttributesResult, IAttributesResult2)
	end
	self._sharedAttributes = JoinResult
end

function SentryReporterModule:setTag(p2, p3) --[[ Line: 723 ]]
	self._sentryClient:set_tag(p2, p3)
end

function SentryReporterModule:setUser(p2) --[[ Line: 732 ]]
	self._sentryClient:set_user(p2)
end

function SentryReporterModule:updateSharedAnnotations(p2) --[[ Line: 741 ]]
	-- upvalues: CryoModule (copy), IAnnotationsFunction (copy), IsDevelopmentModeModule (copy)
	local JoinResult = CryoModule.Dictionary.join(self._sharedAnnotations, p2)
	local IAnnotationsResult, IAnnotationsResult2 = IAnnotationsFunction(JoinResult)
	
	if not IAnnotationsResult then
		if not IsDevelopmentModeModule then return end
		assert(IAnnotationsResult, IAnnotationsResult2)
	end
	self._sharedAnnotations = JoinResult
end

return SentryReporterModule