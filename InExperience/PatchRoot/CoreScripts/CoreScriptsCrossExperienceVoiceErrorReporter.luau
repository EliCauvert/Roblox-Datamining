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

local function _()
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
	local var1 = piiFilterModule.new({
		eraseTimeout = game:GetFastInt("CEVBacktracePIIFilterEraseTimeoutSeconds")
	})
	local CEVBacktraceRepeatedErrorRateLimitingFastFlag = game:GetFastFlag("CEVBacktraceRepeatedErrorRateLimiting")
	local var2 = if CEVBacktraceRepeatedErrorRateLimitingFastFlag then rateLimiterModule.new({
		period = game:GetFastInt("CEVBacktraceRepeatedErrorRateLimitPeriod"),
		threshold = game:GetFastInt("CEVBacktraceRepeatedErrorRateLimitCount"),
		processInterval = game:GetFastInt("CEVBacktraceRepeatedErrorRateLimitProcessIntervalTenths") / 10
	}) else nil
	local var3 = backtraceReporter.new({
		httpService = httpService,
		token = game:GetFastString("CoreScriptBacktraceErrorUploadToken"),
		processErrorReportMethod = function(p1)
			-- upvalues: t (ref), playersService (ref), runService (ref)
			p1:addAttributes(t)
			p1:addAttributes({
				PlayerCount = #playersService:GetPlayers(),
				RobloxChannel = runService:GetRobloxClientChannel()
			})
			
			return p1
		end
	})
	
	local function handleErrorDetailed(p1, p2, p3, p4)
		-- upvalues: coreGuiService (ref), corePackagesService (ref), var1 (ref), CEVBacktraceRepeatedErrorRateLimitingFastFlag (ref), var2 (write), var3 (ref)
		if p3 ~= nil and (p3:IsDescendantOf(coreGuiService) or p3:IsDescendantOf(corePackagesService)) then
			local var4 = var1:cleanPii(p1)
			local var5 = var1:cleanPii(p2)
			
			if p4 ~= nil then
				p4 = var1:cleanPii(p4)
			end
			if CEVBacktraceRepeatedErrorRateLimitingFastFlag then
				local text = var4 .. var18
				
				if var2:isRateLimited(text) then return end
				var2:increment(text)
			end
			var3:reportErrorDeferred(var4, var5, p4)
		end
	end
	
	scriptContextService.ErrorDetailed:Connect(function(...)
		-- upvalues: handleErrorDetailed (ref)
		local ok, status = pcall(handleErrorDetailed, ...)
		
		if not ok then
			warn(("CEV error reporter failed to handle an error:\n%s"):format(status))
		end
	end)
	t.ServerVersion = robloxReplicatedStorageService:WaitForChild("GetServerVersion", 1e999):InvokeServer()
end