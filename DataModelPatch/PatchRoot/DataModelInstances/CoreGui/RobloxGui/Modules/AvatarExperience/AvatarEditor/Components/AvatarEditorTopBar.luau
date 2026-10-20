local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local AppPageModule = require(Modules.LuaApp.AppPage)
local ReactModule = require(CorePackages.Packages.React)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UsePreviousFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.usePrevious
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local AndroidBackButtonConnectionModule = require(Modules.LuaApp.Navigation.AndroidBackButtonConnection)
local Common = Modules.AvatarExperience.Common
local AXTransitionSegmentedMenuModule = if require(Modules.AvatarExperience.Flags.GetFFlagAXTransitionMenuV2)() then require(Modules.AvatarExperience.Common.Components.AXTransitionSegmentedMenu) else require(Modules.AvatarExperience.Common.Components.AXTransitionSegmentedMenu_DEPRECATED)
local MakeAvatarBackButtonModule = require(Common.Components.TopBar.makeAvatarBackButton)
local ManageButtonModule = require(Common.Components.TopBar.ManageButton)
local CommunityAvatarEntryButtonModule = require(Common.Components.TopBar.CommunityAvatarEntryButton)
local MakeTitleDropDownModule = require(Common.Components.TopBar.makeTitleDropDown)
local IsAvatarRouteVisibleModule = require(Common.Components.RoactNavigation.Utils.isAvatarRouteVisible)
local GetIfUserInFStringAXCommunityAvatarsEntryPointWhiteListModule = require(Modules.AvatarExperience.Flags.GetIfUserInFStringAXCommunityAvatarsEntryPointWhiteList)
local FFlagAXAvatarSharingEntryPoint = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarSharingEntryPoint
local FFlagAXOpaqueMarketplaceTopbar = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXOpaqueMarketplaceTopbar
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local FFlagFlyoutNavigationInMarketplace = require(CorePackages.Workspace.Packages.SharedFlags).FFlagFlyoutNavigationInMarketplace
local FFlagEnableFlyoutSidePanelModule = require(Modules.LuaApp.Flags.FFlagEnableFlyoutSidePanel)
local MeTabFlyoutLeftItemModule = if FFlagFlyoutNavigationInMarketplace and FFlagEnableFlyoutSidePanelModule then require(Common.Components.TopBar.MeTabFlyoutLeftItem) else nil

local function selectIsPortrait(p1): boolean
	-- upvalues: DeviceOrientationMode (copy)
	return p1.DeviceOrientation == DeviceOrientationMode.Portrait
end

local function selectIsCurrentUserAllowedToCreateShares(p1)
	return p1.AvatarExperience.Catalog.Metadata.isCurrentUserAllowedToCreateShares
end

return function(Gui)
	-- upvalues: UseSelectorFunction (copy), selectIsPortrait (copy), selectIsCurrentUserAllowedToCreateShares (copy), UseLocalizationFunction (copy), UseUiModeInfoFunction (copy), UiMode (copy), FFlagEnableLeftNavOnConsole (copy), ReactModule (copy), AndroidBackButtonConnectionModule (copy), AppPageModule (copy), AvatarScreen (copy), IsAvatarRouteVisibleModule (copy), UsePreviousFunction (copy), MakeAvatarBackButtonModule (copy), MakeTitleDropDownModule (copy), IsVRAppBuildFunction (copy), FFlagFlyoutNavigationInMarketplace (copy), FFlagEnableFlyoutSidePanelModule (copy), MeTabFlyoutLeftItemModule (copy), AXTransitionSegmentedMenuModule (copy), ManageButtonModule (copy), GetIfUserInFStringAXCommunityAvatarsEntryPointWhiteListModule (copy), FFlagAXAvatarSharingEntryPoint (copy), CommunityAvatarEntryButtonModule (copy), TopBarModule (copy), FFlagAXOpaqueMarketplaceTopbar (copy)
	local UseSelectorResult = UseSelectorFunction(selectIsPortrait)
	local UseSelectorResult1 = UseSelectorFunction(selectIsCurrentUserAllowedToCreateShares)
	local Navigation = Gui.navigation
	local FeatureCatalogActionCustomize = UseLocalizationFunction({ title = "Feature.Catalog.Action.Customize" })
	local NoFFlagEnableLeftNavOnConsole: boolean = UseUiModeInfoFunction().uiMode == UiMode.TenFoot and not FFlagEnableLeftNavOnConsole
	local Current = ReactModule.useRef(AndroidBackButtonConnectionModule()).current
	local ShowManageOutfitButton = Gui.showManageOutfitButton
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: AppPageModule (upval), NoFFlagEnableLeftNavOnConsole (copy), AvatarScreen (upval), Navigation (copy)
		Navigation.navigate(if NoFFlagEnableLeftNavOnConsole then AvatarScreen.AvatarExperienceLandingPage else AppPageModule.Home)
	end, { Navigation, NoFFlagEnableLeftNavOnConsole })
	ReactModule.useEffect(function()
		-- upvalues: IsAvatarRouteVisibleModule (upval), Gui (copy), Current (copy), UseResult (copy)
		if IsAvatarRouteVisibleModule(Gui) then
			Current.connect(UseResult)
		end
		return function()
			-- upvalues: Current (upval)
			Current.disconnect()
		end
	end, { Gui.navigation, Gui.avatarRoute, Current, UseResult })
	local UsePreviousResult = UsePreviousFunction(Gui)
	ReactModule.useEffect(function()
		-- upvalues: UsePreviousResult (copy), IsAvatarRouteVisibleModule (upval), Gui (copy), Current (copy), UseResult (copy)
		if not UsePreviousResult then return end
		if not IsAvatarRouteVisibleModule(UsePreviousResult) and IsAvatarRouteVisibleModule(Gui) then
			Current.connect(UseResult)
			
			return
		end
		if IsAvatarRouteVisibleModule(UsePreviousResult) and not IsAvatarRouteVisibleModule(Gui) then
			Current.disconnect()
		end
	end, {
		Gui.navigation,
		Gui.avatarRoute,
		UsePreviousResult,
		Current
	})
	local AvatarBackButtonModule = MakeAvatarBackButtonModule(UseResult)
	local FeatureCatalogActionCustomize1 = MakeTitleDropDownModule("Feature.Catalog.Action.Customize", Gui.overlayClosedCallback)
	local LeftItem = nil
	local CenterItem = nil
	
	if IsVRAppBuildFunction() then
		LeftItem = nil
		CenterItem = nil
	else
		LeftItem = if FFlagFlyoutNavigationInMarketplace and FFlagEnableFlyoutSidePanelModule then MeTabFlyoutLeftItemModule else AvatarBackButtonModule
		CenterItem = if NoFFlagEnableLeftNavOnConsole then FeatureCatalogActionCustomize1 else AXTransitionSegmentedMenuModule
		
	end
	return ReactModule.createElement(TopBarModule.Container, {
		useParentSizeForCenterItem = true,
		transparentBackground = not FFlagAXOpaqueMarketplaceTopbar and not FFlagEnableLeftNavOnConsole or (if UseSelectorResult then true else false),
		hideSiteMessageBanner = UseSelectorResult,
		ref = Gui.topBarRef,
		NextSelectionDown = Gui.NextSelectionDown,
		NextSelectionRight = Gui.NextSelectionRight,
		titleText = FeatureCatalogActionCustomize.title,
		leftItem = LeftItem,
		centerItem = CenterItem,
		rightItems = if UseSelectorResult1 or GetIfUserInFStringAXCommunityAvatarsEntryPointWhiteListModule() then if NoFFlagEnableLeftNavOnConsole or FFlagAXAvatarSharingEntryPoint then {} else { CommunityAvatarEntryButtonModule } else {}
	})
end