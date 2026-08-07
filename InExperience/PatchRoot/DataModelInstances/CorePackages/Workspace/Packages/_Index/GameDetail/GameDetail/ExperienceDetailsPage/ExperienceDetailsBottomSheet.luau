local parent = script:FindFirstAncestor("GameDetail").Parent
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
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useGetCurrentLegacyRoute = require(parent.DiscoveryRouting).useGetCurrentLegacyRoute
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
local foundationFullBleedSheetContent = foundationModule.Utility.Flags.FoundationFullBleedSheetContent
local fFlagLuaAppEdpBottomSheetPeekViewEvents = sharedFlagsModule.FFlagLuaAppEdpBottomSheetPeekViewEvents

return reactModule.memo(function(p0) --[[ line: 78 | named "ExperienceDetailsBottomSheet" ]]
	-- upvalues: experienceDetailsPageUtilsModule (ref), getExperienceDetailsPageKeyModule (ref), usePageScopeRef (ref), reactModule (ref), sduiSurfaceLoadTimeTracker (ref), EDPTTIConstants (ref), getSduiClientPageScope (ref), useEdpFunctionallyReadyLoggerModule (ref), useTokens (ref), useNavigation (ref), useRoactService (ref), appSessionService (ref), useDispatch (ref), fFlagLuaAppEdpBottomSheetPeekViewEvents (ref), appEventIngestService (ref), fFlagLuaAppSduiEdpRouteAwareSessionRemoval (ref), useGetCurrentLegacyRoute (ref), setTabBarVisible (ref), fFlagEnableExperienceDetailsBottomSheetTopBar (ref), useTopBarHeight (ref), useScreenSize (ref), useDeviceInsets (ref), getSafeAreaSize (ref), discoveryTypesModule (ref), useEntrySurfacing (ref), experienceDetailsPageConstantsModule (ref), gameDetailsPeekViewEvents (ref), fFlagEnableMotionJitterMetric (ref), useMotionJitterMetricModule (ref), removeGameDetailSessionIfDepartedModule (ref), sessionType (ref), appPage (ref), fetchExperienceDetailsPageModule (ref), useUiStatus (ref), uiStatus (ref), dataHydrationModule (ref), overlayProvider (ref), experienceDetailsBottomSheetTopBarModule (ref), sheet (ref), foundationFullBleedSheetContent (ref), foundationModule (ref), sduiPageEntryPoint (ref), fFlagSduiPageEntryUseSharedHooks (ref), compositionTags (ref), experienceDetailsFallbackFeedModule (ref), fFlagSduiEdpPersistentActionBarPlayButton (ref), experienceDetailsPersistentActionBarModule (ref), sduiFeatureEntryPoint (ref), experienceDetailsFallbackActionBarModule (ref)
	local universeId = experienceDetailsPageUtilsModule.getUniverseId(p0)
	local onPeekViewClosed = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "onPeekViewClosed")
	local var21 = getExperienceDetailsPageKeyModule(universeId)
	usePageScopeRef(var21)
	local var22 = reactModule.useMemo(function() --[[ line: 84 ]]
		-- upvalues: experienceDetailsPageUtilsModule (copy), p0 (ref), sduiSurfaceLoadTimeTracker (copy), var21 (ref), EDPTTIConstants (copy), getSduiClientPageScope (copy)
		local var56 = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "pageTimer") or sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(var21, {
			manualSurfaceReady = true,
			eventName = EDPTTIConstants.EDP_TTI_EVENT_NAME,
			metadata = {
				page = "Untracked",
				category = EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_PEEK_VIEW
			}
		})
		getSduiClientPageScope(var21).set(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, var56)
		
		return var56
	end, {})
	useEdpFunctionallyReadyLoggerModule(var22, universeId)
	local var23 = useTokens()
	local var24 = useNavigation()
	local var25 = useRoactService(appSessionService)
	local var26 = useDispatch()
	local var27 = if fFlagLuaAppEdpBottomSheetPeekViewEvents then useRoactService(appEventIngestService) else nil
	local var28 = if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then useGetCurrentLegacyRoute() else nil
	reactModule.useEffect(function() --[[ line: 115 ]]
		-- upvalues: var26 (ref), setTabBarVisible (copy)
		var26(setTabBarVisible(false))
	end, { var26 })
	local referralSource = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "referralSource")
	local experienceJoinData = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "experienceJoinData")
	local placeIdOverride = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "placeIdOverride")
	reactModule.useEffect(function() --[[ line: 123 ]]
		-- upvalues: getSduiClientPageScope (copy), var21 (ref), referralSource (ref), experienceJoinData (ref), placeIdOverride (ref)
		local var57 = getSduiClientPageScope(var21)
		var57.set("referralSource", referralSource)
		var57.set("experienceJoinData", experienceJoinData)
		var57.set("placeId", placeIdOverride)
		var57.set("launchSource", "LuaGameCard")
	end, {
		var21,
		referralSource,
		experienceJoinData,
		placeIdOverride
	})
	local var32 = if fFlagEnableExperienceDetailsBottomSheetTopBar then useTopBarHeight() else nil
	local var33 = useScreenSize()
	local var34 = useDeviceInsets()
	local var35 = getSafeAreaSize(var33, var34)
	local minValue = math.min(var35.X.Offset, 640)
	local var37 = if fFlagEnableExperienceDetailsBottomSheetTopBar then reactModule.useRef(nil) else nil
	local var38 = reactModule.useRef(nil)
	local var39, var40 = reactModule.useState(nil)
	local var41, var42 = reactModule.useState(discoveryTypesModule.Constants.GAME_DETAILS_ACTION_BAR_HEIGHT)
	local var43 = reactModule.useCallback(function(p1) --[[ line: 147 ]]
		-- upvalues: var42 (ref)
		local y = p1.AbsoluteSize.Y
		
		if y > 0 then
			var42(y)
		end
	end, {})
	local var44 = useEntrySurfacing(var21, experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER, "peekView")
	local var45 = if var44 then var44.heightOffset else 0
	local var46 = reactModule.useMemo(function() --[[ line: 158 ]]
		-- upvalues: minValue (ref), var41 (ref), var45 (ref), fFlagEnableExperienceDetailsBottomSheetTopBar (copy), var33 (ref), var34 (ref), var32 (write), var35 (ref)
		return {
			minValue + var41 + var45 + 25,
			if fFlagEnableExperienceDetailsBottomSheetTopBar then math.ceil(var33.Y) - var34.bottom - var32 else var35.Y.Offset
		}
	end, if fFlagEnableExperienceDetailsBottomSheetTopBar then {
		minValue, var41, var45, var33.Y, var34.bottom, var32
	} else { minValue, var41, var45, var35.Y.Offset })
	local var47 = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "mountAsFullView") == true
	local var48 = if var47 then 2 else 1
	local _ = nil
	local var49 = nil
	
	if fFlagLuaAppEdpBottomSheetPeekViewEvents then
		local analyticsSource = experienceDetailsPageUtilsModule.getAnalyticsSource(p0)
		local tilePositionIndex = experienceDetailsPageUtilsModule.getTilePositionIndex(p0)
		local var52 = reactModule.useRef(var48)
		var49 = reactModule.useCallback(function(_, p2) --[[ line: 192 ]]
			-- upvalues: var52 (write), universeId (ref), gameDetailsPeekViewEvents (copy), var27 (write), analyticsSource (ref), tilePositionIndex (ref), experienceDetailsPageConstantsModule (copy)
			local current = var52.current
			var52.current = p2
			
			if universeId and current == 1 and p2 == 2 then
				gameDetailsPeekViewEvents(var27, "GoToFullView", universeId, analyticsSource, tilePositionIndex, experienceDetailsPageConstantsModule.EDP_BOTTOM_SHEET_SURFACE)
			end
		end, { var27, universeId, analyticsSource, tilePositionIndex })
	end
	if fFlagEnableMotionJitterMetric then
		useMotionJitterMetricModule(var38, experienceDetailsPageConstantsModule.EDP_BOTTOM_SHEET_SURFACE, false, "AbsolutePosition")
	end
	local var53 = reactModule.useCallback(function() --[[ line: 218 ]]
		-- upvalues: var24 (ref), fFlagLuaAppSduiEdpRouteAwareSessionRemoval (copy), var28 (write), onPeekViewClosed (ref), removeGameDetailSessionIfDepartedModule (copy), var25 (ref), sessionType (copy)
		if var24.isFocused() then
			local var58 = if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then var28() else nil
			
			if onPeekViewClosed and typeof(onPeekViewClosed) == "function" then
				onPeekViewClosed()
			end
			var24.goBack()
			
			if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then
				removeGameDetailSessionIfDepartedModule(var25, var58)
				
				return
			elseif var25 then
				var25:RemoveSession(sessionType.StructuralIdentifier.GameDetailSource)
			end
		end
	end, {
		var24,
		var25,
		onPeekViewClosed,
		if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then var28 else nil
	})
	local var54 = reactModule.useCallback(function() --[[ line: 240 ]]
		-- upvalues: var24 (ref), onPeekViewClosed (ref), appPage (copy), var25 (ref), sessionType (copy)
		if var24.isFocused() then
			if onPeekViewClosed and typeof(onPeekViewClosed) == "function" then
				onPeekViewClosed()
			end
			var24.clearAppScreens({ appPage.GameDetail })
			
			if var25 then
				var25:RemoveSession(sessionType.StructuralIdentifier.GameDetailSource)
			end
		end
	end, { var24, var25, onPeekViewClosed })
	reactModule.useEffect(function() --[[ line: 252 ]]
		-- upvalues: universeId (ref), var22 (ref), fetchExperienceDetailsPageModule (copy)
		if universeId and var22 then
			fetchExperienceDetailsPageModule(universeId, var22)
		end
	end, { universeId, var22 })
	local var55 = useUiStatus(var21)
	reactModule.useEffect(function() --[[ line: 259 ]]
		-- upvalues: var55 (ref), uiStatus (copy), universeId (ref), dataHydrationModule (copy)
		if var55 == uiStatus.Error and universeId then
			dataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(universeId, function(p3) --[[ line: 261 ]]
				return if p3 ~= nil then p3.creator == nil else true
			end)
			dataHydrationModule.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(universeId)
		end
	end, { var55, universeId })
	
	return if universeId == nil then nil else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ref = var40
	}, {
		SheetProvider = var39 and (reactModule.createElement(overlayProvider, { gui = var39 }, {
			TopBar = if fFlagEnableExperienceDetailsBottomSheetTopBar then reactModule.createElement(experienceDetailsBottomSheetTopBarModule, {
				tokens = var23,
				navigation = var24,
				deviceInsets = var34,
				topBarHeight = var32,
				briefH = var46[1],
				fullH = var46[2],
				overlayFrame = var39,
				sheetContentRef = var37,
				shouldMountAsFullView = var47,
				onBack = var53,
				onClose = var54
			}) else nil,
			SheetRoot = reactModule.createElement(sheet.Root, {
				isOpen = true,
				testId = "--experience-details-bottom-sheet",
				onClose = if var47 then var53 else var54,
				snapPoints = var46,
				defaultSnapPointIndex = var48,
				onSnapPointChanged = if fFlagLuaAppEdpBottomSheetPeekViewEvents then var49 else nil
			}, {
				Content = reactModule.createElement(sheet.Content, {
					isContentFullBleed = if foundationFullBleedSheetContent then true else nil,
					scrollingFrameRef = var38,
					ref = if fFlagEnableExperienceDetailsBottomSheetTopBar then var37 else nil
				}, {
					ContentWrapper = reactModule.createElement(foundationModule.View, {
						tag = "col size-full-0 auto-y",
						padding = if not foundationFullBleedSheetContent then {
							bottom = UDim.new(0, -var23.Margin.Small),
							left = UDim.new(0, -(var23.Padding.Small + var23.Padding.Medium)),
							right = UDim.new(0, -(var23.Padding.Small + var23.Padding.Medium))
						} else nil
					}, {
						Content = reactModule.createElement(sduiPageEntryPoint, {
							includeNavigationHeaderBar = false,
							snackbarPortalLayoutOrder = 2147483647,
							appPage = appPage.GameDetail,
							configKey = var21,
							identifier = if fFlagSduiPageEntryUseSharedHooks then experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER else experienceDetailsPageUtilsModule.getResolvedIdentifier(var21, experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER_SUFFIX),
							pageTimer = var22,
							backgroundStyle = var23.Color.Surface.Surface_100,
							scrollingFrameRef = var38,
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
								refresh = reactModule.useCallback(function() --[[ line: 268 ]]
									-- upvalues: universeId (ref), var22 (ref), fetchExperienceDetailsPageModule (copy)
									if universeId and var22 then
										fetchExperienceDetailsPageModule(universeId, var22, true)
									end
								end, { universeId, var22 }),
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
						padding = UDim.new(0, -var23.Margin.Small)
					}, {
						ActionBar = if fFlagSduiEdpPersistentActionBarPlayButton then reactModule.createElement(experienceDetailsPersistentActionBarModule, {
							launchSource = "LuaGameCard",
							universeId = universeId,
							configKey = var21,
							loadTimer = var22,
							referralSource = referralSource,
							experienceJoinData = experienceJoinData,
							placeIdOverride = placeIdOverride,
							onAbsoluteSizeChange = var43
						}) else reactModule.createElement(sduiFeatureEntryPoint, {
							appPage = appPage.GameDetail,
							configKey = var21,
							identifier = experienceDetailsPageConstantsModule.EDP_ACTION_BAR_IDENTIFIER,
							loadTimer = var22,
							AutomaticSize = Enum.AutomaticSize.XY,
							onAbsoluteSizeChange = var43,
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