local AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local Home = script:FindFirstAncestor("Home")
local Parent = Home.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseSponsoredAdViewabilityDetectorFunction = require(Parent.SponsoredAdViewability).useSponsoredAdViewabilityDetector
local _ = require(Parent.Navigation)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local ResponsiveModule = require(Parent.Responsive)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiPageWrapperEntryPoint = SduiSharedUtilitiesModule.SduiPageWrapperEntryPoint
local UsePageScopeRefFunction = SduiSharedUtilitiesModule.usePageScopeRef
local UseEntrySurfacingFunction = SduiSharedUtilitiesModule.useEntrySurfacing
local VideoUtilsModule = require(Parent.VideoUtils)
local RefreshHomePageModule = require(Home.refreshHomePage)
local FetchHomePageModule = require(Home.fetchHomePage)
local UseHomeCollectionLayoutSyncModule = require(Home.useHomeCollectionLayoutSync)
local HomeConstantsModule = require(Home.HomeConstants)
local HomePageSessionModule = require(Home.HomePageSession)
local FFlagLuaAppAddHomeExtraTopPadding = require(Parent.SharedFlags).FFlagLuaAppAddHomeExtraTopPadding
local FFlagLuaAppSduiVideoThumbnail = require(Parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail
local FFlagLuaAppOneByTwoHoverIdleAutoplay = require(Parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local FFlagSduiDismissPromptPageScope = require(Parent.SharedFlags).FFlagSduiDismissPromptPageScope
local FFlagAppPageShellScrollToTopFocus = require(Parent.SharedFlags).FFlagAppPageShellScrollToTopFocus
local FFlagLuaAppsDefaultSelection = require(Parent.SharedFlags).FFlagLuaAppsDefaultSelection
local FFlagHomePageRefetchOnDataHydrationAccountReset = require(Parent.SharedFlags).FFlagHomePageRefetchOnDataHydrationAccountReset
local FFlagLuaAppSduiHomeSponsoredAdViewabilityModule = require(Home.Flags.FFlagLuaAppSduiHomeSponsoredAdViewability)
local FFlagAppThemeHalloween2026HomeBackground = require(Parent.SharedFlags).FFlagAppThemeHalloween2026HomeBackground

local function _(p1, p2) --[[ Line: 50 | Named "getFromPropsOrNavigationParams" ]]
	return p1[p2] or p1.navigation and p1.navigation.getParam(p2)
end

local function getCommittedHomeSessionId(p1) --[[ Line: 55 ]]
	-- upvalues: HomePageSessionModule (copy)
	local v1 = HomePageSessionModule:GetCommittedSignal()(p1)
	
	return if v1 then v1.sessionId else nil
end

return ReactModule.memo(function(p1) --[[ Line: 60 | Named "HomeContentEntryPoint" ]]
	-- upvalues: HomeConstantsModule (copy), FFlagLuaAppAddHomeExtraTopPadding (copy), UseEntrySurfacingFunction (copy), FFlagSduiDismissPromptPageScope (copy), UsePageScopeRefFunction (copy), ReactModule (copy), SduiSharedUtilitiesModule (copy), AppPage (copy), FFlagHomePageRefetchOnDataHydrationAccountReset (copy), FetchHomePageModule (copy), Home (copy), UseHomeCollectionLayoutSyncModule (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), ResponsiveModule (copy), VideoUtilsModule (copy), FFlagLuaAppSduiVideoThumbnail (copy), FFlagLuaAppSduiHomeSponsoredAdViewabilityModule (copy), SignalsReactModule (copy), getCommittedHomeSessionId (copy), UseSponsoredAdViewabilityDetectorFunction (copy), AppLifecycleObserverService (copy), SduiPageWrapperEntryPoint (copy), RefreshHomePageModule (copy), FFlagAppPageShellScrollToTopFocus (copy), FFlagLuaAppsDefaultSelection (copy), FFlagAppThemeHalloween2026HomeBackground (copy)
	local ConfigKey = HomeConstantsModule.ConfigKey
	local v1 = nil
	
	if FFlagLuaAppAddHomeExtraTopPadding then
		local FullPage = UseEntrySurfacingFunction(ConfigKey, HomeConstantsModule.ContentIdentifier, "fullPage")
		v1 = (p1.feedTopMargin or 0) + (FullPage and FullPage.contentTopPadding or 0)
	end
	if FFlagSduiDismissPromptPageScope then
		UsePageScopeRefFunction(ConfigKey)
	end
	local PageTimer = p1.pageTimer or p1.navigation and p1.navigation.getParam("pageTimer")
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 74 ]]
		-- upvalues: PageTimer (copy), SduiSharedUtilitiesModule (upval), AppPage (upval)
		return PageTimer or SduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(AppPage.Home)
	end, { ConfigKey, PageTimer })
	local UseDataHydrationAccountGenerationResult = if FFlagHomePageRefetchOnDataHydrationAccountReset then SduiSharedUtilitiesModule.useDataHydrationAccountGeneration() else nil
	ReactModule.useEffect(function() --[[ Line: 84 ]]
		-- upvalues: FetchHomePageModule (upval), UseMemoResult (copy)
		FetchHomePageModule(UseMemoResult)
	end, {
		ConfigKey,
		UseMemoResult,
		if FFlagHomePageRefetchOnDataHydrationAccountReset then UseDataHydrationAccountGenerationResult else nil
	})
	ReactModule.useEffect(function() --[[ Line: 94 ]]
		-- upvalues: Home (upval)
		return require(Home.getHomePageAutoRefreshStore)(false).start()
	end, {})
	UseHomeCollectionLayoutSyncModule()
	local UseFeedVideoPlaybackContextResult = nil
	
	if FFlagLuaAppOneByTwoHoverIdleAutoplay then
		local UsePreferredInputResult = ResponsiveModule.usePreferredInput()
		UseFeedVideoPlaybackContextResult = VideoUtilsModule.useFeedVideoPlaybackContext(nil, nil, nil, nil, (VideoUtilsModule.getPlaybackDetectionMethod(UsePreferredInputResult, UsePreferredInputResult == ResponsiveModule.Input.Pointer)))
	elseif FFlagLuaAppSduiVideoThumbnail then
		local IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Touch
		UseFeedVideoPlaybackContextResult = ReactModule.useMemo(function() --[[ Line: 112 ]]
			-- upvalues: VideoUtilsModule (upval), IsUsePreferredInputResultMatch (copy)
			return VideoUtilsModule.FeedVideoPlaybackContext.new(IsUsePreferredInputResultMatch)
		end, { IsUsePreferredInputResultMatch })
	end
	local v2 = nil
	
	if FFlagLuaAppSduiHomeSponsoredAdViewabilityModule then
		local UseStateResult
		UseStateResult, v36 = ReactModule.useState(nil)
		UseSponsoredAdViewabilityDetectorFunction(UseStateResult, SignalsReactModule.useSignalState(getCommittedHomeSessionId), AppLifecycleObserverService)
	end
	return ReactModule.createElement(SduiPageWrapperEntryPoint, {
		ref = if FFlagLuaAppSduiHomeSponsoredAdViewabilityModule then v2 else nil,
		appPage = AppPage.Home,
		configKey = ConfigKey,
		contentIdentifier = HomeConstantsModule.ContentIdentifier,
		pageTimer = UseMemoResult,
		refresh = RefreshHomePageModule,
		pageTopPadding = p1.pageTopPadding,
		feedTopMargin = if FFlagLuaAppAddHomeExtraTopPadding then v1 else p1.feedTopMargin,
		stickyTopPadding = p1.feedTopMargin,
		scrollAway = p1.scrollAway,
		videoPlaybackContext = if FFlagLuaAppSduiVideoThumbnail or FFlagLuaAppOneByTwoHoverIdleAutoplay then UseFeedVideoPlaybackContextResult else nil,
		handleBackButton = not FFlagAppPageShellScrollToTopFocus and nil,
		defaultFocusRef = if FFlagAppPageShellScrollToTopFocus and FFlagLuaAppsDefaultSelection then p1.defaultFocusRef else nil,
		backgroundStyle = if FFlagAppThemeHalloween2026HomeBackground then p1.backgroundStyle else nil,
		stickyBackgroundStyle = if FFlagAppThemeHalloween2026HomeBackground then p1.stickyBackgroundStyle else nil
	})
end)