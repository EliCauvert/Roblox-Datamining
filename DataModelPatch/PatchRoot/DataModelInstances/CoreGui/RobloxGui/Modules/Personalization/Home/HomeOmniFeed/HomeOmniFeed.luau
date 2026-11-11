local Players = game:GetService("Players")
local CorePackages = game:GetService("CorePackages")
local ScriptContext = game:GetService("ScriptContext")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local RetrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local GameSortGroups = DiscoveryTypesModule.GameSortGroups
local OmniFeedTypes = DiscoveryTypesModule.OmniFeedTypes
local OmniFeedConstants = DiscoveryTypesModule.OmniFeedConstants
local UseSponsoredAdViewabilityDetectorFunction = require(CorePackages.Workspace.Packages.SponsoredAdViewability).useSponsoredAdViewabilityDetector
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactAnalytics = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactAnalytics
local AppStartupSequenceTag = require(CorePackages.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local AppLogging = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLogging
local AppPrefetch = require(CorePackages.Workspace.Packages.RoactServiceTags).AppPrefetch
local AppAppLifecycleObserverService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppAppLifecycleObserverService
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local PromiseModule = require(CorePackages.Packages.Promise)
local SetNetworkingErrorToastFunction = require(CorePackages.Workspace.Packages.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local RetrievalStatus1 = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local FeedScrollFunction = require(CorePackages.Workspace.Packages.ScrollTelemetry).feedScroll
local FetchStatusRoduxModule = require(CorePackages.Workspace.Packages.FetchStatusRodux)
local FetchStatusNamespace = FetchStatusRoduxModule.FetchStatusNamespace
local FetchStatusReducer = FetchStatusRoduxModule.FetchStatusReducer
local VerticalEfficiencyExperimentation = require(CorePackages.Workspace.Packages.DiscoveryUtils).VerticalEfficiencyExperimentation
local DiscoveryAppLaunchTracker = require(CorePackages.Workspace.Packages.AppLaunchTracker).DiscoveryAppLaunchTracker
local MemStorageService = game:GetService("MemStorageService")
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local SocialUpsellModule = require(CorePackages.Workspace.Packages.SocialUpsell)
local Default = require(CorePackages.Workspace.Packages.AppStartup).AppStartupSequence.default
local ServerDrivenUiModule = require(CorePackages.Workspace.Packages.ServerDrivenUi)
local UseCollectionLayoutConfigFunction = require(CorePackages.Workspace.Packages.CollectionViews).useCollectionLayoutConfig
local FeedVideoPlaybackContext = require(CorePackages.Workspace.Packages.VideoUtils).FeedVideoPlaybackContext
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local ApiFetchOmniRecommendationsFunction = Modules.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations
local OmniFeedAutoRefresher = Modules.LuaApp.Components.Games.OmniFeedAutoRefresher
local RefreshGameSortsFunction = Modules.LuaApp.Thunks.RefreshGameSorts
local FetchHomePageDataFunction = Modules.LuaApp.Thunks.FetchHomePageData
local FetchHomePageContactMethodModuleVariationFunction = Modules.LuaApp.Thunks.FetchHomePageContactMethodModuleVariation
local Modules1 = game:GetService("CoreGui").RobloxGui.Modules
local RefreshSiteAlertInfoModule = require(Modules1.LuaApp.Actions.RefreshSiteAlertInfo)
local AddLocalOmniItemsModule = require(Modules1.Personalization.OmniFeed.DataStore.AddLocalOmniItems)
local PageSessionManagerModule = require(Modules1.Personalization.Sessions.PageSessionManager)
local SetHomePageSessionInfoModule = require(Modules1.Personalization.Sessions.setHomePageSessionInfo)
local OmniFeedViewLoadMoreModule = require(Modules1.Personalization.OmniFeed.FeedViews.OmniFeedViewLoadMore)
local ScrollingPerfTrackerModule = require(Modules1.Personalization.Analytics.ScrollingPerfTracker)
local UseBannerContainerModule = require(Modules1.LuaApp.Components.Banner.useBannerContainer)
local HomeOmniFeedExperimentationModule = require(Modules1.Personalization.Home.HomeOmniFeed.HomeOmniFeedExperimentation)
local OptionalContactMethodUpsellTypesModule = require(Modules1.LuaApp.Enum.OptionalContactMethodUpsellTypes)
local GetFFlagEnableHomePageEmailUpsellCardModule = require(Modules1.LuaApp.Flags.GetFFlagEnableHomePageEmailUpsellCard)
local GetFFlagEnableVoiceTrialUpsellCardModule = require(Modules1.LuaApp.Flags.GetFFlagEnableVoiceTrialUpsellCard)
local ServerTriggeredModalsModule = require(CorePackages.Workspace.Packages.ServerTriggeredModals)
local PromptsEntryPoint = ServerTriggeredModalsModule.PromptsEntryPoint
local PromptStyle = ServerTriggeredModalsModule.PromptStyle
local LuaAppHomeFeedProfilePosition = game:DefineFastInt("LuaAppHomeFeedProfilePosition", 1)
local LuaAppHomeFeedFriendsPosition = game:DefineFastInt("LuaAppHomeFeedFriendsPosition", 1)
local LuaAppHomeFeedUpsellCardPosition = game:DefineFastInt("LuaAppHomeFeedUpsellCardPosition", 1)
local TriggerLuaAppInteractiveFromLua = game:DefineFastFlag("TriggerLuaAppInteractiveFromLua", false)
local LeaveExperienceLatencyTrackingEnabled = game:DefineFastFlag("LeaveExperienceLatencyTrackingEnabled", false)
local TriggerReportLuaRequireCountFromLuaEngineFeature = game:GetEngineFeature("TriggerReportLuaRequireCountFromLua")
local GetFFlagFixFetchNextOmniWithoutPageTokenFunction = Modules.LuaApp.Flags.GetFFlagFixFetchNextOmniWithoutPageToken
local GetFFlagEnableHomePageUpsellCardFunction = Modules.LuaApp.Flags.GetFFlagEnableHomePageUpsellCard
local FFlagLuaAppMoveProfileIntoTopBar = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBar
local FFlagLuaAppMoveProfileIntoTopBarIXP = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBarIXP
local FFlagLuaAppEnableRelativeGuiHomeForAll = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnableRelativeGuiHomeForAll
local FFlagLuaAppEnableRelativeGuiHomeWithIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnableRelativeGuiHomeWithIxp
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagLuaAppLayoutParamsInContext = SharedFlagsModule.FFlagLuaAppLayoutParamsInContext
local FFlagLuaAppCompositionHome = SharedFlagsModule.FFlagLuaAppCompositionHome
local FFlagLuaAppRfySignalApportioning = SharedFlagsModule.FFlagLuaAppRfySignalApportioning
local FFlagEnableAppStoreAgeSignalsOnHomePage = SharedFlagsModule.FFlagEnableAppStoreAgeSignalsOnHomePage
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = SharedFlagsModule.FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppHomeTouchAutoplay = SharedFlagsModule.FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppSponsoredAdViewabilityEnabled = SharedFlagsModule.FFlagLuaAppSponsoredAdViewabilityEnabled
local FFlagHomePagePromptsHandlerEnabled = SharedFlagsModule.FFlagHomePagePromptsHandlerEnabled
local FFlagDisableHomePageUpsellCardFeedItem = SharedFlagsModule.FFlagDisableHomePageUpsellCardFeedItem
local FFlagLuaAppScrollTelemetryIntegration = SharedFlagsModule.FFlagLuaAppScrollTelemetryIntegration
local FFlagEnableIAFlyoutIXPHomeProfileRemovalModule = require(Modules1.Personalization.Flags.FFlagEnableIAFlyoutIXPHomeProfileRemoval)
local FlyoutSidePanelIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP
local RemoveMobileHomeProfileHeader = game:DefineFastFlag("RemoveMobileHomeProfileHeader", false)
local AppIaHomeOmniFeedFix = game:DefineFastFlag("AppIaHomeOmniFeedFix", false)
local FFlagLuaAppsDefaultSelection = SharedFlagsModule.FFlagLuaAppsDefaultSelection
local Home = AppPage.Home
local T = if AppIaHomeOmniFeedFix then {} else nil
local HomeOmniFeed = RoactModule.PureComponent:extend("HomeOmniFeed")
HomeOmniFeed.validateProps = TModule.strictInterface({
	canvasTopPadding = if FFlagAppIaScrollAway then TModule.optional(TModule.number) else nil,
	hasNextPage = TModule.optional(TModule.boolean),
	homeOmniFetchStatus = if GetFFlagFixFetchNextOmniWithoutPageTokenFunction() then TModule.optional(TModule.string) else nil,
	localUserId = TModule.string,
	homePageDataStatus = TModule.string,
	omniFeedItems = if AppIaHomeOmniFeedFix then TModule.table else TModule.optional(TModule.table),
	hasLocalOmniItems = TModule.optional(TModule.boolean),
	recommendationsRequestId = TModule.optional(TModule.string),
	omniSessionId = TModule.optional(TModule.string),
	omniItemsGlobalLayoutData = TModule.optional(TModule.table),
	screenSize = TModule.Vector2,
	formFactor = if FFlagLuaAppMoveProfileIntoTopBar then TModule.string else nil,
	upsellCardVariation = TModule.optional(TModule.table),
	defaultFocusRef = if FFlagLuaAppsDefaultSelection then TModule.optional(TModule.callback) else nil,
	addLocalFeedItems = TModule.callback,
	refresh = TModule.callback,
	loadNext = TModule.optional(TModule.callback),
	fetchHomePageData = TModule.callback,
	fetchHomePageContactMethodModuleVariation = TModule.optional(TModule.callback),
	isOmni = TModule.optional(TModule.boolean),
	appAnalytics = TModule.any,
	networking = TModule.any,
	loggingProtocol = TModule.optional(TModule.any),
	prefetchProtocol = TModule.optional(TModule.any),
	sessionService = TModule.optional(TModule.any),
	appStartupSequence = TModule.any,
	eventIngest = TModule.any,
	appLifecycleObserverService = if TriggerLuaAppInteractiveFromLua then TModule.optional(TModule.any) else nil,
	navigation = TModule.any,
	header = TModule.optional(TModule.any),
	headerHeight = TModule.number,
	relativeGuiEnabled = if FFlagLuaAppEnableRelativeGuiHomeForAll or FFlagLuaAppEnableRelativeGuiHomeWithIxp then TModule.optional(TModule.boolean) else nil,
	shouldStopAfterOneGameSort = TModule.boolean,
	sduiContext = TModule.table,
	setScrollingFrame = if FFlagLuaAppLayoutParamsInContext then TModule.optional(TModule.callback) else nil,
	onTileImageLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then TModule.optional(TModule.callback) else nil,
	videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then TModule.optional(TModule.table) else nil,
	onScrollStart = if FFlagLuaAppHomeTouchAutoplay then TModule.optional(TModule.callback) else nil,
	onScrollSettled = if FFlagLuaAppHomeTouchAutoplay then TModule.optional(TModule.callback) else nil
})

local function _(Fetching): boolean
	-- upvalues: RetrievalStatus1 (copy)
	return Fetching ~= RetrievalStatus1.NotStarted and Fetching ~= RetrievalStatus1.Fetching
end

local function v89(UpsellCardType, UpsellCardVariation): boolean
	-- upvalues: OptionalContactMethodUpsellTypesModule (copy), GetFFlagEnableHomePageEmailUpsellCardModule (copy), GetFFlagEnableVoiceTrialUpsellCardModule (copy)
	return UpsellCardType == OptionalContactMethodUpsellTypesModule.ContactMethodPhoneNumber or (UpsellCardType == OptionalContactMethodUpsellTypesModule.ContactMethodPhoneNumberVoiceOptIn or (UpsellCardType == OptionalContactMethodUpsellTypesModule.ContactMethodPhoneNumberEmailVerticalLayout or (UpsellCardType == OptionalContactMethodUpsellTypesModule.ContactMethodPhoneNumberEmailHorizontalLayout or (GetFFlagEnableHomePageEmailUpsellCardModule() and UpsellCardType == OptionalContactMethodUpsellTypesModule.ContactMethodEmail or (GetFFlagEnableVoiceTrialUpsellCardModule() and UpsellCardType == OptionalContactMethodUpsellTypesModule.VoiceWithoutPvTrial or UpsellCardVariation and (UpsellCardVariation.upsellCardType ~= "" and UpsellCardVariation.upsellCardV2Config ~= nil))))))
end

function HomeOmniFeed.init(p1)
	-- upvalues: GetFFlagFixFetchNextOmniWithoutPageTokenFunction (copy), RetrievalStatus1 (copy), PromiseModule (copy), RoactModule (copy), FFlagLuaAppLayoutParamsInContext (copy), FeedScrollFunction (copy), Home (copy), LeaveExperienceLatencyTrackingEnabled (copy), MemStorageService (copy), DiscoveryAppLaunchTracker (copy), TriggerLuaAppInteractiveFromLua (copy), TriggerReportLuaRequireCountFromLuaEngineFeature (copy), ScriptContext (copy), SetHomePageSessionInfoModule (copy), FFlagLuaAppMoveProfileIntoTopBar (copy), FormFactor (copy), FFlagLuaAppMoveProfileIntoTopBarIXP (copy), VerticalEfficiencyExperimentation (copy), LuaAppHomeFeedProfilePosition (copy), FFlagEnableIAFlyoutIXPHomeProfileRemovalModule (copy), FlyoutSidePanelIXP (copy), RemoveMobileHomeProfileHeader (copy), OmniFeedTypes (copy), FFlagHomePagePromptsHandlerEnabled (copy), LuaAppHomeFeedUpsellCardPosition (copy), PromptsEntryPoint (copy), PromptStyle (copy), FFlagDisableHomePageUpsellCardFeedItem (copy), GetFFlagEnableHomePageUpsellCardFunction (copy), v89 (copy), OmniFeedConstants (copy), LuaAppHomeFeedFriendsPosition (copy), RoactNavigationModule (copy)
	p1.props.loggingProtocol:logEventOnce("home_page_container_init")
	p1.isMounted = false
	
	function p1.loadNext()
		-- upvalues: p1 (copy), GetFFlagFixFetchNextOmniWithoutPageTokenFunction (upval), RetrievalStatus1 (upval), PromiseModule (upval)
		local HasNextPage = p1.props.hasNextPage
		local LoadNextFunction = p1.props.loadNext
		
		if GetFFlagFixFetchNextOmniWithoutPageTokenFunction() then
			local HomeOmniFetchStatus = p1.props.homeOmniFetchStatus
			
			if HasNextPage and LoadNextFunction and HomeOmniFetchStatus ~= RetrievalStatus1.Fetching then
				return LoadNextFunction(p1.props.networking, p1.props.omniRecommendationsRequest, p1.props.loggingProtocol)
			end
		elseif HasNextPage and LoadNextFunction then
			return LoadNextFunction(p1.props.networking, p1.props.omniRecommendationsRequest, p1.props.loggingProtocol)
		end
		return PromiseModule.resolve()
	end
	
	function p1.fetchHomePageData()
		-- upvalues: p1 (copy)
		return p1.props.fetchHomePageData(p1.props.networking, p1.props.omniRecommendationsRequest, p1.props.appAnalytics, p1.props.localUserId, p1.props.isOmni, p1.props.loggingProtocol, p1.props.prefetchProtocol)
	end
	
	function p1.fetchHomePageContactMethodModuleVariation()
		-- upvalues: p1 (copy)
		return p1.props.fetchHomePageContactMethodModuleVariation(p1.props.networking)
	end
	
	p1.scrollingFrameRef = RoactModule.createRef()
	
	if FFlagLuaAppLayoutParamsInContext then
		function p1.setScrollingFrameRef(Current)
			-- upvalues: p1 (copy)
			p1.scrollingFrameRef.current = Current
			
			if p1.props.setScrollingFrame then
				p1.props.setScrollingFrame(Current)
			end
		end
	end
	function p1.sendScrollEvent(Distance, ScrollDuration, StartPos)
		-- upvalues: p1 (copy), FeedScrollFunction (upval), Home (upval)
		local Y = Enum.ScrollingDirection.Y
		
		if Y then
			local Y1 = if p1.scrollingFrameRef.current then p1.scrollingFrameRef.current.AbsoluteSize.Y else 0
			FeedScrollFunction(p1.props.eventIngest, Home, Y, {
				distance = Distance,
				screenSizeX = p1.props.screenSize.X,
				screenSizeY = p1.props.screenSize.Y,
				scrollAreaSize = Y1,
				scrollDepth = if Y1 > 0 then Distance / Y1 else nil,
				startDepth = if Y1 > 0 then StartPos / Y1 else nil,
				startPos = StartPos,
				scrollDuration = ScrollDuration
			})
		end
	end
	
	function p1.logHomePageInteractive(Frame: Frame)
		-- upvalues: p1 (copy), LeaveExperienceLatencyTrackingEnabled (upval), MemStorageService (upval), DiscoveryAppLaunchTracker (upval), TriggerLuaAppInteractiveFromLua (upval), TriggerReportLuaRequireCountFromLuaEngineFeature (upval), ScriptContext (upval)
		if not p1.isMounted then return end
		if not Frame then return end
		if p1.props.appStartupSequence.isInteractive then return end
		if Frame.AbsoluteSize.X > 1 and Frame.AbsoluteSize.Y > 1 then
			p1.props.loggingProtocol:logEventOnce("home_page_interactive_legacy")
			task.defer(function()
				-- upvalues: p1 (upval), LeaveExperienceLatencyTrackingEnabled (upval), MemStorageService (upval), DiscoveryAppLaunchTracker (upval), TriggerLuaAppInteractiveFromLua (upval), TriggerReportLuaRequireCountFromLuaEngineFeature (upval), ScriptContext (upval)
				p1.props.loggingProtocol:logEventOnce("home_page_interactive")
				
				if LeaveExperienceLatencyTrackingEnabled and MemStorageService:GetItem("pendingLeaveExperienceWithDestroyedLuaApp") == "true" then
					MemStorageService:SetItem("pendingLeaveExperienceWithDestroyedLuaApp", "")
					p1.props.loggingProtocol:logEvent("leave_experience_end")
				end
				if DiscoveryAppLaunchTracker.isEnabled() and DiscoveryAppLaunchTracker.default then
					DiscoveryAppLaunchTracker.default:stopTracking()
				end
				if TriggerLuaAppInteractiveFromLua and game:GetEngineFeature("LuaAppInteractiveSignalEnabled") then
					p1.props.appLifecycleObserverService:TriggerOnLuaAppInteractive()
				elseif TriggerReportLuaRequireCountFromLuaEngineFeature then
					ScriptContext:ReportLuaRequireCount()
				end
				task.defer(function()
					-- upvalues: p1 (upval)
					p1.props.appStartupSequence:setInteractive()
				end)
			end)
		end
	end
	
	function p1.setHomePageSessionInfoFunc()
		-- upvalues: SetHomePageSessionInfoModule (upval), p1 (copy)
		SetHomePageSessionInfoModule(p1.props.sessionService, p1.props.recommendationsRequestId, p1.props.omniSessionId)
	end
	
	function p1.insertLocalFeedItem(List, LuaAppHomeFeedUpsellCardPosition, TreatmentType, TreatmentProps, NumberOfRows)
		table.insert(List, {
			orderIndex = LuaAppHomeFeedUpsellCardPosition,
			treatmentType = TreatmentType,
			treatmentProps = TreatmentProps,
			numberOfRows = NumberOfRows
		})
	end
	
	function p1.createLocalFeedItems()
		-- upvalues: p1 (copy), RetrievalStatus1 (upval), FFlagLuaAppMoveProfileIntoTopBar (upval), FormFactor (upval), FFlagLuaAppMoveProfileIntoTopBarIXP (upval), VerticalEfficiencyExperimentation (upval), LuaAppHomeFeedProfilePosition (upval), FFlagEnableIAFlyoutIXPHomeProfileRemovalModule (upval), FlyoutSidePanelIXP (upval), RemoveMobileHomeProfileHeader (upval), OmniFeedTypes (upval), FFlagHomePagePromptsHandlerEnabled (upval), LuaAppHomeFeedUpsellCardPosition (upval), PromptsEntryPoint (upval), PromptStyle (upval), FFlagDisableHomePageUpsellCardFeedItem (upval), GetFFlagEnableHomePageUpsellCardFunction (upval), v89 (upval), OmniFeedConstants (upval), LuaAppHomeFeedFriendsPosition (upval)
		local HomePageDataStatus = p1.props.homePageDataStatus
		
		if HomePageDataStatus == RetrievalStatus1.NotStarted or HomePageDataStatus == RetrievalStatus1.Fetching then return end
		local t = {}
		local NoFFlagLuaAppMoveProfileIntoTopBarIXP = if FFlagLuaAppMoveProfileIntoTopBar then p1.props.formFactor == FormFactor.COMPACT and (not FFlagLuaAppMoveProfileIntoTopBarIXP or VerticalEfficiencyExperimentation.getIsProfileMovedToTopBar()) else nil
		
		if LuaAppHomeFeedProfilePosition > 0 and (not FFlagLuaAppMoveProfileIntoTopBar or not NoFFlagLuaAppMoveProfileIntoTopBarIXP) and ((not FFlagEnableIAFlyoutIXPHomeProfileRemovalModule or not FlyoutSidePanelIXP.isProfileEntryRemoved()) and not RemoveMobileHomeProfileHeader) then
			p1.insertLocalFeedItem(t, LuaAppHomeFeedProfilePosition, OmniFeedTypes.UserInfo, {}, 0)
		end
		if FFlagHomePagePromptsHandlerEnabled then
			p1.insertLocalFeedItem(t, LuaAppHomeFeedUpsellCardPosition, OmniFeedTypes.Prompts, {
				entryPoint = PromptsEntryPoint.HomepageLaunch,
				promptStyle = PromptStyle.InlineBanner
			})
		end
		if not FFlagDisableHomePageUpsellCardFeedItem and (GetFFlagEnableHomePageUpsellCardFunction() and (p1.props.upsellCardVariation and (v89(p1.props.upsellCardVariation.upsellCardType, p1.props.upsellCardVariation) and LuaAppHomeFeedUpsellCardPosition > 0))) then
			p1.insertLocalFeedItem(t, LuaAppHomeFeedUpsellCardPosition, OmniFeedTypes.UpsellCard, {})
		end
		local OmniItemsGlobalLayoutData = p1.props.omniItemsGlobalLayoutData
		
		if (not OmniItemsGlobalLayoutData or OmniItemsGlobalLayoutData[OmniFeedConstants.GlobalLayoutDataKeys.JYFRefresh] ~= "true" and OmniItemsGlobalLayoutData[OmniFeedConstants.GlobalLayoutDataKeys.JYFRefresh] ~= true) and LuaAppHomeFeedFriendsPosition > 0 then
			p1.insertLocalFeedItem(t, LuaAppHomeFeedFriendsPosition, OmniFeedTypes.FriendCarousel, {})
		end
		p1.props.addLocalFeedItems(t)
	end
	
	function p1.fetchDataIfNeeded()
		-- upvalues: p1 (copy), RetrievalStatus1 (upval)
		if p1.props.homePageDataStatus == RetrievalStatus1.NotStarted then
			p1.fetchHomePageData()
		end
	end
	
	p1._willFocusListener = p1.props.navigation.addListener(RoactNavigationModule.Events.WillFocus, function()
		-- upvalues: p1 (copy)
		p1.fetchDataIfNeeded()
	end)
	
	function p1.omniFeedRefresh(p2)
		-- upvalues: p1 (copy)
		return p1.props.refresh(p1.props.networking, p1.props.omniRecommendationsRequest, p1.props.isOmni, p2, p1.props.loggingProtocol)
	end
	
	p1.fetchDataIfNeeded()
	p1.createLocalFeedItems()
end

function HomeOmniFeed.render(p1)
	-- upvalues: RetrievalStatus1 (copy), RoactModule (copy), SocialUpsellModule (copy), FFlagEnableAppStoreAgeSignalsOnHomePage (copy), OmniFeedAutoRefresher (copy), AppPage (copy), GameSortGroups (copy), PageSessionManagerModule (copy), Home (copy), LoadingStateContainer (copy), RetrievalStatus (copy), OmniFeedViewLoadMoreModule (copy), FFlagLuaAppLayoutParamsInContext (copy), OmniFeedConstants (copy), FFlagLuaAppEnableRelativeGuiHomeForAll (copy), FFlagLuaAppEnableRelativeGuiHomeWithIxp (copy), FFlagAppIaScrollAway (copy), FFlagLuaAppCompositionHome (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), FFlagLuaAppHomeTouchAutoplay (copy), FFlagLuaAppsDefaultSelection (copy), FFlagLuaAppScrollTelemetryIntegration (copy)
	local HomePageDataStatus = p1.props.homePageDataStatus
	local IsOmni = p1.props.isOmni
	local Fetching = HomePageDataStatus
	
	if Fetching ~= RetrievalStatus1.NotStarted and Fetching ~= RetrievalStatus1.Fetching and not p1.props.hasLocalOmniItems then
		Fetching = RetrievalStatus1.Fetching
	end
	if game:GetEngineFeature("SlowDownRendering") and HomePageDataStatus ~= RetrievalStatus1.Done then
		p1.props.appLifecycleObserverService:TriggerOnLuaAppReadyToRender()
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		SocialUpsellEventReceiver = RoactModule.createElement(SocialUpsellModule.SocialUpsellEventReceiver, {
			onAgeVerifiedChange = p1.fetchHomePageContactMethodModuleVariation,
			shouldRequestAppAgeSignals = FFlagEnableAppStoreAgeSignalsOnHomePage
		}),
		TokenRefreshComponent = RoactModule.createElement(OmniFeedAutoRefresher, {
			isOmni = IsOmni,
			pageType = AppPage.Home,
			sortToRefresh = GameSortGroups.HomeGames
		}),
		PageSessionManager = RoactModule.createElement(PageSessionManagerModule, {
			appPage = Home,
			setPageSession = p1.setHomePageSessionInfoFunc
		}),
		LoadingStateContainer = RoactModule.createElement(LoadingStateContainer, {
			dataStatus = RetrievalStatus.fromRawValue(Fetching),
			onRetry = p1.fetchHomePageData,
			renderOnLoaded = function()
				-- upvalues: RoactModule (upval), OmniFeedViewLoadMoreModule (upval), Home (upval), p1 (copy), FFlagLuaAppLayoutParamsInContext (upval), OmniFeedConstants (upval), FFlagLuaAppEnableRelativeGuiHomeForAll (upval), FFlagLuaAppEnableRelativeGuiHomeWithIxp (upval), FFlagAppIaScrollAway (upval), FFlagLuaAppCompositionHome (upval), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (upval), FFlagLuaAppHomeTouchAutoplay (upval), FFlagLuaAppsDefaultSelection (upval), FFlagLuaAppScrollTelemetryIntegration (upval)
				return RoactModule.createElement(OmniFeedViewLoadMoreModule, {
					impressionsTag = "FEEDITEM_IMPRESSIONS",
					pageContext = Home,
					refresh = p1.omniFeedRefresh,
					omniFeedItems = p1.props.omniFeedItems,
					onAbsoluteSizeChanged = p1.logHomePageInteractive,
					hasNextPage = p1.props.hasNextPage,
					loadNext = p1.loadNext,
					scrollingFrameRef = if FFlagLuaAppLayoutParamsInContext then p1.setScrollingFrameRef else p1.scrollingFrameRef,
					analyticsContext = OmniFeedConstants.EventContext,
					header = p1.props.header,
					headerHeight = p1.props.headerHeight,
					sendScrollEvent = p1.sendScrollEvent,
					enableRelativeGui = if FFlagLuaAppEnableRelativeGuiHomeForAll or FFlagLuaAppEnableRelativeGuiHomeWithIxp then p1.props.relativeGuiEnabled else nil,
					shouldStopAfterOneGameSort = p1.props.shouldStopAfterOneGameSort,
					canvasTopPadding = if FFlagAppIaScrollAway then p1.props.canvasTopPadding else nil,
					sduiContext = p1.props.sduiContext,
					appCompositionEnabled = if FFlagLuaAppCompositionHome then true else nil,
					onTileImageLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p1.props.onTileImageLoaded else nil,
					videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then p1.props.videoPlaybackContext else nil,
					onScrollStart = if FFlagLuaAppHomeTouchAutoplay then p1.props.onScrollStart else nil,
					onScrollSettled = if FFlagLuaAppHomeTouchAutoplay then p1.props.onScrollSettled else nil,
					defaultFocusRef = if FFlagLuaAppsDefaultSelection then p1.props.defaultFocusRef else nil,
					scrollPerformanceIntervalName = if FFlagLuaAppScrollTelemetryIntegration then "LuaApp_Home_Scroll" else nil
				})
			end
		})
	})
end

function HomeOmniFeed.didUpdate(p1, p2, _)
	if not p1.props.hasLocalOmniItems or p2.omniItemsGlobalLayoutData ~= p1.props.omniItemsGlobalLayoutData or p2.homePageDataStatus ~= p1.props.homePageDataStatus or p2.upsellCardVariation ~= p1.props.upsellCardVariation then
		p1.createLocalFeedItems()
	end
	if p1.scrollingPerf then
		p1.scrollingPerf:setScrollingFrame(p1.scrollingFrameRef.current)
	end
end

function HomeOmniFeed.didMount(p1)
	-- upvalues: ScrollingPerfTrackerModule (copy)
	p1.isMounted = true
	p1.logHomePageInteractive(p1.scrollingFrameRef.current)
	
	if ScrollingPerfTrackerModule then
		p1.scrollingPerf = ScrollingPerfTrackerModule.new("HomeOmniFeed", {
			loggingProtocol = p1.props.loggingProtocol,
			analyticsService = p1.props.appAnalytics
		})
		p1.scrollingPerf:setScrollingFrame(p1.scrollingFrameRef.current)
	end
end

function HomeOmniFeed.willUnmount(p1)
	if p1.scrollingPerf then
		p1.scrollingPerf:clean()
		p1.scrollingPerf = nil
	end
	p1.isMounted = false
	
	if p1._willFocusListener ~= nil then
		p1._willFocusListener.remove()
		p1._willFocusListener = nil
	end
end

local function useIsInteractive()
	-- upvalues: ReactModule (copy), Default (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Default.isInteractive)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), Default (upval), UseStateResult (copy)
		UseStateResult2(Default.isInteractive)
		
		if UseStateResult then
			return function() end
		else
			local ChangedConnection = Default.changed:connect(function()
				-- upvalues: UseStateResult2 (upval), Default (upval)
				UseStateResult2(Default.isInteractive)
			end)
			
			return function()
				-- upvalues: ChangedConnection (copy)
				ChangedConnection:disconnect()
			end
		end
	end, { UseStateResult })
	
	return UseStateResult
end

local v1 = RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: Players (copy), GetFFlagFixFetchNextOmniWithoutPageTokenFunction (copy), FetchStatusReducer (copy), FetchStatusNamespace (copy), AppPage (copy), Home (copy), AppIaHomeOmniFeedFix (copy), T (copy), FFlagLuaAppMoveProfileIntoTopBar (copy)
	local RecommendationsId = nil
	local OmniSessionId = nil
	local NextPageToken = nil
	local LocalUserId = p1.LocalUserId
	
	if not LocalUserId or LocalUserId == "" then
		LocalUserId = Players.LocalPlayer and Players.LocalPlayer.UserId or 0
	end
	local PersonalizationEntry = if GetFFlagFixFetchNextOmniWithoutPageTokenFunction() and p2.isOmni then p1.Personalization[FetchStatusReducer.key][FetchStatusNamespace.OmniRecommendations][AppPage.Home] else nil
	
	if p2.isOmni then
		local OmniRecommendation = p1.OmniRecommendations[AppPage.Home]
		
		if OmniRecommendation then
			RecommendationsId = OmniRecommendation.recommendationsId
			OmniSessionId = OmniRecommendation.omniSessionId
			NextPageToken = OmniRecommendation.nextPageToken
		end
	end
	local OrderedOmniItem = p1.Personalization.OrderedOmniItems[Home]
	
	return {
		localUserId = tostring(LocalUserId),
		homePageDataStatus = p1.Startup.HomePageDataStatus,
		homeOmniFetchStatus = if GetFFlagFixFetchNextOmniWithoutPageTokenFunction() then PersonalizationEntry else nil,
		screenSize = p1.ScreenSize,
		formFactor = if FFlagLuaAppMoveProfileIntoTopBar then p1.FormFactor else nil,
		upsellCardVariation = p1.HomePageUpsellCardVariation,
		hasNextPage = NextPageToken ~= nil and (NextPageToken ~= "" and p2.isOmni),
		recommendationsRequestId = RecommendationsId,
		omniSessionId = OmniSessionId,
		omniFeedItems = OrderedOmniItem and OrderedOmniItem.allItems or (if AppIaHomeOmniFeedFix then T else {}),
		hasLocalOmniItems = OrderedOmniItem and OrderedOmniItem.hasLocalItems or false,
		omniItemsGlobalLayoutData = p1.Personalization.OmniItemsGlobalLayoutData
	}
end, function(Callback)
	-- upvalues: AddLocalOmniItemsModule (copy), Home (copy), ApiFetchOmniRecommendationsFunction (copy), AppPage (copy), OmniFeedConstants (copy), RefreshSiteAlertInfoModule (copy), RefreshGameSortsFunction (copy), GameSortGroups (copy), PromiseModule (copy), SetNetworkingErrorToastFunction (copy), FetchHomePageDataFunction (copy), FetchHomePageContactMethodModuleVariationFunction (copy)
	return {
		addLocalFeedItems = function(p1)
			-- upvalues: Callback (copy), AddLocalOmniItemsModule (upval), Home (upval)
			Callback(AddLocalOmniItemsModule(p1, Home))
		end,
		loadNext = function(p1, p2, p3)
			-- upvalues: Callback (copy), ApiFetchOmniRecommendationsFunction (upval), AppPage (upval), OmniFeedConstants (upval)
			return Callback(ApiFetchOmniRecommendationsFunction(p1, p2, AppPage.Home, true, nil, OmniFeedConstants.OmniRecommendationsRequestIntent.LoadMore, p3))
		end,
		refresh = function(p1, p2, p3, p4, p5)
			-- upvalues: Callback (copy), RefreshSiteAlertInfoModule (upval), ApiFetchOmniRecommendationsFunction (upval), AppPage (upval), RefreshGameSortsFunction (upval), GameSortGroups (upval), PromiseModule (upval), SetNetworkingErrorToastFunction (upval)
			Callback(RefreshSiteAlertInfoModule())
			
			return PromiseModule.all({
				Callback(if p3 then ApiFetchOmniRecommendationsFunction(p1, p2, AppPage.Home, nil, nil, p4, p5) else RefreshGameSortsFunction(p1, { GameSortGroups.HomeGames }, nil, nil))
			}):andThen(function(Result)
				-- upvalues: PromiseModule (upval)
				return PromiseModule.resolve(Result)
			end, function(p6)
				-- upvalues: Callback (upval), SetNetworkingErrorToastFunction (upval), PromiseModule (upval)
				Callback(SetNetworkingErrorToastFunction(p6))
				
				return PromiseModule.reject(p6)
			end)
		end,
		fetchHomePageData = function(p1, p2, p3, p4, p5, p6, p7)
			-- upvalues: Callback (copy), FetchHomePageDataFunction (upval), OmniFeedConstants (upval)
			return Callback(FetchHomePageDataFunction(p1, p2, p3, p4, p5, p6, p7, OmniFeedConstants.OmniRecommendationsRequestIntent.LogIn))
		end,
		fetchHomePageContactMethodModuleVariation = function(p1)
			-- upvalues: Callback (copy), FetchHomePageContactMethodModuleVariationFunction (upval)
			return Callback(FetchHomePageContactMethodModuleVariationFunction(p1))
		end
	}
end)(HomeOmniFeed)

return (RoactServices.connect({
	appAnalytics = RoactAnalytics,
	networking = RoactNetworking,
	loggingProtocol = AppLogging,
	prefetchProtocol = AppPrefetch,
	sessionService = AppSessionService,
	appStartupSequence = AppStartupSequenceTag,
	eventIngest = AppEventIngestService,
	appLifecycleObserverService = if TriggerLuaAppInteractiveFromLua then AppAppLifecycleObserverService else nil
})((RoactNavigationModule.withNavigation((RoactAppPolicy.connect(function(p1, _)
	return { isOmni = p1.getUseOmniRecommendation() }
end)(function(p1)
	-- upvalues: UseBannerContainerModule (copy), FFlagLuaAppEnableRelativeGuiHomeForAll (copy), FFlagLuaAppEnableRelativeGuiHomeWithIxp (copy), HomeOmniFeedExperimentationModule (copy), FFlagLuaAppHomeTouchAutoplay (copy), UsePreferredInputFunction (copy), UseIsSpatialFunction (copy), ResponsiveModule (copy), ReactModule (copy), FeedVideoPlaybackContext (copy), useIsInteractive (copy), FFlagLuaAppLayoutParamsInContext (copy), UseCollectionLayoutConfigFunction (copy), ServerDrivenUiModule (copy), Home (copy), FFlagLuaAppRfySignalApportioning (copy), FFlagLuaAppCompositionHome (copy), FFlagLuaAppSponsoredAdViewabilityEnabled (copy), UseSponsoredAdViewabilityDetectorFunction (copy), RoactModule (copy), v1 (copy), CryoModule (copy)
	local UseBannerContainerModuleResult, UseBannerContainerModuleResult2 = UseBannerContainerModule()
	local RelativeGuiOnHomeEnabled = if FFlagLuaAppEnableRelativeGuiHomeForAll then true elseif FFlagLuaAppEnableRelativeGuiHomeWithIxp then HomeOmniFeedExperimentationModule.getRelativeGuiOnHomeEnabled() else nil
	local UsePreferredInputResult = if FFlagLuaAppEnableRelativeGuiHomeForAll or FFlagLuaAppEnableRelativeGuiHomeWithIxp or FFlagLuaAppHomeTouchAutoplay then UsePreferredInputFunction() else nil
	
	if FFlagLuaAppEnableRelativeGuiHomeForAll or FFlagLuaAppEnableRelativeGuiHomeWithIxp then
		local UseIsSpatialResult = UseIsSpatialFunction()
		
		if UsePreferredInputResult == ResponsiveModule.Input.Directional or UseIsSpatialResult then
			RelativeGuiOnHomeEnabled = false
		end
	end
	local UseMemoResult = nil
	local UseResult = nil
	local UseResult1 = nil
	
	if FFlagLuaAppHomeTouchAutoplay then
		local IsUsePreferredInputResultMatch = UsePreferredInputResult == ResponsiveModule.Input.Touch
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: FeedVideoPlaybackContext (upval), IsUsePreferredInputResultMatch (copy)
			return FeedVideoPlaybackContext.new(IsUsePreferredInputResultMatch)
		end, { IsUsePreferredInputResultMatch })
		UseResult = ReactModule.useCallback(function()
			-- upvalues: UseMemoResult (ref)
			if UseMemoResult.viewportVideoAutoplayController then
				UseMemoResult.viewportVideoAutoplayController:onScrollStart()
			end
		end, { UseMemoResult.viewportVideoAutoplayController })
		UseResult1 = ReactModule.useCallback(function(p2)
			-- upvalues: UseMemoResult (ref)
			if UseMemoResult.viewportVideoAutoplayController then
				UseMemoResult.viewportVideoAutoplayController:onScrollSettled("Y", p2, nil)
			end
		end, { UseMemoResult.viewportVideoAutoplayController })
	end
	local Inverted = not useIsInteractive()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseCollectionLayoutConfigResult = if FFlagLuaAppLayoutParamsInContext then UseCollectionLayoutConfigFunction(UseStateResult) else nil
	local UseSduiContextFromRoduxAndProcessConfigsResult = ServerDrivenUiModule.useSduiContextFromRoduxAndProcessConfigs(Home, if FFlagLuaAppLayoutParamsInContext then UseCollectionLayoutConfigResult else nil)
	
	if FFlagLuaAppRfySignalApportioning then
		ServerDrivenUiModule.useApportioningPreprocessingFromOmniRecommendations(Home, UseCollectionLayoutConfigResult, if FFlagLuaAppCompositionHome then true else nil)
	end
	if FFlagLuaAppSponsoredAdViewabilityEnabled then
		UseSponsoredAdViewabilityDetectorFunction(UseStateResult)
	end
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, {
		sduiContext = UseSduiContextFromRoduxAndProcessConfigsResult,
		shouldStopAfterOneGameSort = Inverted,
		header = UseBannerContainerModuleResult,
		headerHeight = UseBannerContainerModuleResult2,
		setScrollingFrame = if FFlagLuaAppLayoutParamsInContext then UseStateResult2 else nil,
		relativeGuiEnabled = if FFlagLuaAppEnableRelativeGuiHomeForAll or FFlagLuaAppEnableRelativeGuiHomeWithIxp then RelativeGuiOnHomeEnabled else nil,
		videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then UseMemoResult else nil,
		onScrollStart = if FFlagLuaAppHomeTouchAutoplay then UseResult else nil,
		onScrollSettled = if FFlagLuaAppHomeTouchAutoplay then UseResult1 else nil
	}))
end))))))