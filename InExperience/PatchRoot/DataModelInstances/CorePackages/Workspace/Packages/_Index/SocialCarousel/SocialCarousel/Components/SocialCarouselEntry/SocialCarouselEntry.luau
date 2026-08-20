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

return function(p0) --[[ line: 56 ]]
	-- upvalues: useRoactService (ref), roactAnalytics (ref), appEventIngestService (ref), useSocialCarouselAnalyticsModule (ref), useSocialCarouselLoadTimerModule (ref), reactModule (ref), useSocialCarouselListModule (ref), fFlagEnableDesktopGameJoinCard (ref), useSocialCarouselUnifiedLoggingModule (ref), useThrottledCallback (ref), friendCarouselRefreshThrottleInterval (ref), socialCarouselContextModule (ref), fFlagLuaAppAddSortDataToSocialCarouselClicks (ref), fFlagLuaAppUserSeenCollectionUnifiedFields (ref), fFlagSocialCarouselShareQREnabled (ref), carouselModule (ref)
	local var10 = useRoactService(roactAnalytics)
	local var11 = useRoactService(appEventIngestService)
	local var12 = useSocialCarouselLoadTimerModule(useSocialCarouselAnalyticsModule().reportLoadingEvent)
	local var13 = reactModule.useRef(os.clock())
	local var14 = useSocialCarouselListModule(p0.roduxKey, p0.customTileList)
	local var15 = nil
	local var16 = nil
	
	if fFlagEnableDesktopGameJoinCard then
		local var17, var18 = reactModule.useState(nil)
		var15 = var17
		var16 = var18
	end
	local var19 = useSocialCarouselUnifiedLoggingModule(var10, var11, p0.unifiedLogging, var14, var13)
	local var20 = useThrottledCallback(function() --[[ line: 75 ]]
		-- upvalues: var14 (ref)
		var14.refreshFriendsList()
	end, friendCarouselRefreshThrottleInterval)
	reactModule.useEffect(function() --[[ line: 79 ]]
		-- upvalues: p0 (ref), var20 (ref)
		if p0.refreshSignal then
			p0.refreshSignal:connect(var20)
			
			return
		end
	end, { p0.refreshSignal })
	
	return reactModule.createElement(socialCarouselContextModule.Provider, {
		value = {
			eventIngest = var11,
			appAnalytics = var10,
			hideCarouselHeader = p0.hideCarouselHeader,
			openGameJoinCardUserId = if fFlagEnableDesktopGameJoinCard then var15 else nil,
			setOpenGameJoinCardUserId = if fFlagEnableDesktopGameJoinCard then var16 else nil,
			unifiedLogging = var19,
			sortAnalyticsData = if fFlagLuaAppAddSortDataToSocialCarouselClicks or fFlagLuaAppUserSeenCollectionUnifiedFields then p0.sortAnalyticsData else nil,
			friendRequestCount = var14.friendRequestCount,
			recommendationCount = var14.recommendationCount,
			friendCount = var14.friendCount,
			tiles = var14.tiles,
			isLoading = var14.isLoading,
			onSuccessfulRender = var12.onSuccessfulRender,
			selectionOrderBase = p0.selectionOrderBase,
			source = p0.source,
			navigateToQRCodePage = if fFlagSocialCarouselShareQREnabled then p0.navigateToQRCodePage else nil
		}
	}, {
		Carousel = reactModule.createElement(carouselModule, { appCompositionEnabled = p0.appCompositionEnabled })
	})
end