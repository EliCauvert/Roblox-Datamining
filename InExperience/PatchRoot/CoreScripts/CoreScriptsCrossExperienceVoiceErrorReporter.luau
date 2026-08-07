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
local backtraceReporter = require(corePackagesService.Workspace.Packages.ErrorReporters).BacktraceReporter
game:DefineFastFlag("DisableCEVBacktraceReporting", false)
game:DefineFastString("CoreScriptBacktraceErrorUploadToken", "")
game:DefineFastInt("CEVBacktracePIIFilterEraseTimeoutSeconds", 300)
game:DefineFastFlag("CEVBacktraceRepeatedErrorRateLimiting", true)
game:DefineFastInt("CEVBacktraceRepeatedErrorRateLimitCount", 5)
game:DefineFastInt("CEVBacktraceRepeatedErrorRateLimitPeriod", 60)
game:DefineFastInt("CEVBacktraceRepeatedErrorRateLimitProcessIntervalTenths", 10)
game:DefineFastInt("CEVBacktraceErrorReportPercentage", 100)

local function _() --[[ line: 41 | named "CanReportCEVBacktrace" ]]
	return math.random(1, 100) <= math.clamp(game:GetFastInt("CEVBacktraceErrorReportPercentage"), 0, 100)
end

if not game:GetFastFlag("DisableCEVBacktraceReporting") and game:GetFastString("CoreScriptBacktraceErrorUploadToken") ~= "" and math.random(1, 100) <= math.clamp(game:GetFastInt("CEVBacktraceErrorReportPercentage"), 0, 100) then
	local t = {
		AppName = "CrossExperienceVoice",
		LocalVersion = runService:GetRobloxVersion(),
		BaseUrl = contentProviderService.BaseUrl,
		PlaceId = game.PlaceId,
		Platform = userInputService:GetPlatform().Name,
		UserAgent = httpService:GetUserAgent(),
		CoreScriptVersion = runService:GetCoreScriptVersion()
	}
	local var12 = piiFilterModule.new({
		eraseTimeout = game:GetFastInt("CEVBacktracePIIFilterEraseTimeoutSeconds")
	})
	local CEVBacktraceRepeatedErrorRateLimitingFastFlag = game:GetFastFlag("CEVBacktraceRepeatedErrorRateLimiting")
	local var14 = if CEVBacktraceRepeatedErrorRateLimitingFastFlag then rateLimiterModule.new({
		period = game:GetFastInt("CEVBacktraceRepeatedErrorRateLimitPeriod"),
		threshold = game:GetFastInt("CEVBacktraceRepeatedErrorRateLimitCount"),
		processInterval = game:GetFastInt("CEVBacktraceRepeatedErrorRateLimitProcessIntervalTenths") / 10
	}) else nil
	local var15 = backtraceReporter.new({
		httpService = httpService,
		token = game:GetFastString("CoreScriptBacktraceErrorUploadToken"),
		processErrorReportMethod = function(p0) --[[ line: 76 ]]
			-- upvalues: t (ref), playersService (ref), runService (ref)
			p0:addAttributes(t)
			p0:addAttributes({
				PlayerCount = #playersService:GetPlayers(),
				RobloxChannel = runService:GetRobloxClientChannel()
			})
			
			return p0
		end
	})
	
	local function handleErrorDetailed(p1, p2, p3, p4) --[[ line: 94 ]]
		-- upvalues: coreGuiService (ref), corePackagesService (ref), var12 (ref), CEVBacktraceRepeatedErrorRateLimitingFastFlag (ref), var14 (write), var15 (ref)
		if p3 ~= nil and (p3:IsDescendantOf(coreGuiService) or p3:IsDescendantOf(corePackagesService)) then
			local var17 = var12:cleanPii(p1)
			local var18 = var12:cleanPii(p2)
			
			if p4 ~= nil then
				p4 = var12:cleanPii(p4)
			end
			if CEVBacktraceRepeatedErrorRateLimitingFastFlag then
				local text = var17 .. var18
				
				if var14:isRateLimited(text) then return end
				var14:increment(text)
			end
			var15:reportErrorDeferred(var17, var18, p4)
		end
	end
	
	scriptContextService.ErrorDetailed:Connect(function(...) --[[ line: 121 ]]
		-- upvalues: handleErrorDetailed (ref)
		local ok, status = pcall(handleErrorDetailed, ...)
		
		if not ok then
			warn(("CEV error reporter failed to handle an error:\n%s"):format(status))
		end
	end)
	t.ServerVersion = robloxReplicatedStorageService:WaitForChild("GetServerVersion", 1e999):InvokeServer()
end