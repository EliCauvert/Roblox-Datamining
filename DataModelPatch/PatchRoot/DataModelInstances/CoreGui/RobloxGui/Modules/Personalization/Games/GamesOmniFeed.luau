local IXPService = game:GetService("IXPService")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local RetrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local PromiseModule = require(CorePackages.Packages.Promise)
local FeedScrollFunction = require(CorePackages.Workspace.Packages.ScrollTelemetry).feedScroll
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local RoactAnalytics = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactAnalytics
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local RetrievalStatus1 = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local ServerDrivenUiModule = require(CorePackages.Workspace.Packages.ServerDrivenUi)
local UseCollectionLayoutConfigFunction = require(CorePackages.Workspace.Packages.CollectionViews).useCollectionLayoutConfig
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local DiscoverPageSession = Modules.Personalization.Sessions.DiscoverPageSession
local FetchGamesPageDataFunction = Modules.LuaApp.Thunks.FetchGamesPageData
local Modules1 = game:GetService("CoreGui").RobloxGui.Modules
local PageSessionManagerModule = require(Modules1.Personalization.Sessions.PageSessionManager)
local UseLocalizationModule = require(Modules1.LuaApp.Hooks.useLocalization)
local AddLocalOmniItemsModule = require(Modules1.Personalization.OmniFeed.DataStore.AddLocalOmniItems)
local RefreshSiteAlertInfoModule = require(Modules1.LuaApp.Actions.RefreshSiteAlertInfo)
local OmniFeedViewLoadMoreModule = require(Modules1.Personalization.OmniFeed.FeedViews.OmniFeedViewLoadMore)
local LuaAppLogDiscoverPageLayerExposure = game:DefineFastFlag("LuaAppLogDiscoverPageLayerExposure", false)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagLuaAppLayoutParamsInContext = SharedFlagsModule.FFlagLuaAppLayoutParamsInContext
local FFlagLuaAppChartsStickyHeader = SharedFlagsModule.FFlagLuaAppChartsStickyHeader
local FFlagLuaAppChartsResetFetchingStatusOnFilterChange = SharedFlagsModule.FFlagLuaAppChartsResetFetchingStatusOnFilterChange
local FFlagLuaAppFixChartsRenderOnFail = SharedFlagsModule.FFlagLuaAppFixChartsRenderOnFail
local FFlagLuaAppCompositionCharts = SharedFlagsModule.FFlagLuaAppCompositionCharts
local FFlagLuaAppScrollTelemetryIntegration = SharedFlagsModule.FFlagLuaAppScrollTelemetryIntegration
local Games = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage.Games
local v1 = if FFlagLuaAppFixChartsRenderOnFail then function(p1)
	-- upvalues: UseLocalizationModule (copy), ReactModule (copy), EmptyState (copy)
	return ReactModule.createElement(EmptyState, {
		onActivated = ReactModule.useCallback(function()
			-- upvalues: p1 (copy)
			p1.fetchGamesPageData()
		end, { p1.fetchGamesPageData }),
		text = UseLocalizationModule({
			failedMessage = "Feature.EmptyStatePage.Message.NoInternet"
		}).failedMessage
	})
end else nil

return function(p1)
	-- upvalues: FFlagAppIaScrollAway (copy), UseRoactServiceFunction (copy), AppSessionService (copy), RoactNetworking (copy), RoactAnalytics (copy), AppEventIngestService (copy), UseNavigationFunction (copy), FFlagLuaAppLayoutParamsInContext (copy), ReactModule (copy), UseSelectorFunction (copy), Games (copy), UseDispatchFunction (copy), PromiseModule (copy), FetchGamesPageDataFunction (copy), FFlagLuaAppChartsResetFetchingStatusOnFilterChange (copy), RetrievalStatus1 (copy), AddLocalOmniItemsModule (copy), RefreshSiteAlertInfoModule (copy), FeedScrollFunction (copy), RoactNavigationModule (copy), LuaAppLogDiscoverPageLayerExposure (copy), IXPService (copy), AppUserLayers (copy), UseCollectionLayoutConfigFunction (copy), ServerDrivenUiModule (copy), PageSessionManagerModule (copy), SessionType (copy), DiscoverPageSession (copy), LoadingStateContainer (copy), RetrievalStatus (copy), OmniFeedViewLoadMoreModule (copy), FFlagLuaAppChartsStickyHeader (copy), FFlagLuaAppCompositionCharts (copy), FFlagLuaAppScrollTelemetryIntegration (copy), FFlagLuaAppFixChartsRenderOnFail (copy), v1 (copy), UseLocalizationModule (copy), EmptyState (copy)
	local CanvasTopPadding = if FFlagAppIaScrollAway then p1.canvasTopPadding else nil
	local UseRoactServiceResult = UseRoactServiceFunction(AppSessionService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult2 = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult3 = UseRoactServiceFunction(AppEventIngestService)
	local UseNavigationResult = UseNavigationFunction()
	local UseRefResult = if FFlagLuaAppLayoutParamsInContext then nil else ReactModule.useRef(nil)
	local Frame = nil
	local v2 = nil
	
	if FFlagLuaAppLayoutParamsInContext then
		Frame, v44 = ReactModule.useState(nil)
	end
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.Startup.GamesPageDataStatus
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: Games (upval)
		return p2.Personalization.OrderedOmniItems[Games]
	end)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	local UseSelectorResult3 = UseSelectorFunction(function(p2)
		return p2.Personalization.DiscoveryNextPageId
	end)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult1 (copy), PromiseModule (upval), UseDispatchResult (copy), FetchGamesPageDataFunction (upval), UseRoactServiceResult1 (copy), UseRoactServiceResult2 (copy)
		if Current and UseRefResult1.current == Current then
			return PromiseModule.reject("Already fetching")
		else
			UseRefResult1.current = Current
			
			return (UseDispatchResult(FetchGamesPageDataFunction(UseRoactServiceResult1, UseRoactServiceResult2, Current)))
		end
	end, {
		UseDispatchResult,
		UseRoactServiceResult1,
		UseRoactServiceResult2
	})
	
	local function v52()
		-- upvalues: FFlagLuaAppChartsResetFetchingStatusOnFilterChange (upval), UseSelectorResult (copy), RetrievalStatus1 (upval), UseSelectorResult3 (copy), UseResult (copy), PromiseModule (upval)
		return if (if FFlagLuaAppChartsResetFetchingStatusOnFilterChange then UseSelectorResult.status else UseSelectorResult) == RetrievalStatus1.Fetching or not UseSelectorResult3 or UseSelectorResult3 == "" then PromiseModule.reject("Cannot load page") else UseResult(UseSelectorResult3)
	end
	
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), RefreshSiteAlertInfoModule (upval), UseResult (copy)
		UseDispatchResult(RefreshSiteAlertInfoModule())
		
		return UseResult()
	end, { UseDispatchResult, UseResult })
	
	local function SendScrollEvent(Distance, ScrollDuration, StartPos)
		-- upvalues: FFlagLuaAppLayoutParamsInContext (upval), Frame (ref), UseRefResult (copy), UseSelectorResult2 (copy), FeedScrollFunction (upval), UseRoactServiceResult3 (copy), Games (upval)
		local Y = Enum.ScrollingDirection.Y
		
		if Y then
			local Y1 = if FFlagLuaAppLayoutParamsInContext then Frame and Frame.AbsoluteSize.Y or 0 elseif UseRefResult.current then UseRefResult.current.AbsoluteSize.Y else 0
			FeedScrollFunction(UseRoactServiceResult3, Games, Y, {
				distance = Distance,
				screenSizeX = UseSelectorResult2.X,
				screenSizeY = UseSelectorResult2.Y,
				scrollAreaSize = Y1,
				scrollDepth = if Y1 > 0 then Distance / Y1 else nil,
				startDepth = if Y1 > 0 then StartPos / Y1 else nil,
				startPos = StartPos,
				scrollDuration = ScrollDuration
			})
		end
	end
	
	local AllItems = UseSelectorResult1 and UseSelectorResult1.allItems or {}
	local HasLocalItems = UseSelectorResult1 and UseSelectorResult1.hasLocalItems or false
	ReactModule.useEffect(function()
		-- upvalues: HasLocalItems (copy), UseDispatchResult (copy), AddLocalOmniItemsModule (upval), Games (upval)
		if not HasLocalItems then
			UseDispatchResult(AddLocalOmniItemsModule({}, Games))
		end
	end, {
		HasLocalItems,
		function(p2)
			-- upvalues: UseDispatchResult (copy), AddLocalOmniItemsModule (upval), Games (upval)
			UseDispatchResult(AddLocalOmniItemsModule(p2, Games))
		end
	})
	local Status1 = nil
	local Callback = nil
	
	if FFlagLuaAppChartsResetFetchingStatusOnFilterChange then
		local Status = UseSelectorResult.status
		Status1 = if Status == RetrievalStatus1.Fetching or Status == RetrievalStatus1.Failed then if UseSelectorResult.isRefreshFetch or not AllItems or #AllItems <= 0 then Status else RetrievalStatus1.Done else Status
	else
		Status1, Callback = ReactModule.useState(UseSelectorResult)
	end
	ReactModule.useEffect(function()
		-- upvalues: FFlagLuaAppChartsResetFetchingStatusOnFilterChange (upval), UseSelectorResult (copy), RetrievalStatus1 (upval), UseResult (copy), UseNavigationResult (copy), RoactNavigationModule (upval), Status1 (ref), Callback (ref)
		if (if FFlagLuaAppChartsResetFetchingStatusOnFilterChange then UseSelectorResult.status else UseSelectorResult) == RetrievalStatus1.NotStarted then
			UseResult()
		end
		local AddListenerResult = UseNavigationResult.addListener(RoactNavigationModule.Events.WillFocus, function()
			-- upvalues: FFlagLuaAppChartsResetFetchingStatusOnFilterChange (upval), UseSelectorResult (upval), RetrievalStatus1 (upval), UseResult (upval)
			if (if FFlagLuaAppChartsResetFetchingStatusOnFilterChange then UseSelectorResult.status else UseSelectorResult) == RetrievalStatus1.NotStarted then
				UseResult()
			end
		end)
		
		if not FFlagLuaAppChartsResetFetchingStatusOnFilterChange and Status1 ~= RetrievalStatus1.Done then
			Callback(UseSelectorResult)
		end
		return function()
			-- upvalues: AddListenerResult (copy)
			if AddListenerResult ~= nil then
				AddListenerResult.remove()
			end
		end
	end, {
		UseNavigationResult,
		UseSelectorResult,
		if FFlagLuaAppChartsResetFetchingStatusOnFilterChange then nil else Status1
	})
	
	if LuaAppLogDiscoverPageLayerExposure then
		ReactModule.useEffect(function()
			-- upvalues: IXPService (upval), AppUserLayers (upval)
			IXPService:LogUserLayerExposure(AppUserLayers.DiscoverPageLayer)
		end, {})
	end
	local UseCollectionLayoutConfigResult = if FFlagLuaAppLayoutParamsInContext then UseCollectionLayoutConfigFunction(Frame) else nil
	local UseSduiContextFromRoduxAndProcessConfigsResult = ServerDrivenUiModule.useSduiContextFromRoduxAndProcessConfigs(Games, if FFlagLuaAppLayoutParamsInContext then UseCollectionLayoutConfigResult else nil)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		PageSessionManager = ReactModule.createElement(PageSessionManagerModule, {
			appPage = Games,
			setPageSession = function()
				-- upvalues: UseRoactServiceResult (copy), SessionType (upval), DiscoverPageSession (upval)
				if UseRoactServiceResult ~= nil then
					UseRoactServiceResult:SetSession(SessionType.StructuralIdentifier.Level1, SessionType.StructuralIdentifier.DiscoverPageSessionInfo, SessionType.StructuralIdentifier.DiscoverPageSessionInfo)
					UseRoactServiceResult:SetMetadata(SessionType.StructuralIdentifier.DiscoverPageSessionInfo, SessionType.Metadata.DiscoverPage.DiscoverSessionId, DiscoverPageSession:Get())
				end
			end
		}),
		LoadingStateContainer = ReactModule.createElement(LoadingStateContainer, {
			dataStatus = RetrievalStatus.fromRawValue(Status1),
			onRetry = UseResult,
			renderOnLoaded = function()
				-- upvalues: ReactModule (upval), OmniFeedViewLoadMoreModule (upval), Games (upval), UseResult1 (copy), AllItems (copy), FFlagLuaAppLayoutParamsInContext (upval), v2 (ref), UseRefResult (copy), UseSelectorResult3 (copy), v52 (copy), SendScrollEvent (copy), FFlagAppIaScrollAway (upval), CanvasTopPadding (copy), UseSduiContextFromRoduxAndProcessConfigsResult (copy), FFlagLuaAppChartsStickyHeader (upval), p1 (copy), FFlagLuaAppCompositionCharts (upval), FFlagLuaAppScrollTelemetryIntegration (upval)
				return ReactModule.createElement(OmniFeedViewLoadMoreModule, {
					impressionsTag = "GAMESFEEDITEM_IMPRESSIONS",
					analyticsContext = "GamesOmniFeed",
					pageContext = Games,
					refresh = UseResult1,
					omniFeedItems = AllItems,
					scrollingFrameRef = if FFlagLuaAppLayoutParamsInContext then v2 else UseRefResult,
					hasNextPage = UseSelectorResult3 and UseSelectorResult3 ~= "",
					loadNext = v52 or nil,
					sendScrollEvent = SendScrollEvent,
					canvasTopPadding = if FFlagAppIaScrollAway then CanvasTopPadding else nil,
					sduiContext = UseSduiContextFromRoduxAndProcessConfigsResult,
					topPadding = if FFlagLuaAppChartsStickyHeader then p1.topPadding else nil,
					appCompositionEnabled = if FFlagLuaAppCompositionCharts then true else nil,
					scrollPerformanceIntervalName = if FFlagLuaAppScrollTelemetryIntegration then "LuaApp_Charts_Scroll" else nil
				})
			end,
			renderOnFailed = if FFlagLuaAppFixChartsRenderOnFail then function()
				-- upvalues: ReactModule (upval), v1 (upval), UseResult (copy)
				return ReactModule.createElement(v1, { fetchGamesPageData = UseResult })
			end else function()
				-- upvalues: UseLocalizationModule (upval), ReactModule (upval), EmptyState (upval), UseResult (copy)
				return function(_)
					-- upvalues: UseLocalizationModule (upval), ReactModule (upval), EmptyState (upval), UseResult (upval)
					return ReactModule.createElement(EmptyState, {
						onActivated = UseResult,
						text = UseLocalizationModule({
							failedMessage = "Feature.EmptyStatePage.Message.NoInternet"
						}).failedMessage
					})
				end
			end
		})
	})
end