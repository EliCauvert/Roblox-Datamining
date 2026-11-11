local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local RoactAnalytics = require(Parent.RoactServiceTags).RoactAnalytics
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseThrottledCallbackFunction = require(Parent.RoactUtils).Hooks.useThrottledCallback
local _ = require(SocialCarousel.Common.Enums)
local SocialCarouselContextModule = require(SocialCarousel.Contexts.SocialCarouselContext)
local UseSocialCarouselListModule = require(SocialCarousel.Hooks.useSocialCarouselList)
local UseSocialCarouselUnifiedLoggingModule = require(SocialCarousel.Analytics.useSocialCarouselUnifiedLogging)
local UseSocialCarouselAnalyticsModule = require(SocialCarousel.Analytics.useSocialCarouselAnalytics)
local UseSocialCarouselLoadTimerModule = require(SocialCarousel.Analytics.useSocialCarouselLoadTimer)
local _ = require(SocialCarousel.Analytics.AnalyticsTypes)
local FriendCarouselRefreshThrottleInterval = game:DefineFastInt("FriendCarouselRefreshThrottleInterval", 3)
local FFlagLuaAppAddSortDataToSocialCarouselClicks = require(Parent.SharedFlags).FFlagLuaAppAddSortDataToSocialCarouselClicks
local FFlagSocialCarouselShareQREnabled = require(Parent.SharedFlags).FFlagSocialCarouselShareQREnabled
local FFlagEnableDesktopGameJoinCard = require(Parent.SharedFlags).FFlagEnableDesktopGameJoinCard
local CarouselModule = require(SocialCarousel.Components.Carousel)

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactAnalytics (copy), AppEventIngestService (copy), UseSocialCarouselAnalyticsModule (copy), UseSocialCarouselLoadTimerModule (copy), ReactModule (copy), UseSocialCarouselListModule (copy), FFlagEnableDesktopGameJoinCard (copy), UseSocialCarouselUnifiedLoggingModule (copy), UseThrottledCallbackFunction (copy), FriendCarouselRefreshThrottleInterval (copy), SocialCarouselContextModule (copy), FFlagLuaAppAddSortDataToSocialCarouselClicks (copy), FFlagSocialCarouselShareQREnabled (copy), CarouselModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppEventIngestService)
	local UseSocialCarouselLoadTimerModuleResult = UseSocialCarouselLoadTimerModule(UseSocialCarouselAnalyticsModule().reportLoadingEvent)
	local UseRefResult = ReactModule.useRef(os.clock())
	local UseSocialCarouselListModuleResult = UseSocialCarouselListModule(p1.roduxKey, p1.customTileList)
	local v1 = nil
	local v2 = nil
	
	if FFlagEnableDesktopGameJoinCard then
		v1, v23 = ReactModule.useState(nil)
	end
	local UseSocialCarouselUnifiedLoggingModuleResult = UseSocialCarouselUnifiedLoggingModule(UseRoactServiceResult, UseRoactServiceResult1, p1.unifiedLogging, UseSocialCarouselListModuleResult, UseRefResult)
	local UseThrottledCallbackResult = UseThrottledCallbackFunction(function()
		-- upvalues: UseSocialCarouselListModuleResult (copy)
		UseSocialCarouselListModuleResult.refreshFriendsList()
	end, FriendCarouselRefreshThrottleInterval)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseThrottledCallbackResult (copy)
		if p1.refreshSignal then
			p1.refreshSignal:connect(UseThrottledCallbackResult)
			
			return
		end
	end, { p1.refreshSignal })
	
	return ReactModule.createElement(SocialCarouselContextModule.Provider, {
		value = {
			eventIngest = UseRoactServiceResult1,
			appAnalytics = UseRoactServiceResult,
			hideCarouselHeader = p1.hideCarouselHeader,
			openGameJoinCardUserId = if FFlagEnableDesktopGameJoinCard then v1 else nil,
			setOpenGameJoinCardUserId = if FFlagEnableDesktopGameJoinCard then v2 else nil,
			unifiedLogging = UseSocialCarouselUnifiedLoggingModuleResult,
			sortAnalyticsData = if FFlagLuaAppAddSortDataToSocialCarouselClicks then p1.sortAnalyticsData else nil,
			friendRequestCount = UseSocialCarouselListModuleResult.friendRequestCount,
			recommendationCount = UseSocialCarouselListModuleResult.recommendationCount,
			friendCount = UseSocialCarouselListModuleResult.friendCount,
			tiles = UseSocialCarouselListModuleResult.tiles,
			isLoading = UseSocialCarouselListModuleResult.isLoading,
			onSuccessfulRender = UseSocialCarouselLoadTimerModuleResult.onSuccessfulRender,
			selectionOrderBase = p1.selectionOrderBase,
			source = p1.source,
			navigateToQRCodePage = if FFlagSocialCarouselShareQREnabled then p1.navigateToQRCodePage else nil
		}
	}, {
		Carousel = ReactModule.createElement(CarouselModule, { appCompositionEnabled = p1.appCompositionEnabled })
	})
end