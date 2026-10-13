local contentProviderService = game:GetService("ContentProvider")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local runService = game:GetService("RunService")
local scriptContextService = game:GetService("ScriptContext")
local userInputService = game:GetService("UserInputService")
local robloxGui = coreGuiService.RobloxGui
local rateLimiterModule = require(robloxGui.Modules.ErrorReporting.RateLimiter)
local piiFilterModule = require(robloxGui.Modules.ErrorReporting.PiiFilter)
local luaCoreScriptsErrorV2CounterConfigModule = require(robloxGui.Modules.ErrorReporting.LuaCoreScriptsErrorV2CounterConfig)
local createCoreScriptErrorHandlerModule = require(robloxGui.Modules.ErrorReporting.createCoreScriptErrorHandler)
local createCoreScriptReportProcessorModule = require(robloxGui.Modules.ErrorReporting.createCoreScriptReportProcessor)
local fFlagCoreScriptErrorReporterIncludeScriptContextModule = require(robloxGui.Modules.Flags.FFlagCoreScriptErrorReporterIncludeScriptContext)
local backtraceReporter = require(corePackagesService.Workspace.Packages.ErrorReporters).BacktraceReporter
local default = require(corePackagesService.Workspace.Packages.LoggingProtocol).default
local reactModule = require(corePackagesService.Packages.React)
local sessionWithErrorReporter = require(corePackagesService.Workspace.Packages.AppObservability).SessionWithErrorReporter
local luaCoreScriptsSessionWithErrorConfigModule = require(robloxGui.Modules.ErrorReporting.LuaCoreScriptsSessionWithErrorConfig)
game:DefineFastFlag("DisableCorescriptBacktraceReporting", false)
game:DefineFastString("CoreScriptBacktraceErrorUploadToken", "")
game:DefineFastInt("CoreScriptBacktracePIIFilterEraseTimeoutSeconds", 300)
game:DefineFastFlag("CoreScriptBacktraceRepeatedErrorRateLimiting", true)
game:DefineFastInt("CoreScriptBacktraceRepeatedErrorRateLimitCount", 5)
game:DefineFastInt("CoreScriptBacktraceRepeatedErrorRateLimitPeriod", 60)
game:DefineFastInt("CoreScriptBacktraceRepeatedErrorRateLimitProcessIntervalTenths", 10)
game:DefineFastInt("CoreScriptBacktraceErrorReportPercentage", 100)
local coreScriptErrorReporterUseErrorHandler = game:DefineFastFlag("CoreScriptErrorReporterUseErrorHandler", false)

local function _()
	return math.random(1, 100) <= math.clamp(game:GetFastInt("CoreScriptBacktraceErrorReportPercentage"), 0, 100)
end

local var1 = not game:GetFastFlag("DisableCorescriptBacktraceReporting") and (game:GetFastString("CoreScriptBacktraceErrorUploadToken") ~= "" and math.random(1, 100) <= math.clamp(game:GetFastInt("CoreScriptBacktraceErrorReportPercentage"), 0, 100))

if var1 and coreScriptErrorReporterUseErrorHandler then
	local var2, var3 = createCoreScriptReportProcessorModule()
	local var4 = sessionWithErrorReporter.new(luaCoreScriptsSessionWithErrorConfigModule, 300, nil)
	local var5 = createCoreScriptErrorHandlerModule({
		piiFilter = piiFilterModule.new({
			eraseTimeout = game:GetFastInt("CoreScriptBacktracePIIFilterEraseTimeoutSeconds")
		}),
		rateLimiter = if game:GetFastFlag("CoreScriptBacktraceRepeatedErrorRateLimiting") then rateLimiterModule.new({
			period = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitPeriod"),
			threshold = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitCount"),
			processInterval = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitProcessIntervalTenths") / 10
		}) else nil,
		reporters = {
			backtraceReporter.new({
				httpService = httpService,
				token = game:GetFastString("CoreScriptBacktraceErrorUploadToken"),
				processErrorReportMethod = var2
			})
		},
		onErrorReported = function()
			-- upvalues: default (ref), luaCoreScriptsErrorV2CounterConfigModule (ref), var4 (ref)
			default:logRobloxTelemetryCounter(luaCoreScriptsErrorV2CounterConfigModule, 1)
			var4:reportEvent(1, nil, "ERROR")
		end
	})
	scriptContextService.ErrorDetailed:Connect(function(...)
		-- upvalues: var5 (ref)
		local ok, status = pcall(var5, ...)
		
		if not ok then
			warn(("CoreScript error reporter failed to handle an error:\n%s"):format(status))
		end
	end)
	var3.ServerVersion = robloxReplicatedStorageService:WaitForChild("GetServerVersion", 1e999):InvokeServer()
end
if var1 and not coreScriptErrorReporterUseErrorHandler then
	local t = {
		LocalVersion = runService:GetRobloxVersion(),
		BaseUrl = contentProviderService.BaseUrl,
		PlaceId = game.PlaceId,
		Platform = userInputService:GetPlatform().Name,
		UserAgent = httpService:GetUserAgent(),
		CoreScriptVersion = runService:GetCoreScriptVersion()
	}
	local var6 = piiFilterModule.new({
		eraseTimeout = game:GetFastInt("CoreScriptBacktracePIIFilterEraseTimeoutSeconds")
	})
	local coreScriptBacktraceRepeatedErrorRateLimitingFastFlag = game:GetFastFlag("CoreScriptBacktraceRepeatedErrorRateLimiting")
	local var7 = if coreScriptBacktraceRepeatedErrorRateLimitingFastFlag then rateLimiterModule.new({
		period = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitPeriod"),
		threshold = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitCount"),
		processInterval = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitProcessIntervalTenths") / 10
	}) else nil
	local var8 = sessionWithErrorReporter.new(luaCoreScriptsSessionWithErrorConfigModule, 300, nil)
	local var9 = backtraceReporter.new({
		httpService = httpService,
		token = game:GetFastString("CoreScriptBacktraceErrorUploadToken"),
		processErrorReportMethod = function(p1)
			-- upvalues: t (ref), playersService (ref), runService (ref)
			p1:addAttributes(t)
			p1:addAttributes({ PlayerCount = #playersService:GetPlayers() })
			p1:addAttributes({ RobloxChannel = runService:GetRobloxClientChannel() })
			
			return p1
		end
	})
	
	local function handleErrorDetailed(p1, p2, p3, p4)
		-- upvalues: coreGuiService (ref), corePackagesService (ref), fFlagCoreScriptErrorReporterIncludeScriptContextModule (ref), scriptContextService (ref), reactModule (ref), var6 (ref), coreScriptBacktraceRepeatedErrorRateLimitingFastFlag (ref), var7 (write), var9 (ref), default (ref), luaCoreScriptsErrorV2CounterConfigModule (ref), var8 (ref)
		if p3 ~= nil and (p3:IsDescendantOf(coreGuiService) or p3:IsDescendantOf(corePackagesService) or fFlagCoreScriptErrorReporterIncludeScriptContextModule and p3:IsA("CoreScript") and p3:IsDescendantOf(scriptContextService)) then
			local var10, var11 = reactModule.unstable_parseReactError(p1)
			message = var10.message
			p2 = var10.stack or p2
			p4 = p4 or var11
			local var12 = var6:cleanPii(message)
			local var13 = var6:cleanPii(p2)
			
			if p4 ~= nil then
				p4 = var6:cleanPii(p4)
			end
			if coreScriptBacktraceRepeatedErrorRateLimitingFastFlag then
				local text = var12 .. var33
				
				if var7:isRateLimited(text) then return end
				var7:increment(text)
			end
			var9:reportErrorDeferred(var12, var13, p4)
			default:logRobloxTelemetryCounter(luaCoreScriptsErrorV2CounterConfigModule, 1)
			var8:reportEvent(1, nil, "ERROR")
		end
	end
	
	scriptContextService.ErrorDetailed:Connect(function(...)
		-- upvalues: handleErrorDetailed (ref)
		local ok, status = pcall(handleErrorDetailed, ...)
		
		if not ok then
			warn(("CoreScript error reporter failed to handle an error:\n%s"):format(status))
		end
	end)
	t.ServerVersion = robloxReplicatedStorageService:WaitForChild("GetServerVersion", 1e999):InvokeServer()
end