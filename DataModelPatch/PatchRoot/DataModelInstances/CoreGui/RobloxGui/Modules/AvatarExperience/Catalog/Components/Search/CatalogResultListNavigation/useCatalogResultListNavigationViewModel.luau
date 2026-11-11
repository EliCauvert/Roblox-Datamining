local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local _ = require(CorePackages.Workspace.Packages.AppCommonLib)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseStoreFunction = RoactUtilsModule.Hooks.RoactRodux.useStore
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local CatalogActiveSelectionStoreRefModule = require(Modules.AvatarExperience.Catalog.Stores.catalogActiveSelectionStoreRef)
local Exit3DFullViewModule = require(Modules.AvatarExperience.Common.Thunks.Exit3DFullView)
local GetFFlagAXEnableCategoryPillsModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableCategoryPills)
local UseResultsAreSduiEnabledModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useResultsAreSduiEnabled)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceServerDrivenUi)
local FFlagAXCatalogSupportDisableFilters = AvatarExperienceFlagsModule.FFlagAXCatalogSupportDisableFilters
local FFlagAXMoveCatalogFilterToL1Navigation = AvatarExperienceFlagsModule.FFlagAXMoveCatalogFilterToL1Navigation
local FFlagAXCatalogSearchSupportDisableFilters = AvatarExperienceFlagsModule.FFlagAXCatalogSearchSupportDisableFilters
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local FFlagAXCatalogSduiSingleRetryButtonOnError = AvatarExperienceFlagsModule.FFlagAXCatalogSduiSingleRetryButtonOnError
local _ = require(script.Parent.CatalogResultListNavigationView)

return function(p1)
	-- upvalues: ReactModule (copy), UseNavigationFunction (copy), UseStyleFunction (copy), AvatarScreen (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXMigrateAllTabToSduiDev (copy), GetCatalogCategoriesStoreModule (copy), UseSignalStateFunction (copy), FFlagAXCatalogSupportDisableFilters (copy), UseDispatchFunction (copy), UseStoreFunction (copy), FullView (copy), Exit3DFullViewModule (copy), CatalogActiveSelectionStoreRefModule (copy), FFlagAXCatalogSduiSingleRetryButtonOnError (copy), UseResultsAreSduiEnabledModule (copy), GetFFlagAXEnableCategoryPillsModule (copy), FFlagAXMoveCatalogFilterToL1Navigation (copy), ConstantsModule (copy), FFlagAXCatalogSearchSupportDisableFilters (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseNavigationResult = UseNavigationFunction()
	local Theme = UseStyleFunction().Theme
	local FromSearch = p1.fromSearch
	local Items = p1.searchInCatalog and p1.searchInCatalog.items or nil
	local FocusedWidgetActive: boolean = if p1.focusedWidget and p1.focusedWidget.active then true else false
	local Flag: boolean = FromSearch
	local ShowNavBar = true
	local Flag1: boolean = FromSearch
	
	if p1.hidePillBar then
		Flag = false
		Flag1 = false
	end
	if p1.hideTopBar then
		ShowNavBar = false
		Flag1 = false
		Flag = false
	end
	local SearchKeyword = nil
	local RouteName = UseNavigationResult.state.routeName
	
	if RouteName == AvatarScreen.CatalogSearch then
		SearchKeyword = (UseNavigationResult.getParam("searchParams") or {}).searchKeyword
	end
	local UseRefResult2 = if ShowNavBar then UseRefResult else nil
	local UseSignalStateResult = nil
	local UseSignalStateResult1 = nil
	local v1 = nil
	local DisableFilters = nil
	
	if FFlagAXCatalogCategoriesSDUI and not FFlagAXMigrateAllTabToSduiDev then
		v1 = UseSignalStateFunction(GetCatalogCategoriesStoreModule.getCatalogCategoriesStore().getCategories)
	end
	local CatalogSearchSelectionStore = if FromSearch then GetCatalogCategoriesStoreModule.getCatalogSearchSelectionStore() else GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
	UseSignalStateResult = UseSignalStateFunction(CatalogSearchSelectionStore.selectedCategoryId)
	UseSignalStateResult1 = UseSignalStateFunction(CatalogSearchSelectionStore.selectedSubcategoryId)
	
	if FFlagAXCatalogSupportDisableFilters then
		DisableFilters = UseSignalStateFunction(CatalogSearchSelectionStore.selectedCategoryInfo).DisableFilters
	end
	local UseMemoResult = nil
	
	if FFlagAXMigrateAllTabToSduiDev then
		local UseDispatchResult = UseDispatchFunction()
		local UseStoreResult = UseStoreFunction()
		local AxAnalytics = p1.axAnalytics
		local UseRefResult3 = ReactModule.useRef(`{UseSignalStateResult}:{UseSignalStateResult1}`)
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult3 (copy), UseSignalStateResult (ref), UseSignalStateResult1 (ref), UseStoreResult (copy), RouteName (copy), FullView (upval), UseDispatchResult (copy), Exit3DFullViewModule (upval), AxAnalytics (copy)
			if UseRefResult3.current == `{UseSignalStateResult}:{UseSignalStateResult1}` then return end
			UseRefResult3.current = `{UseSignalStateResult}:{UseSignalStateResult1}`
			
			if UseStoreResult:getState().AvatarExperience.Common.FullView[RouteName] == FullView.SceneFullView then
				UseDispatchResult(Exit3DFullViewModule(AxAnalytics, RouteName))
			end
		end, {
			UseSignalStateResult,
			UseSignalStateResult1,
			UseStoreResult,
			AxAnalytics,
			UseDispatchResult
		})
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: CatalogSearchSelectionStore (copy)
			return {
				activeCategoryId = CatalogSearchSelectionStore.selectedCategoryId,
				activeSubcategoryId = CatalogSearchSelectionStore.selectedSubcategoryId
			}
		end, { CatalogSearchSelectionStore })
		ReactModule.useEffect(function()
			-- upvalues: CatalogActiveSelectionStoreRefModule (upval), CatalogSearchSelectionStore (copy)
			local PublishActiveStoreResult = CatalogActiveSelectionStoreRefModule.publishActiveStore(CatalogSearchSelectionStore)
			
			return function()
				-- upvalues: CatalogActiveSelectionStoreRefModule (upval), PublishActiveStoreResult (copy)
				CatalogActiveSelectionStoreRefModule.releaseActiveStore(PublishActiveStoreResult)
			end
		end, { CatalogSearchSelectionStore })
		local UseRefResult4 = ReactModule.useRef(`{UseSignalStateResult}:{UseSignalStateResult1}`)
		local OnCategoryOrSubcategoryChangeByIdFunction = p1.onCategoryOrSubcategoryChangeById
		ReactModule.useEffect(function()
			-- upvalues: UseSignalStateResult (ref), UseSignalStateResult1 (ref), UseRefResult4 (copy), OnCategoryOrSubcategoryChangeByIdFunction (copy)
			local Text: string = `{UseSignalStateResult}:{UseSignalStateResult1}`
			
			if UseRefResult4.current == Text then return end
			UseRefResult4.current = Text
			
			if OnCategoryOrSubcategoryChangeByIdFunction and UseSignalStateResult then
				OnCategoryOrSubcategoryChangeByIdFunction(UseSignalStateResult, UseSignalStateResult1)
			end
		end, {
			UseSignalStateResult,
			UseSignalStateResult1,
			OnCategoryOrSubcategoryChangeByIdFunction
		})
	end
	local UseResultsAreSduiEnabledModuleResult = if FFlagAXMigrateAllTabToSduiDev and FFlagAXCatalogSduiSingleRetryButtonOnError then UseResultsAreSduiEnabledModule() else nil
	
	return {
		backgroundTransparency = Theme.BackgroundDefault.Transparency or 1,
		backgroundColor = Theme.BackgroundDefault.Color,
		restorePreviousChildFocus = p1.restorePreviousChildFocus,
		topPanelRef = p1.topPanelRef,
		defaultChildRef = if ShowNavBar then UseRefResult else UseRefResult1,
		nextSelectionDown = if p1.hasEntries then p1.gridRef else nil,
		updateHeightBinding = p1.updateHeightBinding,
		showNavBar = ShowNavBar,
		showTopics = Flag,
		showFilterButtonLayout = Flag1 and (not Flag and not FFlagAXMoveCatalogFilterToL1Navigation),
		focusedWidgetActive = FocusedWidgetActive,
		catalogAnalytics = p1.catalogAnalytics,
		axAnalytics = p1.axAnalytics,
		navHeightMain = if GetFFlagAXEnableCategoryPillsModule() or FFlagAXMoveCatalogFilterToL1Navigation then ConstantsModule.CatalogMainNavHeight else ConstantsModule.MainNavHeight,
		navBarRef = UseRefResult,
		navBarNextSelectionDown = if Flag then UseRefResult1 else nil,
		backToTopSignal = p1.backToTopSignal,
		fromSearch = FromSearch,
		onCategoryOrSubcategoryChange = p1.onCategoryOrSubcategoryChange,
		onCategoryOrSubcategoryChangeById = p1.onCategoryOrSubcategoryChangeById,
		selectedCategoryId = UseSignalStateResult,
		selectedSubcategoryId = UseSignalStateResult1,
		categories = if FFlagAXCatalogCategoriesSDUI then v1 else nil,
		pillBarRef = UseRefResult1,
		pillBarNextSelectionUp = UseRefResult2,
		topicBarItems = Items,
		searchKeyword = SearchKeyword,
		showTopicBarFilterButton = if FFlagAXCatalogSearchSupportDisableFilters then not DisableFilters else nil,
		filterButtonLayoutShowFilterButton = not FFlagAXCatalogSupportDisableFilters or not DisableFilters,
		filterButtonLayoutNextSelectionUp = UseRefResult2,
		focusedWidgetTitle = p1.focusedWidget.title,
		focusedWidgetLocalizedTitle = p1.focusedWidget.localizedTitle,
		focusedWidgetLocalizedTooltip = p1.focusedWidget.localizedTooltip,
		showCloseIcon = p1.showCloseIcon,
		searchUuid = p1.searchUuid,
		onCloseFocusedWidget = p1.onCloseFocusedWidget,
		pageIdentifier = if FFlagAXMigrateAllTabToSduiDev then RouteName else nil,
		context = if FFlagAXMigrateAllTabToSduiDev then "catalog-tab:recommended" else nil,
		catalogSelectionReader = UseMemoResult,
		shouldDisplayCategoryMenuError = if FFlagAXMigrateAllTabToSduiDev and FFlagAXCatalogSduiSingleRetryButtonOnError then not UseResultsAreSduiEnabledModuleResult else nil
	}
end