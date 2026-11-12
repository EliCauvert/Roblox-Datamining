local AppStorageService = game:GetService("AppStorageService")
local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local SentryReporter = require(CorePackages.Workspace.Packages.ErrorReporters).SentryReporter
local FFlagCoreScriptSentryReportDeviceContextModule = require(script.Parent.Parent.Flags.FFlagCoreScriptSentryReportDeviceContext)
local SystemInfoProtocol = if FFlagCoreScriptSentryReportDeviceContextModule then require(CorePackages.Workspace.Packages.SystemInfoProtocol).SystemInfoProtocol else nil
local FFlagCoreScriptSentrySetUserModule = require(script.Parent.Parent.Flags.FFlagCoreScriptSentrySetUser)
local FFlagCoreScriptSentryReportTagsModule = require(script.Parent.Parent.Flags.FFlagCoreScriptSentryReportTags)

local function getDeviceAttributes(RunService)
	-- upvalues: SystemInfoProtocol (copy)
	local t = {}
	local Success, Result = pcall(function()
		-- upvalues: SystemInfoProtocol (upval)
		return SystemInfoProtocol.default:getSystemInfo(SystemInfoProtocol.ALL_INFO_NAMES)
	end)
	
	if Success and typeof(Result) == "table" then
		for i, value in Result do
			t[i] = value
		end
	end
	local Success1, Result1, Result3 = pcall(function()
		-- upvalues: RunService (copy)
		return RunService:GetControlAndVariantRolloutFlags()
	end)
	
	if Success1 then
		if Result1 ~= nil and Result1 ~= "" then
			t.RolloutFlagsInControl = Result1
		end
		if Result3 ~= nil and Result3 ~= "" then
			t.RolloutFlagsInVariant = Result3
		end
	end
	return t
end

local function _(p1)
	-- upvalues: HttpService (copy)
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy)
		return p1:GetItem("AppInstallationId")
	end)
	
	return if Success and Result ~= nil and Result ~= "" then Result else HttpService:GenerateGUID(false)
end

local config = {
	client_platform = "Platform",
	place_id = "PlaceId",
	app_version = "LocalVersion",
	roblox_channel = "RobloxChannel"
}

local function getTags(Attributes)
	-- upvalues: config (copy)
	local t = {}
	
	for i, value in config do
		local Attribute = Attributes[value]
		
		if Attribute ~= nil then
			t[i] = tostring(Attribute)
		end
	end
	return t
end

return function(p1)
	-- upvalues: RunService (copy), AppStorageService (copy), FFlagCoreScriptSentryReportTagsModule (copy), getTags (copy), FFlagCoreScriptSentryReportDeviceContextModule (copy), getDeviceAttributes (copy), SentryReporter (copy), HttpService (copy), FFlagCoreScriptSentrySetUserModule (copy)
	local RunService1 = p1.runService or RunService
	local AppStorageService1 = p1.appStorageService or AppStorageService
	local IsStudio = false
	
	local function processErrorReport(p2)
		-- upvalues: p1 (copy), FFlagCoreScriptSentryReportTagsModule (upval), getTags (upval), FFlagCoreScriptSentryReportDeviceContextModule (upval), getDeviceAttributes (upval), RunService1 (copy)
		local ProcessErrorReportResult = p1.processErrorReportMethod(p2)
		ProcessErrorReportResult:addCustomMetadata({ CoreScripts = ProcessErrorReportResult.attributes })
		
		if FFlagCoreScriptSentryReportTagsModule then
			ProcessErrorReportResult.tags = getTags(ProcessErrorReportResult.attributes)
		end
		if FFlagCoreScriptSentryReportDeviceContextModule then
			ProcessErrorReportResult:addAttributes((getDeviceAttributes(RunService1)))
		end
		return ProcessErrorReportResult
	end
	
	local Success, Result = pcall(function()
		-- upvalues: IsStudio (ref), RunService1 (copy), SentryReporter (upval), HttpService (upval), processErrorReport (copy), p1 (copy), FFlagCoreScriptSentrySetUserModule (upval), AppStorageService1 (copy)
		IsStudio = RunService1:IsStudio()
		local NewSentryReporter = SentryReporter.new({
			disableDevelopmentLogging = true,
			httpService = HttpService,
			processErrorReportMethod = processErrorReport,
			dsn = p1.dsn,
			environment = if IsStudio then "development" else "production",
			release = RunService1:GetCoreScriptVersion() or "unknown"
		})
		
		if FFlagCoreScriptSentrySetUserModule and NewSentryReporter ~= nil then
			local Success, Result = pcall(function()
				-- upvalues: AppStorageService1 (copy)
				return AppStorageService1:GetItem("AppInstallationId")
			end)
			NewSentryReporter:setUser({
				id = if Success and Result ~= nil and Result ~= "" then Result else HttpService:GenerateGUID(false)
			})
		end
		return NewSentryReporter
	end)
	
	if Success then
		return Result
	end
	if IsStudio then
		warn(("[CoreScriptSentryReporter] Failed to initialize: %s"):format((tostring(Result))))
	end
	return nil
end