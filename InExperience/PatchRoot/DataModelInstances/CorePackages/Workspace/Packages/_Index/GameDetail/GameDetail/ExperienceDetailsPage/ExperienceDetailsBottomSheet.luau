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

local function _(p1)
	return if p1 then 2 else 1
end

return reactModule.memo(function(p1)
	-- upvalues: experienceDetailsPageUtilsModule (ref), getExperienceDetailsPageKeyModule (ref), usePageScopeRef (ref), reactModule (ref), sduiSurfaceLoadTimeTracker (ref), EDPTTIConstants (ref), getSduiClientPageScope (ref), useEdpFunctionallyReadyLoggerModule (ref), useTokens (ref), useNavigation (ref), useRoactService (ref), appSessionService (ref), useDispatch (ref), fFlagLuaAppEdpBottomSheetPeekViewEvents (ref), appEventIngestService (ref), fFlagLuaAppSduiEdpRouteAwareSessionRemoval (ref), useGetCurrentLegacyRoute (ref), setTabBarVisible (ref), fFlagEnableExperienceDetailsBottomSheetTopBar (ref), useTopBarHeight (ref), useScreenSize (ref), useDeviceInsets (ref), getSafeAreaSize (ref), discoveryTypesModule (ref), useEntrySurfacing (ref), experienceDetailsPageConstantsModule (ref), useStore (ref), peekViewState (ref), gameDetailsPeekViewEvents (ref), setGameDetailsPeekViewStateModule (ref), hasPageInCurrentRoute (ref), appPage (ref), fFlagEnableMotionJitterMetric (ref), useMotionJitterMetricModule (ref), removeGameDetailSessionIfDepartedModule (ref), sessionType (ref), fetchExperienceDetailsPageModule (ref), useUiStatus (ref), uiStatus (ref), dataHydrationModule (ref), overlayProvider (ref), experienceDetailsBottomSheetTopBarModule (ref), sheet (ref), foundationModule (ref), sduiPageEntryPoint (ref), fFlagSduiPageEntryUseSharedHooks (ref), compositionTags (ref), experienceDetailsFallbackFeedModule (ref), fFlagSduiEdpPersistentActionBarPlayButton (ref), experienceDetailsPersistentActionBarModule (ref), sduiFeatureEntryPoint (ref), experienceDetailsFallbackActionBarModule (ref)
	local universeId = experienceDetailsPageUtilsModule.getUniverseId(p1)
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
	local var5 = useRoactService(appSessionService)
	local var6 = useDispatch()
	local var7 = if fFlagLuaAppEdpBottomSheetPeekViewEvents then useRoactService(appEventIngestService) else nil
	local var8 = if fFlagLuaAppSduiEdpRouteAwareSessionRemoval or fFlagLuaAppEdpBottomSheetPeekViewEvents then useGetCurrentLegacyRoute() else nil
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), setTabBarVisible (copy)
		var6(setTabBarVisible(false))
	end, { var6 })
	local referralSource = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "referralSource")
	local experienceJoinData = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "experienceJoinData")
	local placeIdOverride = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "placeIdOverride")
	reactModule.useEffect(function()
		-- upvalues: getSduiClientPageScope (copy), var1 (ref), referralSource (ref), experienceJoinData (ref), placeIdOverride (ref)
		local var9 = getSduiClientPageScope(var1)
		var9.set("referralSource", referralSource)
		var9.set("experienceJoinData", experienceJoinData)
		var9.set("placeId", placeIdOverride)
		var9.set("launchSource", "LuaGameCard")
	end, {
		var1,
		referralSource,
		experienceJoinData,
		placeIdOverride
	})
	local var9 = if fFlagEnableExperienceDetailsBottomSheetTopBar then useTopBarHeight() else nil
	local var10 = useScreenSize()
	local var11 = useDeviceInsets()
	local var12 = getSafeAreaSize(var10, var11)
	local minValue = math.min(var12.X.Offset, 640)
	local var13 = if fFlagEnableExperienceDetailsBottomSheetTopBar then reactModule.useRef(nil) else nil
	local var14 = reactModule.useRef(nil)
	local var15, var16 = reactModule.useState(nil)
	local var17, var18 = reactModule.useState(discoveryTypesModule.Constants.GAME_DETAILS_ACTION_BAR_HEIGHT)
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: var18 (ref)
		local y = p2.AbsoluteSize.Y
		
		if y > 0 then
			var18(y)
		end
	end, {})
	local var20 = useEntrySurfacing(var1, experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER, "peekView")
	local var21 = if var20 then var20.heightOffset else 0
	local var22 = reactModule.useMemo(function()
		-- upvalues: minValue (ref), var17 (ref), var21 (ref), fFlagEnableExperienceDetailsBottomSheetTopBar (copy), var10 (ref), var11 (ref), var9 (write), var12 (ref)
		return {
			minValue + var17 + var21 + 25,
			if fFlagEnableExperienceDetailsBottomSheetTopBar then math.ceil(var10.Y) - var11.bottom - var9 else var12.Y.Offset
		}
	end, if fFlagEnableExperienceDetailsBottomSheetTopBar then {
		minValue, var17, var21, var10.Y, var11.bottom, var9
	} else { minValue, var17, var21, var12.Y.Offset })
	local mountAsFullView = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "mountAsFullView")
	local var23 = mountAsFullView == true
	local var24 = nil
	
	if fFlagLuaAppEdpBottomSheetPeekViewEvents then
		local var25 = useStore()
		local analyticsSource = experienceDetailsPageUtilsModule.getAnalyticsSource(p1)
		local tilePositionIndex = experienceDetailsPageUtilsModule.getTilePositionIndex(p1)
		local var26 = reactModule.useMemo(function()
			-- upvalues: var25 (ref)
			return var25:getState().GameDetailsPeekView.viewState
		end, {})
		
		if mountAsFullView == nil then
			var23 = if var26 ~= peekViewState.Full then var26 == peekViewState.Extended else true
		else
			local _ = mountAsFullView == true
		end
		reactModule.useEffect(function()
			-- upvalues: universeId (ref), var23 (write), var26 (ref), peekViewState (copy), gameDetailsPeekViewEvents (copy), var7 (write), analyticsSource (ref), tilePositionIndex (ref), experienceDetailsPageConstantsModule (copy), var6 (ref), setGameDetailsPeekViewStateModule (copy), hasPageInCurrentRoute (copy), var8 (write), appPage (copy)
			if universeId and not var23 then
				local var27 = if var26 == peekViewState.Brief then "SwitchGame" elseif var26 == peekViewState.Closed then "OpenPeekView" else nil
				
				if var27 then
					gameDetailsPeekViewEvents(var7, var27, universeId, analyticsSource, tilePositionIndex, experienceDetailsPageConstantsModule.EDP_BOTTOM_SHEET_SURFACE)
				end
			end
			var6(setGameDetailsPeekViewStateModule(if var23 then peekViewState.Full else peekViewState.Brief))
			
			return function()
				-- upvalues: hasPageInCurrentRoute (copy), var8 (copy), appPage (copy), var6 (copy), setGameDetailsPeekViewStateModule (copy), peekViewState (copy)
				if not hasPageInCurrentRoute(var8(), appPage.GameDetail) then
					var6(setGameDetailsPeekViewStateModule(peekViewState.Closed))
				end
			end
		end, {})
		local var27 = reactModule.useRef(if var23 then 2 else 1)
		var24 = reactModule.useCallback(function(_, p2)
			-- upvalues: var27 (ref), var4 (ref), var6 (ref), setGameDetailsPeekViewStateModule (copy), peekViewState (copy), universeId (ref), gameDetailsPeekViewEvents (copy), var7 (write), analyticsSource (ref), tilePositionIndex (ref), experienceDetailsPageConstantsModule (copy)
			local current = var27.current
			var27.current = p2
			
			if var4.isFocused() then
				var6(setGameDetailsPeekViewStateModule(if p2 == 2 then peekViewState.Full else peekViewState.Brief))
			end
			if universeId and current == 1 and p2 == 2 then
				gameDetailsPeekViewEvents(var7, "GoToFullView", universeId, analyticsSource, tilePositionIndex, experienceDetailsPageConstantsModule.EDP_BOTTOM_SHEET_SURFACE)
			end
		end, {
			var7, universeId, analyticsSource, tilePositionIndex, var6, var4
		})
	end
	local var28 = if var23 then 2 else 1
	
	if fFlagEnableMotionJitterMetric then
		useMotionJitterMetricModule(var14, experienceDetailsPageConstantsModule.EDP_BOTTOM_SHEET_SURFACE, false, "AbsolutePosition")
	end
	local var29 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), fFlagLuaAppSduiEdpRouteAwareSessionRemoval (copy), var8 (write), onPeekViewClosed (ref), removeGameDetailSessionIfDepartedModule (copy), var5 (ref), sessionType (copy)
		if var4.isFocused() then
			local var30 = if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then var8() else nil
			
			if onPeekViewClosed and typeof(onPeekViewClosed) == "function" then
				onPeekViewClosed()
			end
			var4.goBack()
			
			if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then
				removeGameDetailSessionIfDepartedModule(var5, var30)
				
				return
			elseif var5 then
				var5:RemoveSession(sessionType.StructuralIdentifier.GameDetailSource)
			end
		end
	end, {
		var4,
		var5,
		onPeekViewClosed,
		if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then var8 else nil
	})
	local var30 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), onPeekViewClosed (ref), appPage (copy), var5 (ref), sessionType (copy)
		if var4.isFocused() then
			if onPeekViewClosed and typeof(onPeekViewClosed) == "function" then
				onPeekViewClosed()
			end
			var4.clearAppScreens({ appPage.GameDetail })
			
			if var5 then
				var5:RemoveSession(sessionType.StructuralIdentifier.GameDetailSource)
			end
		end
	end, { var4, var5, onPeekViewClosed })
	local var31 = if fFlagLuaAppEdpBottomSheetPeekViewEvents then var30 elseif var23 then var29 else var30
	reactModule.useEffect(function()
		-- upvalues: universeId (ref), var2 (ref), fetchExperienceDetailsPageModule (copy)
		if universeId and var2 then
			fetchExperienceDetailsPageModule(universeId, var2)
		end
	end, { universeId, var2 })
	local var32 = useUiStatus(var1)
	reactModule.useEffect(function()
		-- upvalues: var32 (ref), uiStatus (copy), universeId (ref), dataHydrationModule (copy)
		if var32 == uiStatus.Error and universeId then
			dataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(universeId, function(p2)
				return if p2 ~= nil then p2.creator == nil else true
			end)
			dataHydrationModule.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(universeId)
		end
	end, { var32, universeId })
	
	return if universeId == nil then nil else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ref = var16
	}, {
		SheetProvider = var15 and (reactModule.createElement(overlayProvider, { gui = var15 }, {
			TopBar = if fFlagEnableExperienceDetailsBottomSheetTopBar then reactModule.createElement(experienceDetailsBottomSheetTopBarModule, {
				tokens = var3,
				navigation = var4,
				deviceInsets = var11,
				topBarHeight = var9,
				briefH = var22[1],
				fullH = var22[2],
				overlayFrame = var15,
				sheetContentRef = var13,
				shouldMountAsFullView = var23,
				onBack = var29,
				onClose = var30
			}) else nil,
			SheetRoot = reactModule.createElement(sheet.Root, {
				isOpen = true,
				testId = "--experience-details-bottom-sheet",
				onClose = var31,
				snapPoints = var22,
				defaultSnapPointIndex = var28,
				onSnapPointChanged = if fFlagLuaAppEdpBottomSheetPeekViewEvents then var24 else nil
			}, {
				Content = reactModule.createElement(sheet.Content, {
					isContentFullBleed = true,
					scrollingFrameRef = var14,
					ref = if fFlagEnableExperienceDetailsBottomSheetTopBar then var13 else nil
				}, {
					ContentWrapper = reactModule.createElement(foundationModule.View, { tag = "col size-full-0 auto-y" }, {
						Content = reactModule.createElement(sduiPageEntryPoint, {
							includeNavigationHeaderBar = false,
							snackbarPortalLayoutOrder = 2147483647,
							appPage = appPage.GameDetail,
							configKey = var1,
							identifier = if fFlagSduiPageEntryUseSharedHooks then experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER else experienceDetailsPageUtilsModule.getResolvedIdentifier(var1, experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER_SUFFIX),
							pageTimer = var2,
							backgroundStyle = var3.Color.Surface.Surface_100,
							scrollingFrameRef = var14,
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
					})
				}),
				Actions = reactModule.createElement(sheet.Actions, {}, {
					ActionBarWrapper = reactModule.createElement(foundationModule.View, {
						tag = "col size-full-0 auto-y",
						padding = UDim.new(0, -var3.Margin.Small)
					}, {
						ActionBar = if fFlagSduiEdpPersistentActionBarPlayButton then reactModule.createElement(experienceDetailsPersistentActionBarModule, {
							launchSource = "LuaGameCard",
							universeId = universeId,
							configKey = var1,
							loadTimer = var2,
							referralSource = referralSource,
							experienceJoinData = experienceJoinData,
							placeIdOverride = placeIdOverride,
							onAbsoluteSizeChange = var19
						}) else reactModule.createElement(sduiFeatureEntryPoint, {
							appPage = appPage.GameDetail,
							configKey = var1,
							identifier = experienceDetailsPageConstantsModule.EDP_ACTION_BAR_IDENTIFIER,
							loadTimer = var2,
							AutomaticSize = Enum.AutomaticSize.XY,
							onAbsoluteSizeChange = var19,
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