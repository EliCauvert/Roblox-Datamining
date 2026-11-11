local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NavigateToRouteModule = require(Modules.LuaApp.Thunks.NavigateToRoute)
local ApplyNavigateIntoAvatarExperienceModule = require(Modules.AvatarExperience.Common.Actions.ApplyNavigateIntoAvatarExperience)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local list = {
	{
		name = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen.AvatarExperienceRoot
	}
}

return function(p1, p2, p3)
	-- upvalues: ApplyNavigateIntoAvatarExperienceModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), list (copy), NavigateToRouteModule (copy)
	return function(p4)
		-- upvalues: ApplyNavigateIntoAvatarExperienceModule (upval), p1 (copy), p2 (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), list (upval), p3 (copy), NavigateToRouteModule (upval)
		p4:dispatch(ApplyNavigateIntoAvatarExperienceModule(p1, p2))
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.to(NavigationCommands.fromLegacyPage(list[#list]), p3)
			
			return
		else
			p4:dispatch(NavigateToRouteModule(list, p3))
		end
	end
end