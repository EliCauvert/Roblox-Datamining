local GameDetail = script:FindFirstAncestor("GameDetail")
local Parent = GameDetail.Parent
local FFlagSduiEdpRenderStartedModule = require(GameDetail.Flags.FFlagSduiEdpRenderStarted)
local ExperienceDetailsPageUtilsModule = require(script.Parent.ExperienceDetailsPageUtils)
local ExperienceDetailsPageConstantsModule = require(script.Parent.ExperienceDetailsPageConstants)
local ExperienceDetailsBottomSheetTopBarModule = require(script.Parent.ExperienceDetailsBottomSheetTopBar)
local FetchExperienceDetailsPageModule = require(script.Parent.fetchExperienceDetailsPage)
local GetExperienceDetailsPageKeyModule = require(script.Parent.getExperienceDetailsPageKey)
local RemoveGameDetailSessionIfDepartedModule = require(script.Parent.removeGameDetailSessionIfDeparted)
local UseEdpFunctionallyReadyLoggerModule = require(script.Parent.useEdpFunctionallyReadyLogger)
local CreateExperienceDetailsPageTimerModule = require(script.Parent.createExperienceDetailsPageTimer)
local UseMotionJitterMetricModule = require(script.Parent.useMotionJitterMetric)
local UsePublishContainerWidthModule = require(script.Parent.usePublishContainerWidth)
local ExperienceDetailsFallbackActionBarModule = require(script.Parent.Fallback.ExperienceDetailsFallbackActionBar)
local ExperienceDetailsFallbackFeedModule = require(script.Parent.Fallback.ExperienceDetailsFallbackFeed)
local SetTabBarVisibleFunction = require(Parent.AppTabBarRodux).Actions.SetTabBarVisible
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local GameDetailsPeekViewEventsFunction = require(Parent.DiscoveryAnalytics).Events.gameDetailsPeekViewEvents
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Sheet = FoundationModule.Sheet
local OverlayProvider = FoundationModule.OverlayProvider
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local GetSafeAreaSizeFunction = require(Parent.InputUi).getSafeAreaSize
local UseDeviceInsetsFunction = require(Parent.Responsive).useDeviceInsets
local DataHydrationModule = require(Parent.DataHydration)
local UseTopBarHeightFunction = require(Parent.RobloxAppHooks).useTopBarHeight
local ShouldUseDeviceSafeInsets = require(Parent.Display).shouldUseDeviceSafeInsets
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local AppSessionService = RoactServiceTagsModule.AppSessionService
local SessionType = require(Parent.RobloxAppSessionization).SessionType
local AppPage = require(Parent.RobloxAppEnums).AppPage
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseStoreFunction = RoactUtilsModule.Hooks.RoactRodux.useStore
local UseGetCurrentLegacyRouteFunction = require(Parent.DiscoveryRouting).useGetCurrentLegacyRoute
local HasPageInCurrentRouteFunction = require(Parent.DiscoveryRouting).hasPageInCurrentRoute
local PeekViewState = require(Parent.PeekView).PeekViewState
local SetGameDetailsPeekViewStateModule = require(GameDetail.PeekView.SetGameDetailsPeekViewState)
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
local FFlagSduiContainerQueries = SharedFlagsModule.FFlagSduiContainerQueries
local FFlagEDPTTIParityDefinitions = SharedFlagsModule.FFlagEDPTTIParityDefinitions
local FFlagSduiPageEntryUseSharedHooks = SharedFlagsModule.FFlagSduiPageEntryUseSharedHooks
local FFlagEnableExperienceDetailsBottomSheetTopBar = SharedFlagsModule.FFlagEnableExperienceDetailsBottomSheetTopBar
local FFlagEnableMotionJitterMetric = SharedFlagsModule.FFlagEnableMotionJitterMetric
local FFlagSduiEdpPersistentActionBarPlayButton = SharedFlagsModule.FFlagSduiEdpPersistentActionBarPlayButton
local FFlagLuaAppEdpBottomSheetPeekViewEvents = SharedFlagsModule.FFlagLuaAppEdpBottomSheetPeekViewEvents
local FFlagSduiPlayWithRewardRefactor = SharedFlagsModule.FFlagSduiPlayWithRewardRefactor
local FFlagFixOverlayTopInsetForDeviceSafeInsets = SharedFlagsModule.FFlagFixOverlayTopInsetForDeviceSafeInsets

local function _(p1): number
	return if p1 then 2 else 1
end

return ReactModule.memo(function(p1)
	-- upvalues: ExperienceDetailsPageUtilsModule (copy), GetExperienceDetailsPageKeyModule (copy), UsePageScopeRefFunction (copy), ReactModule (copy), FFlagEDPTTIParityDefinitions (copy), CreateExperienceDetailsPageTimerModule (copy), EDPTTIConstants (copy), SduiSurfaceLoadTimeTracker (copy), GetSduiClientPageScopeFunction (copy), FFlagSduiEdpRenderStartedModule (copy), UseEdpFunctionallyReadyLoggerModule (copy), UseTokensFunction (copy), UseNavigationFunction (copy), UseRoactServiceFunction (copy), AppSessionService (copy), UseDispatchFunction (copy), FFlagLuaAppEdpBottomSheetPeekViewEvents (copy), AppEventIngestService (copy), UseGetCurrentLegacyRouteFunction (copy), SetTabBarVisibleFunction (copy), FFlagSduiPlayWithRewardRefactor (copy), FilterPlayWithReward (copy), FFlagEnableExperienceDetailsBottomSheetTopBar (copy), UseTopBarHeightFunction (copy), UseScreenSizeFunction (copy), UseDeviceInsetsFunction (copy), FFlagFixOverlayTopInsetForDeviceSafeInsets (copy), ShouldUseDeviceSafeInsets (copy), GetSafeAreaSizeFunction (copy), FFlagSduiContainerQueries (copy), UsePublishContainerWidthModule (copy), DiscoveryTypesModule (copy), UseEntrySurfacingFunction (copy), ExperienceDetailsPageConstantsModule (copy), UseStoreFunction (copy), PeekViewState (copy), GameDetailsPeekViewEventsFunction (copy), SetGameDetailsPeekViewStateModule (copy), HasPageInCurrentRouteFunction (copy), AppPage (copy), FFlagEnableMotionJitterMetric (copy), UseMotionJitterMetricModule (copy), RemoveGameDetailSessionIfDepartedModule (copy), SessionType (copy), FetchExperienceDetailsPageModule (copy), UseUiStatusFunction (copy), UiStatus (copy), DataHydrationModule (copy), OverlayProvider (copy), ExperienceDetailsBottomSheetTopBarModule (copy), Sheet (copy), FoundationModule (copy), SduiPageEntryPoint (copy), FFlagSduiPageEntryUseSharedHooks (copy), CompositionTags (copy), ExperienceDetailsFallbackFeedModule (copy), FFlagSduiEdpPersistentActionBarPlayButton (copy), ExperienceDetailsPersistentActionBarModule (copy), SduiFeatureEntryPoint (copy), ExperienceDetailsFallbackActionBarModule (copy)
	local UniverseId = ExperienceDetailsPageUtilsModule.getUniverseId(p1)
	local OnPeekViewClosedFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "onPeekViewClosed")
	local ExperienceDetailsPageKeyModule = GetExperienceDetailsPageKeyModule(UniverseId)
	UsePageScopeRefFunction(ExperienceDetailsPageKeyModule)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ExperienceDetailsPageUtilsModule (upval), p1 (copy), FFlagEDPTTIParityDefinitions (upval), CreateExperienceDetailsPageTimerModule (upval), ExperienceDetailsPageKeyModule (copy), EDPTTIConstants (upval), SduiSurfaceLoadTimeTracker (upval), GetSduiClientPageScopeFunction (upval)
		local PageTimerFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "pageTimer")
		local PageTimerFromPropsOrNavigationParams1 = if FFlagEDPTTIParityDefinitions then PageTimerFromPropsOrNavigationParams or CreateExperienceDetailsPageTimerModule(ExperienceDetailsPageKeyModule, {
			page = "Untracked",
			category = EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_PEEK_VIEW
		}) else PageTimerFromPropsOrNavigationParams or SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(ExperienceDetailsPageKeyModule, {
			manualSurfaceReady = true,
			eventName = EDPTTIConstants.EDP_TTI_EVENT_NAME,
			metadata = {
				page = "Untracked",
				category = EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_PEEK_VIEW
			}
		})
		GetSduiClientPageScopeFunction(ExperienceDetailsPageKeyModule).set(SduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, PageTimerFromPropsOrNavigationParams1)
		
		return PageTimerFromPropsOrNavigationParams1
	end, {})
	
	if FFlagSduiEdpRenderStartedModule then
		UseMemoResult.logRenderStarted()
	end
	UseEdpFunctionallyReadyLoggerModule(UseMemoResult, UniverseId)
	local UseTokensResult = UseTokensFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppSessionService)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult1 = if FFlagLuaAppEdpBottomSheetPeekViewEvents then UseRoactServiceFunction(AppEventIngestService) else nil
	local UseGetCurrentLegacyRouteResult = UseGetCurrentLegacyRouteFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), SetTabBarVisibleFunction (upval)
		UseDispatchResult(SetTabBarVisibleFunction(false))
	end, { UseDispatchResult })
	local ReferralSourceFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "referralSource")
	local ExperienceJoinDataFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "experienceJoinData")
	local PlaceIdOverrideFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "placeIdOverride")
	ReactModule.useEffect(function()
		-- upvalues: GetSduiClientPageScopeFunction (upval), ExperienceDetailsPageKeyModule (copy), ReferralSourceFromPropsOrNavigationParams (copy), ExperienceJoinDataFromPropsOrNavigationParams (copy), PlaceIdOverrideFromPropsOrNavigationParams (copy), FFlagSduiPlayWithRewardRefactor (upval), FilterPlayWithReward (upval)
		local SduiClientPageScope = GetSduiClientPageScopeFunction(ExperienceDetailsPageKeyModule)
		SduiClientPageScope.set("referralSource", ReferralSourceFromPropsOrNavigationParams)
		SduiClientPageScope.set("experienceJoinData", ExperienceJoinDataFromPropsOrNavigationParams)
		SduiClientPageScope.set("placeId", PlaceIdOverrideFromPropsOrNavigationParams)
		SduiClientPageScope.set("launchSource", "LuaGameCard")
		
		if FFlagSduiPlayWithRewardRefactor then
			SduiClientPageScope.set(FilterPlayWithReward, nil)
		end
	end, {
		ExperienceDetailsPageKeyModule,
		ReferralSourceFromPropsOrNavigationParams,
		ExperienceJoinDataFromPropsOrNavigationParams,
		PlaceIdOverrideFromPropsOrNavigationParams
	})
	local UseTopBarHeightResult = if FFlagEnableExperienceDetailsBottomSheetTopBar then UseTopBarHeightFunction() else nil
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	
	if FFlagEnableExperienceDetailsBottomSheetTopBar and FFlagFixOverlayTopInsetForDeviceSafeInsets and ShouldUseDeviceSafeInsets then
		UseTopBarHeightResult += UseDeviceInsetsResult.top
	end
	local SafeAreaSize = GetSafeAreaSizeFunction(UseScreenSizeResult, UseDeviceInsetsResult)
	local Smallest = math.min(SafeAreaSize.X.Offset, 640)
	local UsePublishContainerWidthModuleResult = if FFlagSduiContainerQueries then UsePublishContainerWidthModule(ExperienceDetailsPageKeyModule) else nil
	local UseRefResult = if FFlagEnableExperienceDetailsBottomSheetTopBar then ReactModule.useRef(nil) else nil
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(DiscoveryTypesModule.Constants.GAME_DETAILS_ACTION_BAR_HEIGHT)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2_1 (copy)
		local Y: number = Frame.AbsoluteSize.Y
		
		if Y > 0 then
			UseStateResult2_1(Y)
		end
	end, {})
	local PeekView = UseEntrySurfacingFunction(ExperienceDetailsPageKeyModule, ExperienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER, "peekView")
	local HeightOffset = PeekView and PeekView.heightOffset or 0
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: Smallest (copy), UseStateResult1 (copy), HeightOffset (copy), FFlagEnableExperienceDetailsBottomSheetTopBar (upval), UseScreenSizeResult (copy), UseDeviceInsetsResult (copy), UseTopBarHeightResult (ref), SafeAreaSize (copy)
		return {
			Smallest + UseStateResult1 + HeightOffset + 25,
			if FFlagEnableExperienceDetailsBottomSheetTopBar then math.ceil(UseScreenSizeResult.Y) - UseDeviceInsetsResult.bottom - UseTopBarHeightResult else SafeAreaSize.Y.Offset
		}
	end, if FFlagEnableExperienceDetailsBottomSheetTopBar then {
		Smallest, UseStateResult1, HeightOffset, UseScreenSizeResult.Y,
		UseDeviceInsetsResult.bottom, UseTopBarHeightResult
	} else {
		Smallest,
		UseStateResult1,
		HeightOffset,
		SafeAreaSize.Y.Offset
	})
	local MountAsFullViewFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "mountAsFullView")
	local IsMountAsFullViewFromPropsOrNavigationParams = MountAsFullViewFromPropsOrNavigationParams == true
	local UseResult1 = nil
	
	if FFlagLuaAppEdpBottomSheetPeekViewEvents then
		local UseStoreResult = UseStoreFunction()
		local AnalyticsSource = ExperienceDetailsPageUtilsModule.getAnalyticsSource(p1)
		local TilePositionIndex = ExperienceDetailsPageUtilsModule.getTilePositionIndex(p1)
		local UseMemoResult2 = ReactModule.useMemo(function()
			-- upvalues: UseStoreResult (copy)
			return UseStoreResult:getState().GameDetailsPeekView.viewState
		end, {})
		IsMountAsFullViewFromPropsOrNavigationParams = if MountAsFullViewFromPropsOrNavigationParams == nil then UseMemoResult2 == PeekViewState.Full or UseMemoResult2 == PeekViewState.Extended else MountAsFullViewFromPropsOrNavigationParams == true
		ReactModule.useEffect(function()
			-- upvalues: UniverseId (copy), IsMountAsFullViewFromPropsOrNavigationParams (ref), UseMemoResult2 (copy), PeekViewState (upval), GameDetailsPeekViewEventsFunction (upval), UseRoactServiceResult1 (ref), AnalyticsSource (copy), TilePositionIndex (copy), ExperienceDetailsPageConstantsModule (upval), UseDispatchResult (copy), SetGameDetailsPeekViewStateModule (upval), HasPageInCurrentRouteFunction (upval), UseGetCurrentLegacyRouteResult (copy), AppPage (upval)
			if UniverseId and not IsMountAsFullViewFromPropsOrNavigationParams then
				local SwitchGame = if UseMemoResult2 == PeekViewState.Brief then "SwitchGame" elseif UseMemoResult2 == PeekViewState.Closed then "OpenPeekView" else nil
				
				if SwitchGame then
					GameDetailsPeekViewEventsFunction(UseRoactServiceResult1, SwitchGame, UniverseId, AnalyticsSource, TilePositionIndex, ExperienceDetailsPageConstantsModule.EDP_BOTTOM_SHEET_SURFACE)
				end
			end
			UseDispatchResult(SetGameDetailsPeekViewStateModule(if IsMountAsFullViewFromPropsOrNavigationParams then PeekViewState.Full else PeekViewState.Brief))
			
			return function()
				-- upvalues: HasPageInCurrentRouteFunction (upval), UseGetCurrentLegacyRouteResult (upval), AppPage (upval), UseDispatchResult (upval), SetGameDetailsPeekViewStateModule (upval), PeekViewState (upval)
				if not HasPageInCurrentRouteFunction(UseGetCurrentLegacyRouteResult(), AppPage.GameDetail) then
					UseDispatchResult(SetGameDetailsPeekViewStateModule(PeekViewState.Closed))
				end
			end
		end, {})
		local UseRefResult2 = ReactModule.useRef(if IsMountAsFullViewFromPropsOrNavigationParams then 2 else 1)
		UseResult1 = ReactModule.useCallback(function(_, Current)
			-- upvalues: UseRefResult2 (copy), UseNavigationResult (copy), UseDispatchResult (copy), SetGameDetailsPeekViewStateModule (upval), PeekViewState (upval), UniverseId (copy), GameDetailsPeekViewEventsFunction (upval), UseRoactServiceResult1 (ref), AnalyticsSource (copy), TilePositionIndex (copy), ExperienceDetailsPageConstantsModule (upval)
			local Current1 = UseRefResult2.current
			UseRefResult2.current = Current
			
			if UseNavigationResult.isFocused() then
				UseDispatchResult(SetGameDetailsPeekViewStateModule(if Current == 2 then PeekViewState.Full else PeekViewState.Brief))
			end
			if UniverseId and Current1 == 1 and Current == 2 then
				GameDetailsPeekViewEventsFunction(UseRoactServiceResult1, "GoToFullView", UniverseId, AnalyticsSource, TilePositionIndex, ExperienceDetailsPageConstantsModule.EDP_BOTTOM_SHEET_SURFACE)
			end
		end, {
			UseRoactServiceResult1, UniverseId, AnalyticsSource, TilePositionIndex,
			UseDispatchResult, UseNavigationResult
		})
	end
	local DefaultSnapPointIndex: number = if IsMountAsFullViewFromPropsOrNavigationParams then 2 else 1
	
	if FFlagEnableMotionJitterMetric then
		UseMotionJitterMetricModule(UseRefResult1, ExperienceDetailsPageConstantsModule.EDP_BOTTOM_SHEET_SURFACE, false, "AbsolutePosition")
	end
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), UseGetCurrentLegacyRouteResult (copy), OnPeekViewClosedFromPropsOrNavigationParams (copy), RemoveGameDetailSessionIfDepartedModule (upval), UseRoactServiceResult (copy)
		if UseNavigationResult.isFocused() then
			local UseGetCurrentLegacyRouteResultResult = UseGetCurrentLegacyRouteResult()
			
			if OnPeekViewClosedFromPropsOrNavigationParams and typeof(OnPeekViewClosedFromPropsOrNavigationParams) == "function" then
				OnPeekViewClosedFromPropsOrNavigationParams()
			end
			UseNavigationResult.goBack()
			RemoveGameDetailSessionIfDepartedModule(UseRoactServiceResult, UseGetCurrentLegacyRouteResultResult)
		end
	end, {
		UseNavigationResult,
		UseRoactServiceResult,
		OnPeekViewClosedFromPropsOrNavigationParams,
		UseGetCurrentLegacyRouteResult
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), OnPeekViewClosedFromPropsOrNavigationParams (copy), AppPage (upval), UseRoactServiceResult (copy), SessionType (upval)
		if UseNavigationResult.isFocused() then
			if OnPeekViewClosedFromPropsOrNavigationParams and typeof(OnPeekViewClosedFromPropsOrNavigationParams) == "function" then
				OnPeekViewClosedFromPropsOrNavigationParams()
			end
			UseNavigationResult.clearAppScreens({ AppPage.GameDetail })
			
			if UseRoactServiceResult then
				UseRoactServiceResult:RemoveSession(SessionType.StructuralIdentifier.GameDetailSource)
			end
		end
	end, {
		UseNavigationResult,
		UseRoactServiceResult,
		OnPeekViewClosedFromPropsOrNavigationParams
	})
	local UseResult4 = if FFlagLuaAppEdpBottomSheetPeekViewEvents then UseResult3 elseif IsMountAsFullViewFromPropsOrNavigationParams then UseResult2 else UseResult3
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
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UniverseId (copy), UseMemoResult (copy), FetchExperienceDetailsPageModule (upval)
		if UniverseId and UseMemoResult then
			FetchExperienceDetailsPageModule(UniverseId, UseMemoResult, true)
		end
	end, { UniverseId, UseMemoResult })
	
	return if UniverseId == nil then nil else ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ref = UseStateResult2
	}, {
		SheetProvider = UseStateResult and ReactModule.createElement(OverlayProvider, { gui = UseStateResult }, {
			TopBar = if FFlagEnableExperienceDetailsBottomSheetTopBar then ReactModule.createElement(ExperienceDetailsBottomSheetTopBarModule, {
				tokens = UseTokensResult,
				navigation = UseNavigationResult,
				deviceInsets = UseDeviceInsetsResult,
				topBarHeight = UseTopBarHeightResult,
				briefH = UseMemoResult1[1],
				fullH = UseMemoResult1[2],
				overlayFrame = UseStateResult,
				sheetContentRef = UseRefResult,
				shouldMountAsFullView = IsMountAsFullViewFromPropsOrNavigationParams,
				onBack = UseResult2,
				onClose = UseResult3
			}) else nil,
			SheetRoot = ReactModule.createElement(Sheet.Root, {
				isOpen = true,
				testId = "--experience-details-bottom-sheet",
				onClose = UseResult4,
				snapPoints = UseMemoResult1,
				defaultSnapPointIndex = DefaultSnapPointIndex,
				onSnapPointChanged = if FFlagLuaAppEdpBottomSheetPeekViewEvents then UseResult1 else nil
			}, {
				Content = ReactModule.createElement(Sheet.Content, {
					isContentFullBleed = true,
					scrollingFrameRef = UseRefResult1,
					ref = if FFlagEnableExperienceDetailsBottomSheetTopBar then UseRefResult else nil
				}, {
					ContentWrapper = ReactModule.createElement(FoundationModule.View, {
						tag = "col size-full-0 auto-y",
						ref = if FFlagSduiContainerQueries then UsePublishContainerWidthModuleResult else nil
					}, {
						Content = ReactModule.createElement(SduiPageEntryPoint, {
							includeNavigationHeaderBar = false,
							snackbarPortalLayoutOrder = 2147483647,
							appPage = AppPage.GameDetail,
							configKey = ExperienceDetailsPageKeyModule,
							identifier = if FFlagSduiPageEntryUseSharedHooks then ExperienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER else ExperienceDetailsPageUtilsModule.getResolvedIdentifier(ExperienceDetailsPageKeyModule, ExperienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER_SUFFIX),
							pageTimer = UseMemoResult,
							backgroundStyle = UseTokensResult.Color.Surface.Surface_100,
							scrollingFrameRef = UseRefResult1,
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
								refresh = UseResult5,
								referralSource = ReferralSourceFromPropsOrNavigationParams,
								experienceJoinData = ExperienceJoinDataFromPropsOrNavigationParams,
								placeIdOverride = PlaceIdOverrideFromPropsOrNavigationParams
							})
						})
					})
				}),
				Actions = ReactModule.createElement(Sheet.Actions, {}, {
					ActionBarWrapper = ReactModule.createElement(FoundationModule.View, {
						tag = "col size-full-0 auto-y",
						padding = UDim.new(0, -UseTokensResult.Margin.Small)
					}, {
						ActionBar = if FFlagSduiEdpPersistentActionBarPlayButton then ReactModule.createElement(ExperienceDetailsPersistentActionBarModule, {
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
				})
			})
		}) or nil
	})
end)