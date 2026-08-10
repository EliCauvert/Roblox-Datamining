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
local fFlagSduiPageEntrySurfacing = sharedFlagsModule.FFlagSduiPageEntrySurfacing
local fFlagLuaAppSduiEdpHideSystemBarOnPeekViewMount = sharedFlagsModule.FFlagLuaAppSduiEdpHideSystemBarOnPeekViewMount
local fFlagSduiPlayWithRewardGapFix = sharedFlagsModule.FFlagSduiPlayWithRewardGapFix
local fFlagEnableMotionJitterMetric = sharedFlagsModule.FFlagEnableMotionJitterMetric
local fFlagSduiEdpPersistentActionBarPlayButton = sharedFlagsModule.FFlagSduiEdpPersistentActionBarPlayButton
local fFlagSduiEdpActionBarJitterFix = sharedFlagsModule.FFlagSduiEdpActionBarJitterFix
local fFlagLuaAppEdpBottomSheetPeekViewEvents = sharedFlagsModule.FFlagLuaAppEdpBottomSheetPeekViewEvents

return reactModule.memo(function(p0) --[[ line: 81 | named "ExperienceDetailsPeekView" ]]
	-- upvalues: experienceDetailsPageUtilsModule (ref), getExperienceDetailsPageKeyModule (ref), usePageScopeRef (ref), reactModule (ref), sduiSurfaceLoadTimeTracker (ref), EDPTTIConstants (ref), getSduiClientPageScope (ref), useEdpFunctionallyReadyLoggerModule (ref), useTokens (ref), useNavigation (ref), useRoactService (ref), appEventIngestService (ref), appSessionService (ref), useDispatch (ref), fFlagLuaAppSduiEdpHideSystemBarOnPeekViewMount (ref), setTabBarVisible (ref), fFlagSduiPlayWithRewardGapFix (ref), filterPlayWithReward (ref), useTopBarHeight (ref), useScreenSize (ref), useDeviceInsets (ref), getSafeAreaSize (ref), fFlagSduiEdpActionBarJitterFix (ref), discoveryTypesModule (ref), fFlagSduiPageEntrySurfacing (ref), useEntrySurfacing (ref), experienceDetailsPageConstantsModule (ref), useSelector (ref), peekViewState (ref), fFlagEnableMotionJitterMetric (ref), useMotionJitterMetricModule (ref), appPage (ref), sessionType (ref), fetchExperienceDetailsPageModule (ref), useUiStatus (ref), uiStatus (ref), dataHydrationModule (ref), gameDetailsPeekViewEvents (ref), fFlagLuaAppEdpBottomSheetPeekViewEvents (ref), peekViewWithTopBar (ref), peekViewTopBarModule (ref), sduiPageEntryPoint (ref), fFlagSduiPageEntryUseSharedHooks (ref), compositionTags (ref), experienceDetailsFallbackFeedModule (ref), fFlagSduiEdpPersistentActionBarPlayButton (ref), experienceDetailsPersistentActionBarModule (ref), sduiFeatureEntryPoint (ref), experienceDetailsFallbackActionBarModule (ref)
	local universeId = experienceDetailsPageUtilsModule.getUniverseId(p0)
	local analyticsSource = experienceDetailsPageUtilsModule.getAnalyticsSource(p0)
	local tilePositionIndex = experienceDetailsPageUtilsModule.getTilePositionIndex(p0)
	local onPeekViewClosed = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "onPeekViewClosed")
	local var24 = getExperienceDetailsPageKeyModule(universeId)
	usePageScopeRef(var24)
	local var25 = reactModule.useMemo(function() --[[ line: 88 ]]
		-- upvalues: experienceDetailsPageUtilsModule (copy), p0 (ref), sduiSurfaceLoadTimeTracker (copy), var24 (ref), EDPTTIConstants (copy), getSduiClientPageScope (copy)
		local var48 = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "pageTimer") or sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(var24, {
			manualSurfaceReady = true,
			eventName = EDPTTIConstants.EDP_TTI_EVENT_NAME,
			metadata = {
				page = "Untracked",
				category = EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_PEEK_VIEW
			}
		})
		getSduiClientPageScope(var24).set(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, var48)
		
		return var48
	end, {})
	useEdpFunctionallyReadyLoggerModule(var25, universeId)
	local var26 = useTokens()
	local var27 = useNavigation()
	local var28 = useRoactService(appEventIngestService)
	local var29 = useRoactService(appSessionService)
	local var30 = useDispatch()
	
	if fFlagLuaAppSduiEdpHideSystemBarOnPeekViewMount then
		reactModule.useEffect(function() --[[ line: 114 ]]
			-- upvalues: var30 (ref), setTabBarVisible (copy)
			var30(setTabBarVisible(false))
		end, { var30 })
	end
	local referralSource = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "referralSource")
	local experienceJoinData = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "experienceJoinData")
	local placeIdOverride = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "placeIdOverride")
	reactModule.useEffect(function() --[[ line: 122 ]]
		-- upvalues: getSduiClientPageScope (copy), var24 (ref), referralSource (ref), experienceJoinData (ref), placeIdOverride (ref), fFlagSduiPlayWithRewardGapFix (copy), filterPlayWithReward (copy)
		local var49 = getSduiClientPageScope(var24)
		var49.set("referralSource", referralSource)
		var49.set("experienceJoinData", experienceJoinData)
		var49.set("placeId", placeIdOverride)
		var49.set("launchSource", "LuaGameCard")
		
		if fFlagSduiPlayWithRewardGapFix then
			var49.set(filterPlayWithReward, nil)
		end
	end, {
		var24,
		referralSource,
		experienceJoinData,
		placeIdOverride
	})
	local var34 = useTopBarHeight()
	local minValue = math.min(getSafeAreaSize(useScreenSize(), useDeviceInsets()).X.Offset, 640)
	local var36 = reactModule.useRef(nil)
	local var37, var38 = reactModule.useState(function() --[[ line: 139 ]]
		-- upvalues: fFlagSduiEdpActionBarJitterFix (copy), var26 (ref), discoveryTypesModule (copy)
		return if fFlagSduiEdpActionBarJitterFix then var26.Padding.Medium + var26.Size.Size_1200 else discoveryTypesModule.Constants.GAME_DETAILS_ACTION_BAR_HEIGHT
	end)
	local var39 = reactModule.useCallback(function(p1) --[[ line: 148 ]]
		-- upvalues: fFlagSduiEdpActionBarJitterFix (copy), var26 (ref), var38 (ref)
		local y = p1.AbsoluteSize.Y
		
		if fFlagSduiEdpActionBarJitterFix and y > 0 then
			local var50 = var26.Padding.Medium + var26.Size.Size_1200
			
			if y <= var50 + var26.Padding.Medium then
				y = var50
			end
		end
		if y > 0 then
			var38(y)
		end
	end, { var26 })
	local var40 = if fFlagSduiPageEntrySurfacing then useEntrySurfacing(var24, experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER, "peekView") else nil
	local uDim = UDim.new(0, minValue + var37 + (if var40 then var40.heightOffset else 0))
	local var42 = useSelector(function(p2) --[[ line: 167 ]]
		return p2.GameDetailsPeekView.viewState
	end)
	local mountAsFullView = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "mountAsFullView")
	local var44 = if mountAsFullView == nil then if var42 ~= peekViewState.Full then var42 == peekViewState.Extended else true else mountAsFullView
	local var45 = var42 == peekViewState.Closed
	
	if fFlagEnableMotionJitterMetric then
		useMotionJitterMetricModule(var36, experienceDetailsPageConstantsModule.EDP_PEEK_VIEW_SURFACE, true, "CanvasPosition")
	end
	local var46 = reactModule.useCallback(function() --[[ line: 185 ]]
		-- upvalues: onPeekViewClosed (ref), var27 (ref), appPage (copy), var29 (ref), sessionType (copy)
		if onPeekViewClosed and typeof(onPeekViewClosed) == "function" then
			onPeekViewClosed()
		end
		var27.clearAppScreens({ appPage.GameDetail })
		
		if var29 then
			var29:RemoveSession(sessionType.StructuralIdentifier.GameDetailSource)
		end
	end, {
		var27, var29, onPeekViewClosed, universeId, analyticsSource, tilePositionIndex
	})
	reactModule.useEffect(function() --[[ line: 195 ]]
		-- upvalues: universeId (ref), var25 (ref), fetchExperienceDetailsPageModule (copy)
		if universeId and var25 then
			fetchExperienceDetailsPageModule(universeId, var25)
		end
	end, { universeId, var25 })
	local var47 = useUiStatus(var24)
	reactModule.useEffect(function() --[[ line: 202 ]]
		-- upvalues: var47 (ref), uiStatus (copy), universeId (ref), dataHydrationModule (copy)
		if var47 == uiStatus.Error and universeId then
			dataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(universeId, function(p3) --[[ line: 206 ]]
				return if p3 ~= nil then p3.creator == nil else true
			end)
			dataHydrationModule.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(universeId)
		end
	end, { var47, universeId })
	
	return if universeId == nil then nil else reactModule.createElement(peekViewWithTopBar, {
		topBarHeight = var34,
		bottomDockedContainerHeight = var37,
		fullViewContentHeight = UDim.new(1, -var34),
		briefViewContentHeight = uDim,
		onViewStateChanged = reactModule.useCallback(function(p4, p5) --[[ line: 220 ]]
			-- upvalues: universeId (ref), peekViewState (copy), var42 (ref), gameDetailsPeekViewEvents (copy), var28 (ref), analyticsSource (ref), tilePositionIndex (ref), fFlagLuaAppEdpBottomSheetPeekViewEvents (copy), experienceDetailsPageConstantsModule (copy), var30 (ref), var46 (ref)
			local universeId_1 = universeId or ""
			
			if universeId and p4 == peekViewState.Brief then
				if var42 == peekViewState.Brief then
					gameDetailsPeekViewEvents(var28, "SwitchGame", universeId_1, analyticsSource, tilePositionIndex, if fFlagLuaAppEdpBottomSheetPeekViewEvents then experienceDetailsPageConstantsModule.EDP_PEEK_VIEW_SURFACE else nil)
				elseif p5 == peekViewState.Closed then
					gameDetailsPeekViewEvents(var28, "OpenPeekView", universeId_1, analyticsSource, tilePositionIndex, if fFlagLuaAppEdpBottomSheetPeekViewEvents then experienceDetailsPageConstantsModule.EDP_PEEK_VIEW_SURFACE else nil)
				end
			end
			var30({ type = "SetGameDetailsPeekViewState", viewState = p4 })
			
			if universeId and p4 == peekViewState.Full and p5 == peekViewState.Brief then
				gameDetailsPeekViewEvents(var28, "GoToFullView", universeId_1, analyticsSource, tilePositionIndex, if fFlagLuaAppEdpBottomSheetPeekViewEvents then experienceDetailsPageConstantsModule.EDP_PEEK_VIEW_SURFACE else nil)
			end
			if p4 == peekViewState.Closed then
				var46()
			end
		end, {
			var30, var28, universeId, analyticsSource, tilePositionIndex, var42, var46
		}),
		viewChangedEventMeta = {
			universeId = universeId,
			source = analyticsSource,
			index = tilePositionIndex
		},
		mountAsFullView = var44,
		mountAnimation = var45,
		scrollingFrameRef = var36,
		topBarSlot = reactModule.createElement(peekViewTopBarModule, { pageProps = p0, onClose = var46 }),
		contentSlot = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Content = reactModule.createElement(sduiPageEntryPoint, {
				includeNavigationHeaderBar = false,
				snackbarPortalLayoutOrder = 2147483647,
				appPage = appPage.GameDetail,
				configKey = var24,
				identifier = if fFlagSduiPageEntryUseSharedHooks then experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER else experienceDetailsPageUtilsModule.getResolvedIdentifier(var24, experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER_SUFFIX),
				pageTimer = var25,
				backgroundStyle = var26.Color.Surface.Surface_100,
				scrollingFrameRef = var36,
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
					refresh = reactModule.useCallback(function() --[[ line: 213 ]]
						-- upvalues: universeId (ref), var25 (ref), fetchExperienceDetailsPageModule (copy)
						if universeId and var25 then
							fetchExperienceDetailsPageModule(universeId, var25, true)
						end
					end, { universeId, var25 }),
					referralSource = referralSource,
					experienceJoinData = experienceJoinData,
					placeIdOverride = placeIdOverride
				})
			})
		}),
		bottomBarSlot = if fFlagSduiEdpPersistentActionBarPlayButton then reactModule.createElement(experienceDetailsPersistentActionBarModule, {
			launchSource = "LuaGameCard",
			universeId = universeId,
			configKey = var24,
			loadTimer = var25,
			referralSource = referralSource,
			experienceJoinData = experienceJoinData,
			placeIdOverride = placeIdOverride,
			onAbsoluteSizeChange = var39
		}) else reactModule.createElement(sduiFeatureEntryPoint, {
			appPage = appPage.GameDetail,
			configKey = var24,
			identifier = experienceDetailsPageConstantsModule.EDP_ACTION_BAR_IDENTIFIER,
			loadTimer = var25,
			AutomaticSize = Enum.AutomaticSize.XY,
			onAbsoluteSizeChange = var39,
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