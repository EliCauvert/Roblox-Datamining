local Parent = script.Parent.Parent

return {
	projects = {
		require(Parent.Achievements)["jest.config"],
		require(Parent.AppHeaderBar)["jest.config"],
		require(Parent.AppNavBar)["jest.config"],
		require(Parent.AppTabBarRodux)["jest.config"],
		require(Parent.AppTopBanner)["jest.config"],
		require(Parent.BugReporting)["jest.config"],
		require(Parent.BumperNavigation)["jest.config"],
		require(Parent.CrossPlay)["jest.config"],
		require(Parent.HoldToPlay)["jest.config"],
		require(Parent.InExperienceLocales)["jest.config"],
		require(Parent.LogReporting)["jest.config"],
		require(Parent.NavigationRodux)["jest.config"],
		require(Parent.RobloxAppLocales)["jest.config"],
		require(Parent.RobloxAppUpdate)["jest.config"],
		require(Parent.RobloxAppToastsRodux)["jest.config"],
		require(Parent.RobloxAppNavigation)["jest.config"],
		require(Parent.RobloxAppNavigationCore)["jest.config"],
		require(Parent.SocialGraphSync)["jest.config"],
		require(Parent.DeviceOrientationRodux)["jest.config"],
		require(Parent.AppRatingPrompt)["jest.config"],
		require(Parent.UiShellEvents)["jest.config"],
		game.CoreGui.RobloxGui.Modules.LuaApp.Hooks["jest.config"],
		game.CoreGui.RobloxGui.Modules.LuaApp.Navigation["jest.config"],
		game.CoreGui.RobloxGui.Modules.LuaApp.Util["jest.config"],
		game.CoreGui.RobloxGui.Modules.LuaApp.Components.Session["jest.config"],
		game.CoreGui.RobloxGui.Modules.AvatarExperience.AvatarRefinement.HeadRefinement["jest.config"]
	}
}