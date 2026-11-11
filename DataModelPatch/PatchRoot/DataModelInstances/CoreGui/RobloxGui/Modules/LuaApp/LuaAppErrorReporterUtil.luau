local CorePackages = game:GetService("CorePackages")
local ContentProvider = game:GetService("ContentProvider")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local MemStorageService = game:GetService("MemStorageService")
local AppStorageService = game:GetService("AppStorageService")
local SafeCallModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Util.safeCall)
local LuaAppErrorReportCountryCode = game:DefineFastFlag("LuaAppErrorReportCountryCode", false)
local SystemInfoProtocol = require(CorePackages.Workspace.Packages.SystemInfoProtocol).SystemInfoProtocol
local LocalStorageKey = require(CorePackages.Workspace.Packages.LocalStorage).Enums.LocalStorageKey
local AppStaticAttributes = nil
local LuaAppErrorReporterUtil = {
	getAppStaticAttributes = function()
		-- upvalues: SafeCallModule (copy), RunService (copy), HttpService (copy), ContentProvider (copy), MemStorageService (copy), AppStorageService (copy), LocalStorageKey (copy), SystemInfoProtocol (copy)
		return SafeCallModule(function()
			-- upvalues: RunService (upval), HttpService (upval), ContentProvider (upval), MemStorageService (upval), AppStorageService (upval), LocalStorageKey (upval), SystemInfoProtocol (upval)
			local config = {
				AppVersion = RunService:GetRobloxVersion(),
				UserAgent = HttpService:GetUserAgent(),
				BaseUrl = ContentProvider.BaseUrl,
				WindowsLaunchType = MemStorageService:GetItem("Backtrace.WindowsLaunchType"),
				CoreScriptVersion = RunService:GetCoreScriptVersion(),
				AppInstallationId = AppStorageService:GetItem(LocalStorageKey.AppInstallationId),
				RobloxChannel = RunService:GetRobloxClientChannel()
			}
			local ControlAndVariantRolloutFlags, ControlAndVariantRolloutFlags2 = RunService:GetControlAndVariantRolloutFlags()
			
			if ControlAndVariantRolloutFlags ~= nil and ControlAndVariantRolloutFlags ~= "" then
				config.RolloutFlagsInControl = ControlAndVariantRolloutFlags
			end
			if ControlAndVariantRolloutFlags2 ~= nil and ControlAndVariantRolloutFlags2 ~= "" then
				config.RolloutFlagsInVariant = ControlAndVariantRolloutFlags2
			end
			local Success, Result = pcall(function()
				-- upvalues: SystemInfoProtocol (upval)
				return SystemInfoProtocol.default:getSystemInfo(SystemInfoProtocol.ALL_INFO_NAMES)
			end)
			
			if Success and typeof(Result) == "table" then
				for i, value in pairs(Result) do
					config[i] = value
				end
			end
			return config
		end, {})
	end,
	getCountryCode = function(): string
		-- upvalues: AppStorageService (copy), LocalStorageKey (copy)
		local Item: string = AppStorageService:GetItem(LocalStorageKey.CountryCode)
		
		return if Item == nil or string.len(Item) <= 0 then "Unknown" else Item
	end
}

function LuaAppErrorReporterUtil.processReport(p1)
	-- upvalues: AppStaticAttributes (ref), LuaAppErrorReporterUtil (copy), LuaAppErrorReportCountryCode (copy)
	if not AppStaticAttributes then
		AppStaticAttributes = LuaAppErrorReporterUtil.getAppStaticAttributes()
	end
	p1:addAttributes({
		AppRunningTime = string.format("%.02f", elapsedTime()),
		CountryCode = if LuaAppErrorReportCountryCode then LuaAppErrorReporterUtil.getCountryCode() else nil
	})
	p1:addAttributes(AppStaticAttributes)
	
	return p1
end

return LuaAppErrorReporterUtil