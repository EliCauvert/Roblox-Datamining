local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local appPage = require(parent.RobloxAppEnums).AppPage
local robloxAppEventsModule = require(parent.RobloxAppEvents)
local view = foundationModule.View
local topBarModule = require(moments.Components.TopBar)
local feedModule = require(moments.Components.Feed)
local creationFlowScreen = require(parent.MomentsCreation).CreationFlowScreen
local FTUXEducationScreenModule = require(moments.Components.FTUXEducationScreen)
local useMomentsHost = require(moments.MomentsHostContext).useMomentsHost
local constantsModule = require(moments.Constants)
local useScreenBottomInsetModule = require(moments.Hooks.useScreenBottomInset)
local useFeedPlaybackActiveModule = require(moments.Hooks.useFeedPlaybackActive)
local useChromeRatioModule = require(moments.Hooks.useChromeRatio)
local useCreationEntryModule = require(moments.Hooks.useCreationEntry)
local useUploadHostModule = require(moments.Hooks.useUploadHost)
local logCreateIntentModule = require(moments.Analytics.logCreateIntent)
local getUploadStoreModule = require(moments.Stores.GetUploadStore)
local signalsReactModule = require(parent.SignalsReact)
local momentOverlayInsetContextModule = require(moments.Components.Feed.Items.Moment.MomentOverlayInsetContext)
local getFFlagMomentsImmersiveChromeModule = require(moments.Flags.GetFFlagMomentsImmersiveChrome)
local getFFlagMomentsImmersiveResizeViewportModule = require(moments.Flags.GetFFlagMomentsImmersiveResizeViewport)
local getFFlagMomentsRefreshFromTopAfterUploadModule = require(moments.Flags.GetFFlagMomentsRefreshFromTopAfterUpload)
local momentsLocalStorageModule = require(moments.Storage.MomentsLocalStorage)
local momentsLocalStorageKeysModule = require(moments.Storage.MomentsLocalStorageKeys)
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local createMomentsFeedSourceModule = require(moments.Stores.GetMomentsStore.createMomentsFeedSource)
local createSignalTracker = require(moments.SignalTracker).createSignalTracker
local fFlagEnableArgus = require(parent.SharedFlags).FFlagEnableArgus
local isStudioModule = require(parent.MomentsCommon.isStudio)
local getFFlagArgusStudioMockFeedModule = require(moments.Flags.GetFFlagArgusStudioMockFeed)
local createMockFeedSource = feedModule.createMockFeedSource
local var25 = if fFlagEnableArgus then createSignalTracker() else nil
local feed = feedModule.Feed
local createRecommendationTelemetry = feedModule.createRecommendationTelemetry
local analytics = require(parent.MomentsCommon).Analytics
local eventNames = analytics.EventNames
local sessionManager = analytics.SessionManager
local funnelEventNames = analytics.FunnelEventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local fireFunnelAnalyticsEvent = analytics.fireFunnelAnalyticsEvent

local function ResizeFeedContainer(p0) --[[ line: 101 ]]
	-- upvalues: useChromeRatioModule (ref), reactModule (ref), constantsModule (ref), feed (ref)
	local bottomInset = p0.bottomInset
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = useChromeRatioModule():map(function(p1) --[[ line: 107 ]]
			-- upvalues: bottomInset (ref)
			return UDim2.new(1, 0, 1, -math.round(bottomInset * p1))
		end),
		ZIndex = constantsModule.DisplayOrder.Feed
	}, {
		Feed = reactModule.createElement(feed, {
			trackSurfaceLoad = true,
			source = p0.source,
			active = p0.active,
			playbackActive = p0.playbackActive,
			telemetry = p0.telemetry,
			controllerRef = p0.controllerRef
		})
	})
end

local function ImmersiveNavBarBackfill(p2) --[[ line: 133 ]]
	-- upvalues: useChromeRatioModule (ref), reactModule (ref), view (ref), constantsModule (ref)
	local var28 = useChromeRatioModule()
	local bottomInset = p2.bottomInset
	
	return if p2.resizeViewport then reactModule.createElement(view, {
		tag = "position-bottom-center anchor-bottom-center bg-surface-0",
		Size = var28:map(function(p4) --[[ line: 139 ]]
			-- upvalues: bottomInset (ref)
			return UDim2.new(1, 0, 0, math.round(bottomInset * p4))
		end),
		ZIndex = constantsModule.DisplayOrder.FeedTopBar
	}) else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.new(1, 0, 0, bottomInset),
		Position = var28:map(function(p3) --[[ line: 150 ]]
			-- upvalues: bottomInset (ref)
			return UDim2.new(0.5, 0, 1, math.round((1 - p3) * bottomInset))
		end),
		ZIndex = constantsModule.DisplayOrder.FeedTopBar
	}, {
		Fill = reactModule.createElement(view, { tag = "size-full bg-surface-0" })
	})
end

return function(_) --[[ line: 161 | named "TrendingScreen" ]]
	-- upvalues: reactModule (ref), momentsLocalStorageModule (ref), momentsLocalStorageKeysModule (ref), useScreenBottomInsetModule (ref), useFeedPlaybackActiveModule (ref), useMomentsSession (ref), useMomentsHost (ref), useCreationEntryModule (ref), useUploadHostModule (ref), sessionManager (ref), funnelEventNames (ref), fireFunnelAnalyticsEvent (ref), isStudioModule (ref), getFFlagArgusStudioMockFeedModule (ref), createMockFeedSource (ref), createMomentsFeedSourceModule (ref), var25 (ref), fFlagEnableArgus (ref), createRecommendationTelemetry (ref), getFFlagMomentsImmersiveChromeModule (ref), getFFlagMomentsImmersiveResizeViewportModule (ref), robloxAppEventsModule (ref), appPage (ref), getUploadStoreModule (ref), signalsReactModule (ref), getFFlagMomentsRefreshFromTopAfterUploadModule (ref), feed (ref), momentOverlayInsetContextModule (ref), ResizeFeedContainer (ref), view (ref), constantsModule (ref), ImmersiveNavBarBackfill (ref), foundationModule (ref), topBarModule (ref), logCreateIntentModule (ref), fireAnalyticsEvent (ref), eventNames (ref), creationFlowScreen (ref), FTUXEducationScreenModule (ref)
	local var29, var30 = reactModule.useState(function() --[[ line: 162 ]]
		-- upvalues: momentsLocalStorageModule (copy), momentsLocalStorageKeysModule (copy)
		return not momentsLocalStorageModule.getField(momentsLocalStorageKeysModule.CreateTooltipSeen)
	end)
	local var31 = reactModule.useRef(nil)
	local var32 = reactModule.useRef(nil)
	local var33 = useScreenBottomInsetModule()
	local var34 = useFeedPlaybackActiveModule()
	local var35 = useMomentsSession()
	local openOwnMoments = useMomentsHost().openOwnMoments
	local var36 = useCreationEntryModule()
	local var37 = useUploadHostModule({
		onExit = var36.onExitCreation,
		captureSource = var36.captureSource
	})
	reactModule.useEffect(function() --[[ line: 191 ]]
		-- upvalues: sessionManager (copy), funnelEventNames (copy), fireFunnelAnalyticsEvent (copy)
		fireFunnelAnalyticsEvent(funnelEventNames.FunnelTypes.AppNavigation, funnelEventNames.AppNavigationSteps.TrendingScreenView, sessionManager.getSessionId(funnelEventNames.FunnelTypes.AppNavigation) or sessionManager.startSession(funnelEventNames.FunnelTypes.AppNavigation))
	end, {})
	local var38 = reactModule.useMemo(function() --[[ line: 201 ]]
		-- upvalues: isStudioModule (copy), getFFlagArgusStudioMockFeedModule (copy), createMockFeedSource (copy), createMomentsFeedSourceModule (copy), var35 (ref), var25 (copy)
		return if isStudioModule() and getFFlagArgusStudioMockFeedModule() then createMockFeedSource() else createMomentsFeedSourceModule(var35.getMomentsSessionId, { signalTracker = var25 })
	end, { var35 })
	local var39 = reactModule.useMemo(function() --[[ line: 210 ]]
		-- upvalues: fFlagEnableArgus (copy), createRecommendationTelemetry (copy), var35 (ref), var25 (copy)
		return if fFlagEnableArgus then createRecommendationTelemetry({
			getMomentsSessionId = var35.getMomentsSessionId,
			signalTracker = var25
		}) else nil
	end, { var35 })
	local var40 = getFFlagMomentsImmersiveChromeModule()
	local var41 = var40 and getFFlagMomentsImmersiveResizeViewportModule()
	local var42 = var40 and not var41
	local var43 = not var36.isCreating
	local var44 = var34 and not var36.isCreating
	local var45 = reactModule.useCallback(function() --[[ line: 237 ]]
		-- upvalues: var31 (ref)
		local current = var31.current
		
		if current ~= nil then
			current.refresh()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 244 ]]
		-- upvalues: robloxAppEventsModule (copy), appPage (copy), var45 (ref)
		local reloadPageConnection = robloxAppEventsModule.ReloadPage:connect(function(p5) --[[ line: 245 ]]
			-- upvalues: appPage (copy), var45 (copy)
			if p5 == appPage.Moments then
				var45()
			end
		end)
		
		return function() --[[ line: 251 ]]
			-- upvalues: reloadPageConnection (ref)
			reloadPageConnection:disconnect()
		end
	end, { var45 })
	local var46 = getUploadStoreModule(false)
	local var47 = signalsReactModule.useSignalState(var46.getState)
	local var48 = signalsReactModule.useSignalState(var46.getUploadedMoment)
	reactModule.useEffect(function() --[[ line: 260 ]]
		-- upvalues: getFFlagMomentsRefreshFromTopAfterUploadModule (copy), var47 (ref), var32 (ref), var31 (ref), var48 (ref), var45 (ref)
		if getFFlagMomentsRefreshFromTopAfterUploadModule() then
			if var47 ~= "Success" then
				var32.current = var47
				
				return
			elseif var32.current ~= "Success" then
				var32.current = var47
				local current = var31.current
				
				if type(var48) == "table" and var48.momentId ~= nil and current ~= nil then
					current.prependMoment(var48)
					
					return
				end
				var45()
			end
			return
		elseif var47 == "Success" then
			var45()
		end
	end, { var47, var48, var45 })
	local var49 = reactModule.createElement(feed, {
		trackSurfaceLoad = true,
		source = var38,
		active = var43,
		playbackActive = var44,
		telemetry = var39,
		controllerRef = var31
	})
	
	return reactModule.createElement(view, { tag = "size-full bg-surface-0" }, {
		FoundationContainer = reactModule.createElement(view, { tag = "size-full" }, {
			OnVideoUI = reactModule.createElement(foundationModule.FoundationProvider, { theme = foundationModule.Enums.Theme.Dark }, {
				FeedContainer = if var41 then reactModule.createElement(ResizeFeedContainer, {
					active = var43,
					bottomInset = var33,
					source = var38,
					playbackActive = var44,
					telemetry = var39,
					controllerRef = var31
				}) else reactModule.createElement(view, {
					tag = "size-full",
					padding = if var42 then nil else { bottom = UDim.new(0, var33) },
					ZIndex = constantsModule.DisplayOrder.Feed
				}, {
					Feed = if var42 then reactModule.createElement(momentOverlayInsetContextModule.Context.Provider, { value = var33 }, { Feed = var49 }) else var49
				}),
				TopBar = reactModule.createElement(topBarModule, {
					isBaseScreen = true,
					showTopScrim = true,
					showFtuxTooltip = var29 and var34,
					onFtuxTooltipDismissed = function() --[[ line: 375 ]]
						-- upvalues: var30 (ref), momentsLocalStorageModule (copy), momentsLocalStorageKeysModule (copy)
						var30(false)
						momentsLocalStorageModule.setField(momentsLocalStorageKeysModule.CreateTooltipSeen, true)
					end,
					onCreatePressed = function() --[[ line: 379 ]]
						-- upvalues: logCreateIntentModule (copy), funnelEventNames (copy), var36 (ref)
						logCreateIntentModule(funnelEventNames.CreationIntentSource.TopBar)
						var36.onCreatePressed()
					end,
					onNavigateToTrending = function() --[[ line: 386 ]]
						-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), var45 (ref)
						fireAnalyticsEvent(eventNames.FeedHomeButtonPressed)
						var45()
					end,
					onNavigateToMyMoments = function() --[[ line: 390 ]]
						-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), openOwnMoments (ref)
						fireAnalyticsEvent(eventNames.MyCreationButtonPressed)
						
						if openOwnMoments ~= nil then
							openOwnMoments()
						end
					end
				})
			})
		}),
		NavBarBackfill = if var33 > 0 then if var40 then reactModule.createElement(ImmersiveNavBarBackfill, { bottomInset = var33, resizeViewport = var41 }) else reactModule.createElement(view, {
			tag = "position-bottom-center anchor-bottom-center bg-surface-0",
			Size = UDim2.new(1, 0, 0, var33),
			ZIndex = constantsModule.DisplayOrder.FeedTopBar
		}) else nil,
		CreationFlowOverlay = if var36.isCreating then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(creationFlowScreen, { host = var37 })
		}) else nil,
		FtuxOverlay = if var36.showFtux then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(FTUXEducationScreenModule, { onClose = var36.onExitFtux })
		}) else nil
	})
end