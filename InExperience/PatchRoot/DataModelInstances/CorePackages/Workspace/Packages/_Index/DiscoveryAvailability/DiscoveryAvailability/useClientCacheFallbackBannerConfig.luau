local DiscoveryAvailability = script:FindFirstAncestor("DiscoveryAvailability")
local Parent = DiscoveryAvailability.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigationRoduxModule = require(Parent.NavigationRodux)
local SelectCurrentRoactNavigationRoute = NavigationRoduxModule.Selectors.selectCurrentRoactNavigationRoute
local GetLegacyNavigationStoreFunction = NavigationRoduxModule.GetLegacyNavigationStore
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSignalsNavP3fGameDetails = SharedFlagsModule.FFlagSignalsNavP3fGameDetails
local FFlagUseSignalsForStartup = SharedFlagsModule.FFlagUseSignalsForStartup
local FFlagLuaAppEnableSduiHomePage = SharedFlagsModule.FFlagLuaAppEnableSduiHomePage
local GetStartupStore = if FFlagUseSignalsForStartup then require(Parent.StartupStore).GetStartupStore else nil
local AppPage = require(Parent.RobloxAppEnums).AppPage
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local _ = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)
local SignalsReactModule = require(Parent.SignalsReact)
local SignalsModule = require(Parent.Signals)
local SignalsModule1 = require(DiscoveryAvailability.Signals)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AppOmniRecommendationsRequest = require(Parent.RoactServiceTags).AppOmniRecommendationsRequest
local AppLogging = require(Parent.RoactServiceTags).AppLogging
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local OmniFeedConstants = require(Parent.DiscoveryTypes).OmniFeedConstants

return function(Callback1, Callback)
	-- upvalues: UseDispatchFunction (copy), FFlagSignalsNavP3fGameDetails (copy), ReactModule (copy), SignalsModule (copy), GetLegacyNavigationStoreFunction (copy), AppPage (copy), SignalsModule1 (copy), SignalsReactModule (copy), UseSelectorFunction (copy), SelectCurrentRoactNavigationRoute (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), AppOmniRecommendationsRequest (copy), AppLogging (copy), FFlagUseSignalsForStartup (copy), GetStartupStore (copy), RetrievalStatus (copy), FFlagLuaAppEnableSduiHomePage (copy), DiscoveryEventErrorLogger (copy), PromiseModule (copy), OmniFeedConstants (copy)
	local UseDispatchResult = UseDispatchFunction()
	local RouteName = nil
	local UseSignalStateResult = nil
	
	if FFlagSignalsNavP3fGameDetails then
		UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), GetLegacyNavigationStoreFunction (upval), AppPage (upval), SignalsModule1 (upval)
			return SignalsModule.createComputed(function(p1): boolean
				-- upvalues: GetLegacyNavigationStoreFunction (upval), AppPage (upval), SignalsModule1 (upval)
				local CurrentRoute = GetLegacyNavigationStoreFunction(false).getCurrentRoute(p1)
				local HomePageDataSource = SignalsModule1.getCacheStore().getHomePageDataSource(p1)
				
				return (if CurrentRoute then CurrentRoute.routeName else AppPage.Home) == AppPage.Home and HomePageDataSource == "Cache"
			end)
		end, {})))
	else
		local UseSelectorResult = UseSelectorFunction(SelectCurrentRoactNavigationRoute)
		RouteName = if UseSelectorResult then UseSelectorResult.routeName else AppPage.Home
	end
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppOmniRecommendationsRequest)
	local UseRoactServiceResult2 = UseRoactServiceFunction(AppLogging)
	local UseSignalStateResult1 = if FFlagUseSignalsForStartup then SignalsReactModule.useSignalState(GetStartupStore(false).getHomePageDataStatus) else UseSelectorFunction(function(p1)
		return p1.Startup.HomePageDataStatus
	end)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(SignalsModule1.getCacheStore().getHomePageDataSource)
	
	return {
		shouldShowBanner = if FFlagSignalsNavP3fGameDetails then UseSignalStateResult and UseSignalStateResult1 == RetrievalStatus.Done else RouteName == AppPage.Home and UseSignalStateResult1 == RetrievalStatus.Done and UseSignalStateResult2 == "Cache",
		onRefreshButtonClick = ReactModule.useCallback(function()
			-- upvalues: FFlagSignalsNavP3fGameDetails (upval), GetLegacyNavigationStoreFunction (upval), AppPage (upval), RouteName (ref), FFlagLuaAppEnableSduiHomePage (upval), Callback (copy), DiscoveryEventErrorLogger (upval), PromiseModule (upval), UseDispatchResult (copy), Callback1 (copy), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), OmniFeedConstants (upval), UseRoactServiceResult2 (copy)
			local IsHomeMatch = nil
			if FFlagSignalsNavP3fGameDetails then
				local CurrentRoute = GetLegacyNavigationStoreFunction(false).getCurrentRoute(false)
				IsHomeMatch = (if CurrentRoute then CurrentRoute.routeName else AppPage.Home) == AppPage.Home
			else
				IsHomeMatch = RouteName == AppPage.Home
			end
			if not IsHomeMatch then
				DiscoveryEventErrorLogger.reportError("ClientCacheFallbackBannerRefreshError", "Current page is not the home page")
				
				return PromiseModule.reject()
			elseif FFlagLuaAppEnableSduiHomePage then
				local CallbackResult = Callback()
				
				return if CallbackResult then CallbackResult:catch(function(Err)
					-- upvalues: DiscoveryEventErrorLogger (upval), PromiseModule (upval)
					DiscoveryEventErrorLogger.reportError("ClientCacheFallbackBannerRefreshError", "Error refreshing SDUI home page")
					
					return PromiseModule.reject(Err)
				end) else PromiseModule.resolve()
			else
				return UseDispatchResult(Callback1(UseRoactServiceResult, UseRoactServiceResult1, AppPage.Home, nil, nil, OmniFeedConstants.OmniRecommendationsRequestIntent.ManualRefresh, UseRoactServiceResult2)):catch(function(Err)
					-- upvalues: DiscoveryEventErrorLogger (upval), PromiseModule (upval)
					DiscoveryEventErrorLogger.reportError("ClientCacheFallbackBannerRefreshError", "Error refreshing omni recommendations")
					
					return PromiseModule.reject(Err)
				end)
			end
		end, {
			UseDispatchResult, UseRoactServiceResult, UseRoactServiceResult1,
			UseRoactServiceResult2, RouteName,
			if FFlagLuaAppEnableSduiHomePage then Callback1 else nil,
			if FFlagLuaAppEnableSduiHomePage then Callback else nil
		})
	}
end