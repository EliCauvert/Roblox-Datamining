local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local SetTabBarVisibleFunction = require(CorePackages.Workspace.Packages.AppTabBarRodux).Actions.SetTabBarVisible
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local UseNavBarPlacementFunction = AppNavBarModule.useNavBarPlacement
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local AvatarExperienceMainStackNavigatorModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceMainStackNavigator)
local GetActiveChildNavigationOptionsSafelyModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.getActiveChildNavigationOptionsSafely)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local FFlagEnableBottomNavOnMarketplace = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableBottomNavOnMarketplace
local FFlagStackedBottomNavMarketplaceCTA = require(CorePackages.Workspace.Packages.SharedFlags).FFlagStackedBottomNavMarketplaceCTA
local AvatarExperienceMainStackContainer = RoactModule.Component:extend("AvatarExperienceMainStackContainer")

function AvatarExperienceMainStackContainer.didMount(p1)
	p1:setTabBarVisibility(p1.props)
end

function AvatarExperienceMainStackContainer.willUpdate(p1, p2)
	p1:setTabBarVisibility(p2)
end

function AvatarExperienceMainStackContainer:setTabBarVisibility(Props)
	-- upvalues: GetActiveChildNavigationOptionsSafelyModule (copy), FFlagEnableBottomNavOnMarketplace (copy), FFlagStackedBottomNavMarketplaceCTA (copy), FullView (copy)
	if not Props.avatarRoute.isVisible then return end
	local ActiveChildNavigationOptionsSafelyModule = GetActiveChildNavigationOptionsSafelyModule(Props.navigation)
	local DefaultTabBarVisible = if ActiveChildNavigationOptionsSafelyModule.tabBarVisible == nil then Props.defaultTabBarVisible else ActiveChildNavigationOptionsSafelyModule.tabBarVisible == true
	
	if FFlagEnableBottomNavOnMarketplace and not FFlagStackedBottomNavMarketplaceCTA and DefaultTabBarVisible and Props.hasTryOnItems and (not Props.fullViewTable or Props.fullViewTable[Props.avatarRoute.opaque.name] ~= FullView.SceneFullView) then
		DefaultTabBarVisible = false
	end
	if DefaultTabBarVisible ~= Props.tabBarVisible then
		Props.setTabBarVisible(DefaultTabBarVisible)
	end
end

function AvatarExperienceMainStackContainer.render(p1)
	-- upvalues: RoactModule (copy), AvatarExperienceMainStackNavigatorModule (copy)
	return RoactModule.createElement(AvatarExperienceMainStackNavigatorModule, { navigation = p1.props.navigation })
end

local v1 = RoactRoduxModule.connect(function(p1)
	-- upvalues: FFlagEnableBottomNavOnMarketplace (copy), FFlagStackedBottomNavMarketplaceCTA (copy)
	return {
		tabBarVisible = p1.TabBarVisible,
		hasTryOnItems = if FFlagEnableBottomNavOnMarketplace and not FFlagStackedBottomNavMarketplaceCTA then next(p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems) ~= nil else nil,
		fullViewTable = if FFlagEnableBottomNavOnMarketplace and not FFlagStackedBottomNavMarketplaceCTA then p1.AvatarExperience.Common.FullView else nil
	}
end, function(Callback)
	-- upvalues: SetTabBarVisibleFunction (copy)
	return {
		setTabBarVisible = function(DefaultTabBarVisible)
			-- upvalues: Callback (copy), SetTabBarVisibleFunction (upval)
			Callback(SetTabBarVisibleFunction(DefaultTabBarVisible))
		end
	}
end)((WithAvatarRouteModule(function(p1)
	-- upvalues: UseNavBarPlacementFunction (copy), AppNavBarModule (copy), CryoModule (copy), RoactModule (copy), AvatarExperienceMainStackContainer (copy)
	return RoactModule.createElement(AvatarExperienceMainStackContainer, (CryoModule.Dictionary.join(p1, {
		defaultTabBarVisible = UseNavBarPlacementFunction() == AppNavBarModule.Placement.Left
	})))
end)))
v1.router = AvatarExperienceMainStackNavigatorModule.router

return v1