local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local reactModule = require(parent.React)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local roactUtilsModule = require(parent.RoactUtils)
local carouselModule = require(script.Parent.Carousel)
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local navigationModule = require(parent.Navigation)
local useSocialCarouselAnalyticsModule = require(socialCarousel.Analytics.useSocialCarouselAnalytics)
local useTilesSeenCollectionModule = require(socialCarousel.Analytics.useTilesSeenCollection)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local appPage = robloxAppEnumsModule.AppPage
local useNavigation = navigationModule.useNavigation
local fFlagCreateConnectionsHub = require(parent.SharedFlags).FFlagCreateConnectionsHub
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1)
	-- upvalues: useSocialCarouselAnalyticsModule (ref), useTilesSeenCollectionModule (ref), useDispatch (ref), useNavigation (ref), reactModule (ref), fFlagCreateConnectionsHub (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), carouselModule (ref)
	local var2 = useSocialCarouselAnalyticsModule()
	local var3 = useTilesSeenCollectionModule()
	local var4 = useDispatch()
	local var5 = useNavigation()
	local var6 = reactModule.useRef({ startIndex = 1, endIndex = 1 })
	
	return reactModule.createElement(carouselModule, {
		onActivateHeader = reactModule.useCallback(function()
			-- upvalues: var2 (ref), fFlagCreateConnectionsHub (copy), var5 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var4 (ref), navigateDown (copy)
			var2.friendsHeaderPressed()
			
			if fFlagCreateConnectionsHub then
				var5.navigate(appPage.CoHubMyConnections)
				
				return
			elseif fFlagSignalsNavP3Dispatch then
				var1.down(var1.fromLegacyPage({ name = appPage.ViewFriends }))
				
				return
			end
			var4(navigateDown({ name = appPage.ViewFriends }))
		end, { var4, var5 }),
		onTileContentChanged = reactModule.useCallback(function(p2, p3, p4)
			-- upvalues: var6 (ref), var3 (ref)
			local current = var6.current
			
			if current.startIndex <= p3 and p3 <= current.endIndex then
				var3.addTileToCollection(p2, p3, p4)
			end
		end, { var3 }),
		appCompositionEnabled = p1.appCompositionEnabled
	})
end