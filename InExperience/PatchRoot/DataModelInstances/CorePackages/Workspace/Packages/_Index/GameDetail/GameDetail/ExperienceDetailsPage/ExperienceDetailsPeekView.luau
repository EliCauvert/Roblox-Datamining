local parent = script:FindFirstAncestor("GameDetail").Parent
local experienceDetailsPageUtilsModule = require(script.Parent.ExperienceDetailsPageUtils)
local experienceDetailsPageConstantsModule = require(script.Parent.ExperienceDetailsPageConstants)
local experienceDetailsPageScopeFieldsModule = require(script.Parent.ExperienceDetailsPageScopeFields)
local fetchExperienceDetailsPageModule = require(script.Parent.fetchExperienceDetailsPage)
local getExperienceDetailsPageKeyModule = require(script.Parent.getExperienceDetailsPageKey)
local peekViewTopBarModule = require(script.Parent.PeekViewTopBar)
local useEdpFunctionallyReadyLoggerModule = require(script.Parent.useEdpFunctionallyReadyLogger)
local useMotionJitterMetricModule = require(script.Parent.useMotionJitterMetric)
local experienceDetailsFallbackActionBarModule = require(script.Parent.Fallback.ExperienceDetailsFallbackActionBar)
local experienceDetailsFallbackFeedModule = require(script.Parent.Fallback.ExperienceDetailsFallbackFeed)
local setTabBarVisible = require(parent.AppTabBarRodux).Actions.SetTabBarVisible
local discoveryTypesModule = require(parent.DiscoveryTypes)
local gameDetailsPeekViewEvents = require(parent.DiscoveryAnalytics).Events.gameDetailsPeekViewEvents
local _ = require(parent.Navigation)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local peekViewModule = require(parent.PeekView)
local useTokens = foundationModule.Hooks.useTokens
local useNavigation = require(parent.Navigation).useNavigation
local peekViewWithTopBar = peekViewModule.PeekViewWithTopBar
local peekViewState = peekViewModule.PeekViewState
local getSafeAreaSize = require(parent.InputUi).getSafeAreaSize
local useDeviceInsets = require(parent.Responsive).useDeviceInsets
local dataHydrationModule = require(parent.DataHydration)
local useTopBarHeight = require(parent.RobloxAppHooks).useTopBarHeight
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactServiceTagsModule = require(parent.RoactServiceTags)
local appEventIngestService = roactServiceTagsModule.AppEventIngestService
local appSessionService = roactServiceTagsModule.AppSessionService
local sessionType = require(parent.RobloxAppSessionization).SessionType
local appPage = require(parent.RobloxAppEnums).AppPage
local roactUtilsModule = require(parent.RoactUtils)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local EDPTTIConstants = require(parent.GameDetailTelemetry).EDPTTIConstants
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local getSduiClientPageScope = sduiSharedUtilitiesModule.getSduiClientPageScope
local sduiSurfaceLoadTimeTracker = sduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local usePageScopeRef = sduiSharedUtilitiesModule.usePageScopeRef
local sduiFeatureEntryPoint = sduiSharedUtilitiesModule.SduiFeatureEntryPoint
local sduiPageEntryPoint = sduiSharedUtilitiesModule.SduiPageEntryPoint
local uiStatus = sduiSharedUtilitiesModule.UiStatus
local useUiStatus = sduiSharedUtilitiesModule.useUiStatus
local useEntrySurfacing = sduiSharedUtilitiesModule.useEntrySurfacing
local filterPlayWithReward = experienceDetailsPageScopeFieldsModule.FilterPlayWithReward
local compositionTags = require(parent.AppComposition).CompositionTags
local experienceDetailsPersistentActionBarModule = require(script.Parent.ExperienceDetailsPersistentActionBar)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiPageEntryUseSharedHooks = sharedFlagsModule.FFlagSduiPageEntryUseSharedHooks
local fFlagLuaAppSduiEdpHideSystemBarOnPeekViewMount = sharedFlagsModule.FFlagLuaAppSduiEdpHideSystemBarOnPeekViewMount
local fFlagSduiPlayWithRewardGapFix = sharedFlagsModule.FFlagSduiPlayWithRewardGapFix
local fFlagEnableMotionJitterMetric = sharedFlagsModule.FFlagEnableMotionJitterMetric
local fFlagSduiEdpPersistentActionBarPlayButton = sharedFlagsModule.FFlagSduiEdpPersistentActionBarPlayButton
local fFlagSduiEdpActionBarJitterFix = sharedFlagsModule.FFlagSduiEdpActionBarJitterFix
local fFlagLuaAppEdpBottomSheetPeekViewEvents = sharedFlagsModule.FFlagLuaAppEdpBottomSheetPeekViewEvents

return reactModule.memo(function(p1)
	-- upvalues: experienceDetailsPageUtilsModule (ref), getExperienceDetailsPageKeyModule (ref), usePageScopeRef (ref), reactModule (ref), sduiSurfaceLoadTimeTracker (ref), EDPTTIConstants (ref), getSduiClientPageScope (ref), useEdpFunctionallyReadyLoggerModule (ref), useTokens (ref), useNavigation (ref), useRoactService (ref), appEventIngestService (ref), appSessionService (ref), useDispatch (ref), fFlagLuaAppSduiEdpHideSystemBarOnPeekViewMount (ref), setTabBarVisible (ref), fFlagSduiPlayWithRewardGapFix (ref), filterPlayWithReward (ref), useTopBarHeight (ref), useScreenSize (ref), useDeviceInsets (ref), getSafeAreaSize (ref), fFlagSduiEdpActionBarJitterFix (ref), discoveryTypesModule (ref), useEntrySurfacing (ref), experienceDetailsPageConstantsModule (ref), useSelector (ref), peekViewState (ref), fFlagEnableMotionJitterMetric (ref), useMotionJitterMetricModule (ref), appPage (ref), sessionType (ref), fetchExperienceDetailsPageModule (ref), useUiStatus (ref), uiStatus (ref), dataHydrationModule (ref), gameDetailsPeekViewEvents (ref), fFlagLuaAppEdpBottomSheetPeekViewEvents (ref), peekViewWithTopBar (ref), peekViewTopBarModule (ref), sduiPageEntryPoint (ref), fFlagSduiPageEntryUseSharedHooks (ref), compositionTags (ref), experienceDetailsFallbackFeedModule (ref), fFlagSduiEdpPersistentActionBarPlayButton (ref), experienceDetailsPersistentActionBarModule (ref), sduiFeatureEntryPoint (ref), experienceDetailsFallbackActionBarModule (ref)
	local universeId = experienceDetailsPageUtilsModule.getUniverseId(p1)
	local analyticsSource = experienceDetailsPageUtilsModule.getAnalyticsSource(p1)
	local tilePositionIndex = experienceDetailsPageUtilsModule.getTilePositionIndex(p1)
	local onPeekViewClosed = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "onPeekViewClosed")
	local var1 = getExperienceDetailsPageKeyModule(universeId)
	usePageScopeRef(var1)
	local var2 = reactModule.useMemo(function()
		-- upvalues: experienceDetailsPageUtilsModule (copy), p1 (ref), sduiSurfaceLoadTimeTracker (copy), var1 (ref), EDPTTIConstants (copy), getSduiClientPageScope (copy)
		local var3 = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "pageTimer") or sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(var1, {
			manualSurfaceReady = true,
			eventName = EDPTTIConstants.EDP_TTI_EVENT_NAME,
			metadata = {
				page = "Untracked",
				category = EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_PEEK_VIEW
			}
		})
		getSduiClientPageScope(var1).set(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, var3)
		
		return var3
	end, {})
	useEdpFunctionallyReadyLoggerModule(var2, universeId)
	local var3 = useTokens()
	local var4 = useNavigation()
	local var5 = useRoactService(appEventIngestService)
	local var6 = useRoactService(appSessionService)
	local var7 = useDispatch()
	
	if fFlagLuaAppSduiEdpHideSystemBarOnPeekViewMount then
		reactModule.useEffect(function()
			-- upvalues: var7 (ref), setTabBarVisible (copy)
			var7(setTabBarVisible(false))
		end, { var7 })
	end
	local referralSource = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "referralSource")
	local experienceJoinData = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "experienceJoinData")
	local placeIdOverride = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "placeIdOverride")
	reactModule.useEffect(function()
		-- upvalues: getSduiClientPageScope (copy), var1 (ref), referralSource (ref), experienceJoinData (ref), placeIdOverride (ref), fFlagSduiPlayWithRewardGapFix (copy), filterPlayWithReward (copy)
		local var8 = getSduiClientPageScope(var1)
		var8.set("referralSource", referralSource)
		var8.set("experienceJoinData", experienceJoinData)
		var8.set("placeId", placeIdOverride)
		var8.set("launchSource", "LuaGameCard")
		
		if fFlagSduiPlayWithRewardGapFix then
			var8.set(filterPlayWithReward, nil)
		end
	end, {
		var1,
		referralSource,
		experienceJoinData,
		placeIdOverride
	})
	local var8 = useTopBarHeight()
	local minValue = math.min(getSafeAreaSize(useScreenSize(), useDeviceInsets()).X.Offset, 640)
	local var9 = reactModule.useRef(nil)
	local var10, var11 = reactModule.useState(function()
		-- upvalues: fFlagSduiEdpActionBarJitterFix (copy), var3 (ref), discoveryTypesModule (copy)
		return if fFlagSduiEdpActionBarJitterFix then var3.Padding.Medium + var3.Size.Size_1200 else discoveryTypesModule.Constants.GAME_DETAILS_ACTION_BAR_HEIGHT
	end)
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: fFlagSduiEdpActionBarJitterFix (copy), var3 (ref), var11 (ref)
		local y = p2.AbsoluteSize.Y
		
		if fFlagSduiEdpActionBarJitterFix and y > 0 then
			local var13 = var3.Padding.Medium + var3.Size.Size_1200
			
			if y <= var13 + var3.Padding.Medium then
				y = var13
			end
		end
		if y > 0 then
			var11(y)
		end
	end, { var3 })
	local var13 = useEntrySurfacing(var1, experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER, "peekView")
	local uDim = UDim.new(0, minValue + var10 + (if var13 then var13.heightOffset else 0))
	local var14 = useSelector(function(p2)
		return p2.GameDetailsPeekView.viewState
	end)
	local mountAsFullView = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "mountAsFullView")
	local var15 = if mountAsFullView == nil then if var14 ~= peekViewState.Full then var14 == peekViewState.Extended else true else mountAsFullView
	local var16 = var14 == peekViewState.Closed
	
	if fFlagEnableMotionJitterMetric then
		useMotionJitterMetricModule(var9, experienceDetailsPageConstantsModule.EDP_PEEK_VIEW_SURFACE, true, "CanvasPosition")
	end
	local var17 = reactModule.useCallback(function()
		-- upvalues: onPeekViewClosed (ref), var4 (ref), appPage (copy), var6 (ref), sessionType (copy)
		if onPeekViewClosed and typeof(onPeekViewClosed) == "function" then
			onPeekViewClosed()
		end
		var4.clearAppScreens({ appPage.GameDetail })
		
		if var6 then
			var6:RemoveSession(sessionType.StructuralIdentifier.GameDetailSource)
		end
	end, {
		var4, var6, onPeekViewClosed, universeId, analyticsSource, tilePositionIndex
	})
	reactModule.useEffect(function()
		-- upvalues: universeId (ref), var2 (ref), fetchExperienceDetailsPageModule (copy)
		if universeId and var2 then
			fetchExperienceDetailsPageModule(universeId, var2)
		end
	end, { universeId, var2 })
	local var18 = useUiStatus(var1)
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), uiStatus (copy), universeId (ref), dataHydrationModule (copy)
		if var18 == uiStatus.Error and universeId then
			dataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(universeId, function(p2)
				return if p2 ~= nil then p2.creator == nil else true
			end)
			dataHydrationModule.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(universeId)
		end
	end, { var18, universeId })
	
	return if universeId == nil then nil else reactModule.createElement(peekViewWithTopBar, {
		topBarHeight = var8,
		bottomDockedContainerHeight = var10,
		fullViewContentHeight = UDim.new(1, -var8),
		briefViewContentHeight = uDim,
		onViewStateChanged = reactModule.useCallback(function(p2, p3)
			-- upvalues: universeId (ref), peekViewState (copy), var14 (ref), gameDetailsPeekViewEvents (copy), var5 (ref), analyticsSource (ref), tilePositionIndex (ref), fFlagLuaAppEdpBottomSheetPeekViewEvents (copy), experienceDetailsPageConstantsModule (copy), var7 (ref), var17 (ref)
			local universeId_1 = universeId or ""
			
			if universeId and p2 == peekViewState.Brief then
				if var14 == peekViewState.Brief then
					gameDetailsPeekViewEvents(var5, "SwitchGame", universeId_1, analyticsSource, tilePositionIndex, if fFlagLuaAppEdpBottomSheetPeekViewEvents then experienceDetailsPageConstantsModule.EDP_PEEK_VIEW_SURFACE else nil)
				elseif p3 == peekViewState.Closed then
					gameDetailsPeekViewEvents(var5, "OpenPeekView", universeId_1, analyticsSource, tilePositionIndex, if fFlagLuaAppEdpBottomSheetPeekViewEvents then experienceDetailsPageConstantsModule.EDP_PEEK_VIEW_SURFACE else nil)
				end
			end
			var7({ type = "SetGameDetailsPeekViewState", viewState = p2 })
			
			if universeId and p2 == peekViewState.Full and p3 == peekViewState.Brief then
				gameDetailsPeekViewEvents(var5, "GoToFullView", universeId_1, analyticsSource, tilePositionIndex, if fFlagLuaAppEdpBottomSheetPeekViewEvents then experienceDetailsPageConstantsModule.EDP_PEEK_VIEW_SURFACE else nil)
			end
			if p2 == peekViewState.Closed then
				var17()
			end
		end, {
			var7, var5, universeId, analyticsSource, tilePositionIndex, var14, var17
		}),
		viewChangedEventMeta = {
			universeId = universeId,
			source = analyticsSource,
			index = tilePositionIndex
		},
		mountAsFullView = var15,
		mountAnimation = var16,
		scrollingFrameRef = var9,
		topBarSlot = reactModule.createElement(peekViewTopBarModule, { pageProps = p1, onClose = var17 }),
		contentSlot = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Content = reactModule.createElement(sduiPageEntryPoint, {
				includeNavigationHeaderBar = false,
				snackbarPortalLayoutOrder = 2147483647,
				appPage = appPage.GameDetail,
				configKey = var1,
				identifier = if fFlagSduiPageEntryUseSharedHooks then experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER else experienceDetailsPageUtilsModule.getResolvedIdentifier(var1, experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER_SUFFIX),
				pageTimer = var2,
				backgroundStyle = var3.Color.Surface.Surface_100,
				scrollingFrameRef = var9,
				contentTag = compositionTags.ContentRegion.Body,
				loadingSlot = reactModule.createElement(experienceDetailsFallbackFeedModule.Skeleton, {
					isSmallScreen = true,
					launchSource = "LuaGameCard",
					universeId = universeId
				}),
				errorSlot = reactModule.createElement(experienceDetailsFallbackFeedModule.Error, {
					isSmallScreen = true,
					launchSource = "LuaGameCard",
					universeId = universeId,
					refresh = reactModule.useCallback(function()
						-- upvalues: universeId (ref), var2 (ref), fetchExperienceDetailsPageModule (copy)
						if universeId and var2 then
							fetchExperienceDetailsPageModule(universeId, var2, true)
						end
					end, { universeId, var2 }),
					referralSource = referralSource,
					experienceJoinData = experienceJoinData,
					placeIdOverride = placeIdOverride
				})
			})
		}),
		bottomBarSlot = if fFlagSduiEdpPersistentActionBarPlayButton then reactModule.createElement(experienceDetailsPersistentActionBarModule, {
			launchSource = "LuaGameCard",
			universeId = universeId,
			configKey = var1,
			loadTimer = var2,
			referralSource = referralSource,
			experienceJoinData = experienceJoinData,
			placeIdOverride = placeIdOverride,
			onAbsoluteSizeChange = var12
		}) else reactModule.createElement(sduiFeatureEntryPoint, {
			appPage = appPage.GameDetail,
			configKey = var1,
			identifier = experienceDetailsPageConstantsModule.EDP_ACTION_BAR_IDENTIFIER,
			loadTimer = var2,
			AutomaticSize = Enum.AutomaticSize.XY,
			onAbsoluteSizeChange = var12,
			loadingSlot = reactModule.createElement(experienceDetailsFallbackActionBarModule.Skeleton, {
				launchSource = "LuaGameCard",
				universeId = universeId,
				referralSource = referralSource,
				experienceJoinData = experienceJoinData,
				placeIdOverride = placeIdOverride
			}),
			errorSlot = reactModule.createElement(experienceDetailsFallbackActionBarModule.Error, {
				launchSource = "LuaGameCard",
				universeId = universeId,
				referralSource = referralSource,
				experienceJoinData = experienceJoinData,
				placeIdOverride = placeIdOverride
			})
		})
	})
end)