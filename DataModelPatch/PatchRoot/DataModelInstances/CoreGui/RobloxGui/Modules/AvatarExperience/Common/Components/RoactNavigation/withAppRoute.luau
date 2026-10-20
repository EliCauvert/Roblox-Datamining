local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local RouteInfo = AvatarExperienceNavigationModule.AvatarRoute.RouteInfo
local AvatarRoute = AvatarExperienceNavigationModule.AvatarRoute.AvatarRoute
local AvatarRouteContext = AvatarExperienceNavigationModule.AvatarRoute.Context.AvatarRouteContext
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local AppPageModule = require(Modules.LuaApp.AppPage)
local AppPagePropertiesModule = require(Modules.LuaApp.AppPageProperties)
local IsComponentModule = require(Modules.AvatarExperience.Common.isComponent)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local WithContextValueModule = require(Modules.AvatarExperience.Common.withContextValue)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _ = require(CorePackages.Workspace.Packages.NavigationRodux)
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local ReactModule = require(CorePackages.Packages.React)
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3gAvatarExperience then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local SwitchTab = require(CorePackages.Workspace.Packages.RobloxAppEnums).SwitchTab

local function _(AvatarExperienceRoot): boolean
	-- upvalues: AvatarScreen (copy), SwitchTab (copy)
	return AvatarExperienceRoot == AvatarScreen.AvatarExperienceRoot or AvatarExperienceRoot == SwitchTab.AvatarExperienceTab
end

return function(p1)
	-- upvalues: ArgCheckModule (copy), IsComponentModule (copy), AppPagePropertiesModule (copy), AvatarScreen (copy), AppPageModule (copy), CryoModule (copy), RouteInfo (copy), RoactModule (copy), SwitchTab (copy), AvatarRoute (copy), FFlagSignalsNavP3gAvatarExperience (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), RoactRoduxModule (copy), GetLegacyNavigationStore (copy), UseSignalState (copy), ReactModule (copy), WithContextValueModule (copy), AvatarRouteContext (copy)
	ArgCheckModule.assert(IsComponentModule(p1), "withAppRoute must be called with a Roact component")
	
	local function opaquePageFromRoute(CurrentNavigationRoute)
		-- upvalues: AppPagePropertiesModule (upval), AvatarScreen (upval)
		local CurrentNavigationRouteEntry = nil
		for i = #CurrentNavigationRoute, 1, -1 do
			CurrentNavigationRouteEntry = CurrentNavigationRoute[i]
			local AppPagePropertiesModuleEntry = AppPagePropertiesModule[CurrentNavigationRouteEntry.name]
			
			if AppPagePropertiesModuleEntry == nil or not AppPagePropertiesModuleEntry.renderUnderlyingPage then
				return CurrentNavigationRouteEntry
			end
		end
		return { name = AvatarScreen.None }
	end
	
	local function _(p2): boolean
		-- upvalues: AppPageModule (upval)
		return p2.name == AppPageModule.AvatarExperienceWrapper or p2.name == AppPageModule.AvatarExperienceWrapperTransparent
	end
	
	local function routeInfoFromPage(p2)
		-- upvalues: AppPageModule (upval), CryoModule (upval), RouteInfo (upval)
		local Name = p2.name
		local Text: string = Name
		
		if p2.detail then
			Text ..= ":" .. p2.detail
		end
		local ExtraProps = p2.extraProps or {}
		
		if p2.name == AppPageModule.AvatarExperienceWrapper or p2.name == AppPageModule.AvatarExperienceWrapperTransparent then
			Name = ExtraProps.routeName
			ExtraProps = ExtraProps.params
		end
		return RouteInfo.new(Name, Text, (CryoModule.Dictionary.join(ExtraProps, { detail = p2.detail })))
	end
	
	local AppRouteWrapper = RoactModule.PureComponent:extend("AppRouteWrapper")
	
	function AppRouteWrapper.getAvatarRoute(p2)
		-- upvalues: AvatarScreen (upval), SwitchTab (upval), opaquePageFromRoute (copy), AvatarRoute (upval), routeInfoFromPage (copy), AppPageModule (upval)
		local CurrentNavigationRoute = p2.props.currentNavigationRoute
		local CurrentNavigationRouteEntry = CurrentNavigationRoute[#CurrentNavigationRoute]
		local Name = CurrentNavigationRouteEntry.name
		
		if Name == AvatarScreen.AvatarExperienceRoot or Name == SwitchTab.AvatarExperienceTab then
			return p2.props.avatarRoute
		else
			local OpaquePageFromRouteResult = opaquePageFromRoute(CurrentNavigationRoute)
			local Name1 = OpaquePageFromRouteResult.name
			
			return if Name1 == AvatarScreen.AvatarExperienceRoot or Name1 == SwitchTab.AvatarExperienceTab then AvatarRoute.new({
				isVisible = true,
				current = routeInfoFromPage(CurrentNavigationRouteEntry),
				opaque = p2.props.avatarRoute.opaque,
				isOverlayVisible = p2.props.centralOverlayShowing
			}) else AvatarRoute.new({
				current = routeInfoFromPage(CurrentNavigationRouteEntry),
				opaque = routeInfoFromPage(OpaquePageFromRouteResult),
				isVisible = CurrentNavigationRouteEntry.name == AppPageModule.AvatarExperienceWrapper or CurrentNavigationRouteEntry.name == AppPageModule.AvatarExperienceWrapperTransparent or (OpaquePageFromRouteResult.name == AppPageModule.AvatarExperienceWrapper or OpaquePageFromRouteResult.name == AppPageModule.AvatarExperienceWrapperTransparent),
				isOverlayVisible = p2.props.centralOverlayShowing
			})
		end
	end
	
	function AppRouteWrapper.render(p2)
		-- upvalues: RoactModule (upval), p1 (copy), CryoModule (upval)
		return RoactModule.createElement(p1, CryoModule.Dictionary.join(p2.props, {
			avatarRoute = p2:getAvatarRoute(),
			currentNavigationRoute = CryoModule.None,
			centralOverlayShowing = CryoModule.None
		}))
	end
	
	local v1 = if FFlagSignalsNavP3gAvatarExperience then function(p2)
		-- upvalues: GetLegacyNavigationStore (upval), UseSignalState (upval), ReactModule (upval), v1 (copy), CryoModule (upval)
		return ReactModule.createElement(v1, CryoModule.Dictionary.union(p2, {
			currentNavigationRoute = UseSignalState(GetLegacyNavigationStore(false).getCurrentLegacyRoute)
		}))
	end else RoactRoduxModule.connect(function(p2, p3)
		-- upvalues: FFlagSignalsNavP3gAvatarExperience (upval), FFlagUseNavigationSelectors (upval), Selectors (upval)
		return {
			currentNavigationRoute = if FFlagSignalsNavP3gAvatarExperience then nil elseif FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p2) else p2.Navigation.history[#p2.Navigation.history],
			avatarRoute = p3.avatarRoute or p2.AvatarExperience.AvatarScene.AvatarRoute,
			centralOverlayShowing = p2.CentralOverlay.OverlayType ~= nil
		}
	end, nil)(AppRouteWrapper)
	
	return (WithContextValueModule(v1, AvatarRouteContext.Consumer, "avatarRoute", { required = false }))
end