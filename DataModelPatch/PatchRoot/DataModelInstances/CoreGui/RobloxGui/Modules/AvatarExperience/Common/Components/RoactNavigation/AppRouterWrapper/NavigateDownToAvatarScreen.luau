local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local AppPageModule = require(Modules.LuaApp.AppPage)
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return function(RouteName, Detail, p1)
	-- upvalues: AvatarScreenProperties (copy), AppPageModule (copy), CryoModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	local AvatarScreenProperty = AvatarScreenProperties[RouteName]
	local IsTransparent = AvatarScreenProperty and AvatarScreenProperty.isTransparent
	
	return function(p2)
		-- upvalues: IsTransparent (copy), AppPageModule (upval), Detail (copy), RouteName (copy), CryoModule (upval), p1 (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownModule (upval)
		local config = {
			name = IsTransparent and AppPageModule.AvatarExperienceWrapperTransparent or AppPageModule.AvatarExperienceWrapper,
			detail = Detail,
			extraProps = {
				routeName = RouteName,
				params = CryoModule.Dictionary.join(p1 or {}, { detail = Detail })
			}
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			return p2:dispatch(NavigateDownModule(config))
		end
	end
end