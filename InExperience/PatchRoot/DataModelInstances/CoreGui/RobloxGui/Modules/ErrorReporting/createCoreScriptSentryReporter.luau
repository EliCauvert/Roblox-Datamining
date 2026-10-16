local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local SentryReporter = require(game:GetService("CorePackages").Workspace.Packages.ErrorReporters).SentryReporter

return function(p1) --[[ Line: 23 | Named "createCoreScriptSentryReporter" ]]
	-- upvalues: RunService (copy), SentryReporter (copy), HttpService (copy)
	local RunService1 = p1.runService or RunService
	local IsStudio = false
	
	local function processErrorReport(p2) --[[ Line: 30 ]]
		-- upvalues: p1 (copy)
		local ProcessErrorReportResult = p1.processErrorReportMethod(p2)
		ProcessErrorReportResult:addCustomMetadata({ CoreScripts = ProcessErrorReportResult.attributes })
		
		return ProcessErrorReportResult
	end
	
	local Success, Result = pcall(function() --[[ Line: 38 ]]
		-- upvalues: IsStudio (ref), RunService1 (copy), SentryReporter (upval), HttpService (upval), processErrorReport (copy), p1 (copy)
		IsStudio = RunService1:IsStudio()
		
		return SentryReporter.new({
			disableDevelopmentLogging = true,
			httpService = HttpService,
			processErrorReportMethod = processErrorReport,
			dsn = p1.dsn,
			environment = if IsStudio then "development" else "production",
			release = RunService1:GetCoreScriptVersion() or "unknown"
		})
	end)
	
	if Success then
		return Result
	end
	if IsStudio then
		warn(("[CoreScriptSentryReporter] Failed to initialize: %s"):format((tostring(Result))))
	end
	return nil
end