local CorePackages = game:GetService("CorePackages")
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local TenFootUiCommonModule = require(CorePackages.Workspace.Packages.TenFootUiCommon)
local ScreenKind = TenFootUiCommonModule.TenFootUiRNTypes.ScreenKind
local GlobalNavDisplayOption = TenFootUiCommonModule.TenFootUiRNTypes.GlobalNavDisplayOption
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local CreateAvatarExperienceStackNavigatorModule = require(script.Parent.createAvatarExperienceStackNavigator)
local list = {
	{
		[AvatarScreen.AccessoryAdjustment] = {
			screen = require(Modules.AvatarExperience.AccessoryAdjustment.Components.AccessoryAdjustmentPage)
		}
	},
	{
		[AvatarScreen.AdjustAccessoryView] = {
			screen = require(Modules.AvatarExperience.AccessoryAdjustment.Components.AdjustAccessoryView)
		}
	}
}

return if require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus then CreateAvatarExperienceStackNavigatorModule(list, {
	defaultNavigationOptions = {
		overlayEnabled = true,
		overlayTransparency = 1,
		absorbInput = false,
		screenKind = ScreenKind.FullScreen,
		globalNavDisplayOption = GlobalNavDisplayOption.HideAll
	},
	mode = RoactNavigationModule.StackPresentationStyle.Default,
	transitionConfig = NavigationUtilsModule.instantTransitionConfig
}) else RoactNavigationModule.createRobloxStackNavigator(list, {
	defaultNavigationOptions = {
		overlayEnabled = true,
		overlayTransparency = 1,
		absorbInput = false,
		screenKind = ScreenKind.FullScreen,
		globalNavDisplayOption = GlobalNavDisplayOption.HideAll
	},
	mode = RoactNavigationModule.StackPresentationStyle.Default,
	transitionConfig = NavigationUtilsModule.instantTransitionConfig
})