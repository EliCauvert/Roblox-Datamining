local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AvatarEditorPageModule = require(Modules.AvatarExperience.AvatarEditor.Components.AvatarEditorPage)
local CatalogPageModule = require(Modules.AvatarExperience.Catalog.Components.CatalogPage)
local ProfilePictureEditorEmotesPageModule = require(Modules.AvatarExperience.ProfilePictureEditor.Components.ProfilePictureEditorEmotesPage)
local BackButtonActionModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.BackButtonAction)
local LandingPageModule = require(Modules.AvatarExperience.Common.Components.LandingPage)
local CreatePreloadingSwitchNavigatorModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.createPreloadingSwitchNavigator)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local TenFootUiCommonModule = require(CorePackages.Workspace.Packages.TenFootUiCommon)
local ScreenKind = TenFootUiCommonModule.TenFootUiRNTypes.ScreenKind
local GlobalNavDisplayOption = TenFootUiCommonModule.TenFootUiRNTypes.GlobalNavDisplayOption
local SlotBasedEditorPageModule = require(Modules.AvatarExperience.SlotBasedEditor.Pages.SlotBasedEditorPage)
local FavoritesSavedScreenModule = require(script.Parent.FavoritesSavedScreen)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local AXAlternateLandingPageIXPModule = require(Modules.AvatarExperience.Flags.AXAlternateLandingPageIXP)
local AXDisableAlwaysRenderedScreensIXPModule = require(Modules.AvatarExperience.Experiments.AXDisableAlwaysRenderedScreensIXP)
local GetFFlagCleanUpAXAlternativeLandingPageIXPModule = require(Modules.AvatarExperience.Flags.GetFFlagCleanUpAXAlternativeLandingPageIXP)
local GetFFlagAXSlotBasedEditorPrimaryEntryPointModule = require(Modules.AvatarExperience.Flags.GetFFlagAXSlotBasedEditorPrimaryEntryPoint)
local AXFixVRForAlwaysDisabledEnabled = game:DefineFastFlag("AXFixVRForAlwaysDisabledEnabled", false)
local CreateAvatarSwitchNavigatorModule = require(script.Parent.createAvatarSwitchNavigator)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local NoFFlagEnableLeftNavOnConsole: boolean = game:GetService("GuiService"):IsTenFootInterface() and not FFlagEnableLeftNavOnConsole
local AXPrefetchMarketplaceIXP = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments).AXPrefetchMarketplaceIXP
local TestVariable = if AXPrefetchMarketplaceIXP.isEnabled() then IxpUtilsModule.readTestVariable(AXPrefetchMarketplaceIXP.EnabledForUser) else nil
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXUnifiedMarketplaceResultsFetcher = AvatarExperienceFlagsModule.FFlagAXUnifiedMarketplaceResultsFetcher
local FFlagAXEnableProfileTab = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXEnableProfileTab
local ProfileTabPageModule = if FFlagAXEnableProfileTab then require(Modules.AvatarExperience.Common.Components.Profile.ProfileTabPage) else nil
local FFlagLuaAppsDefaultSelection = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppsDefaultSelection
local FFlagEnableBottomNavOnMarketplace = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableBottomNavOnMarketplace
local FFlagAXFavoritesManagerNavEntry = AvatarExperienceFlagsModule.FFlagAXFavoritesManagerNavEntry

function shouldEnableAlwaysRenderedScreensForUser(): boolean
	-- upvalues: IxpUtilsModule (copy), AXDisableAlwaysRenderedScreensIXPModule (copy)
	return not IxpUtilsModule.readTestVariable(AXDisableAlwaysRenderedScreensIXPModule.DisableAlwaysRenderedScreen)
end

local List = {}
local Config = if FFlagAXEnableProfileTab then {
	[AvatarScreen.Profile] = {
		screen = ProfileTabPageModule,
		navigationOptions = {
			alwaysRendered = if AXFixVRForAlwaysDisabledEnabled and not IsSpatialFunction() then shouldEnableAlwaysRenderedScreensForUser() elseif AXDisableAlwaysRenderedScreensIXPModule.isEnabled() then shouldEnableAlwaysRenderedScreensForUser() else not IsVRAppBuildFunction(),
			tabBarVisible = if FFlagEnableBottomNavOnMarketplace then true else nil
		}
	}
} else nil

if TestVariable or FFlagAXUnifiedMarketplaceResultsFetcher then
	local config = {
		[AvatarScreen.AvatarExperienceLandingPage] = {
			screen = LandingPageModule,
			navigationOptions = {
				tabBarVisible = true,
				alwaysRendered = if AXFixVRForAlwaysDisabledEnabled and not IsSpatialFunction() then shouldEnableAlwaysRenderedScreensForUser() elseif AXDisableAlwaysRenderedScreensIXPModule.isEnabled() then shouldEnableAlwaysRenderedScreensForUser() else not IsVRAppBuildFunction(),
				backButtonAction = BackButtonActionModule.Unhandled,
				screenKind = ScreenKind.Default,
				globalNavDisplayOption = GlobalNavDisplayOption.ShowAll
			}
		}
	}
	local config1 = {
		[AvatarScreen.AvatarEditor] = {
			screen = if GetFFlagAXSlotBasedEditorPrimaryEntryPointModule() then SlotBasedEditorPageModule else AvatarEditorPageModule,
			navigationOptions = {
				alwaysRendered = if AXFixVRForAlwaysDisabledEnabled and not IsSpatialFunction() then shouldEnableAlwaysRenderedScreensForUser() elseif AXDisableAlwaysRenderedScreensIXPModule.isEnabled() then shouldEnableAlwaysRenderedScreensForUser() else not IsVRAppBuildFunction(),
				tabBarVisible = if FFlagEnableBottomNavOnMarketplace then true else nil
			}
		}
	}
	local config2 = {
		[AvatarScreen.Catalog] = {
			screen = CatalogPageModule,
			navigationOptions = {
				alwaysRendered = if AXFixVRForAlwaysDisabledEnabled and not IsSpatialFunction() then shouldEnableAlwaysRenderedScreensForUser() elseif AXDisableAlwaysRenderedScreensIXPModule.isEnabled() then shouldEnableAlwaysRenderedScreensForUser() else not IsVRAppBuildFunction(),
				tabBarVisible = if FFlagEnableBottomNavOnMarketplace then true else nil
			}
		}
	}
	local config3 = {
		[AvatarScreen.ProfilePictureEditorEmotes] = ProfilePictureEditorEmotesPageModule
	}
	
	if NoFFlagEnableLeftNavOnConsole then
		table.insert(List, config)
	end
	if FFlagLuaAppsDefaultSelection then
		table.insert(List, config2)
		table.insert(List, config1)
	else
		table.insert(List, config1)
		table.insert(List, config2)
	end
	if Config then
		table.insert(List, Config)
	end
	table.insert(List, config3)
else
	List = {
		{
			[AvatarScreen.AvatarExperienceLandingPage] = {
				screen = LandingPageModule,
				navigationOptions = {
					tabBarVisible = true,
					alwaysRendered = if AXFixVRForAlwaysDisabledEnabled and not IsSpatialFunction() then shouldEnableAlwaysRenderedScreensForUser() elseif AXDisableAlwaysRenderedScreensIXPModule.isEnabled() then shouldEnableAlwaysRenderedScreensForUser() else not IsVRAppBuildFunction(),
					backButtonAction = BackButtonActionModule.Unhandled,
					screenKind = ScreenKind.Default,
					globalNavDisplayOption = GlobalNavDisplayOption.ShowAll
				}
			}
		},
		{
			[AvatarScreen.AvatarEditor] = {
				screen = if GetFFlagAXSlotBasedEditorPrimaryEntryPointModule() then SlotBasedEditorPageModule else AvatarEditorPageModule,
				navigationOptions = {
					alwaysRendered = if AXFixVRForAlwaysDisabledEnabled and not IsSpatialFunction() then shouldEnableAlwaysRenderedScreensForUser() elseif AXDisableAlwaysRenderedScreensIXPModule.isEnabled() then shouldEnableAlwaysRenderedScreensForUser() else not IsVRAppBuildFunction(),
					tabBarVisible = if FFlagEnableBottomNavOnMarketplace then true else nil
				}
			}
		},
		{
			[AvatarScreen.Catalog] = {
				screen = CatalogPageModule,
				navigationOptions = {
					alwaysRendered = if AXFixVRForAlwaysDisabledEnabled and not IsSpatialFunction() then shouldEnableAlwaysRenderedScreensForUser() elseif AXDisableAlwaysRenderedScreensIXPModule.isEnabled() then shouldEnableAlwaysRenderedScreensForUser() else not IsVRAppBuildFunction(),
					tabBarVisible = if FFlagEnableBottomNavOnMarketplace then true else nil
				}
			}
		},
		{
			[AvatarScreen.ProfilePictureEditorEmotes] = ProfilePictureEditorEmotesPageModule
		}
	}
	
	if Config then
		table.insert(List, Config)
	end
end
if FFlagAXFavoritesManagerNavEntry then
	table.insert(List, {
		[AvatarScreen.FavoritesSaved] = {
			screen = FavoritesSavedScreenModule,
			navigationOptions = {
				alwaysRendered = false,
				tabBarVisible = if FFlagEnableBottomNavOnMarketplace then true else nil
			}
		}
	})
end
local function navigationOptions(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), ScreenKind (copy), GlobalNavDisplayOption (copy), GetFFlagCleanUpAXAlternativeLandingPageIXPModule (copy), NoFFlagEnableLeftNavOnConsole (copy), AXAlternateLandingPageIXPModule (copy), IxpUtilsModule (copy), BackButtonActionModule (copy), FFlagAXEnableProfileTab (copy)
	local config = {
		overlayEnabled = true,
		overlayTransparency = 1,
		absorbInput = false,
		hasSelectionGroup = not FFlagAXMigrateAXToGlobalAutofocus and nil,
		screenKind = ScreenKind.FullScreen,
		globalNavDisplayOption = GlobalNavDisplayOption.HideAll
	}
	
	if if GetFFlagCleanUpAXAlternativeLandingPageIXPModule() then not NoFFlagEnableLeftNavOnConsole else AXAlternateLandingPageIXPModule and IxpUtilsModule.readTestVariable(AXAlternateLandingPageIXPModule.EnabledForUser) then
		local Key = p1.navigation.state.key
		local NoOp = BackButtonActionModule.NoOp
		config.backButtonAction = if Key == "AvatarEditor" or Key == "Catalog" or FFlagAXEnableProfileTab and Key == "Profile" then NoOp else nil
	end
	return config
end

return if FFlagAXMigrateAXToGlobalAutofocus then CreateAvatarSwitchNavigatorModule(List, {
	backBehavior = RoactNavigationModule.BackBehavior.InitialRoute,
	defaultNavigationOptions = navigationOptions,
	keepVisitedScreensMounted = not IsVRAppBuildFunction()
}) else CreatePreloadingSwitchNavigatorModule(List, {
	backBehavior = RoactNavigationModule.BackBehavior.InitialRoute,
	defaultNavigationOptions = navigationOptions,
	keepVisitedScreensMounted = not IsVRAppBuildFunction()
})