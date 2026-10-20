local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local RouteInfo = AvatarExperienceNavigationModule.AvatarRoute.RouteInfo
local AvatarRoute = AvatarExperienceNavigationModule.AvatarRoute.AvatarRoute
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local AxRnRoute = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.rn.route")
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local AXFixEmptyAvatarRoute = game:DefineFastFlag("AXFixEmptyAvatarRoute", false)
local FFlagAXEnableProfileTab = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXEnableProfileTab
local GetActiveAvatarScreen = if FFlagAXEnableProfileTab then AvatarExperienceNavigationModule.AvatarRoute.getActiveAvatarScreen else nil

local function makeRouteInfo(Input)
	-- upvalues: RouteInfo (copy)
	return RouteInfo.new(Input.routeName, Input.key, Input.params)
end

local GetActiveAvatarScreen1 = if FFlagAXEnableProfileTab then GetActiveAvatarScreen else NavigationUtilsModule.getActiveScreenNavigationState

local function findRoute(State, RouteName, p1)
	-- upvalues: findRoute (copy)
	if State.routeName == RouteName then
		return State, p1
	end
	local Index = State.index or 0
	local Route = nil
	local Route2 = nil
	
	for i, value in State.routes or {} do
		Route, Route2 = findRoute(value, RouteName, i == Index)
		
		if Route then
			return Route, p1 and Route2
		end
	end
	return nil, false
end

local function findNavigationRoute(p2, AvatarExperienceMainStackNavigator)
	-- upvalues: findRoute (copy)
	local Route, Route2 = findRoute(p2.state or {}, AvatarExperienceMainStackNavigator, true)
	
	if Route == nil then
		if not _G.__TESTEZ_RUNNING_TEST__ then
			warn(AvatarExperienceMainStackNavigator .. " not found in current navigation state")
		end
		Route = {}
	end
	return Route, Route2
end

return function(p2, IsVisible)
	-- upvalues: findNavigationRoute (copy), AvatarScreen (copy), GetActiveAvatarScreen1 (copy), RouteInfo (copy), AvatarRoute (copy), makeRouteInfo (copy), AXFixEmptyAvatarRoute (copy), AvatarScreenProperties (copy), MutedErrorModule (copy), HttpService (copy), AxRnRoute (copy)
	local NewResult = nil
	local NewResult1 = nil
	local PreviousPages = {}
	local NavigationRoute, NavigationRoute2 = findNavigationRoute(p2, AvatarScreen.AvatarExperienceMainStackNavigator)
	local Routes = NavigationRoute.routes
	
	if Routes and NavigationRoute.index then
		local ActiveAvatarScreen = GetActiveAvatarScreen1(Routes[NavigationRoute.index])
		NewResult = RouteInfo.new(ActiveAvatarScreen.routeName, ActiveAvatarScreen.key, ActiveAvatarScreen.params)
		local ActiveAvatarScreen1 = nil
		
		for i = NavigationRoute.index, 1, -1 do
			ActiveAvatarScreen1 = GetActiveAvatarScreen1(Routes[i])
			
			if #PreviousPages < AvatarRoute.maxPreviousCount and i < NavigationRoute.index then
				table.insert(PreviousPages, makeRouteInfo(ActiveAvatarScreen1))
			end
			if AXFixEmptyAvatarRoute and not AvatarScreenProperties[ActiveAvatarScreen1.routeName] then
				MutedErrorModule("AvatarScreenProperties does not exist for: " .. HttpService:JSONEncode(ActiveAvatarScreen1))
			end
			if AXFixEmptyAvatarRoute and not AvatarScreenProperties[ActiveAvatarScreen1.routeName] or AvatarScreenProperties[ActiveAvatarScreen1.routeName].isTransparent then
				continue
			end
			NewResult1 = RouteInfo.new(ActiveAvatarScreen1.routeName, ActiveAvatarScreen1.key, ActiveAvatarScreen1.params)
			break
		end
	end
	local NewAvatarRoute = AvatarRoute.new({
		isVisible = IsVisible,
		isOverlayVisible = not NavigationRoute2,
		current = NewResult,
		previousPages = PreviousPages,
		opaque = NewResult1
	})
	AxRnRoute:debug("makeAvatarRoute: {}", NewAvatarRoute)
	
	return NewAvatarRoute
end