local CorePackages = game:GetService("CorePackages")
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local OtterModule = require(CorePackages.Packages.Otter)
local CryoModule = require(CorePackages.Packages.Cryo)
local TModule = require(CorePackages.Packages.t)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local PromiseModule = require(CorePackages.Packages.Promise)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UseNavigationProps = require(CorePackages.Workspace.Packages.RobloxAppNavigation).useNavigationProps
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithGridConfigDEPRECATED = UIBloxModule.Core.Layout.Grid.withGridConfig_DEPRECATED
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local LayoutConfig = RobloxAppEnumsModule.LayoutConfig
local AppPage = RobloxAppEnumsModule.AppPage
local SearchTypes = RobloxAppEnumsModule.SearchTypes
local SocialLuaAnalyticsModule = require(CorePackages.Workspace.Packages.SocialLuaAnalytics)
local ReportPromiseLoadingTimeWrapperFunction = SocialLuaAnalyticsModule.Analytics.Timing.reportPromiseLoadingTimeWrapper
local CreateDiagMetricStringFunction = SocialLuaAnalyticsModule.Analytics.Formatters.createDiagMetricString
local Diag = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService.Diag
local EventStream = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService.EventStream
local Enums = SocialLuaAnalyticsModule.Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local GetDeepValueFunction = require(CorePackages.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local UseNavigationFocus = require(CorePackages.Workspace.Packages.Navigation).useNavigationFocus
local SearchSourceEvent = require(CorePackages.Workspace.Packages.DiscoveryTypes).SearchSourceEvent
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local UseUserExperiment = require(CorePackages.Packages.RoactAppExperiment).useUserExperiment
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local DiscoveryUtilsModule = require(CorePackages.Workspace.Packages.DiscoveryUtils)
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local VisibilityControl = AppNavBarModule.VisibilityControl
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local SearchRetrievalStatus = Modules.LuaApp.Enum.SearchRetrievalStatus
local Context = Modules.LuaApp.Components.Search.SearchTypeSelection.Context
local OmniSearchSessionUtil = Modules.LuaApp.Analytics.Sessions.OmniSearchSessionUtil
local Modules1 = game:GetService("CoreGui").RobloxGui.Modules
local OmniSearchVerticalTypeModule = require(Modules1.LuaApp.Enum.OmniSearchVerticalType)
local TopBarModule = require(Modules1.LuaApp.Components.TopBar.TopBar)
local ButtonStripSelectorModule = require(Modules1.LuaApp.Components.Search.ButtonStripSelector)
local ScrollMovementDirectionModule = require(Modules1.LuaApp.Enum.ScrollMovementDirection)
local OpenWebviewModule = require(Modules1.LuaApp.Thunks.OpenWebview)
local SetSearchTypeModule = require(Modules1.LuaApp.Actions.SetSearchType)
local SetSearchParametersModule = require(Modules1.LuaApp.Actions.SetSearchParameters)
local SearchUuidModule = require(Modules1.LuaApp.SearchUuid)
local SearchModule = require(Modules1.LuaApp.Analytics.Events.search)
local ApiFetchOmniSearchAutoFirstPageModule = require(Modules1.LuaApp.Thunks.Search.ApiFetchOmniSearchAutoFirstPage)
local GetAutoFetchingStatusModule = require(Modules1.LuaApp.Thunks.Search.getAutoFetchingStatus)
local FFlagSearchTopResultsTabEnabledForAll = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSearchTopResultsTabEnabledForAll
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagSignalsNavP3dRouteGated = SharedFlagsModule.FFlagSignalsNavP3dRouteGated
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagLuaAppSearchPeopleUnifiedSchemaFields = SharedFlagsModule.FFlagLuaAppSearchPeopleUnifiedSchemaFields
local FFlagLuaAppSearchStandardizeAssetCategorization = SharedFlagsModule.FFlagLuaAppSearchStandardizeAssetCategorization
local FFlagLuaAppsDefaultSelection = SharedFlagsModule.FFlagLuaAppsDefaultSelection
local FFlagSduiOpenSearchResultsTabAction = SharedFlagsModule.FFlagSduiOpenSearchResultsTabAction
local SearchPageTabSwitchBridge = if FFlagSduiOpenSearchResultsTabAction then require(CorePackages.Workspace.Packages.ServerDrivenUi).SearchPageTabSwitchBridge else nil
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3dRouteGated then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local config = { frequency = 3, dampeningRatio = 0 }
local config1 = {
	[SearchTypes.Games] = require(Modules1.LuaApp.Components.Search.GamesSearchPage),
	[SearchTypes.Players] = require(Modules1.LuaApp.Components.UserSearch.Players.PlayerSearch),
	[SearchTypes.Catalog] = require(Modules1.AvatarExperience.Catalog.Components.Search.CatalogSearch),
	[SearchTypes.TopResults] = require(Modules1.LuaApp.Components.Search.TopResultsSearchPage.TopResultsSearchPage),
	[SearchTypes.Auto] = UIBloxModule.App.Container.LoadingStatePage
}
local Config = if FFlagAppIaScrollAway then {
	[SearchTypes.Games] = true,
	[SearchTypes.Players] = true,
	[SearchTypes.TopResults] = true
} else nil

local function fireAutoSearchLoadingTimeEvent(p1, p2, LoadingTime)
	-- upvalues: SearchRetrievalStatus (copy), GetDeepValueFunction (copy), OmniSearchVerticalTypeModule (copy), Contexts (copy), EventStream (copy), EventTypes (copy), CreateDiagMetricStringFunction (copy), Diag (copy)
	local OmniSearch = if p2.status == SearchRetrievalStatus.Failed then "omniSearch" elseif GetDeepValueFunction(p2, "result.responseBody.vertical") == OmniSearchVerticalTypeModule.User then Contexts.PlayerSearch else "gameSearch"
	EventStream:sendEventDeferred(OmniSearch, EventTypes.LoadingTime, {
		isAutoSearchType = true,
		status = p2.status,
		loadingTime = LoadingTime
	})
	Diag:reportStats(CreateDiagMetricStringFunction(p1, p2) .. "_" .. OmniSearch, LoadingTime)
end

local SearchPage = RoactModule.PureComponent:extend("SearchPage")
SearchPage.defaultProps = { searchType = SearchTypes.Games }
SearchPage.validateProps = TModule.strictInterface({
	topBarHeight = TModule.number,
	searchParameters = TModule.strictInterface({
		searchKeyword = TModule.string,
		isKeywordSuggestionEnabled = TModule.boolean
	}),
	searchType = TModule.string,
	screenSize = TModule.Vector2,
	currentPage = TModule.table,
	currentRoute = TModule.table,
	autoTabSearchStatus = TModule.string,
	openWebview = TModule.callback,
	setSearchType = TModule.callback,
	setSearchParameters = TModule.callback,
	dispatchOmniSearchAutoFirstPage = TModule.callback,
	eventIngest = TModule.any,
	sessionService = TModule.any,
	networking = TModule.any,
	useCreationCenterTitle = TModule.boolean,
	gridConfig = TModule.table,
	searchUuid = TModule.optional(TModule.string),
	omniSearchUuid = TModule.optional(TModule.string),
	isFocused = TModule.boolean,
	isTopPageEnabled = TModule.optional(TModule.boolean),
	defaultFocusRef = if FFlagLuaAppsDefaultSelection then TModule.optional(TModule.callback) else nil,
	containerRef = if FFlagLuaAppsDefaultSelection then TModule.optional(TModule.union(TModule.table, TModule.callback)) else nil,
	navigation = TModule.any
})

function SearchPage.init(p1)
	-- upvalues: RoactModule (copy), FFlagLuaAppsDefaultSelection (copy), SearchTypes (copy), DiscoveryUtilsModule (copy), SearchUuidModule (copy), OmniSearchSessionUtil (copy), SearchModule (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), AppPage (copy), SearchSourceEvent (copy), ScrollMovementDirectionModule (copy), OtterModule (copy), config (copy), LayoutConfig (copy), ReportPromiseLoadingTimeWrapperFunction (copy), fireAutoSearchLoadingTimeEvent (copy), PromiseModule (copy), MemoizeFunction (copy), FFlagSearchTopResultsTabEnabledForAll (copy)
	p1.isMounted = false
	p1.searchTypeSelectorFrameRef = RoactModule.createRef()
	p1.searchTypeSelectorContainerRef = if FFlagLuaAppsDefaultSelection then function(Current)
		-- upvalues: p1 (copy)
		p1.searchTypeSelectorFrameRef.current = Current
		
		if p1.props.defaultFocusRef then
			p1.props.defaultFocusRef(Current)
		end
	end else nil
	p1.searchPageRef = RoactModule.createRef()
	p1.searchComponents = {}
	local SearchType = p1.props.searchType
	p1.searchInfoMap = {}
	p1.searchInfoMap[SearchType] = {
		searchUuid = p1.props.searchUuid,
		searchParameters = p1.props.searchParameters
	}
	p1.currentSearchType = SearchType
	p1.state = {
		currentSearchType = SearchType,
		isRoutedFromAutoSearch = SearchType == SearchTypes.Auto
	}
	
	function p1.useSearchTypeSelector()
		-- upvalues: DiscoveryUtilsModule (upval), p1 (copy)
		return DiscoveryUtilsModule.isSearchTypeInOmniSearch(p1.state.currentSearchType)
	end
	
	function p1.updateSearchType(CurrentSearchType, AutoRouting)
		-- upvalues: p1 (copy), SearchTypes (upval), SearchUuidModule (upval), OmniSearchSessionUtil (upval), SearchModule (upval), FFlagAppIaScrollAway (upval), AppNavBarModule (upval)
		if p1.state.currentSearchType == CurrentSearchType then return end
		if not p1.props.searchParameters then
			assert(false, "self.props.searchParameters should not be nil")
			
			return
		end
		local SearchKeyword = p1.props.searchParameters.searchKeyword
		local SearchUuid = nil
		
		if p1.searchInfoMap[CurrentSearchType] then
			SearchUuid = p1.searchInfoMap[CurrentSearchType].searchUuid
		else
			SearchUuid = if p1.state.currentSearchType == SearchTypes.Auto and p1.searchInfoMap[SearchTypes.Auto] and p1.searchInfoMap[SearchTypes.Auto].searchUuid then p1.searchInfoMap[SearchTypes.Auto].searchUuid else SearchUuidModule()
			
			if p1.state.currentSearchType ~= SearchTypes.Auto and CurrentSearchType ~= SearchTypes.Auto then
				p1:setState({ isRoutedFromAutoSearch = false })
			end
			local SearchParameters = {
				isKeywordSuggestionEnabled = true,
				searchKeyword = SearchKeyword
			}
			p1.searchInfoMap[CurrentSearchType] = {
				searchUuid = SearchUuid,
				searchParameters = SearchParameters
			}
			p1.props.setSearchParameters(SearchUuid, SearchParameters)
			p1.props.setSearchType(SearchUuid, CurrentSearchType)
		end
		OmniSearchSessionUtil.updateSearchType(p1.props.sessionService, CurrentSearchType, SearchUuid, AutoRouting)
		local IsCurrentSearchTypeMatch = p1.state.currentSearchType == SearchTypes.Auto
		
		if p1.currentSearchType ~= CurrentSearchType then
			local CurrentRoute = p1.props.currentRoute
			SearchModule(p1.props.eventIngest, CurrentSearchType, "search", SearchKeyword, IsCurrentSearchTypeMatch, if IsCurrentSearchTypeMatch then CurrentRoute[#CurrentRoute - 1].name else p1.props.currentPage.name)
		end
		p1:setState({ currentSearchType = CurrentSearchType })
		p1.currentSearchType = CurrentSearchType
		
		if not FFlagAppIaScrollAway or not AppNavBarModule.getScrollAwayEnabled() then
			p1.setTabBarVisible()
		end
	end
	
	function p1.onPageChange(CurrentPage)
		-- upvalues: p1 (copy), AppPage (upval), OmniSearchSessionUtil (upval), SearchSourceEvent (upval)
		local CurrentPage1 = p1.props.currentPage
		
		if not CurrentPage1 or not CurrentPage1.name or CurrentPage1.name ~= AppPage.SearchPage then return end
		if not p1.props.isFocused then return end
		local SessionService = p1.props.sessionService
		local OmniSearchInfo = CurrentPage1.extraProps and CurrentPage1.extraProps.omniSearchInfo
		
		if OmniSearchInfo then
			assert(OmniSearchInfo.omniSearchUuid ~= nil)
			assert(OmniSearchInfo.searchKeyword ~= nil)
			local OmniSearchUuid = OmniSearchInfo.omniSearchUuid
			local SearchKeyword = OmniSearchInfo.searchKeyword
			
			if CurrentPage and CurrentPage.extraProps and CurrentPage.extraProps.omniSearchInfo and OmniSearchUuid == CurrentPage.extraProps.omniSearchInfo.omniSearchUuid then return end
			local SearchUuid = nil
			local SearchInfo = p1.searchInfoMap[p1.state.currentSearchType]
			
			if SearchInfo then
				SearchUuid = SearchInfo.searchUuid
			end
			OmniSearchSessionUtil.create(SessionService, OmniSearchUuid, SearchKeyword, p1.state.currentSearchType, SearchUuid, SearchSourceEvent.NavBack)
		end
	end
	
	function p1.onTopResultsSelected(p2)
		-- upvalues: p1 (copy), SearchTypes (upval)
		if p1.isMounted then
			p1.updateSearchType(SearchTypes.TopResults, p2)
			
			return
		end
	end
	
	function p1.onGamesSelected(p2)
		-- upvalues: p1 (copy), SearchTypes (upval)
		if p1.isMounted then
			p1.updateSearchType(SearchTypes.Games, p2)
			
			return
		end
	end
	
	function p1.onPlayersSelected(p2)
		-- upvalues: p1 (copy), SearchTypes (upval)
		if p1.isMounted then
			p1.updateSearchType(SearchTypes.Players, p2)
			
			return
		end
	end
	
	if not FFlagAppIaScrollAway or not AppNavBarModule.getScrollAwayEnabled() then
		p1.selectorVisible = true
		
		function p1.onScrollDirectionChanged(Backward)
			-- upvalues: ScrollMovementDirectionModule (upval), p1 (copy), OtterModule (upval), config (upval)
			local IsBackwardMatch = Backward == ScrollMovementDirectionModule.Backward
			
			if IsBackwardMatch ~= p1.selectorVisible then
				p1.selectorVisible = IsBackwardMatch
				p1.motor:setGoal({
					searchTypeSelectorFramePosition = OtterModule.spring(p1.getSelectorFramePosition(IsBackwardMatch), config),
					searchPagePosition = OtterModule.spring(p1.getSearchPagePosition(IsBackwardMatch), config),
					searchPageSizeOffset = OtterModule.spring(p1.getSearchPageSizeOffset(IsBackwardMatch), config)
				})
			end
		end
		
		function p1.setTabBarVisible()
			-- upvalues: p1 (copy), OtterModule (upval), config (upval)
			if not p1.selectorVisible then
				p1.selectorVisible = true
				p1.motor:setGoal({
					searchTypeSelectorFramePosition = OtterModule.spring(p1.getSelectorFramePosition(p1.selectorVisible), config),
					searchPagePosition = OtterModule.spring(p1.getSearchPagePosition(p1.selectorVisible), config),
					searchPageSizeOffset = OtterModule.spring(p1.getSearchPageSizeOffset(p1.selectorVisible), config)
				})
			end
		end
		
		function p1.getSelectorFramePosition(SelectorVisible): number
			-- upvalues: p1 (copy), LayoutConfig (upval)
			local TopBarHeightDelta = p1.props.topBarHeight - p1.props.gridConfig[LayoutConfig.Keys.PaddingVertical]
			
			if not SelectorVisible then
				TopBarHeightDelta -= 43
			end
			return TopBarHeightDelta
		end
		
		function p1.getSearchPagePosition(SelectorVisible): number
			-- upvalues: p1 (copy)
			return p1.getSelectorFramePosition(SelectorVisible) + 43 - 1
		end
		
		function p1.getSearchPageSizeOffset(SelectorVisible)
			-- upvalues: p1 (copy)
			return -p1.getSearchPagePosition(SelectorVisible)
		end
	end
	function p1.checkDispatchInitialOmniSearch()
		-- upvalues: SearchType (copy), SearchTypes (upval), ReportPromiseLoadingTimeWrapperFunction (upval), p1 (copy), fireAutoSearchLoadingTimeEvent (upval), PromiseModule (upval)
		return if SearchType == SearchTypes.Auto then ReportPromiseLoadingTimeWrapperFunction(p1.props.dispatchOmniSearchAutoFirstPage, function()
			return { fetch = "search_auto" }
		end, { fireEvent = fireAutoSearchLoadingTimeEvent })(p1.props.networking, p1.props.searchParameters.searchKeyword, p1.props.searchUuid, p1.props.omniSearchUuid) else PromiseModule.resolve()
	end
	
	p1.buildSearchTypeSelections = MemoizeFunction(function(Text, Text1, Text2, p2, p3)
		-- upvalues: FFlagSearchTopResultsTabEnabledForAll (upval), SearchTypes (upval), p1 (copy)
		local List = {}
		
		if FFlagSearchTopResultsTabEnabledForAll or p3 then
			table.insert(List, {
				name = SearchTypes.TopResults,
				text = Text,
				onActivated = p1.onTopResultsSelected
			})
		end
		table.insert(List, {
			name = SearchTypes.Games,
			text = Text1,
			onActivated = p1.onGamesSelected,
			image = if FFlagSearchTopResultsTabEnabledForAll or p3 then nil else "LuaApp/icons/GameDetails/play"
		})
		
		if p2 then
			table.insert(List, {
				name = SearchTypes.Players,
				text = Text2,
				onActivated = p1.onPlayersSelected,
				image = if FFlagSearchTopResultsTabEnabledForAll or p3 then nil else "LuaApp/icons/avatar_profile"
			})
		end
		return List
	end)
end

function SearchPage.renderWithLocalized(p1, p2)
	-- upvalues: SearchTypes (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), WithStyleFunction (copy), Config (copy), RoactModule (copy), config1 (copy), FFlagLuaAppSearchPeopleUnifiedSchemaFields (copy), AppPage (copy), SearchRetrievalStatus (copy), EmptyState (copy), FFlagLuaAppsDefaultSelection (copy), TopBarModule (copy), VisibilityControl (copy), ButtonStripSelectorModule (copy), DiscoveryUtilsModule (copy), FFlagSearchTopResultsTabEnabledForAll (copy), ReactModule (copy), Context (copy)
	local TopBarHeight = p1.props.topBarHeight
	local CurrentSearchType = p1.state.currentSearchType
	local SearchUuid = p1.searchInfoMap[CurrentSearchType].searchUuid
	local SearchParameters = p1.searchInfoMap[CurrentSearchType].searchParameters
	local UseCreationCenterTitle = p1.props.useCreationCenterTitle
	local Flag = true
	
	if CurrentSearchType == SearchTypes.Catalog then
		Flag = false
		TopBarHeight = 0
	end
	local Count: number = TopBarHeight
	
	if p1.useSearchTypeSelector() then
		Count += 43
	end
	local SearchPagePosition = if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then 0 else p1.useSearchTypeSelector() and p1.getSearchPagePosition(true) or Count
	local CreationCenter = if CurrentSearchType == SearchTypes.Games and UseCreationCenterTitle then p2.creationCenter elseif CurrentSearchType == SearchTypes.Games then p2.chartsTitle else nil
	
	return WithStyleFunction(function(p3)
		-- upvalues: CurrentSearchType (copy), SearchTypes (upval), FFlagAppIaScrollAway (upval), AppNavBarModule (upval), Config (upval), TopBarHeight (ref), p1 (copy), RoactModule (upval), config1 (upval), SearchUuid (copy), SearchParameters (copy), FFlagLuaAppSearchPeopleUnifiedSchemaFields (upval), AppPage (upval), SearchRetrievalStatus (upval), EmptyState (upval), p2 (copy), Count (ref), FFlagLuaAppsDefaultSelection (upval), Flag (ref), TopBarModule (upval), CreationCenter (ref), VisibilityControl (upval), ButtonStripSelectorModule (upval), DiscoveryUtilsModule (upval), FFlagSearchTopResultsTabEnabledForAll (upval), ReactModule (upval), Context (upval), SearchPagePosition (copy)
		local Transparency = if CurrentSearchType == SearchTypes.Catalog then 1 else p3.Theme.BackgroundDefault.Transparency
		local CanvasTopPadding: number? = nil
		
		if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() and Config[CurrentSearchType] then
			CanvasTopPadding = TopBarHeight
			
			if p1.useSearchTypeSelector() then
				CanvasTopPadding += 43
			end
		end
		local CreateElementFunction = RoactModule.createElement
		local Entry = config1[CurrentSearchType]
		local config = {
			searchUuid = SearchUuid,
			omniSearchUuid = p1.props.omniSearchUuid,
			searchParameters = SearchParameters,
			onScrollDirectionChanged = p1.useSearchTypeSelector() and p1.onScrollDirectionChanged or nil,
			isRoutedFromAutoSearch = p1.state.isRoutedFromAutoSearch,
			canvasTopPadding = CanvasTopPadding,
			appPage = if FFlagLuaAppSearchPeopleUnifiedSchemaFields and CurrentSearchType == SearchTypes.Players then AppPage.SearchPage else nil
		}
		p1.searchComponents[CurrentSearchType] = if CurrentSearchType == SearchTypes.Auto and p1.props.autoTabSearchStatus == SearchRetrievalStatus.Failed then RoactModule.createElement(EmptyState, {
			onActivated = p1.checkDispatchInitialOmniSearch,
			text = p2.failedMessage
		}) else CreateElementFunction(Entry, config)
		local Frames = {}
		
		for i, searchComponent in pairs(p1.searchComponents) do
			Frames[i] = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				Visible = i == CurrentSearchType
			}, { SearchComponent = searchComponent })
		end
		local SearchTypeSelections = p1.buildSearchTypeSelections(p2.topResults, p2.games, p2.players, SearchParameters ~= nil, p1.props.isTopPageEnabled)
		
		return RoactModule.createElement("Frame", {
			[RoactModule.Ref] = if FFlagLuaAppsDefaultSelection then p1.props.containerRef else nil,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1
		}, {
			TopBar = if Flag then RoactModule.createElement(TopBarModule.Container, {
				ZIndex = 3,
				searchType = CurrentSearchType,
				searchParameters = SearchParameters,
				titleText = CreationCenter,
				leftItem = TopBarModule.BackButton,
				rightItems = {
					TopBarModule.SearchButton,
					TopBarModule.BuyRobuxButton,
					TopBarModule.NotificationsButton
				}
			}) else nil,
			SearchTypeSelectorFrame = p1.useSearchTypeSelector() and RoactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, 43),
				Position = if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then VisibilityControl.getHeaderBinding():map(function(p4): UDim2
					-- upvalues: TopBarHeight (upval)
					return UDim2.fromOffset(0, p4 * (TopBarHeight + 43) - 43)
				end) else UDim2.new(0, 0, 0, p1.getSelectorFramePosition(true)),
				BackgroundColor3 = p3.Theme.BackgroundDefault.Color,
				BackgroundTransparency = Transparency,
				BorderSizePixel = 0,
				ZIndex = 2,
				[RoactModule.Ref] = if FFlagLuaAppsDefaultSelection then p1.searchTypeSelectorContainerRef else p1.searchTypeSelectorFrameRef
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, 10)
				}),
				SearchTypeSelector = RoactModule.createElement(ButtonStripSelectorModule, {
					layoutOrder = 1,
					selections = SearchTypeSelections,
					activeSelection = CurrentSearchType,
					size = UDim2.new(1, 0, 0, 32),
					backgroundColor3 = p3.Theme.BackgroundDefault.Color,
					backgroundTransparency = Transparency,
					leftRightPadding = DiscoveryUtilsModule.getPageSideMargin(p1.props.screenSize.X),
					newDesignEnabled = p1.props.isTopPageEnabled or FFlagSearchTopResultsTabEnabledForAll
				}),
				Divider = RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					BackgroundColor3 = p3.Theme.Divider.Color,
					BackgroundTransparency = p3.Theme.Divider.Transparency
				})
			}),
			SearchTypeSelectionContextProvider = ReactModule.createElement(Context.Provider, { value = { selections = SearchTypeSelections } }, {
				SearchPage = RoactModule.createElement("Frame", {
					BackgroundColor3 = p3.Theme.BackgroundDefault.Color,
					BackgroundTransparency = Transparency,
					ZIndex = 1,
					Position = UDim2.new(0, 0, 0, SearchPagePosition),
					Size = UDim2.new(1, 0, 1, if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then 0 else p1.useSearchTypeSelector() and p1.getSearchPageSizeOffset(true) or -Count),
					BorderSizePixel = if p1.useSearchTypeSelector() then 0 else nil,
					[RoactModule.Ref] = p1.useSearchTypeSelector() and p1.searchPageRef or nil
				}, Frames)
			})
		})
	end)
end

function SearchPage.render(p3)
	-- upvalues: WithLocalizationFunction (copy), FFlagLuaAppSearchStandardizeAssetCategorization (copy)
	return WithLocalizationFunction({
		creationCenter = "CommonUI.Features.Label.CreationCenter",
		players = "CommonUI.Features.Label.Players",
		failedMessage = "Feature.EmptyStatePage.Message.NoInternet",
		chartsTitle = "CommonUI.Features.Label.Charts",
		topResults = "Search.GlobalSearch.TopResultsLabel",
		games = if FFlagLuaAppSearchStandardizeAssetCategorization then "CommonUI.Features.Label.Games" else "CommonUI.Features.Label.Game"
	})(function(p4)
		-- upvalues: p3 (copy)
		return (p3:renderWithLocalized(p4))
	end)
end

function SearchPage.didMount(p3)
	-- upvalues: FFlagSduiOpenSearchResultsTabAction (copy), SearchPageTabSwitchBridge (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), OtterModule (copy)
	p3.isMounted = true
	
	if FFlagSduiOpenSearchResultsTabAction then
		p3.tabSwitchConnection = SearchPageTabSwitchBridge.connect(function(CurrentSearchType, p4)
			-- upvalues: p3 (copy)
			if p3.isMounted then
				p3.updateSearchType(CurrentSearchType, p4)
				
				return
			end
		end)
	end
	if not p3.useSearchTypeSelector() then return end
	if not FFlagAppIaScrollAway or not AppNavBarModule.getScrollAwayEnabled() then
		p3.motor = OtterModule.createGroupMotor({
			searchTypeSelectorFramePosition = p3.getSelectorFramePosition(true),
			searchPagePosition = p3.getSearchPagePosition(true),
			searchPageSizeOffset = p3.getSearchPageSizeOffset(true)
		})
		p3.motor:onStep(function(p4)
			-- upvalues: p3 (copy)
			if p3.searchTypeSelectorFrameRef.current then
				p3.searchTypeSelectorFrameRef.current.Position = UDim2.new(0, 0, 0, p4.searchTypeSelectorFramePosition)
			end
			local SearchPageSizeOffset = p4.searchPageSizeOffset
			p3.searchPageRef.current.Position = UDim2.new(0, 0, 0, p4.searchPagePosition)
			p3.searchPageRef.current.Size = UDim2.new(1, 0, 1, SearchPageSizeOffset)
		end)
		p3.motor:start()
	end
	p3.checkDispatchInitialOmniSearch()
end

function SearchPage.willUnmount(p3)
	-- upvalues: FFlagSduiOpenSearchResultsTabAction (copy)
	p3.isMounted = false
	
	if FFlagSduiOpenSearchResultsTabAction and p3.tabSwitchConnection then
		p3.tabSwitchConnection:disconnect()
		p3.tabSwitchConnection = nil
	end
	if p3.motor then
		p3.motor:destroy()
	end
end

function SearchPage.didUpdate(p3, p4, _)
	-- upvalues: SearchTypes (copy), SearchSourceEvent (copy)
	if p4.currentPage ~= p3.props.currentPage then
		p3.onPageChange(p4.currentPage)
	end
	local CurrentSearchType = p3.state.currentSearchType
	
	if p3.props.searchType ~= CurrentSearchType and CurrentSearchType == SearchTypes.Auto then
		p3.updateSearchType(p3.props.searchType, SearchSourceEvent.AutoRouting)
	end
end

local v1 = RoactAppPolicy.connect(function(p3, _)
	return {
		useCreationCenterTitle = p3.getGamesPageCreationCenterTitle()
	}
end)((RoactServices.connect({
	eventIngest = AppEventIngestService,
	sessionService = AppSessionService,
	networking = RoactNetworking
})((RoactRoduxModule.connect(function(p3, p4)
	-- upvalues: FFlagSignalsNavP3dRouteGated (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), GetAutoFetchingStatusModule (copy), SearchRetrievalStatus (copy)
	local SelectCurrentLegacyRouteResult = if FFlagSignalsNavP3dRouteGated then nil elseif FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p3) else p3.Navigation.history[#p3.Navigation.history]
	local SearchesParameter = p3.SearchesParameters[p4.searchUuid]
	
	return {
		topBarHeight = p3.TopBar.topBarHeight,
		searchParameters = SearchesParameter,
		searchType = p3.SearchesTypes[p4.searchUuid],
		screenSize = p3.ScreenSize,
		currentPage = if FFlagSignalsNavP3dRouteGated then nil else SelectCurrentLegacyRouteResult[#SelectCurrentLegacyRouteResult],
		currentRoute = SelectCurrentLegacyRouteResult,
		autoTabSearchStatus = SearchesParameter and GetAutoFetchingStatusModule(p3, SearchesParameter.searchKeyword) or SearchRetrievalStatus.NotStarted
	}
end, function(Callback)
	-- upvalues: OpenWebviewModule (copy), SetSearchTypeModule (copy), SetSearchParametersModule (copy), ApiFetchOmniSearchAutoFirstPageModule (copy)
	return {
		openWebview = function(p3, p4)
			-- upvalues: Callback (copy), OpenWebviewModule (upval)
			return Callback(OpenWebviewModule(p3, p4))
		end,
		setSearchType = function(p3, p4)
			-- upvalues: Callback (copy), SetSearchTypeModule (upval)
			return Callback(SetSearchTypeModule(p3, p4))
		end,
		setSearchParameters = function(p3, p4)
			-- upvalues: Callback (copy), SetSearchParametersModule (upval)
			return Callback(SetSearchParametersModule(p3, p4))
		end,
		dispatchOmniSearchAutoFirstPage = function(p3, SearchKeyword, SearchUuid, OmniSearchUuid)
			-- upvalues: Callback (copy), ApiFetchOmniSearchAutoFirstPageModule (upval)
			return Callback((ApiFetchOmniSearchAutoFirstPageModule(p3, {
				searchKeyword = SearchKeyword,
				searchUuid = SearchUuid,
				omniSearchUuid = OmniSearchUuid
			})))
		end
	}
end)(SearchPage)))))

return function(p3)
	-- upvalues: UseNavigationProps (copy), UseNavigationFocus (copy), FFlagLuaAppsDefaultSelection (copy), ReactFocusNavigationModule (copy), FFlagSearchTopResultsTabEnabledForAll (copy), UseUserExperiment (copy), AppUserLayers (copy), FFlagSignalsNavP3dRouteGated (copy), GetLegacyNavigationStore (copy), UseSignalState (copy), WithGridConfigDEPRECATED (copy), LayoutConfig (copy), RoactModule (copy), v1 (copy), CryoModule (copy)
	local v2 = UseNavigationProps(function(SearchUuid, p4)
		return if SearchUuid then {
			searchUuid = SearchUuid,
			omniSearchUuid = p4.omniSearchInfo and p4.omniSearchInfo.omniSearchUuid
		} else {}
	end)
	local IsFocused = UseNavigationFocus()
	local v3 = nil
	local v4 = nil
	
	if FFlagLuaAppsDefaultSelection then
		v3, v109 = ReactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior()
	end
	local v5 = if FFlagSearchTopResultsTabEnabledForAll then nil else UseUserExperiment({ AppUserLayers.OmniSearchResultsPageUXExposureLayer }, function(p4)
		-- upvalues: AppUserLayers (upval)
		return (p4[AppUserLayers.OmniSearchResultsPageUXExposureLayer] or {}).isTopPageEnabled
	end, false)
	local v6 = nil
	local v7 = nil
	
	if FFlagSignalsNavP3dRouteGated then
		v7 = UseSignalState(GetLegacyNavigationStore(false).getCurrentLegacyRoute)
		v6 = v7[#v7]
	end
	return WithGridConfigDEPRECATED({ [LayoutConfig.Keys.PaddingVertical] = 0 }, LayoutConfig.Kind)(function(GridConfig)
		-- upvalues: RoactModule (upval), v1 (upval), CryoModule (upval), p3 (copy), IsFocused (copy), FFlagSearchTopResultsTabEnabledForAll (upval), v5 (ref), FFlagLuaAppsDefaultSelection (upval), v3 (ref), v4 (ref), FFlagSignalsNavP3dRouteGated (upval), v6 (ref), v7 (ref), v2 (copy)
		return RoactModule.createElement(v1, CryoModule.Dictionary.join(p3, {
			gridConfig = GridConfig,
			isFocused = IsFocused,
			isTopPageEnabled = FFlagSearchTopResultsTabEnabledForAll or v5,
			defaultFocusRef = if FFlagLuaAppsDefaultSelection then v3 else nil,
			containerRef = if FFlagLuaAppsDefaultSelection then v4 else nil,
			currentPage = if FFlagSignalsNavP3dRouteGated then v6 else nil,
			currentRoute = if FFlagSignalsNavP3dRouteGated then v7 else nil
		}, v2))
	end)
end