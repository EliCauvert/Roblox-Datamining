local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local AppPagePropertiesModule = require(Modules.LuaApp.AppPageProperties)
local AppRouterParamsContextModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.AppRouterParamsContext)
local MakeAppRouterRootNavigatorModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.makeAppRouterRootNavigator)
local AvatarRouteContext = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Context.AvatarRouteContext
local MakeAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.makeAvatarRoute)
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagAXGuardNavStateNil = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXGuardNavStateNil
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3gAvatarExperience then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil

local function _(p1)
	-- upvalues: AppPageModule (copy)
	local Name = p1.name
	
	if Name == AppPageModule.AvatarExperienceWrapper or Name == AppPageModule.AvatarExperienceWrapperTransparent then
		Name = p1.extraProps.routeName
	end
	return Name
end

local function isVisible(Navigation, CurrentRoute): boolean
	-- upvalues: NavigationUtilsModule (copy), FFlagAXGuardNavStateNil (copy), AvatarScreenProperties (copy), AppPageModule (copy), AppPagePropertiesModule (copy)
	local ActiveScreenNavigationState = NavigationUtilsModule.getActiveScreenNavigationState(Navigation.state)
	
	if FFlagAXGuardNavStateNil and not ActiveScreenNavigationState then
		return false
	end
	local Detail = ActiveScreenNavigationState.params and ActiveScreenNavigationState.params.detail or nil
	local RouteName = ActiveScreenNavigationState.routeName
	local AvatarScreenProperty = AvatarScreenProperties[RouteName]
	local IsTransparent = AvatarScreenProperty and AvatarScreenProperty.isTransparent
	local Count = 0
	
	for i = #CurrentRoute, 1, -1 do
		local CurrentRouteEntry = CurrentRoute[i]
		local Name = CurrentRouteEntry.name
		
		if Name == AppPageModule.AvatarExperienceWrapper or Name == AppPageModule.AvatarExperienceWrapperTransparent then
			Name = CurrentRouteEntry.extraProps.routeName
		end
		local Name1 = Name
		
		if Name1 == RouteName and CurrentRouteEntry.detail == Detail then
			return true
		end
		if AppPagePropertiesModule[Name1] and not AppPagePropertiesModule[Name1].renderUnderlyingPage then
			return false
		end
		if IsTransparent then
			Count += 1
			
			if Count >= 1 then
				return false
			end
		end
	end
	return false
end

return function(p1)
	-- upvalues: MakeAppRouterRootNavigatorModule (copy), RoactModule (copy), AppRouterParamsContextModule (copy), AvatarRouteContext (copy), MakeAvatarRouteModule (copy), isVisible (copy), FFlagSignalsNavP3gAvatarExperience (copy), ReactModule (copy), GetLegacyNavigationStore (copy), UseSignalState (copy), CryoModule (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), RoactRoduxModule (copy)
	local AppRouterRootNavigatorModule = MakeAppRouterRootNavigatorModule(p1)
	local AppRouterRootContainer = RoactModule.PureComponent:extend("AppRouterRootContainer")
	
	function AppRouterRootContainer.render(p2)
		-- upvalues: RoactModule (upval), AppRouterParamsContextModule (upval), AvatarRouteContext (upval), MakeAvatarRouteModule (upval), isVisible (upval), AppRouterRootNavigatorModule (copy)
		local Navigation = p2.props.navigation
		
		return RoactModule.createElement(AppRouterParamsContextModule.Provider, { value = p2.props.params }, {
			AvatarRouteProvider = RoactModule.createElement(AvatarRouteContext.Provider, {
				value = MakeAvatarRouteModule(Navigation, (isVisible(Navigation, p2.props.currentRoute)))
			}, {
				navigation = RoactModule.createElement(AppRouterRootNavigatorModule, { navigation = Navigation }),
				androidBackButtonNavigationHandler = p2.props.renderAndroidBackButtonNavigationHandler(Navigation)
			})
		})
	end
	
	local MemoResult = if FFlagSignalsNavP3gAvatarExperience then ReactModule.memo(function(p2)
		-- upvalues: GetLegacyNavigationStore (upval), UseSignalState (upval), ReactModule (upval), AppRouterRootContainer (copy), CryoModule (upval)
		return ReactModule.createElement(AppRouterRootContainer, CryoModule.Dictionary.union(p2, {
			currentRoute = UseSignalState(GetLegacyNavigationStore(false).getCurrentLegacyRoute)
		}))
	end) else RoactRoduxModule.connect(function(p2, _)
		-- upvalues: FFlagUseNavigationSelectors (upval), Selectors (upval)
		return {
			currentRoute = if FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p2) else p2.Navigation.history[#p2.Navigation.history]
		}
	end, nil)(AppRouterRootContainer)
	MemoResult.router = AppRouterRootNavigatorModule.router
	
	return MemoResult
end