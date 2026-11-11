local Modules = game:GetService("CoreGui").RobloxGui.Modules

return require(Modules.LuaApp.Navigation.wrapWithSwitchVisibility)(require(game:GetService("CorePackages").Workspace.Packages.RobloxAppNavigationCore).createRootNavigator(require(Modules.LuaApp.Navigation.getAppRoutes)(), require(Modules.LuaApp.Navigation.getSwitchRoutesArray)()))