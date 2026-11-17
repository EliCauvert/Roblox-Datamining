local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableGroupSidebarSdui = SharedFlagsModule.FFlagEnableGroupSidebarSdui
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local NavigateToGroupPageModule = require(ProfilePlatform.Utils.navigateToGroupPage)

return function(p1, Callback: (any) -> ())
	-- upvalues: FFlagEnableGroupSidebarSdui (copy), AppPage (copy), NavigateToGroupPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	if FFlagEnableGroupSidebarSdui and p1.name == AppPage.Groups then
		NavigateToGroupPageModule(p1, Callback)
		
		return
	end
	if FFlagSignalsNavP3Dispatch then
		NavigationCommands.down(NavigationCommands.fromLegacyPage(p1))
		
		return
	else
		Callback(NavigateDownFunction(p1))
	end
end