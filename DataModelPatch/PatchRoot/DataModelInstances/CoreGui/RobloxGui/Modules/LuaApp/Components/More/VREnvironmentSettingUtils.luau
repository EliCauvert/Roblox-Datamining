local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local AppStorageService = game:GetService("AppStorageService")
local Lighting = game:GetService("Lighting")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local Default = require(CorePackages.Workspace.Packages.AppCommonLib).Utils.AppStorageJsonCacheUtils.default
local GetSystemThemeModule = require(Modules.LuaApp.Components.EventReceivers.GetSystemTheme)
local SystemThemeFeatureModule = require(Modules.LuaApp.Components.EventReceivers.SystemThemeFeature)
local VREnvironmentSettingEnum = { System = "System", Light = "Light", Dark = "Dark" }
local VREnvironmentSettingEnumEntry = VREnvironmentSettingEnum[SharedFlagsModule.GetFStringDefaultVREnvironmentSetting()] or VREnvironmentSettingEnum.Light
local FIntVREnvironmentSettingLightClockTime = SharedFlagsModule.GetFIntVREnvironmentSettingLightClockTime()
local FIntVREnvironmentSettingDarkClockTime = SharedFlagsModule.GetFIntVREnvironmentSettingDarkClockTime()
local VREnvironmentSettingUtils = {
	VREnvironmentSettingEnum = VREnvironmentSettingEnum,
	isValidLocalUserId = function(Key): boolean
		local Number: number? = tonumber(Key)
		
		return Number ~= nil and Number > 0
	end,
	getEnvironmentSettingFromName = function(p1)
		-- upvalues: VREnvironmentSettingEnum (copy)
		return if p1 then VREnvironmentSettingEnum[p1] else nil
	end
}

function VREnvironmentSettingUtils.getCachedEnvironmentSetting(p1, p2)
	-- upvalues: VREnvironmentSettingUtils (copy), VREnvironmentSettingEnumEntry (copy), Default (copy)
	if VREnvironmentSettingUtils.isValidLocalUserId(p1) then
		local Result = ((p2 or {}).appStorageJsonCacheUtils or Default):decodeInternal("VREnvironmentSetting").result
		
		return VREnvironmentSettingUtils.getEnvironmentSettingFromName(if type(Result) == "table" then Result[p1] else nil) or VREnvironmentSettingEnumEntry
	else
		return VREnvironmentSettingEnumEntry
	end
end

function VREnvironmentSettingUtils.setCachedEnvironmentSetting(Key, p1, p2)
	-- upvalues: VREnvironmentSettingUtils (copy), Default (copy), AppStorageService (copy), HttpService (copy)
	if not VREnvironmentSettingUtils.isValidLocalUserId(Key) then return end
	local EnvironmentSettingFromName = VREnvironmentSettingUtils.getEnvironmentSettingFromName(p1)
	
	if not EnvironmentSettingFromName then return end
	local P6 = p2 or {}
	local AppStorageService1 = P6.appStorageService or AppStorageService
	local HttpService1 = P6.httpService or HttpService
	local Result = (P6.appStorageJsonCacheUtils or Default):decodeInternal("VREnvironmentSetting").result
	
	if type(Result) ~= "table" then
		Result = {}
	end
	Result[Key] = EnvironmentSettingFromName
	AppStorageService1:SetItem("VREnvironmentSetting", HttpService1:JSONEncode(Result))
	AppStorageService1:Flush()
end

function VREnvironmentSettingUtils.applyLightSetting(p1)
	-- upvalues: Lighting (copy), FIntVREnvironmentSettingLightClockTime (copy)
	((p1 or {}).lighting or Lighting).ClockTime = FIntVREnvironmentSettingLightClockTime
end

function VREnvironmentSettingUtils.applyDarkSetting(p1)
	-- upvalues: Lighting (copy), FIntVREnvironmentSettingDarkClockTime (copy)
	((p1 or {}).lighting or Lighting).ClockTime = FIntVREnvironmentSettingDarkClockTime
end

function VREnvironmentSettingUtils.applyEnvironmentSetting(CachedEnvironmentSetting, p1)
	-- upvalues: VREnvironmentSettingEnum (copy), SystemThemeFeatureModule (copy), GetSystemThemeModule (copy), VREnvironmentSettingUtils (copy)
	local P10 = p1 or {}
	
	if CachedEnvironmentSetting == VREnvironmentSettingEnum.System then
		local SystemThemeEnum = P10.systemThemeEnum or SystemThemeFeatureModule.GetSystemThemeEnum()
		local SystemThemeService = P10.systemThemeService or SystemThemeFeatureModule.GetSystemThemeService()
		
		if not (if P10.systemThemeEnabled == nil then SystemThemeFeatureModule.GetSystemThemeEnabled() else P10.systemThemeEnabled) or not SystemThemeEnum or not SystemThemeService then return end
		local SystemTheme = if P10.getSystemTheme then P10.getSystemTheme(SystemThemeService) else GetSystemThemeModule(SystemThemeService)
		
		if SystemThemeEnum.isLightTheme(SystemTheme) then
			VREnvironmentSettingUtils.applyLightSetting(P10)
			
			return
		end
		if SystemThemeEnum.isDarkTheme(SystemTheme) then
			VREnvironmentSettingUtils.applyDarkSetting(P10)
			
			return
		end
	elseif CachedEnvironmentSetting == VREnvironmentSettingEnum.Light then
		VREnvironmentSettingUtils.applyLightSetting(P10)
		
		return
	else
		if CachedEnvironmentSetting == VREnvironmentSettingEnum.Dark then
			VREnvironmentSettingUtils.applyDarkSetting(P10)
		end
	end
end

function VREnvironmentSettingUtils.applyCachedEnvironmentSetting(p1, p2)
	-- upvalues: VREnvironmentSettingUtils (copy)
	VREnvironmentSettingUtils.applyEnvironmentSetting(VREnvironmentSettingUtils.getCachedEnvironmentSetting(p1, p2), p2)
end

return VREnvironmentSettingUtils