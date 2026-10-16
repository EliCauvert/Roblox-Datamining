local AvatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local Parent = AvatarExperienceNavigation.Parent
local CryoModule = require(Parent.Cryo)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local AvatarScreenPropertiesModule = require(AvatarExperienceNavigation.AvatarRoute.AvatarScreenProperties)
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(RouteName, Detail, p1) --[[ Line: 19 | Named "NavigateDownToAvatarScreen" ]]
	-- upvalues: AvatarScreenPropertiesModule (copy), AppPage (copy), CryoModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	local AvatarScreenPropertiesModuleEntry = AvatarScreenPropertiesModule[RouteName]
	local IsTransparent = AvatarScreenPropertiesModuleEntry and AvatarScreenPropertiesModuleEntry.isTransparent
	
	return function(p2) --[[ Line: 22 ]]
		-- upvalues: IsTransparent (copy), AppPage (upval), Detail (copy), RouteName (copy), CryoModule (upval), p1 (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
		local config = {
			name = IsTransparent and AppPage.AvatarExperienceWrapperTransparent or AppPage.AvatarExperienceWrapper,
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
			return p2:dispatch(NavigateDownFunction(config))
		end
	end
end