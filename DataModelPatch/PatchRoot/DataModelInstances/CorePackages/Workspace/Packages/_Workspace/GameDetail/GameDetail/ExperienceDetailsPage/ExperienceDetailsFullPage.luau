local GameDetail = script:FindFirstAncestor("GameDetail")
local Parent = GameDetail.Parent
local ExperienceDetailsPageUtilsModule = require(script.Parent.ExperienceDetailsPageUtils)
local ExperienceDetailsPageConstantsModule = require(script.Parent.ExperienceDetailsPageConstants)
local FetchExperienceDetailsPageModule = require(script.Parent.fetchExperienceDetailsPage)
local GetExperienceDetailsPageKeyModule = require(script.Parent.getExperienceDetailsPageKey)
local RemoveGameDetailSessionIfDepartedModule = require(script.Parent.removeGameDetailSessionIfDeparted)
local UseEdpFunctionallyReadyLoggerModule = require(script.Parent.useEdpFunctionallyReadyLogger)
local ExperienceDetailsFallbackBannerImageModule = require(script.Parent.Fallback.ExperienceDetailsFallbackBannerImage)
local ExperienceDetailsFallbackFeedModule = require(script.Parent.Fallback.ExperienceDetailsFallbackFeed)
local _ = require(Parent.Navigation)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AppSessionService = require(Parent.RoactServiceTags).AppSessionService
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local SessionType = require(Parent.RobloxAppSessionization).SessionType
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
local FilterPlayWithReward = require(script.Parent.ExperienceDetailsPageScopeFields).FilterPlayWithReward
local CompositionTags = require(Parent.AppComposition).CompositionTags
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiExperienceDetailsSupport = SharedFlagsModule.FFlagSduiExperienceDetailsSupport
local FFlagSduiPageEntryUseSharedHooks = SharedFlagsModule.FFlagSduiPageEntryUseSharedHooks
local FFlagSduiEdpPageScopeTimerFix = SharedFlagsModule.FFlagSduiEdpPageScopeTimerFix
local FFlagSduiPlayWithRewardGapFix = SharedFlagsModule.FFlagSduiPlayWithRewardGapFix
local FFlagLuaAppSduiEdpRouteAwareSessionRemoval = SharedFlagsModule.FFlagLuaAppSduiEdpRouteAwareSessionRemoval
local EdpFullBleedOverlapOffset = game:DefineFastInt("EdpFullBleedOverlapOffset", 180)
local EdpBannerBottomVisiblePercent = game:DefineFastInt("EdpBannerBottomVisiblePercent", 20)
local SelectionGroup = {
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop
}

return ReactModule.memo(function(p1)
	-- upvalues: GameDetail (copy), ExperienceDetailsPageUtilsModule (copy), GetExperienceDetailsPageKeyModule (copy), ReactModule (copy), FFlagSduiEdpPageScopeTimerFix (copy), UsePageScopeRefFunction (copy), SduiSurfaceLoadTimeTracker (copy), EDPTTIConstants (copy), GetSduiClientPageScopeFunction (copy), UseEdpFunctionallyReadyLoggerModule (copy), UseNavigationFunction (copy), UseRoactServiceFunction (copy), AppSessionService (copy), UseTokensFunction (copy), FFlagLuaAppSduiEdpRouteAwareSessionRemoval (copy), UseGetCurrentLegacyRouteFunction (copy), FFlagSduiPlayWithRewardGapFix (copy), FilterPlayWithReward (copy), RemoveGameDetailSessionIfDepartedModule (copy), SessionType (copy), FetchExperienceDetailsPageModule (copy), UseUiStatusFunction (copy), UiStatus (copy), DataHydrationModule (copy), ResponsiveModule (copy), DetailsPageLayout (copy), SelectionGroup (copy), EdpFullBleedOverlapOffset (copy), EdpBannerBottomVisiblePercent (copy), SduiFeatureEntryPoint (copy), AppPage (copy), ExperienceDetailsPageConstantsModule (copy), ExperienceDetailsFallbackBannerImageModule (copy), FoundationModule (copy), SduiPageEntryPoint (copy), FFlagSduiPageEntryUseSharedHooks (copy), FFlagSduiExperienceDetailsSupport (copy), CompositionTags (copy), ExperienceDetailsFallbackFeedModule (copy)
	local UseExperienceDetailsFocusNavigationModule = require(GameDetail.FocusNavigation.useExperienceDetailsFocusNavigation)
	local UniverseId = ExperienceDetailsPageUtilsModule.getUniverseId(p1)
	local ExperienceDetailsPageKeyModule = GetExperienceDetailsPageKeyModule(UniverseId)
	local UseRefResult = ReactModule.useRef(nil)
	
	if FFlagSduiEdpPageScopeTimerFix then
		UsePageScopeRefFunction(ExperienceDetailsPageKeyModule)
	end
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ExperienceDetailsPageUtilsModule (upval), p1 (copy), FFlagSduiEdpPageScopeTimerFix (upval), SduiSurfaceLoadTimeTracker (upval), ExperienceDetailsPageKeyModule (copy), EDPTTIConstants (upval), GetSduiClientPageScopeFunction (upval)
		local PageTimerFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "pageTimer")
		
		if FFlagSduiEdpPageScopeTimerFix then
			local PageTimerFromPropsOrNavigationParams1 = PageTimerFromPropsOrNavigationParams or SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(ExperienceDetailsPageKeyModule, {
				manualSurfaceReady = true,
				eventName = EDPTTIConstants.EDP_TTI_EVENT_NAME,
				metadata = {
					page = "Untracked",
					category = EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_FULL_PAGE
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
					category = EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_FULL_PAGE
				}
			})
		end
	end, {})
	UseEdpFunctionallyReadyLoggerModule(UseMemoResult, UniverseId)
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppSessionService)
	local UseTokensResult = UseTokensFunction()
	local UseGetCurrentLegacyRouteResult = if FFlagLuaAppSduiEdpRouteAwareSessionRemoval then UseGetCurrentLegacyRouteFunction() else nil
	local ReferralSourceFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "referralSource")
	local ExperienceJoinDataFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "experienceJoinData")
	local PlaceIdOverrideFromPropsOrNavigationParams = ExperienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "placeIdOverride")
	
	if not FFlagSduiEdpPageScopeTimerFix then
		UsePageScopeRefFunction(ExperienceDetailsPageKeyModule)
	end
	ReactModule.useEffect(function()
		-- upvalues: GetSduiClientPageScopeFunction (upval), ExperienceDetailsPageKeyModule (copy), ReferralSourceFromPropsOrNavigationParams (copy), ExperienceJoinDataFromPropsOrNavigationParams (copy), PlaceIdOverrideFromPropsOrNavigationParams (copy), FFlagSduiPlayWithRewardGapFix (upval), FilterPlayWithReward (upval)
		local SduiClientPageScope = GetSduiClientPageScopeFunction(ExperienceDetailsPageKeyModule)
		SduiClientPageScope.set("referralSource", ReferralSourceFromPropsOrNavigationParams)
		SduiClientPageScope.set("experienceJoinData", ExperienceJoinDataFromPropsOrNavigationParams)
		SduiClientPageScope.set("placeId", PlaceIdOverrideFromPropsOrNavigationParams)
		SduiClientPageScope.set("launchSource", "ExperienceDetailsPage")
		
		if FFlagSduiPlayWithRewardGapFix then
			SduiClientPageScope.set(FilterPlayWithReward, nil)
		end
	end, {
		ExperienceDetailsPageKeyModule,
		ReferralSourceFromPropsOrNavigationParams,
		ExperienceJoinDataFromPropsOrNavigationParams,
		PlaceIdOverrideFromPropsOrNavigationParams
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagLuaAppSduiEdpRouteAwareSessionRemoval (upval), UseGetCurrentLegacyRouteResult (ref), UseNavigationResult (copy), RemoveGameDetailSessionIfDepartedModule (upval), UseRoactServiceResult (copy), SessionType (upval)
		local UseGetCurrentLegacyRouteResultResult = if FFlagLuaAppSduiEdpRouteAwareSessionRemoval then UseGetCurrentLegacyRouteResult() else nil
		UseNavigationResult.goBack()
		
		if FFlagLuaAppSduiEdpRouteAwareSessionRemoval then
			RemoveGameDetailSessionIfDepartedModule(UseRoactServiceResult, UseGetCurrentLegacyRouteResultResult)
			
			return
		end
		if UseRoactServiceResult then
			UseRoactServiceResult:RemoveSession(SessionType.StructuralIdentifier.GameDetailSource)
		end
	end, {
		UseNavigationResult,
		UseRoactServiceResult,
		if FFlagLuaAppSduiEdpRouteAwareSessionRemoval then UseGetCurrentLegacyRouteResult else nil
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
	local IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	
	return if UniverseId == nil then nil else ReactModule.createElement(DetailsPageLayout.Root, {
		ref = UseExperienceDetailsFocusNavigationModuleResult,
		onClose = if IsUsePreferredInputResultMatch then nil else UseResult,
		selectionGroup = SelectionGroup,
		fullBleedOverlapOffset = EdpFullBleedOverlapOffset,
		bannerBottomVisiblePercent = EdpBannerBottomVisiblePercent / 100,
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
		Header = if IsUsePreferredInputResultMatch then nil else ReactModule.createElement(DetailsPageLayout.Header, {
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
				snackbarPortalLayoutOrder = 2147483647,
				appPage = AppPage.ExperienceDetail,
				configKey = ExperienceDetailsPageKeyModule,
				identifier = if FFlagSduiPageEntryUseSharedHooks then ExperienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER else ExperienceDetailsPageUtilsModule.getResolvedIdentifier(ExperienceDetailsPageKeyModule, ExperienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER_SUFFIX),
				pageTimer = UseMemoResult,
				scrollingFrameRef = UseRefResult,
				backgroundStyle = UseTokensResult.Color.None,
				disableRootPadding = if FFlagSduiExperienceDetailsSupport then true else nil,
				clipsDescendantsOverride = not FFlagSduiExperienceDetailsSupport and nil,
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
		})
	})
end)