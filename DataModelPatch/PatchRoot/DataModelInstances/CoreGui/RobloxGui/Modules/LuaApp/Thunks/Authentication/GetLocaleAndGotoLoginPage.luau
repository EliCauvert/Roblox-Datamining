local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SetAuthenticationStatusFunction = require(CorePackages.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local AppStorageUtilitiesModule = require(script.Parent.AppStorageUtilities)
local LoginStatusModule = require(Modules.LuaApp.Enum.LoginStatus)
local FetchLocaleModule = require(Modules.LuaApp.Thunks.FetchLocale)
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FlagSettingsModule = require(Modules.LuaApp.FlagSettings)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return function(p1)
	-- upvalues: FetchLocaleModule (copy), AppStorageUtilitiesModule (copy), SetAuthenticationStatusFunction (copy), LoginStatusModule (copy), FlagSettingsModule (copy), ResetNavigationHistoryModule (copy), AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	return function(p2)
		-- upvalues: FetchLocaleModule (upval), p1 (copy), AppStorageUtilitiesModule (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval), FlagSettingsModule (upval), ResetNavigationHistoryModule (upval), AppPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownModule (upval)
		return FetchLocaleModule(p1):andThen(function(Result)
			-- upvalues: AppStorageUtilitiesModule (upval), p2 (copy), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval), FlagSettingsModule (upval), ResetNavigationHistoryModule (upval), AppPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownModule (upval)
			AppStorageUtilitiesModule.setRobloxLocaleId(Result.signupAndLoginLocale)
			p2:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_OUT))
			
			if FlagSettingsModule.WeChatLoginEnabled() then
				p2:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.WeChatLoginWrapper } }))
				
				return
			end
			if FlagSettingsModule.LuaAppLoginUIEnabled() then
				p2:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.Landing } }))
				
				return
			end
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage({ name = AppPageModule.LoginNative }))
				
				return
			else
				p2:dispatch(NavigateDownModule({ name = AppPageModule.LoginNative }))
			end
		end)
	end
end