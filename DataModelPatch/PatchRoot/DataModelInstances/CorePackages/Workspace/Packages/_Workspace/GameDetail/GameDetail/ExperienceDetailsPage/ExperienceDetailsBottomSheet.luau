local Parent = script:FindFirstAncestor("GameDetail").Parent
local ExperienceDetailsPageUtilsModule = require(script.Parent.ExperienceDetailsPageUtils)
local ExperienceDetailsPageConstantsModule = require(script.Parent.ExperienceDetailsPageConstants)
local ExperienceDetailsBottomSheetTopBarModule = require(script.Parent.ExperienceDetailsBottomSheetTopBar)
local FetchExperienceDetailsPageModule = require(script.Parent.fetchExperienceDetailsPage)
local GetExperienceDetailsPageKeyModule = require(script.Parent.getExperienceDetailsPageKey)
local RemoveGameDetailSessionIfDepartedModule = require(script.Parent.removeGameDetailSessionIfDeparted)
local UseEdpFunctionallyReadyLoggerModule = require(script.Parent.useEdpFunctionallyReadyLogger)
local UseMotionJitterMetricModule = require(script.Parent.useMotionJitterMetric)
local ExperienceDetailsFallbackActionBarModule = require(script.Parent.Fallback.ExperienceDetailsFallbackActionBar)
local ExperienceDetailsFallbackFeedModule = require(script.Parent.Fallback.ExperienceDetailsFallbackFeed)
local SetTabBarVisibleFunction = require(Parent.AppTabBarRodux).Actions.SetTabBarVisible
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
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
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppSessionService = require(Parent.RoactServiceTags).AppSessionService
local SessionType = require(Parent.RobloxAppSessionization).SessionType
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseGetCurrentLegacyRouteFunction = require(Parent.DiscoveryRouting).useGetCurrentLegacyRoute
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
local CompositionTags = require(Parent.AppComposition).CompositionTags
local ExperienceDetailsPersistentActionBarModule = require(script.Parent.ExperienceDetailsPersistentActionBar)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiPageEntryUseSharedHooks = SharedFlagsModule.FFlagSduiPageEntryUseSharedHooks
local FFlagEnableExperienceDetailsBottomSheetTopBar = SharedFlagsModule.FFlagEnableExperienceDetailsBottomSheetTopBar
local FFlagEnableMotionJitterMetric = SharedFlagsModule.FFlagEnableMotionJitterMetric
local FFlagLuaAppSduiEdpRouteAwareSessionRemoval = SharedFlagsModule.FFlagLuaAppSduiEdpRouteAwareSessionRemoval
local FFlagSduiEdpPersistentActionBarPlayButton = SharedFlagsModule.FFlagSduiEdpPersistentActionBarPlayButton
local FoundationFullBleedSheetContent = FoundationModule.Utility.Flags.FoundationFullBleedSheetContent

return ReactModule.memo(function(p1)
	-- upvalues: ExperienceDetailsPageUtilsModule (copy), GetExperienceDetailsPageKeyModule (copy), UsePageScopeRefFunction (copy), ReactModule (copy), SduiSurfaceLoadTimeTracker (copy), EDPTTIConstants (copy), GetSduiClientPageScopeFunction (copy), UseEdpFunctionallyReadyLoggerModule (copy), UseTokensFunction (copy), UseNavigationFunction (copy), UseRoactServiceFunction (copy), AppSessionService (copy), UseDispatchFunction (copy), FFlagLuaAppSduiEdpRouteAwareSessionRemoval (copy), UseGetCurrentLegacyRouteFunction (copy), SetTabBarVisibleFunction (copy), FFlagEnableExperienceDetailsBottomSheetTopBar (copy), UseTopBarHeightFunction (copy), UseScreenSizeFunction (copy), UseDeviceInsetsFunction (copy), GetSafeAreaSizeFunction (copy), DiscoveryTypesModule (copy), UseEntrySurfacingFunction (copy), ExperienceDetailsPageConstantsModule (copy), FFlagEnableMotionJitterMetric (copy), UseMotionJitterMetricModule (copy), RemoveGameDetailSessionIfDepartedModule (copy), SessionType (copy), AppPage (copy), FetchExperienceDetailsPageModule (copy), UseUiStatusFunction (copy), UiStatus (copy), DataHydrationModule (copy), OverlayProvider (copy), ExperienceDetailsBottomSheetTopBarModule (copy), Sheet (copy), FoundationFullBleedSheetContent (copy), FoundationModule (copy), SduiPageEntryPoint (copy), FFlagSduiPageEntryUseSharedHooks (copy), CompositionTags (copy), ExperienceDetailsFallbackFeedModule (copy), FFlagSduiEdpPersistentActionBarPlayButton (copy), ExperienceDetailsPersistentActionBarModule (copy), SduiFeatureEntryPoint (copy), ExperienceDetailsFallbackActionBarModule (copy)
	local UniverseId = ExperienceDetailsPageUtilsModule.getUniverseId(p1)
	local OnPeekViewClosedFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "onPeekViewClosed")
	local ExperienceDetailsPageKeyModule = GetExperienceDetailsPageKeyModule(UniverseId)
	UsePageScopeRefFunction(ExperienceDetailsPageKeyModule)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ExperienceDetailsPageUtilsModule (upval), p1 (copy), SduiSurfaceLoadTimeTracker (upval), ExperienceDetailsPageKeyModule (copy), EDPTTIConstants (upval), GetSduiClientPageScopeFunction (upval)
		local PageTimerFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "pageTimer") or SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(ExperienceDetailsPageKeyModule, {
			manualSurfaceReady = true,
			eventName = EDPTTIConstants.EDP_TTI_EVENT_NAME,
			metadata = {
				page = "Untracked",
				category = EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_PEEK_VIEW
			}
		})
		GetSduiClientPageScopeFunction(ExperienceDetailsPageKeyModule).set(SduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, PageTimerFromPropsOrNavigationParams)
		
		return PageTimerFromPropsOrNavigationParams
	end, {})
	UseEdpFunctionallyReadyLoggerModule(UseMemoResult, UniverseId)
	local UseTokensResult = UseTokensFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppSessionService)
	local UseDispatchResult = UseDispatchFunction()
	local UseGetCurrentLegacyRouteResult = if FFlagLuaAppSduiEdpRouteAwareSessionRemoval then UseGetCurrentLegacyRouteFunction() else nil
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), SetTabBarVisibleFunction (upval)
		UseDispatchResult(SetTabBarVisibleFunction(false))
	end, { UseDispatchResult })
	local ReferralSourceFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "referralSource")
	local ExperienceJoinDataFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "experienceJoinData")
	local PlaceIdOverrideFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "placeIdOverride")
	ReactModule.useEffect(function()
		-- upvalues: GetSduiClientPageScopeFunction (upval), ExperienceDetailsPageKeyModule (copy), ReferralSourceFromPropsOrNavigationParams (copy), ExperienceJoinDataFromPropsOrNavigationParams (copy), PlaceIdOverrideFromPropsOrNavigationParams (copy)
		local SduiClientPageScope = GetSduiClientPageScopeFunction(ExperienceDetailsPageKeyModule)
		SduiClientPageScope.set("referralSource", ReferralSourceFromPropsOrNavigationParams)
		SduiClientPageScope.set("experienceJoinData", ExperienceJoinDataFromPropsOrNavigationParams)
		SduiClientPageScope.set("placeId", PlaceIdOverrideFromPropsOrNavigationParams)
		SduiClientPageScope.set("launchSource", "LuaGameCard")
	end, {
		ExperienceDetailsPageKeyModule,
		ReferralSourceFromPropsOrNavigationParams,
		ExperienceJoinDataFromPropsOrNavigationParams,
		PlaceIdOverrideFromPropsOrNavigationParams
	})
	local UseTopBarHeightResult = if FFlagEnableExperienceDetailsBottomSheetTopBar then UseTopBarHeightFunction() else nil
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local SafeAreaSize = GetSafeAreaSizeFunction(UseScreenSizeResult, UseDeviceInsetsResult)
	local Smallest = math.min(SafeAreaSize.X.Offset, 640)
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
	local IsMountAsFullViewFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "mountAsFullView") == true
	local DefaultSnapPointIndex: number = if IsMountAsFullViewFromPropsOrNavigationParams then 2 else 1
	
	if FFlagEnableMotionJitterMetric then
		UseMotionJitterMetricModule(UseRefResult1, "bottomSheet", false, "AbsolutePosition")
	end
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), FFlagLuaAppSduiEdpRouteAwareSessionRemoval (upval), UseGetCurrentLegacyRouteResult (ref), OnPeekViewClosedFromPropsOrNavigationParams (copy), RemoveGameDetailSessionIfDepartedModule (upval), UseRoactServiceResult (copy), SessionType (upval)
		if UseNavigationResult.isFocused() then
			local UseGetCurrentLegacyRouteResultResult = if FFlagLuaAppSduiEdpRouteAwareSessionRemoval then UseGetCurrentLegacyRouteResult() else nil
			
			if OnPeekViewClosedFromPropsOrNavigationParams and typeof(OnPeekViewClosedFromPropsOrNavigationParams) == "function" then
				OnPeekViewClosedFromPropsOrNavigationParams()
			end
			UseNavigationResult.goBack()
			
			if FFlagLuaAppSduiEdpRouteAwareSessionRemoval then
				RemoveGameDetailSessionIfDepartedModule(UseRoactServiceResult, UseGetCurrentLegacyRouteResultResult)
				
				return
			end
			if UseRoactServiceResult then
				UseRoactServiceResult:RemoveSession(SessionType.StructuralIdentifier.GameDetailSource)
			end
		end
	end, {
		UseNavigationResult,
		UseRoactServiceResult,
		OnPeekViewClosedFromPropsOrNavigationParams,
		if FFlagLuaAppSduiEdpRouteAwareSessionRemoval then UseGetCurrentLegacyRouteResult else nil
	})
	local UseResult2 = ReactModule.useCallback(function()
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
	local UseResult3 = ReactModule.useCallback(function()
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
				onBack = UseResult1,
				onClose = UseResult2
			}) else nil,
			SheetRoot = ReactModule.createElement(Sheet.Root, {
				isOpen = true,
				testId = "--experience-details-bottom-sheet",
				onClose = if IsMountAsFullViewFromPropsOrNavigationParams then UseResult1 else UseResult2,
				snapPoints = UseMemoResult1,
				defaultSnapPointIndex = DefaultSnapPointIndex
			}, {
				Content = ReactModule.createElement(Sheet.Content, {
					isContentFullBleed = if FoundationFullBleedSheetContent then true else nil,
					scrollingFrameRef = UseRefResult1,
					ref = if FFlagEnableExperienceDetailsBottomSheetTopBar then UseRefResult else nil
				}, {
					ContentWrapper = ReactModule.createElement(FoundationModule.View, {
						tag = "col size-full-0 auto-y",
						padding = if FoundationFullBleedSheetContent then nil else {
							bottom = UDim.new(0, -UseTokensResult.Margin.Small),
							left = UDim.new(0, -(UseTokensResult.Padding.Small + UseTokensResult.Padding.Medium)),
							right = UDim.new(0, -(UseTokensResult.Padding.Small + UseTokensResult.Padding.Medium))
						}
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
								refresh = UseResult3,
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