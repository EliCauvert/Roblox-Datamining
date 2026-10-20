local Parent = script:FindFirstAncestor("GameDetail").Parent
local ExperienceDetailsPageUtilsModule = require(script.Parent.ExperienceDetailsPageUtils)
local ExperienceDetailsPageConstantsModule = require(script.Parent.ExperienceDetailsPageConstants)
local FetchExperienceDetailsPageModule = require(script.Parent.fetchExperienceDetailsPage)
local GetExperienceDetailsPageKeyModule = require(script.Parent.getExperienceDetailsPageKey)
local PeekViewTopBarModule = require(script.Parent.PeekViewTopBar)
local UseEdpFunctionallyReadyLoggerModule = require(script.Parent.useEdpFunctionallyReadyLogger)
local UseMotionJitterMetricModule = require(script.Parent.useMotionJitterMetric)
local ExperienceDetailsFallbackActionBarModule = require(script.Parent.Fallback.ExperienceDetailsFallbackActionBar)
local ExperienceDetailsFallbackFeedModule = require(script.Parent.Fallback.ExperienceDetailsFallbackFeed)
local SetTabBarVisibleFunction = require(Parent.AppTabBarRodux).Actions.SetTabBarVisible
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local GameDetailsPeekViewEventsFunction = require(Parent.DiscoveryAnalytics).Events.gameDetailsPeekViewEvents
local _ = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local PeekViewModule = require(Parent.PeekView)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local PeekViewWithTopBar = PeekViewModule.PeekViewWithTopBar
local PeekViewState = PeekViewModule.PeekViewState
local GetSafeAreaSizeFunction = require(Parent.InputUi).getSafeAreaSize
local UseDeviceInsetsFunction = require(Parent.Responsive).useDeviceInsets
local DataHydrationModule = require(Parent.DataHydration)
local UseTopBarHeightFunction = require(Parent.RobloxAppHooks).useTopBarHeight
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local AppSessionService = RoactServiceTagsModule.AppSessionService
local SessionType = require(Parent.RobloxAppSessionization).SessionType
local AppPage = require(Parent.RobloxAppEnums).AppPage
local RoactUtilsModule = require(Parent.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local EDPTTIConstants = require(Parent.GameDetailTelemetry).EDPTTIConstants
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local GetSduiClientPageScopeFunction = SduiSharedUtilitiesModule.getSduiClientPageScope
local SduiSurfaceLoadTimeTracker = SduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local UsePageScopeRefFunction = SduiSharedUtilitiesModule.usePageScopeRef
local SduiFeatureEntryPoint = SduiSharedUtilitiesModule.SduiFeatureEntryPoint
local SduiPageEntryPoint = SduiSharedUtilitiesModule.SduiPageEntryPoint
local UiStatus = SduiSharedUtilitiesModule.UiStatus
local UseUiStatusFunction = SduiSharedUtilitiesModule.useUiStatus
local UseEntrySurfacingFunction = SduiSharedUtilitiesModule.useEntrySurfacing
local FilterPlayWithReward = require(script.Parent.ExperienceDetailsPageScopeFields).FilterPlayWithReward
local CompositionTags = require(Parent.AppComposition).CompositionTags
local ExperienceDetailsPersistentActionBarModule = require(script.Parent.ExperienceDetailsPersistentActionBar)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiPageEntryUseSharedHooks = SharedFlagsModule.FFlagSduiPageEntryUseSharedHooks
local FFlagSduiPageEntrySurfacing = SharedFlagsModule.FFlagSduiPageEntrySurfacing
local FFlagLuaAppSduiEdpHideSystemBarOnPeekViewMount = SharedFlagsModule.FFlagLuaAppSduiEdpHideSystemBarOnPeekViewMount
local FFlagSduiEdpPageScopeTimerFix = SharedFlagsModule.FFlagSduiEdpPageScopeTimerFix
local FFlagSduiPlayWithRewardGapFix = SharedFlagsModule.FFlagSduiPlayWithRewardGapFix
local FFlagEnableMotionJitterMetric = SharedFlagsModule.FFlagEnableMotionJitterMetric
local FFlagSduiEdpPersistentActionBarPlayButton = SharedFlagsModule.FFlagSduiEdpPersistentActionBarPlayButton
local FFlagSduiEdpActionBarJitterFix = SharedFlagsModule.FFlagSduiEdpActionBarJitterFix

return ReactModule.memo(function(PageProps)
	-- upvalues: ExperienceDetailsPageUtilsModule (copy), GetExperienceDetailsPageKeyModule (copy), FFlagSduiEdpPageScopeTimerFix (copy), UsePageScopeRefFunction (copy), ReactModule (copy), SduiSurfaceLoadTimeTracker (copy), EDPTTIConstants (copy), GetSduiClientPageScopeFunction (copy), UseEdpFunctionallyReadyLoggerModule (copy), UseTokensFunction (copy), UseNavigationFunction (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), AppSessionService (copy), UseDispatchFunction (copy), FFlagLuaAppSduiEdpHideSystemBarOnPeekViewMount (copy), SetTabBarVisibleFunction (copy), FFlagSduiPlayWithRewardGapFix (copy), FilterPlayWithReward (copy), UseTopBarHeightFunction (copy), UseScreenSizeFunction (copy), UseDeviceInsetsFunction (copy), GetSafeAreaSizeFunction (copy), FFlagSduiEdpActionBarJitterFix (copy), DiscoveryTypesModule (copy), FFlagSduiPageEntrySurfacing (copy), UseEntrySurfacingFunction (copy), ExperienceDetailsPageConstantsModule (copy), UseSelectorFunction (copy), PeekViewState (copy), FFlagEnableMotionJitterMetric (copy), UseMotionJitterMetricModule (copy), AppPage (copy), SessionType (copy), FetchExperienceDetailsPageModule (copy), UseUiStatusFunction (copy), UiStatus (copy), DataHydrationModule (copy), GameDetailsPeekViewEventsFunction (copy), PeekViewWithTopBar (copy), PeekViewTopBarModule (copy), SduiPageEntryPoint (copy), FFlagSduiPageEntryUseSharedHooks (copy), CompositionTags (copy), ExperienceDetailsFallbackFeedModule (copy), FFlagSduiEdpPersistentActionBarPlayButton (copy), ExperienceDetailsPersistentActionBarModule (copy), SduiFeatureEntryPoint (copy), ExperienceDetailsFallbackActionBarModule (copy)
	local UniverseId = ExperienceDetailsPageUtilsModule.getUniverseId(PageProps)
	local AnalyticsSource = ExperienceDetailsPageUtilsModule.getAnalyticsSource(PageProps)
	local TilePositionIndex = ExperienceDetailsPageUtilsModule.getTilePositionIndex(PageProps)
	local OnPeekViewClosedFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(PageProps, "onPeekViewClosed")
	local ExperienceDetailsPageKeyModule = GetExperienceDetailsPageKeyModule(UniverseId)
	
	if FFlagSduiEdpPageScopeTimerFix then
		UsePageScopeRefFunction(ExperienceDetailsPageKeyModule)
	end
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ExperienceDetailsPageUtilsModule (upval), PageProps (copy), FFlagSduiEdpPageScopeTimerFix (upval), SduiSurfaceLoadTimeTracker (upval), ExperienceDetailsPageKeyModule (copy), EDPTTIConstants (upval), GetSduiClientPageScopeFunction (upval)
		local PageTimerFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(PageProps, "pageTimer")
		
		if FFlagSduiEdpPageScopeTimerFix then
			local PageTimerFromPropsOrNavigationParams1 = PageTimerFromPropsOrNavigationParams or SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(ExperienceDetailsPageKeyModule, {
				manualSurfaceReady = true,
				eventName = EDPTTIConstants.EDP_TTI_EVENT_NAME,
				metadata = {
					page = "Untracked",
					category = EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_PEEK_VIEW
				}
			})
			GetSduiClientPageScopeFunction(ExperienceDetailsPageKeyModule).set(SduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, PageTimerFromPropsOrNavigationParams1)
			
			return PageTimerFromPropsOrNavigationParams1
		else
			return if PageTimerFromPropsOrNavigationParams then PageTimerFromPropsOrNavigationParams else SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(ExperienceDetailsPageKeyModule, {
				manualSurfaceReady = true,
				eventName = EDPTTIConstants.EDP_TTI_EVENT_NAME,
				metadata = {
					page = "Untracked",
					category = EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_PEEK_VIEW
				}
			})
		end
	end, {})
	UseEdpFunctionallyReadyLoggerModule(UseMemoResult, UniverseId)
	local UseTokensResult = UseTokensFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppSessionService)
	local UseDispatchResult = UseDispatchFunction()
	
	if FFlagLuaAppSduiEdpHideSystemBarOnPeekViewMount then
		ReactModule.useEffect(function()
			-- upvalues: UseDispatchResult (copy), SetTabBarVisibleFunction (upval)
			UseDispatchResult(SetTabBarVisibleFunction(false))
		end, { UseDispatchResult })
	end
	local ReferralSourceFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(PageProps, "referralSource")
	local ExperienceJoinDataFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(PageProps, "experienceJoinData")
	local PlaceIdOverrideFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(PageProps, "placeIdOverride")
	
	if not FFlagSduiEdpPageScopeTimerFix then
		UsePageScopeRefFunction(ExperienceDetailsPageKeyModule)
	end
	ReactModule.useEffect(function()
		-- upvalues: GetSduiClientPageScopeFunction (upval), ExperienceDetailsPageKeyModule (copy), ReferralSourceFromPropsOrNavigationParams (copy), ExperienceJoinDataFromPropsOrNavigationParams (copy), PlaceIdOverrideFromPropsOrNavigationParams (copy), FFlagSduiPlayWithRewardGapFix (upval), FilterPlayWithReward (upval)
		local SduiClientPageScope = GetSduiClientPageScopeFunction(ExperienceDetailsPageKeyModule)
		SduiClientPageScope.set("referralSource", ReferralSourceFromPropsOrNavigationParams)
		SduiClientPageScope.set("experienceJoinData", ExperienceJoinDataFromPropsOrNavigationParams)
		SduiClientPageScope.set("placeId", PlaceIdOverrideFromPropsOrNavigationParams)
		SduiClientPageScope.set("launchSource", "LuaGameCard")
		
		if FFlagSduiPlayWithRewardGapFix then
			SduiClientPageScope.set(FilterPlayWithReward, nil)
		end
	end, {
		ExperienceDetailsPageKeyModule,
		ReferralSourceFromPropsOrNavigationParams,
		ExperienceJoinDataFromPropsOrNavigationParams,
		PlaceIdOverrideFromPropsOrNavigationParams
	})
	local UseTopBarHeightResult = UseTopBarHeightFunction()
	local Smallest = math.min(GetSafeAreaSizeFunction(UseScreenSizeFunction(), (UseDeviceInsetsFunction())).X.Offset, 640)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: FFlagSduiEdpActionBarJitterFix (upval), UseTokensResult (copy), DiscoveryTypesModule (upval)
		return if FFlagSduiEdpActionBarJitterFix then UseTokensResult.Padding.Medium + UseTokensResult.Size.Size_1200 else DiscoveryTypesModule.Constants.GAME_DETAILS_ACTION_BAR_HEIGHT
	end)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: FFlagSduiEdpActionBarJitterFix (upval), UseTokensResult (copy), UseStateResult2 (copy)
		local Y = Frame.AbsoluteSize.Y
		
		if FFlagSduiEdpActionBarJitterFix and Y > 0 then
			local NewMedium = UseTokensResult.Padding.Medium + UseTokensResult.Size.Size_1200
			
			if Y <= NewMedium + UseTokensResult.Padding.Medium then
				Y = NewMedium
			end
		end
		if Y > 0 then
			UseStateResult2(Y)
		end
	end, { UseTokensResult })
	local PeekView = if FFlagSduiPageEntrySurfacing then UseEntrySurfacingFunction(ExperienceDetailsPageKeyModule, ExperienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER, "peekView") else nil
	local _UDim = UDim.new(0, Smallest + UseStateResult + (PeekView and PeekView.heightOffset or 0))
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.GameDetailsPeekView.viewState
	end)
	local MountAsFullViewFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(PageProps, "mountAsFullView")
	local IsUseSelectorResultMatch = if MountAsFullViewFromPropsOrNavigationParams == nil then UseSelectorResult == PeekViewState.Full or UseSelectorResult == PeekViewState.Extended else MountAsFullViewFromPropsOrNavigationParams
	local IsUseSelectorResultMatch1 = UseSelectorResult == PeekViewState.Closed
	
	if FFlagEnableMotionJitterMetric then
		UseMotionJitterMetricModule(UseRefResult, "peekView", true, "CanvasPosition")
	end
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: OnPeekViewClosedFromPropsOrNavigationParams (copy), UseNavigationResult (copy), AppPage (upval), UseRoactServiceResult1 (copy), SessionType (upval)
		if OnPeekViewClosedFromPropsOrNavigationParams and typeof(OnPeekViewClosedFromPropsOrNavigationParams) == "function" then
			OnPeekViewClosedFromPropsOrNavigationParams()
		end
		UseNavigationResult.clearAppScreens({ AppPage.GameDetail })
		
		if UseRoactServiceResult1 then
			UseRoactServiceResult1:RemoveSession(SessionType.StructuralIdentifier.GameDetailSource)
		end
	end, {
		UseNavigationResult, UseRoactServiceResult1,
		OnPeekViewClosedFromPropsOrNavigationParams, UniverseId, AnalyticsSource,
		TilePositionIndex
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
			DataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(UniverseId, function(p1): boolean
				return p1 == nil or p1.creator == nil
			end)
			DataHydrationModule.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(UniverseId)
		end
	end, { UseUiStatusResult, UniverseId })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UniverseId (copy), UseMemoResult (copy), FetchExperienceDetailsPageModule (upval)
		if UniverseId and UseMemoResult then
			FetchExperienceDetailsPageModule(UniverseId, UseMemoResult, true)
		end
	end, { UniverseId, UseMemoResult })
	local UseResult3 = ReactModule.useCallback(function(ViewState, Brief)
		-- upvalues: UniverseId (copy), PeekViewState (upval), UseSelectorResult (copy), GameDetailsPeekViewEventsFunction (upval), UseRoactServiceResult (copy), AnalyticsSource (copy), TilePositionIndex (copy), UseDispatchResult (copy), UseResult1 (copy)
		local UniverseId1 = UniverseId or ""
		
		if UniverseId and ViewState == PeekViewState.Brief then
			if UseSelectorResult == PeekViewState.Brief then
				GameDetailsPeekViewEventsFunction(UseRoactServiceResult, "SwitchGame", UniverseId1, AnalyticsSource, TilePositionIndex)
			elseif Brief == PeekViewState.Closed then
				GameDetailsPeekViewEventsFunction(UseRoactServiceResult, "OpenPeekView", UniverseId1, AnalyticsSource, TilePositionIndex)
			end
		end
		UseDispatchResult({
			type = "SetGameDetailsPeekViewState",
			viewState = ViewState
		})
		
		if UniverseId and ViewState == PeekViewState.Full and Brief == PeekViewState.Brief then
			GameDetailsPeekViewEventsFunction(UseRoactServiceResult, "GoToFullView", UniverseId1, AnalyticsSource, TilePositionIndex)
		end
		if ViewState == PeekViewState.Closed then
			UseResult1()
		end
	end, {
		UseDispatchResult, UseRoactServiceResult, UniverseId, AnalyticsSource,
		TilePositionIndex, UseSelectorResult, UseResult1
	})
	
	return if UniverseId == nil then nil else ReactModule.createElement(PeekViewWithTopBar, {
		topBarHeight = UseTopBarHeightResult,
		bottomDockedContainerHeight = UseStateResult,
		fullViewContentHeight = UDim.new(1, -UseTopBarHeightResult),
		briefViewContentHeight = _UDim,
		onViewStateChanged = UseResult3,
		viewChangedEventMeta = {
			universeId = UniverseId,
			source = AnalyticsSource,
			index = TilePositionIndex
		},
		mountAsFullView = IsUseSelectorResultMatch,
		mountAnimation = IsUseSelectorResultMatch1,
		scrollingFrameRef = UseRefResult,
		topBarSlot = ReactModule.createElement(PeekViewTopBarModule, { pageProps = PageProps, onClose = UseResult1 }),
		contentSlot = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Content = ReactModule.createElement(SduiPageEntryPoint, {
				includeNavigationHeaderBar = false,
				snackbarPortalLayoutOrder = 2147483647,
				appPage = AppPage.GameDetail,
				configKey = ExperienceDetailsPageKeyModule,
				identifier = if FFlagSduiPageEntryUseSharedHooks then ExperienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER else ExperienceDetailsPageUtilsModule.getResolvedIdentifier(ExperienceDetailsPageKeyModule, ExperienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER_SUFFIX),
				pageTimer = UseMemoResult,
				backgroundStyle = UseTokensResult.Color.Surface.Surface_100,
				scrollingFrameRef = UseRefResult,
				contentTag = CompositionTags.ContentRegion.Body,
				loadingSlot = ReactModule.createElement(ExperienceDetailsFallbackFeedModule.Skeleton, {
					isSmallScreen = true,
					launchSource = "LuaGameCard",
					universeId = UniverseId
				}),
				errorSlot = ReactModule.createElement(ExperienceDetailsFallbackFeedModule.Error, {
					isSmallScreen = true,
					launchSource = "LuaGameCard",
					universeId = UniverseId,
					refresh = UseResult2,
					referralSource = ReferralSourceFromPropsOrNavigationParams,
					experienceJoinData = ExperienceJoinDataFromPropsOrNavigationParams,
					placeIdOverride = PlaceIdOverrideFromPropsOrNavigationParams
				})
			})
		}),
		bottomBarSlot = if FFlagSduiEdpPersistentActionBarPlayButton then ReactModule.createElement(ExperienceDetailsPersistentActionBarModule, {
			launchSource = "LuaGameCard",
			universeId = UniverseId,
			configKey = ExperienceDetailsPageKeyModule,
			loadTimer = UseMemoResult,
			referralSource = ReferralSourceFromPropsOrNavigationParams,
			experienceJoinData = ExperienceJoinDataFromPropsOrNavigationParams,
			placeIdOverride = PlaceIdOverrideFromPropsOrNavigationParams,
			onAbsoluteSizeChange = UseResult
		}) else ReactModule.createElement(SduiFeatureEntryPoint, {
			appPage = AppPage.GameDetail,
			configKey = ExperienceDetailsPageKeyModule,
			identifier = ExperienceDetailsPageConstantsModule.EDP_ACTION_BAR_IDENTIFIER,
			loadTimer = UseMemoResult,
			AutomaticSize = Enum.AutomaticSize.XY,
			onAbsoluteSizeChange = UseResult,
			loadingSlot = ReactModule.createElement(ExperienceDetailsFallbackActionBarModule.Skeleton, {
				launchSource = "LuaGameCard",
				universeId = UniverseId,
				referralSource = ReferralSourceFromPropsOrNavigationParams,
				experienceJoinData = ExperienceJoinDataFromPropsOrNavigationParams,
				placeIdOverride = PlaceIdOverrideFromPropsOrNavigationParams
			}),
			errorSlot = ReactModule.createElement(ExperienceDetailsFallbackActionBarModule.Error, {
				launchSource = "LuaGameCard",
				universeId = UniverseId,
				referralSource = ReferralSourceFromPropsOrNavigationParams,
				experienceJoinData = ExperienceJoinDataFromPropsOrNavigationParams,
				placeIdOverride = PlaceIdOverrideFromPropsOrNavigationParams
			})
		})
	})
end)