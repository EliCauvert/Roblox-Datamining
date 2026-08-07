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
local backtraceReporter = require(corePackagesService.Workspace.Packages.ErrorReporters).BacktraceReporter
local default = require(corePackagesService.Workspace.Packages.LoggingProtocol).default
local reactModule = require(corePackagesService.Packages.React)
local sessionWithErrorReporter = require(corePackagesService.Workspace.Packages.AppObservability).SessionWithErrorReporter
local var13 = if game:DefineFastFlag("EnableCoreScriptsSessionWithError", false) then require(robloxGui.Modules.ErrorReporting.LuaCoreScriptsSessionWithErrorConfig) else nil
game:DefineFastFlag("DisableCorescriptBacktraceReporting", false)
game:DefineFastString("CoreScriptBacktraceErrorUploadToken", "")
game:DefineFastInt("CoreScriptBacktracePIIFilterEraseTimeoutSeconds", 300)
game:DefineFastFlag("CoreScriptBacktraceRepeatedErrorRateLimiting", true)
game:DefineFastInt("CoreScriptBacktraceRepeatedErrorRateLimitCount", 5)
game:DefineFastInt("CoreScriptBacktraceRepeatedErrorRateLimitPeriod", 60)
game:DefineFastInt("CoreScriptBacktraceRepeatedErrorRateLimitProcessIntervalTenths", 10)
game:DefineFastInt("CoreScriptBacktraceErrorReportPercentage", 100)
local enableCoreScriptsSessionWithError = game:DefineFastFlag("EnableCoreScriptsSessionWithError", false)

local function _() --[[ line: 52 | named "CanReportCoreScriptBacktrace" ]]
	return math.random(1, 100) <= math.clamp(game:GetFastInt("CoreScriptBacktraceErrorReportPercentage"), 0, 100)
end

if not game:GetFastFlag("DisableCorescriptBacktraceReporting") and game:GetFastString("CoreScriptBacktraceErrorUploadToken") ~= "" and math.random(1, 100) <= math.clamp(game:GetFastInt("CoreScriptBacktraceErrorReportPercentage"), 0, 100) then
	local t = {
		LocalVersion = runService:GetRobloxVersion(),
		BaseUrl = contentProviderService.BaseUrl,
		PlaceId = game.PlaceId,
		Platform = userInputService:GetPlatform().Name,
		UserAgent = httpService:GetUserAgent(),
		CoreScriptVersion = runService:GetCoreScriptVersion()
	}
	local var16 = piiFilterModule.new({
		eraseTimeout = game:GetFastInt("CoreScriptBacktracePIIFilterEraseTimeoutSeconds")
	})
	local coreScriptBacktraceRepeatedErrorRateLimitingFastFlag = game:GetFastFlag("CoreScriptBacktraceRepeatedErrorRateLimiting")
	local var18 = if coreScriptBacktraceRepeatedErrorRateLimitingFastFlag then rateLimiterModule.new({
		period = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitPeriod"),
		threshold = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitCount"),
		processInterval = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitProcessIntervalTenths") / 10
	}) else nil
	local var19 = if enableCoreScriptsSessionWithError then sessionWithErrorReporter.new(var13, 300, nil) else nil
	local var20 = backtraceReporter.new({
		httpService = httpService,
		token = game:GetFastString("CoreScriptBacktraceErrorUploadToken"),
		processErrorReportMethod = function(p0) --[[ line: 90 ]]
			-- upvalues: t (ref), playersService (ref), runService (ref)
			p0:addAttributes(t)
			p0:addAttributes({ PlayerCount = #playersService:GetPlayers() })
			p0:addAttributes({ RobloxChannel = runService:GetRobloxClientChannel() })
			
			return p0
		end
	})
	
	local function handleErrorDetailed(p1, p2, p3, p4) --[[ line: 111 ]]
		-- upvalues: coreGuiService (ref), corePackagesService (ref), reactModule (ref), var16 (ref), coreScriptBacktraceRepeatedErrorRateLimitingFastFlag (ref), var18 (write), var20 (ref), default (ref), luaCoreScriptsErrorV2CounterConfigModule (ref), enableCoreScriptsSessionWithError (ref), var19 (ref)
		if p3 ~= nil and (p3:IsDescendantOf(coreGuiService) or p3:IsDescendantOf(corePackagesService)) then
			local var22, var23 = reactModule.unstable_parseReactError(p1)
			message = var22.message
			p2 = var22.stack or p2
			p4 = p4 or var23
			local var24 = var16:cleanPii(message)
			local var25 = var16:cleanPii(p2)
			
			if p4 ~= nil then
				p4 = var16:cleanPii(p4)
			end
			if coreScriptBacktraceRepeatedErrorRateLimitingFastFlag then
				local text = var24 .. var25
				
				if var18:isRateLimited(text) then return end
				var18:increment(text)
			end
			var20:reportErrorDeferred(var24, var25, p4)
			default:logRobloxTelemetryCounter(luaCoreScriptsErrorV2CounterConfigModule, 1)
			
			if enableCoreScriptsSessionWithError then
				var19:reportEvent(1, nil, "ERROR")
			end
		end
	end
	
	scriptContextService.ErrorDetailed:Connect(function(...) --[[ line: 154 ]]
		-- upvalues: handleErrorDetailed (ref)
		local ok, status = pcall(handleErrorDetailed, ...)
		
		if not ok then
			warn(("CoreScript error reporter failed to handle an error:\n%s"):format(status))
		end
	end)
	t.ServerVersion = robloxReplicatedStorageService:WaitForChild("GetServerVersion", 1e999):InvokeServer()
end