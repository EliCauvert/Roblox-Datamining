local discoveryAvailability = script:FindFirstAncestor("DiscoveryAvailability")
local parent = discoveryAvailability.Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local selectCurrentRoactNavigationRoute = require(parent.NavigationRodux).Selectors.selectCurrentRoactNavigationRoute
local appPage = require(parent.RobloxAppEnums).AppPage
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local _ = require(parent.LuauPolyfill)
local promiseModule = require(parent.Promise)
local signalsReactModule = require(parent.SignalsReact)
local signalsModule = require(discoveryAvailability.Signals)
local useRoactService = robloxAppHooksModule.useRoactService
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local appOmniRecommendationsRequest = require(parent.RoactServiceTags).AppOmniRecommendationsRequest
local appLogging = require(parent.RoactServiceTags).AppLogging
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local omniFeedConstants = require(parent.DiscoveryTypes).OmniFeedConstants

return function(p0) --[[ line: 37 | named "useClientCacheFallbackBannerConfig" ]]
	-- upvalues: useDispatch (ref), useSelector (ref), selectCurrentRoactNavigationRoute (ref), appPage (ref), useRoactService (ref), roactNetworking (ref), appOmniRecommendationsRequest (ref), appLogging (ref), signalsReactModule (ref), signalsModule (ref), retrievalStatus (ref), reactModule (ref), omniFeedConstants (ref), discoveryEventErrorLogger (ref), promiseModule (ref)
	local var6 = useDispatch()
	local var7 = useSelector(selectCurrentRoactNavigationRoute)
	local var8 = if var7 then var7.routeName else appPage.Home
	local var9 = useRoactService(roactNetworking)
	local var10 = useRoactService(appOmniRecommendationsRequest)
	local var11 = useRoactService(appLogging)
	
	return {
		shouldShowBanner = var8 == appPage.Home and (useSelector(function(p1) --[[ line: 48 ]]
			return p1.Startup.HomePageDataStatus
		end) == retrievalStatus.Done and signalsReactModule.useSignalState(signalsModule.getCacheStore().getHomePageDataSource) == "Cache"),
		onRefreshButtonClick = reactModule.useCallback(function() --[[ line: 59 ]]
			-- upvalues: var8 (ref), appPage (copy), var6 (ref), p0 (ref), var9 (ref), var10 (ref), omniFeedConstants (copy), var11 (ref), discoveryEventErrorLogger (copy), promiseModule (copy)
			if var8 == appPage.Home then
				return var6(p0(var9, var10, appPage.Home, nil, nil, omniFeedConstants.OmniRecommendationsRequestIntent.ManualRefresh, var11)):catch(function(p2) --[[ line: 73 ]]
					-- upvalues: discoveryEventErrorLogger (copy), promiseModule (copy)
					discoveryEventErrorLogger.reportError("ClientCacheFallbackBannerRefreshError", "Error refreshing omni recommendations")
					
					return promiseModule.reject(p2)
				end)
			end
			discoveryEventErrorLogger.reportError("ClientCacheFallbackBannerRefreshError", "Current page is not the home page")
			
			return promiseModule.reject()
		end, {
			var6,
			var9,
			var10,
			var11,
			var8
		})
	}
end