local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local FitFrameVertical = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameVertical
local NavigationEvents = require(CorePackages.Packages.RoactNavigation).NavigationEvents
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local CloseableHeader = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Components.CloseableHeader
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogCategories = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.CatalogCategories
local FilterButtonLayoutModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterButtonLayout)
local MainNavigationModule = require(Modules.AvatarExperience.Common.Components.NavBar.MainNavigation)
local SubNavigationModule = require(Modules.AvatarExperience.Common.Components.NavBar.SubNavigation)
local AXCatalogHeadCategoryCombineIXPModule = require(Modules.AvatarExperience.Experiments.AXCatalogHeadCategoryCombineIXP)
local GetFFlagAXEnableInventorySortsAndFiltersModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXRemoveCatalogCategoryNavKey = AvatarExperienceFlagsModule.FFlagAXRemoveCatalogCategoryNavKey
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXCatalogSupportDisableFilters = AvatarExperienceFlagsModule.FFlagAXCatalogSupportDisableFilters
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local FFlagAXMoveCatalogFilterToL1Navigation = AvatarExperienceFlagsModule.FFlagAXMoveCatalogFilterToL1Navigation
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)

return ReactModule.memo(function(Gui)
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), UseStyleFunction (copy), UseTokensFunction (copy), CatalogUtilsModule (copy), FFlagAXCatalogSupportDisableFilters (copy), FFlagAXMoveCatalogFilterToL1Navigation (copy), AvatarScreen (copy), GetFFlagAXEnableInventorySortsAndFiltersModule (copy), UseLocalizationFunction (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXRemoveCatalogCategoryNavKey (copy), CatalogCategories (copy), Focusable (copy), FitFrameVertical (copy), CloseableHeader (copy), ConstantsModule (copy), MainNavigationModule (copy), FFlagAXCustomizeMakeupSupport (copy), FilterButtonLayoutModule (copy), SubNavigationModule (copy), AXCatalogHeadCategoryCombineIXPModule (copy), NavigationEvents (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local Theme = UseStyleResult.Theme
	local Subcategory = nil
	local Category = nil
	
	if Gui.shouldUseCategoryId and Gui.selectedCategoryId then
		Category = ReactModule.useMemo(function()
			-- upvalues: CatalogUtilsModule (upval), Gui (copy)
			return CatalogUtilsModule.extractCategoryById(Gui.selectedCategoryId, Gui.categoryTable)
		end, { Gui.selectedCategoryId, Gui.categoryTable })
		
		if FFlagAXCatalogSupportDisableFilters then
			Subcategory = ReactModule.useMemo(function()
				-- upvalues: Gui (copy), CatalogUtilsModule (upval)
				return if Gui.selectedSubcategoryId and Gui.subcategoryTable then CatalogUtilsModule.extractSubcategoryById(Gui.selectedSubcategoryId, Gui.subcategoryTable) else nil
			end, { Gui.selectedSubcategoryId, Gui.subcategoryTable })
		end
	else
		Category = Gui.categoryTable[Gui.selectedCategoryIndex]
		
		if FFlagAXCatalogSupportDisableFilters then
			Subcategory = Gui.subcategoryTable and Gui.subcategoryTable[Gui.selectedSubcategoryIndex]
		end
	end
	local HasSubcategories = Category.Subcategories ~= nil
	local IsRouteNameMatch = if FFlagAXMoveCatalogFilterToL1Navigation then UseNavigationResult.state.routeName == AvatarScreen.CatalogSearch or (if GetFFlagAXEnableInventorySortsAndFiltersModule() or UseNavigationResult.state.routeName == AvatarScreen.Catalog then not Gui.showingTopics else nil) elseif GetFFlagAXEnableInventorySortsAndFiltersModule() then not Gui.showingTopics else not Gui.showingTopics and UseNavigationResult.state.routeName == AvatarScreen.Catalog
	local UseLocalizationResult = UseLocalizationFunction({
		selectedCategoryTitle = if FFlagAXCatalogCategoriesSDUI and Category.LocalizedTitle then nil else Category.Title
	})
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: Gui (copy)
		if Gui.absoluteSizeChanged then
			Gui.absoluteSizeChanged(Frame.AbsoluteSize)
		end
	end, { Gui.absoluteSizeChanged })
	
	if FFlagAXCatalogSupportDisableFilters then
		if (Subcategory or Category).DisableFilters then
			IsRouteNameMatch = false
		end
	elseif FFlagAXRemoveCatalogCategoryNavKey then
		if Category.Id == CatalogCategories.Avatars:rawValue() then
			IsRouteNameMatch = false
		end
	elseif Category.NavigationKey == CatalogCategories.Avatars then
		IsRouteNameMatch = false
	end
	return ReactModule.createElement(Focusable[FitFrameVertical], {
		width = UDim.new(1, 0),
		FillDirection = Enum.FillDirection.Vertical,
		BackgroundColor3 = if Gui.replaceMainNavigationWithCloseableHeader then UseTokensResult.Color.Surface.Surface_0.Color3 else Theme.BackgroundContrast.Color,
		BackgroundTransparency = if Gui.replaceMainNavigationWithCloseableHeader then UseTokensResult.Color.Surface.Surface_0.Transparency else Theme.BackgroundContrast.Transparency,
		BorderSizePixel = 0,
		LayoutOrder = Gui.layoutOrderMain,
		ZIndex = 3,
		[ReactModule.Change.AbsoluteSize] = UseResult,
		ref = Gui.navigationFrameRef,
		defaultChild = UseRefResult,
		restorePreviousChildFocus = true
	}, {
		MainNavigation = if Gui.replaceMainNavigationWithCloseableHeader then ReactModule.createElement(CloseableHeader, {
			ZIndex = 1,
			Size = UDim2.new(1, 0, 0, Gui.navHeightMain),
			LayoutOrder = Gui.layoutOrderMain,
			text = if FFlagAXCatalogCategoriesSDUI and Category.LocalizedTitle then Category.LocalizedTitle else UseLocalizationResult.selectedCategoryTitle,
			onClose = Gui.onCloseableHeaderClosed,
			ref = UseRefResult,
			padding = {
				left = ConstantsModule.WidgetListHorizontalMargin,
				right = ConstantsModule.WidgetListHorizontalMargin
			},
			NextSelectionDown = if HasSubcategories or not Gui.showingTopics then UseRefResult1 else Gui.NextSelectionDown,
			NextSelectionUp = Gui.NextSelectionUp
		}) else ReactModule.createElement(MainNavigationModule, {
			zIndex = 1,
			layoutOrder = Gui.layoutOrderMain,
			navHeight = Gui.navHeightMain,
			categories = Gui.categoryTable,
			selectedCategoryIndex = Gui.selectedCategoryIndex,
			selectCategory = Gui.selectCategory,
			selectedCategoryId = Gui.selectedCategoryId,
			selectCategoryId = Gui.selectCategoryId,
			shouldUseCategoryId = Gui.selectedCategoryId ~= nil or nil,
			subcategorySelected = Gui.selectedSubcategoryId ~= nil and HasSubcategories,
			supportFilterButton = FFlagAXMoveCatalogFilterToL1Navigation and true,
			showFilterButton = FFlagAXMoveCatalogFilterToL1Navigation and IsRouteNameMatch,
			ref = UseRefResult,
			NextSelectionDown = if HasSubcategories or not Gui.showingTopics then UseRefResult1 else Gui.NextSelectionDown,
			NextSelectionUp = Gui.NextSelectionUp
		}),
		SubNavigation = if FFlagAXCustomizeMakeupSupport and Category.ShowSubcategoriesAsSubnavigation then nil else ReactModule.createElement(FilterButtonLayoutModule, {
			height = if HasSubcategories or not FFlagAXMoveCatalogFilterToL1Navigation and IsRouteNameMatch then Gui.navHeightSub else 0,
			isContentEmpty = not HasSubcategories,
			layoutOrder = Gui.layoutOrderSub,
			showFilterButton = not FFlagAXMoveCatalogFilterToL1Navigation and IsRouteNameMatch,
			layoutRef = UseRefResult1,
			NextSelectionUp = UseRefResult,
			NextSelectionDown = Gui.NextSelectionDown
		}, {
			SubNavigation = ReactModule.createElement(SubNavigationModule, {
				layoutOrder = 1,
				navHeight = Gui.navHeightSub,
				subcategories = Gui.subcategoryTable,
				onSubNavigationPropsDidUpdate = Gui.onSubNavigationPropsDidUpdate,
				selectedCategoryIndex = Gui.selectedCategoryIndex,
				selectedSubcategoryIndex = Gui.selectedSubcategoryIndex,
				selectSubcategory = Gui.selectSubcategory,
				selectedCategoryId = Gui.selectedCategoryId,
				selectedSubcategoryId = Gui.selectedSubcategoryId,
				selectSubcategoryId = Gui.selectSubcategoryId,
				shouldUseCategoryId = Gui.selectedCategoryId ~= nil or nil,
				isHidden = if AXCatalogHeadCategoryCombineIXPModule.isEnabled() then not UseStateResult else nil,
				BackgroundTransparency = if Gui.replaceMainNavigationWithCloseableHeader then 1 else nil
			})
		}),
		NavigationFrameNavEvents = if AXCatalogHeadCategoryCombineIXPModule.isEnabled() then ReactModule.createElement(NavigationEvents, {
			onDidFocus = function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(true)
			end,
			onWillBlur = function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end
		}) else nil
	})
end)