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
local iAttributes = errorReportModule.IAttributes
local iAnnotations = errorReportModule.IAnnotations
local var1 = runService:IsStudio()

local function _(p1)
	local var2 = string.len(p1)
	
	if var2 <= 20971520 then
		return p1, false
	end
	local formattedText = string.format("[LOG TRUNCATED - Original size: %.2f MB, kept latest %.2f MB]\n\n", var2 / 1048576, 20)
	
	return formattedText .. string.sub(p1, var2 - (20971520 - string.len(formattedText)) + 1), true
end

local t = {}
t.__index = t

local _ = function(p1, p2, p3, p4)
	-- upvalues: client (ref)
	return client:new({ dsn = p1, environment = p2, release = p3 }, p4)
end

local _ = function(p1, p2)
	return string.format("%s | %s", p1 or "", p2 or "")
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
	sentryClientSuccessCallback = tModule.optional(tModule.callback),
	sentryClientFailureCallback = tModule.optional(tModule.callback),
	logAttachmentSuccessCallback = tModule.optional(tModule.callback),
	logAttachmentFailureCallback = tModule.optional(tModule.callback)
})

function t.new(p1)
	-- upvalues: var2 (ref), var1 (ref), client (ref), t (ref), errorQueueModule (ref)
	local var3, var4 = var2(p1)
	
	if not var3 then
		if var1 then
			error("invalid arguments for SentryReporter: " .. var14)
		else
			return nil
		end
	end
	local t_1 = {
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
		_sentryClient = client:new({
			dsn = p1.dsn,
			environment = p1.environment,
			release = p1.release
		}, p1.httpService),
		_sentryClientSuccessCallback = p1.sentryClientSuccessCallback or nil,
		_sentryClientFailureCallback = p1.sentryClientFailureCallback or nil,
		_logAttachmentSuccessCallback = p1.logAttachmentSuccessCallback or nil,
		_logAttachmentFailureCallback = p1.logAttachmentFailureCallback or nil
	}
	setmetatable(t_1, t)
	local var5 = errorQueueModule.new(function(_, p2, _)
		-- upvalues: t_1 (ref)
		t_1:sendErrorReport(p2.errorReport, p2.log)
	end, p1.queueOptions)
	t_1._errorQueue = var5
	var5:startTimer()
	
	return t_1
end

function t.isTooOldToReportErrors(_)
	-- upvalues: runService (ref), fIntOldestUAVersionToReportErrorsModule (ref)
	local var3 = tonumber(string.match(runService:GetRobloxVersion(), ".(%d+)."))
	
	return if var3 then var3 < fIntOldestUAVersionToReportErrorsModule else false
end

function t:_sendLogAttachment(p1, p2)
	-- upvalues: var1 (ref)
	local var3, var4
	local var5 = string.len(p2)
	local var6 = string.len(p2)
	
	if var6 <= 20971520 then
		var3 = p2
		var4 = false
	else
		local formattedText = string.format("[LOG TRUNCATED - Original size: %.2f MB, kept latest %.2f MB]\n\n", var6 / 1048576, 20)
		var3 = formattedText .. string.sub(p2, var6 - (20971520 - string.len(formattedText)) + 1)
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
		print("[Sentry] " .. string.format("Sending log attachment for event: %s (%.2f KB)", p1, var5 / 1024))
	end
	self._sentryClient:send_event_with_attachments(p1, list, function(p3, p4, _)
		-- upvalues: var1 (copy), p1 (ref), self (ref)
		if p3 then
			if var1 then
				print("[Sentry] Successfully attached log to event:", p1)
			end
			if self._logAttachmentSuccessCallback == nil then
				return
			else
				self._logAttachmentSuccessCallback()
				
				return
			end
		elseif var1 then
			local var7 = type(p4) ~= "table" and ((if type(p4) ~= "table" then p4.error else nil) or "unknown error")
			warn("[Sentry] Failed to attach log:", var7)
		end
		if self._logAttachmentFailureCallback ~= nil then
			self._logAttachmentFailureCallback(p4)
		end
	end)
end

function t:_handleSentryExceptionCallback(p1, p2, p3, p4)
	-- upvalues: var1 (ref)
	if p1 then
		if var1 then
			print("[Sentry] Successfully reported error to Sentry:", p3)
		end
		if self._sentryClientSuccessCallback ~= nil then
			self._sentryClientSuccessCallback()
		end
		if p4 and p3 then
			self:_sendLogAttachment(p3, p4)
			
			return
		end
	elseif var1 then
		local var3 = type(p2) ~= "table" and ((if type(p2) ~= "table" then p2.error else nil) or "unknown error")
		warn("[Sentry] Failed to report error to Sentry:", var3)
	end
	if self._sentryClientFailureCallback ~= nil then
		self._sentryClientFailureCallback(p2)
	end
end

function t:sendErrorReport(p1, p2)
	-- upvalues: var1 (ref), constantsModule (ref), sentryReporterUtilityModule (ref)
	if not self._isEnabled then return end
	if self:isTooOldToReportErrors() then return end
	if var1 then
		assert(p1:validate())
	end
	local message = p1.message or "Unknown error message"
	local level = p1.level or constantsModule.DEFAULT_ERROR_LEVEL
	local var3 = sentryReporterUtilityModule.parseErrorToContext(p1)
	local var4 = sentryReporterUtilityModule.parseThreadsToSentry(p1.threads)
	local stacktrace = nil
	
	if var4 and var4.values then
		for i, v in ipairs(var4.values) do
			if v.main == true or v.crashed == true then
				stacktrace = v.stacktrace
				break
			end
		end
	end
	if var1 then
		print("[Sentry] Report Context:", var3)
		print("[Sentry] Threads:", var4)
		print("[Sentry] Main Stacktrace:", stacktrace)
		print("[Sentry] Level:", level)
	end
	self._sentryClient:capture_exception({
		type = "LuaError",
		message = message,
		stacktrace = stacktrace
	}, level, var3, var4, function(p3, p4, p5)
		-- upvalues: self (ref), p2 (ref)
		self:_handleSentryExceptionCallback(p3, p4, p5, p2)
	end)
end

function t._sendLogToReport(_, _, p3)
	if type(p3) == "string" and #p3 ~= 0 then
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

function t:_generateErrorReport(p3, p4, p5, p6, p7)
	-- upvalues: cryoModule (ref), errorReportModule (ref)
	local var5
	local _ = nil
	
	if type(p5) == "table" then
		var5 = errorReportModule.fromDetails(if p7 ~= nil then p5 else cryoModule.Dictionary.join(p5, { level = p7 }))
	else
		var5 = errorReportModule.fromMessageAndStack(p3, p4, p7)
		
		if type(p5) == "string" then
			var5:addAnnotations({ stackDetails = p5 })
		end
	end
	if p6 ~= nil then
		var5:addCustomMetadata(p6)
	end
	var5:addAttributes(self._sharedAttributes)
	
	if self._sharedAnnotations and next(self._sharedAnnotations) ~= nil then
		var5:addAnnotations(self._sharedAnnotations)
	end
	if self._processErrorReportMethod ~= nil then
		var5 = self._processErrorReportMethod(var5)
	end
	return var5, self:_generateLog()
end

function t:reportErrorImmediately(p3, p4, p5, p6, p7)
	if self._isEnabled then
		local var5, var6 = self:_generateErrorReport(p3, p4, p5, p6, p7)
		self:sendErrorReport(var5, var6)
		
		return
	end
end

function t:reportErrorDeferred(p3, p4, p5, p6, p7)
	if not self._isEnabled then return end
	local formattedText = string.format("%s | %s", p3 or "", p4 or "")
	local t = { errorReport = nil, log = nil }
	
	if not self._errorQueue:hasError(formattedText) then
		var35, formattedText = self:_generateErrorReport(p3, p4, p5, p6, p7)
		t = { errorReport = var35, log = formattedText }
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

function t:updateSharedAttributes(p3)
	-- upvalues: cryoModule (ref), iAttributes (ref), var1 (ref)
	local var5 = cryoModule.Dictionary.join(self._sharedAttributes, p3)
	local var6, var7 = iAttributes(var5)
	
	if not var6 then
		if var1 then
			assert(var6, var7)
		else
			return
		end
	end
	self._sharedAttributes = var5
end

function t:setTag(p3, p4)
	self._sentryClient:set_tag(p3, p4)
end

function t:setUser(p3)
	self._sentryClient:set_user(p3)
end

function t:updateSharedAnnotations(p3)
	-- upvalues: cryoModule (ref), iAnnotations (ref), var1 (ref)
	local var5 = cryoModule.Dictionary.join(self._sharedAnnotations, p3)
	local var6, var7 = iAnnotations(var5)
	
	if not var6 then
		if var1 then
			assert(var6, var7)
		else
			return
		end
	end
	self._sharedAnnotations = var5
end

return t