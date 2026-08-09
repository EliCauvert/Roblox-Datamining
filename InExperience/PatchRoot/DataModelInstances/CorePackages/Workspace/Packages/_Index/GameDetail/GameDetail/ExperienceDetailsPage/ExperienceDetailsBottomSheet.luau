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
local appSessionService = require(parent.RoactServiceTags).AppSessionService
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
local fFlagLuaAppCompositionSduiEnabled = sharedFlagsModule.FFlagLuaAppCompositionSduiEnabled
local fFlagEnableExperienceDetailsBottomSheetTopBar = sharedFlagsModule.FFlagEnableExperienceDetailsBottomSheetTopBar
local fFlagEnableMotionJitterMetric = sharedFlagsModule.FFlagEnableMotionJitterMetric
local fFlagLuaAppSduiEdpRouteAwareSessionRemoval = sharedFlagsModule.FFlagLuaAppSduiEdpRouteAwareSessionRemoval
local fFlagSduiEdpPersistentActionBarPlayButton = sharedFlagsModule.FFlagSduiEdpPersistentActionBarPlayButton
local foundationFullBleedSheetContent = foundationModule.Utility.Flags.FoundationFullBleedSheetContent

return reactModule.memo(function(p0) --[[ line: 74 | named "ExperienceDetailsBottomSheet" ]]
	-- upvalues: experienceDetailsPageUtilsModule (ref), getExperienceDetailsPageKeyModule (ref), usePageScopeRef (ref), reactModule (ref), sduiSurfaceLoadTimeTracker (ref), EDPTTIConstants (ref), getSduiClientPageScope (ref), useEdpFunctionallyReadyLoggerModule (ref), useTokens (ref), useNavigation (ref), useRoactService (ref), appSessionService (ref), useDispatch (ref), fFlagLuaAppSduiEdpRouteAwareSessionRemoval (ref), useGetCurrentLegacyRoute (ref), setTabBarVisible (ref), fFlagEnableExperienceDetailsBottomSheetTopBar (ref), useTopBarHeight (ref), useScreenSize (ref), useDeviceInsets (ref), getSafeAreaSize (ref), discoveryTypesModule (ref), useEntrySurfacing (ref), experienceDetailsPageConstantsModule (ref), fFlagEnableMotionJitterMetric (ref), useMotionJitterMetricModule (ref), removeGameDetailSessionIfDepartedModule (ref), sessionType (ref), appPage (ref), fetchExperienceDetailsPageModule (ref), useUiStatus (ref), uiStatus (ref), dataHydrationModule (ref), overlayProvider (ref), experienceDetailsBottomSheetTopBarModule (ref), sheet (ref), foundationFullBleedSheetContent (ref), foundationModule (ref), sduiPageEntryPoint (ref), fFlagSduiPageEntryUseSharedHooks (ref), fFlagLuaAppCompositionSduiEnabled (ref), compositionTags (ref), experienceDetailsFallbackFeedModule (ref), fFlagSduiEdpPersistentActionBarPlayButton (ref), experienceDetailsPersistentActionBarModule (ref), sduiFeatureEntryPoint (ref), experienceDetailsFallbackActionBarModule (ref)
	local universeId = experienceDetailsPageUtilsModule.getUniverseId(p0)
	local onPeekViewClosed = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "onPeekViewClosed")
	local var20 = getExperienceDetailsPageKeyModule(universeId)
	usePageScopeRef(var20)
	local var21 = reactModule.useMemo(function() --[[ line: 80 ]]
		-- upvalues: experienceDetailsPageUtilsModule (copy), p0 (ref), sduiSurfaceLoadTimeTracker (copy), var20 (ref), EDPTTIConstants (copy), getSduiClientPageScope (copy)
		local var50 = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "pageTimer") or sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(var20, {
			manualSurfaceReady = true,
			eventName = EDPTTIConstants.EDP_TTI_EVENT_NAME,
			metadata = {
				page = "Untracked",
				category = EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_PEEK_VIEW
			}
		})
		getSduiClientPageScope(var20).set(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, var50)
		
		return var50
	end, {})
	useEdpFunctionallyReadyLoggerModule(var21, universeId)
	local var22 = useTokens()
	local var23 = useNavigation()
	local var24 = useRoactService(appSessionService)
	local var25 = useDispatch()
	local var26 = if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then useGetCurrentLegacyRoute() else nil
	reactModule.useEffect(function() --[[ line: 107 ]]
		-- upvalues: var25 (ref), setTabBarVisible (copy)
		var25(setTabBarVisible(false))
	end, { var25 })
	local referralSource = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "referralSource")
	local experienceJoinData = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "experienceJoinData")
	local placeIdOverride = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "placeIdOverride")
	reactModule.useEffect(function() --[[ line: 115 ]]
		-- upvalues: getSduiClientPageScope (copy), var20 (ref), referralSource (ref), experienceJoinData (ref), placeIdOverride (ref)
		local var51 = getSduiClientPageScope(var20)
		var51.set("referralSource", referralSource)
		var51.set("experienceJoinData", experienceJoinData)
		var51.set("placeId", placeIdOverride)
		var51.set("launchSource", "LuaGameCard")
	end, {
		var20,
		referralSource,
		experienceJoinData,
		placeIdOverride
	})
	local var30 = if fFlagEnableExperienceDetailsBottomSheetTopBar then useTopBarHeight() else nil
	local var31 = useScreenSize()
	local var32 = useDeviceInsets()
	local var33 = getSafeAreaSize(var31, var32)
	local minValue = math.min(var33.X.Offset, 640)
	local var35 = if fFlagEnableExperienceDetailsBottomSheetTopBar then reactModule.useRef(nil) else nil
	local var36 = reactModule.useRef(nil)
	local var37, var38 = reactModule.useState(nil)
	local var39, var40 = reactModule.useState(discoveryTypesModule.Constants.GAME_DETAILS_ACTION_BAR_HEIGHT)
	local var41 = reactModule.useCallback(function(p1) --[[ line: 139 ]]
		-- upvalues: var40 (ref)
		local y = p1.AbsoluteSize.Y
		
		if y > 0 then
			var40(y)
		end
	end, {})
	local var42 = useEntrySurfacing(var20, experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER, "peekView")
	local var43 = if var42 then var42.heightOffset else 0
	local var44 = reactModule.useMemo(function() --[[ line: 150 ]]
		-- upvalues: minValue (ref), var39 (ref), var43 (ref), fFlagEnableExperienceDetailsBottomSheetTopBar (copy), var31 (ref), var32 (ref), var30 (write), var33 (ref)
		return {
			minValue + var39 + var43 + 25,
			if fFlagEnableExperienceDetailsBottomSheetTopBar then math.ceil(var31.Y) - var32.bottom - var30 else var33.Y.Offset
		}
	end, if fFlagEnableExperienceDetailsBottomSheetTopBar then {
		minValue, var39, var43, var31.Y, var32.bottom, var30
	} else { minValue, var39, var43, var33.Y.Offset })
	local var45 = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "mountAsFullView") == true
	local var46 = if var45 then 2 else 1
	
	if fFlagEnableMotionJitterMetric then
		useMotionJitterMetricModule(var36, "bottomSheet", false, "AbsolutePosition")
	end
	local var47 = reactModule.useCallback(function() --[[ line: 183 ]]
		-- upvalues: var23 (ref), fFlagLuaAppSduiEdpRouteAwareSessionRemoval (copy), var26 (write), onPeekViewClosed (ref), removeGameDetailSessionIfDepartedModule (copy), var24 (ref), sessionType (copy)
		if var23.isFocused() then
			local var52 = if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then var26() else nil
			
			if onPeekViewClosed and typeof(onPeekViewClosed) == "function" then
				onPeekViewClosed()
			end
			var23.goBack()
			
			if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then
				removeGameDetailSessionIfDepartedModule(var24, var52)
				
				return
			elseif var24 then
				var24:RemoveSession(sessionType.StructuralIdentifier.GameDetailSource)
			end
		end
	end, {
		var23,
		var24,
		onPeekViewClosed,
		if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then var26 else nil
	})
	local var48 = reactModule.useCallback(function() --[[ line: 205 ]]
		-- upvalues: var23 (ref), onPeekViewClosed (ref), appPage (copy), var24 (ref), sessionType (copy)
		if var23.isFocused() then
			if onPeekViewClosed and typeof(onPeekViewClosed) == "function" then
				onPeekViewClosed()
			end
			var23.clearAppScreens({ appPage.GameDetail })
			
			if var24 then
				var24:RemoveSession(sessionType.StructuralIdentifier.GameDetailSource)
			end
		end
	end, { var23, var24, onPeekViewClosed })
	reactModule.useEffect(function() --[[ line: 217 ]]
		-- upvalues: universeId (ref), var21 (ref), fetchExperienceDetailsPageModule (copy)
		if universeId and var21 then
			fetchExperienceDetailsPageModule(universeId, var21)
		end
	end, { universeId, var21 })
	local var49 = useUiStatus(var20)
	reactModule.useEffect(function() --[[ line: 224 ]]
		-- upvalues: var49 (ref), uiStatus (copy), universeId (ref), dataHydrationModule (copy)
		if var49 == uiStatus.Error and universeId then
			dataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(universeId, function(p2) --[[ line: 226 ]]
				return if p2 ~= nil then p2.creator == nil else true
			end)
			dataHydrationModule.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(universeId)
		end
	end, { var49, universeId })
	
	return if universeId == nil then nil else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ref = var38
	}, {
		SheetProvider = var37 and (reactModule.createElement(overlayProvider, { gui = var37 }, {
			TopBar = if fFlagEnableExperienceDetailsBottomSheetTopBar then reactModule.createElement(experienceDetailsBottomSheetTopBarModule, {
				tokens = var22,
				navigation = var23,
				deviceInsets = var32,
				topBarHeight = var30,
				briefH = var44[1],
				fullH = var44[2],
				overlayFrame = var37,
				sheetContentRef = var35,
				shouldMountAsFullView = var45,
				onBack = var47,
				onClose = var48
			}) else nil,
			SheetRoot = reactModule.createElement(sheet.Root, {
				isOpen = true,
				testId = "--experience-details-bottom-sheet",
				onClose = if var45 then var47 else var48,
				snapPoints = var44,
				defaultSnapPointIndex = var46
			}, {
				Content = reactModule.createElement(sheet.Content, {
					isContentFullBleed = if foundationFullBleedSheetContent then true else nil,
					scrollingFrameRef = var36,
					ref = if fFlagEnableExperienceDetailsBottomSheetTopBar then var35 else nil
				}, {
					ContentWrapper = reactModule.createElement(foundationModule.View, {
						tag = "col size-full-0 auto-y",
						padding = if not foundationFullBleedSheetContent then {
							bottom = UDim.new(0, -var22.Margin.Small),
							left = UDim.new(0, -(var22.Padding.Small + var22.Padding.Medium)),
							right = UDim.new(0, -(var22.Padding.Small + var22.Padding.Medium))
						} else nil
					}, {
						Content = reactModule.createElement(sduiPageEntryPoint, {
							includeNavigationHeaderBar = false,
							snackbarPortalLayoutOrder = 2147483647,
							appPage = appPage.GameDetail,
							configKey = var20,
							identifier = if fFlagSduiPageEntryUseSharedHooks then experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER else experienceDetailsPageUtilsModule.getResolvedIdentifier(var20, experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER_SUFFIX),
							pageTimer = var21,
							backgroundStyle = var22.Color.Surface.Surface_100,
							scrollingFrameRef = var36,
							contentTag = if fFlagLuaAppCompositionSduiEnabled then compositionTags.ContentRegion.Body else nil,
							loadingSlot = reactModule.createElement(experienceDetailsFallbackFeedModule.Skeleton, {
								isSmallScreen = true,
								launchSource = "LuaGameCard",
								universeId = universeId
							}),
							errorSlot = reactModule.createElement(experienceDetailsFallbackFeedModule.Error, {
								isSmallScreen = true,
								launchSource = "LuaGameCard",
								universeId = universeId,
								refresh = reactModule.useCallback(function() --[[ line: 233 ]]
									-- upvalues: universeId (ref), var21 (ref), fetchExperienceDetailsPageModule (copy)
									if universeId and var21 then
										fetchExperienceDetailsPageModule(universeId, var21, true)
									end
								end, { universeId, var21 }),
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
						padding = UDim.new(0, -var22.Margin.Small)
					}, {
						ActionBar = if fFlagSduiEdpPersistentActionBarPlayButton then reactModule.createElement(experienceDetailsPersistentActionBarModule, {
							launchSource = "LuaGameCard",
							universeId = universeId,
							configKey = var20,
							loadTimer = var21,
							referralSource = referralSource,
							experienceJoinData = experienceJoinData,
							placeIdOverride = placeIdOverride,
							onAbsoluteSizeChange = var41
						}) else reactModule.createElement(sduiFeatureEntryPoint, {
							appPage = appPage.GameDetail,
							configKey = var20,
							identifier = experienceDetailsPageConstantsModule.EDP_ACTION_BAR_IDENTIFIER,
							loadTimer = var21,
							AutomaticSize = Enum.AutomaticSize.XY,
							onAbsoluteSizeChange = var41,
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