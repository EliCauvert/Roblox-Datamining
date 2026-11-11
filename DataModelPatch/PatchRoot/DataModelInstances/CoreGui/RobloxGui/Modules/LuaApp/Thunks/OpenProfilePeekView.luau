local CorePackages = game:GetService("CorePackages")
local Modules = script:FindFirstAncestor("Modules")
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local AppPageModule = require(Modules.LuaApp.AppPage)
local DashModule = require(CorePackages.Packages.Dash)
local SocialStopwatchModule = require(CorePackages.Workspace.Packages.SocialStopwatch)
local SocialLuaAnalyticsModule = require(CorePackages.Workspace.Packages.SocialLuaAnalytics)
local Constants = require(CorePackages.Workspace.Packages.ContactImporter).Constants
local EventNamesModule = require(CorePackages.Workspace.Packages.ProfilePlatform.EventNames)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local v1 = require(CorePackages.Workspace.Packages.ProfilePlatform.initializeProfileAnalytics)()

return function(Detail, ExtraProps)
	-- upvalues: SocialStopwatchModule (copy), v1 (copy), EventNamesModule (copy), SocialLuaAnalyticsModule (copy), Constants (copy), AppPageModule (copy), DashModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	return function(p1)
		-- upvalues: SocialStopwatchModule (upval), ExtraProps (copy), v1 (upval), EventNamesModule (upval), SocialLuaAnalyticsModule (upval), Constants (upval), AppPageModule (upval), DashModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownModule (upval), Detail (copy)
		SocialStopwatchModule.Stopwatch.start(SocialStopwatchModule.Events.ProfileOpened);
		(if ExtraProps and ExtraProps.mockProfileAnalytics_dev then ExtraProps.mockProfileAnalytics_dev else v1).fireAnalyticsEvent(EventNamesModule.ProfileLoadingStage, {
			status = SocialLuaAnalyticsModule.Analytics.Enums.LoadingStages.Started
		})
		
		if ExtraProps and ExtraProps.profileType == Constants.CONTACTS_PROFILE_TYPE and ExtraProps.contactProps then
			local config1 = {
				name = AppPageModule.ProfilePlatform,
				detail = ExtraProps.contactProps.contactId,
				extraProps = DashModule.join(ExtraProps, { profileType = Constants.CONTACT })
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config1))
				
				return
			else
				p1:dispatch(NavigateDownModule(config1))
				
				return
			end
		else
			local config = {
				name = AppPageModule.ProfilePlatform,
				detail = Detail,
				extraProps = ExtraProps
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				p1:dispatch(NavigateDownModule(config))
			end
		end
	end
end