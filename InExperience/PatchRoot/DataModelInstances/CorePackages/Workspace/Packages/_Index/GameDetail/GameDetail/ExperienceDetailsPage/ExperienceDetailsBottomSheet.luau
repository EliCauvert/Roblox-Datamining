local gameDetail = script:FindFirstAncestor("GameDetail")
local parent = gameDetail.Parent
local experienceDetailsPageUtilsModule = require(script.Parent.ExperienceDetailsPageUtils)
local experienceDetailsPageConstantsModule = require(script.Parent.ExperienceDetailsPageConstants)
local experienceDetailsBottomSheetTopBarModule = require(script.Parent.ExperienceDetailsBottomSheetTopBar)
local fetchExperienceDetailsPageModule = require(script.Parent.fetchExperienceDetailsPage)
local getExperienceDetailsPageKeyModule = require(script.Parent.getExperienceDetailsPageKey)
local removeGameDetailSessionIfDepartedModule = require(script.Parent.removeGameDetailSessionIfDeparted)
local useEdpFunctionallyReadyLoggerModule = require(script.Parent.useEdpFunctionallyReadyLogger)
local useMotionJitterMetricModule = require(script.Parent.useMotionJitterMetric)
local experienceDetailsFallbackActionBarModule = require(script.Parent.Fallback.ExperienceDetailsFallbackActionBar)
local experienceDetailsFallbackFeedModule = require(script.Parent.Fallback.ExperienceDetailsFallbackFeed)
local setTabBarVisible = require(parent.AppTabBarRodux).Actions.SetTabBarVisible
local discoveryTypesModule = require(parent.DiscoveryTypes)
local gameDetailsPeekViewEvents = require(parent.DiscoveryAnalytics).Events.gameDetailsPeekViewEvents
local navigationModule = require(parent.Navigation)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sheet = foundationModule.Sheet
local overlayProvider = foundationModule.OverlayProvider
local useTokens = foundationModule.Hooks.useTokens
local useNavigation = navigationModule.useNavigation
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
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useStore = roactUtilsModule.Hooks.RoactRodux.useStore
local useGetCurrentLegacyRoute = require(parent.DiscoveryRouting).useGetCurrentLegacyRoute
local hasPageInCurrentRoute = require(parent.DiscoveryRouting).hasPageInCurrentRoute
local peekViewState = require(parent.PeekView).PeekViewState
local setGameDetailsPeekViewStateModule = require(gameDetail.PeekView.SetGameDetailsPeekViewState)
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
local compositionTags = require(parent.AppComposition).CompositionTags
local experienceDetailsPersistentActionBarModule = require(script.Parent.ExperienceDetailsPersistentActionBar)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiPageEntryUseSharedHooks = sharedFlagsModule.FFlagSduiPageEntryUseSharedHooks
local fFlagEnableExperienceDetailsBottomSheetTopBar = sharedFlagsModule.FFlagEnableExperienceDetailsBottomSheetTopBar
local fFlagEnableMotionJitterMetric = sharedFlagsModule.FFlagEnableMotionJitterMetric
local fFlagLuaAppSduiEdpRouteAwareSessionRemoval = sharedFlagsModule.FFlagLuaAppSduiEdpRouteAwareSessionRemoval
local fFlagSduiEdpPersistentActionBarPlayButton = sharedFlagsModule.FFlagSduiEdpPersistentActionBarPlayButton
local fFlagLuaAppEdpBottomSheetPeekViewEvents = sharedFlagsModule.FFlagLuaAppEdpBottomSheetPeekViewEvents

local function _(p0) --[[ line: 79 | named "snapPointIndexFor" ]]
	return if p0 then 2 else 1
end

return reactModule.memo(function(p1) --[[ line: 85 | named "ExperienceDetailsBottomSheet" ]]
	-- upvalues: experienceDetailsPageUtilsModule (ref), getExperienceDetailsPageKeyModule (ref), usePageScopeRef (ref), reactModule (ref), sduiSurfaceLoadTimeTracker (ref), EDPTTIConstants (ref), getSduiClientPageScope (ref), useEdpFunctionallyReadyLoggerModule (ref), useTokens (ref), useNavigation (ref), useRoactService (ref), appSessionService (ref), useDispatch (ref), fFlagLuaAppEdpBottomSheetPeekViewEvents (ref), appEventIngestService (ref), fFlagLuaAppSduiEdpRouteAwareSessionRemoval (ref), useGetCurrentLegacyRoute (ref), setTabBarVisible (ref), fFlagEnableExperienceDetailsBottomSheetTopBar (ref), useTopBarHeight (ref), useScreenSize (ref), useDeviceInsets (ref), getSafeAreaSize (ref), discoveryTypesModule (ref), useEntrySurfacing (ref), experienceDetailsPageConstantsModule (ref), useStore (ref), peekViewState (ref), gameDetailsPeekViewEvents (ref), setGameDetailsPeekViewStateModule (ref), hasPageInCurrentRoute (ref), appPage (ref), fFlagEnableMotionJitterMetric (ref), useMotionJitterMetricModule (ref), removeGameDetailSessionIfDepartedModule (ref), sessionType (ref), fetchExperienceDetailsPageModule (ref), useUiStatus (ref), uiStatus (ref), dataHydrationModule (ref), overlayProvider (ref), experienceDetailsBottomSheetTopBarModule (ref), sheet (ref), foundationModule (ref), sduiPageEntryPoint (ref), fFlagSduiPageEntryUseSharedHooks (ref), compositionTags (ref), experienceDetailsFallbackFeedModule (ref), fFlagSduiEdpPersistentActionBarPlayButton (ref), experienceDetailsPersistentActionBarModule (ref), sduiFeatureEntryPoint (ref), experienceDetailsFallbackActionBarModule (ref)
	local universeId = experienceDetailsPageUtilsModule.getUniverseId(p1)
	local onPeekViewClosed = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "onPeekViewClosed")
	local var24 = getExperienceDetailsPageKeyModule(universeId)
	usePageScopeRef(var24)
	local var25 = reactModule.useMemo(function() --[[ line: 91 ]]
		-- upvalues: experienceDetailsPageUtilsModule (copy), p1 (ref), sduiSurfaceLoadTimeTracker (copy), var24 (ref), EDPTTIConstants (copy), getSduiClientPageScope (copy)
		local var63 = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "pageTimer") or sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(var24, {
			manualSurfaceReady = true,
			eventName = EDPTTIConstants.EDP_TTI_EVENT_NAME,
			metadata = {
				page = "Untracked",
				category = EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_PEEK_VIEW
			}
		})
		getSduiClientPageScope(var24).set(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, var63)
		
		return var63
	end, {})
	useEdpFunctionallyReadyLoggerModule(var25, universeId)
	local var26 = useTokens()
	local var27 = useNavigation()
	local var28 = useRoactService(appSessionService)
	local var29 = useDispatch()
	local var30 = if fFlagLuaAppEdpBottomSheetPeekViewEvents then useRoactService(appEventIngestService) else nil
	local var31 = if fFlagLuaAppSduiEdpRouteAwareSessionRemoval or fFlagLuaAppEdpBottomSheetPeekViewEvents then useGetCurrentLegacyRoute() else nil
	reactModule.useEffect(function() --[[ line: 122 ]]
		-- upvalues: var29 (ref), setTabBarVisible (copy)
		var29(setTabBarVisible(false))
	end, { var29 })
	local referralSource = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "referralSource")
	local experienceJoinData = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "experienceJoinData")
	local placeIdOverride = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "placeIdOverride")
	reactModule.useEffect(function() --[[ line: 130 ]]
		-- upvalues: getSduiClientPageScope (copy), var24 (ref), referralSource (ref), experienceJoinData (ref), placeIdOverride (ref)
		local var64 = getSduiClientPageScope(var24)
		var64.set("referralSource", referralSource)
		var64.set("experienceJoinData", experienceJoinData)
		var64.set("placeId", placeIdOverride)
		var64.set("launchSource", "LuaGameCard")
	end, {
		var24,
		referralSource,
		experienceJoinData,
		placeIdOverride
	})
	local var35 = if fFlagEnableExperienceDetailsBottomSheetTopBar then useTopBarHeight() else nil
	local var36 = useScreenSize()
	local var37 = useDeviceInsets()
	local var38 = getSafeAreaSize(var36, var37)
	local minValue = math.min(var38.X.Offset, 640)
	local var40 = if fFlagEnableExperienceDetailsBottomSheetTopBar then reactModule.useRef(nil) else nil
	local var41 = reactModule.useRef(nil)
	local var42, var43 = reactModule.useState(nil)
	local var44, var45 = reactModule.useState(discoveryTypesModule.Constants.GAME_DETAILS_ACTION_BAR_HEIGHT)
	local var46 = reactModule.useCallback(function(p2) --[[ line: 154 ]]
		-- upvalues: var45 (ref)
		local y = p2.AbsoluteSize.Y
		
		if y > 0 then
			var45(y)
		end
	end, {})
	local var47 = useEntrySurfacing(var24, experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER, "peekView")
	local var48 = if var47 then var47.heightOffset else 0
	local var49 = reactModule.useMemo(function() --[[ line: 165 ]]
		-- upvalues: minValue (ref), var44 (ref), var48 (ref), fFlagEnableExperienceDetailsBottomSheetTopBar (copy), var36 (ref), var37 (ref), var35 (write), var38 (ref)
		return {
			minValue + var44 + var48 + 25,
			if fFlagEnableExperienceDetailsBottomSheetTopBar then math.ceil(var36.Y) - var37.bottom - var35 else var38.Y.Offset
		}
	end, if fFlagEnableExperienceDetailsBottomSheetTopBar then {
		minValue, var44, var48, var36.Y, var37.bottom, var35
	} else { minValue, var44, var48, var38.Y.Offset })
	local mountAsFullView = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "mountAsFullView")
	local var51 = mountAsFullView == true
	local var52 = nil
	
	if fFlagLuaAppEdpBottomSheetPeekViewEvents then
		local var53 = useStore()
		local analyticsSource = experienceDetailsPageUtilsModule.getAnalyticsSource(p1)
		local tilePositionIndex = experienceDetailsPageUtilsModule.getTilePositionIndex(p1)
		local var56 = reactModule.useMemo(function() --[[ line: 201 ]]
			-- upvalues: var53 (ref)
			return var53:getState().GameDetailsPeekView.viewState
		end, {})
		
		if mountAsFullView == nil then
			var51 = if var56 ~= peekViewState.Full then var56 == peekViewState.Extended else true
		else
			local _ = mountAsFullView == true
		end
		reactModule.useEffect(function() --[[ line: 210 ]]
			-- upvalues: universeId (ref), var51 (write), var56 (ref), peekViewState (copy), gameDetailsPeekViewEvents (copy), var30 (write), analyticsSource (ref), tilePositionIndex (ref), experienceDetailsPageConstantsModule (copy), var29 (ref), setGameDetailsPeekViewStateModule (copy), hasPageInCurrentRoute (copy), var31 (write), appPage (copy)
			if universeId and not var51 then
				local var65 = if var56 == peekViewState.Brief then "SwitchGame" elseif var56 == peekViewState.Closed then "OpenPeekView" else nil
				
				if var65 then
					gameDetailsPeekViewEvents(var30, var65, universeId, analyticsSource, tilePositionIndex, experienceDetailsPageConstantsModule.EDP_BOTTOM_SHEET_SURFACE)
				end
			end
			var29(setGameDetailsPeekViewStateModule(if var51 then peekViewState.Full else peekViewState.Brief))
			
			return function() --[[ line: 233 ]]
				-- upvalues: hasPageInCurrentRoute (copy), var31 (copy), appPage (copy), var29 (copy), setGameDetailsPeekViewStateModule (copy), peekViewState (copy)
				if not hasPageInCurrentRoute(var31(), appPage.GameDetail) then
					var29(setGameDetailsPeekViewStateModule(peekViewState.Closed))
				end
			end
		end, {})
		local var57 = reactModule.useRef(if var51 then 2 else 1)
		var52 = reactModule.useCallback(function(_, p3) --[[ line: 243 ]]
			-- upvalues: var57 (ref), var27 (ref), var29 (ref), setGameDetailsPeekViewStateModule (copy), peekViewState (copy), universeId (ref), gameDetailsPeekViewEvents (copy), var30 (write), analyticsSource (ref), tilePositionIndex (ref), experienceDetailsPageConstantsModule (copy)
			local current = var57.current
			var57.current = p3
			
			if var27.isFocused() then
				var29(setGameDetailsPeekViewStateModule(if p3 == 2 then peekViewState.Full else peekViewState.Brief))
			end
			if universeId and current == 1 and p3 == 2 then
				gameDetailsPeekViewEvents(var30, "GoToFullView", universeId, analyticsSource, tilePositionIndex, experienceDetailsPageConstantsModule.EDP_BOTTOM_SHEET_SURFACE)
			end
		end, {
			var30, universeId, analyticsSource, tilePositionIndex, var29, var27
		})
	end
	local var58 = if var51 then 2 else 1
	
	if fFlagEnableMotionJitterMetric then
		useMotionJitterMetricModule(var41, experienceDetailsPageConstantsModule.EDP_BOTTOM_SHEET_SURFACE, false, "AbsolutePosition")
	end
	local var59 = reactModule.useCallback(function() --[[ line: 279 ]]
		-- upvalues: var27 (ref), fFlagLuaAppSduiEdpRouteAwareSessionRemoval (copy), var31 (write), onPeekViewClosed (ref), removeGameDetailSessionIfDepartedModule (copy), var28 (ref), sessionType (copy)
		if var27.isFocused() then
			local var66 = if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then var31() else nil
			
			if onPeekViewClosed and typeof(onPeekViewClosed) == "function" then
				onPeekViewClosed()
			end
			var27.goBack()
			
			if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then
				removeGameDetailSessionIfDepartedModule(var28, var66)
				
				return
			elseif var28 then
				var28:RemoveSession(sessionType.StructuralIdentifier.GameDetailSource)
			end
		end
	end, {
		var27,
		var28,
		onPeekViewClosed,
		if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then var31 else nil
	})
	local var60 = reactModule.useCallback(function() --[[ line: 301 ]]
		-- upvalues: var27 (ref), onPeekViewClosed (ref), appPage (copy), var28 (ref), sessionType (copy)
		if var27.isFocused() then
			if onPeekViewClosed and typeof(onPeekViewClosed) == "function" then
				onPeekViewClosed()
			end
			var27.clearAppScreens({ appPage.GameDetail })
			
			if var28 then
				var28:RemoveSession(sessionType.StructuralIdentifier.GameDetailSource)
			end
		end
	end, { var27, var28, onPeekViewClosed })
	local var61 = if fFlagLuaAppEdpBottomSheetPeekViewEvents then var60 elseif var51 then var59 else var60
	reactModule.useEffect(function() --[[ line: 322 ]]
		-- upvalues: universeId (ref), var25 (ref), fetchExperienceDetailsPageModule (copy)
		if universeId and var25 then
			fetchExperienceDetailsPageModule(universeId, var25)
		end
	end, { universeId, var25 })
	local var62 = useUiStatus(var24)
	reactModule.useEffect(function() --[[ line: 329 ]]
		-- upvalues: var62 (ref), uiStatus (copy), universeId (ref), dataHydrationModule (copy)
		if var62 == uiStatus.Error and universeId then
			dataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(universeId, function(p4) --[[ line: 331 ]]
				return if p4 ~= nil then p4.creator == nil else true
			end)
			dataHydrationModule.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(universeId)
		end
	end, { var62, universeId })
	
	return if universeId == nil then nil else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ref = var43
	}, {
		SheetProvider = var42 and (reactModule.createElement(overlayProvider, { gui = var42 }, {
			TopBar = if fFlagEnableExperienceDetailsBottomSheetTopBar then reactModule.createElement(experienceDetailsBottomSheetTopBarModule, {
				tokens = var26,
				navigation = var27,
				deviceInsets = var37,
				topBarHeight = var35,
				briefH = var49[1],
				fullH = var49[2],
				overlayFrame = var42,
				sheetContentRef = var40,
				shouldMountAsFullView = var51,
				onBack = var59,
				onClose = var60
			}) else nil,
			SheetRoot = reactModule.createElement(sheet.Root, {
				isOpen = true,
				testId = "--experience-details-bottom-sheet",
				onClose = var61,
				snapPoints = var49,
				defaultSnapPointIndex = var58,
				onSnapPointChanged = if fFlagLuaAppEdpBottomSheetPeekViewEvents then var52 else nil
			}, {
				Content = reactModule.createElement(sheet.Content, {
					isContentFullBleed = true,
					scrollingFrameRef = var41,
					ref = if fFlagEnableExperienceDetailsBottomSheetTopBar then var40 else nil
				}, {
					ContentWrapper = reactModule.createElement(foundationModule.View, { tag = "col size-full-0 auto-y" }, {
						Content = reactModule.createElement(sduiPageEntryPoint, {
							includeNavigationHeaderBar = false,
							snackbarPortalLayoutOrder = 2147483647,
							appPage = appPage.GameDetail,
							configKey = var24,
							identifier = if fFlagSduiPageEntryUseSharedHooks then experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER else experienceDetailsPageUtilsModule.getResolvedIdentifier(var24, experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER_SUFFIX),
							pageTimer = var25,
							backgroundStyle = var26.Color.Surface.Surface_100,
							scrollingFrameRef = var41,
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
								refresh = reactModule.useCallback(function() --[[ line: 338 ]]
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
					})
				}),
				Actions = reactModule.createElement(sheet.Actions, {}, {
					ActionBarWrapper = reactModule.createElement(foundationModule.View, {
						tag = "col size-full-0 auto-y",
						padding = UDim.new(0, -var26.Margin.Small)
					}, {
						ActionBar = if fFlagSduiEdpPersistentActionBarPlayButton then reactModule.createElement(experienceDetailsPersistentActionBarModule, {
							launchSource = "LuaGameCard",
							universeId = universeId,
							configKey = var24,
							loadTimer = var25,
							referralSource = referralSource,
							experienceJoinData = experienceJoinData,
							placeIdOverride = placeIdOverride,
							onAbsoluteSizeChange = var46
						}) else reactModule.createElement(sduiFeatureEntryPoint, {
							appPage = appPage.GameDetail,
							configKey = var24,
							identifier = experienceDetailsPageConstantsModule.EDP_ACTION_BAR_IDENTIFIER,
							loadTimer = var25,
							AutomaticSize = Enum.AutomaticSize.XY,
							onAbsoluteSizeChange = var46,
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
				})
			})
		}) or nil)
	})
end)