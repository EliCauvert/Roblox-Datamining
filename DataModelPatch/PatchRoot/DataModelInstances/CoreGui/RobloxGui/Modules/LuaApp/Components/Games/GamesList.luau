local Workspace = game:GetService("Workspace")
local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local TopicInfosReducer = require(CorePackages.Workspace.Packages.TopicInfosRodux).TopicInfosReducer
local TopicContentsReducer = require(CorePackages.Workspace.Packages.TopicContentsRodux).TopicContentsReducer
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local CryoModule = require(CorePackages.Packages.Cryo)
local WithStyleFunction = UIBloxModule.Style.withStyle
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactServiceTagsModule = require(CorePackages.Workspace.Packages.RoactServiceTags)
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local AppLogging = RoactServiceTagsModule.AppLogging
local RoactAnalyticsCommonGameEvents = RoactServiceTagsModule.RoactAnalyticsCommonGameEvents
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local UseAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UseLocalization = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local UseDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local GameCollectionItemTypes = require(CorePackages.Workspace.Packages.GameCollections).GameCollectionItemTypes
local SendGameImpressions = require(CorePackages.Workspace.Packages.GameCollections).SendGameImpressions
local DiscoveryAnalyticsModule = require(CorePackages.Workspace.Packages.DiscoveryAnalytics)
local GamePlayIntentFunction = DiscoveryAnalyticsModule.Events.gamePlayIntent
local SortDeeplinkFailureCounter = DiscoveryAnalyticsModule.Events.sortDeeplinkFailureCounter
local Context = DiscoveryAnalyticsModule.Constants.Context
local UseUiModeInfo = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local UseDeviceType = require(CorePackages.Workspace.Packages.RobloxAppHooks).useDeviceType
local UseNavigationProps = require(CorePackages.Workspace.Packages.RobloxAppNavigation).useNavigationProps
local IconWithTooltip = require(CorePackages.Workspace.Packages.AppBlox).IconWithTooltip
local OpenInfoPeekView = require(CorePackages.Workspace.Packages.DiscoveryRouting).OpenInfoPeekView
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local OmniFeedConstants = DiscoveryTypesModule.OmniFeedConstants
local GameTileConstants = require(CorePackages.Workspace.Packages.GameTile).GameTileConstants
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local SduiSeeAllGrid = require(CorePackages.Workspace.Packages.ServerDrivenUi).SduiSeeAllGrid
local IsSduiGameOmniFeedItemFunction = require(CorePackages.Workspace.Packages.ServerDrivenUi).isSduiGameOmniFeedItem
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local UseAnimateScrollViewToSelection = require(CorePackages.Workspace.Packages.AppBlox).useAnimateScrollViewToSelection
local UseLastInputMode = require(CorePackages.Workspace.Packages.FocusNavigationUtils).useLastInputMode
local NavigateBackFunction = require(CorePackages.Workspace.Packages.NavigationRodux).Thunks.NavigateBack
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local ApiFetchGamesInSortFunction = Modules.LuaApp.Thunks.Games.ApiFetchGamesInSort
local FetchDataWithErrorToastsFunction = Modules.LuaApp.Thunks.FetchDataWithErrorToasts
local ApiFetchOmniRecommendationsMetadataFunction = Modules.LuaApp.Thunks.Omni.ApiFetchOmniRecommendationsMetadata
local ApiFetchOmniRecommendationsFunction = Modules.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations
local GameGridSelector = Modules.LuaApp.Components.Games.GameGridSelector
local ApiFetchGamesDataFunction = Modules.LuaApp.Thunks.Games.ApiFetchGamesData
local RefreshGameSortsFunction = Modules.LuaApp.Thunks.RefreshGameSorts
local RefreshExpiringSortTokensFunction = Modules.LuaApp.Thunks.Games.RefreshExpiringSortTokens
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local CollectionViewsModule = require(CorePackages.Workspace.Packages.CollectionViews)
local UsePageSideMargin = CollectionViewsModule.usePageSideMargin
local UseCollectionLayout = CollectionViewsModule.useCollectionLayout
local CompositionTags = require(CorePackages.Workspace.Packages.AppComposition).CompositionTags
local Modules1 = game:GetService("CoreGui").RobloxGui.Modules
local FitChildrenModule = require(Modules1.LuaApp.FitChildren)
local FitTextLabelModule = require(Modules1.LuaApp.Components.FitTextLabel)
local GamesDropDownListModule = require(Modules1.LuaApp.Components.Games.GamesDropDownList)
local GameCategoryTabGroupModule = require(Modules1.LuaApp.Components.Games.GameCategoryTabGroup)
local RefreshScrollingFrameWithLoadMoreModule = require(Modules1.LuaApp.Components.RefreshScrollingFrameWithLoadMore)
local RefreshSiteAlertInfoModule = require(Modules1.LuaApp.Actions.RefreshSiteAlertInfo)
local PersonalizationTopBarModule = require(Modules1.Personalization.PersonalizationTopBar)
local SduiChartsSortDetailPageModule = require(Modules1.Personalization.Games.SduiChartsSortDetailPage)
local UseLogSduiChartsExposureModule = require(Modules1.Personalization.Games.useLogSduiChartsExposure)
local GameSeeAllImpressionsDetectorModule = require(Modules1.Personalization.Games.GameSeeAllImpressionsDetector)
local LuaAppGameTileConfigModule = require(Modules1.LuaApp.Flags.LuaAppGameTileConfig)
local FFlagLuaAppRemoveSeeAllDropdownModule = require(Modules1.Personalization.Flags.FFlagLuaAppRemoveSeeAllDropdown)
local FFlagLuaAppRemoveSeeAllDropdownIXPModule = require(Modules1.Personalization.Flags.FFlagLuaAppRemoveSeeAllDropdownIXP)
local LuaAppExplicitErrorOnWidthForSeeAll2 = game:DefineFastFlag("LuaAppExplicitErrorOnWidthForSeeAll2", false)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagLuaAppSortDeeplinkFix = SharedFlagsModule.FFlagLuaAppSortDeeplinkFix
local FFlagLuaAppLayoutParamsInContext = SharedFlagsModule.FFlagLuaAppLayoutParamsInContext
local FFlagLuaAppSduiSeeAllLayoutParamsFix = SharedFlagsModule.FFlagLuaAppSduiSeeAllLayoutParamsFix
local FFlagLuaAppLogOmniRecommendationsMetadata = SharedFlagsModule.FFlagLuaAppLogOmniRecommendationsMetadata
local FFlagExtendScrollingFramesBySafeInsets = SharedFlagsModule.FFlagExtendScrollingFramesBySafeInsets
local FFlagEnableLeftNavOnConsole = SharedFlagsModule.FFlagEnableLeftNavOnConsole
local FFlagLuaAppCompositionCharts = SharedFlagsModule.FFlagLuaAppCompositionCharts
local FFlagLuaAppCompositionAlways = SharedFlagsModule.FFlagLuaAppCompositionAlways
local FFlagLuaAppCompositionHome = SharedFlagsModule.FFlagLuaAppCompositionHome or (FFlagLuaAppCompositionCharts or FFlagLuaAppCompositionAlways)
local FFlagLuaAppChartsAppPage = SharedFlagsModule.FFlagLuaAppChartsAppPage
local FFlagLuaAppLogChartsAppPageExposure = SharedFlagsModule.FFlagLuaAppLogChartsAppPageExposure
local GAMEGRIDPADDING = DiscoveryTypesModule.Constants.GAME_GRID_PADDING
local SECTIONHEADERHEIGHT = require(Modules1.LuaApp.Constants).SECTION_HEADER_HEIGHT
local SortCategories = {
	OMNI_HOME = { isOmni = true, sortType = AppPage.Home },
	GAMES = {
		isOmni = false,
		sortType = DiscoveryTypesModule.GameSortGroups.GamesList
	}
}
local GamesList = RoactModule.PureComponent:extend("GamesList")
GamesList.validateProps = TModule.strictInterface({
	sortPageId = TModule.optional(TModule.string),
	isOmni = TModule.optional(TModule.boolean),
	initialSortIndex = TModule.optional(TModule.number),
	initialSortName = TModule.optional(TModule.string),
	pageContext = TModule.string,
	contentFrame = TModule.optional(TModule.Instance),
	setContentFrame = TModule.optional(TModule.callback),
	setScrollingFrame = TModule.optional(TModule.callback),
	containerRef = if FFlagEnableLeftNavOnConsole then TModule.table else nil,
	isScrollingEnabled = if FFlagEnableLeftNavOnConsole then TModule.boolean else nil,
	topBarHeight = TModule.number,
	screenSize = TModule.Vector2,
	topicInfos = TModule.table,
	gameSortContents = TModule.table,
	sponsoredTooltipTitle = TModule.string,
	sponsoredTooltipBody = TModule.string,
	dispatchRefresh = TModule.callback,
	dispatchRefreshOmni = TModule.callback,
	dispatchRefreshSortContents = TModule.callback,
	dispatchLoadMoreGames = TModule.callback,
	dispatchLoadMoreGamesOmni = TModule.callback,
	dispatchFetchExpiringTokens = TModule.callback,
	onActivateTooltip = TModule.callback,
	navigateBack = TModule.callback,
	useCreationCenterTitle = TModule.optional(TModule.boolean),
	useCategoryScrollList = TModule.optional(TModule.boolean),
	deviceType = TModule.string,
	safeAreaPadding = TModule.number,
	safeAreaBottomPadding = TModule.optional(TModule.number),
	gameGridSidePadding = TModule.number,
	stableContentWidth = TModule.optional(TModule.number),
	categorySelectorHeight = TModule.optional(TModule.number),
	topBarCategoriesScrollerPadding = TModule.optional(TModule.number),
	topBarCategoriesScrollerHeight = TModule.optional(TModule.number),
	backgroundTransparency = TModule.number,
	hasTopBar = TModule.boolean,
	hideGameStatsIXP = TModule.optional(TModule.boolean),
	hideDropdown = if FFlagLuaAppRemoveSeeAllDropdownIXPModule then TModule.optional(TModule.boolean) else nil,
	navigation = TModule.optional(TModule.table),
	screenProps = TModule.optional(TModule.table),
	loggingProtocol = TModule.table,
	networking = TModule.callback,
	eventIngest = TModule.table,
	analytics = TModule.table,
	appAnalytics = TModule.table
})

function GamesList.init(p1)
	-- upvalues: Signal (copy), FFlagEnableLeftNavOnConsole (copy), RoactModule (copy), LuaAppExplicitErrorOnWidthForSeeAll2 (copy), Workspace (copy), MutedErrorFunction (copy), IsSduiGameOmniFeedItemFunction (copy), SortCategories (copy), OmniFeedConstants (copy), DiscoveryTypesModule (copy), SendGameImpressions (copy), GamePlayIntentFunction (copy), Context (copy), GameCollectionItemTypes (copy)
	function p1.isOmni()
		-- upvalues: p1 (copy)
		return p1.state.selectedOmni
	end
	
	p1.gamesListViewChangedSignal = Signal.new()
	p1.containerRef = if FFlagEnableLeftNavOnConsole then p1.props.containerRef else RoactModule.createRef()
	
	function p1.setContainerRef(Current)
		-- upvalues: p1 (copy)
		p1.containerRef.current = Current
		
		if p1.props.setScrollingFrame then
			p1.props.setScrollingFrame(Current)
		end
	end
	
	local ScreenSize = p1.props.screenSize
	local GameGridSidePadding: number = p1.props.gameGridSidePadding
	local StableContentWidth = if p1.props.stableContentWidth then p1.props.stableContentWidth else ScreenSize.X - 2 * GameGridSidePadding
	
	if StableContentWidth < 0 then
		if LuaAppExplicitErrorOnWidthForSeeAll2 then
			if Workspace.CurrentCamera then
				local ViewportSize = Workspace.CurrentCamera.ViewportSize
				MutedErrorFunction(`See All contentWidth should be positive. screenSize.X: {ScreenSize.X}; sidePadding: {GameGridSidePadding}; Camera: ({ViewportSize.X}, {ViewportSize.Y})`)
			else
				MutedErrorFunction(`See All does not have a Workspace.CurrentCamera! screenSize.X: {ScreenSize.X}; sidePadding: {GameGridSidePadding}`)
			end
		end
		StableContentWidth = 0
	end
	p1:setState({
		sortIndex = if p1.props.isOmni then p1.props.initialSortIndex else nil,
		sortName = p1.props.initialSortName,
		selectedOmni = p1.props.isOmni,
		contentSize = Vector2.new(StableContentWidth, ScreenSize.Y),
		frameSize = ScreenSize
	})
	
	function p1.getSelectedSort()
		-- upvalues: p1 (copy)
		return p1.props.topicInfos[p1.state.sortName] or {}
	end
	
	function p1.getSelectedSortContents()
		-- upvalues: p1 (copy)
		return p1.props.gameSortContents[p1.state.sortName]
	end
	
	function p1.getSelectedSortIdentifier()
		-- upvalues: p1 (copy)
		return p1.state.sortName
	end
	
	function p1.isSponsoredSort(): boolean
		-- upvalues: p1 (copy)
		local SelectedSort = p1.getSelectedSort()
		
		return if SelectedSort and SelectedSort:isSponsored() then true else false
	end
	
	function p1.isSdui(): boolean
		-- upvalues: p1 (copy), IsSduiGameOmniFeedItemFunction (upval)
		local SelectedSort = p1.getSelectedSort()
		
		return if SelectedSort and IsSduiGameOmniFeedItemFunction(SelectedSort.treatmentType, SelectedSort.topicId) then true else false
	end
	
	function p1.refresh()
		-- upvalues: SortCategories (upval), p1 (copy), OmniFeedConstants (upval)
		return p1.isOmni() and p1.props.dispatchRefreshOmni(p1.props.networking, p1.props.omniRecommendationsRequest, SortCategories.OMNI_HOME.sortType, OmniFeedConstants.OmniRecommendationsRequestIntent.ManualRefresh, p1.props.loggingProtocol) or p1.props.dispatchRefresh(p1.props.networking, p1.state.sortName, SortCategories.GAMES.sortType)
	end
	
	function p1.loadMoreGames(p2)
		-- upvalues: DiscoveryTypesModule (upval), p1 (copy), SortCategories (upval)
		local P2 = p2 or DiscoveryTypesModule.Constants.DEFAULT_GAME_FETCH_COUNT
		local DispatchLoadMoreGamesFunction = p1.props.dispatchLoadMoreGames
		local Networking = p1.props.networking
		local SelectedSort = p1.getSelectedSort()
		local SelectedSortContents = p1.getSelectedSortContents()
		
		if p1.isOmni() then
			return p1.props.dispatchLoadMoreGamesOmni(Networking, SortCategories.OMNI_HOME.sortType, p1.state.sortIndex, P2, p1.props.loggingProtocol)
		elseif not SelectedSortContents then return end
		return DispatchLoadMoreGamesFunction(Networking, SelectedSort, SelectedSortContents.rowsRequested, P2, SelectedSortContents.nextPageExclusiveStartId, SelectedSortContents.nextPageToken)
	end
	
	function p1.switchToSort(p2, SortIndex, p3)
		-- upvalues: p1 (copy)
		if not p1.isMounted then return end
		if p2.topicId == nil then
			p1.props.analytics.reportFilterChangeWithId(p2.gameSetTypeId, p2.gameSetTargetId, p3)
			p1:setState({ selectedOmni = false, sortName = p2.name })
		else
			p1.props.analytics.reportFilterChangeWithId(p2.topicId, nil, p3)
			p1:setState({
				selectedOmni = true,
				sortIndex = SortIndex,
				sortName = tostring(p2.topicId)
			})
		end
		spawn(function()
			-- upvalues: p1 (upval)
			if p1.isMounted then
				p1:setState({ forceRender = nil })
			end
		end)
	end
	
	function p1.reportGameDetailOpened(p2)
		-- upvalues: p1 (copy)
		local SelectedSort = p1.getSelectedSort()
		local Analytics = p1.props.analytics
		local SelectedSortContents = p1.getSelectedSortContents()
		local Entries = SelectedSortContents and SelectedSortContents.entries or nil
		
		if Entries then
			local Entry = Entries[p2]
			Analytics.reportOpenGameDetailWithId(Entry.placeId, SelectedSort and SelectedSort.analyticsTypeId or nil, SelectedSort and SelectedSort.gameSetTargetId, nil, p2, #Entries, Entry.isSponsored, Entry.adId, Entry.universeId, p1.props.pageContext, SelectedSort and SelectedSort.appliedFilters or nil)
			
			return
		end
	end
	
	function p1.sendGameImpressionsFromSdui(p2, p3, _, _, p4)
		-- upvalues: p1 (copy)
		p1.sendGameImpressions(p2, p3, p4)
	end
	
	function p1.setLogSduiImpressions(LogSduiImpressions)
		-- upvalues: p1 (copy)
		p1:setState({ logSduiImpressions = LogSduiImpressions })
	end
	
	function p1.onCollectionViewabilityChanged()
		-- upvalues: p1 (copy)
		p1.gamesListViewChangedSignal:fire()
	end
	
	function p1.sendGameImpressions(p2, p3, p4)
		-- upvalues: p1 (copy), SendGameImpressions (upval)
		local SelectedSortContents = p1.getSelectedSortContents()
		
		if not p3 and not SelectedSortContents then return end
		local SelectedSort = p1.getSelectedSort()
		
		if SelectedSort then
			SendGameImpressions.sendFromSeeAll(p1.props.eventIngest, p1.props.appAnalytics, p2, p3 or SelectedSortContents.entries, p1.props.pageContext, SelectedSort.analyticsTypeId, SelectedSort.gameSetTargetId, if p1.isOmni() then nil else p1.props.sortPageId, SelectedSort.appliedFilters, p4)
			
			return
		end
	end
	
	function p1.onAbsoluteContentSizeChanged(p2)
		-- upvalues: p1 (copy)
		if p1.props.stableContentWidth then return end
		if p1.isMounted and p2 then
			local AbsoluteContentSize = p2.AbsoluteContentSize
			
			if p1.state.contentSize == AbsoluteContentSize then return end
			if AbsoluteContentSize.X > 0 and AbsoluteContentSize.Y > 0 then
				p1:setState({ contentSize = AbsoluteContentSize })
			end
		end
	end
	
	function p1.updateGamesInSort()
		-- upvalues: SortCategories (upval), p1 (copy)
		p1.props.dispatchFetchExpiringTokens(p1.props.networking, SortCategories.GAMES.sortType)
		local SelectedSortContents = p1.getSelectedSortContents()
		local CountEntries = SelectedSortContents and SelectedSortContents.entries and #SelectedSortContents.entries or nil
		
		if CountEntries ~= nil and CountEntries == 0 then
			if p1.isOmni() then
				p1.loadMoreGames():catch(function()
					warn("Failed to load omni games")
				end)
				
				return
			end
			p1.props.dispatchRefreshSortContents(p1.props.networking, p1.state.sortName)
		end
	end
	
	function p1.reportExperienceLaunched(p2, ReferralSource)
		-- upvalues: p1 (copy), GamePlayIntentFunction (upval), Context (upval), GameCollectionItemTypes (upval)
		local SelectedSort = p1.getSelectedSort()
		GamePlayIntentFunction(p1.props.eventIngest, Context.ExperienceTile, {
			placeId = p2.placeId,
			rootPlaceId = tonumber(p2.placeId),
			universeId = p2.universeId,
			sortIndex = tostring(p1.state.sortIndex),
			sortEntryIndex = tostring(p2.index),
			referralSource = ReferralSource,
			gameSetTypeId = if p1.isOmni() then SelectedSort.topicId else SelectedSort.gameSetTypeId,
			gameSetTargetId = if p1.isOmni() then nil else SelectedSort.gameSetTargetId,
			appliedFilters = SelectedSort.appliedFilters,
			nativeAdData = p2.adId,
			pageName = p1.props.pageContext,
			tileType = GameCollectionItemTypes.GameCollectionItemType.GameTile
		})
	end
	
	function p1.onActivateTooltip()
		-- upvalues: p1 (copy)
		if p1.isMounted and p1.isSponsoredSort() then
			p1.props.onActivateTooltip(p1.props.sponsoredTooltipTitle, p1.props.sponsoredTooltipBody)
		end
	end
end

function GamesList.renderWithLocalized(p1, p2)
	-- upvalues: LuaAppGameTileConfigModule (copy), AppPage (copy), FFlagLuaAppRemoveSeeAllDropdownModule (copy), FFlagLuaAppRemoveSeeAllDropdownIXPModule (copy), SECTIONHEADERHEIGHT (copy), SortCategories (copy), WithStyleFunction (copy), GameTileConstants (copy), RoactModule (copy), IconWithTooltip (copy), TooltipOrientation (copy), PersonalizationTopBarModule (copy), FFlagLuaAppCompositionHome (copy), CompositionTags (copy), ReactModule (copy), GameCategoryTabGroupModule (copy), FFlagEnableLeftNavOnConsole (copy), RefreshScrollingFrameWithLoadMoreModule (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), FFlagLuaAppLayoutParamsInContext (copy), FFlagLuaAppSduiSeeAllLayoutParamsFix (copy), FFlagExtendScrollingFramesBySafeInsets (copy), GAMEGRIDPADDING (copy), GamesDropDownListModule (copy), FitTextLabelModule (copy), FitChildrenModule (copy), SduiSeeAllGrid (copy), GameGridSelector (copy), Context (copy), GameSeeAllImpressionsDetectorModule (copy)
	local TopBarHeight = p1.props.topBarHeight
	local SelectedSortIdentifier = p1.getSelectedSortIdentifier()
	local ScreenSize = p1.props.screenSize
	local FrameSize = p1.state.frameSize
	local ContentSize = p1.state.contentSize
	local SelectedSort = p1.getSelectedSort()
	local SelectedSortContents = p1.getSelectedSortContents()
	local UseCreationCenterTitle = p1.props.useCreationCenterTitle
	local GameGridSidePadding = p1.props.gameGridSidePadding
	local ShouldHideGameStats = LuaAppGameTileConfigModule.shouldHideGameStats(p1.props.pageContext, p1.props.hideGameStatsIXP)
	local Tabs: string = if p1.props.useCategoryScrollList then "Tabs" else "Dropdown"
	
	if not SelectedSortIdentifier then
		return nil
	end
	if not SelectedSortContents then
		return nil
	end
	local CreationCenter = if UseCreationCenterTitle then p2.creationCenter elseif p1.props.pageContext == AppPage.Games then p2.chartsTitle else nil
	local NoFFlagLuaAppRemoveSeeAllDropdownIXPModule = FFlagLuaAppRemoveSeeAllDropdownModule and (not FFlagLuaAppRemoveSeeAllDropdownIXPModule or p1.props.hideDropdown)
	local YOffset1 = if NoFFlagLuaAppRemoveSeeAllDropdownIXPModule then nil else 38
	local Offset = 12
	local YOffset: number = if NoFFlagLuaAppRemoveSeeAllDropdownIXPModule then Offset else YOffset1 + Offset
	local NewYOffset = YOffset + SECTIONHEADERHEIGHT + 14
	
	if Tabs == "Tabs" then
		YOffset1 = 0
		Offset = 0
		TopBarHeight = p1.props.topBarCategoriesScrollerHeight
	end
	local IsSponsoredSort = false
	local SponsoredTooltipBody = nil
	IsSponsoredSort = p1.isSponsoredSort()
	SponsoredTooltipBody = p1.props.sponsoredTooltipBody
	local IsSdui = p1.isSdui()
	
	return WithStyleFunction(function(p3)
		-- upvalues: GameTileConstants (upval), RoactModule (upval), YOffset (copy), SelectedSort (copy), IconWithTooltip (upval), TooltipOrientation (upval), p1 (copy), SponsoredTooltipBody (ref), PersonalizationTopBarModule (upval), CreationCenter (ref), FFlagLuaAppCompositionHome (upval), CompositionTags (upval), Tabs (copy), ReactModule (upval), GameCategoryTabGroupModule (upval), SortCategories (copy), SelectedSortIdentifier (copy), FFlagEnableLeftNavOnConsole (upval), GameGridSidePadding (copy), RefreshScrollingFrameWithLoadMoreModule (upval), FFlagAppIaScrollAway (upval), AppNavBarModule (upval), TopBarHeight (ref), SelectedSortContents (copy), FFlagLuaAppLayoutParamsInContext (upval), FFlagLuaAppSduiSeeAllLayoutParamsFix (upval), FFlagExtendScrollingFramesBySafeInsets (upval), GAMEGRIDPADDING (upval), NewYOffset (copy), Offset (ref), NoFFlagLuaAppRemoveSeeAllDropdownIXPModule (copy), GamesDropDownListModule (upval), YOffset1 (ref), IsSponsoredSort (ref), FitTextLabelModule (upval), FitChildrenModule (upval), IsSdui (copy), SduiSeeAllGrid (upval), GameGridSelector (upval), FrameSize (copy), ContentSize (copy), ScreenSize (copy), ShouldHideGameStats (copy), Context (upval), GameSeeAllImpressionsDetectorModule (upval)
		local Footer = GameTileConstants.PlayerCountStyleValues.Footer
		local Frame = RoactModule.createElement("Frame", {
			Name = "TitleWithTooltip",
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Position = UDim2.new(0, 0, 0, YOffset)
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			}),
			Title = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 1,
				Text = SelectedSort.displayName,
				Font = p3.Font.Header1.Font,
				TextSize = p3.Font.BaseSize * p3.Font.Header1.RelativeSize,
				TextColor3 = p3.Theme.TextEmphasis.Color,
				TextTransparency = p3.Theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				AutomaticSize = Enum.AutomaticSize.XY
			}),
			GamesListTooltip = RoactModule.createElement(IconWithTooltip, {
				layoutOrder = 2,
				triggerPointName = "GamesListTooltip",
				tooltipOrientation = TooltipOrientation.Bottom,
				onActivateTooltip = p1.onActivateTooltip,
				hoverText = SponsoredTooltipBody
			})
		})
		
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p1.props.backgroundTransparency
		}, {
			TopBar = if p1.props.hasTopBar then RoactModule.createElement(PersonalizationTopBarModule, {
				titleText = CreationCenter,
				tag = if FFlagLuaAppCompositionHome then CompositionTags.ContentRegion.Header else nil,
				sideMarginOverride = if FFlagLuaAppCompositionHome then 0 else nil
			}) else nil,
			CategorySelectorScrollWrapper = if Tabs == "Tabs" then RoactModule.createElement("Frame", {
				[ReactModule.Tag] = if FFlagLuaAppCompositionHome then CompositionTags.ContentRegion.Header else nil,
				Size = UDim2.new(1, 0, 0, p1.props.categorySelectorHeight),
				ZIndex = 2,
				BackgroundColor3 = p3.Theme.BackgroundDefault.Color,
				BackgroundTransparency = p1.props.backgroundTransparency,
				Position = if FFlagLuaAppCompositionHome then nil else UDim2.fromOffset(0, p1.props.topBarCategoriesScrollerPadding)
			}, {
				GameCategoryTabGroup = RoactModule.createElement(GameCategoryTabGroupModule, {
					size = UDim2.new(1, 0, 0, p1.props.categorySelectorHeight),
					sortCategories = SortCategories,
					selectedSortIndex = p1.state.sortIndex,
					selectedSortName = SelectedSortIdentifier,
					onSelected = p1.switchToSort,
					padding = if FFlagLuaAppCompositionHome then { left = 0, right = 0, top = 0, bottom = 0 } elseif FFlagEnableLeftNavOnConsole then {
						top = 0,
						bottom = 0,
						left = GameGridSidePadding,
						right = GameGridSidePadding
					} else {
						top = 0,
						bottom = 0,
						left = p1.props.safeAreaPadding,
						right = p1.props.safeAreaPadding
					}
				})
			}) else nil,
			Scroller = RoactModule.createElement(RefreshScrollingFrameWithLoadMoreModule, {
				Position = if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then UDim2.fromOffset(0, 0) else UDim2.new(0, 0, 0, TopBarHeight),
				Size = if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, -TopBarHeight),
				BackgroundTransparency = p1.props.backgroundTransparency,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				refresh = p1.refresh,
				onLoadMore = SelectedSortContents.hasMoreRows and p1.loadMoreGames,
				ScrollingEnabled = if FFlagEnableLeftNavOnConsole then p1.props.isScrollingEnabled else nil,
				createEndOfScrollElement = not SelectedSortContents.hasMoreRows,
				canvasTopPadding = if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then TopBarHeight else nil,
				canvasSidePadding = if FFlagLuaAppLayoutParamsInContext then GameGridSidePadding else nil,
				contentFrameRefCallback = if FFlagLuaAppLayoutParamsInContext then p1.props.setContentFrame else nil,
				AutomaticCanvasSize = if FFlagLuaAppSduiSeeAllLayoutParamsFix then Enum.AutomaticSize.Y else nil,
				onAbsoluteSizeChangedCallback = function(Frame)
					-- upvalues: p1 (upval)
					if p1.isMounted and Frame then
						p1:setState({ frameSize = Frame.AbsoluteSize })
					end
					p1.gamesListViewChangedSignal:fire()
				end,
				onCanvasPositionChangedCallback = function()
					-- upvalues: p1 (upval)
					p1.gamesListViewChangedSignal:fire()
				end,
				shouldExtendIntoSafeArea = if FFlagExtendScrollingFramesBySafeInsets then { left = false, top = false, right = false, bottom = true } else nil,
				contentTag = if FFlagLuaAppCompositionHome then CompositionTags.ContentRegion.Body else nil,
				[RoactModule.Ref] = p1.setContainerRef
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					[RoactModule.Change.AbsoluteContentSize] = p1.onAbsoluteContentSizeChanged
				}),
				Padding = if FFlagLuaAppCompositionHome then nil else RoactModule.createElement("UIPadding", {
					PaddingLeft = if FFlagLuaAppLayoutParamsInContext then nil else UDim.new(0, GameGridSidePadding),
					PaddingRight = if FFlagLuaAppLayoutParamsInContext then nil else UDim.new(0, GameGridSidePadding),
					PaddingTop = UDim.new(0, GAMEGRIDPADDING)
				}),
				PaddingTopSpacer = if FFlagLuaAppCompositionHome then RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 0,
					Size = UDim2.new(1, 0, 0, GAMEGRIDPADDING)
				}) else nil,
				TopSection = if Tabs == "Dropdown" then RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, NewYOffset),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Padding = RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, Offset) }),
					DropDown = if NoFFlagLuaAppRemoveSeeAllDropdownIXPModule then nil else RoactModule.createElement(GamesDropDownListModule, {
						size = UDim2.new(1, 0, 0, YOffset1),
						position = UDim2.new(0, 0, 0, 0),
						selectedSortName = SelectedSortIdentifier,
						selectedSortIndex = p1.state.sortIndex,
						onSelected = p1.switchToSort,
						isOmni = p1.isOmni(),
						sortCategories = SortCategories
					}),
					Title = if IsSponsoredSort then Frame else RoactModule.createElement(FitTextLabelModule, {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Text = SelectedSort.displayName,
						Position = UDim2.new(0, 0, 0, YOffset),
						Font = p3.Font.Header1.Font,
						TextSize = p3.Font.BaseSize * p3.Font.Header1.RelativeSize,
						TextColor3 = p3.Theme.TextEmphasis.Color,
						TextTransparency = p3.Theme.TextEmphasis.Transparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						Size = UDim2.new(1, 0, 0, 0),
						fitAxis = FitChildrenModule.FitAxis.Height
					})
				}) else nil,
				["GameGrid " .. SelectedSortIdentifier] = if IsSdui then ReactModule.createElement(SduiSeeAllGrid, {
					layoutOrder = 2,
					impressionsTag = "GamesList",
					appPage = p1.props.pageContext,
					verticalScrollingFrameRef = p1.containerRef,
					contentFrame = if FFlagLuaAppLayoutParamsInContext then p1.props.contentFrame else nil,
					scrollViewPositionChangedSignal = p1.gamesListViewChangedSignal,
					collectionId = p1.state.sortName,
					collectionIndex = p1.state.sortIndex,
					setLogImpressions = p1.setLogSduiImpressions,
					sendGameImpressions = p1.sendGameImpressionsFromSdui,
					onCollectionViewabilityChanged = p1.onCollectionViewabilityChanged
				}) else RoactModule.createElement(GameGridSelector, {
					LayoutOrder = 2,
					impressionsTag = "GamesList",
					entries = SelectedSortContents.entries,
					reportGameDetailOpened = p1.reportGameDetailOpened,
					windowSize = if p1.props.stableContentWidth then Vector2.new(p1.props.stableContentWidth, FrameSize.Y) else Vector2.new(ContentSize.X, FrameSize.Y),
					screenSize = ScreenSize,
					hideGameStats = ShouldHideGameStats,
					currentSidePadding = GameGridSidePadding,
					reportExperienceLaunched = p1.reportExperienceLaunched,
					launchExperienceEventContext = Context.ExperienceTile,
					playerCountStyle = Footer,
					appCompositionEnabled = if FFlagLuaAppCompositionHome then true else nil
				}),
				GameSeeAllImpressionsDetector = RoactModule.createElement(GameSeeAllImpressionsDetectorModule, {
					impressionsTag = "GamesList",
					parentRef = p1.containerRef,
					scrollViewPositionChangedSignal = p1.gamesListViewChangedSignal,
					sendGameImpressions = if IsSdui then p1.state.logSduiImpressions else p1.sendGameImpressions,
					gameSortId = p1.state.sortName
				})
			}),
			SafeAreaBottomPadding = if p1.props.safeAreaBottomPadding and not FFlagEnableLeftNavOnConsole then RoactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, p1.props.safeAreaBottomPadding)
			}) else nil
		})
	end)
end

function GamesList.render(p1)
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({
		creationCenter = "CommonUI.Features.Label.CreationCenter",
		chartsTitle = "CommonUI.Features.Label.Charts"
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithLocalized(p2)
	end)
end

function GamesList.didMount(p1)
	-- upvalues: FFlagLuaAppSortDeeplinkFix (copy), SortCategories (copy), Default (copy), SortDeeplinkFailureCounter (copy)
	p1.isMounted = true
	
	if FFlagLuaAppSortDeeplinkFix or p1.props.pageContext ~= "Deeplink" or p1.props.gameSortContents[p1.state.sortName] then
		p1.updateGamesInSort()
		
		return
	else
		p1.props.dispatchFetchExpiringTokens(p1.props.networking, SortCategories.GAMES.sortType):andThen(function()
			-- upvalues: p1 (copy)
			if p1.isMounted then
				p1:setState({ missingSortLoadComplete = true })
			end
		end, function(_)
			-- upvalues: Default (upval), SortDeeplinkFailureCounter (upval), p1 (copy)
			Default:logRobloxTelemetryCounter(SortDeeplinkFailureCounter)
			p1.props.navigateBack()
		end)
	end
end

function GamesList.willUnmount(p1)
	p1.isMounted = false
end

function GamesList.didUpdate(p1, p2, p3)
	-- upvalues: FFlagLuaAppSortDeeplinkFix (copy), Default (copy), SortDeeplinkFailureCounter (copy)
	if p1.state.sortName ~= p3.sortName or not FFlagLuaAppSortDeeplinkFix and not p2.gameSortContents[p1.state.sortName] and p1.props.gameSortContents[p1.state.sortName] then
		if not FFlagLuaAppSortDeeplinkFix then
			task.spawn(function()
				-- upvalues: p1 (copy)
				if p1.isMounted then
					p1:setState({ missingSortLoadComplete = false })
				end
			end)
		end
		p1.updateGamesInSort()
	end
	if not FFlagLuaAppSortDeeplinkFix and p1.state.missingSortLoadComplete and not p1.props.gameSortContents[p1.state.sortName] then
		Default:logRobloxTelemetryCounter(SortDeeplinkFailureCounter)
		p1.props.navigateBack()
	end
end

local v1 = RoactRoduxModule.connect(function(p1, _)
	-- upvalues: TopicInfosReducer (copy), TopicContentsReducer (copy)
	return {
		topBarHeight = p1.TopBar.topBarHeight,
		screenSize = p1.ScreenSize,
		topicInfos = p1.Personalization[TopicInfosReducer.key],
		gameSortContents = p1.Personalization[TopicContentsReducer.key]
	}
end, function(Callback)
	-- upvalues: RefreshSiteAlertInfoModule (copy), FetchDataWithErrorToastsFunction (copy), RefreshGameSortsFunction (copy), ApiFetchOmniRecommendationsFunction (copy), ApiFetchGamesDataFunction (copy), ApiFetchGamesInSortFunction (copy), ApiFetchOmniRecommendationsMetadataFunction (copy), FFlagLuaAppLogOmniRecommendationsMetadata (copy), RefreshExpiringSortTokensFunction (copy), NavigateBackFunction (copy)
	return {
		dispatchRefresh = function(p1, p2, p3)
			-- upvalues: Callback (copy), RefreshSiteAlertInfoModule (upval), FetchDataWithErrorToastsFunction (upval), RefreshGameSortsFunction (upval)
			Callback(RefreshSiteAlertInfoModule())
			
			return Callback((FetchDataWithErrorToastsFunction((RefreshGameSortsFunction(p1, { p3 }, p2, nil)))))
		end,
		dispatchRefreshOmni = function(p1, p2, p3, p4, p5)
			-- upvalues: Callback (copy), RefreshSiteAlertInfoModule (upval), FetchDataWithErrorToastsFunction (upval), ApiFetchOmniRecommendationsFunction (upval)
			Callback(RefreshSiteAlertInfoModule())
			
			return Callback((FetchDataWithErrorToastsFunction((ApiFetchOmniRecommendationsFunction(p1, p2, p3, nil, nil, p4, p5)))))
		end,
		dispatchRefreshSortContents = function(p1, p2)
			-- upvalues: Callback (copy), ApiFetchGamesDataFunction (upval)
			return Callback(ApiFetchGamesDataFunction(p1, nil, p2, nil, nil))
		end,
		dispatchLoadMoreGames = function(p1, p2, StartRows, MaxRows, ExclusiveStartId, PageToken)
			-- upvalues: Callback (copy), FetchDataWithErrorToastsFunction (upval), ApiFetchGamesInSortFunction (upval)
			return Callback((FetchDataWithErrorToastsFunction((ApiFetchGamesInSortFunction(p1, p2, true, {
				startRows = StartRows,
				maxRows = MaxRows,
				exclusiveStartId = ExclusiveStartId,
				pageToken = PageToken
			})))))
		end,
		dispatchLoadMoreGamesOmni = function(p1, p2, p3, p4, p5)
			-- upvalues: Callback (copy), FetchDataWithErrorToastsFunction (upval), ApiFetchOmniRecommendationsMetadataFunction (upval), FFlagLuaAppLogOmniRecommendationsMetadata (upval)
			return Callback((FetchDataWithErrorToastsFunction((ApiFetchOmniRecommendationsMetadataFunction(p1, p2, p3, p4, p5, if FFlagLuaAppLogOmniRecommendationsMetadata then "GamesList" else nil)))))
		end,
		dispatchFetchExpiringTokens = function(p1, p2)
			-- upvalues: Callback (copy), RefreshExpiringSortTokensFunction (upval)
			return Callback((RefreshExpiringSortTokensFunction(p1, { p2 })))
		end,
		navigateBack = function()
			-- upvalues: Callback (copy), NavigateBackFunction (upval)
			return Callback(NavigateBackFunction())
		end
	}
end)(GamesList)

return RoactServices.connect({
	networking = RoactNetworking,
	eventIngest = AppEventIngestService,
	analytics = RoactAnalyticsCommonGameEvents,
	appAnalytics = RoactAnalytics,
	loggingProtocol = AppLogging
})((RoactAppExperimentModule.connectUserLayer({
	AppUserLayers.GameTileLayer,
	AppUserLayers.PlayerAppSeeAllUXLayer
}, function(p1, _)
	-- upvalues: AppUserLayers (copy), FFlagLuaAppRemoveSeeAllDropdownIXPModule (copy)
	local v2 = p1[AppUserLayers.PlayerAppSeeAllUXLayer] or {}
	
	return {
		hideGameStatsIXP = (p1[AppUserLayers.GameTileLayer] or {}).hideGameStats == "true",
		hideDropdown = if FFlagLuaAppRemoveSeeAllDropdownIXPModule then v2.ShouldRemoveSeeAllDropdown else nil
	}
end)(function(p1)
	-- upvalues: UseLocalization (copy), UseDispatch (copy), ReactModule (copy), OpenInfoPeekView (copy), UseDeviceType (copy), UseNavigationProps (copy), FFlagLuaAppChartsAppPage (copy), UseAppPolicy (copy), UseDesignTokens (copy), UseUiModeInfo (copy), UiMode (copy), UseCollectionLayout (copy), FFlagLuaAppCompositionHome (copy), UsePageSideMargin (copy), SignalsReactModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), FFlagLuaAppLayoutParamsInContext (copy), FFlagEnableLeftNavOnConsole (copy), UseLastInputMode (copy), UseAnimateScrollViewToSelection (copy), FFlagLuaAppLogChartsAppPageExposure (copy), UseLogSduiChartsExposureModule (copy), SduiChartsSortDetailPageModule (copy), CryoModule (copy), RoactModule (copy), v1 (copy)
	local v2 = UseLocalization({
		SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic",
		SponsoredTitle = "CoreScripts.Ads.Label.SponsoredAds"
	})
	local SponsoredDisclosure = v2.SponsoredDisclosure
	local SponsoredTitle = v2.SponsoredTitle
	local Callback = UseDispatch()
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: Callback (copy), OpenInfoPeekView (upval)
		Callback(OpenInfoPeekView(p2, p3))
	end, {})
	local DeviceType = UseDeviceType()
	local v3 = UseNavigationProps(function(InitialSortName, p2)
		-- upvalues: FFlagLuaAppChartsAppPage (upval)
		local config = {
			sortPageId = p2.sortPageId,
			pageContext = p2.pageContext,
			pageTimer = if FFlagLuaAppChartsAppPage then p2.pageTimer else nil,
			initialSortName = InitialSortName
		}
		
		if p2.isOmni then
			config.isOmni = true
			config.initialSortIndex = p2.sortIndex
		end
		return config
	end)
	local UseCreationCenterTitle = UseAppPolicy(function(p2)
		return p2.getGamesPageCreationCenterTitle()
	end)
	local UseCategoryScrollList = UseAppPolicy(function(p2)
		return p2.getGameListCategoryScrollListEnabled()
	end)
	local v4 = UseDesignTokens()
	local v5 = UseUiModeInfo()
	local IsNotUiModeMatch = v5.uiMode ~= UiMode.TenFoot
	local IsUiModeMatch = v5.uiMode == UiMode.TenFoot
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local v6 = UseCollectionLayout()
	local GameGridSidePadding = if FFlagLuaAppCompositionHome then 0 else UsePageSideMargin(UseStateResult)
	local UseSignalStateResult = SignalsReactModule.useSignalState(v6.getContainerWidth)
	local Largest = if FFlagLuaAppCompositionHome then math.max(0, UseSignalStateResult - 2 * v6.margin) else nil
	local Size1000 = if IsUiModeMatch then if FFlagRenameDeprecatedUIBloxTokens then v4.Size.Size_1000 else v4.Global.Space_500 else nil
	local v7 = nil
	local v8 = nil
	
	if FFlagLuaAppLayoutParamsInContext then
		v7, v148 = ReactModule.useState(nil)
	end
	local UseRefResult = nil
	local IsCursor: boolean? = nil
	
	if FFlagEnableLeftNavOnConsole then
		UseRefResult = ReactModule.useRef(nil)
		IsCursor = UseLastInputMode() == "Cursor"
		UseAnimateScrollViewToSelection(UseRefResult, 0.4)
	end
	local NoIsOmni: boolean = FFlagLuaAppChartsAppPage and (not v3.isOmni and not p1.isOmni)
	
	if FFlagLuaAppLogChartsAppPageExposure then
		UseLogSduiChartsExposureModule(NoIsOmni)
	end
	return if NoIsOmni then ReactModule.createElement(SduiChartsSortDetailPageModule, {
		sortId = v3.initialSortName or p1.initialSortName,
		pageContext = v3.pageContext or p1.pageContext,
		pageTimer = v3.pageTimer
	}) else RoactModule.createElement(v1, (CryoModule.Dictionary.join(p1, {
		deviceType = DeviceType,
		onActivateTooltip = UseResult,
		sponsoredTooltipBody = SponsoredDisclosure,
		sponsoredTooltipTitle = SponsoredTitle,
		useCreationCenterTitle = UseCreationCenterTitle,
		useCategoryScrollList = UseCategoryScrollList,
		categorySelectorHeight = if FFlagRenameDeprecatedUIBloxTokens then v4.Size.Size_1200 else v4.Global.Size_600,
		topBarCategoriesScrollerHeight = if FFlagRenameDeprecatedUIBloxTokens then v4.Size.Size_2000 else v4.Global.Size_1000,
		topBarCategoriesScrollerPadding = if FFlagRenameDeprecatedUIBloxTokens then v4.Size.Size_400 else v4.Global.Space_200,
		hasTopBar = IsNotUiModeMatch,
		backgroundTransparency = v4.LuaApps.SeeAll.BackgroundTransparency,
		safeAreaPadding = if FFlagRenameDeprecatedUIBloxTokens then v4.Size.Size_1600 else v4.Global.Space_800,
		gameGridSidePadding = GameGridSidePadding,
		stableContentWidth = Largest,
		safeAreaBottomPadding = Size1000,
		contentFrame = if FFlagLuaAppLayoutParamsInContext then v7 else nil,
		setContentFrame = if FFlagLuaAppLayoutParamsInContext then v8 else nil,
		setScrollingFrame = UseStateResult2,
		containerRef = if FFlagEnableLeftNavOnConsole then UseRefResult else nil,
		isScrollingEnabled = if FFlagEnableLeftNavOnConsole then IsCursor else nil
	}, v3)))
end)))