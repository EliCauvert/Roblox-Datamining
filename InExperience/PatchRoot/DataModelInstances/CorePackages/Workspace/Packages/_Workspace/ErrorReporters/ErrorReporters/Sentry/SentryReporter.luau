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
local var8 = runService:IsStudio()

local function _(p0) --[[ line: 43 | named "truncateLog" ]]
	local var11 = string.len(p0)
	
	if var11 <= 20971520 then
		return p0, false
	end
	local formattedText = string.format("[LOG TRUNCATED - Original size: %.2f MB, kept latest %.2f MB]\n\n", var11 / 1048576, 20)
	
	return formattedText .. string.sub(p0, var11 - (20971520 - string.len(formattedText)) + 1), true
end

local t = {}
t.__index = t

local _ = function(p1, p2, p3, p4) --[[ line: 78 | named "createSentryClient" ]]
	-- upvalues: client (ref)
	return client:new({ dsn = p1, environment = p2, release = p3 }, p4)
end

local _ = function(p5, p6) --[[ line: 121 | named "buildErrorKey" ]]
	return string.format("%s | %s", p5 or "", p6 or "")
end

local var10 = tModule.strictInterface({
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

function t.new(p7) --[[ line: 155 ]]
	-- upvalues: var10 (ref), var8 (ref), client (ref), t (ref), errorQueueModule (ref)
	local var13, var14 = var10(p7)
	
	if not var13 then
		if var8 then
			error("invalid arguments for SentryReporter: " .. var14)
		else
			return nil
		end
	end
	local t_1 = {
		_isEnabled = true,
		_errorQueue = nil,
		_lastLogTime = 0,
		_httpService = p7.httpService,
		_processErrorReportMethod = p7.processErrorReportMethod,
		_sharedAttributes = {},
		_sharedAnnotations = {},
		_generateLogMethod = p7.generateLogMethod,
		_logIntervalInSeconds = p7.logIntervalInSeconds or 5,
		_dsn = p7.dsn,
		_environment = p7.environment,
		_release = p7.release,
		_sentryClient = client:new({
			dsn = p7.dsn,
			environment = p7.environment,
			release = p7.release
		}, p7.httpService),
		_sentryClientSuccessCallback = p7.sentryClientSuccessCallback or nil,
		_sentryClientFailureCallback = p7.sentryClientFailureCallback or nil,
		_logAttachmentSuccessCallback = p7.logAttachmentSuccessCallback or nil,
		_logAttachmentFailureCallback = p7.logAttachmentFailureCallback or nil
	}
	setmetatable(t_1, t)
	local var16 = errorQueueModule.new(function(_, p8, _) --[[ line: 196 ]]
		-- upvalues: t_1 (ref)
		t_1:sendErrorReport(p8.errorReport, p8.log)
	end, p7.queueOptions)
	t_1._errorQueue = var16
	var16:startTimer()
	
	return t_1
end

function t.isTooOldToReportErrors(_) --[[ line: 215 ]]
	-- upvalues: runService (ref), fIntOldestUAVersionToReportErrorsModule (ref)
	local var17 = tonumber(string.match(runService:GetRobloxVersion(), ".(%d+)."))
	
	return if var17 then var17 < fIntOldestUAVersionToReportErrorsModule else false
end

function t:_sendLogAttachment(p9, p10) --[[ line: 239 ]]
	-- upvalues: var8 (ref)
	local var20, var21
	local var18 = string.len(p10)
	local var19 = string.len(p10)
	
	if var19 <= 20971520 then
		var20 = p10
		var21 = false
	else
		local formattedText = string.format("[LOG TRUNCATED - Original size: %.2f MB, kept latest %.2f MB]\n\n", var19 / 1048576, 20)
		var20 = formattedText .. string.sub(p10, var19 - (20971520 - string.len(formattedText)) + 1)
		var21 = true
	end
	if var21 and var8 then
		print("[Sentry] " .. string.format("Log attachment truncated: original %.2f MB, sending latest %.2f MB", var18 / 1048576, 20))
	end
	local list = {
		{
			filename = "app.log",
			content_type = "text/plain",
			data = var20
		}
	}
	
	if var8 and not var21 then
		print("[Sentry] " .. string.format("Sending log attachment for event: %s (%.2f KB)", p9, var18 / 1024))
	end
	self._sentryClient:send_event_with_attachments(p9, list, function(p11, p12, _) --[[ line: 270 ]]
		-- upvalues: var8 (copy), p9 (ref), self (ref)
		if p11 then
			if var8 then
				print("[Sentry] Successfully attached log to event:", p9)
			end
			if self._logAttachmentSuccessCallback == nil then
				return
			else
				self._logAttachmentSuccessCallback()
				
				return
			end
		elseif var8 then
			local var24 = type(p12) ~= "table" and ((if type(p12) ~= "table" then p12.error else nil) or "unknown error")
			warn("[Sentry] Failed to attach log:", var24)
		end
		if self._logAttachmentFailureCallback ~= nil then
			self._logAttachmentFailureCallback(p12)
		end
	end)
end

function t:_handleSentryExceptionCallback(p13, p14, p15, p16) --[[ line: 303 ]]
	-- upvalues: var8 (ref)
	if p13 then
		if var8 then
			print("[Sentry] Successfully reported error to Sentry:", p15)
		end
		if self._sentryClientSuccessCallback ~= nil then
			self._sentryClientSuccessCallback()
		end
		if p16 and p15 then
			self:_sendLogAttachment(p15, p16)
			
			return
		end
	elseif var8 then
		local var25 = type(p14) ~= "table" and ((if type(p14) ~= "table" then p14.error else nil) or "unknown error")
		warn("[Sentry] Failed to report error to Sentry:", var25)
	end
	if self._sentryClientFailureCallback ~= nil then
		self._sentryClientFailureCallback(p14)
	end
end

function t:sendErrorReport(p17, p18) --[[ line: 335 ]]
	-- upvalues: var8 (ref), constantsModule (ref), sentryReporterUtilityModule (ref)
	if not self._isEnabled then return end
	if self:isTooOldToReportErrors() then return end
	if var8 then
		assert(p17:validate())
	end
	local message = p17.message or "Unknown error message"
	local level = p17.level or constantsModule.DEFAULT_ERROR_LEVEL
	local var28 = sentryReporterUtilityModule.parseErrorToContext(p17)
	local var29 = sentryReporterUtilityModule.parseThreadsToSentry(p17.threads)
	local stacktrace = nil
	
	if var29 and var29.values then
		for i, v in ipairs(var29.values) do
			if v.main == true or v.crashed == true then
				stacktrace = v.stacktrace
				break
			end
		end
	end
	if var8 then
		print("[Sentry] Report Context:", var28)
		print("[Sentry] Threads:", var29)
		print("[Sentry] Main Stacktrace:", stacktrace)
		print("[Sentry] Level:", level)
	end
	self._sentryClient:capture_exception({
		type = "LuaError",
		message = message,
		stacktrace = stacktrace
	}, level, var28, var29, function(p19, p20, p21) --[[ line: 387 ]]
		-- upvalues: self (ref), p18 (ref)
		self:_handleSentryExceptionCallback(p19, p20, p21, p18)
	end)
end

function t._sendLogToReport(_, _, p22) --[[ line: 399 ]]
	if type(p22) == "string" and #p22 ~= 0 then
		pcall(function() --[[ line: 404 ]] end)
		
		return
	end
end

function t:_generateLog() --[[ line: 414 ]]
	if self._generateLogMethod ~= nil and self._logIntervalInSeconds < tick() - self._lastLogTime then
		self._lastLogTime = tick()
		local ok, status = pcall(function() --[[ line: 418 ]]
			-- upvalues: self (ref)
			return self._generateLogMethod()
		end)
		
		return if ok and type(status) == "string" and #status > 0 then status else nil
	end
end

function t:_generateErrorReport(p23, p24, p25, p26, p27) --[[ line: 440 ]]
	-- upvalues: cryoModule (ref), errorReportModule (ref)
	local var30
	local _ = nil
	
	if type(p25) == "table" then
		var30 = errorReportModule.fromDetails(if p27 ~= nil then p25 else cryoModule.Dictionary.join(p25, { level = p27 }))
	else
		var30 = errorReportModule.fromMessageAndStack(p23, p24, p27)
		
		if type(p25) == "string" then
			var30:addAnnotations({ stackDetails = p25 })
		end
	end
	if p26 ~= nil then
		var30:addCustomMetadata(p26)
	end
	var30:addAttributes(self._sharedAttributes)
	
	if self._sharedAnnotations and next(self._sharedAnnotations) ~= nil then
		var30:addAnnotations(self._sharedAnnotations)
	end
	if self._processErrorReportMethod ~= nil then
		var30 = self._processErrorReportMethod(var30)
	end
	return var30, self:_generateLog()
end

function t:reportErrorImmediately(p28, p29, p30, p31, p32) --[[ line: 500 ]]
	if self._isEnabled then
		local var31, var32 = self:_generateErrorReport(p28, p29, p30, p31, p32)
		self:sendErrorReport(var31, var32)
		
		return
	end
end

function t:reportErrorDeferred(p33, p34, p35, p36, p37) --[[ line: 526 ]]
	if not self._isEnabled then return end
	local formattedText = string.format("%s | %s", p33 or "", p34 or "")
	local t = { errorReport = nil, log = nil }
	
	if not self._errorQueue:hasError(formattedText) then
		var35, formattedText = self:_generateErrorReport(p33, p34, p35, p36, p37)
		t = { errorReport = var35, log = formattedText }
	end
	self._errorQueue:addError(formattedText, t)
end

function t:reportAllErrors() --[[ line: 562 ]]
	if self._errorQueue ~= nil then
		self._errorQueue:reportAllErrors()
	end
end

function t:stop() --[[ line: 571 ]]
	self._isEnabled = false
	
	if self._errorQueue ~= nil then
		self:reportAllErrors()
		self._errorQueue:stopTimer()
	end
end

function t:updateSharedAttributes(p38) --[[ line: 589 ]]
	-- upvalues: cryoModule (ref), iAttributes (ref), var8 (ref)
	local var36 = cryoModule.Dictionary.join(self._sharedAttributes, p38)
	local var37, var38 = iAttributes(var36)
	
	if not var37 then
		if var8 then
			assert(var37, var38)
		else
			return
		end
	end
	self._sharedAttributes = var36
end

function t:setTag(p39, p40) --[[ line: 613 ]]
	self._sentryClient:set_tag(p39, p40)
end

function t:setUser(p41) --[[ line: 622 ]]
	self._sentryClient:set_user(p41)
end

function t:updateSharedAnnotations(p42) --[[ line: 631 ]]
	-- upvalues: cryoModule (ref), iAnnotations (ref), var8 (ref)
	local var39 = cryoModule.Dictionary.join(self._sharedAnnotations, p42)
	local var40, var41 = iAnnotations(var39)
	
	if not var40 then
		if var8 then
			assert(var40, var41)
		else
			return
		end
	end
	self._sharedAnnotations = var39
end

return t