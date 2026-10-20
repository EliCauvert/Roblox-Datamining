local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local NavigationModule = require(CorePackages.Workspace.Packages.Navigation)
local NavigationRoduxModule = require(CorePackages.Workspace.Packages.NavigationRodux)
local UseNavigationFunction = NavigationModule.useNavigation
local GetActiveRoutesFunction = NavigationModule.getActiveRoutes
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local AppPagePropertiesModule = require(Modules.LuaApp.AppPageProperties)
local HeaderBarDisplayOptionsModule = require(Modules.LuaApp.Enum.HeaderBarDisplayOptions)
local GetFFlagLuaAppEnableTopBannerFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableTopBanner

local function createPageNavigationOptionsFromRouteState(p1)
	-- upvalues: AppPagePropertiesModule (copy), AppPage (copy), HeaderBarDisplayOptionsModule (copy), GetFFlagLuaAppEnableTopBannerFunction (copy)
	local RouteName = p1.routeName
	local AppPagePropertiesModuleEntry = AppPagePropertiesModule[RouteName] or {}
	
	return {
		routeName = RouteName,
		titleLocalizationKey = AppPagePropertiesModuleEntry.nameLocalizationKey,
		headerBarDisplayOption = if AppPagePropertiesModuleEntry.renderUnderlyingPage then HeaderBarDisplayOptionsModule.DeferBeneath else AppPagePropertiesModuleEntry.headerBarDisplayOption,
		searchUuid = if RouteName == AppPage.SearchPage and p1.params then p1.params.detail else nil,
		disableAppTopBanner = if GetFFlagLuaAppEnableTopBannerFunction() then AppPagePropertiesModuleEntry.disableAppTopBanner == true else false
	}
end

local function _(p1)
	-- upvalues: NavigationRoduxModule (copy)
	if p1.routes and p1.index then
		local Route = p1.routes[1]
		
		return if Route.routes and Route.index and Route.routeName == NavigationRoduxModule.Constants.TempRnSwitchNavigatorName then Route.routes[Route.index].routeName else Route.routeName
	else
		return nil
	end
end

local function getPageNavigationOptionsInReverse(State)
	-- upvalues: GetActiveRoutesFunction (copy), createPageNavigationOptionsFromRouteState (copy), HeaderBarDisplayOptionsModule (copy), AppPage (copy), GetFFlagLuaAppEnableTopBannerFunction (copy)
	local ActiveRoutes = GetActiveRoutesFunction(State)
	local PageNavigationOptionsFromRouteState = nil
	
	for i = #ActiveRoutes, 1, -1 do
		PageNavigationOptionsFromRouteState = createPageNavigationOptionsFromRouteState(ActiveRoutes[i])
		
		if PageNavigationOptionsFromRouteState.headerBarDisplayOption ~= HeaderBarDisplayOptionsModule.DeferBeneath then
			return PageNavigationOptionsFromRouteState
		end
	end
	return {
		titleLocalizationKey = "",
		searchUuid = nil,
		routeName = AppPage.None,
		headerBarDisplayOption = HeaderBarDisplayOptionsModule.HideAll,
		disableAppTopBanner = not GetFFlagLuaAppEnableTopBannerFunction() and nil
	}
end

return function()
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), getPageNavigationOptionsInReverse (copy), NavigationRoduxModule (copy), AppPagePropertiesModule (copy), GetFFlagLuaAppEnableTopBannerFunction (copy)
	local UseNavigationResult = UseNavigationFunction()
	
	return ReactModule.useMemo(function()
		-- upvalues: getPageNavigationOptionsInReverse (upval), UseNavigationResult (copy), NavigationRoduxModule (upval), AppPagePropertiesModule (upval), GetFFlagLuaAppEnableTopBannerFunction (upval)
		local PageNavigationOptionsInReverse = getPageNavigationOptionsInReverse(UseNavigationResult.state)
		local State = UseNavigationResult.state
		local RouteName = nil
		
		if State.routes and State.index then
			local Route = State.routes[1]
			RouteName = if Route.routes and Route.index and Route.routeName == NavigationRoduxModule.Constants.TempRnSwitchNavigatorName then Route.routes[Route.index].routeName else Route.routeName
		else
			RouteName = nil
		end
		if RouteName then
			local AppPagePropertiesModuleEntry = AppPagePropertiesModule[RouteName]
			PageNavigationOptionsInReverse.rootPageOptions = {
				routeName = RouteName,
				titleLocalizationKey = if AppPagePropertiesModuleEntry then AppPagePropertiesModuleEntry.nameLocalizationKey else nil,
				disableAppTopBanner = if GetFFlagLuaAppEnableTopBannerFunction() and AppPagePropertiesModuleEntry then AppPagePropertiesModuleEntry.disableAppTopBanner == true else nil
			}
		end
		return PageNavigationOptionsInReverse
	end, { UseNavigationResult.state })
end