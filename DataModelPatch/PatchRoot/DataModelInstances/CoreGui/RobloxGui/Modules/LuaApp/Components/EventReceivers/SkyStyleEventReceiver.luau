local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseLocalUserIdFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useLocalUserId
local UseIsSpatialFunction = require(CorePackages.Workspace.Packages.Responsive).useIsSpatial
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local SkyStyleUtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.More.SkyStyleUtils)

local function _(p1)
	return {
		appStorageJsonCacheUtils = p1.AppStorageJsonCacheUtils,
		appStorageService = p1.AppStorageService,
		httpService = p1.HttpService,
		lighting = p1.Lighting
	}
end

return function(p1)
	-- upvalues: UseLocalUserIdFunction (copy), UseIsSpatialFunction (copy), ReactModule (copy), SkyStyleUtilsModule (copy), Logger (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		return {
			appStorageJsonCacheUtils = p1.AppStorageJsonCacheUtils,
			appStorageService = p1.AppStorageService,
			httpService = p1.HttpService,
			lighting = p1.Lighting
		}
	end, {
		p1.AppStorageJsonCacheUtils,
		p1.AppStorageService,
		p1.HttpService,
		p1.Lighting
	})
	ReactModule.useEffect(function()
		-- upvalues: UseIsSpatialResult (copy), SkyStyleUtilsModule (upval), UseMemoResult (copy)
		if UseIsSpatialResult then
			pcall(function()
				-- upvalues: SkyStyleUtilsModule (upval), UseMemoResult (upval)
				SkyStyleUtilsModule.createSimpleSky(UseMemoResult)
			end)
			
			return
		end
	end, { UseIsSpatialResult, UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: UseIsSpatialResult (copy), Logger (upval), UseLocalUserIdResult (copy), SkyStyleUtilsModule (upval), UseMemoResult (copy)
		if UseIsSpatialResult then
			Logger:info("[SkyStyleEventReceiver] Applying cached sky style for userId: " .. tostring(UseLocalUserIdResult))
			SkyStyleUtilsModule.applyCachedSkyStyle(UseLocalUserIdResult, UseMemoResult)
			
			return
		end
	end, { UseIsSpatialResult, UseLocalUserIdResult, UseMemoResult })
	
	return nil
end