local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local SentryReporter = require(game:GetService("CorePackages").Workspace.Packages.ErrorReporters).SentryReporter
local LuaAppErrorReporterUtilModule = require(script.Parent.LuaAppErrorReporterUtil)
local LuaAppBacktraceLoggerModule = require(script.Parent.LuaAppBacktraceLogger)
local LuaAppSentryReporterMetricsModule = require(script.Parent.Sentry.LuaAppSentryReporterMetrics)
local IsStudio = RunService:IsStudio()
local LuaAppSentryDsn = game:DefineFastString("LuaAppSentryDsn", "")
local LuaAppSentryAddVersionChannelTags = game:DefineFastFlag("LuaAppSentryAddVersionChannelTags", false)
local LuaAppSentryAddUserContext = game:DefineFastFlag("LuaAppSentryAddUserContext", false)
local v1 = nil

if LuaAppSentryDsn ~= "" then
	local CoreScriptVersion = RunService:GetCoreScriptVersion()
	
	if IsStudio then
		print("[LuaAppSentryReporter] CoreScript Version:", CoreScriptVersion)
	end
	local Success, Result = pcall(function()
		-- upvalues: SentryReporter (copy), HttpService (copy), LuaAppErrorReporterUtilModule (copy), LuaAppBacktraceLoggerModule (copy), LuaAppSentryDsn (copy), IsStudio (copy), CoreScriptVersion (copy), LuaAppSentryReporterMetricsModule (copy)
		return SentryReporter.new({
			httpService = HttpService,
			processErrorReportMethod = LuaAppErrorReporterUtilModule.processReport,
			generateLogMethod = function()
				-- upvalues: LuaAppBacktraceLoggerModule (upval)
				return LuaAppBacktraceLoggerModule:generateAppLog()
			end,
			dsn = LuaAppSentryDsn,
			environment = if IsStudio then "development" else "production",
			release = CoreScriptVersion or "unknown",
			sentryClientSuccessCallback = function()
				-- upvalues: LuaAppSentryReporterMetricsModule (upval)
				LuaAppSentryReporterMetricsModule.logErrorSentSuccess()
			end,
			sentryClientFailureCallback = function()
				-- upvalues: LuaAppSentryReporterMetricsModule (upval)
				LuaAppSentryReporterMetricsModule.logErrorSentFailure()
			end,
			logAttachmentSuccessCallback = function()
				-- upvalues: LuaAppSentryReporterMetricsModule (upval)
				LuaAppSentryReporterMetricsModule.logLogAttachmentSuccess()
			end,
			logAttachmentFailureCallback = function()
				-- upvalues: LuaAppSentryReporterMetricsModule (upval)
				LuaAppSentryReporterMetricsModule.logLogAttachmentFailure()
			end
		})
	end)
	
	if Success then
		v1 = Result
		LuaAppSentryReporterMetricsModule.logInitSuccess()
		
		if LuaAppSentryAddVersionChannelTags then
			local RobloxVersion = RunService:GetRobloxVersion()
			local RobloxClientChannel = RunService:GetRobloxClientChannel()
			
			if v1 then
				if RobloxVersion then
					v1:setTag("app_version", RobloxVersion)
				end
				if RobloxClientChannel then
					v1:setTag("roblox_channel", RobloxClientChannel)
				end
			end
		end
		if LuaAppSentryAddUserContext and v1 then
			v1:setUser({ id = HttpService:GenerateGUID(false) })
		end
		if IsStudio then
			print("[LuaAppSentryReporter] Initialized successfully")
			
			return v1
		end
	else
		LuaAppSentryReporterMetricsModule.logInitFailure()
		
		if IsStudio then
			warn("[LuaAppSentryReporter] Failed to initialize:", Result)
		end
	end
end
return v1