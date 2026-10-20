local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
Default:logEventOnce("home_page_require_begin")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local GetTestIdFunction = require(CorePackages.Workspace.Packages.RoactUtils).getTestId
local CombineReactTagsFunction = require(CorePackages.Workspace.Packages.RoactUtils).combineReactTags
local TModule = require(CorePackages.Packages.t)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local UseDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppNotificationService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppNotificationService
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local ServerTriggeredModalsModule = require(CorePackages.Workspace.Packages.ServerTriggeredModals)
local CheckForSduiModal = ServerTriggeredModalsModule.CheckForSduiModal
local CheckForPrompts = ServerTriggeredModalsModule.CheckForPrompts
local PromptsSystemBanner = ServerTriggeredModalsModule.PromptsSystemBanner
local PromptsHandler = ServerTriggeredModalsModule.PromptsHandler
local PromptsEntryPoint = ServerTriggeredModalsModule.PromptsEntryPoint
local PromptStyle = ServerTriggeredModalsModule.PromptStyle
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local HomeOmniFeedModule = require(Modules.Personalization.Home.HomeOmniFeed.HomeOmniFeed)
local WithThrottleFramerateGivenPolicyModule = require(Modules.LuaApp.Common.withThrottleFramerateGivenPolicy)
local PersonalizationTopBarModule = require(Modules.Personalization.PersonalizationTopBar)
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local UseUiModeInfo = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local AppPageModule = require(Modules.LuaApp.AppPage)
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local HomePageLoadTracker = require(CorePackages.Workspace.Packages.HomePageLoadTracker).HomePageLoadTracker
local CheckForVngAppUpsellModule = require(Modules.Personalization.Home.VngAppUpsell.CheckForVngAppUpsell)
local CheckForPushNotificationsUpsellModule = require(Modules.Personalization.Home.PushNotificationsUpsell.CheckForPushNotificationsUpsell)
local CheckForReminderOfNormsModule = require(Modules.LuaApp.Components.Moderation.CheckForReminderOfNorms)
local FlyoutSidePanelIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP
local CompositionTags = require(CorePackages.Workspace.Packages.AppComposition).CompositionTags
local Sources = require(CorePackages.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Sources
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UseFocusOnMount = require(CorePackages.Workspace.Packages.FocusNavigationUtils).useFocusOnMount
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local IsSubjectToDesktopPoliciesFunction = require(CorePackages.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies
local GetFFlagEnableAccessBlockAtAppContainerLevelFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAccessBlockAtAppContainerLevel
local GetFFlagInjectAnalyticsServiceModule = require(Modules.LuaApp.Flags.GetFFlagInjectAnalyticsService)
local FFlagLuaAppHomeVngAppUpsell = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppHomeVngAppUpsell
local GetFFlagEnablePushNotificationsUpsellModalFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnablePushNotificationsUpsellModal
local GetFFlagEnableReminderOfNormsABTestFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableReminderOfNormsABTest
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagLuaAppsServerTriggeredModals = SharedFlagsModule.FFlagLuaAppsServerTriggeredModals
local FFlagEnableSduiV2HomepagePrompts = SharedFlagsModule.FFlagEnableSduiV2HomepagePrompts
local FFlagEnableHomepagePromptsForModalsAndBanners = SharedFlagsModule.FFlagEnableHomepagePromptsForModalsAndBanners
local FFlagPromptsHandlerEnabled = SharedFlagsModule.FFlagPromptsHandlerEnabled
local FFlagAppIaHomeSubTab = SharedFlagsModule.FFlagAppIaHomeSubTab
local FFlagEnableLeftNavOnConsole = SharedFlagsModule.FFlagEnableLeftNavOnConsole
local FFlagLuaAppEnableChartsPageProfileLink = SharedFlagsModule.FFlagLuaAppEnableChartsPageProfileLink
local FFlagLuaAppCompositionHome = SharedFlagsModule.FFlagLuaAppCompositionHome
local FFlagLuaAppAddTestIdsForArrow = SharedFlagsModule.FFlagLuaAppAddTestIdsForArrow
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = SharedFlagsModule.FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppsDefaultSelection = SharedFlagsModule.FFlagLuaAppsDefaultSelection
local FFlagLuaAppHomePageLoadTracker = SharedFlagsModule.FFlagLuaAppHomePageLoadTracker
local UseTTINavigationTracking = require(CorePackages.Workspace.Packages.TTINavigationTracking).useTTINavigationTracking
local PromptsConstants = require(CorePackages.Workspace.Packages.ServerTriggeredModals).PromptsConstants

local function logFirstTileImageLoaded()
	-- upvalues: Default (copy), FFlagLuaAppHomePageLoadTracker (copy), HomePageLoadTracker (copy)
	Default:logEventOnce("home_first_tile_thumbnail_loaded")
	
	if FFlagLuaAppHomePageLoadTracker then
		HomePageLoadTracker.logFunctionallyReadyAndEnd()
	end
end

local HomePageWithFeed = ReactModule.PureComponent:extend("HomePageWithFeed")
HomePageWithFeed.validateProps = TModule.strictInterface({
	homePageDataStatus = TModule.string,
	navigateToUAppBlock = if GetFFlagEnableAccessBlockAtAppContainerLevelFunction() then nil else TModule.callback,
	topBarHeight = if FFlagAppIaScrollAway then TModule.number else nil,
	useGridPageLayout = TModule.optional(TModule.boolean),
	policyEnableHomePageAgeBlock = TModule.optional(TModule.boolean),
	setThrottleFramerateEnabled = TModule.optional(TModule.callback),
	navigation = TModule.table,
	screenProps = TModule.optional(TModule.table),
	notificationService = TModule.any,
	backgroundColor = TModule.Color3,
	backgroundTransparency = TModule.number,
	hasTopBar = TModule.boolean,
	onTileImageLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then TModule.optional(TModule.callback) else nil,
	defaultFocusRef = if FFlagLuaAppsDefaultSelection then TModule.optional(TModule.callback) else nil,
	containerRef = if FFlagLuaAppsDefaultSelection then TModule.optional(TModule.callback) else nil
})

function HomePageWithFeed.init(p1)
	-- upvalues: GetFFlagEnableAccessBlockAtAppContainerLevelFunction (copy), FFlagLuaAppHomePageLoadTracker (copy), HomePageLoadTracker (copy), IsSubjectToDesktopPoliciesFunction (copy)
	if not GetFFlagEnableAccessBlockAtAppContainerLevelFunction() and p1.props.policyEnableHomePageAgeBlock then
		p1.props.navigateToUAppBlock()
	end
	function p1.notifyPageLoaded()
		-- upvalues: p1 (copy)
		p1.props.notificationService:ActionEnabled(Enum.AppShellActionType.HomePageLoaded)
	end
	
	function p1.onDidFocus()
		-- upvalues: FFlagLuaAppHomePageLoadTracker (upval), HomePageLoadTracker (upval), IsSubjectToDesktopPoliciesFunction (upval), p1 (copy)
		if FFlagLuaAppHomePageLoadTracker then
			HomePageLoadTracker.logSurfaceMounted()
			
			if HomePageLoadTracker.isWarmVisit() then
				HomePageLoadTracker.logFunctionallyReadyAndEnd()
			end
		end
		if IsSubjectToDesktopPoliciesFunction() then
			p1.props.setThrottleFramerateEnabled(false)
		end
	end
	
	function p1.onWillBlur()
		-- upvalues: IsSubjectToDesktopPoliciesFunction (upval), p1 (copy)
		if IsSubjectToDesktopPoliciesFunction() then
			p1.props.setThrottleFramerateEnabled(true)
		end
	end
end

function HomePageWithFeed.render(p1)
	-- upvalues: FFlagLuaAppHomePageLoadTracker (copy), HomePageLoadTracker (copy), ReactModule (copy), HomeOmniFeedModule (copy), FFlagLuaAppsDefaultSelection (copy), FFlagAppIaHomeSubTab (copy), FlyoutSidePanelIXP (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), TopBarModule (copy), PersonalizationTopBarModule (copy), FFlagLuaAppCompositionHome (copy), CompositionTags (copy), FFlagLuaAppEnableChartsPageProfileLink (copy), Sources (copy), FFlagPromptsHandlerEnabled (copy), PromptsHandler (copy), PromptsEntryPoint (copy), PromptStyle (copy), FFlagEnableHomepagePromptsForModalsAndBanners (copy), PromptsSystemBanner (copy), PromptsConstants (copy), AppPageModule (copy), RoactNavigationModule (copy), FFlagLuaAppHomeVngAppUpsell (copy), CheckForVngAppUpsellModule (copy), GetFFlagEnablePushNotificationsUpsellModalFunction (copy), CheckForPushNotificationsUpsellModule (copy), GetFFlagEnableReminderOfNormsABTestFunction (copy), CheckForReminderOfNormsModule (copy), FFlagLuaAppsServerTriggeredModals (copy), CheckForSduiModal (copy), FFlagEnableSduiV2HomepagePrompts (copy), CheckForPrompts (copy), FFlagLuaAppAddTestIdsForArrow (copy), GetTestIdFunction (copy), CombineReactTagsFunction (copy), GetFFlagInjectAnalyticsServiceModule (copy), WithStyleFunction (copy)
	if FFlagLuaAppHomePageLoadTracker then
		HomePageLoadTracker.logRenderStarted()
	end
	local function v60(_)
		-- upvalues: p1 (copy), ReactModule (upval), HomeOmniFeedModule (upval), FFlagLuaAppsDefaultSelection (upval), FFlagAppIaHomeSubTab (upval), FlyoutSidePanelIXP (upval), FFlagAppIaScrollAway (upval), AppNavBarModule (upval), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (upval), TopBarModule (upval), PersonalizationTopBarModule (upval), FFlagLuaAppCompositionHome (upval), CompositionTags (upval), FFlagLuaAppEnableChartsPageProfileLink (upval), Sources (upval), FFlagPromptsHandlerEnabled (upval), PromptsHandler (upval), PromptsEntryPoint (upval), PromptStyle (upval), FFlagEnableHomepagePromptsForModalsAndBanners (upval), PromptsSystemBanner (upval), PromptsConstants (upval), AppPageModule (upval), RoactNavigationModule (upval), FFlagLuaAppHomeVngAppUpsell (upval), CheckForVngAppUpsellModule (upval), GetFFlagEnablePushNotificationsUpsellModalFunction (upval), CheckForPushNotificationsUpsellModule (upval), GetFFlagEnableReminderOfNormsABTestFunction (upval), CheckForReminderOfNormsModule (upval), FFlagLuaAppsServerTriggeredModals (upval), CheckForSduiModal (upval), FFlagEnableSduiV2HomepagePrompts (upval), CheckForPrompts (upval), FFlagLuaAppAddTestIdsForArrow (upval), GetTestIdFunction (upval), CombineReactTagsFunction (upval), GetFFlagInjectAnalyticsServiceModule (upval)
		local BackgroundColor = p1.props.backgroundColor
		local BackgroundTransparency = p1.props.backgroundTransparency
		local UseGridPageLayout = p1.props.useGridPageLayout
		local Element = ReactModule.createElement(HomeOmniFeedModule, {
			defaultFocusRef = if FFlagLuaAppsDefaultSelection then p1.props.defaultFocusRef else nil,
			canvasTopPadding = if FFlagAppIaHomeSubTab and FlyoutSidePanelIXP.isHomeSubTabEnabled() and FFlagAppIaScrollAway then if p1.props.screenProps then p1.props.screenProps.headerHeight else nil elseif FFlagAppIaScrollAway and p1.props.hasTopBar and AppNavBarModule.getScrollAwayEnabled() then p1.props.topBarHeight else nil,
			onTileImageLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p1.props.onTileImageLoaded else nil
		})
		local PageHome = if FFlagLuaAppAddTestIdsForArrow then GetTestIdFunction("page-home") else nil
		
		return ReactModule.createElement("Frame", {
			ref = if FFlagLuaAppsDefaultSelection then p1.props.containerRef else nil,
			[ReactModule.Tag] = if FFlagLuaAppAddTestIdsForArrow then CombineReactTagsFunction(if GetFFlagInjectAnalyticsServiceModule() then "app-screen.home" else nil, PageHome) elseif GetFFlagInjectAnalyticsServiceModule() then "app-screen.home" else nil,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = BackgroundColor,
			BackgroundTransparency = BackgroundTransparency,
			BorderSizePixel = 0
		}, {
			NavigationEvents = ReactModule.createElement(RoactNavigationModule.NavigationEvents, { onDidFocus = p1.onDidFocus, onWillBlur = p1.onWillBlur }),
			CheckForVngAppUpsell = if FFlagLuaAppHomeVngAppUpsell then ReactModule.createElement(CheckForVngAppUpsellModule) else nil,
			CheckForPushNotificationsUpsell = if GetFFlagEnablePushNotificationsUpsellModalFunction() then ReactModule.createElement(CheckForPushNotificationsUpsellModule) else nil,
			CheckForReminderOfNorms = if GetFFlagEnableReminderOfNormsABTestFunction() then ReactModule.createElement(CheckForReminderOfNormsModule) else nil,
			CheckForSduiModal = if FFlagLuaAppsServerTriggeredModals then ReactModule.createElement(CheckForSduiModal) else nil,
			CheckForPrompts = if FFlagEnableSduiV2HomepagePrompts then ReactModule.createElement(CheckForPrompts) else nil,
			Content = ReactModule.createElement(TopBarModule.PageWrapper, {
				topBarSlot = if FFlagAppIaHomeSubTab and FlyoutSidePanelIXP.isHomeSubTabEnabled() then nil elseif p1.props.hasTopBar then ReactModule.createElement(PersonalizationTopBarModule, {
					tag = if FFlagLuaAppCompositionHome then CompositionTags.ContentRegion.Header else nil,
					useGridPageLayout = UseGridPageLayout,
					profileSource = if FFlagLuaAppEnableChartsPageProfileLink then Sources.HomePageSelfWidget else nil,
					sideMarginOverride = if FFlagLuaAppCompositionHome then 0 else nil
				}) else nil,
				BackgroundColor3 = BackgroundColor,
				BackgroundTransparency = BackgroundTransparency
			}, {
				HomeOmniFeed = if FFlagPromptsHandlerEnabled then ReactModule.createElement(PromptsHandler, {
					entryPoint = PromptsEntryPoint.HomepageLaunch,
					promptStyle = PromptStyle.SurfaceBanner,
					surfaceBannerContent = Element
				}) elseif FFlagEnableHomepagePromptsForModalsAndBanners then ReactModule.createElement(PromptsSystemBanner, {
					configKey = PromptsConstants.HOMEPAGE_PROMPTS_CONFIG_KEY,
					appPage = AppPageModule.Home,
					contentSlot = Element
				}) else Element
			})
		})
	end
	
	return WithStyleFunction(function(p2)
		-- upvalues: v60 (copy)
		return v60(p2)
	end)
end

function HomePageWithFeed.didMount(p1)
	-- upvalues: RetrievalStatusModule (copy)
	p1.isMounted = true
	
	if p1.props.homePageDataStatus == RetrievalStatusModule.Done then
		p1.notifyPageLoaded()
	end
	p1.onDidFocus()
end

function HomePageWithFeed.didUpdate(p1, p2)
	-- upvalues: GetFFlagEnableAccessBlockAtAppContainerLevelFunction (copy), RetrievalStatusModule (copy)
	if not GetFFlagEnableAccessBlockAtAppContainerLevelFunction() and p1.props.policyEnableHomePageAgeBlock then
		p1.props.navigateToUAppBlock()
	end
	local IsHomePageDataStatusMatch = p2.homePageDataStatus == RetrievalStatusModule.Done
	
	if p1.props.homePageDataStatus == RetrievalStatusModule.Done and not IsHomePageDataStatusMatch then
		p1.notifyPageLoaded()
	end
end

function HomePageWithFeed.willUnmount(p1)
	p1.isMounted = false
end

local WithNavigationResult = RoactNavigationModule.withNavigation((RoactRoduxModule.connect(function(p1, _)
	-- upvalues: FFlagAppIaScrollAway (copy)
	return {
		homePageDataStatus = p1.Startup.HomePageDataStatus,
		topBarHeight = if FFlagAppIaScrollAway then p1.TopBar.topBarHeight else nil
	}
end, function(Callback)
	-- upvalues: GetFFlagEnableAccessBlockAtAppContainerLevelFunction (copy), ResetNavigationHistoryModule (copy), AppPageModule (copy)
	return {
		navigateToUAppBlock = if GetFFlagEnableAccessBlockAtAppContainerLevelFunction() then nil else function()
			-- upvalues: Callback (copy), ResetNavigationHistoryModule (upval), AppPageModule (upval)
			Callback(ResetNavigationHistoryModule({ { name = AppPageModule.UAppBlock } }))
		end
	}
end)(HomePageWithFeed)))
local WithThrottleFramerateGivenPolicyModuleResult = WithThrottleFramerateGivenPolicyModule((RoactAppPolicy.connect(function(p1, _)
	return {
		useGridPageLayout = p1.useGridPageLayout(),
		policyEnableHomePageAgeBlock = p1.getEnableHomePageAgeBlock()
	}
end)((RoactServices.connect({ notificationService = AppNotificationService })(function(p1)
	-- upvalues: SharedFlagsModule (copy), UseTTINavigationTracking (copy), UseDesignTokens (copy), UseUiModeInfo (copy), UiMode (copy), FFlagEnableLeftNavOnConsole (copy), FFlagLuaAppsDefaultSelection (copy), ReactFocusNavigationModule (copy), UseFocusOnMount (copy), CryoModule (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), logFirstTileImageLoaded (copy), ReactModule (copy), WithNavigationResult (copy)
	if SharedFlagsModule.FFlagLuaAppNavigationTTITracking then
		UseTTINavigationTracking("NavigateTo_Home")
	end
	local v1 = UseDesignTokens()
	local IsNotUiModeMatch = UseUiModeInfo().uiMode ~= UiMode.TenFoot or FFlagEnableLeftNavOnConsole
	local v2 = nil
	local v3 = nil
	
	if FFlagLuaAppsDefaultSelection then
		local UseMostRecentOrDefaultFocusBehaviorResult
		UseMostRecentOrDefaultFocusBehaviorResult, v70 = ReactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior()
		v2 = UseFocusOnMount(UseMostRecentOrDefaultFocusBehaviorResult)
	end
	return ReactModule.createElement(WithNavigationResult, (CryoModule.Dictionary.join(p1, {
		backgroundColor = v1.LuaApps.App.Page.BackgroundColor,
		backgroundTransparency = v1.LuaApps.App.Page.BackgroundTransparency,
		hasTopBar = IsNotUiModeMatch,
		onTileImageLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then logFirstTileImageLoaded else nil,
		defaultFocusRef = if FFlagLuaAppsDefaultSelection then v2 else nil,
		containerRef = if FFlagLuaAppsDefaultSelection then v3 else nil
	})))
end)))))
Default:logEventOnce("home_page_require_end")

return WithThrottleFramerateGivenPolicyModuleResult