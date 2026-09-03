local parent = script:FindFirstAncestor("ErrorReporters").Parent
local client = require(parent.SentrySdk).Client
local runService = game:GetService("RunService")
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local errorQueueModule = require(script.Parent.Parent.ErrorQueue)
local fIntOldestUAVersionToReportErrorsModule = require(script.Parent.Parent.FIntOldestUAVersionToReportErrors)
local errorReportModule = require(script.Parent.ErrorReport)
local sentryReporterUtilityModule = require(script.Parent.SentryReporterUtility)
local constantsModule = require(script.Parent.Constants)
local fFlagLuaAppSentryStampOccurrenceTimeModule = require(script.Parent.Flags.FFlagLuaAppSentryStampOccurrenceTime)
local iAttributes = errorReportModule.IAttributes
local iAnnotations = errorReportModule.IAnnotations
local var1 = runService:IsStudio()
local sentryReportBreadcrumbs = game:DefineFastFlag("SentryReportBreadcrumbs", false)

local function _(p1)
	local p0Count = #p1
	
	if p0Count <= 100 then
		return p1
	end
	local t = {}
	
	for i = p0Count - 100 + 1, p0Count do
		table.insert(t, p1[i])
	end
	return t
end

local _ = function(p2)
	local var2 = string.len(p2)
	
	if var2 <= 20971520 then
		return p2, false
	end
	local formattedText = string.format("[LOG TRUNCATED - Original size: %.2f MB, kept latest %.2f MB]\n\n", var2 / 1048576, 20)
	
	return formattedText .. string.sub(p2, var2 - (20971520 - string.len(formattedText)) + 1), true
end

local t = {}
t.__index = t

local _ = function(p2, p3, p4, p5)
	-- upvalues: client (ref)
	return client:new({ dsn = p2, environment = p3, release = p4 }, p5)
end

local _ = function(p2, p3)
	return string.format("%s | %s", p2 or "", p3 or "")
end

local var2 = tModule.strictInterface({
	httpService = tModule.some(tModule.instanceOf("HttpService"), tModule.interface({
		JSONEncode = tModule.callback,
		JSONDecode = tModule.callback,
		RequestInternal = tModule.callback
	})),
	processErrorReportMethod = tModule.optional(tModule.callback),
	queueOptions = tModule.optional(tModule.table),
	generateLogMethod = tModule.optional(tModule.callback),
	logIntervalInSeconds = tModule.optional(tModule.numberPositive),
	dsn = tModule.string,
	environment = tModule.optional(tModule.string),
	release = tModule.optional(tModule.string),
	errorQueuedCallback = tModule.optional(tModule.callback),
	errorFlushedCallback = tModule.optional(tModule.callback),
	sentryClientSuccessCallback = tModule.optional(tModule.callback),
	sentryClientFailureCallback = tModule.optional(tModule.callback),
	logAttachmentSuccessCallback = tModule.optional(tModule.callback),
	logAttachmentFailureCallback = tModule.optional(tModule.callback)
})

function t.new(p2)
	-- upvalues: var2 (ref), var1 (ref), client (ref), t (ref), errorQueueModule (ref)
	local var3, var4 = var2(p2)
	
	if not var3 then
		if var1 then
			error("invalid arguments for SentryReporter: " .. var18)
		else
			return nil
		end
	end
	local t_1 = {
		_isEnabled = true,
		_errorQueue = nil,
		_lastLogTime = 0,
		_httpService = p2.httpService,
		_processErrorReportMethod = p2.processErrorReportMethod,
		_sharedAttributes = {},
		_sharedAnnotations = {},
		_generateLogMethod = p2.generateLogMethod,
		_logIntervalInSeconds = p2.logIntervalInSeconds or 5,
		_dsn = p2.dsn,
		_environment = p2.environment,
		_release = p2.release,
		_sentryClient = client:new({
			dsn = p2.dsn,
			environment = p2.environment,
			release = p2.release
		}, p2.httpService),
		_errorQueuedCallback = p2.errorQueuedCallback or nil,
		_errorFlushedCallback = p2.errorFlushedCallback or nil,
		_sentryClientSuccessCallback = p2.sentryClientSuccessCallback or nil,
		_sentryClientFailureCallback = p2.sentryClientFailureCallback or nil,
		_logAttachmentSuccessCallback = p2.logAttachmentSuccessCallback or nil,
		_logAttachmentFailureCallback = p2.logAttachmentFailureCallback or nil
	}
	setmetatable(t_1, t)
	local var5 = errorQueueModule.new(function(_, p3, p4)
		-- upvalues: t_1 (ref)
		if t_1:sendErrorReport(p3.errorReport, p3.log) and t_1._errorFlushedCallback ~= nil then
			t_1._errorFlushedCallback(p4)
		end
	end, p2.queueOptions)
	t_1._errorQueue = var5
	var5:startTimer()
	
	return t_1
end

function t.isTooOldToReportErrors(_)
	-- upvalues: runService (ref), fIntOldestUAVersionToReportErrorsModule (ref)
	local var3 = tonumber(string.match(runService:GetRobloxVersion(), ".(%d+)."))
	
	return if var3 then var3 < fIntOldestUAVersionToReportErrorsModule else false
end

function t:_sendLogAttachment(p2, p3)
	-- upvalues: var1 (ref)
	local var3, var4
	local var5 = string.len(p3)
	local var6 = string.len(p3)
	
	if var6 <= 20971520 then
		var3 = p3
		var4 = false
	else
		local formattedText = string.format("[LOG TRUNCATED - Original size: %.2f MB, kept latest %.2f MB]\n\n", var6 / 1048576, 20)
		var3 = formattedText .. string.sub(p3, var6 - (20971520 - string.len(formattedText)) + 1)
		var4 = true
	end
	if var4 and var1 then
		print("[Sentry] " .. string.format("Log attachment truncated: original %.2f MB, sending latest %.2f MB", var5 / 1048576, 20))
	end
	local list = {
		{
			filename = "app.log",
			content_type = "text/plain",
			data = var3
		}
	}
	
	if var1 and not var4 then
		print("[Sentry] " .. string.format("Sending log attachment for event: %s (%.2f KB)", p2, var5 / 1024))
	end
	self._sentryClient:send_event_with_attachments(p2, list, function(p4, p5, _)
		-- upvalues: var1 (copy), p2 (ref), self (ref)
		if p4 then
			if var1 then
				print("[Sentry] Successfully attached log to event:", p2)
			end
			if self._logAttachmentSuccessCallback == nil then
				return
			else
				self._logAttachmentSuccessCallback()
				
				return
			end
		elseif var1 then
			local var7 = type(p5) ~= "table" and ((if type(p5) ~= "table" then p5.error else nil) or "unknown error")
			warn("[Sentry] Failed to attach log:", var7)
		end
		if self._logAttachmentFailureCallback ~= nil then
			self._logAttachmentFailureCallback(p5)
		end
	end)
end

function t:_handleSentryExceptionCallback(p2, p3, p4, p5)
	-- upvalues: var1 (ref)
	if p2 then
		if var1 then
			print("[Sentry] Successfully reported error to Sentry:", p4)
		end
		if self._sentryClientSuccessCallback ~= nil then
			self._sentryClientSuccessCallback()
		end
		if p5 and p4 then
			self:_sendLogAttachment(p4, p5)
			
			return
		end
	elseif var1 then
		local var3 = type(p3) ~= "table" and ((if type(p3) ~= "table" then p3.error else nil) or "unknown error")
		warn("[Sentry] Failed to report error to Sentry:", var3)
	end
	if self._sentryClientFailureCallback ~= nil then
		self._sentryClientFailureCallback(p3)
	end
end

function t:sendErrorReport(p2, p3)
	-- upvalues: var1 (ref), constantsModule (ref), sentryReporterUtilityModule (ref), sentryReportBreadcrumbs (ref), fFlagLuaAppSentryStampOccurrenceTimeModule (ref)
	if not self._isEnabled then
		return false
	elseif self:isTooOldToReportErrors() then
		return false
	elseif var1 then
		assert(p2:validate())
	end
	local message = p2.message or "Unknown error message"
	local level = p2.level or constantsModule.DEFAULT_ERROR_LEVEL
	local var3 = sentryReporterUtilityModule.parseErrorToContext(p2)
	local var4 = sentryReporterUtilityModule.parseThreadsToSentry(p2.threads)
	local stacktrace = nil
	
	if var4 and var4.values then
		for i, v in ipairs(var4.values) do
			if v.main == true or v.crashed == true then
				stacktrace = v.stacktrace
				break
			end
		end
	end
	local var5 = nil
	
	if sentryReportBreadcrumbs and p2.breadcrumbs and #p2.breadcrumbs > 0 then
		local breadcrumbs = p2.breadcrumbs
		local breadcrumbsCount = #breadcrumbs
		
		if breadcrumbsCount <= 100 then
			var5 = breadcrumbs
		else
			local t = {}
			
			for i = breadcrumbsCount - 100 + 1, breadcrumbsCount do
				table.insert(t, breadcrumbs[i])
			end
			var5 = t
		end
	end
	if var1 then
		print("[Sentry] Report Context:", var3)
		print("[Sentry] Threads:", var4)
		print("[Sentry] Main Stacktrace:", stacktrace)
		print("[Sentry] Level:", level)
		print("[Sentry] Breadcrumbs:", var5)
	end
	self._sentryClient:capture_exception({
		type = "LuaError",
		message = message,
		stacktrace = stacktrace
	}, level, var3, var4, function(p4, p5, p6)
		-- upvalues: self (ref), p3 (ref)
		self:_handleSentryExceptionCallback(p4, p5, p6, p3)
	end, var5, if fFlagLuaAppSentryStampOccurrenceTimeModule then p2.timestamp else nil)
	
	return true
end

function t._sendLogToReport(_, _, p4)
	if type(p4) == "string" and #p4 ~= 0 then
		pcall(function() end)
		
		return
	end
end

function t:_generateLog()
	if self._generateLogMethod ~= nil and self._logIntervalInSeconds < tick() - self._lastLogTime then
		self._lastLogTime = tick()
		local ok, status = pcall(function()
			-- upvalues: self (ref)
			return self._generateLogMethod()
		end)
		
		return if ok and type(status) == "string" and #status > 0 then status else nil
	end
end

function t:_generateErrorReport(p4, p5, p6, p7, p8)
	-- upvalues: cryoModule (ref), errorReportModule (ref), fFlagLuaAppSentryStampOccurrenceTimeModule (ref)
	local var6
	local _ = nil
	
	if type(p6) == "table" then
		var6 = errorReportModule.fromDetails(if p8 ~= nil then p6 else cryoModule.Dictionary.join(p6, { level = p8 }))
	else
		var6 = errorReportModule.fromMessageAndStack(p4, p5, p8)
		
		if type(p6) == "string" then
			var6:addAnnotations({ stackDetails = p6 })
		end
	end
	if fFlagLuaAppSentryStampOccurrenceTimeModule then
		var6.timestamp = os.time()
	end
	if p7 ~= nil then
		var6:addCustomMetadata(p7)
	end
	var6:addAttributes(self._sharedAttributes)
	
	if self._sharedAnnotations and next(self._sharedAnnotations) ~= nil then
		var6:addAnnotations(self._sharedAnnotations)
	end
	if self._processErrorReportMethod ~= nil then
		var6 = self._processErrorReportMethod(var6)
	end
	return var6, self:_generateLog()
end

function t:reportErrorImmediately(p4, p5, p6, p7, p8)
	if self._isEnabled then
		local var6, var7 = self:_generateErrorReport(p4, p5, p6, p7, p8)
		self:sendErrorReport(var6, var7)
		
		return
	end
end

function t:reportErrorDeferred(p4, p5, p6, p7, p8)
	if not self._isEnabled then return end
	local formattedText = string.format("%s | %s", p4 or "", p5 or "")
	local t = { errorReport = nil, log = nil }
	
	if not self._errorQueue:hasError(formattedText) then
		var42, formattedText = self:_generateErrorReport(p4, p5, p6, p7, p8)
		t = { errorReport = var42, log = formattedText }
	end
	if self._errorQueuedCallback ~= nil then
		self._errorQueuedCallback()
	end
	self._errorQueue:addError(formattedText, t)
end

function t:reportAllErrors()
	if self._errorQueue ~= nil then
		self._errorQueue:reportAllErrors()
	end
end

function t:stop()
	self._isEnabled = false
	
	if self._errorQueue ~= nil then
		self:reportAllErrors()
		self._errorQueue:stopTimer()
	end
end

function t:updateSharedAttributes(p4)
	-- upvalues: cryoModule (ref), iAttributes (ref), var1 (ref)
	local var6 = cryoModule.Dictionary.join(self._sharedAttributes, p4)
	local var7, var8 = iAttributes(var6)
	
	if not var7 then
		if var1 then
			assert(var7, var8)
		else
			return
		end
	end
	self._sharedAttributes = var6
end

function t:setTag(p4, p5)
	self._sentryClient:set_tag(p4, p5)
end

function t:setUser(p4)
	self._sentryClient:set_user(p4)
end

function t:updateSharedAnnotations(p4)
	-- upvalues: cryoModule (ref), iAnnotations (ref), var1 (ref)
	local var6 = cryoModule.Dictionary.join(self._sharedAnnotations, p4)
	local var7, var8 = iAnnotations(var6)
	
	if not var7 then
		if var1 then
			assert(var7, var8)
		else
			return
		end
	end
	self._sharedAnnotations = var6
end

return t