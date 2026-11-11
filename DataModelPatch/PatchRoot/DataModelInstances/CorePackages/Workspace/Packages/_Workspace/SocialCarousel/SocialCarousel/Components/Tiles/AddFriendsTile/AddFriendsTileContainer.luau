local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local SocialStopwatchModule = require(Parent.SocialStopwatch)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AddFriendsTileModule = require(script.Parent.AddFriendsTile)
local UseSocialCarouselAnalyticsModule = require(SocialCarousel.Analytics.useSocialCarouselAnalytics)
local UseSocialCarouselContextModule = require(SocialCarousel.Contexts.useSocialCarouselContext)
local ConstantsModule = require(SocialCarousel.Common.Constants)
local UseNewFriendRequestsCountModule = require(SocialCarousel.Hooks.useNewFriendRequestsCount)
local FFlagCreateConnectionsHub = require(Parent.SharedFlags).FFlagCreateConnectionsHub
local FFlagAddFriendsTileLoadFromHomeCarouselAnalytics = require(Parent.SharedFlags).FFlagAddFriendsTileLoadFromHomeCarouselAnalytics
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1)
	-- upvalues: UseNavigationFunction (copy), UseDispatchFunction (copy), UseSocialCarouselAnalyticsModule (copy), UseSocialCarouselContextModule (copy), UseNewFriendRequestsCountModule (copy), ReactModule (copy), FFlagAddFriendsTileLoadFromHomeCarouselAnalytics (copy), SocialStopwatchModule (copy), FFlagCreateConnectionsHub (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), ConstantsModule (copy), AddFriendsTileModule (copy), CryoModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseSocialCarouselAnalyticsModuleResult = UseSocialCarouselAnalyticsModule()
	local UseSocialCarouselContextModuleResult = UseSocialCarouselContextModule()
	local UseNewFriendRequestsCountModuleResult = UseNewFriendRequestsCountModule()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseSocialCarouselAnalyticsModuleResult (copy), p1 (copy), FFlagAddFriendsTileLoadFromHomeCarouselAnalytics (upval), SocialStopwatchModule (upval), FFlagCreateConnectionsHub (upval), UseNavigationResult (copy), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		UseSocialCarouselAnalyticsModuleResult.addFriendsPressed(p1.index)
		
		if FFlagAddFriendsTileLoadFromHomeCarouselAnalytics then
			SocialStopwatchModule.Stopwatch.start(SocialStopwatchModule.Events.AFPUserTileLoadFromHomeCarousel)
		end
		if FFlagCreateConnectionsHub then
			UseNavigationResult.navigate(AppPage.CoHubAddConnections)
			
			return
		end
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage({ name = AppPage.AddFriendsPage }))
			
			return
		else
			UseDispatchResult(NavigateDownFunction({ name = AppPage.AddFriendsPage }))
		end
	end, { UseDispatchResult, UseNavigationResult })
	ReactModule.useEffect(function()
		-- upvalues: UseSocialCarouselContextModuleResult (copy), ConstantsModule (upval)
		UseSocialCarouselContextModuleResult.onSuccessfulRender(ConstantsModule.ANALYTICS.UI_LOADING_EVENTS.ADD_FRIENDS)
	end, {})
	
	return ReactModule.createElement(AddFriendsTileModule, CryoModule.Dictionary.join(p1, {
		onActivated = UseResult,
		badge = UseNewFriendRequestsCountModuleResult
	}))
end