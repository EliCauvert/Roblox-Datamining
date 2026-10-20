local CorePackages = game:GetService("CorePackages")
local Lighting = game:GetService("Lighting")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseLocalUserIdFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useLocalUserId
local UseIsSpatialFunction = require(CorePackages.Workspace.Packages.Responsive).useIsSpatial
local VREnvironmentSettingUtilsModule = require(Modules.LuaApp.Components.More.VREnvironmentSettingUtils)
local SystemThemeFeatureModule = require(Modules.LuaApp.Components.EventReceivers.SystemThemeFeature)

local function _(p1)
	return {
		appStorageJsonCacheUtils = p1.AppStorageJsonCacheUtils,
		appStorageService = p1.AppStorageService,
		httpService = p1.HttpService,
		lighting = p1.Lighting,
		systemThemeEnabled = p1.SystemThemeEnabled,
		systemThemeEnum = p1.SystemThemeEnum,
		systemThemeService = p1.SystemThemeService,
		getSystemTheme = p1.getSystemTheme
	}
end

return function(p1)
	-- upvalues: UseLocalUserIdFunction (copy), UseIsSpatialFunction (copy), ReactModule (copy), Lighting (copy), VREnvironmentSettingUtilsModule (copy), SystemThemeFeatureModule (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		return {
			appStorageJsonCacheUtils = p1.AppStorageJsonCacheUtils,
			appStorageService = p1.AppStorageService,
			httpService = p1.HttpService,
			lighting = p1.Lighting,
			systemThemeEnabled = p1.SystemThemeEnabled,
			systemThemeEnum = p1.SystemThemeEnum,
			systemThemeService = p1.SystemThemeService,
			getSystemTheme = p1.getSystemTheme
		}
	end, {
		p1.AppStorageJsonCacheUtils, p1.AppStorageService, p1.HttpService, p1.Lighting,
		p1.SystemThemeEnabled, p1.SystemThemeEnum, p1.SystemThemeService,
		p1.getSystemTheme
	})
	ReactModule.useEffect(function()
		-- upvalues: UseIsSpatialResult (copy), Lighting (upval)
		if UseIsSpatialResult then
			pcall(function()
				-- upvalues: Lighting (upval)
				local Sky = Lighting:FindFirstChild("Sky")
				
				if Sky then
					Sky:Destroy()
				end
			end)
			
			return
		end
	end, { UseIsSpatialResult })
	ReactModule.useEffect(function()
		-- upvalues: UseIsSpatialResult (copy), VREnvironmentSettingUtilsModule (upval), UseLocalUserIdResult (copy), UseMemoResult (copy), SystemThemeFeatureModule (upval)
		if not UseIsSpatialResult then return end
		VREnvironmentSettingUtilsModule.applyCachedEnvironmentSetting(UseLocalUserIdResult, UseMemoResult)
		local SystemThemeService = UseMemoResult.systemThemeService or SystemThemeFeatureModule.GetSystemThemeService()
		local OnLuaThemeUpdated = SystemThemeService and SystemThemeService.OnLuaThemeUpdated
		
		if not OnLuaThemeUpdated then return end
		local Connection = OnLuaThemeUpdated:Connect(function()
			-- upvalues: VREnvironmentSettingUtilsModule (upval), UseLocalUserIdResult (upval), UseMemoResult (upval)
			local CachedEnvironmentSetting = VREnvironmentSettingUtilsModule.getCachedEnvironmentSetting(UseLocalUserIdResult, UseMemoResult)
			
			if CachedEnvironmentSetting == VREnvironmentSettingUtilsModule.VREnvironmentSettingEnum.System then
				VREnvironmentSettingUtilsModule.applyEnvironmentSetting(CachedEnvironmentSetting, UseMemoResult)
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { UseIsSpatialResult, UseLocalUserIdResult, UseMemoResult })
	
	return nil
end