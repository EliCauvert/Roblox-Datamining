local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local navigationRoduxModule = require(parent.NavigationRodux)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local navigationModule = require(parent.Navigation)
local socialStopwatchModule = require(parent.SocialStopwatch)
local appPage = robloxAppEnumsModule.AppPage
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useNavigation = navigationModule.useNavigation
local addFriendsTileModule = require(script.Parent.AddFriendsTile)
local useSocialCarouselAnalyticsModule = require(socialCarousel.Analytics.useSocialCarouselAnalytics)
local useSocialCarouselContextModule = require(socialCarousel.Contexts.useSocialCarouselContext)
local constantsModule = require(socialCarousel.Common.Constants)
local useNewFriendRequestsCountModule = require(socialCarousel.Hooks.useNewFriendRequestsCount)
local fFlagCreateConnectionsHub = require(parent.SharedFlags).FFlagCreateConnectionsHub
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var13 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0)
	-- upvalues: useNavigation (ref), useDispatch (ref), useSocialCarouselAnalyticsModule (ref), useSocialCarouselContextModule (ref), useNewFriendRequestsCountModule (ref), reactModule (ref), socialStopwatchModule (ref), fFlagCreateConnectionsHub (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var13 (ref), navigateDown (ref), constantsModule (ref), addFriendsTileModule (ref), cryoModule (ref)
	local var14 = useNavigation()
	local var15 = useDispatch()
	local var16 = useSocialCarouselAnalyticsModule()
	local var17 = useSocialCarouselContextModule()
	local var18 = useNewFriendRequestsCountModule()
	local var19 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), p0 (ref), socialStopwatchModule (copy), fFlagCreateConnectionsHub (copy), var14 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var13 (copy), var15 (ref), navigateDown (copy)
		var16.addFriendsPressed(p0.index)
		socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.AFPUserTileLoadFromHomeCarousel)
		
		if fFlagCreateConnectionsHub then
			var14.navigate(appPage.CoHubAddConnections)
			
			return
		elseif fFlagSignalsNavP3Dispatch then
			var13.down(var13.fromLegacyPage({ name = appPage.AddFriendsPage }))
			
			return
		end
		var15(navigateDown({ name = appPage.AddFriendsPage }))
	end, { var15, var14 })
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), constantsModule (copy)
		var17.onSuccessfulRender(constantsModule.ANALYTICS.UI_LOADING_EVENTS.ADD_FRIENDS)
	end, {})
	
	return reactModule.createElement(addFriendsTileModule, cryoModule.Dictionary.join(p0, { onActivated = var19, badge = var18 }))
end