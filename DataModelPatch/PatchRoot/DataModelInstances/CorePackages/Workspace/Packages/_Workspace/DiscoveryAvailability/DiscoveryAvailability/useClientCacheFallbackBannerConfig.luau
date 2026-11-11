local DiscoveryAvailability = script:FindFirstAncestor("DiscoveryAvailability")
local Parent = DiscoveryAvailability.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigationRoduxModule = require(Parent.NavigationRodux)
local SelectCurrentRoactNavigationRoute = NavigationRoduxModule.Selectors.selectCurrentRoactNavigationRoute
local GetLegacyNavigationStoreFunction = NavigationRoduxModule.GetLegacyNavigationStore
local FFlagSignalsNavP3hMisc = require(Parent.SharedFlags).FFlagSignalsNavP3hMisc
local AppPage = require(Parent.RobloxAppEnums).AppPage
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local _ = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)
local SignalsReactModule = require(Parent.SignalsReact)
local SignalsModule = require(DiscoveryAvailability.Signals)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AppOmniRecommendationsRequest = require(Parent.RoactServiceTags).AppOmniRecommendationsRequest
local AppLogging = require(Parent.RoactServiceTags).AppLogging
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local OmniFeedConstants = require(Parent.DiscoveryTypes).OmniFeedConstants

return function(Callback)
	-- upvalues: UseDispatchFunction (copy), FFlagSignalsNavP3hMisc (copy), SignalsReactModule (copy), GetLegacyNavigationStoreFunction (copy), AppPage (copy), UseSelectorFunction (copy), SelectCurrentRoactNavigationRoute (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), AppOmniRecommendationsRequest (copy), AppLogging (copy), SignalsModule (copy), RetrievalStatus (copy), ReactModule (copy), OmniFeedConstants (copy), DiscoveryEventErrorLogger (copy), PromiseModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local Name = nil
	
	if FFlagSignalsNavP3hMisc then
		local UseSignalStateResult = SignalsReactModule.useSignalState(GetLegacyNavigationStoreFunction(false).getCurrentPage)
		Name = if UseSignalStateResult then UseSignalStateResult.name else AppPage.Home
	else
		local UseSelectorResult = UseSelectorFunction(SelectCurrentRoactNavigationRoute)
		Name = if UseSelectorResult then UseSelectorResult.routeName else AppPage.Home
	end
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppOmniRecommendationsRequest)
	local UseRoactServiceResult2 = UseRoactServiceFunction(AppLogging)
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.Startup.HomePageDataStatus
	end)
	local UseSignalStateResult = SignalsReactModule.useSignalState(SignalsModule.getCacheStore().getHomePageDataSource)
	
	return {
		shouldShowBanner = Name == AppPage.Home and UseSelectorResult == RetrievalStatus.Done and UseSignalStateResult == "Cache",
		onRefreshButtonClick = ReactModule.useCallback(function()
			-- upvalues: Name (ref), AppPage (upval), UseDispatchResult (copy), Callback (copy), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), OmniFeedConstants (upval), UseRoactServiceResult2 (copy), DiscoveryEventErrorLogger (upval), PromiseModule (upval)
			if Name == AppPage.Home then
				return UseDispatchResult(Callback(UseRoactServiceResult, UseRoactServiceResult1, AppPage.Home, nil, nil, OmniFeedConstants.OmniRecommendationsRequestIntent.ManualRefresh, UseRoactServiceResult2)):catch(function(Err)
					-- upvalues: DiscoveryEventErrorLogger (upval), PromiseModule (upval)
					DiscoveryEventErrorLogger.reportError("ClientCacheFallbackBannerRefreshError", "Error refreshing omni recommendations")
					
					return PromiseModule.reject(Err)
				end)
			else
				DiscoveryEventErrorLogger.reportError("ClientCacheFallbackBannerRefreshError", "Current page is not the home page")
				
				return PromiseModule.reject()
			end
		end, {
			UseDispatchResult,
			UseRoactServiceResult,
			UseRoactServiceResult1,
			UseRoactServiceResult2,
			Name
		})
	}
end