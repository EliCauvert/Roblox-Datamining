local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local roactAnalytics = require(parent.RoactServiceTags).RoactAnalytics
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useThrottledCallback = roactUtilsModule.Hooks.useThrottledCallback
local _ = require(socialCarousel.Common.Enums)
local socialCarouselContextModule = require(socialCarousel.Contexts.SocialCarouselContext)
local useSocialCarouselListModule = require(socialCarousel.Hooks.useSocialCarouselList)
local useSocialCarouselUnifiedLoggingModule = require(socialCarousel.Analytics.useSocialCarouselUnifiedLogging)
local useSocialCarouselAnalyticsModule = require(socialCarousel.Analytics.useSocialCarouselAnalytics)
local useSocialCarouselLoadTimerModule = require(socialCarousel.Analytics.useSocialCarouselLoadTimer)
local _ = require(socialCarousel.Analytics.AnalyticsTypes)
local friendCarouselRefreshThrottleInterval = game:DefineFastInt("FriendCarouselRefreshThrottleInterval", 3)
local fFlagLuaAppAddSortDataToSocialCarouselClicks = require(parent.SharedFlags).FFlagLuaAppAddSortDataToSocialCarouselClicks
local fFlagLuaAppUserSeenCollectionUnifiedFields = require(parent.SharedFlags).FFlagLuaAppUserSeenCollectionUnifiedFields
local fFlagSocialCarouselShareQREnabled = require(parent.SharedFlags).FFlagSocialCarouselShareQREnabled
local fFlagEnableDesktopGameJoinCard = require(parent.SharedFlags).FFlagEnableDesktopGameJoinCard
local carouselModule = require(socialCarousel.Components.Carousel)

return function(p1)
	-- upvalues: useRoactService (ref), roactAnalytics (ref), appEventIngestService (ref), useSocialCarouselAnalyticsModule (ref), useSocialCarouselLoadTimerModule (ref), reactModule (ref), useSocialCarouselListModule (ref), fFlagEnableDesktopGameJoinCard (ref), useSocialCarouselUnifiedLoggingModule (ref), useThrottledCallback (ref), friendCarouselRefreshThrottleInterval (ref), socialCarouselContextModule (ref), fFlagLuaAppAddSortDataToSocialCarouselClicks (ref), fFlagLuaAppUserSeenCollectionUnifiedFields (ref), fFlagSocialCarouselShareQREnabled (ref), carouselModule (ref)
	local var1 = useRoactService(roactAnalytics)
	local var2 = useRoactService(appEventIngestService)
	local var3 = useSocialCarouselLoadTimerModule(useSocialCarouselAnalyticsModule().reportLoadingEvent)
	local var4 = reactModule.useRef(os.clock())
	local var5 = useSocialCarouselListModule(p1.roduxKey, p1.customTileList)
	local var6 = nil
	local var7 = nil
	
	if fFlagEnableDesktopGameJoinCard then
		local var8, var9 = reactModule.useState(nil)
		var6 = var8
		var7 = var9
	end
	local var10 = useSocialCarouselUnifiedLoggingModule(var1, var2, p1.unifiedLogging, var5, var4)
	local var11 = useThrottledCallback(function()
		-- upvalues: var5 (ref)
		var5.refreshFriendsList()
	end, friendCarouselRefreshThrottleInterval)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var11 (ref)
		if p1.refreshSignal then
			p1.refreshSignal:connect(var11)
			
			return
		end
	end, { p1.refreshSignal })
	
	return reactModule.createElement(socialCarouselContextModule.Provider, {
		value = {
			eventIngest = var2,
			appAnalytics = var1,
			hideCarouselHeader = p1.hideCarouselHeader,
			openGameJoinCardUserId = if fFlagEnableDesktopGameJoinCard then var6 else nil,
			setOpenGameJoinCardUserId = if fFlagEnableDesktopGameJoinCard then var7 else nil,
			unifiedLogging = var10,
			sortAnalyticsData = if fFlagLuaAppAddSortDataToSocialCarouselClicks or fFlagLuaAppUserSeenCollectionUnifiedFields then p1.sortAnalyticsData else nil,
			friendRequestCount = var5.friendRequestCount,
			recommendationCount = var5.recommendationCount,
			friendCount = var5.friendCount,
			tiles = var5.tiles,
			isLoading = var5.isLoading,
			onSuccessfulRender = var3.onSuccessfulRender,
			selectionOrderBase = p1.selectionOrderBase,
			source = p1.source,
			navigateToQRCodePage = if fFlagSocialCarouselShareQREnabled then p1.navigateToQRCodePage else nil
		}
	}, {
		Carousel = reactModule.createElement(carouselModule, { appCompositionEnabled = p1.appCompositionEnabled })
	})
end