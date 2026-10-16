local ContentProvider = game:GetService("ContentProvider")
local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local RunService = game:GetService("RunService")
local ScriptContext = game:GetService("ScriptContext")
local UserInputService = game:GetService("UserInputService")
local RobloxGui = CoreGui.RobloxGui
local RateLimiterModule = require(RobloxGui.Modules.ErrorReporting.RateLimiter)
local PiiFilterModule = require(RobloxGui.Modules.ErrorReporting.PiiFilter)
local BacktraceReporter = require(CorePackages.Workspace.Packages.ErrorReporters).BacktraceReporter
game:DefineFastFlag("DisableCEVBacktraceReporting", false)
game:DefineFastString("CoreScriptBacktraceErrorUploadToken", "")
game:DefineFastInt("CEVBacktracePIIFilterEraseTimeoutSeconds", 300)
game:DefineFastFlag("CEVBacktraceRepeatedErrorRateLimiting", true)
game:DefineFastInt("CEVBacktraceRepeatedErrorRateLimitCount", 5)
game:DefineFastInt("CEVBacktraceRepeatedErrorRateLimitPeriod", 60)
game:DefineFastInt("CEVBacktraceRepeatedErrorRateLimitProcessIntervalTenths", 10)
game:DefineFastInt("CEVBacktraceErrorReportPercentage", 100)

local function _(): boolean --[[ Line: 41 | Named "CanReportCEVBacktrace" ]]
	return math.random(1, 100) <= math.clamp(game:GetFastInt("CEVBacktraceErrorReportPercentage"), 0, 100)
end

if not game:GetFastFlag("DisableCEVBacktraceReporting") and game:GetFastString("CoreScriptBacktraceErrorUploadToken") ~= "" and math.random(1, 100) <= math.clamp(game:GetFastInt("CEVBacktraceErrorReportPercentage"), 0, 100) then
	local config = {
		AppName = "CrossExperienceVoice",
		LocalVersion = RunService:GetRobloxVersion(),
		BaseUrl = ContentProvider.BaseUrl,
		PlaceId = game.PlaceId,
		Platform = UserInputService:GetPlatform().Name,
		UserAgent = HttpService:GetUserAgent(),
		CoreScriptVersion = RunService:GetCoreScriptVersion()
	}
	local NewPiiFilter = PiiFilterModule.new({
		eraseTimeout = game:GetFastInt("CEVBacktracePIIFilterEraseTimeoutSeconds")
	})
	local CEVBacktraceRepeatedErrorRateLimitingFastFlag = game:GetFastFlag("CEVBacktraceRepeatedErrorRateLimiting")
	local NewRateLimiter = if CEVBacktraceRepeatedErrorRateLimitingFastFlag then RateLimiterModule.new({
		period = game:GetFastInt("CEVBacktraceRepeatedErrorRateLimitPeriod"),
		threshold = game:GetFastInt("CEVBacktraceRepeatedErrorRateLimitCount"),
		processInterval = game:GetFastInt("CEVBacktraceRepeatedErrorRateLimitProcessIntervalTenths") / 10
	}) else nil
	local NewBacktraceReporter = BacktraceReporter.new({
		httpService = HttpService,
		token = game:GetFastString("CoreScriptBacktraceErrorUploadToken"),
		processErrorReportMethod = function(p1) --[[ Line: 76 ]]
			-- upvalues: config (copy), Players (copy), RunService (copy)
			p1:addAttributes(config)
			p1:addAttributes({
				PlayerCount = #Players:GetPlayers(),
				RobloxChannel = RunService:GetRobloxClientChannel()
			})
			
			return p1
		end
	})
	
	local function handleErrorDetailed(p1, p2, Object, p3) --[[ Line: 94 ]]
		-- upvalues: CoreGui (copy), CorePackages (copy), NewPiiFilter (copy), CEVBacktraceRepeatedErrorRateLimitingFastFlag (copy), NewRateLimiter (ref), NewBacktraceReporter (copy)
		if Object ~= nil and (Object:IsDescendantOf(CoreGui) or Object:IsDescendantOf(CorePackages)) then
			local CleanPiiResult = NewPiiFilter:cleanPii(p1)
			local CleanPiiResult1 = NewPiiFilter:cleanPii(p2)
			
			if p3 ~= nil then
				p3 = NewPiiFilter:cleanPii(p3)
			end
			if CEVBacktraceRepeatedErrorRateLimitingFastFlag then
				local Text = CleanPiiResult .. CleanPiiResult1
				
				if NewRateLimiter:isRateLimited(Text) then return end
				NewRateLimiter:increment(Text)
			end
			NewBacktraceReporter:reportErrorDeferred(CleanPiiResult, CleanPiiResult1, p3)
		end
	end
	
	ScriptContext.ErrorDetailed:Connect(function(...) --[[ Line: 121 ]]
		-- upvalues: handleErrorDetailed (copy)
		local Success, Result = pcall(handleErrorDetailed, ...)
		
		if not Success then
			warn(("CEV error reporter failed to handle an error:\n%s"):format(Result))
		end
	end)
	config.ServerVersion = RobloxReplicatedStorage:WaitForChild("GetServerVersion", 1e999):InvokeServer()
end