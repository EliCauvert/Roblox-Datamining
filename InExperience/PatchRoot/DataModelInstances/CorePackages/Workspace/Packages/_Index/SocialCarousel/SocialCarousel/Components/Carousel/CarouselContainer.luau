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
local var8 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0)
	-- upvalues: useSocialCarouselAnalyticsModule (ref), useTilesSeenCollectionModule (ref), useDispatch (ref), useNavigation (ref), reactModule (ref), fFlagCreateConnectionsHub (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var8 (ref), navigateDown (ref), carouselModule (ref)
	local var9 = useSocialCarouselAnalyticsModule()
	local var10 = useTilesSeenCollectionModule()
	local var11 = useDispatch()
	local var12 = useNavigation()
	local var13 = reactModule.useRef({ startIndex = 1, endIndex = 1 })
	
	return reactModule.createElement(carouselModule, {
		onActivateHeader = reactModule.useCallback(function()
			-- upvalues: var9 (ref), fFlagCreateConnectionsHub (copy), var12 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var8 (copy), var11 (ref), navigateDown (copy)
			var9.friendsHeaderPressed()
			
			if fFlagCreateConnectionsHub then
				var12.navigate(appPage.CoHubMyConnections)
				
				return
			elseif fFlagSignalsNavP3Dispatch then
				var8.down(var8.fromLegacyPage({ name = appPage.ViewFriends }))
				
				return
			end
			var11(navigateDown({ name = appPage.ViewFriends }))
		end, { var11, var12 }),
		onTileContentChanged = reactModule.useCallback(function(p1, p2, p3)
			-- upvalues: var13 (ref), var10 (ref)
			local current = var13.current
			
			if current.startIndex <= p2 and p2 <= current.endIndex then
				var10.addTileToCollection(p1, p2, p3)
			end
		end, { var10 }),
		appCompositionEnabled = p0.appCompositionEnabled
	})
end