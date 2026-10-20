local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.Navigation)
local TenFootUiCommonModule = require(CorePackages.Workspace.Packages.TenFootUiCommon)
local ScreenKind = TenFootUiCommonModule.TenFootUiRNTypes.ScreenKind
local GlobalNavDisplayOption = TenFootUiCommonModule.TenFootUiRNTypes.GlobalNavDisplayOption
local CreateLazyComponentFunction = require(CorePackages.Workspace.Packages.RoactUtils).Components.createLazyComponent
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local Modules = game:GetService("CoreGui").RobloxGui.Modules

return function()
	-- upvalues: AppPage (copy), CreateLazyComponentFunction (copy), CorePackages (copy), ScreenKind (copy), GlobalNavDisplayOption (copy), Default (copy), Modules (copy)
	return {
		{
			[AppPage.PlatformAccountRouter] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.AppStartup).PlatformAccountRouter
				end),
				navigationOptions = {
					screenKind = ScreenKind.FullScreen,
					globalNavDisplayOption = GlobalNavDisplayOption.HideAll
				}
			}
		},
		{
			[AppPage.SingleSignOnError] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.SingleSignOn).SingleSignOnError
				end),
				navigationOptions = {
					screenKind = ScreenKind.FullScreen,
					globalNavDisplayOption = GlobalNavDisplayOption.HideAll
				}
			}
		},
		{
			[AppPage.Startup] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: Default (upval), Modules (upval)
					Default:logEventOnce("lazily_require_startup_page")
					
					return require(Modules.LuaApp.Components.Authentication.StartupPage)
				end),
				navigationOptions = {
					screenKind = ScreenKind.FullScreen,
					globalNavDisplayOption = GlobalNavDisplayOption.HideAll
				}
			}
		},
		{
			[AppPage.Landing] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.Authentication.LandingPage)
				end),
				navigationOptions = {
					screenKind = ScreenKind.FullScreen,
					globalNavDisplayOption = GlobalNavDisplayOption.HideAll
				}
			}
		},
		{
			[AppPage.SinglePageSignUp] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.Authentication.SinglePageSignUp)
				end),
				navigationOptions = {
					screenKind = ScreenKind.FullScreen,
					globalNavDisplayOption = GlobalNavDisplayOption.HideAll
				}
			}
		},
		{
			[AppPage.MultiPageSignup] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.Authentication.MultiPageSignupMonoWrapper)
				end),
				navigationOptions = {
					screenKind = ScreenKind.FullScreen,
					globalNavDisplayOption = GlobalNavDisplayOption.HideAll
				}
			}
		},
		{
			[AppPage.SingleSignOnContainer] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.Authentication.SingleSignOnContainer)
				end),
				navigationOptions = {
					screenKind = ScreenKind.FullScreen,
					globalNavDisplayOption = GlobalNavDisplayOption.HideAll
				}
			}
		},
		{
			[AppPage.Login] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.Authentication.LoginView)
				end),
				navigationOptions = {
					screenKind = ScreenKind.FullScreen,
					globalNavDisplayOption = GlobalNavDisplayOption.HideAll
				}
			}
		},
		{
			[AppPage.CrossDeviceLogin] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceLoginPage)
				end),
				navigationOptions = {
					screenKind = ScreenKind.FullScreen,
					globalNavDisplayOption = GlobalNavDisplayOption.HideAll
				}
			}
		}
	}
end