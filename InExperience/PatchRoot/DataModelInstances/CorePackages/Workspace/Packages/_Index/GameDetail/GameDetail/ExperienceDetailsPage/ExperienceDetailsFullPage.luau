local GameDetail = script:FindFirstAncestor("GameDetail")
local Parent = GameDetail.Parent
local IsTenFootInterfaceFunction = require(Parent.AppCommonLib).isTenFootInterface
local ExperienceDetailsPageUtilsModule = require(script.Parent.ExperienceDetailsPageUtils)
local ExperienceDetailsPageConstantsModule = require(script.Parent.ExperienceDetailsPageConstants)
local ExperienceDetailsPageScopeFieldsModule = require(script.Parent.ExperienceDetailsPageScopeFields)
local FetchExperienceDetailsPageModule = require(script.Parent.fetchExperienceDetailsPage)
local GetExperienceDetailsPageKeyModule = require(script.Parent.getExperienceDetailsPageKey)
local RemoveGameDetailSessionIfDepartedModule = require(script.Parent.removeGameDetailSessionIfDeparted)
local UseEdpFunctionallyReadyLoggerModule = require(script.Parent.useEdpFunctionallyReadyLogger)
local CreateExperienceDetailsPageTimerModule = require(script.Parent.createExperienceDetailsPageTimer)
local UsePublishContainerWidthModule = require(script.Parent.usePublishContainerWidth)
local ExperienceDetailsFallbackBannerImageModule = require(script.Parent.Fallback.ExperienceDetailsFallbackBannerImage)
local ExperienceDetailsFallbackFeedModule = require(script.Parent.Fallback.ExperienceDetailsFallbackFeed)
local ExperienceDetailsPersistentActionBarModule = require(script.Parent.ExperienceDetailsPersistentActionBar)
local _ = require(Parent.Navigation)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AppSessionService = require(Parent.RoactServiceTags).AppSessionService
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local DetailsPageLayout = require(Parent.AppBlox).DetailsPageLayout
local AppPage = require(Parent.RobloxAppEnums).AppPage
local DataHydrationModule = require(Parent.DataHydration)
local ResponsiveModule = require(Parent.Responsive)
local UseGetCurrentLegacyRouteFunction = require(Parent.DiscoveryRouting).useGetCurrentLegacyRoute
local EDPTTIConstants = require(Parent.GameDetailTelemetry).EDPTTIConstants
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local GetSduiClientPageScopeFunction = SduiSharedUtilitiesModule.getSduiClientPageScope
local SduiSurfaceLoadTimeTracker = SduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local UsePageScopeRefFunction = SduiSharedUtilitiesModule.usePageScopeRef
local SduiPageEntryPoint = SduiSharedUtilitiesModule.SduiPageEntryPoint
local SduiFeatureEntryPoint = SduiSharedUtilitiesModule.SduiFeatureEntryPoint
local UiStatus = SduiSharedUtilitiesModule.UiStatus
local UseUiStatusFunction = SduiSharedUtilitiesModule.useUiStatus
local FilterPlayWithReward = ExperienceDetailsPageScopeFieldsModule.FilterPlayWithReward
local IsTenFoot = ExperienceDetailsPageScopeFieldsModule.IsTenFoot
local CompositionTags = require(Parent.AppComposition).CompositionTags
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEDPTTIParityDefinitions = SharedFlagsModule.FFlagEDPTTIParityDefinitions
local FFlagSduiPageEntryUseSharedHooks = SharedFlagsModule.FFlagSduiPageEntryUseSharedHooks
local FFlagSduiContainerQueries = SharedFlagsModule.FFlagSduiContainerQueries
local SduiEdpPageScopeIsTenFoot = game:DefineFastFlag("SduiEdpPageScopeIsTenFoot", false)
local FFlagLuaAppMediaGalleryGamepadSupport = SharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
local FFlagLuaAppEdpDirectionalGradientMidTransparency = SharedFlagsModule.FFlagLuaAppEdpDirectionalGradientMidTransparency
local FFlagEnableSplitPaneEDPFix = SharedFlagsModule.FFlagEnableSplitPaneEDPFix
local EdpBannerAspectRatioTenths = game:DefineFastInt("EdpBannerAspectRatioTenths", 0)
local EdpFullBleedOverlapOffset = game:DefineFastInt("EdpFullBleedOverlapOffset", 180)
local EdpGradientTopBleedOffset = game:DefineFastInt("EdpGradientTopBleedOffset", 120)
local EdpBannerBottomVisiblePercent = game:DefineFastInt("EdpBannerBottomVisiblePercent", 20)
local EdpDirectionalFullBleedOverlapOffset = game:DefineFastInt("EdpDirectionalFullBleedOverlapOffset", 195)
local EdpDirectionalBannerBottomVisiblePercent = game:DefineFastInt("EdpDirectionalBannerBottomVisiblePercent", 50)
local EdpDirectionalGradientMidTransparencyHundredths = game:DefineFastInt("EdpDirectionalGradientMidTransparencyHundredths", 12)
local SelectionGroup = {
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop
}

return ReactModule.memo(function(p1)
	-- upvalues: GameDetail (copy), ExperienceDetailsPageUtilsModule (copy), GetExperienceDetailsPageKeyModule (copy), ReactModule (copy), UsePageScopeRefFunction (copy), FFlagEDPTTIParityDefinitions (copy), CreateExperienceDetailsPageTimerModule (copy), EDPTTIConstants (copy), SduiSurfaceLoadTimeTracker (copy), GetSduiClientPageScopeFunction (copy), UseEdpFunctionallyReadyLoggerModule (copy), UseNavigationFunction (copy), UseRoactServiceFunction (copy), AppSessionService (copy), UseTokensFunction (copy), UseGetCurrentLegacyRouteFunction (copy), FilterPlayWithReward (copy), SduiEdpPageScopeIsTenFoot (copy), IsTenFoot (copy), IsTenFootInterfaceFunction (copy), RemoveGameDetailSessionIfDepartedModule (copy), FetchExperienceDetailsPageModule (copy), UseUiStatusFunction (copy), UiStatus (copy), DataHydrationModule (copy), FFlagSduiContainerQueries (copy), UsePublishContainerWidthModule (copy), FFlagLuaAppMediaGalleryGamepadSupport (copy), ResponsiveModule (copy), FFlagEnableSplitPaneEDPFix (copy), ExperienceDetailsPageScopeFieldsModule (copy), DetailsPageLayout (copy), SelectionGroup (copy), EdpBannerAspectRatioTenths (copy), EdpDirectionalFullBleedOverlapOffset (copy), EdpFullBleedOverlapOffset (copy), EdpGradientTopBleedOffset (copy), FFlagLuaAppEdpDirectionalGradientMidTransparency (copy), EdpDirectionalGradientMidTransparencyHundredths (copy), EdpDirectionalBannerBottomVisiblePercent (copy), EdpBannerBottomVisiblePercent (copy), SduiFeatureEntryPoint (copy), AppPage (copy), ExperienceDetailsPageConstantsModule (copy), ExperienceDetailsFallbackBannerImageModule (copy), FoundationModule (copy), SduiPageEntryPoint (copy), FFlagSduiPageEntryUseSharedHooks (copy), CompositionTags (copy), ExperienceDetailsFallbackFeedModule (copy), ExperienceDetailsPersistentActionBarModule (copy)
	local UseExperienceDetailsFocusNavigationModule = require(GameDetail.FocusNavigation.useExperienceDetailsFocusNavigation)
	local UniverseId = ExperienceDetailsPageUtilsModule.getUniverseId(p1)
	local ExperienceDetailsPageKeyModule = GetExperienceDetailsPageKeyModule(UniverseId)
	local UseRefResult = ReactModule.useRef(nil)
	UsePageScopeRefFunction(ExperienceDetailsPageKeyModule)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ExperienceDetailsPageUtilsModule (upval), p1 (copy), FFlagEDPTTIParityDefinitions (upval), CreateExperienceDetailsPageTimerModule (upval), ExperienceDetailsPageKeyModule (copy), EDPTTIConstants (upval), SduiSurfaceLoadTimeTracker (upval), GetSduiClientPageScopeFunction (upval)
		local PageTimerFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "pageTimer")
		local PageTimerFromPropsOrNavigationParams1 = if FFlagEDPTTIParityDefinitions then PageTimerFromPropsOrNavigationParams or CreateExperienceDetailsPageTimerModule(ExperienceDetailsPageKeyModule, {
			page = "Untracked",
			category = EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_FULL_PAGE
		}) else PageTimerFromPropsOrNavigationParams or SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(ExperienceDetailsPageKeyModule, {
			manualSurfaceReady = true,
			eventName = EDPTTIConstants.EDP_TTI_EVENT_NAME,
			metadata = {
				page = "Untracked",
				category = EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_FULL_PAGE
			}
		})
		GetSduiClientPageScopeFunction(ExperienceDetailsPageKeyModule).set(SduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, PageTimerFromPropsOrNavigationParams1)
		
		return PageTimerFromPropsOrNavigationParams1
	end, {})
	UseEdpFunctionallyReadyLoggerModule(UseMemoResult, UniverseId)
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppSessionService)
	local UseTokensResult = UseTokensFunction()
	local UseGetCurrentLegacyRouteResult = UseGetCurrentLegacyRouteFunction()
	local ReferralSourceFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "referralSource")
	local ExperienceJoinDataFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "experienceJoinData")
	local PlaceIdOverrideFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "placeIdOverride")
	ReactModule.useEffect(function()
		-- upvalues: GetSduiClientPageScopeFunction (upval), ExperienceDetailsPageKeyModule (copy), ReferralSourceFromPropsOrNavigationParams (copy), ExperienceJoinDataFromPropsOrNavigationParams (copy), PlaceIdOverrideFromPropsOrNavigationParams (copy), FilterPlayWithReward (upval), SduiEdpPageScopeIsTenFoot (upval), IsTenFoot (upval), IsTenFootInterfaceFunction (upval)
		local SduiClientPageScope = GetSduiClientPageScopeFunction(ExperienceDetailsPageKeyModule)
		SduiClientPageScope.set("referralSource", ReferralSourceFromPropsOrNavigationParams)
		SduiClientPageScope.set("experienceJoinData", ExperienceJoinDataFromPropsOrNavigationParams)
		SduiClientPageScope.set("placeId", PlaceIdOverrideFromPropsOrNavigationParams)
		SduiClientPageScope.set("launchSource", "ExperienceDetailsPage")
		SduiClientPageScope.set(FilterPlayWithReward, nil)
		
		if SduiEdpPageScopeIsTenFoot then
			SduiClientPageScope.set(IsTenFoot, IsTenFootInterfaceFunction())
		end
	end, {
		ExperienceDetailsPageKeyModule,
		ReferralSourceFromPropsOrNavigationParams,
		ExperienceJoinDataFromPropsOrNavigationParams,
		PlaceIdOverrideFromPropsOrNavigationParams
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseGetCurrentLegacyRouteResult (copy), UseNavigationResult (copy), RemoveGameDetailSessionIfDepartedModule (upval), UseRoactServiceResult (copy)
		local UseGetCurrentLegacyRouteResultResult = UseGetCurrentLegacyRouteResult()
		UseNavigationResult.goBack()
		RemoveGameDetailSessionIfDepartedModule(UseRoactServiceResult, UseGetCurrentLegacyRouteResultResult)
	end, {
		UseNavigationResult,
		UseRoactServiceResult,
		UseGetCurrentLegacyRouteResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UniverseId (copy), UseMemoResult (copy), FetchExperienceDetailsPageModule (upval)
		if UniverseId and UseMemoResult then
			FetchExperienceDetailsPageModule(UniverseId, UseMemoResult)
		end
	end, { UniverseId, UseMemoResult })
	local UseUiStatusResult = UseUiStatusFunction(ExperienceDetailsPageKeyModule)
	ReactModule.useEffect(function()
		-- upvalues: UseUiStatusResult (copy), UiStatus (upval), UniverseId (copy), DataHydrationModule (upval)
		if UseUiStatusResult == UiStatus.Error and UniverseId then
			DataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(UniverseId, function(p2): boolean
				return p2 == nil or p2.creator == nil
			end)
			DataHydrationModule.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(UniverseId)
		end
	end, { UseUiStatusResult, UniverseId })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UniverseId (copy), UseMemoResult (copy), FetchExperienceDetailsPageModule (upval)
		if UniverseId and UseMemoResult then
			FetchExperienceDetailsPageModule(UniverseId, UseMemoResult, true)
		end
	end, { UniverseId, UseMemoResult })
	local UseExperienceDetailsFocusNavigationModuleResult = UseExperienceDetailsFocusNavigationModule(UseResult)
	local UsePublishContainerWidthModuleResult = if FFlagSduiContainerQueries then UsePublishContainerWidthModule(ExperienceDetailsPageKeyModule, UseExperienceDetailsFocusNavigationModuleResult) else UseExperienceDetailsFocusNavigationModuleResult
	local IsUseLastInputResultMatch: boolean = if FFlagLuaAppMediaGalleryGamepadSupport then ResponsiveModule.useLastInput() == ResponsiveModule.Input.Directional else ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local IsHideCloseButtonOnHeader = if FFlagEnableSplitPaneEDPFix then p1.hideCloseButtonOnHeader == true else nil
	
	if FFlagEnableSplitPaneEDPFix then
		ReactModule.useEffect(function()
			-- upvalues: GetSduiClientPageScopeFunction (upval), ExperienceDetailsPageKeyModule (copy), ExperienceDetailsPageScopeFieldsModule (upval), IsHideCloseButtonOnHeader (copy)
			GetSduiClientPageScopeFunction(ExperienceDetailsPageKeyModule).set(ExperienceDetailsPageScopeFieldsModule.HideCloseButtonOnHeader, IsHideCloseButtonOnHeader)
		end, {
			ExperienceDetailsPageKeyModule,
			IsHideCloseButtonOnHeader
		})
	end
	local IsShowBottomActionBar: boolean? = nil
	local IsUseLastInputResultMatch1: boolean = IsUseLastInputResultMatch
	
	if FFlagEnableSplitPaneEDPFix then
		IsShowBottomActionBar = p1.showBottomActionBar == true
		IsUseLastInputResultMatch1 = IsUseLastInputResultMatch or IsShowBottomActionBar
	end
	return if UniverseId == nil then nil else ReactModule.createElement(DetailsPageLayout.Root, {
		ref = UsePublishContainerWidthModuleResult,
		onClose = if IsUseLastInputResultMatch1 or IsHideCloseButtonOnHeader then nil else UseResult,
		selectionGroup = SelectionGroup,
		fullBleedAspectRatio = if FFlagLuaAppMediaGalleryGamepadSupport and IsUseLastInputResultMatch and EdpBannerAspectRatioTenths > 0 then EdpBannerAspectRatioTenths / 10 else nil,
		fullBleedOverlapOffset = if FFlagLuaAppMediaGalleryGamepadSupport and IsUseLastInputResultMatch then EdpDirectionalFullBleedOverlapOffset else EdpFullBleedOverlapOffset,
		gradientTopBleedOffset = if FFlagLuaAppMediaGalleryGamepadSupport and IsUseLastInputResultMatch then EdpGradientTopBleedOffset else nil,
		gradientMidTransparency = if FFlagLuaAppEdpDirectionalGradientMidTransparency and FFlagLuaAppMediaGalleryGamepadSupport and IsUseLastInputResultMatch then EdpDirectionalGradientMidTransparencyHundredths / 100 else nil,
		bannerBottomVisiblePercent = if FFlagLuaAppMediaGalleryGamepadSupport and IsUseLastInputResultMatch then EdpDirectionalBannerBottomVisiblePercent / 100 else EdpBannerBottomVisiblePercent / 100,
		reserveHeaderBarSpace = (not FFlagLuaAppMediaGalleryGamepadSupport or not IsUseLastInputResultMatch) and nil,
		disableFocusNavEngineScroll = if FFlagLuaAppMediaGalleryGamepadSupport and IsUseLastInputResultMatch then true else nil,
		fullBleedContent = ReactModule.createElement(SduiFeatureEntryPoint, {
			appPage = AppPage.ExperienceDetail,
			configKey = ExperienceDetailsPageKeyModule,
			identifier = ExperienceDetailsPageConstantsModule.EDP_BANNER_IMAGE_IDENTIFIER,
			loadTimer = UseMemoResult,
			Size = UDim2.fromScale(1, 1),
			loadingSlot = ReactModule.createElement(ExperienceDetailsFallbackBannerImageModule.Skeleton),
			errorSlot = ReactModule.createElement(ExperienceDetailsFallbackBannerImageModule.Error, { universeId = UniverseId })
		})
	}, {
		Header = if IsUseLastInputResultMatch1 then nil else ReactModule.createElement(DetailsPageLayout.Header, {
			fullWidthContent = true,
			closeIconName = FoundationModule.Enums.IconName.X,
			backgroundColor = UseTokensResult.Color.Surface.Surface_300
		}, {
			StickyHeaderContent = ReactModule.createElement(SduiFeatureEntryPoint, {
				shouldDisplayLoading = false,
				shouldDisplayError = false,
				appPage = AppPage.ExperienceDetail,
				configKey = ExperienceDetailsPageKeyModule,
				identifier = ExperienceDetailsPageConstantsModule.EDP_STICKY_HEADER_IDENTIFIER,
				loadTimer = UseMemoResult,
				Size = UDim2.fromScale(1, 1),
				AutomaticSize = Enum.AutomaticSize.None
			})
		}),
		Content = ReactModule.createElement(DetailsPageLayout.Content, { scrollingFrameRef = UseRefResult }, {
			Feed = ReactModule.createElement(SduiPageEntryPoint, {
				includeNavigationHeaderBar = false,
				disableRootPadding = true,
				clipsDescendantsOverride = false,
				snackbarPortalLayoutOrder = 2147483647,
				appPage = AppPage.ExperienceDetail,
				configKey = ExperienceDetailsPageKeyModule,
				identifier = if FFlagSduiPageEntryUseSharedHooks then ExperienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER else ExperienceDetailsPageUtilsModule.getResolvedIdentifier(ExperienceDetailsPageKeyModule, ExperienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER_SUFFIX),
				pageTimer = UseMemoResult,
				scrollingFrameRef = UseRefResult,
				scrollToSelectionRevealOnly = if FFlagLuaAppMediaGalleryGamepadSupport and IsUseLastInputResultMatch then true else nil,
				backgroundStyle = UseTokensResult.Color.None,
				contentTag = CompositionTags.ContentRegion.Body,
				loadingSlot = ReactModule.createElement(ExperienceDetailsFallbackFeedModule.Skeleton, {
					launchSource = "ExperienceDetailsPage",
					isSmallScreen = false,
					universeId = UniverseId,
					referralSource = ReferralSourceFromPropsOrNavigationParams,
					experienceJoinData = ExperienceJoinDataFromPropsOrNavigationParams,
					placeIdOverride = PlaceIdOverrideFromPropsOrNavigationParams
				}),
				errorSlot = ReactModule.createElement(ExperienceDetailsFallbackFeedModule.Error, {
					launchSource = "ExperienceDetailsPage",
					isSmallScreen = false,
					universeId = UniverseId,
					refresh = UseResult1,
					referralSource = ReferralSourceFromPropsOrNavigationParams,
					experienceJoinData = ExperienceJoinDataFromPropsOrNavigationParams,
					placeIdOverride = PlaceIdOverrideFromPropsOrNavigationParams
				})
			})
		}),
		Actions = if FFlagEnableSplitPaneEDPFix and IsShowBottomActionBar then ReactModule.createElement(DetailsPageLayout.Actions, {}, {
			ActionBar = ReactModule.createElement(ExperienceDetailsPersistentActionBarModule, {
				launchSource = "ExperienceDetailsPage",
				showOutline = false,
				universeId = UniverseId,
				configKey = ExperienceDetailsPageKeyModule,
				loadTimer = UseMemoResult,
				referralSource = ReferralSourceFromPropsOrNavigationParams,
				experienceJoinData = ExperienceJoinDataFromPropsOrNavigationParams,
				placeIdOverride = PlaceIdOverrideFromPropsOrNavigationParams
			})
		}) else nil
	})
end)