local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Workspace.Packages.AppCommonLib)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local FilterButtonLayoutModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterButtonLayout)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogTopicBarModule = require(Modules.AvatarExperience.Catalog.Components.CatalogTopicBar)
local CatalogNavigationModule = require(Modules.AvatarExperience.Catalog.Components.NavBar.CatalogNavigation)
local FocusedWidgetTopContentModule = require(Modules.AvatarExperience.Common.Components.Widgets.FocusedWidgetTopContent)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local GetFFlagAXEnableCategoryPillsModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableCategoryPills)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXCatalogSupportDisableFilters = AvatarExperienceFlagsModule.FFlagAXCatalogSupportDisableFilters
local FFlagAXMoveCatalogFilterToL1Navigation = AvatarExperienceFlagsModule.FFlagAXMoveCatalogFilterToL1Navigation
local FFlagAXCatalogSearchSupportDisableFilters = AvatarExperienceFlagsModule.FFlagAXCatalogSearchSupportDisableFilters
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXCatalogOffersBannerEnabled = AvatarExperienceFlagsModule.FFlagAXCatalogOffersBannerEnabled
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState

return function(p1)
	-- upvalues: ReactModule (copy), UseNavigationFunction (copy), UseStyleFunction (copy), AvatarScreen (copy), FFlagAXCatalogCategoriesSDUI (copy), GetCatalogCategoriesStoreModule (copy), UseSignalStateFunction (copy), FFlagAXCatalogSupportDisableFilters (copy), FFlagAXCatalogOffersBannerEnabled (copy), RoactModule (copy), Focusable (copy), CatalogNavigationModule (copy), GetFFlagAXEnableCategoryPillsModule (copy), FFlagAXMoveCatalogFilterToL1Navigation (copy), ConstantsModule (copy), CatalogTopicBarModule (copy), FFlagAXCatalogSearchSupportDisableFilters (copy), FilterButtonLayoutModule (copy), FocusedWidgetTopContentModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseNavigationResult = UseNavigationFunction()
	local FromSearch = p1.fromSearch
	local CatalogAnalytics = p1.catalogAnalytics
	local AxAnalytics = p1.axAnalytics
	local SearchInCatalog = p1.searchInCatalog
	local Items = SearchInCatalog and SearchInCatalog.items or nil
	local Theme = UseStyleFunction().Theme
	local FromSearch1 = p1.fromSearch
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval)
		return if UseNavigationResult.state.routeName == AvatarScreen.CatalogSearch then (UseNavigationResult.getParam("searchParams") or {}).searchKeyword else nil
	end, { UseNavigationResult })
	local Flag = true
	local Flag1: boolean = FromSearch
	local HideTopBar = p1.hideTopBar
	local Active = p1.focusedWidget.active
	
	if p1.hidePillBar then
		FromSearch1 = false
		Flag1 = false
	end
	if HideTopBar then
		Flag = false
		Flag1 = false
		FromSearch1 = false
	end
	local UseRefResult2 = if Flag then UseRefResult else nil
	local v1 = nil
	local DisableFilters = nil
	
	if FFlagAXCatalogCategoriesSDUI then
		v1 = UseSignalStateFunction(GetCatalogCategoriesStoreModule.getCatalogCategoriesStore().getCategories)
	end
	local CatalogSearchSelectionStore = if p1.fromSearch then GetCatalogCategoriesStoreModule.getCatalogSearchSelectionStore() else GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
	local UseSignalStateResult = UseSignalStateFunction(CatalogSearchSelectionStore.selectedCategoryId)
	local UseSignalStateResult1 = UseSignalStateFunction(CatalogSearchSelectionStore.selectedSubcategoryId)
	
	if FFlagAXCatalogSupportDisableFilters then
		DisableFilters = UseSignalStateFunction(CatalogSearchSelectionStore.selectedCategoryInfo).DisableFilters
	end
	local config = nil
	if FFlagAXCatalogOffersBannerEnabled then
		config = {
			BorderSizePixel = 0,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency or 1,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			restorePreviousChildFocus = p1.restorePreviousChildFocus,
			ref = p1.topPanelRef,
			defaultChild = if Flag then UseRefResult else UseRefResult1,
			NextSelectionDown = if p1.hasEntries then p1.gridRef else nil
		}
		local UpdateHeightBindingFunction = p1.updateHeightBinding
		
		if UpdateHeightBindingFunction then
			config[RoactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: UpdateHeightBindingFunction (copy)
				UpdateHeightBindingFunction(Frame.AbsoluteSize.Y)
			end
		end
	else
		config = {
			BackgroundTransparency = Theme.BackgroundDefault.Transparency or 1,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			restorePreviousChildFocus = p1.restorePreviousChildFocus,
			ref = p1.topPanelRef,
			defaultChild = if Flag then UseRefResult else UseRefResult1,
			NextSelectionDown = if p1.hasEntries then p1.gridRef else nil,
			[RoactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: p1 (copy)
				p1.updateHeightBinding(Frame.AbsoluteSize.Y)
			end
		}
	end
	return RoactModule.createElement(Focusable.Frame, config, {
		ListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 0)
		}),
		NavBar = if Flag then RoactModule.createElement(CatalogNavigationModule, {
			layoutOrderMain = 1,
			layoutOrderSub = 2,
			analytics = CatalogAnalytics,
			axAnalytics = AxAnalytics,
			navHeightMain = if GetFFlagAXEnableCategoryPillsModule() or FFlagAXMoveCatalogFilterToL1Navigation then ConstantsModule.CatalogMainNavHeight else ConstantsModule.MainNavHeight,
			navHeightSub = ConstantsModule.SubNavHeight,
			navBarRef = UseRefResult,
			NextSelectionDown = if FromSearch1 then UseRefResult1 else nil,
			backToTopSignal = p1.backToTopSignal,
			showingTopics = FromSearch1,
			fromSearch = FromSearch,
			onCategoryOrSubcategoryChange = p1.onCategoryOrSubcategoryChange,
			onCategoryOrSubcategoryChangeById = p1.onCategoryOrSubcategoryChangeById,
			selectedCategoryId = UseSignalStateResult,
			selectedSubcategoryId = UseSignalStateResult1,
			categories = if FFlagAXCatalogCategoriesSDUI then v1 else nil
		}) else nil,
		PillBar = if FromSearch1 then RoactModule.createElement(CatalogTopicBarModule, {
			layoutOrder = 3,
			NextSelectionUp = UseRefResult2,
			frameRef = UseRefResult1,
			items = Items,
			searchKeyword = UseMemoResult,
			showFilterButton = if FFlagAXCatalogSearchSupportDisableFilters then not DisableFilters else nil
		}) elseif Flag1 and not FFlagAXMoveCatalogFilterToL1Navigation then RoactModule.createElement(FilterButtonLayoutModule, {
			isContentEmpty = true,
			layoutOrder = 3,
			height = ConstantsModule.PillBarHeight,
			showFilterButton = not FFlagAXCatalogSupportDisableFilters or not DisableFilters,
			layoutRef = UseRefResult1,
			NextSelectionUp = UseRefResult2
		}) else nil,
		FocusedWidgetBar = if Active then ReactModule.createElement(FocusedWidgetTopContentModule, {
			layoutOrder = 4,
			active = Active,
			focusedWidgetTitle = p1.focusedWidget.title,
			focusedWidgetLocalizedTitle = p1.focusedWidget.localizedTitle,
			focusedWidgetLocalizedTooltip = p1.focusedWidget.localizedTooltip,
			showCloseIcon = p1.showCloseIcon,
			searchUuid = p1.searchUuid,
			onClose = p1.onCloseFocusedWidget
		}) else nil
	})
end