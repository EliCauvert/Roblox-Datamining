local discoveryAvailability = script:FindFirstAncestor("DiscoveryAvailability")
local parent = discoveryAvailability.Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local navigationRoduxModule = require(parent.NavigationRodux)
local selectCurrentRoactNavigationRoute = navigationRoduxModule.Selectors.selectCurrentRoactNavigationRoute
local getLegacyNavigationStore = navigationRoduxModule.GetLegacyNavigationStore
local fFlagSignalsNavP3fGameDetails = require(parent.SharedFlags).FFlagSignalsNavP3fGameDetails
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

return function(p0) --[[ line: 42 | named "useClientCacheFallbackBannerConfig" ]]
	-- upvalues: useDispatch (ref), fFlagSignalsNavP3fGameDetails (ref), reactModule (ref), signalsModule (ref), getLegacyNavigationStore (ref), appPage (ref), signalsModule_1 (ref), signalsReactModule (ref), useSelector (ref), selectCurrentRoactNavigationRoute (ref), useRoactService (ref), roactNetworking (ref), appOmniRecommendationsRequest (ref), appLogging (ref), retrievalStatus (ref), omniFeedConstants (ref), discoveryEventErrorLogger (ref), promiseModule (ref)
	local var8 = useDispatch()
	local var9 = nil
	local var10 = nil
	
	if fFlagSignalsNavP3fGameDetails then
		var10 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 49 ]]
			-- upvalues: signalsModule (copy), getLegacyNavigationStore (copy), appPage (copy), signalsModule_1 (copy)
			return signalsModule.createComputed(function(p1) --[[ line: 50 ]]
				-- upvalues: getLegacyNavigationStore (copy), appPage (copy), signalsModule_1 (copy)
				local currentRoute = getLegacyNavigationStore(false).getCurrentRoute(p1)
				
				return (if currentRoute then currentRoute.routeName else appPage.Home) == appPage.Home and signalsModule_1.getCacheStore().getHomePageDataSource(p1) == "Cache"
			end)
		end, {}))
	else
		local var11 = useSelector(selectCurrentRoactNavigationRoute)
		var9 = if var11 then var11.routeName else appPage.Home
	end
	local var17
	local var12 = useRoactService(roactNetworking)
	local var13 = useRoactService(appOmniRecommendationsRequest)
	local var14 = useRoactService(appLogging)
	local var15 = useSelector(function(p2) --[[ line: 67 ]]
		return p2.Startup.HomePageDataStatus
	end)
	local var16 = signalsReactModule.useSignalState(signalsModule_1.getCacheStore().getHomePageDataSource)
	
	if fFlagSignalsNavP3fGameDetails then
		var17 = var10
		
		if var17 then
			var17 = var15 == retrievalStatus.Done
			var17 = nil
		end
	else
		var17 = var9 == appPage.Home and (var15 == retrievalStatus.Done and var16 == "Cache")
	end
	return {
		shouldShowBanner = var17,
		onRefreshButtonClick = reactModule.useCallback(function() --[[ line: 80 ]]
			-- upvalues: fFlagSignalsNavP3fGameDetails (copy), getLegacyNavigationStore (copy), appPage (copy), var9 (write), var8 (ref), p0 (ref), var12 (ref), var13 (ref), omniFeedConstants (copy), var14 (ref), discoveryEventErrorLogger (copy), promiseModule (copy)
			local var20
			local _ = nil
			
			if fFlagSignalsNavP3fGameDetails then
				local currentRoute = getLegacyNavigationStore(false).getCurrentRoute(false)
				local _ = (if currentRoute then currentRoute.routeName else appPage.Home) == appPage.Home
			else
				var20 = var9 == appPage.Home
			end
			if var20 then
				return var8(p0(var12, var13, appPage.Home, nil, nil, omniFeedConstants.OmniRecommendationsRequestIntent.ManualRefresh, var14)):catch(function(p3) --[[ line: 102 ]]
					-- upvalues: discoveryEventErrorLogger (copy), promiseModule (copy)
					discoveryEventErrorLogger.reportError("ClientCacheFallbackBannerRefreshError", "Error refreshing omni recommendations")
					
					return promiseModule.reject(p3)
				end)
			end
			discoveryEventErrorLogger.reportError("ClientCacheFallbackBannerRefreshError", "Current page is not the home page")
			
			return promiseModule.reject()
		end, {
			var8,
			var12,
			var13,
			var14,
			var9
		})
	}
end