local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local Enums = require(CorePackages.Workspace.Packages.FriendsNetworking).Enums
local EnumsModule = require(CorePackages.Workspace.Packages.ProfilePlatform.Enums)
local ProfileTypes = EnumsModule.ProfileTypes
local Screens = EnumsModule.Screens
local ProfileTabVariants = EnumsModule.ProfileTabVariants
local AppPageModule = require(Modules.LuaApp.AppPage)
local MakeAvatarBackButtonModule = require(Modules.AvatarExperience.Common.Components.TopBar.makeAvatarBackButton)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local UseAvatarHardwareBackButtonModule = require(Modules.AvatarExperience.Common.Hooks.useAvatarHardwareBackButton)
local _ = require(Modules.AvatarExperience.Common.Components.Profile.ProfileTabPageView)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableLeftNavOnConsole = SharedFlagsModule.FFlagEnableLeftNavOnConsole
local FFlagFlyoutNavigationInMarketplace = SharedFlagsModule.FFlagFlyoutNavigationInMarketplace
local FFlagAXOpaqueMarketplaceTopbar = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXOpaqueMarketplaceTopbar
local FFlagEnableFlyoutSidePanelModule = require(Modules.LuaApp.Flags.FFlagEnableFlyoutSidePanel)
local MeTabFlyoutLeftItemModule = if FFlagFlyoutNavigationInMarketplace and FFlagEnableFlyoutSidePanelModule then require(Modules.AvatarExperience.Common.Components.TopBar.MeTabFlyoutLeftItem) else nil

local function selectLocalUserId(p1): string
	return (tostring(p1.LocalUserId))
end

return function(Tbl)
	-- upvalues: UseNavigationFunction (copy), UseAvatarRouteFunction (copy), Screens (copy), AvatarScreen (copy), UseSelectorFunction (copy), selectLocalUserId (copy), SelectIsPortraitModule (copy), ReactModule (copy), AppPageModule (copy), UseAvatarHardwareBackButtonModule (copy), FFlagFlyoutNavigationInMarketplace (copy), FFlagEnableFlyoutSidePanelModule (copy), MeTabFlyoutLeftItemModule (copy), MakeAvatarBackButtonModule (copy), ProfileTypes (copy), Enums (copy), ProfileTabVariants (copy), FFlagAXOpaqueMarketplaceTopbar (copy), FFlagEnableLeftNavOnConsole (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local State = Tbl.navigation and Tbl.navigation.state
	local Route = State and (State.routes and State.routes[State.index])
	local RouteName = Route and Route.routeName
	local NoRouteName: boolean = RouteName == nil or RouteName == Screens.ProfileMain
	local IsItemDetailsMatch = (UseAvatarRouteResult and (UseAvatarRouteResult.current and UseAvatarRouteResult.current.name)) == AvatarScreen.ItemDetails
	local UseSelectorResult = UseSelectorFunction(selectLocalUserId)
	local UseSelectorResult1 = UseSelectorFunction(SelectIsPortraitModule)
	local NoIsItemDetailsMatch: boolean = UseSelectorResult1 and (NoRouteName and not IsItemDetailsMatch)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AppPageModule (upval)
		UseNavigationResult.navigate(AppPageModule.Home)
	end, { UseNavigationResult })
	UseAvatarHardwareBackButtonModule({
		navigation = UseNavigationResult,
		avatarRoute = UseAvatarRouteResult,
		onBack = UseResult
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagFlyoutNavigationInMarketplace (upval), FFlagEnableFlyoutSidePanelModule (upval), MeTabFlyoutLeftItemModule (upval), MakeAvatarBackButtonModule (upval), UseResult (copy)
		return if FFlagFlyoutNavigationInMarketplace and FFlagEnableFlyoutSidePanelModule then MeTabFlyoutLeftItemModule else MakeAvatarBackButtonModule(UseResult)
	end, { UseResult })
	local Copy = table.clone(Tbl)
	Copy.embedded = true
	Copy.embedNavigationProps = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult (copy), ProfileTypes (upval), Enums (upval), UseSelectorResult1 (copy), ProfileTabVariants (upval)
		return {
			source = "AvatarProfileTab",
			contextualInfoType = "",
			mountAsFullView = true,
			forceFullView = true,
			itemDetailsFullView = true,
			profileId = UseSelectorResult,
			profileType = ProfileTypes.User,
			friendshipOriginSourceType = Enums.FriendshipOriginSourceType.UserProfile.rawValue(),
			headerVariant = if UseSelectorResult1 then ProfileTabVariants.Default else ProfileTabVariants.MeTab,
			currentlyWearingVariant = ProfileTabVariants.MeTab
		}
	end, { UseSelectorResult, UseSelectorResult1 })
	
	return {
		isPortrait = UseSelectorResult1,
		isAtProfileRoot = NoRouteName,
		isOverlayTopBarVisible = NoIsItemDetailsMatch,
		leftItem = UseMemoResult,
		topBarTransparent = not (if FFlagAXOpaqueMarketplaceTopbar then not UseSelectorResult1 else FFlagEnableLeftNavOnConsole and not UseSelectorResult1),
		wrapperProps = Copy
	}
end