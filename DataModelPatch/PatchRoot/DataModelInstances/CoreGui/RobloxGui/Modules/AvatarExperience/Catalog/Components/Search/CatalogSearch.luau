local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local ReactModule = require(CorePackages.Packages.React)
local Focusable = RoactGamepadModule.Focusable
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local WithNavigationFunction = RoactNavigationModule.withNavigation
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local DashModule = require(CorePackages.Packages.Dash)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local IsGamepadInputFunction = require(CorePackages.Workspace.Packages.RoactUtils).isGamepadInput
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseNavBarSizeFunction = require(CorePackages.Workspace.Packages.AppNavBar).useNavBarSize
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UseMostRecentOrDefaultFocusBehaviorFunction = ReactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior
local UseFocusOnMountFunction = FocusNavigationUtilsModule.useFocusOnMount
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AppEventIngestServiceModule = require(Modules.LuaApp.Services.AppEventIngestService)
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local SearchUuidModule = require(Modules.LuaApp.SearchUuid)
local DeviceOrientationMode = RobloxAppEnumsModule.DeviceOrientationMode
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceTTIPerformanceModule = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance)
local TTIPerformanceManager = AvatarExperienceTTIPerformanceModule.TTIPerformanceManager
local OrganicTTIMilestoneManager = AvatarExperienceTTIPerformanceModule.OrganicTTIMilestoneManager
local AvatarExperienceSearchModule = require(CorePackages.Workspace.Packages.AvatarExperienceSearch)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local AvatarRoute = AvatarExperienceNavigationModule.AvatarRoute.AvatarRoute
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local SearchBarModule = require(Modules.LuaApp.Components.SearchBar)
local CatalogTilesLatencyTrackerModule = require(Modules.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker)
local SetSearchParametersModule = require(Modules.LuaApp.Actions.SetSearchParameters)
local SetSearchTypeModule = require(Modules.LuaApp.Actions.SetSearchType)
local CatalogSearchEventModule = require(Modules.LuaApp.Analytics.Events.catalogSearchEvent)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local HorizontalPageMargin = require(CorePackages.Packages.UIBlox).App.Container.HorizontalPageMargin
local Common = Modules.AvatarExperience.Common
local _ = require(Common.AvatarExperienceState)
local NavigationUtilsModule = require(Common.Components.RoactNavigation.NavigationUtils)
local WithContextValueModule = require(Common.withContextValue)
local PageObjectManagerContextModule = require(Common.Context.PageObjectManagerContext)
local UtilsModule = require(Common.Utils)
local NamedRefConstantsModule = require(Common.NamedRefConstants)
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local WithAvatarRouteModule = require(Common.Components.RoactNavigation.withAvatarRoute)
local WithNamedRefsModule = require(Common.Context.withNamedRefs)
local AnalyticsModule = require(Common.Services.Analytics)
local AvatarExperienceViewModule = require(Common.Components.AvatarExperienceView)
local BoundInputsUpdaterModule = require(Common.Components.BoundInputsUpdater)
local GamepadFocusHandlerForPageModule = require(Common.Components.GamepadFocusHandlerForPage)
local NavigationEventsLoggerModule = require(Common.Components.RoactNavigation.Debug.NavigationEventsLogger)
local SelectIsFullViewModule = require(Common.Selectors.selectIsFullView)
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local SetItemDetailsPeekViewStateFunction = AvatarExperienceRoduxModule.Actions.SetItemDetailsPeekViewState
local OpenItemPromptModule = require(Common.Thunks.OpenItemPrompt)
local OpenQuickMenuModule = require(Common.Thunks.OpenQuickMenu)
local SetFullViewModule = require(Common.Thunks.SetFullView)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local UseAvatarExperienceFocusNavigationBindingsModule = require(Common.Hooks.useAvatarExperienceFocusNavigationBindings)
local UseOverlayClosedCallbackModule = require(Common.Hooks.useOverlayClosedCallback)
local Catalog = Modules.AvatarExperience.Catalog
local AnalyticsModule1 = require(Catalog.Services.Analytics)
local CatalogConstantsModule = require(Catalog.CatalogConstants)
local ResultsListModule = require(Catalog.Components.Search.ResultsList)
local CatalogUtilsModule = require(Catalog.CatalogUtils)
local RemoveSearchInCatalogModule = require(Catalog.Actions.RemoveSearchInCatalog)
local SetSortAndFiltersModule = require(Catalog.Actions.SetSortAndFilters)
local ResetSortAndFiltersModule = require(Catalog.Actions.ResetSortAndFilters)
local ResetSortAndFiltersThunkModule = require(Catalog.Thunks.ResetSortAndFiltersThunk)
local SetTryOnManagerPeekViewStateFunction = AvatarExperienceRoduxModule.Actions.SetTryOnManagerPeekViewState
local FetchWidgetInfoModule = require(Catalog.Thunks.FetchWidgetInfo)
local ApiFetchCatalogSearchModule = require(Catalog.Thunks.ApiFetchCatalogSearch)
local Flags = Modules.AvatarExperience.Flags
local GetFFlagAvatarAutocompleteEnabledForAllModule = require(Flags.GetFFlagAvatarAutocompleteEnabledForAll)
local FFlagAXResetAnalyticsMetadataOnFilterResetModule = require(Flags.FFlagAXResetAnalyticsMetadataOnFilterReset)
local GetFFlagEnableCatalogTileLoadingLatencyModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXEnableManualSaving = AvatarExperienceFlagsModule.FFlagAXEnableManualSaving
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXMigrateCatalogSearchToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateCatalogSearchToFocusNavigation
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local FFlagAXExpandPeekViewOnFirstScroll = AvatarExperienceFlagsModule.FFlagAXExpandPeekViewOnFirstScroll
local FFlagAXHideMenuOnScroll = AvatarExperienceFlagsModule.FFlagAXHideMenuOnScroll
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local FFlagLuaAppsDefaultSelection = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppsDefaultSelection
local RecentSearchTermsAppStorage = AvatarExperienceSearchModule.Utils.RecentSearchTermsAppStorage
local config = {
	[Enum.KeyCode.ButtonX] = FocusNavigationEventNameEnum.OpenBuyCatalogItemPrompt,
	[Enum.KeyCode.ButtonY] = FocusNavigationEventNameEnum.ToggleTryOn
}

local function v93(p1)
	return p1.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState
end

local function v94(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end

local function useCatalogSearchFocusNavigationBindings(p1, p2, p3)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), p2 (copy), InputHandlersModule (upval), p3 (copy)
		return {
			[FocusNavigationEventNameEnum.OpenBuyCatalogItemPrompt] = if p2 then { handler = InputHandlersModule.onRelease(p2) } else nil,
			[FocusNavigationEventNameEnum.ToggleTryOn] = if p3 then { handler = InputHandlersModule.onRelease(p3) } else nil
		}
	end, { p2, p3 }), (ReactFocusNavigationModule.useEventMap(config, p1)))
end

local CatalogSearch = RoactModule.PureComponent:extend("CatalogSearch")
CatalogSearch.validateProps = TModule.strictInterface({
	searchUuid = TModule.string,
	searchParameters = TModule.table,
	isVisible = TModule.optional(TModule.boolean),
	fullView = TModule.optional(TModule.userdata),
	topBarHeight = TModule.number,
	dataStatus = TModule.string,
	hasEntries = TModule.boolean,
	itemDetailsExpanded = TModule.optional(TModule.boolean),
	isPortrait = TModule.boolean,
	tryOnManagerPeekViewState = TModule.optional(TModule.valueOf(PeekViewState)),
	tryOnItems = if FFlagAXMigrateCatalogSearchToFocusNavigation then nil else TModule.optional(TModule.table),
	categoryInfo = TModule.optional(TModule.table),
	dispatchSearch = TModule.callback,
	dispatchRemoveSearch = TModule.callback,
	setSearchType = TModule.callback,
	setSearchParameters = TModule.callback,
	setSortAndFilters = TModule.callback,
	openItemPrompt = TModule.callback,
	setItemDetailsPeekViewState = TModule.callback,
	setFullView = TModule.callback,
	navigateIntoQuickMenu = TModule.callback,
	resetSortAndFilters = TModule.callback,
	setTryOnManagerPeekViewState = TModule.callback,
	fetchWidgetInfo = TModule.callback,
	dispatchCatalogTilesLatencyStartTracker = if GetFFlagEnableCatalogTileLoadingLatencyModule() then TModule.callback else nil,
	dispatchSearchWithParameters = TModule.callback,
	pageObjectManager = TModule.optional(TModule.table),
	namedRefs = TModule.table,
	navigation = TModule.table,
	avatarRoute = AvatarRoute.Interface,
	analytics = if FFlagAXMigrateCatalogSearchToFocusNavigation then nil else TModule.table,
	avatarExperienceAnalytics = TModule.table,
	catalogAnalytics = if FFlagAXMigrateCatalogSearchToFocusNavigation then nil else TModule.table,
	networking = TModule.callback,
	eventIngest = TModule.table,
	overlayClosedCallback = TModule.callback,
	focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else TModule.table,
	localized = TModule.table,
	designTokens = TModule.table,
	focusNavigationRef = if FFlagAXMigrateCatalogSearchToFocusNavigation then TModule.table else nil,
	navBarSize = if FFlagEnableLeftNavOnConsole then TModule.number else nil,
	defaultFocusRef = if FFlagLuaAppsDefaultSelection then TModule.optional(TModule.callback) else nil
})

function CatalogSearch.init(p1)
	-- upvalues: RoactModule (copy), AvatarScreen (copy), NamedRefConstantsModule (copy), RoactGamepadModule (copy), FFlagAXMigrateAllTabToSduiDev (copy), FullView (copy), CatalogUtilsModule (copy), DashModule (copy), SearchUuidModule (copy), RobloxAppEnumsModule (copy), GetFFlagAvatarAutocompleteEnabledForAllModule (copy), CatalogSearchEventModule (copy), RecentSearchTermsAppStorage (copy), NavigationUtilsModule (copy), UtilsModule (copy), GetFFlagEnableCatalogTileLoadingLatencyModule (copy), TTIPerformanceManager (copy), OrganicTTIMilestoneManager (copy)
	p1.pillBarScrollOffset, p1.updatePillBarScrollOffset = RoactModule.createBinding(0)
	p1.searchBarRef = RoactModule.createRef()
	p1.sceneUIContainerRef = RoactModule.createRef()
	p1.resultsListRef = p1.props.namedRefs[AvatarScreen.CatalogSearch .. NamedRefConstantsModule.ItemsList]
	p1.refinementButtonsRef = RoactModule.createRef()
	p1.multiTryOnBottomBarRef = RoactModule.createRef()
	p1.isMounted = false
	p1.itemDetailsPeekViewRefs = RoactGamepadModule.createRefCache()
	
	if FFlagAXMigrateAllTabToSduiDev then
		p1.lastDispatchedSearchCategoryId = nil
		p1.lastDispatchedSearchSubcategoryId = nil
	end
	p1:setState({ isSearching = false })
	
	function p1.onNavBarSizeChanged(p2)
		-- upvalues: p1 (copy)
		if p1.resultsListRef.current then
			p1.resultsListRef.current.Size = UDim2.new(1, 0, 1, -p2.Y)
		end
	end
	
	function p1.dispatchInitialSearch()
		-- upvalues: p1 (copy), FullView (upval), CatalogUtilsModule (upval), DashModule (upval)
		local SearchUuid = p1.props.searchUuid
		local SearchParameters = p1.props.searchParameters
		local DispatchSearchWithParametersFunction = p1.props.dispatchSearchWithParameters
		local AvatarExperienceAnalytics = p1.props.avatarExperienceAnalytics
		
		if p1.props.fullView == FullView.SceneFullView then
			p1.props.setFullView(AvatarExperienceAnalytics, p1.props.avatarRoute.opaque.name, FullView.None)
		end
		local FetchWidgetInfoFunction: (any, any) -> () = p1.props.fetchWidgetInfo
		local Networking = p1.props.networking
		local QueryStringForSearchWidgets = CatalogUtilsModule.getQueryStringForSearchWidgets(SearchParameters)
		
		if QueryStringForSearchWidgets then
			FetchWidgetInfoFunction(Networking, QueryStringForSearchWidgets)
		end
		local CategoryInfo = p1.props.categoryInfo
		
		if not SearchParameters.categoryInfo then
			SearchParameters = DashModule.join(SearchParameters, { categoryInfo = CategoryInfo })
			p1.props.setSearchParameters(SearchUuid, SearchParameters)
		end
		return DispatchSearchWithParametersFunction(SearchParameters, SearchUuid, CategoryInfo, p1.props.networking)
	end
	
	function p1.setUIFullView()
		-- upvalues: p1 (copy), FullView (upval)
		p1.props.setFullView(p1.props.avatarExperienceAnalytics, p1.props.avatarRoute.opaque.name, FullView.UIFullView)
	end
	
	function p1.confirmSearchCallback(SearchKeyword, p2, p3)
		-- upvalues: SearchUuidModule (upval), p1 (copy), DashModule (upval), RobloxAppEnumsModule (upval), GetFFlagAvatarAutocompleteEnabledForAllModule (upval), AvatarScreen (upval), CatalogSearchEventModule (upval), RecentSearchTermsAppStorage (upval), NavigationUtilsModule (upval)
		local SearchUuidModuleResult = SearchUuidModule()
		local JoinResult = DashModule.join(p1.props.navigation.getParam("searchParams") or {}, {
			isKeywordSuggestionEnabled = true,
			searchKeyword = SearchKeyword,
			categoryInfo = p1.props.categoryInfo
		})
		p1.props.setSearchType(SearchUuidModuleResult, RobloxAppEnumsModule.SearchTypes.Catalog)
		p1.props.setSearchParameters(SearchUuidModuleResult, JoinResult)
		
		if GetFFlagAvatarAutocompleteEnabledForAllModule() then
			if p1.props.isPortrait then
				p1.setUIFullView()
			end
			CatalogSearchEventModule(p1.props.eventIngest, "catalog", SearchKeyword, p2, AvatarScreen.CatalogSearch, p3)
		end
		RecentSearchTermsAppStorage.addTerm(SearchKeyword)
		NavigationUtilsModule.navigateToSearch(p1.props.navigation, SearchUuidModuleResult, JoinResult)
	end
	
	function p1.cancelSearchCallback()
		-- upvalues: p1 (copy), AvatarScreen (upval)
		p1.props.navigation.navigate(AvatarScreen.Catalog)
		
		if p1.isMounted then
			p1:setState({ isSearching = false })
		end
	end
	
	function p1.onSearchBarFocused()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ isSearching = true })
			
			return
		end
	end
	
	function p1.changeView()
		-- upvalues: p1 (copy), UtilsModule (upval)
		p1.props.setFullView(p1.props.avatarExperienceAnalytics, p1.props.avatarRoute.opaque.name, (UtilsModule.getNewFullViewEnum(p1.props.fullView)))
	end
	
	function p1.onSameTermConfirmSearch()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ isSearching = false })
		end
	end
	
	function p1.clearSearchState(SearchUuid)
		-- upvalues: p1 (copy)
		p1.props.dispatchRemoveSearch(SearchUuid)
		p1.props.pageObjectManager:storePageObject(SearchUuid, nil)
	end
	
	function p1.dispatchWidgetSearch()
		-- upvalues: p1 (copy), CatalogUtilsModule (upval)
		local FetchWidgetInfoFunction: (any, any) -> () = p1.props.fetchWidgetInfo
		local Networking = p1.props.networking
		local QueryStringForSearchWidgets = CatalogUtilsModule.getQueryStringForSearchWidgets(p1.props.searchParameters)
		
		if QueryStringForSearchWidgets then
			FetchWidgetInfoFunction(Networking, QueryStringForSearchWidgets)
		end
	end
	
	function p1.onCategoryOrSubcategoryChangeById(LastDispatchedSearchCategoryId, LastDispatchedSearchSubcategoryId)
		-- upvalues: UtilsModule (upval), FFlagAXMigrateAllTabToSduiDev (upval), p1 (copy), GetFFlagEnableCatalogTileLoadingLatencyModule (upval), TTIPerformanceManager (upval), OrganicTTIMilestoneManager (upval)
		local CatalogCategoryInfoById = UtilsModule.getCatalogCategoryInfoById(LastDispatchedSearchCategoryId, LastDispatchedSearchSubcategoryId)
		local IsNotLastDispatchedSearchCategoryIdMatch = nil
		
		if FFlagAXMigrateAllTabToSduiDev then
			IsNotLastDispatchedSearchCategoryIdMatch = p1.lastDispatchedSearchCategoryId ~= LastDispatchedSearchCategoryId or p1.lastDispatchedSearchSubcategoryId ~= LastDispatchedSearchSubcategoryId
			
			if IsNotLastDispatchedSearchCategoryIdMatch then
				p1.lastDispatchedSearchCategoryId = LastDispatchedSearchCategoryId
				p1.lastDispatchedSearchSubcategoryId = LastDispatchedSearchSubcategoryId
			end
		else
			IsNotLastDispatchedSearchCategoryIdMatch = CatalogCategoryInfoById ~= p1.props.categoryInfo
		end
		if IsNotLastDispatchedSearchCategoryIdMatch then
			p1.dispatchSearchOnCategoryOrSubcategoryChange(CatalogCategoryInfoById)
			
			if GetFFlagEnableCatalogTileLoadingLatencyModule() then
				TTIPerformanceManager.Surface.Marketplace.Root.startTracking()
				OrganicTTIMilestoneManager.L2.primaryDataStarted()
				OrganicTTIMilestoneManager.L3.networkFetch()
				p1.props.dispatchCatalogTilesLatencyStartTracker(p1.props.searchUuid)
			end
		end
	end
	
	function p1.dispatchSearchOnCategoryOrSubcategoryChange(CatalogCategoryInfoById)
		-- upvalues: p1 (copy), DashModule (upval)
		local SearchUuid = p1.props.searchUuid
		local SearchParameters = p1.props.searchParameters
		local DispatchSearchFunction = p1.props.dispatchSearch
		p1.props.setSearchParameters(SearchUuid, (DashModule.join(SearchParameters, {
			categoryInfo = DashModule.join({}, CatalogCategoryInfoById)
		})))
		p1.clearSearchState(SearchUuid)
		
		if CatalogCategoryInfoById and CatalogCategoryInfoById.ShowWidgets then
			p1.dispatchWidgetSearch()
		end
		return DispatchSearchFunction(SearchParameters.searchKeyword, SearchUuid, CatalogCategoryInfoById, p1.props.networking)
	end
end

if not FFlagAXMigrateCatalogSearchToFocusNavigation then
	function CatalogSearch.getInputBindings(p1)
		-- upvalues: AvatarScreenProperties (copy), CryoModule (copy), RoactGamepadModule (copy), NavigationUtilsModule (copy), AvatarScreen (copy), FFlagAXMISEnableMultiShopping (copy), PeekViewState (copy)
		local AvatarRoute = p1.props.avatarRoute
		local Name = AvatarRoute.current.name
		local IsMultiTryOn = AvatarScreenProperties[AvatarRoute.opaque.name].isMultiTryOn
		local v1 = #CryoModule.Dictionary.values(p1.props.tryOnItems) > 1
		local JoinResult = {
			NavigateBack = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
				-- upvalues: NavigationUtilsModule (upval), p1 (copy)
				NavigationUtilsModule.closeFocusedScreen(p1.props.navigation)
			end),
			OpenTryOnManager = if Name == AvatarScreen.TryOnManager or not IsMultiTryOn and not FFlagAXMISEnableMultiShopping then nil elseif v1 then RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonY, function()
				-- upvalues: NavigationUtilsModule (upval), p1 (copy), AvatarScreen (upval)
				NavigationUtilsModule.closeFiltersAndItemDetails(p1.props.navigation)
				p1.props.navigation.navigate(AvatarScreen.TryOnManager)
			end, { key = "Feature.Catalog.Label.TryOns" }) else nil
		}
		
		if Name == AvatarScreen.ItemDetails then
			JoinResult = CryoModule.Dictionary.join(JoinResult, {
				OpenItemPrompt = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonX, function()
					-- upvalues: p1 (copy), AvatarRoute (copy)
					p1.props.openItemPrompt(p1.props.networking, p1.props.catalogAnalytics, p1.props.overlayClosedCallback, p1.props.navigation, AvatarRoute)
				end, { key = "Feature.Catalog.Action.Buy" }),
				OpenCatalogContextMenu = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonL3, function()
					-- upvalues: p1 (copy), AvatarScreen (upval), AvatarRoute (copy)
					p1.props.navigation.navigate(AvatarScreen.CatalogContextMenu, {
						itemId = AvatarRoute.current.params.itemId,
						itemType = AvatarRoute.current.params.itemType,
						onOverlayClosed = p1.props.overlayClosedCallback
					})
				end, { key = "Feature.Catalog.Action.ItemOptions" })
			})
			
			return JoinResult
		end
		if Name == AvatarScreen.TryOnManager then
			JoinResult = CryoModule.Dictionary.join(JoinResult, {
				OpenCloseTryOnManager = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonY, function()
					-- upvalues: p1 (copy), PeekViewState (upval)
					local TryOnManagerPeekViewState = p1.props.tryOnManagerPeekViewState
					
					if TryOnManagerPeekViewState == PeekViewState.Full or TryOnManagerPeekViewState == PeekViewState.Extended then
						p1.props.setTryOnManagerPeekViewState(PeekViewState.Brief)
						
						return
					else
						p1.props.setTryOnManagerPeekViewState(PeekViewState.Full)
					end
				end, { key = "Feature.Catalog.Label.TryOns" })
			})
			
			return JoinResult
		end
		if Name == AvatarScreen.LookDetails then
			JoinResult = CryoModule.Dictionary.join(JoinResult, {
				OpenCloseTryOnManager = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonY, function()
					-- upvalues: p1 (copy), PeekViewState (upval)
					local TryOnManagerPeekViewState = p1.props.tryOnManagerPeekViewState
					
					if TryOnManagerPeekViewState == PeekViewState.Full or TryOnManagerPeekViewState == PeekViewState.Extended then
						p1.props.setTryOnManagerPeekViewState(PeekViewState.Brief)
						
						return
					else
						p1.props.setTryOnManagerPeekViewState(PeekViewState.Full)
					end
				end, { key = "Feature.Catalog.Label.TryOns" })
			})
		end
		return JoinResult
	end
end
function CatalogSearch.renderSearchBar(p1)
	-- upvalues: FFlagEnableLeftNavOnConsole (copy), FFlagRenameDeprecatedUIBloxTokens (copy), RoactModule (copy), GetFFlagAvatarAutocompleteEnabledForAllModule (copy), HorizontalPageMargin (copy), SearchBarModule (copy), RobloxAppEnumsModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy)
	local Size1200 = if p1.props.designTokens then if FFlagRenameDeprecatedUIBloxTokens then p1.props.designTokens.Size.Size_1200 else p1.props.designTokens.Global.Space_600 else 20
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, if FFlagEnableLeftNavOnConsole then p1.props.navBarSize else p1.props.topBarHeight),
		ZIndex = if GetFFlagAvatarAutocompleteEnabledForAllModule() then 3 else nil
	}, {
		PaddedFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			SearchBarPadding = if p1.props.isPortrait then RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, Size1200) }) else nil,
			SearchBar = RoactModule.createElement(HorizontalPageMargin, {
				backgroundTransparency = if FFlagEnableLeftNavOnConsole then (if FFlagRenameDeprecatedUIBloxTokens then p1.props.designTokens.Color.Surface.Surface_0 else p1.props.designTokens.Semantic.Color.Background.Default).Transparency else 1,
				backgroundColor3 = if FFlagEnableLeftNavOnConsole then (if FFlagRenameDeprecatedUIBloxTokens then p1.props.designTokens.Color.Surface.Surface_0 else p1.props.designTokens.Semantic.Color.Background.Default).Color3 else Color3.fromRGB(0, 0, 0)
			}, {
				RoactModule.createElement(SearchBarModule, {
					cancelSearch = p1.cancelSearchCallback,
					confirmSearch = p1.confirmSearchCallback,
					onFocused = p1.onSearchBarFocused,
					placeholderText = p1.props.localized.searchPlaceholder,
					isCompactView = true,
					modernUI = true,
					autocomplete = GetFFlagAvatarAutocompleteEnabledForAllModule(),
					isSearching = p1.state.isSearching,
					searchType = RobloxAppEnumsModule.SearchTypes.Catalog,
					initialSearchText = p1.props.searchParameters.searchKeyword,
					[RoactModule.Ref] = p1.searchBarRef,
					NextSelectionDown = p1.resultsListRef,
					focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.focusController,
					forceShowCancelButton = GetFFlagAvatarAutocompleteEnabledForAllModule(),
					onSameTermConfirmSearch = p1.onSameTermConfirmSearch,
					shouldShowRecentSearchTerms = true
				})
			})
		})
	})
end

function CatalogSearch.render(p1)
	-- upvalues: FullView (copy), AvatarScreen (copy), RoactModule (copy), Focusable (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), FFlagAXMigrateCatalogSearchToFocusNavigation (copy), BoundInputsUpdaterModule (copy), RoactNavigationModule (copy), NavigationEventsLoggerModule (copy), AvatarExperienceViewModule (copy), FFlagAXHideMenuOnScroll (copy), FFlagAXExpandPeekViewOnFirstScroll (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), FFlagAXEnableManualSaving (copy), GamepadFocusHandlerForPageModule (copy), ResultsListModule (copy), FFlagLuaAppsDefaultSelection (copy), CatalogConstantsModule (copy)
	local HasEntries = p1.props.hasEntries
	
	return RoactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.focusController,
		defaultChild = HasEntries and p1.resultsListRef or p1.searchBarRef,
		inputBindings = if FFlagAXMigrateCatalogSearchToFocusNavigation then nil else p1:getInputBindings(),
		[RoactModule.Ref] = if FFlagAXMigrateCatalogSearchToFocusNavigation then p1.props.focusNavigationRef else nil
	}, {
		BoundInputsUpdater = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createElement(BoundInputsUpdaterModule),
		NavigationEvents = RoactModule.createElement(RoactNavigationModule.NavigationEvents, {
			onDidFocus = function()
				-- upvalues: p1 (copy)
				local SortAndFilters = (p1.props.navigation.getParam("searchParams") or {}).sortAndFilters
				
				if SortAndFilters then
					p1.props.setSortAndFilters(SortAndFilters)
					
					return
				else
					p1.props.resetSortAndFilters()
				end
			end
		}),
		NavigationEventsLogger = RoactModule.createElement(NavigationEventsLoggerModule, { pageName = "CatalogSearch" }),
		AvatarExperienceView = RoactModule.createElement(AvatarExperienceViewModule, {
			changeViewFunction = p1.changeView,
			allowAdaptiveScrolling = true,
			adaptiveScrollingProps = if FFlagAXHideMenuOnScroll or FFlagAXExpandPeekViewOnFirstScroll then {
				enableExpandPeekViewOnUpwardScroll = if FFlagAXExpandPeekViewOnFirstScroll then true else nil,
				enableAnimatedVisibility = if FFlagAXHideMenuOnScroll then true else nil
			} else nil,
			isSceneFullView = p1.props.fullView == FullView.SceneFullView,
			isUIFullView = p1.props.fullView == FullView.UIFullView,
			topBar = p1:renderSearchBar(),
			[RoactModule.Ref] = p1.sceneUIContainerRef,
			NextSelectionLeft = p1.searchBarRef,
			refinementButtonsRef = p1.refinementButtonsRef,
			defaultChildRef = HasEntries and p1.resultsListRef or p1.searchBarRef,
			multiTryOnBottomBarRef = p1.multiTryOnBottomBarRef,
			itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
			showUndoRedo = if GetFFlagAXEnableSlotBasedEditorModule() then true else nil,
			showSaveButton = if GetFFlagAXEnableSlotBasedEditorModule() and FFlagAXEnableManualSaving then true else nil
		}, {
			GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createElement(GamepadFocusHandlerForPageModule, { focusController = p1.props.focusController }),
			ResultsList = RoactModule.createElement(ResultsListModule, {
				fromSearch = true,
				defaultFocusRef = if FFlagLuaAppsDefaultSelection then p1.props.defaultFocusRef else nil,
				analyticsContext = CatalogConstantsModule.AnalyticsContext.CatalogSearch,
				searchUuid = p1.props.searchUuid,
				onRetry = p1.dispatchInitialSearch,
				frameRef = p1.resultsListRef,
				NextSelectionUp = p1.searchBarRef,
				NextSelectionRight = if p1.props.avatarRoute.current.name == AvatarScreen.TryOnManager then p1.props.namedRefs[AvatarScreen.TryOnManager] elseif p1.props.avatarRoute.current.name == AvatarScreen.LookDetails then p1.props.namedRefs[AvatarScreen.LookDetails] else p1.refinementButtonsRef,
				multiTryOnBottomBarRef = p1.multiTryOnBottomBarRef,
				onCategoryOrSubcategoryChange = p1.onCategoryOrSubcategoryChange,
				onCategoryOrSubcategoryChangeById = p1.onCategoryOrSubcategoryChangeById,
				itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs
			})
		})
	})
end

function CatalogSearch.didMount(p1)
	-- upvalues: UserInputService (copy), IsGamepadInputFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy)
	p1.isMounted = true
	p1.dispatchInitialSearch():catch(function(Err)
		if not _G.__TESTEZ_RUNNING_TEST__ then
			warn("Error fetching CatalogSearch results:\n" .. tostring(Err))
		end
	end)
	local LastInputType = UserInputService:GetLastInputType()
	local IsGamepadInput = LastInputType and IsGamepadInputFunction(LastInputType)
	
	if not FFlagAXMigrateAXToGlobalAutofocus and IsGamepadInput then
		p1.props.focusController.captureFocus()
	end
end

function CatalogSearch.willUnmount(p1)
	p1.isMounted = false
	local SearchUuid = p1.props.searchUuid
	p1.props.dispatchRemoveSearch(SearchUuid)
	p1.props.pageObjectManager:storePageObject(SearchUuid, nil)
	p1.props.resetSortAndFilters()
end

function CatalogSearch.didUpdate(p1, p2)
	if p2.searchUuid ~= p1.props.searchUuid then
		if p2.searchUuid ~= nil then
			p1.props.dispatchRemoveSearch(p2.searchUuid)
			p1.props.pageObjectManager:storePageObject(p2.searchUuid, nil)
		end
		p1.dispatchInitialSearch()
	end
end

local v1 = RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: UtilsModule (copy), DeviceOrientationMode (copy), SelectIsFullViewModule (copy), AvatarScreen (copy), PerformFetch (copy), TopBarModule (copy), FFlagAXMigrateCatalogSearchToFocusNavigation (copy)
	local SearchesInCatalogEntry = p1.Search.SearchesInCatalog[p2.searchUuid]
	local Items = SearchesInCatalogEntry and SearchesInCatalogEntry.items or nil
	
	return {
		categoryInfo = p2.categoryInfo,
		fullView = SelectIsFullViewModule(p1, AvatarScreen.CatalogSearch),
		hasEntries = if Items then #Items ~= 0 else false,
		dataStatus = PerformFetch.GetStatus(p1, (UtilsModule.getSearchKey(p1, p2.searchUuid))),
		topBarHeight = TopBarModule.selectTopBarHeightNoBanners(p1),
		itemDetailsExpanded = p1.AvatarExperience.Common.ItemDetailsExpanded,
		isPortrait = p1.DeviceOrientation == DeviceOrientationMode.Portrait,
		tryOnManagerPeekViewState = if FFlagAXMigrateCatalogSearchToFocusNavigation then nil else p1.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState,
		tryOnItems = if FFlagAXMigrateCatalogSearchToFocusNavigation then nil else p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	}
end, function(Callback)
	-- upvalues: ApiFetchCatalogSearchModule (copy), RemoveSearchInCatalogModule (copy), SetSearchTypeModule (copy), SetSearchParametersModule (copy), SetSortAndFiltersModule (copy), OpenItemPromptModule (copy), SetItemDetailsPeekViewStateFunction (copy), SetFullViewModule (copy), OpenQuickMenuModule (copy), FFlagAXResetAnalyticsMetadataOnFilterResetModule (copy), ResetSortAndFiltersThunkModule (copy), ResetSortAndFiltersModule (copy), SetTryOnManagerPeekViewStateFunction (copy), FetchWidgetInfoModule (copy), GetFFlagEnableCatalogTileLoadingLatencyModule (copy), CatalogTilesLatencyTrackerModule (copy)
	return {
		dispatchSearch = function(SearchKeyword, SearchUuid, CategoryInfo, p1)
			-- upvalues: Callback (copy), ApiFetchCatalogSearchModule (upval)
			return Callback(ApiFetchCatalogSearchModule({
				searchKeyword = SearchKeyword,
				searchUuid = SearchUuid,
				categoryInfo = CategoryInfo
			}, p1))
		end,
		dispatchSearchWithParameters = function(p1, SearchUuid, CategoryInfo, p2)
			-- upvalues: Callback (copy), ApiFetchCatalogSearchModule (upval)
			return Callback(ApiFetchCatalogSearchModule({
				searchKeyword = p1.searchKeyword,
				searchUuid = SearchUuid,
				categoryInfo = CategoryInfo,
				topics = if p1.sortAndFilters then p1.sortAndFilters.SelectedTopics or {} else {}
			}, p2))
		end,
		dispatchRemoveSearch = function(p1)
			-- upvalues: Callback (copy), RemoveSearchInCatalogModule (upval)
			Callback(RemoveSearchInCatalogModule(p1))
		end,
		setSearchType = function(p1, p2)
			-- upvalues: Callback (copy), SetSearchTypeModule (upval)
			return Callback(SetSearchTypeModule(p1, p2))
		end,
		setSearchParameters = function(p1, p2)
			-- upvalues: Callback (copy), SetSearchParametersModule (upval)
			return Callback(SetSearchParametersModule(p1, p2))
		end,
		setSortAndFilters = function(p1)
			-- upvalues: Callback (copy), SetSortAndFiltersModule (upval)
			return Callback(SetSortAndFiltersModule(p1))
		end,
		openItemPrompt = function(p1, p2, p3, p4, p5)
			-- upvalues: Callback (copy), OpenItemPromptModule (upval)
			Callback(OpenItemPromptModule(p1, p2, p3, p4, p5))
		end,
		setItemDetailsPeekViewState = function(p1)
			-- upvalues: Callback (copy), SetItemDetailsPeekViewStateFunction (upval)
			Callback(SetItemDetailsPeekViewStateFunction(p1))
		end,
		setFullView = function(p1, p2, p3)
			-- upvalues: Callback (copy), SetFullViewModule (upval)
			Callback(SetFullViewModule(p1, p2, p3))
		end,
		navigateIntoQuickMenu = function(p1, p2)
			-- upvalues: Callback (copy), OpenQuickMenuModule (upval)
			Callback(OpenQuickMenuModule(p1, p2))
		end,
		resetSortAndFilters = function()
			-- upvalues: FFlagAXResetAnalyticsMetadataOnFilterResetModule (upval), Callback (copy), ResetSortAndFiltersThunkModule (upval), ResetSortAndFiltersModule (upval)
			if FFlagAXResetAnalyticsMetadataOnFilterResetModule then
				Callback(ResetSortAndFiltersThunkModule())
				
				return
			else
				Callback(ResetSortAndFiltersModule())
			end
		end,
		setTryOnManagerPeekViewState = function(p1)
			-- upvalues: Callback (copy), SetTryOnManagerPeekViewStateFunction (upval)
			Callback(SetTryOnManagerPeekViewStateFunction(p1))
		end,
		fetchWidgetInfo = function(p1, p2)
			-- upvalues: Callback (copy), FetchWidgetInfoModule (upval)
			Callback(FetchWidgetInfoModule(p1, p2))
		end,
		dispatchCatalogTilesLatencyStartTracker = if GetFFlagEnableCatalogTileLoadingLatencyModule() then function(p1)
			-- upvalues: Callback (copy), CatalogTilesLatencyTrackerModule (upval)
			Callback((CatalogTilesLatencyTrackerModule.StartTracking(p1)))
		end else nil
	}
end)(CatalogSearch)

if not FFlagAXMigrateCatalogSearchToFocusNavigation then
	v1 = WithAvatarRouteModule((WithNavigationFunction(v1)))
end
local PageObjectManager = WithContextValueModule(WithNamedRefsModule(v1), PageObjectManagerContextModule.Consumer, "pageObjectManager")
local v2 = if FFlagAXMigrateCatalogSearchToFocusNavigation then RoactServices.connect({
	avatarExperienceAnalytics = AnalyticsModule,
	eventIngest = AppEventIngestServiceModule
})(PageObjectManager) else RoactServices.connect({
	analytics = RoactAnalyticsModule,
	catalogAnalytics = AnalyticsModule1,
	avatarExperienceAnalytics = AnalyticsModule,
	networking = RoactNetworkingModule,
	eventIngest = AppEventIngestServiceModule
})(PageObjectManager)

return if FFlagAXMigrateCatalogSearchToFocusNavigation then function(p1)
	-- upvalues: UseDispatchFunction (copy), UseAvatarRouteFunction (copy), UseNavigationFunction (copy), UseRoactServiceModule (copy), AnalyticsModule1 (copy), RoactNetworkingModule (copy), UseSelectorFunction (copy), v93 (copy), v94 (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ReactModule (copy), RoactGamepadModule (copy), UseOverlayClosedCallbackModule (copy), UseAvatarExperienceFocusNavigationBindingsModule (copy), UseLocalizationFunction (copy), UseDesignTokensFunction (copy), OpenItemPromptModule (copy), NavigationUtilsModule (copy), AvatarScreen (copy), PeekViewState (copy), SetTryOnManagerPeekViewStateFunction (copy), AvatarScreenProperties (copy), CryoModule (copy), FFlagAXMISEnableMultiShopping (copy), useCatalogSearchFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), FFlagEnableLeftNavOnConsole (copy), UseNavBarSizeFunction (copy), FFlagLuaAppsDefaultSelection (copy), UseMostRecentOrDefaultFocusBehaviorFunction (copy), UseFocusOnMountFunction (copy), GetCatalogCategoriesStoreModule (copy), UseSignalStateFunction (copy), v2 (ref)
	local UseDispatchResult = UseDispatchFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule1)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(RoactNetworkingModule)
	local UseSelectorResult = UseSelectorFunction(v93)
	local UseSelectorResult1 = UseSelectorFunction(v94)
	local Name = UseAvatarRouteResult.current.name
	local Current = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.useRef(RoactGamepadModule.createFocusController()).current
	local UseOverlayClosedCallbackModuleResult = UseOverlayClosedCallbackModule(if FFlagAXMigrateAXToGlobalAutofocus then nil else Current)
	local UseAvatarExperienceFocusNavigationBindingsModuleResult = UseAvatarExperienceFocusNavigationBindingsModule({
		overlayClosedCallback = UseOverlayClosedCallbackModuleResult
	})
	local UseLocalizationResult = UseLocalizationFunction({
		searchPlaceholder = "Search.GlobalSearch.Example.SearchCatalog"
	})
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), OpenItemPromptModule (upval), UseRoactServiceModuleResult1 (copy), UseRoactServiceModuleResult (copy), UseOverlayClosedCallbackModuleResult (copy), UseNavigationResult (copy), UseAvatarRouteResult (copy)
		UseDispatchResult(OpenItemPromptModule(UseRoactServiceModuleResult1, UseRoactServiceModuleResult, UseOverlayClosedCallbackModuleResult, UseNavigationResult, UseAvatarRouteResult))
	end, {
		UseDispatchResult, UseOverlayClosedCallbackModuleResult, UseAvatarRouteResult,
		UseNavigationResult, UseRoactServiceModuleResult1, UseRoactServiceModuleResult
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy), AvatarScreen (upval)
		NavigationUtilsModule.closeFiltersAndItemDetails(UseNavigationResult)
		UseNavigationResult.navigate(AvatarScreen.TryOnManager)
	end, { UseNavigationResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseSelectorResult (copy), PeekViewState (upval), UseDispatchResult (copy), SetTryOnManagerPeekViewStateFunction (upval)
		if UseSelectorResult == PeekViewState.Full or UseSelectorResult == PeekViewState.Extended then
			UseDispatchResult(SetTryOnManagerPeekViewStateFunction(PeekViewState.Brief))
			
			return
		else
			UseDispatchResult(SetTryOnManagerPeekViewStateFunction(PeekViewState.Full))
		end
	end, { UseSelectorResult, UseDispatchResult })
	local IsMultiTryOn = AvatarScreenProperties[UseAvatarRouteResult.opaque.name].isMultiTryOn
	local v3 = #CryoModule.Dictionary.values(UseSelectorResult1) > 1
	local v4 = nil
	
	if Name ~= AvatarScreen.TryOnManager and (IsMultiTryOn or FFlagAXMISEnableMultiShopping) and v3 then
		v4 = UseResult1
	end
	if Name == AvatarScreen.TryOnManager or Name == AvatarScreen.LookDetails then
		v4 = UseResult2
	end
	local UseTableWrappedCallbackRefResult = UseTableWrappedCallbackRefFunction((useCatalogSearchFocusNavigationBindings(nil, if Name == AvatarScreen.ItemDetails then UseResult else nil, v4)))
	local UseNavBarSizeResult = if FFlagEnableLeftNavOnConsole then UseNavBarSizeFunction() else nil
	local v5 = nil
	local v6 = nil
	
	if FFlagLuaAppsDefaultSelection then
		local UseMostRecentOrDefaultFocusBehaviorResult
		UseMostRecentOrDefaultFocusBehaviorResult, v151 = UseMostRecentOrDefaultFocusBehaviorFunction(UseAvatarExperienceFocusNavigationBindingsModuleResult)
		v5 = UseFocusOnMountFunction(UseMostRecentOrDefaultFocusBehaviorResult)
	end
	local JoinResult = CryoModule.Dictionary.join(p1, {
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else Current,
		overlayClosedCallback = UseOverlayClosedCallbackModuleResult,
		localized = UseLocalizationResult,
		designTokens = UseDesignTokensResult,
		focusNavigationRef = UseTableWrappedCallbackRefResult,
		avatarRoute = UseAvatarRouteResult,
		navigation = UseNavigationResult,
		networking = UseRoactServiceModuleResult1,
		tryOnManagerPeekViewState = UseSelectorResult,
		navBarSize = if FFlagEnableLeftNavOnConsole then UseNavBarSizeResult else nil
	})
	JoinResult.categoryInfo = UseSignalStateFunction(GetCatalogCategoriesStoreModule.getCatalogSearchSelectionStore().selectedCategoryInfo)
	JoinResult.defaultFocusRef = if FFlagLuaAppsDefaultSelection then v5 else nil
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = if FFlagLuaAppsDefaultSelection then v6 else UseAvatarExperienceFocusNavigationBindingsModuleResult,
		Size = UDim2.fromScale(1, 1)
	}, ReactModule.createElement(v2, JoinResult))
end else function(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), ReactModule (copy), RoactGamepadModule (copy), UseOverlayClosedCallbackModule (copy), UseAvatarExperienceFocusNavigationBindingsModule (copy), UseLocalizationFunction (copy), UseDesignTokensFunction (copy), CryoModule (copy), GetCatalogCategoriesStoreModule (copy), UseSignalStateFunction (copy), v2 (ref)
	local Current = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.useRef(RoactGamepadModule.createFocusController()).current
	local UseOverlayClosedCallbackModuleResult = UseOverlayClosedCallbackModule(if FFlagAXMigrateAXToGlobalAutofocus then nil else Current)
	local UseAvatarExperienceFocusNavigationBindingsModuleResult = UseAvatarExperienceFocusNavigationBindingsModule({
		overlayClosedCallback = UseOverlayClosedCallbackModuleResult
	})
	local JoinResult = CryoModule.Dictionary.join(p1, {
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else Current,
		overlayClosedCallback = UseOverlayClosedCallbackModuleResult,
		localized = UseLocalizationFunction({
			searchPlaceholder = "Search.GlobalSearch.Example.SearchCatalog"
		}),
		designTokens = UseDesignTokensFunction()
	})
	JoinResult.categoryInfo = UseSignalStateFunction(GetCatalogCategoriesStoreModule.getCatalogSearchSelectionStore().selectedCategoryInfo)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = UseAvatarExperienceFocusNavigationBindingsModuleResult,
		Size = UDim2.fromScale(1, 1)
	}, ReactModule.createElement(v2, JoinResult))
end