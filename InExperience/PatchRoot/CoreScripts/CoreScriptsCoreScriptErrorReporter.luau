local ContentProvider = game:GetService("ContentProvider")
local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local RunService = game:GetService("RunService")
local ScriptContext = game:GetService("ScriptContext")
local UserInputService = game:GetService("UserInputService")
local CoreScriptErrorReporterUseErrorHandler = game:DefineFastFlag("CoreScriptErrorReporterUseErrorHandler", false)
local RobloxGui = CoreGui.RobloxGui
local RateLimiterModule = require(RobloxGui.Modules.ErrorReporting.RateLimiter)
local PiiFilterModule = require(RobloxGui.Modules.ErrorReporting.PiiFilter)
local LuaCoreScriptsErrorV2CounterConfigModule = require(RobloxGui.Modules.ErrorReporting.LuaCoreScriptsErrorV2CounterConfig)
local CreateCoreScriptErrorHandlerModule = require(RobloxGui.Modules.ErrorReporting.createCoreScriptErrorHandler)
local CreateCoreScriptReportProcessorModule = require(RobloxGui.Modules.ErrorReporting.createCoreScriptReportProcessor)
local CreateCoreScriptSentryReporterModule = if CoreScriptErrorReporterUseErrorHandler then require(RobloxGui.Modules.ErrorReporting.createCoreScriptSentryReporter) else nil
local FFlagCoreScriptErrorReporterIncludeScriptContextModule = require(RobloxGui.Modules.Flags.FFlagCoreScriptErrorReporterIncludeScriptContext)
local BacktraceReporter = require(CorePackages.Workspace.Packages.ErrorReporters).BacktraceReporter
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local ReactModule = require(CorePackages.Packages.React)
local SessionWithErrorReporter = require(CorePackages.Workspace.Packages.AppObservability).SessionWithErrorReporter
local LuaCoreScriptsSessionWithErrorConfigModule = require(RobloxGui.Modules.ErrorReporting.LuaCoreScriptsSessionWithErrorConfig)
game:DefineFastFlag("DisableCorescriptBacktraceReporting", false)
game:DefineFastString("CoreScriptBacktraceErrorUploadToken", "")
game:DefineFastInt("CoreScriptBacktracePIIFilterEraseTimeoutSeconds", 300)
game:DefineFastFlag("CoreScriptBacktraceRepeatedErrorRateLimiting", true)
game:DefineFastInt("CoreScriptBacktraceRepeatedErrorRateLimitCount", 5)
game:DefineFastInt("CoreScriptBacktraceRepeatedErrorRateLimitPeriod", 60)
game:DefineFastInt("CoreScriptBacktraceRepeatedErrorRateLimitProcessIntervalTenths", 10)
game:DefineFastInt("CoreScriptBacktraceErrorReportPercentage", 100)
local CoreScriptSentryDsn = game:DefineFastString("CoreScriptSentryDsn", "")
local CoreScriptSentryRolloutPercentage: number = game:DefineFastInt("CoreScriptSentryRolloutPercentage", 0)

local function _(): boolean
	return math.random(1, 100) <= math.clamp(game:GetFastInt("CoreScriptBacktraceErrorReportPercentage"), 0, 100)
end

local _ = function(): boolean
	-- upvalues: CoreScriptSentryRolloutPercentage (copy)
	return math.random(1, 100) <= math.clamp(CoreScriptSentryRolloutPercentage, 0, 100)
end

local IsRandomValueBelow: boolean = not game:GetFastFlag("DisableCorescriptBacktraceReporting") and (game:GetFastString("CoreScriptBacktraceErrorUploadToken") ~= "" and math.random(1, 100) <= math.clamp(game:GetFastInt("CoreScriptBacktraceErrorReportPercentage"), 0, 100))
local IsRandomValueBelow1: boolean = CoreScriptErrorReporterUseErrorHandler and (CoreScriptSentryDsn ~= "" and math.random(1, 100) <= math.clamp(CoreScriptSentryRolloutPercentage, 0, 100))

if CoreScriptErrorReporterUseErrorHandler and (IsRandomValueBelow or IsRandomValueBelow1) then
	local CoreScriptReportProcessorModule, CoreScriptReportProcessorModule2 = CreateCoreScriptReportProcessorModule()
	local NewPiiFilter = PiiFilterModule.new({
		eraseTimeout = game:GetFastInt("CoreScriptBacktracePIIFilterEraseTimeoutSeconds")
	})
	local NewRateLimiter = if game:GetFastFlag("CoreScriptBacktraceRepeatedErrorRateLimiting") then RateLimiterModule.new({
		period = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitPeriod"),
		threshold = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitCount"),
		processInterval = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitProcessIntervalTenths") / 10
	}) else nil
	local NewSessionWithErrorReporter = SessionWithErrorReporter.new(LuaCoreScriptsSessionWithErrorConfigModule, 300, nil)
	local List = {}
	
	if IsRandomValueBelow then
		table.insert(List, BacktraceReporter.new({
			httpService = HttpService,
			token = game:GetFastString("CoreScriptBacktraceErrorUploadToken"),
			processErrorReportMethod = CoreScriptReportProcessorModule
		}))
	end
	if IsRandomValueBelow1 then
		local CoreScriptSentryReporterModule = CreateCoreScriptSentryReporterModule({
			dsn = CoreScriptSentryDsn,
			processErrorReportMethod = CoreScriptReportProcessorModule
		})
		
		if CoreScriptSentryReporterModule ~= nil then
			table.insert(List, CoreScriptSentryReporterModule)
		end
	end
	local CoreScriptErrorHandlerModule = CreateCoreScriptErrorHandlerModule({
		piiFilter = NewPiiFilter,
		rateLimiter = NewRateLimiter,
		reporters = List,
		onErrorReported = function()
			-- upvalues: Default (copy), LuaCoreScriptsErrorV2CounterConfigModule (copy), NewSessionWithErrorReporter (copy)
			Default:logRobloxTelemetryCounter(LuaCoreScriptsErrorV2CounterConfigModule, 1)
			NewSessionWithErrorReporter:reportEvent(1, nil, "ERROR")
		end
	})
	
	if #List > 0 then
		ScriptContext.ErrorDetailed:Connect(function(...)
			-- upvalues: CoreScriptErrorHandlerModule (copy)
			local Success, Result = pcall(CoreScriptErrorHandlerModule, ...)
			
			if not Success then
				warn(("CoreScript error reporter failed to handle an error:\n%s"):format(Result))
			end
		end)
	end
	CoreScriptReportProcessorModule2.ServerVersion = RobloxReplicatedStorage:WaitForChild("GetServerVersion", 1e999):InvokeServer()
end
if IsRandomValueBelow and not CoreScriptErrorReporterUseErrorHandler then
	local config = {
		LocalVersion = RunService:GetRobloxVersion(),
		BaseUrl = ContentProvider.BaseUrl,
		PlaceId = game.PlaceId,
		Platform = UserInputService:GetPlatform().Name,
		UserAgent = HttpService:GetUserAgent(),
		CoreScriptVersion = RunService:GetCoreScriptVersion()
	}
	local NewPiiFilter = PiiFilterModule.new({
		eraseTimeout = game:GetFastInt("CoreScriptBacktracePIIFilterEraseTimeoutSeconds")
	})
	local CoreScriptBacktraceRepeatedErrorRateLimitingFastFlag = game:GetFastFlag("CoreScriptBacktraceRepeatedErrorRateLimiting")
	local NewRateLimiter = if CoreScriptBacktraceRepeatedErrorRateLimitingFastFlag then RateLimiterModule.new({
		period = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitPeriod"),
		threshold = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitCount"),
		processInterval = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitProcessIntervalTenths") / 10
	}) else nil
	local NewSessionWithErrorReporter1 = SessionWithErrorReporter.new(LuaCoreScriptsSessionWithErrorConfigModule, 300, nil)
	local NewBacktraceReporter = BacktraceReporter.new({
		httpService = HttpService,
		token = game:GetFastString("CoreScriptBacktraceErrorUploadToken"),
		processErrorReportMethod = function(p1)
			-- upvalues: config (copy), Players (copy), RunService (copy)
			p1:addAttributes(config)
			p1:addAttributes({ PlayerCount = #Players:GetPlayers() })
			p1:addAttributes({ RobloxChannel = RunService:GetRobloxClientChannel() })
			
			return p1
		end
	})
	
	local function handleErrorDetailed(p1, p2, Object, p3)
		-- upvalues: CoreGui (copy), CorePackages (copy), FFlagCoreScriptErrorReporterIncludeScriptContextModule (copy), ScriptContext (copy), ReactModule (copy), NewPiiFilter (copy), CoreScriptBacktraceRepeatedErrorRateLimitingFastFlag (copy), NewRateLimiter (ref), NewBacktraceReporter (copy), Default (copy), LuaCoreScriptsErrorV2CounterConfigModule (copy), NewSessionWithErrorReporter1 (copy)
		if Object ~= nil and (Object:IsDescendantOf(CoreGui) or Object:IsDescendantOf(CorePackages) or FFlagCoreScriptErrorReporterIncludeScriptContextModule and Object:IsA("CoreScript") and Object:IsDescendantOf(ScriptContext)) then
			local Unstable_parseReactErrorResult, Unstable_parseReactErrorResult2 = ReactModule.unstable_parseReactError(p1)
			local P4 = p3 or Unstable_parseReactErrorResult2
			local CleanPiiResult = NewPiiFilter:cleanPii(Unstable_parseReactErrorResult.message)
			local CleanPiiResult1 = NewPiiFilter:cleanPii(Unstable_parseReactErrorResult.stack or p2)
			
			if P4 ~= nil then
				P4 = NewPiiFilter:cleanPii(P4)
			end
			if CoreScriptBacktraceRepeatedErrorRateLimitingFastFlag then
				local Text = CleanPiiResult .. CleanPiiResult1
				
				if NewRateLimiter:isRateLimited(Text) then return end
				NewRateLimiter:increment(Text)
			end
			NewBacktraceReporter:reportErrorDeferred(CleanPiiResult, CleanPiiResult1, P4)
			Default:logRobloxTelemetryCounter(LuaCoreScriptsErrorV2CounterConfigModule, 1)
			NewSessionWithErrorReporter1:reportEvent(1, nil, "ERROR")
		end
	end
	
	ScriptContext.ErrorDetailed:Connect(function(...)
		-- upvalues: handleErrorDetailed (copy)
		local Success, Result = pcall(handleErrorDetailed, ...)
		
		if not Success then
			warn(("CoreScript error reporter failed to handle an error:\n%s"):format(Result))
		end
	end)
	config.ServerVersion = RobloxReplicatedStorage:WaitForChild("GetServerVersion", 1e999):InvokeServer()
end