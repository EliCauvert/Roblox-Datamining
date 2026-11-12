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
local FFlagSocialCarouselShareQREnabled = require(Parent.SharedFlags).FFlagSocialCarouselShareQREnabled
local FFlagMobileGameJoinCardVideo = require(Parent.SharedFlags).FFlagMobileGameJoinCardVideo
local FFlagSocialCarouselBuildPresence = require(Parent.SharedFlags).FFlagSocialCarouselBuildPresence
local FFlagSocialCarouselInGameTitleMarquee = require(Parent.SharedFlags).FFlagSocialCarouselInGameTitleMarquee
local CarouselModule = require(SocialCarousel.Components.Carousel)

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactAnalytics (copy), AppEventIngestService (copy), UseSocialCarouselAnalyticsModule (copy), UseSocialCarouselLoadTimerModule (copy), ReactModule (copy), UseSocialCarouselListModule (copy), FFlagSocialCarouselBuildPresence (copy), FFlagSocialCarouselInGameTitleMarquee (copy), UseSocialCarouselUnifiedLoggingModule (copy), UseThrottledCallbackFunction (copy), FriendCarouselRefreshThrottleInterval (copy), SocialCarouselContextModule (copy), FFlagSocialCarouselShareQREnabled (copy), FFlagMobileGameJoinCardVideo (copy), CarouselModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppEventIngestService)
	local UseSocialCarouselLoadTimerModuleResult = UseSocialCarouselLoadTimerModule(UseSocialCarouselAnalyticsModule().reportLoadingEvent)
	local UseRefResult = ReactModule.useRef(os.clock())
	local UseSocialCarouselListModuleResult = UseSocialCarouselListModule(p1.roduxKey, p1.customTileList)
	local UseStateResult2 = nil
	local UseStateResult
	UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local v1 = nil
	local v2 = nil
	
	if FFlagSocialCarouselBuildPresence then
		v1, v27 = ReactModule.useState(nil)
	end
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = if FFlagSocialCarouselInGameTitleMarquee then ReactModule.useRef(nil) else nil
	local UseResult = ReactModule.useCallback(function(Callback)
		-- upvalues: UseRefResult1 (copy), UseStateResult2 (ref)
		local CallbackResult = if typeof(Callback) == "function" then Callback(UseRefResult1.current) else Callback
		UseRefResult1.current = CallbackResult
		UseStateResult2(CallbackResult)
	end, { UseStateResult2 })
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
			openGameJoinCardUserId = UseStateResult,
			joinPopoverUserIdRef = if FFlagSocialCarouselInGameTitleMarquee then UseRefResult1 else nil,
			joinSheetUserIdRef = if FFlagSocialCarouselInGameTitleMarquee then UseRefResult2 else nil,
			setOpenGameJoinCardUserId = if FFlagSocialCarouselInGameTitleMarquee then UseResult else UseStateResult2,
			openBuildCardUserId = if FFlagSocialCarouselBuildPresence then v1 else nil,
			setOpenBuildCardUserId = if FFlagSocialCarouselBuildPresence then v2 else nil,
			unifiedLogging = UseSocialCarouselUnifiedLoggingModuleResult,
			sortAnalyticsData = p1.sortAnalyticsData,
			friendRequestCount = UseSocialCarouselListModuleResult.friendRequestCount,
			recommendationCount = UseSocialCarouselListModuleResult.recommendationCount,
			friendCount = UseSocialCarouselListModuleResult.friendCount,
			tiles = UseSocialCarouselListModuleResult.tiles,
			isLoading = UseSocialCarouselListModuleResult.isLoading,
			onSuccessfulRender = UseSocialCarouselLoadTimerModuleResult.onSuccessfulRender,
			selectionOrderBase = p1.selectionOrderBase,
			source = p1.source,
			navigateToQRCodePage = if FFlagSocialCarouselShareQREnabled then p1.navigateToQRCodePage else nil,
			isJoinCardVideoEnabled = if FFlagMobileGameJoinCardVideo then p1.isJoinCardVideoEnabled else nil,
			videoPlaybackContext = if FFlagMobileGameJoinCardVideo then p1.videoPlaybackContext else nil
		}
	}, {
		Carousel = ReactModule.createElement(CarouselModule, { appCompositionEnabled = p1.appCompositionEnabled })
	})
end