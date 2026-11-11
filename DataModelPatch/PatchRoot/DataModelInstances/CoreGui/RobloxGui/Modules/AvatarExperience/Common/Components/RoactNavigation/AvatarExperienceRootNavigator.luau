local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local TenFootUiCommonModule = require(CorePackages.Workspace.Packages.TenFootUiCommon)
local RobloxStackView = RoactNavigationModule.RobloxStackView
local CreateNavigatorFunction = RoactNavigationModule.createNavigator
local RobloxAppNavigationCoreModule = require(CorePackages.Workspace.Packages.RobloxAppNavigationCore)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local CreateAvatarExperienceRootNavigatorModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.createAvatarExperienceRootNavigator)
local GetMainStackNavigationOptionsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.getMainStackNavigationOptions)
local JoinResult = require(CorePackages.Packages.Cryo).List.join({
	{
		[require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen.AvatarExperienceMainStackNavigator] = {
			screen = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceMainStackContainer),
			navigationOptions = if game:DefineFastFlag("AXGuardMainStackNavigationOptions", false) then GetMainStackNavigationOptionsModule else function(p1)
				-- upvalues: RoactNavigationModule (copy)
				return {
					overlayTransparency = 1,
					absorbInput = false,
					backButtonAction = RoactNavigationModule.getActiveChildNavigationOptions(p1.navigation).backButtonAction
				}
			end
		}
	}
}, (require(Modules.AvatarExperience.Common.Components.RoactNavigation.AvatarPromptDescriptors)))
local config = {
	defaultNavigationOptions = {
		overlayEnabled = true,
		absorbInput = false,
		screenKind = TenFootUiCommonModule.TenFootUiRNTypes.ScreenKind.FullScreen,
		globalNavDisplayOption = TenFootUiCommonModule.TenFootUiRNTypes.GlobalNavDisplayOption.HideAll
	},
	transitionConfig = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils).instantTransitionConfig,
	mode = RoactNavigationModule.StackPresentationStyle.Overlay
}

return if require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomGetStateForActionHandler then CreateNavigatorFunction(if FFlagAXMigrateAXToGlobalAutofocus then RobloxAppNavigationCoreModule.AppStackView else RobloxStackView, CreateAvatarExperienceRootNavigatorModule(JoinResult, config), config) else RoactNavigationModule.createRobloxStackNavigator(JoinResult, config)