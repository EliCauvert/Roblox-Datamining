local CorePackages = game:GetService("CorePackages")
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local ReactModule = require(CorePackages.Packages.React)
local TenFootUiCommonModule = require(CorePackages.Workspace.Packages.TenFootUiCommon)
local ScreenKind = TenFootUiCommonModule.TenFootUiRNTypes.ScreenKind
local GlobalNavDisplayOption = TenFootUiCommonModule.TenFootUiRNTypes.GlobalNavDisplayOption
local _ = require(CorePackages.Workspace.Packages.Navigation)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local LayeredMakeupSortStackNavigatorModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.LayeredMakeupSortStackNavigator)
local ColorAdjustmentPageContainerModule = require(Modules.AvatarExperience.AvatarRefinement.ColorAdjustmentPage.ColorAdjustmentPageContainer)
local BodyShapePageModule = require(Modules.AvatarExperience.AvatarRefinement.BodyShapePage)
local CreateAvatarSwitchNavigatorModule = require(script.Parent.createAvatarSwitchNavigator)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXCustomizeMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport
local List = {
	{
		[AvatarScreen.AvatarRefinement] = require(Modules.AvatarExperience.AvatarRefinement.Components.AvatarRefinement)
	},
	{
		[AvatarScreen.AccessoryAdjustmentStackNavigator] = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AccessoryAdjustmentStackNavigator)
	},
	{
		[AvatarScreen.LayeredClothingSortStackNavigator] = require(Modules.AvatarExperience.Common.Components.RoactNavigation.LayeredClothingSortStackNavigator)
	},
	{
		[AvatarScreen.HeadRefinementStackNavigator] = require(Modules.AvatarExperience.Common.Components.RoactNavigation.HeadRefinementStackNavigator)
	},
	{
		[AvatarScreen.ColorAdjustment] = {
			screen = function()
				-- upvalues: ReactModule (copy), ColorAdjustmentPageContainerModule (copy)
				return ReactModule.createElement(ColorAdjustmentPageContainerModule)
			end
		}
	}
}

if require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)() then
	table.insert(List, {
		[AvatarScreen.BodyShape] = { screen = BodyShapePageModule }
	})
end
if FFlagAXCustomizeMakeupSupport then
	table.insert(List, {
		[AvatarScreen.LayeredMakeupSortStackNavigator] = LayeredMakeupSortStackNavigatorModule
	})
end
local config = {
	backBehavior = RoactNavigationModule.BackBehavior.History,
	defaultNavigationOptions = {
		overlayEnabled = true,
		overlayTransparency = 1,
		absorbInput = false,
		renderUnderlyingPage = false,
		isTransparent = true,
		screenKind = ScreenKind.FullScreen,
		globalNavDisplayOption = GlobalNavDisplayOption.HideAll
	},
	mode = RoactNavigationModule.StackPresentationStyle.Default
}

return if FFlagAXMigrateAXToGlobalAutofocus then CreateAvatarSwitchNavigatorModule(List, config) else RoactNavigationModule.createRobloxSwitchNavigator(List, config)