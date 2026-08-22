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
local var4 = if fFlagUseSignalsForStartup then require(parent.StartupStore).GetStartupStore else nil
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

return function(p0) --[[ line: 47 | named "useClientCacheFallbackBannerConfig" ]]
	-- upvalues: useDispatch (ref), fFlagSignalsNavP3fGameDetails (ref), reactModule (ref), signalsModule (ref), getLegacyNavigationStore (ref), appPage (ref), signalsModule_1 (ref), signalsReactModule (ref), useSelector (ref), selectCurrentRoactNavigationRoute (ref), useRoactService (ref), roactNetworking (ref), appOmniRecommendationsRequest (ref), appLogging (ref), fFlagUseSignalsForStartup (ref), var4 (ref), retrievalStatus (ref), omniFeedConstants (ref), discoveryEventErrorLogger (ref), promiseModule (ref)
	local var10 = useDispatch()
	local var11 = nil
	local var12 = nil
	
	if fFlagSignalsNavP3fGameDetails then
		var12 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 54 ]]
			-- upvalues: signalsModule (copy), getLegacyNavigationStore (copy), appPage (copy), signalsModule_1 (copy)
			return signalsModule.createComputed(function(p1) --[[ line: 55 ]]
				-- upvalues: getLegacyNavigationStore (copy), appPage (copy), signalsModule_1 (copy)
				local currentRoute = getLegacyNavigationStore(false).getCurrentRoute(p1)
				
				return (if currentRoute then currentRoute.routeName else appPage.Home) == appPage.Home and signalsModule_1.getCacheStore().getHomePageDataSource(p1) == "Cache"
			end)
		end, {}))
	else
		local var13 = useSelector(selectCurrentRoactNavigationRoute)
		var11 = if var13 then var13.routeName else appPage.Home
	end
	local var19
	local var14 = useRoactService(roactNetworking)
	local var15 = useRoactService(appOmniRecommendationsRequest)
	local var16 = useRoactService(appLogging)
	local var17 = if fFlagUseSignalsForStartup then signalsReactModule.useSignalState(var4(false).getHomePageDataStatus) else useSelector(function(p2) --[[ line: 74 ]]
		return p2.Startup.HomePageDataStatus
	end)
	local var18 = signalsReactModule.useSignalState(signalsModule_1.getCacheStore().getHomePageDataSource)
	
	if fFlagSignalsNavP3fGameDetails then
		var19 = var12
		
		if var19 then
			var19 = var17 == retrievalStatus.Done
			var19 = nil
		end
	else
		var19 = var11 == appPage.Home and (var17 == retrievalStatus.Done and var18 == "Cache")
	end
	return {
		shouldShowBanner = var19,
		onRefreshButtonClick = reactModule.useCallback(function() --[[ line: 87 ]]
			-- upvalues: fFlagSignalsNavP3fGameDetails (copy), getLegacyNavigationStore (copy), appPage (copy), var11 (write), var10 (ref), p0 (ref), var14 (ref), var15 (ref), omniFeedConstants (copy), var16 (ref), discoveryEventErrorLogger (copy), promiseModule (copy)
			local var22
			local _ = nil
			
			if fFlagSignalsNavP3fGameDetails then
				local currentRoute = getLegacyNavigationStore(false).getCurrentRoute(false)
				local _ = (if currentRoute then currentRoute.routeName else appPage.Home) == appPage.Home
			else
				var22 = var11 == appPage.Home
			end
			if var22 then
				return var10(p0(var14, var15, appPage.Home, nil, nil, omniFeedConstants.OmniRecommendationsRequestIntent.ManualRefresh, var16)):catch(function(p3) --[[ line: 109 ]]
					-- upvalues: discoveryEventErrorLogger (copy), promiseModule (copy)
					discoveryEventErrorLogger.reportError("ClientCacheFallbackBannerRefreshError", "Error refreshing omni recommendations")
					
					return promiseModule.reject(p3)
				end)
			end
			discoveryEventErrorLogger.reportError("ClientCacheFallbackBannerRefreshError", "Current page is not the home page")
			
			return promiseModule.reject()
		end, {
			var10,
			var14,
			var15,
			var16,
			var11
		})
	}
end