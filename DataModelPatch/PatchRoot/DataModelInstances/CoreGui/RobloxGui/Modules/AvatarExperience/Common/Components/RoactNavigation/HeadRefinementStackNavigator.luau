local CorePackages = game:GetService("CorePackages")
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local TenFootUiCommonModule = require(CorePackages.Workspace.Packages.TenFootUiCommon)
local ScreenKind = TenFootUiCommonModule.TenFootUiRNTypes.ScreenKind
local GlobalNavDisplayOption = TenFootUiCommonModule.TenFootUiRNTypes.GlobalNavDisplayOption
local CreateAvatarExperienceStackNavigatorModule = require(script.Parent.createAvatarExperienceStackNavigator)
local list = {
	{
		[require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen.HeadRefinement] = {
			screen = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AvatarRefinement.HeadRefinement.HeadRefinementPage)
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
	mode = RoactNavigationModule.StackPresentationStyle.Default
}) else RoactNavigationModule.createRobloxStackNavigator(list, {
	defaultNavigationOptions = {
		overlayEnabled = true,
		overlayTransparency = 1,
		absorbInput = false,
		screenKind = ScreenKind.FullScreen,
		globalNavDisplayOption = GlobalNavDisplayOption.HideAll
	},
	mode = RoactNavigationModule.StackPresentationStyle.Default
})