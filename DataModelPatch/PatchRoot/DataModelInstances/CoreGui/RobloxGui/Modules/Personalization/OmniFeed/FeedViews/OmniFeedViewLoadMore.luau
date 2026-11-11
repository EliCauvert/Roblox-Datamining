local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local PromiseModule = require(CorePackages.Packages.Promise)
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local UiMode = RobloxAppEnumsModule.UiMode
local AppPage = RobloxAppEnumsModule.AppPage
local UseLastInputModeFunction = require(CorePackages.Workspace.Packages.FocusNavigationUtils).useLastInputMode
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local OmniFeedTypes = DiscoveryTypesModule.OmniFeedTypes
local OmniFeedConstants = DiscoveryTypesModule.OmniFeedConstants
local ViewportVideoAutoplaySync = require(CorePackages.Workspace.Packages.VideoUtils).ViewportVideoAutoplaySync
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseAnimateScrollViewToSelectionFunction = require(CorePackages.Workspace.Packages.AppBlox).useAnimateScrollViewToSelection
local ScrollDetector = require(CorePackages.Workspace.Packages.ScrollTelemetry).ScrollDetector
local CreateScrollIntervalPerformanceTrackerFunction = require(CorePackages.Workspace.Packages.IntervalPerformanceTracker).createScrollIntervalPerformanceTracker
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local DiscoveryAppLaunchTracker = require(CorePackages.Workspace.Packages.AppLaunchTracker).DiscoveryAppLaunchTracker
local IsSduiGameOmniFeedItemFunction = require(CorePackages.Workspace.Packages.ServerDrivenUi).isSduiGameOmniFeedItem
local OmniFeedImpressionsDetector = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedImpressionsDetector
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RefreshScrollingFrameWithLoadMoreModule = require(Modules.LuaApp.Components.RefreshScrollingFrameWithLoadMore)
local JoinYourFriendsRefreshEventModule = require(Modules.LuaApp.Components.EventReceivers.JoinYourFriendsRefreshEvent)
local ConstantsModule = require(Modules.LuaApp.Constants)
local OmniFeedItemsContainerModule = require(script.Parent.OmniFeedItemsContainer)
local FIntLuaJoinYourFriendsRefreshIntervalModule = require(Modules.Personalization.Flags.FIntLuaJoinYourFriendsRefreshInterval)
local FFlagSearchOmniAutocompletePage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagLuaAppLayoutParamsInContext = SharedFlagsModule.FFlagLuaAppLayoutParamsInContext
local FFlagLuaAppScrollTelemetryIntegration = SharedFlagsModule.FFlagLuaAppScrollTelemetryIntegration
local FFlagLuaAppChartsStickyHeader = SharedFlagsModule.FFlagLuaAppChartsStickyHeader
local FFlagExtendScrollingFramesBySafeInsets = SharedFlagsModule.FFlagExtendScrollingFramesBySafeInsets
local FFlagLuaAppCompositionAlways = SharedFlagsModule.FFlagLuaAppCompositionAlways
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = SharedFlagsModule.FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppHomeTouchAutoplay = SharedFlagsModule.FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppGameCarouselAmpUpsellAction = SharedFlagsModule.FFlagLuaAppGameCarouselAmpUpsellAction
local FFlagLuaAppsDefaultSelection = SharedFlagsModule.FFlagLuaAppsDefaultSelection
local LuaAppOmniFeedInitialNumRows = game:DefineFastInt("LuaAppOmniFeedInitialNumRows", 6)
local LuaAppOmniFeedLoadNumRows = game:DefineFastInt("LuaAppOmniFeedLoadNumRows", 3)
local FStringLuaAppSortsWithDividers: string = SharedFlagsModule.FStringLuaAppSortsWithDividers
local t = {}

if SharedFlagsModule.FFlagLuaAppUseSortsWithDividersFString then
	for i in FStringLuaAppSortsWithDividers:gmatch("(%w+)") do
		t[i] = true
	end
end
local LuaAppOmniFeedScrollAnimDurationMsRatio = game:DefineFastInt("LuaAppOmniFeedScrollAnimDurationMs", 400) / 1000
local T = if FFlagLuaAppChartsStickyHeader then {} else nil

local function _(Carousel, p1)
	-- upvalues: OmniFeedTypes (copy), IsSduiGameOmniFeedItemFunction (copy)
	return Carousel == OmniFeedTypes.HomeGameGrid or (Carousel == OmniFeedTypes.Carousel or (Carousel == OmniFeedTypes.SearchGameGrid or IsSduiGameOmniFeedItemFunction(Carousel, p1)))
end

local function getNumItemsForRows(OmniFeedItems, p1, LuaAppOmniFeedInitialNumRows, p2): number
	-- upvalues: OmniFeedTypes (copy), IsSduiGameOmniFeedItemFunction (copy)
	local Total = 0
	local Count = 0
	
	for i = p1, #OmniFeedItems do
		local OmniFeedItem = OmniFeedItems[i]
		local NumberOfRows = OmniFeedItem and OmniFeedItem.treatmentProps and OmniFeedItem.treatmentProps.numberOfRows or 1
		
		if NumberOfRows == -1 then
			NumberOfRows = 1
		end
		Count += 1
		Total += NumberOfRows
		local TopicId = nil
		
		if OmniFeedItem then
			if OmniFeedItem.treatmentProps and OmniFeedItem.treatmentProps.topicId then
				TopicId = OmniFeedItem.treatmentProps.topicId
			elseif OmniFeedItem.itemId and OmniFeedItem.itemId.topicId then
				TopicId = OmniFeedItem.itemId.topicId
			end
		end
		if LuaAppOmniFeedInitialNumRows <= Total then
			return Count
		end
		if p2 then
			local TreatmentType = OmniFeedItem.treatmentType
			
			if TreatmentType == OmniFeedTypes.HomeGameGrid or (TreatmentType == OmniFeedTypes.Carousel or (TreatmentType == OmniFeedTypes.SearchGameGrid or IsSduiGameOmniFeedItemFunction(TreatmentType, TopicId))) then break end
		else
			continue
		end
	end
	return Count
end

return function(p3)
	-- upvalues: UseStyleFunction (copy), UseAppPolicyFunction (copy), UseUiModeInfoFunction (copy), UiMode (copy), ReactModule (copy), Signal (copy), FFlagLuaAppLayoutParamsInContext (copy), UseLastInputModeFunction (copy), FFlagLuaAppChartsStickyHeader (copy), getNumItemsForRows (copy), LuaAppOmniFeedInitialNumRows (copy), UseDesignTokensFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), UseSelectorFunction (copy), OmniFeedConstants (copy), FFlagLuaAppGameCarouselAmpUpsellAction (copy), ConstantsModule (copy), JoinYourFriendsRefreshEventModule (copy), FIntLuaJoinYourFriendsRefreshIntervalModule (copy), T (copy), UseAnimateScrollViewToSelectionFunction (copy), LuaAppOmniFeedScrollAnimDurationMsRatio (copy), FFlagLuaAppScrollTelemetryIntegration (copy), CreateScrollIntervalPerformanceTrackerFunction (copy), LuaAppOmniFeedLoadNumRows (copy), DiscoveryAppLaunchTracker (copy), RoactModule (copy), RefreshScrollingFrameWithLoadMoreModule (copy), PromiseModule (copy), FFlagSearchOmniAutocompletePage (copy), FFlagAppIaScrollAway (copy), FFlagExtendScrollingFramesBySafeInsets (copy), OmniFeedItemsContainerModule (copy), FFlagLuaAppCompositionAlways (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), FFlagLuaAppHomeTouchAutoplay (copy), AppPage (copy), FFlagLuaAppsDefaultSelection (copy), OmniFeedImpressionsDetector (copy), ViewportVideoAutoplaySync (copy), ScrollDetector (copy)
	local UseStyleResult = UseStyleFunction()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p4)
		return p4.useGridPageLayout()
	end)
	local UseAppPolicyResult1 = UseAppPolicyFunction(function(p4)
		return p4.getMountAllOmniFeedItems()
	end)
	local IsUiModeMatch = UseUiModeInfoFunction().uiMode == UiMode.TenFoot
	local NoIsUiModeMatch: boolean = UseAppPolicyResult and not IsUiModeMatch
	local UseRefResult = ReactModule.useRef(Signal.new())
	local UseRefResult1 = ReactModule.useRef(Signal.new())
	local UseRefResult2 = ReactModule.useRef(0)
	local UseRefResult3 = ReactModule.useRef(false)
	local ScrollingFrameRef = if FFlagLuaAppLayoutParamsInContext then nil else p3.scrollingFrameRef
	local IsCursor = UseLastInputModeFunction() == "Cursor"
	local NoUseAppPolicyResult1: boolean = p3.shouldStopAfterOneGameSort and not UseAppPolicyResult1
	local UseResult = nil
	
	if FFlagLuaAppLayoutParamsInContext then
		local UseStateResult2 = nil
		ScrollingFrameRef = ReactModule.useRef(nil)
		local _
		_, UseStateResult2 = ReactModule.useState(nil)
		
		if type(p3.scrollingFrameRef) == "table" then
			ScrollingFrameRef = p3.scrollingFrameRef
		end
		UseResult = ReactModule.useCallback(function(Current)
			-- upvalues: ScrollingFrameRef (ref), UseStateResult2 (ref), p3 (copy)
			ScrollingFrameRef.current = Current
			UseStateResult2(Current)
			
			if type(p3.scrollingFrameRef) == "function" then
				p3.scrollingFrameRef(Current)
			end
		end, { p3.scrollingFrameRef })
	end
	local UseMemoResult = if FFlagLuaAppChartsStickyHeader then ReactModule.useMemo(function()
		-- upvalues: p3 (copy)
		local List = {}
		
		for _, omniFeedItem in p3.omniFeedItems do
			if omniFeedItem.pageSection == p3.omniFeedPageSection then
				table.insert(List, omniFeedItem)
			end
		end
		return List
	end, { p3.omniFeedItems, p3.omniFeedPageSection }) else nil
	local UseStateResult, UseStateResult2_1 = ReactModule.useState(function()
		-- upvalues: UseAppPolicyResult1 (copy), FFlagLuaAppChartsStickyHeader (upval), UseMemoResult (copy), p3 (copy), getNumItemsForRows (upval), LuaAppOmniFeedInitialNumRows (upval), NoUseAppPolicyResult1 (copy)
		return if UseAppPolicyResult1 then #(if FFlagLuaAppChartsStickyHeader then UseMemoResult else p3.omniFeedItems) else getNumItemsForRows(if FFlagLuaAppChartsStickyHeader then UseMemoResult else p3.omniFeedItems, 1, LuaAppOmniFeedInitialNumRows, NoUseAppPolicyResult1)
	end)
	local PageContext = p3.pageContext
	local ImpressionsTag = p3.impressionsTag
	local OmniFeedItems = p3.omniFeedItems
	local Theme = UseStyleResult.Theme
	local _ = Theme.BackgroundDefault.Color
	local _ = Theme.BackgroundDefault.Transparency
	local v1: number = if NoIsUiModeMatch then 4 else 0
	local UseDesignTokensResult = UseDesignTokensFunction()
	local BackgroundColor = UseDesignTokensResult.LuaApps.App.Page.BackgroundColor
	local BackgroundTransparency = UseDesignTokensResult.LuaApps.App.Page.BackgroundTransparency
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseDesignTokensResult (copy), NoIsUiModeMatch (ref)
		return UseDesignTokensResult.LuaApps.HomeOmniFeed.getLayoutSpacing(NoIsUiModeMatch)
	end, { NoIsUiModeMatch, UseDesignTokensResult })
	local TopPadding = p3.topPadding or UseMemoResult1.topMargin
	local Size1200 = if p3.loadMoreButtonText then if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_1200 else UseDesignTokensResult.Global.Size_600 else 80
	local BottomPadding = p3.bottomPadding or Size1200
	local UseSelectorResult = UseSelectorFunction(function(p4)
		return p4.Personalization.OmniItemsGlobalLayoutData
	end)
	local IsTrue: boolean = UseSelectorResult and (UseSelectorResult[OmniFeedConstants.GlobalLayoutDataKeys.JYFRefresh] == "true" or UseSelectorResult[OmniFeedConstants.GlobalLayoutDataKeys.JYFRefresh] == true)
	local UseResult1 = if FFlagLuaAppGameCarouselAmpUpsellAction then nil else ReactModule.useCallback(function(p4)
		-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy), OmniFeedConstants (upval), p3 (copy)
		UseRefResult2.current = tick()
		UseRefResult1.current:fire()
		
		return p3.refresh(if p4 then OmniFeedConstants.OmniRecommendationsRequestIntent.FriendPresenceChange else OmniFeedConstants.OmniRecommendationsRequestIntent.ManualRefresh)
	end)
	local UseResult2 = if FFlagLuaAppGameCarouselAmpUpsellAction then ReactModule.useCallback(function(p4)
		-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy), p3 (copy), OmniFeedConstants (upval)
		UseRefResult2.current = tick()
		UseRefResult1.current:fire()
		
		return p3.refresh(p4 or OmniFeedConstants.OmniRecommendationsRequestIntent.ManualRefresh)
	end) else nil
	
	local function _()
		-- upvalues: UseRefResult3 (copy), ScrollingFrameRef (ref), ConstantsModule (upval), FFlagLuaAppGameCarouselAmpUpsellAction (upval), UseResult2 (copy), OmniFeedConstants (upval), UseResult1 (copy)
		UseRefResult3.current = false
		
		if ScrollingFrameRef.current then
			local Y: number = ScrollingFrameRef.current.CanvasPosition.Y
			local Height = ConstantsModule.JoinYourFriendsTile.Height
			
			if Y >= 0 and Y <= Height then
				if FFlagLuaAppGameCarouselAmpUpsellAction then
					UseResult2(OmniFeedConstants.OmniRecommendationsRequestIntent.FriendPresenceChange)
					
					return
				end
				UseResult1(true)
			end
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: IsTrue (copy), JoinYourFriendsRefreshEventModule (upval), UseRefResult3 (copy), UseRefResult2 (copy), FIntLuaJoinYourFriendsRefreshIntervalModule (upval), ScrollingFrameRef (ref), ConstantsModule (upval), FFlagLuaAppGameCarouselAmpUpsellAction (upval), UseResult2 (copy), OmniFeedConstants (upval), UseResult1 (copy)
		local EventConnection = if IsTrue then JoinYourFriendsRefreshEventModule.Event:Connect(function()
			-- upvalues: UseRefResult3 (upval), UseRefResult2 (upval), FIntLuaJoinYourFriendsRefreshIntervalModule (upval), ScrollingFrameRef (upval), ConstantsModule (upval), FFlagLuaAppGameCarouselAmpUpsellAction (upval), UseResult2 (upval), OmniFeedConstants (upval), UseResult1 (upval)
			if UseRefResult3.current then return end
			local FIntLuaJoinYourFriendsRefreshIntervalModuleDelta = FIntLuaJoinYourFriendsRefreshIntervalModule - (tick() - UseRefResult2.current)
			
			if FIntLuaJoinYourFriendsRefreshIntervalModuleDelta < 0 then
				UseRefResult3.current = false
				
				if ScrollingFrameRef.current then
					local Y: number = ScrollingFrameRef.current.CanvasPosition.Y
					local Height = ConstantsModule.JoinYourFriendsTile.Height
					
					if Y >= 0 and Y <= Height then
						if FFlagLuaAppGameCarouselAmpUpsellAction then
							UseResult2(OmniFeedConstants.OmniRecommendationsRequestIntent.FriendPresenceChange)
							
							return
						else
							UseResult1(true)
							
							return
						end
					end
				end
			else
				UseRefResult3.current = true
				task.delay(FIntLuaJoinYourFriendsRefreshIntervalModuleDelta, function()
					-- upvalues: UseRefResult3 (upval), ScrollingFrameRef (upval), ConstantsModule (upval), FFlagLuaAppGameCarouselAmpUpsellAction (upval), UseResult2 (upval), OmniFeedConstants (upval), UseResult1 (upval)
					UseRefResult3.current = false
					
					if ScrollingFrameRef.current then
						local Y: number = ScrollingFrameRef.current.CanvasPosition.Y
						local Height = ConstantsModule.JoinYourFriendsTile.Height
						
						if Y >= 0 and Y <= Height then
							if FFlagLuaAppGameCarouselAmpUpsellAction then
								UseResult2(OmniFeedConstants.OmniRecommendationsRequestIntent.FriendPresenceChange)
								
								return
							end
							UseResult1(true)
						end
					end
				end)
			end
		end) else nil
		
		return function()
			-- upvalues: EventConnection (ref)
			if EventConnection then
				EventConnection:Disconnect()
				EventConnection = nil
			end
		end
	end, { p3.refresh })
	local UseSelectorResult1 = UseSelectorFunction(function(p4)
		-- upvalues: PageContext (copy)
		return p4.OmniRecommendations[PageContext]
	end)
	local Sorts = UseSelectorResult1 and UseSelectorResult1.sorts or (if FFlagLuaAppChartsStickyHeader then T else {})
	local SduiContext = p3.sduiContext
	UseAnimateScrollViewToSelectionFunction(ScrollingFrameRef, LuaAppOmniFeedScrollAnimDurationMsRatio)
	
	if FFlagLuaAppScrollTelemetryIntegration then
		ReactModule.useEffect(function()
			-- upvalues: p3 (copy), ScrollingFrameRef (ref), CreateScrollIntervalPerformanceTrackerFunction (upval)
			local ScrollPerformanceIntervalName = p3.scrollPerformanceIntervalName
			
			if ScrollPerformanceIntervalName == nil then return end
			local Current = if ScrollingFrameRef then ScrollingFrameRef.current else nil
			
			if Current == nil then return end
			local ScrollIntervalPerformanceTracker = CreateScrollIntervalPerformanceTrackerFunction(ScrollPerformanceIntervalName, Current)
			local Connection = Current:GetPropertyChangedSignal("CanvasPosition"):Connect(ScrollIntervalPerformanceTracker.onScrollTick)
			
			return function()
				-- upvalues: Connection (copy), ScrollIntervalPerformanceTracker (copy)
				Connection:Disconnect()
				ScrollIntervalPerformanceTracker.cleanup()
			end
		end, { p3.scrollPerformanceIntervalName, ScrollingFrameRef })
	end
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		UseRefResult.current:fire()
	end)
	local v2 = nil
	
	v2 = function(): boolean
		-- upvalues: UseStateResult (copy), FFlagLuaAppChartsStickyHeader (upval), UseMemoResult (copy), OmniFeedItems (copy), UseAppPolicyResult1 (copy), getNumItemsForRows (upval), LuaAppOmniFeedLoadNumRows (upval), NoUseAppPolicyResult1 (copy), UseStateResult2_1 (copy)
		if UseStateResult < #(if FFlagLuaAppChartsStickyHeader then UseMemoResult else OmniFeedItems) then
			UseStateResult2_1(if UseAppPolicyResult1 then #(if FFlagLuaAppChartsStickyHeader then UseMemoResult else OmniFeedItems) else UseStateResult + getNumItemsForRows(if FFlagLuaAppChartsStickyHeader then UseMemoResult else OmniFeedItems, UseStateResult + 1, LuaAppOmniFeedLoadNumRows, NoUseAppPolicyResult1))
			
			return true
		else
			return false
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: NoUseAppPolicyResult1 (copy), v2 (ref)
		if not NoUseAppPolicyResult1 then
			v2()
		end
	end, { OmniFeedItems, NoUseAppPolicyResult1 })
	
	if DiscoveryAppLaunchTracker.isEnabled() and DiscoveryAppLaunchTracker.default then
		DiscoveryAppLaunchTracker.default:trackFeedRender()
		DiscoveryAppLaunchTracker.default:trackNumFeedItems(UseStateResult)
	end
	return RoactModule.createElement(RefreshScrollingFrameWithLoadMoreModule, {
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		CanvasSize = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = BackgroundColor,
		BackgroundTransparency = BackgroundTransparency,
		BorderSizePixel = 0,
		ScrollBarThickness = if p3.scrollBarThickness then p3.scrollBarThickness else v1,
		onLoadMore = function()
			-- upvalues: v2 (ref), PromiseModule (upval), p3 (copy)
			if v2() then
				return PromiseModule.reject()
			else
				local LoadNextFunction = p3.loadNext
				
				return if LoadNextFunction then LoadNextFunction() else PromiseModule.resolve()
			end
		end,
		refresh = if FFlagLuaAppGameCarouselAmpUpsellAction then UseResult2 else UseResult1,
		parentAppPage = PageContext,
		onAbsoluteSizeChangedCallback = p3.onAbsoluteSizeChanged,
		onCanvasSizeChangedCallback = UseResult3,
		onCanvasPositionChangedCallback = UseResult3,
		useAutomaticSizeContentFrame = true,
		[RoactModule.Ref] = if FFlagLuaAppLayoutParamsInContext then UseResult else ScrollingFrameRef,
		createEndOfScrollElement = p3.createEndOfScrollElement,
		onScrollDirectionChanged = p3.onScrollDirectionChanged,
		ScrollingEnabled = IsCursor,
		onAbsoluteContentSizeChanged = if FFlagSearchOmniAutocompletePage then p3.onAbsoluteContentSizeChanged else nil,
		loadMoreButtonText = if p3.loadMoreButtonText and p3.hasNextPage and p3.loadNext ~= nil then p3.loadMoreButtonText else nil,
		canvasTopPadding = if FFlagAppIaScrollAway then p3.canvasTopPadding else nil,
		shouldExtendIntoSafeArea = if FFlagExtendScrollingFramesBySafeInsets then { left = false, top = false, right = true, bottom = true } else nil
	}, {
		OmniFeed = ReactModule.createElement(OmniFeedItemsContainerModule, {
			omniFeedItems = OmniFeedItems,
			pageContext = PageContext,
			sduiContext = SduiContext,
			impressionsTag = ImpressionsTag,
			numberOfItemsToBeRendered = UseStateResult,
			topMargin = TopPadding,
			bottomMargin = BottomPadding,
			layoutPadding = UseMemoResult1.layoutPadding,
			onItemsUpdatedSignalRef = UseRefResult,
			refreshSignalRef = UseRefResult1,
			scrollingFrameRef = ScrollingFrameRef,
			defaultContainerSize = p3.defaultContainerSize,
			sortsData = Sorts,
			hasNextPage = p3.hasNextPage,
			omniFeedPageSection = p3.omniFeedPageSection,
			enableRelativeGui = p3.enableRelativeGui,
			appCompositionEnabled = if FFlagLuaAppCompositionAlways then true else p3.appCompositionEnabled,
			contentTag = p3.contentTag,
			onTileImageLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p3.onTileImageLoaded else nil,
			videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then p3.videoPlaybackContext else nil,
			refreshFeed = if FFlagLuaAppGameCarouselAmpUpsellAction and PageContext == AppPage.Home then UseResult2 else nil,
			defaultFocusRef = if FFlagLuaAppsDefaultSelection then p3.defaultFocusRef else nil
		}),
		OmniFeedImpressionsDetector = ReactModule.createElement(OmniFeedImpressionsDetector, {
			onItemsUpdatedSignal = UseRefResult.current,
			impressionsTag = ImpressionsTag,
			omniFeedItems = OmniFeedItems,
			eventContext = p3.analyticsContext
		}),
		ViewportVideoAutoplaySync = if FFlagLuaAppHomeTouchAutoplay and (p3.videoPlaybackContext and p3.videoPlaybackContext.viewportVideoAutoplayController) then ReactModule.createElement(ViewportVideoAutoplaySync, {
			viewportAutoplayController = p3.videoPlaybackContext.viewportVideoAutoplayController,
			scrollingFrameRef = ScrollingFrameRef
		}) else nil,
		ScrollDetector = if p3.sendScrollEvent or FFlagLuaAppHomeTouchAutoplay and (p3.onScrollStart or p3.onScrollSettled) then ReactModule.createElement(ScrollDetector, {
			scrollingFrameRef = ScrollingFrameRef,
			sendScrollEvent = p3.sendScrollEvent,
			onScrollStart = if FFlagLuaAppHomeTouchAutoplay then p3.onScrollStart else nil,
			onScrollSettled = if FFlagLuaAppHomeTouchAutoplay then p3.onScrollSettled else nil
		}) else nil
	})
end