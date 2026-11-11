local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local SignalsModule = require(CorePackages.Packages.Signals)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local DataHydrationModule = require(CorePackages.Workspace.Packages.DataHydration)
local _ = require(Modules.LuaApp.Themes.RobloxPlusTheme)
local GetRobloxPlusThemeStoreModule = require(Modules.LuaApp.Themes.Stores.GetRobloxPlusThemeStore)
local UseLocalPlayerUserIdModule = require(script.Parent.useLocalPlayerUserId)

return function()
	-- upvalues: DataHydrationModule (copy), UseLocalPlayerUserIdModule (copy), ReactModule (copy), SignalsModule (copy), UseSignalStateFunction (copy), GetRobloxPlusThemeStoreModule (copy)
	local UserSettingsStore = DataHydrationModule.UserSettings.getUserSettingsStore(false)
	local UseLocalPlayerUserIdModuleResult = UseLocalPlayerUserIdModule()
	local UseSignalStateResult = UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseLocalPlayerUserIdModuleResult (copy), UserSettingsStore (copy)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: UseLocalPlayerUserIdModuleResult (upval), UserSettingsStore (upval)
			return if UseLocalPlayerUserIdModuleResult <= 0 then nil else UserSettingsStore.getAndFetchAccountTheme(p1)
		end)
	end, { UserSettingsStore, UseLocalPlayerUserIdModuleResult })))
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), GetRobloxPlusThemeStoreModule (upval)
		if UseSignalStateResult ~= nil then
			GetRobloxPlusThemeStoreModule(false).setColorThemeKey(UseSignalStateResult)
		end
	end, { UseSignalStateResult, UseLocalPlayerUserIdModuleResult })
end