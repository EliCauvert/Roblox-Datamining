local discoveryAvailability = script:FindFirstAncestor("DiscoveryAvailability")
local parent = discoveryAvailability.Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local navigationRoduxModule = require(parent.NavigationRodux)
local selectCurrentRoactNavigationRoute = navigationRoduxModule.Selectors.selectCurrentRoactNavigationRoute
local getLegacyNavigationStore = navigationRoduxModule.GetLegacyNavigationStore
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSignalsNavP3fGameDetails = sharedFlagsModule.FFlagSignalsNavP3fGameDetails
local fFlagUseSignalsForStartup = sharedFlagsModule.FFlagUseSignalsForStartup
local var1 = if fFlagUseSignalsForStartup then require(parent.StartupStore).GetStartupStore else nil
local appPage = require(parent.RobloxAppEnums).AppPage
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local _ = require(parent.LuauPolyfill)
local promiseModule = require(parent.Promise)
local signalsReactModule = require(parent.SignalsReact)
local signalsModule = require(parent.Signals)
local signalsModule_1 = require(discoveryAvailability.Signals)
local useRoactService = robloxAppHooksModule.useRoactService
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local appOmniRecommendationsRequest = require(parent.RoactServiceTags).AppOmniRecommendationsRequest
local appLogging = require(parent.RoactServiceTags).AppLogging
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local omniFeedConstants = require(parent.DiscoveryTypes).OmniFeedConstants

return function(p1)
	-- upvalues: useDispatch (ref), fFlagSignalsNavP3fGameDetails (ref), reactModule (ref), signalsModule (ref), getLegacyNavigationStore (ref), appPage (ref), signalsModule_1 (ref), signalsReactModule (ref), useSelector (ref), selectCurrentRoactNavigationRoute (ref), useRoactService (ref), roactNetworking (ref), appOmniRecommendationsRequest (ref), appLogging (ref), fFlagUseSignalsForStartup (ref), var1 (ref), retrievalStatus (ref), omniFeedConstants (ref), discoveryEventErrorLogger (ref), promiseModule (ref)
	local var2 = useDispatch()
	local var3 = nil
	local var4 = nil
	
	if fFlagSignalsNavP3fGameDetails then
		var4 = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), getLegacyNavigationStore (copy), appPage (copy), signalsModule_1 (copy)
			return signalsModule.createComputed(function(p2)
				-- upvalues: getLegacyNavigationStore (copy), appPage (copy), signalsModule_1 (copy)
				local currentRoute = getLegacyNavigationStore(false).getCurrentRoute(p2)
				
				return (if currentRoute then currentRoute.routeName else appPage.Home) == appPage.Home and signalsModule_1.getCacheStore().getHomePageDataSource(p2) == "Cache"
			end)
		end, {}))
	else
		local var5 = useSelector(selectCurrentRoactNavigationRoute)
		var3 = if var5 then var5.routeName else appPage.Home
	end
	local var6
	local var7 = useRoactService(roactNetworking)
	local var8 = useRoactService(appOmniRecommendationsRequest)
	local var9 = useRoactService(appLogging)
	local var10 = if fFlagUseSignalsForStartup then signalsReactModule.useSignalState(var1(false).getHomePageDataStatus) else useSelector(function(p2)
		return p2.Startup.HomePageDataStatus
	end)
	local var11 = signalsReactModule.useSignalState(signalsModule_1.getCacheStore().getHomePageDataSource)
	
	if fFlagSignalsNavP3fGameDetails then
		var6 = var4
		
		if var6 then
			var6 = var10 == retrievalStatus.Done
			var6 = nil
		end
	else
		var6 = var3 == appPage.Home and (var10 == retrievalStatus.Done and var11 == "Cache")
	end
	return {
		shouldShowBanner = var6,
		onRefreshButtonClick = reactModule.useCallback(function()
			-- upvalues: fFlagSignalsNavP3fGameDetails (copy), getLegacyNavigationStore (copy), appPage (copy), var3 (write), var2 (ref), p1 (ref), var7 (ref), var8 (ref), omniFeedConstants (copy), var9 (ref), discoveryEventErrorLogger (copy), promiseModule (copy)
			local var12
			local _ = nil
			
			if fFlagSignalsNavP3fGameDetails then
				local currentRoute = getLegacyNavigationStore(false).getCurrentRoute(false)
				local _ = (if currentRoute then currentRoute.routeName else appPage.Home) == appPage.Home
			else
				var12 = var3 == appPage.Home
			end
			if var12 then
				return var2(p1(var7, var8, appPage.Home, nil, nil, omniFeedConstants.OmniRecommendationsRequestIntent.ManualRefresh, var9)):catch(function(p2)
					-- upvalues: discoveryEventErrorLogger (copy), promiseModule (copy)
					discoveryEventErrorLogger.reportError("ClientCacheFallbackBannerRefreshError", "Error refreshing omni recommendations")
					
					return promiseModule.reject(p2)
				end)
			end
			discoveryEventErrorLogger.reportError("ClientCacheFallbackBannerRefreshError", "Current page is not the home page")
			
			return promiseModule.reject()
		end, {
			var2,
			var7,
			var8,
			var9,
			var3
		})
	}
end