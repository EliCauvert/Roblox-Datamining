local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(CorePackages.Workspace.Packages.Navigation)
local TenFootUiCommonModule = require(CorePackages.Workspace.Packages.TenFootUiCommon)
local ScreenKind = TenFootUiCommonModule.TenFootUiRNTypes.ScreenKind
local GlobalNavDisplayOption = TenFootUiCommonModule.TenFootUiRNTypes.GlobalNavDisplayOption
local CreateLazyComponentFunction = require(CorePackages.Workspace.Packages.RoactUtils).Components.createLazyComponent
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage

return function()
	-- upvalues: AppPage (copy), CreateLazyComponentFunction (copy), Modules (copy), GlobalNavDisplayOption (copy), ScreenKind (copy)
	return {
		{
			[AppPage.More] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.More.MorePage)
				end),
				navigationOptions = {
					globalNavDisplayOption = GlobalNavDisplayOption.OptionGroupOnly
				}
			}
		},
		{
			[AppPage.Settings] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.More.AccountSettings.MoreSettingsPageSelector)
				end),
				navigationOptions = {
					globalNavDisplayOption = GlobalNavDisplayOption.OptionGroupOnly
				}
			}
		},
		{
			[AppPage.AdjustScreen] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: Modules (upval)
					return require(Modules.Shell.Components.Overscan10ft.Overscan)
				end),
				navigationOptions = {
					screenKind = ScreenKind.FullScreen,
					globalNavDisplayOption = GlobalNavDisplayOption.HideAll
				}
			}
		},
		{
			[AppPage.About] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.More.AboutPage)
				end),
				navigationOptions = {
					screenKind = ScreenKind.FullScreen,
					globalNavDisplayOption = GlobalNavDisplayOption.OptionGroupOnly
				}
			}
		}
	}
end