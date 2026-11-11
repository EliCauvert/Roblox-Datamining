local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local TypeModule = require(Modules.LuaApp.Enum.Challenge.Type)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local GetFFlagDispatchHybridWebviewWithBypassNavigationLockModule = require(Modules.LuaApp.Flags.GetFFlagDispatchHybridWebviewWithBypassNavigationLock)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return function(ExtraProps, p1, p2)
	-- upvalues: TypeModule (copy), GetFFlagDispatchHybridWebviewWithBypassNavigationLockModule (copy), AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	return function(p3)
		-- upvalues: ExtraProps (copy), TypeModule (upval), p1 (copy), GetFFlagDispatchHybridWebviewWithBypassNavigationLockModule (upval), AppPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), p2 (copy), NavigateDownModule (upval)
		local IsChallengeTypeMatch = if p1 ~= nil then p1 else ExtraProps.challengeType == TypeModule.Captcha
		
		if GetFFlagDispatchHybridWebviewWithBypassNavigationLockModule() then
			local config = {
				name = IsChallengeTypeMatch and AppPageModule.ChallengeHybridOverlayPage or AppPageModule.ChallengeHybridWebView,
				extraProps = ExtraProps
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config), p2)
				
				return
			else
				p3:dispatch(NavigateDownModule(config, p2))
				
				return
			end
		else
			local config1 = {
				name = IsChallengeTypeMatch and AppPageModule.ChallengeHybridOverlayPage or AppPageModule.ChallengeHybridWebView,
				extraProps = ExtraProps
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config1))
				
				return
			else
				p3:dispatch(NavigateDownModule(config1))
			end
		end
	end
end