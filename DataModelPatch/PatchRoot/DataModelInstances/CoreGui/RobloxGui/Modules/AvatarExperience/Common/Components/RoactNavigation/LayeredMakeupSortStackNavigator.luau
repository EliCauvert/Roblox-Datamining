local CorePackages = game:GetService("CorePackages")
local TenFootUiCommonModule = require(CorePackages.Workspace.Packages.TenFootUiCommon)

return require(script.Parent.createAvatarExperienceStackNavigator)({
	{
		[require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen.LayeredMakeupSort] = {
			screen = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.LayeredMakeupSort.Components.LayeredMakeupSortScreen)
		}
	}
}, {
	defaultNavigationOptions = {
		overlayEnabled = true,
		overlayTransparency = 1,
		absorbInput = false,
		screenKind = TenFootUiCommonModule.TenFootUiRNTypes.ScreenKind.FullScreen,
		globalNavDisplayOption = TenFootUiCommonModule.TenFootUiRNTypes.GlobalNavDisplayOption.HideAll
	},
	mode = require(CorePackages.Packages.RoactNavigation).StackPresentationStyle.Default
})