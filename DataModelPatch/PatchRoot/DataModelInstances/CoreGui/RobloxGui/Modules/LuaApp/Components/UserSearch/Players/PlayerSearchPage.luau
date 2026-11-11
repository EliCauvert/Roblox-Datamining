local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local TModule = require(CorePackages.Packages.t)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local RoactModule = require(Modules.Common.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local PromiseModule = require(Modules.LuaApp.Promise)
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local DiscoveryUtilsModule = require(CorePackages.Workspace.Packages.DiscoveryUtils)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local RetrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local LoadingStatePage = UIBloxModule.App.Container.LoadingStatePage
local RetrievalStatus1 = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local ScreenSizeImpressionsDetector = require(CorePackages.Workspace.Packages.Impressions).ScreenSizeImpressionsDetector
local ConstantsModule = require(Modules.LuaApp.Constants)
local DebounceModule = require(Modules.LuaApp.Util.debounce)
local RefreshScrollingFrameWithLoadMoreModule = require(Modules.LuaApp.Components.RefreshScrollingFrameWithLoadMore)
local PlayerGridWithUserSearchHydrationLayerWrapperModule = require(script.Parent.PlayerGridWithUserSearchHydrationLayerWrapper)
local EmptyPlayerSearchPageModule = require(script.Parent.EmptyPlayerSearchPage)
local ApiModule = require(Modules.LuaApp.Components.UserSearch.api)
local EventNames = ApiModule.Analytics.EventNames
local AnalyticsFunction = ApiModule.Analytics.Analytics
local FireImpressionEventFunction = ApiModule.Analytics.fireImpressionEvent
local SocialLuaAnalyticsModule = require(CorePackages.Workspace.Packages.SocialLuaAnalytics)
local TimersFunction = SocialLuaAnalyticsModule.Analytics.Timing.Timers
local ReportPromiseLoadingTimeWrapperFunction = SocialLuaAnalyticsModule.Analytics.Timing.reportPromiseLoadingTimeWrapper
local PaginationMethod = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Enum.PaginationMethod
local SearchTextBanner = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.Search.SearchTextBanner
local UseLastInputModeFunction = require(CorePackages.Workspace.Packages.FocusNavigationUtils).useLastInputMode
local UseAnimateScrollViewToSelectionFunction = require(CorePackages.Workspace.Packages.AppBlox).useAnimateScrollViewToSelection
local FFlagAppIaScrollAway = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAppIaScrollAway
local FFlagPlayerSearchEnableOnlineFrequents = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents
local FFlagPlayerSearchEnableOnlineFrequentsForAll = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPlayerSearchEnableOnlineFrequentsForAll
local FFlagExtendScrollingFramesBySafeInsets = require(CorePackages.Workspace.Packages.SharedFlags).FFlagExtendScrollingFramesBySafeInsets
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local FFlagLuaAppSearchPeopleUnifiedSchemaFields = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSearchPeopleUnifiedSchemaFields
local FFlagLuaAppsDefaultSelection = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppsDefaultSelection

local function _(Text): boolean
	-- upvalues: ConstantsModule (copy)
	return ConstantsModule.PLAYER_SEARCH_MIN_KEYWORD_UTF8_LEN <= utf8.len(Text)
end

local PlayerSearchPage = RoactModule.PureComponent:extend("PlayerSearchPage")
PlayerSearchPage.validateProps = TModule.strictInterface({
	searchUuid = TModule.optional(TModule.string),
	omniSearchUuid = TModule.optional(TModule.string),
	backgroundTransparency = TModule.optional(TModule.number),
	searchParameters = TModule.table,
	onScrollDirectionChanged = TModule.optional(TModule.callback),
	shouldShowUserSearchLandingPage = TModule.optional(TModule.boolean),
	isRoutedFromAutoSearch = TModule.optional(TModule.boolean),
	enableNewEmptySearchUI = TModule.optional(TModule.boolean),
	canvasTopPadding = if FFlagAppIaScrollAway then TModule.optional(TModule.number) else nil,
	hotlineSearchText = TModule.optional(TModule.string),
	defaultFocusRef = if FFlagLuaAppsDefaultSelection then TModule.optional(TModule.callback) else nil,
	screenSize = TModule.Vector2,
	usersSearchResult = TModule.optional(TModule.table),
	searchWordLengthNotSupported = TModule.boolean,
	playerSearchStatus = TModule.string,
	autoTabSearchStatus = TModule.optional(TModule.string),
	wideMode = TModule.optional(TModule.boolean),
	fetchPlayerSearch = TModule.callback,
	removeUserSearchResults = TModule.callback,
	removeTextSearchResults = TModule.callback,
	networking = TModule.callback,
	eventIngest = TModule.optional(TModule.table),
	enablePresenceIndicator = TModule.optional(TModule.boolean),
	enableOnlineFrequents = TModule.optional(TModule.boolean),
	appPage = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then TModule.optional(TModule.string) else nil
})

function PlayerSearchPage.init(p1)
	-- upvalues: DiscoveryUtilsModule (copy), HttpService (copy), AnalyticsFunction (copy), FFlagLuaAppSearchPeopleUnifiedSchemaFields (copy), Signal (copy), FireImpressionEventFunction (copy), EventNames (copy), ReportPromiseLoadingTimeWrapperFunction (copy), PromiseModule (copy), TimersFunction (copy), RetrievalStatus (copy), RetrievalStatus1 (copy), ConstantsModule (copy)
	local ScreenSize = p1.props.screenSize
	local PageSideMargin: number = DiscoveryUtilsModule.getPageSideMargin(ScreenSize.X)
	p1.userSearchUuid = p1.props.searchUuid or HttpService:GenerateGUID(false)
	p1.Analytics = AnalyticsFunction({
		infoForAllEvents = {
			globalSessionId = p1.props.omniSearchUuid,
			userSearchSessionId = p1.userSearchUuid,
			pageContext = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then p1.props.appPage else nil
		}
	})
	p1.state = {
		loaded = false,
		impressionsToSend = nil,
		itemsPerRow = 1,
		contentSize = Vector2.new(ScreenSize.X - 2 * PageSideMargin, ScreenSize.Y)
	}
	p1.onRequestImpressionsSignal = Signal.new()
	
	function p1.onImpressionsDetected(ImpressionsToSend)
		-- upvalues: p1 (copy)
		if ImpressionsToSend and #ImpressionsToSend ~= 0 then
			p1:setState({ impressionsToSend = ImpressionsToSend })
			
			return
		end
	end
	
	function p1.onItemsPerRowChanged(ItemsPerRow)
		-- upvalues: p1 (copy)
		p1:setState({ itemsPerRow = ItemsPerRow })
	end
	
	function p1.sendPlayerTileImpressions(Impressions)
		-- upvalues: FireImpressionEventFunction (upval), p1 (copy)
		FireImpressionEventFunction({
			startRowNumber = 1,
			impressions = Impressions,
			entries = p1.props.usersSearchResult and p1.props.usersSearchResult.entries or nil,
			itemsPerRow = p1.state.itemsPerRow
		}, p1.Analytics.fireAnalyticsEvent)
	end
	
	function p1.onAbsoluteContentSizeChanged(p2)
		-- upvalues: p1 (copy)
		if p1.isMounted and p2 then
			local AbsoluteContentSize = p2.AbsoluteContentSize
			
			if p1.state.contentSize == AbsoluteContentSize then return end
			if AbsoluteContentSize.X > 0 and AbsoluteContentSize.Y > 0 then
				p1:setState({ contentSize = AbsoluteContentSize })
			end
		end
	end
	
	function p1:fireSearchPageLoadEvents(p2, LoadingTime)
		-- upvalues: p1 (copy), EventNames (upval)
		local NextPage = p2.nextPage or false
		local FireAnalyticsEventFunction: (any, any) -> () = p1.Analytics.fireAnalyticsEvent
		FireAnalyticsEventFunction(EventNames.UserSearchLoadingTime, {
			status = p2.status,
			loadingTime = LoadingTime,
			nextPage = NextPage
		})
		FireAnalyticsEventFunction(EventNames.UserSearchLoaded, { status = p2.status, nextPage = NextPage })
	end
	
	function p1.fetchPlayerSearch(Networking, p2)
		-- upvalues: ReportPromiseLoadingTimeWrapperFunction (upval), p1 (copy), PromiseModule (upval)
		return ReportPromiseLoadingTimeWrapperFunction(p1.props.fetchPlayerSearch, function(_)
			-- upvalues: p2 (copy)
			return { fetch = "userSearch", nextPage = p2.nextPage }
		end, { fireEvent = p1.fireSearchPageLoadEvents })(Networking, p2):catch(function()
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve()
		end)
	end
	
	p1.loadingTimers = TimersFunction()
	
	function p1.reportLoadingTimeForPromise(Callback, p2)
		-- upvalues: p1 (copy), EventNames (upval), RetrievalStatus (upval)
		local StartResult = p1.loadingTimers.start()
		
		local function v45(RawValueResult)
			-- upvalues: p1 (upval), StartResult (copy), EventNames (upval), p2 (copy)
			p1.Analytics.fireAnalyticsEvent(EventNames.UserSearchLoadingTime, {
				status = RawValueResult,
				loadingTime = p1.loadingTimers.stop(StartResult),
				nextPage = if p2 then p2.nextPage else false
			})
		end
		
		return Callback():andThen(function()
			-- upvalues: v45 (copy), RetrievalStatus (upval)
			v45(RetrievalStatus.Done.rawValue())
		end):catch(function()
			-- upvalues: v45 (copy), RetrievalStatus (upval)
			v45(RetrievalStatus.Failed.rawValue())
		end)
	end
	
	function p1.onLoadMore()
		-- upvalues: p1 (copy)
		return p1.fetchPlayerSearch(p1.props.networking, {
			nextPage = true,
			keyword = p1.props.searchParameters.searchKeyword,
			searchUuid = p1.userSearchUuid,
			omniSearchUuid = p1.props.omniSearchUuid
		})
	end
	
	function p1.dispatchInitialSearch()
		-- upvalues: p1 (copy), RetrievalStatus1 (upval), PromiseModule (upval), ConstantsModule (upval)
		if p1.props.isRoutedFromAutoSearch then
			if p1.props.autoTabSearchStatus == RetrievalStatus1.Done and p1.state.loaded == false then
				p1:setState({ loaded = true })
			end
			return PromiseModule.resolve()
		else
			local Networking = p1.props.networking
			local SearchKeyword = p1.props.searchParameters.searchKeyword
			
			if SearchKeyword and utf8.len(SearchKeyword) >= ConstantsModule.PLAYER_SEARCH_MIN_KEYWORD_UTF8_LEN then
				return p1.fetchPlayerSearch(Networking, {
					nextPage = false,
					keyword = SearchKeyword,
					searchUuid = p1.userSearchUuid,
					omniSearchUuid = p1.props.omniSearchUuid
				})
			else
				return nil
			end
		end
	end
end

function PlayerSearchPage.didMount(p1)
	p1.isMounted = true
	p1.dispatchInitialSearch()
end

function PlayerSearchPage.willUnmount(p1)
	p1.isMounted = false
	
	if p1.props.searchParameters.searchKeyword then
		p1.props.removeUserSearchResults(p1.props.searchParameters.searchKeyword)
	end
	if p1.userSearchUuid then
		p1.props.removeTextSearchResults(p1.userSearchUuid)
	end
end

local function PlayerSearchPageLoaded(p1)
	-- upvalues: ReactModule (copy), UseLastInputModeFunction (copy), UseAnimateScrollViewToSelectionFunction (copy), RoactModule (copy), FFlagLuaAppsDefaultSelection (copy), RefreshScrollingFrameWithLoadMoreModule (copy), PaginationMethod (copy), RetrievalStatus1 (copy), FFlagAppIaScrollAway (copy), DebounceModule (copy), FFlagExtendScrollingFramesBySafeInsets (copy), DiscoveryTypesModule (copy), PlayerGridWithUserSearchHydrationLayerWrapperModule (copy), FFlagPlayerSearchEnableOnlineFrequents (copy), FFlagPlayerSearchEnableOnlineFrequentsForAll (copy), ScreenSizeImpressionsDetector (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local IsCursor: boolean = UseLastInputModeFunction() == "Cursor" or UseRefResult.current == nil
	UseAnimateScrollViewToSelectionFunction(UseRefResult, 0.4)
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ref = if FFlagLuaAppsDefaultSelection then p1.defaultFocusRef else nil,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		Content = RoactModule.createElement(RefreshScrollingFrameWithLoadMoreModule, {
			[RoactModule.Ref] = UseRefResult,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			CanvasSize = UDim2.new(1, 0, 1, 0),
			ScrollingEnabled = IsCursor,
			refresh = p1.refresh,
			loadMoreButtonText = if p1.hasMoreEntries and p1.usersSearchResult.paginationMethod == PaginationMethod.Button and p1.playerSearchStatus ~= RetrievalStatus1.Fetching then p1.localized.loadMoreButtonText else nil,
			BackgroundTransparency = p1.backgroundTransparency,
			canvasTopPadding = if FFlagAppIaScrollAway then p1.canvasTopPadding else nil,
			onLoadMore = p1.onLoadMore,
			onScrollDirectionChanged = p1.onScrollDirectionChanged,
			onCanvasPositionChangedCallback = DebounceModule(function()
				-- upvalues: p1 (copy)
				p1.onRequestImpressionsSignal:fire()
			end, 0.2),
			shouldExtendIntoSafeArea = if FFlagExtendScrollingFramesBySafeInsets then { left = false, top = false, right = false, bottom = true } else nil
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 12),
				[RoactModule.Change.AbsoluteContentSize] = p1.onAbsoluteContentSizeChanged
			}),
			Padding = RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, p1.sidePadding),
				PaddingRight = UDim.new(0, p1.sidePadding),
				PaddingTop = UDim.new(0, DiscoveryTypesModule.Constants.GAME_GRID_PADDING),
				PaddingBottom = UDim.new(0, DiscoveryTypesModule.Constants.GAME_GRID_PADDING)
			}),
			PlayerGrid = RoactModule.createElement(PlayerGridWithUserSearchHydrationLayerWrapperModule, {
				LayoutOrder = 1,
				impressionsTag = "PLAYER_TILE_IMPRESSIONS",
				startRowNumber = 1,
				entries = p1.entries,
				searchParameters = p1.searchParameters,
				horizontalAlignment = Enum.HorizontalAlignment.Left,
				windowSize = Vector2.new(p1.contentSize.X, p1.screenSize.Y),
				Analytics = p1.Analytics,
				enablePresenceIndicator = p1.enablePresenceIndicator,
				onItemsPerRowChanged = p1.onItemsPerRowChanged,
				itemsPerRow = p1.itemsPerRow,
				enableOnlineFrequents = if FFlagPlayerSearchEnableOnlineFrequents and not FFlagPlayerSearchEnableOnlineFrequentsForAll then p1.enableOnlineFrequents else nil
			})
		}),
		ScreenSizeImpressionsDetector = RoactModule.createElement(ScreenSizeImpressionsDetector, {
			impressionsTag = "PLAYER_TILE_IMPRESSIONS",
			onRequestImpressionsSignal = p1.onRequestImpressionsSignal,
			onImpressionsDetected = p1.onImpressionsDetected
		})
	})
end

function PlayerSearchPage.renderOnLoaded(p1)
	-- upvalues: DiscoveryUtilsModule (copy), RoactModule (copy), SearchTextBanner (copy), EmptyPlayerSearchPageModule (copy), RetrievalStatus1 (copy), WithStyleFunction (copy), WithLocalizationFunction (copy), FFlagEnableLeftNavOnConsole (copy), PlayerSearchPageLoaded (copy), FFlagAppIaScrollAway (copy), FFlagPlayerSearchEnableOnlineFrequents (copy), FFlagPlayerSearchEnableOnlineFrequentsForAll (copy), FFlagLuaAppsDefaultSelection (copy), RefreshScrollingFrameWithLoadMoreModule (copy), PaginationMethod (copy), DebounceModule (copy), FFlagExtendScrollingFramesBySafeInsets (copy), DiscoveryTypesModule (copy), PlayerGridWithUserSearchHydrationLayerWrapperModule (copy), ScreenSizeImpressionsDetector (copy)
	local ScreenSize = p1.props.screenSize
	local ContentSize = p1.state.contentSize
	local PageSideMargin = DiscoveryUtilsModule.getPageSideMargin(ScreenSize.X)
	local SearchWordLengthNotSupported = p1.props.searchWordLengthNotSupported
	local IsNotEndOfPlayerSearch = false
	local Entries = {}
	local UsersSearchResult = p1.props.usersSearchResult
	
	if UsersSearchResult then
		IsNotEndOfPlayerSearch = UsersSearchResult.nextPageCursor and UsersSearchResult.nextPageCursor ~= "EndOfPlayerSearch" or false
		Entries = UsersSearchResult.entries
	end
	if p1.props.hotlineSearchText then
		return RoactModule.createElement(SearchTextBanner, {
			text = p1.props.hotlineSearchText,
			sidePadding = PageSideMargin
		})
	elseif #Entries == 0 or SearchWordLengthNotSupported then
		return RoactModule.createElement(EmptyPlayerSearchPageModule, {
			wideMode = p1.props.wideMode,
			screenSize = p1.props.screenSize,
			backgroundTransparency = p1.props.backgroundTransparency,
			searchWordLengthNotSupported = SearchWordLengthNotSupported,
			shouldShowUserSearchLandingPage = p1.props.shouldShowUserSearchLandingPage,
			fireAnalyticsEvent = p1.Analytics.fireAnalyticsEvent
		})
	else
		local config = {
			noResultsText = "Feature.PlayerSearchResults.Label.NoResultsFound",
			keywordTooShortText = "Feature.PlayerSearchResults.Label.KeywordTooShort",
			loadMoreButtonText = "Search.GlobalSearch.Action.LoadMore"
		}
		local OnLoadMore = IsNotEndOfPlayerSearch and p1.props.playerSearchStatus ~= RetrievalStatus1.Fetching and p1.onLoadMore or nil
		
		return WithStyleFunction(function(_)
			-- upvalues: WithLocalizationFunction (upval), config (copy), FFlagEnableLeftNavOnConsole (upval), RoactModule (upval), PlayerSearchPageLoaded (upval), p1 (copy), IsNotEndOfPlayerSearch (ref), UsersSearchResult (copy), FFlagAppIaScrollAway (upval), OnLoadMore (copy), PageSideMargin (copy), Entries (ref), ContentSize (copy), ScreenSize (copy), FFlagPlayerSearchEnableOnlineFrequents (upval), FFlagPlayerSearchEnableOnlineFrequentsForAll (upval), FFlagLuaAppsDefaultSelection (upval), RefreshScrollingFrameWithLoadMoreModule (upval), PaginationMethod (upval), RetrievalStatus1 (upval), DebounceModule (upval), FFlagExtendScrollingFramesBySafeInsets (upval), DiscoveryTypesModule (upval), PlayerGridWithUserSearchHydrationLayerWrapperModule (upval), ScreenSizeImpressionsDetector (upval)
			return WithLocalizationFunction(config)(function(Localized)
				-- upvalues: FFlagEnableLeftNavOnConsole (upval), RoactModule (upval), PlayerSearchPageLoaded (upval), p1 (upval), IsNotEndOfPlayerSearch (upval), UsersSearchResult (upval), FFlagAppIaScrollAway (upval), OnLoadMore (upval), PageSideMargin (upval), Entries (upval), ContentSize (upval), ScreenSize (upval), FFlagPlayerSearchEnableOnlineFrequents (upval), FFlagPlayerSearchEnableOnlineFrequentsForAll (upval), FFlagLuaAppsDefaultSelection (upval), RefreshScrollingFrameWithLoadMoreModule (upval), PaginationMethod (upval), RetrievalStatus1 (upval), DebounceModule (upval), FFlagExtendScrollingFramesBySafeInsets (upval), DiscoveryTypesModule (upval), PlayerGridWithUserSearchHydrationLayerWrapperModule (upval), ScreenSizeImpressionsDetector (upval)
				return if FFlagEnableLeftNavOnConsole then RoactModule.createElement(PlayerSearchPageLoaded, {
					refresh = p1.refresh,
					hasMoreEntries = IsNotEndOfPlayerSearch,
					usersSearchResult = UsersSearchResult,
					playerSearchStatus = p1.props.playerSearchStatus,
					localized = Localized,
					backgroundTransparency = p1.props.backgroundTransparency,
					canvasTopPadding = if FFlagAppIaScrollAway then p1.props.canvasTopPadding else nil,
					onLoadMore = OnLoadMore,
					onScrollDirectionChanged = p1.props.onScrollDirectionChanged,
					onRequestImpressionsSignal = p1.onRequestImpressionsSignal,
					sidePadding = PageSideMargin,
					entries = Entries,
					searchParameters = p1.props.searchParameters,
					contentSize = ContentSize,
					screenSize = ScreenSize,
					onAbsoluteContentSizeChanged = p1.onAbsoluteContentSizeChanged,
					Analytics = p1.Analytics,
					enablePresenceIndicator = p1.props.enablePresenceIndicator,
					onItemsPerRowChanged = p1.onItemsPerRowChanged,
					itemsPerRow = p1.state.itemsPerRow,
					enableOnlineFrequents = if FFlagPlayerSearchEnableOnlineFrequents and not FFlagPlayerSearchEnableOnlineFrequentsForAll then p1.props.enableOnlineFrequents else nil,
					onImpressionsDetected = p1.onImpressionsDetected,
					defaultFocusRef = if FFlagLuaAppsDefaultSelection then p1.props.defaultFocusRef else nil
				}) else RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					Content = RoactModule.createElement(RefreshScrollingFrameWithLoadMoreModule, {
						Size = UDim2.new(1, 0, 1, 0),
						Position = UDim2.new(0, 0, 0, 0),
						CanvasSize = UDim2.new(1, 0, 1, 0),
						refresh = p1.refresh,
						loadMoreButtonText = if IsNotEndOfPlayerSearch and UsersSearchResult.paginationMethod == PaginationMethod.Button and p1.props.playerSearchStatus ~= RetrievalStatus1.Fetching then Localized.loadMoreButtonText else nil,
						BackgroundTransparency = p1.props.backgroundTransparency,
						canvasTopPadding = if FFlagAppIaScrollAway then p1.props.canvasTopPadding else nil,
						onLoadMore = OnLoadMore,
						onScrollDirectionChanged = p1.props.onScrollDirectionChanged,
						onCanvasPositionChangedCallback = DebounceModule(function()
							-- upvalues: p1 (upval)
							p1.onRequestImpressionsSignal:fire()
						end, 0.2),
						shouldExtendIntoSafeArea = if FFlagExtendScrollingFramesBySafeInsets then { left = false, top = false, right = false, bottom = true } else nil
					}, {
						Layout = RoactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, 12),
							[RoactModule.Change.AbsoluteContentSize] = p1.onAbsoluteContentSizeChanged
						}),
						Padding = RoactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, PageSideMargin),
							PaddingRight = UDim.new(0, PageSideMargin),
							PaddingTop = UDim.new(0, DiscoveryTypesModule.Constants.GAME_GRID_PADDING),
							PaddingBottom = UDim.new(0, DiscoveryTypesModule.Constants.GAME_GRID_PADDING)
						}),
						PlayerGrid = RoactModule.createElement(PlayerGridWithUserSearchHydrationLayerWrapperModule, {
							LayoutOrder = 1,
							impressionsTag = "PLAYER_TILE_IMPRESSIONS",
							startRowNumber = 1,
							entries = Entries,
							searchParameters = p1.props.searchParameters,
							horizontalAlignment = Enum.HorizontalAlignment.Left,
							windowSize = Vector2.new(ContentSize.X, ScreenSize.Y),
							Analytics = p1.Analytics,
							enablePresenceIndicator = p1.props.enablePresenceIndicator,
							onItemsPerRowChanged = p1.onItemsPerRowChanged,
							itemsPerRow = p1.state.itemsPerRow,
							enableOnlineFrequents = if FFlagPlayerSearchEnableOnlineFrequents and not FFlagPlayerSearchEnableOnlineFrequentsForAll then p1.props.enableOnlineFrequents else nil
						})
					}),
					ScreenSizeImpressionsDetector = RoactModule.createElement(ScreenSizeImpressionsDetector, {
						impressionsTag = "PLAYER_TILE_IMPRESSIONS",
						onRequestImpressionsSignal = p1.onRequestImpressionsSignal,
						onImpressionsDetected = p1.onImpressionsDetected
					})
				})
			end)
		end)
	end
end

function PlayerSearchPage.renderOnFailed(p1, p2)
	-- upvalues: RoactModule (copy), EmptyState (copy)
	return RoactModule.createElement(EmptyState, {
		onActivated = p1.dispatchInitialSearch,
		text = p2.failedMessage
	})
end

function PlayerSearchPage:renderOnLoading()
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), LoadingStatePage (copy)
	return WithStyleFunction(function(p1)
		-- upvalues: RoactModule (upval), LoadingStatePage (upval)
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p1.Theme.BackgroundDefault.Transparency,
			BackgroundColor3 = p1.Theme.BackgroundDefault.Color
		}, RoactModule.createElement(LoadingStatePage))
	end)
end

function PlayerSearchPage.render(p1)
	-- upvalues: WithLocalizationFunction (copy), RoactModule (copy), LoadingStateContainer (copy), RetrievalStatus (copy)
	local AutoTabSearchStatus = if p1.props.isRoutedFromAutoSearch then p1.props.autoTabSearchStatus else p1.props.playerSearchStatus
	
	return WithLocalizationFunction({
		failedMessage = "Feature.EmptyStatePage.Message.NoInternet"
	})(function(p2)
		-- upvalues: RoactModule (upval), LoadingStateContainer (upval), RetrievalStatus (upval), AutoTabSearchStatus (copy), p1 (copy)
		return RoactModule.createElement(LoadingStateContainer, {
			dataStatus = RetrievalStatus.fromRawValue(AutoTabSearchStatus),
			renderOnLoading = function()
				-- upvalues: p1 (upval)
				return if p1.state.loaded then p1:renderOnLoaded() else p1:renderOnLoading()
			end,
			renderOnFailed = function()
				-- upvalues: p1 (upval), p2 (copy)
				return p1:renderOnFailed(p2)
			end,
			renderOnLoaded = function()
				-- upvalues: p1 (upval)
				return p1:renderOnLoaded()
			end
		})
	end)
end

function PlayerSearchPage.didUpdate(p1, p2, p3)
	-- upvalues: ArgCheckModule (copy), RetrievalStatus1 (copy)
	ArgCheckModule.assert(p2.searchUuid == p1.props.searchUuid, `SearchUuid should not change during the lifetime of PlayerSearchPage, analytics could be incorrect; detected a change {p2.searchUuid} -> {p1.props.searchUuid}`)
	local AutoTabSearchStatus = if p1.props.isRoutedFromAutoSearch then p1.props.autoTabSearchStatus else p1.props.playerSearchStatus
	
	if AutoTabSearchStatus ~= p2.playerSearchStatus then
		if AutoTabSearchStatus == RetrievalStatus1.Done then
			if p1.state.loaded == false then
				p1:setState({ loaded = true })
			end
			p1.onRequestImpressionsSignal:fire()
		elseif (AutoTabSearchStatus == RetrievalStatus1.NotStarted or AutoTabSearchStatus == RetrievalStatus1.Failed) and p1.state.loaded == true then
			p1:setState({ loaded = false })
		end
	end
	local ImpressionsToSend = p1.state.impressionsToSend
	
	if ImpressionsToSend ~= nil and ImpressionsToSend ~= p3.impressionsToSend then
		p1.sendPlayerTileImpressions(ImpressionsToSend)
		p1:setState({ impressionsToSend = nil })
	end
end

return RoactServices.connect({ networking = RoactNetworkingModule })(PlayerSearchPage)