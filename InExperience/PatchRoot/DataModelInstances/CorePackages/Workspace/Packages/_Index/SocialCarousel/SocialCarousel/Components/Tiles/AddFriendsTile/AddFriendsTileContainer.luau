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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1)
	-- upvalues: useNavigation (ref), useDispatch (ref), useSocialCarouselAnalyticsModule (ref), useSocialCarouselContextModule (ref), useNewFriendRequestsCountModule (ref), reactModule (ref), socialStopwatchModule (ref), fFlagCreateConnectionsHub (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), constantsModule (ref), addFriendsTileModule (ref), cryoModule (ref)
	local var2 = useNavigation()
	local var3 = useDispatch()
	local var4 = useSocialCarouselAnalyticsModule()
	local var5 = useSocialCarouselContextModule()
	local var6 = useNewFriendRequestsCountModule()
	local var7 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), p1 (ref), socialStopwatchModule (copy), fFlagCreateConnectionsHub (copy), var2 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var3 (ref), navigateDown (copy)
		var4.addFriendsPressed(p1.index)
		socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.AFPUserTileLoadFromHomeCarousel)
		
		if fFlagCreateConnectionsHub then
			var2.navigate(appPage.CoHubAddConnections)
			
			return
		elseif fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage({ name = appPage.AddFriendsPage }))
			
			return
		end
		var3(navigateDown({ name = appPage.AddFriendsPage }))
	end, { var3, var2 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), constantsModule (copy)
		var5.onSuccessfulRender(constantsModule.ANALYTICS.UI_LOADING_EVENTS.ADD_FRIENDS)
	end, {})
	
	return reactModule.createElement(addFriendsTileModule, cryoModule.Dictionary.join(p1, { onActivated = var7, badge = var6 }))
end