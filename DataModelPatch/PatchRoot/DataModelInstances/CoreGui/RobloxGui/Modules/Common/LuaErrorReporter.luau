local ScriptContext = game:GetService("ScriptContext")
local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RemovePIIModule = require(script.Parent.removePII)
local NewResult = require(script.Parent.Analytics).new()
local SessionInfo = require(CorePackages.Workspace.Packages.SessionizationUtil).SessionInfo
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local LuaShellErrorsModule = require(script.Parent.RobloxTelemetryConfigs.LuaShellErrors)
local LuaErrorV2CounterConfigModule = require(script.Parent.RobloxTelemetryConfigs.LuaErrorV2CounterConfig)
local FFlagLuaAppEnableBacktraceSessionInfo = require(CorePackages.Workspace.Packages.ErrorReporters).FFlagLuaAppEnableBacktraceSessionInfo
local FFlagLuaAppEnableTokenBucketLimiterModule = require(script.Parent.FFlagLuaAppEnableTokenBucketLimiter)
local TokenBucketRateLimiter = require(CorePackages.Workspace.Packages.ErrorReporters).TokenBucketRateLimiter
local FFlagEnableLuaAppSessionWithErrorModule = require(script.Parent.FFlagEnableLuaAppSessionWithError)
local LuaAppSessionWithErrorConfigModule = require(script.Parent.RobloxTelemetryConfigs.LuaAppSessionWithErrorConfig)
local SessionWithErrorReporter = require(CorePackages.Workspace.Packages.AppObservability).SessionWithErrorReporter
local LuaErrorSeverityModule = require(script.Parent.LuaErrorSeverity)
local LuaAppsDiagErrorCounterFVariable = settings():GetFVariable("LuaAppsDiagErrorCounter")
local LuaErrorByPlatformCounter = game:DefineFastString("LuaErrorByPlatformCounter", "LuaErrorPlatformOther")
local FFlagDisableGoogleAnalyticsErrorReporting = require(CorePackages.Workspace.Packages.SharedFlags).FFlagDisableGoogleAnalyticsErrorReporting
local ErrorQueue = if FFlagDisableGoogleAnalyticsErrorReporting then nil else require(CorePackages.Workspace.Packages.ErrorReporters).ErrorQueue
local NoFFlagDisableGoogleAnalyticsErrorReporting = not FFlagDisableGoogleAnalyticsErrorReporting or nil
local Number: number? = tonumber(settings():GetFVariable("LuaAppErrorReporterRateLimitThreshold"))
local Number1: number? = tonumber(settings():GetFVariable("LuaAppErrorReporterRateLimitIntervalInSec"))
local LuaAppsDiagRateLimitedErrorsCounterFVariable = settings():GetFVariable("LuaAppsDiagRateLimitedErrorsCounter")
local ScaledNumber = Number * 2
local config = {
	[LuaErrorSeverityModule.DEBUG] = "debug",
	[LuaErrorSeverityModule.ERROR] = "error"
}
local config1 = {
	maxTokens = 3,
	refillRate = 3,
	refillIntervalSeconds = 600,
	initialTokens = 3
}

local function _(p1): string
	-- upvalues: RunService (copy)
	return string.format("%s-%s", p1, (RunService:GetRobloxVersion()))
end

local _ = function(Text: string): string
	local Text1 = ""
	local Flag = true
	
	for i in Text:gmatch("[^\r\n]+") do
		if Flag then
			Text1 = i
			Flag = false
		else
			Text1 ..= " | " .. i
		end
	end
	return Text1
end

local _ = function(p1)
	-- upvalues: RemovePIIModule (copy)
	return RemovePIIModule(p1)
end

local function printError(Formatted, p1, p2, Object)
	print(table.concat({
		"---- Unhandled Error Handler -----",
		string.format("Current App<%s, %d> : \n%s\n", type(Formatted), #Formatted, Formatted),
		string.format("Message<%s,%d> :\n%s\n", type(p1), #p1, p1),
		string.format("Stack<%s,%d> :\n%s", type(p2), #p2, p2),
		string.format("Script<%s> :\n%s", type(Object), Object:GetFullName()),
		"----------------------------------"
	}, "\n"))
end

local v1 = if FFlagDisableGoogleAnalyticsErrorReporting then nil else function(_, p1, p2)
	-- upvalues: NewResult (copy)
	NewResult.GoogleAnalytics:trackEvent(p1.productName, p1.errorMessage, p1.errorStack, p2)
end

local _ = function()
	-- upvalues: NewResult (copy), LuaAppsDiagErrorCounterFVariable (copy)
	NewResult.Diag:reportCounter(LuaAppsDiagErrorCounterFVariable, 1)
end

local _ = function()
	-- upvalues: NewResult (copy), LuaErrorByPlatformCounter (copy)
	NewResult.Diag:reportCounter(LuaErrorByPlatformCounter, 1)
end

local _ = function()
	-- upvalues: NewResult (copy), LuaAppsDiagRateLimitedErrorsCounterFVariable (copy)
	NewResult.Diag:reportCounter(LuaAppsDiagRateLimitedErrorsCounterFVariable, 1)
end

local LuaErrorReporterModule = {}
LuaErrorReporterModule.__index = LuaErrorReporterModule

function LuaErrorReporterModule:getSessionInformation()
	-- upvalues: SessionType (copy), SessionInfo (copy)
	local Levels = {}
	
	for _, value in ipairs({
		SessionType.StructuralIdentifier.Level0,
		SessionType.StructuralIdentifier.Level1,
		SessionType.StructuralIdentifier.Level2a,
		SessionType.StructuralIdentifier.Level2b
	}) do
		local SessionByLevel = SessionInfo.getSessionByLevel(value)
		
		if SessionByLevel then
			Levels[value] = SessionByLevel.level
			Levels[value .. "_sessionId"] = SessionByLevel.sessionId
			Levels[value .. "_tagName"] = SessionByLevel.tagName
		end
	end
	return Levels
end

function LuaErrorReporterModule.new(LuaAppSessionWithErrorConfigModule1, p1, _backtraceReporter, _severity, _sentryReporter)
	-- upvalues: ScriptContext (copy), Number1 (copy), FFlagDisableGoogleAnalyticsErrorReporting (copy), NoFFlagDisableGoogleAnalyticsErrorReporting (copy), Number (copy), Default (copy), FFlagEnableLuaAppSessionWithErrorModule (copy), SessionWithErrorReporter (copy), LuaAppSessionWithErrorConfigModule (copy), FFlagLuaAppEnableTokenBucketLimiterModule (copy), TokenBucketRateLimiter (copy), config1 (copy), LuaErrorReporterModule (copy), ErrorQueue (copy), v1 (copy), ReactModule (copy), RunService (copy)
	if not LuaAppSessionWithErrorConfigModule1 then
		LuaAppSessionWithErrorConfigModule1 = ScriptContext.Error
	end
	local P12 = p1 or Number1
	local config = {
		_isInstance = true,
		_verbose = false,
		_signalConnectionToken = nil,
		_shouldReportDiag = true,
		_shouldReportInflux = true,
		_currentApp = "Unknown",
		_reportQueueGA = nil,
		_shouldReportGoogleAnalytics = if FFlagDisableGoogleAnalyticsErrorReporting then nil else NoFFlagDisableGoogleAnalyticsErrorReporting,
		_backtraceReporter = _backtraceReporter,
		_sentryReporter = _sentryReporter,
		_rateLimitingThreshold = Number,
		_rateLimitingIntervalSec = P12,
		_rateLimitCounts = {},
		_rateLimitNextTick = tick() + P12,
		_loggingProtocol = Default,
		_severity = _severity,
		_sessionWithErrorReporter = if FFlagEnableLuaAppSessionWithErrorModule then SessionWithErrorReporter.new(LuaAppSessionWithErrorConfigModule, 300, nil) else nil,
		_tokenBucketRateLimiter = if FFlagLuaAppEnableTokenBucketLimiterModule then TokenBucketRateLimiter.new(config1) else nil
	}
	setmetatable(config, LuaErrorReporterModule)
	
	if not FFlagDisableGoogleAnalyticsErrorReporting then
		config._reportQueueGA = ErrorQueue.new(v1, { queueKeyLimit = 10 })
	end
	config._signalConnectionToken = LuaAppSessionWithErrorConfigModule1:connect(function(p2, p3, p4, p5)
		-- upvalues: ReactModule (upval), config (copy)
		local Success, Result = pcall(function()
			-- upvalues: ReactModule (upval), p2 (ref), p3 (ref), p5 (ref), config (upval), p4 (copy)
			local Unstable_parseReactErrorResult, Unstable_parseReactErrorResult2 = ReactModule.unstable_parseReactError(p2)
			p2 = Unstable_parseReactErrorResult.message
			p3 = Unstable_parseReactErrorResult.stack or p3
			p5 = p5 or Unstable_parseReactErrorResult2
			config:handleError(p2, p3, p4, p5, config._severity)
		end)
		
		if not Success then
			warn(string.format("An error occurred while reporting an error : %s", Result))
		end
	end)
	
	if not RunService:IsStudio() and not _G.__TESTEZ_RUNNING_TEST__ then
		game:BindToClose(function()
			-- upvalues: config (copy)
			config:delete()
		end)
	end
	config._rateLimitHeartbeatConnectionToken = RunService.Heartbeat:connect(function()
		-- upvalues: config (copy)
		local CurrentTime = tick()
		
		if config._rateLimitNextTick < CurrentTime then
			config:_processRateLimitingTick()
			config._rateLimitNextTick = CurrentTime + config._rateLimitingIntervalSec
		end
	end)
	
	return config
end

function LuaErrorReporterModule:_processRateLimitingTick()
	-- upvalues: ScaledNumber (copy), NewResult (copy), LuaAppsDiagRateLimitedErrorsCounterFVariable (copy)
	local Count = 0
	
	for i, rateLimitCount in pairs(self._rateLimitCounts) do
		if self._rateLimitingThreshold <= rateLimitCount then
			Count += 1
		end
		local RateLimitCountDelta = rateLimitCount - self._rateLimitingThreshold
		
		if ScaledNumber < RateLimitCountDelta then
			self._rateLimitCounts[i] = ScaledNumber
		elseif RateLimitCountDelta <= 0 then
			self._rateLimitCounts[i] = nil
		else
			self._rateLimitCounts[i] = RateLimitCountDelta
		end
	end
	if Count > 0 then
		NewResult.Diag:reportCounter(LuaAppsDiagRateLimitedErrorsCounterFVariable, 1)
	end
end

function LuaErrorReporterModule:_processErrorForRateLimiting(ErrorMessage, ErrorStack): boolean
	local Text = ErrorMessage .. ErrorStack
	local RateLimitCount = self._rateLimitCounts[Text] or 0
	self._rateLimitCounts[Text] = RateLimitCount + 1
	
	return self._rateLimitingThreshold <= RateLimitCount
end

function LuaErrorReporterModule:delete()
	-- upvalues: FFlagDisableGoogleAnalyticsErrorReporting (copy)
	if self._rateLimitHeartbeatConnectionToken ~= nil then
		self._rateLimitHeartbeatConnectionToken:disconnect()
	end
	self._signalConnectionToken:disconnect()
	
	if not FFlagDisableGoogleAnalyticsErrorReporting then
		self._reportQueueGA:reportAllErrors()
		self._reportQueueGA:stopTimer()
	end
	if self._backtraceReporter ~= nil then
		self._backtraceReporter:stop()
	end
	if self._sentryReporter ~= nil then
		self._sentryReporter:stop()
	end
end

function LuaErrorReporterModule:setCurrentApp(_currentApp: string)
	if type(_currentApp) ~= "string" then
		error("appName must be a string")
	end
	self._currentApp = _currentApp
end

if not FFlagDisableGoogleAnalyticsErrorReporting then
	function LuaErrorReporterModule:startQueueTimers()
		self._reportQueueGA:startTimer()
	end
end
function LuaErrorReporterModule:stopQueueTimers()
	-- upvalues: FFlagDisableGoogleAnalyticsErrorReporting (copy)
	if not FFlagDisableGoogleAnalyticsErrorReporting then
		self._reportQueueGA:stopTimer()
	end
end

function LuaErrorReporterModule:reportRobloxTelemetryEvent(App, Err, Stack, Object)
	-- upvalues: LuaShellErrorsModule (copy)
	self._loggingProtocol:logRobloxTelemetryEvent(LuaShellErrorsModule, nil, {
		app = App,
		err = Err,
		stack = Stack,
		script = Object:GetFullName()
	})
end

function LuaErrorReporterModule:reportRobloxTelemetryCounter(Tag_severity)
	-- upvalues: LuaErrorV2CounterConfigModule (copy)
	if Tag_severity == nil then
		self._loggingProtocol:logRobloxTelemetryCounter(LuaErrorV2CounterConfigModule, 1)
		
		return
	else
		self._loggingProtocol:logRobloxTelemetryCounter(LuaErrorV2CounterConfigModule, 1, { tag_severity = Tag_severity })
	end
end

function LuaErrorReporterModule:reportSessionWithError(p1, p2, Tag_severity)
	self._sessionWithErrorReporter:reportEvent(p1, p2, Tag_severity)
end

function LuaErrorReporterModule:handleError(p1, p2, p3, p4, Severity)
	-- upvalues: RunService (copy), printError (copy), RemovePIIModule (copy), FFlagLuaAppEnableTokenBucketLimiterModule (copy), FFlagDisableGoogleAnalyticsErrorReporting (copy), FFlagLuaAppEnableBacktraceSessionInfo (copy), config (copy), FFlagEnableLuaAppSessionWithErrorModule (copy), NewResult (copy), LuaAppsDiagErrorCounterFVariable (copy), LuaErrorByPlatformCounter (copy)
	local Formatted = string.format("%s-%s", self._currentApp, (RunService:GetRobloxVersion()))
	
	if self._verbose then
		printError(Formatted, p1, p2, p3)
	end
	local RemovePIIModuleResult = RemovePIIModule(p1)
	local RemovePIIModuleResult1: string = RemovePIIModule(p2)
	local Text = ""
	local Flag = true
	
	for i in RemovePIIModuleResult1:gmatch("[^\r\n]+") do
		if Flag then
			Text = i
			Flag = false
		else
			Text ..= " | " .. i
		end
	end
	local ErrorStack: string = Text
	
	if p4 ~= nil then
		p4 = RemovePIIModule(p4)
	end
	if FFlagLuaAppEnableTokenBucketLimiterModule then
		if not self._tokenBucketRateLimiter:consume(1) then return end
	elseif self:_processErrorForRateLimiting(RemovePIIModuleResult, ErrorStack) then return end
	local Formatted1 = string.format("%s | %s", RemovePIIModuleResult, RemovePIIModuleResult1)
	
	if not FFlagDisableGoogleAnalyticsErrorReporting and self._shouldReportGoogleAnalytics then
		self._reportQueueGA:addError(Formatted1, {
			productName = Formatted,
			errorMessage = RemovePIIModuleResult,
			errorStack = ErrorStack
		})
	end
	local SessionInformation = if FFlagLuaAppEnableBacktraceSessionInfo then self:getSessionInformation() else nil
	
	if self._sentryReporter ~= nil then
		self._sentryReporter:reportErrorDeferred(RemovePIIModuleResult, RemovePIIModuleResult1, p4, nil, config[Severity])
	end
	if self._backtraceReporter ~= nil then
		if FFlagLuaAppEnableBacktraceSessionInfo then
			self._backtraceReporter:reportErrorDeferred(RemovePIIModuleResult, RemovePIIModuleResult1, p4, SessionInformation)
		else
			self._backtraceReporter:reportErrorDeferred(RemovePIIModuleResult, RemovePIIModuleResult1, p4)
		end
	end
	if self._shouldReportInflux then
		self:reportRobloxTelemetryEvent(Formatted, RemovePIIModuleResult, ErrorStack, p3)
	end
	if self._shouldReportDiag then
		self:reportRobloxTelemetryCounter(Severity)
		
		if FFlagEnableLuaAppSessionWithErrorModule then
			self:reportSessionWithError(1, nil, Severity)
		end
		NewResult.Diag:reportCounter(LuaAppsDiagErrorCounterFVariable, 1)
		NewResult.Diag:reportCounter(LuaErrorByPlatformCounter, 1)
	end
end

return LuaErrorReporterModule