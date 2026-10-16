local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local CarouselModule = require(script.Parent.Carousel)
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local UseSocialCarouselAnalyticsModule = require(SocialCarousel.Analytics.useSocialCarouselAnalytics)
local UseTilesSeenCollectionModule = require(SocialCarousel.Analytics.useTilesSeenCollection)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local FFlagCreateConnectionsHub = require(Parent.SharedFlags).FFlagCreateConnectionsHub
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1) --[[ Line: 26 | Named "CarouselContainer" ]]
	-- upvalues: UseSocialCarouselAnalyticsModule (copy), UseTilesSeenCollectionModule (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), ReactModule (copy), FFlagCreateConnectionsHub (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), CarouselModule (copy)
	local UseSocialCarouselAnalyticsModuleResult = UseSocialCarouselAnalyticsModule()
	local UseTilesSeenCollectionModuleResult = UseTilesSeenCollectionModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseRefResult = ReactModule.useRef({ startIndex = 1, endIndex = 1 })
	
	return ReactModule.createElement(CarouselModule, {
		onActivateHeader = ReactModule.useCallback(function() --[[ Line: 33 ]]
			-- upvalues: UseSocialCarouselAnalyticsModuleResult (copy), FFlagCreateConnectionsHub (upval), UseNavigationResult (copy), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
			UseSocialCarouselAnalyticsModuleResult.friendsHeaderPressed()
			
			if FFlagCreateConnectionsHub then
				UseNavigationResult.navigate(AppPage.CoHubMyConnections)
				
				return
			end
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage({ name = AppPage.ViewFriends }))
				
				return
			else
				UseDispatchResult(NavigateDownFunction({ name = AppPage.ViewFriends }))
			end
		end, { UseDispatchResult, UseNavigationResult }),
		onTileContentChanged = ReactModule.useCallback(function(p2, p3, p4) --[[ Line: 44 ]]
			-- upvalues: UseRefResult (copy), UseTilesSeenCollectionModuleResult (copy)
			local Current = UseRefResult.current
			
			if Current.startIndex <= p3 and p3 <= Current.endIndex then
				UseTilesSeenCollectionModuleResult.addTileToCollection(p2, p3, p4)
			end
		end, { UseTilesSeenCollectionModuleResult }),
		appCompositionEnabled = p1.appCompositionEnabled
	})
end