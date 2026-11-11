local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Workspace.Packages.AppCommonLib)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local CatalogTopicBarModule = require(Modules.AvatarExperience.Catalog.Components.CatalogTopicBar)
local CatalogNavigationModule = require(Modules.AvatarExperience.Catalog.Components.NavBar.CatalogNavigation)
local FilterButtonLayoutModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterButtonLayout)
local FocusedWidgetTopContentModule = require(Modules.AvatarExperience.Common.Components.Widgets.FocusedWidgetTopContent)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogSduiCategoryMenuEntryPoint = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Components.CatalogSduiCategoryMenuEntryPoint
local CatalogSelectionReaderContext = require(CorePackages.Workspace.Packages.AvatarExperienceServerDrivenUi).Context.CatalogSelectionReaderContext
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local _ = require(CorePackages.Workspace.Packages.SduiSharedUtilities)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local FFlagAXCatalogOffersBannerEnabled = AvatarExperienceFlagsModule.FFlagAXCatalogOffersBannerEnabled

return function(p1)
	-- upvalues: ReactModule (copy), FFlagAXCatalogOffersBannerEnabled (copy), Focusable (copy), FFlagAXMigrateAllTabToSduiDev (copy), CatalogSelectionReaderContext (copy), CatalogSduiCategoryMenuEntryPoint (copy), AvatarScreen (copy), CatalogNavigationModule (copy), ConstantsModule (copy), CatalogTopicBarModule (copy), FilterButtonLayoutModule (copy), FocusedWidgetTopContentModule (copy)
	local config = {
		[ReactModule.Tag] = "data-testid=CatalogResultListNavigationView",
		BackgroundTransparency = p1.backgroundTransparency,
		BackgroundColor3 = p1.backgroundColor,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		restorePreviousChildFocus = p1.restorePreviousChildFocus,
		ref = p1.topPanelRef,
		defaultChild = p1.defaultChildRef,
		NextSelectionDown = p1.nextSelectionDown,
		[ReactModule.Change.AbsoluteSize] = function(Frame)
			-- upvalues: p1 (copy)
			p1.updateHeightBinding(Frame.AbsoluteSize.Y)
		end
	}
	
	if FFlagAXCatalogOffersBannerEnabled then
		config = {
			[ReactModule.Tag] = "data-testid=CatalogResultListNavigationView",
			BackgroundTransparency = p1.backgroundTransparency,
			BackgroundColor3 = p1.backgroundColor,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			restorePreviousChildFocus = p1.restorePreviousChildFocus,
			ref = p1.topPanelRef,
			defaultChild = p1.defaultChildRef,
			NextSelectionDown = p1.nextSelectionDown
		}
		local UpdateHeightBindingFunction = p1.updateHeightBinding
		
		if UpdateHeightBindingFunction then
			config[ReactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: UpdateHeightBindingFunction (copy)
				UpdateHeightBindingFunction(Frame.AbsoluteSize.Y)
			end
		end
	end
	return ReactModule.createElement(Focusable.Frame, config, {
		ListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 0)
		}),
		NavBar = if p1.showNavBar then if FFlagAXMigrateAllTabToSduiDev then ReactModule.createElement(CatalogSelectionReaderContext.Context.Provider, { value = p1.catalogSelectionReader }, {
			Menu = ReactModule.createElement(CatalogSduiCategoryMenuEntryPoint, {
				context = p1.context or "",
				appPage = p1.pageIdentifier or AvatarScreen.Catalog,
				shouldDisplayError = p1.shouldDisplayCategoryMenuError
			})
		}) else ReactModule.createElement(CatalogNavigationModule, {
			layoutOrderMain = 1,
			layoutOrderSub = 2,
			analytics = p1.catalogAnalytics,
			axAnalytics = p1.axAnalytics,
			navHeightMain = p1.navHeightMain,
			navHeightSub = ConstantsModule.SubNavHeight,
			navBarRef = p1.navBarRef,
			NextSelectionDown = p1.navBarNextSelectionDown,
			backToTopSignal = p1.backToTopSignal,
			showingTopics = p1.showTopics,
			fromSearch = p1.fromSearch,
			onCategoryOrSubcategoryChange = p1.onCategoryOrSubcategoryChange,
			onCategoryOrSubcategoryChangeById = p1.onCategoryOrSubcategoryChangeById,
			selectedCategoryId = p1.selectedCategoryId,
			selectedSubcategoryId = p1.selectedSubcategoryId,
			categories = p1.categories
		}) else nil,
		PillBar = if p1.showTopics then ReactModule.createElement(CatalogTopicBarModule, {
			layoutOrder = 3,
			NextSelectionUp = p1.pillBarNextSelectionUp,
			frameRef = p1.pillBarRef,
			items = p1.topicBarItems,
			searchKeyword = p1.searchKeyword,
			showFilterButton = p1.showTopicBarFilterButton or false
		}) elseif p1.showFilterButtonLayout then ReactModule.createElement(FilterButtonLayoutModule, {
			isContentEmpty = true,
			layoutOrder = 3,
			height = ConstantsModule.PillBarHeight,
			showFilterButton = p1.filterButtonLayoutShowFilterButton,
			layoutRef = p1.pillBarRef,
			NextSelectionUp = p1.filterButtonLayoutNextSelectionUp
		}) else nil,
		FocusedWidgetBar = if p1.focusedWidgetActive then ReactModule.createElement(FocusedWidgetTopContentModule, {
			layoutOrder = 4,
			active = p1.focusedWidgetActive,
			focusedWidgetTitle = p1.focusedWidgetTitle,
			focusedWidgetLocalizedTitle = p1.focusedWidgetLocalizedTitle,
			focusedWidgetLocalizedTooltip = p1.focusedWidgetLocalizedTooltip,
			showCloseIcon = p1.showCloseIcon,
			searchUuid = p1.searchUuid,
			onClose = p1.onCloseFocusedWidget
		}) else nil
	})
end