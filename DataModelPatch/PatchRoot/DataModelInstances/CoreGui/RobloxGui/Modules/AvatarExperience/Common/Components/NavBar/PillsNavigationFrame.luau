local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local FitFrameVertical = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameVertical
local PillsNavigationModule = require(Modules.AvatarExperience.Common.Components.NavBar.PillsNavigation)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXCategoryPillPositionAnimation = AvatarExperienceFlagsModule.FFlagAXCategoryPillPositionAnimation
local FFlagAXCatalogSupportDisableFilters = AvatarExperienceFlagsModule.FFlagAXCatalogSupportDisableFilters

return ReactModule.memo(function(Gui)
	-- upvalues: ReactModule (copy), UseStyleFunction (copy), CatalogUtilsModule (copy), FFlagAXCatalogSupportDisableFilters (copy), Focusable (copy), FitFrameVertical (copy), PillsNavigationModule (copy), FFlagAXCategoryPillPositionAnimation (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local Theme = UseStyleFunction().Theme
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CatalogUtilsModule (upval), Gui (copy)
		return CatalogUtilsModule.extractCategoryById(Gui.selectedCategoryId, Gui.categoryTable)
	end, { Gui.selectedCategoryId, Gui.categoryTable })
	local DisableFilters = if FFlagAXCatalogSupportDisableFilters then UseMemoResult.DisableFilters else nil
	local HasSubcategories = UseMemoResult.Subcategories ~= nil
	
	return ReactModule.createElement(Focusable[FitFrameVertical], {
		width = UDim.new(1, 0),
		FillDirection = Enum.FillDirection.Vertical,
		BackgroundColor3 = Theme.BackgroundContrast.Color,
		BackgroundTransparency = Theme.BackgroundContrast.Transparency,
		BorderSizePixel = 0,
		LayoutOrder = Gui.layoutOrderMain,
		ZIndex = 3,
		[ReactModule.Change.AbsoluteSize] = ReactModule.useCallback(function(Frame)
			-- upvalues: Gui (copy)
			if Gui.absoluteSizeChanged then
				Gui.absoluteSizeChanged(Frame.AbsoluteSize)
			end
		end, { Gui.absoluteSizeChanged }),
		ref = Gui.navigationFrameRef,
		defaultChild = UseRefResult,
		restorePreviousChildFocus = true
	}, {
		PillsNavigation = ReactModule.createElement(PillsNavigationModule, {
			zIndex = 1,
			layoutOrder = Gui.layoutOrderMain,
			navHeight = Gui.navHeightMain,
			categories = Gui.categoryTable,
			selectedCategoryId = Gui.selectedCategoryId,
			selectCategoryId = Gui.selectCategoryId,
			selectedSubcategoryId = Gui.selectedSubcategoryId,
			selectSubcategoryId = Gui.selectSubcategoryId,
			subcategorySelected = Gui.selectedSubcategoryId ~= nil and HasSubcategories,
			shouldShowSubcategories = if FFlagAXCategoryPillPositionAnimation then HasSubcategories else nil,
			hideFilterButton = if FFlagAXCatalogSupportDisableFilters then DisableFilters else nil,
			ref = UseRefResult,
			NextSelectionDown = if HasSubcategories or not Gui.showingTopics then UseRefResult1 else Gui.NextSelectionDown,
			NextSelectionUp = Gui.NextSelectionUp
		})
	})
end)