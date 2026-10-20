local CorePackages = game:GetService("CorePackages")
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local _ = require(CorePackages.Workspace.Packages.Navigation)
local RobloxAppNavigationCoreModule = require(CorePackages.Workspace.Packages.RobloxAppNavigationCore)
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local CreateLazyComponentFunction = require(CorePackages.Workspace.Packages.RoactUtils).Components.createLazyComponent
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local FFlagLuaAppChartsAppPage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppChartsAppPage
local AppIaHomeSubTabLazy = game:DefineFastFlag("AppIaHomeSubTabLazy", false)
local list = {
	{
		[AppPage.Home] = {
			screen = CreateLazyComponentFunction(function()
				-- upvalues: Default (copy), Modules (copy)
				Default:logEventOnce("lazily_require_home_page")
				
				return require(Modules.Personalization.Home.HomePage)
			end)
		}
	},
	{
		[AppPage.Games] = {
			screen = CreateLazyComponentFunction(function()
				-- upvalues: FFlagLuaAppChartsAppPage (copy), Modules (copy)
				return if FFlagLuaAppChartsAppPage then require(Modules.Personalization.Games.SduiChartsPage) else require(Modules.Personalization.Games.GamesPage)
			end)
		}
	}
}
local config = { initialRouteName = AppPage.Home }

return function()
	-- upvalues: AppIaHomeSubTabLazy (copy), RobloxAppNavigationCoreModule (copy), list (copy), config (copy), RoactNavigationModule (copy)
	return RoactNavigationModule.createNavigator(RobloxAppNavigationCoreModule.AppSwitchView, if AppIaHomeSubTabLazy then RobloxAppNavigationCoreModule.createLazySwitchRouter(list, config) else RoactNavigationModule.SwitchRouter(list, config), config)
end