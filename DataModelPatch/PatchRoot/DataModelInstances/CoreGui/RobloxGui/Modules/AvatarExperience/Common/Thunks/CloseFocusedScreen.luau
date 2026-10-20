local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local IsRootRouteInRNModule = require(Modules.LuaApp.Navigation.isRootRouteInRN)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return function(p1)
	-- upvalues: NavigationUtilsModule (copy), IsRootRouteInRNModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackModule (copy), RoactNavigationModule (copy)
	return function(p2)
		-- upvalues: NavigationUtilsModule (upval), p1 (copy), IsRootRouteInRNModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateBackModule (upval), RoactNavigationModule (upval)
		if not IsRootRouteInRNModule(NavigationUtilsModule.getRootNavigation(p1).state) then
			p1.dispatch(RoactNavigationModule.Actions.back(nil))
			
			return
		end
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.back(false)
			
			return
		else
			p2:dispatch(NavigateBackModule(false))
		end
	end
end