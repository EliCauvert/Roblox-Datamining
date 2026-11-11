local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local FitFrameHorizontal = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameHorizontal
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseFocusGuiObjectFunction = require(CorePackages.Packages.ReactFocusNavigation).useFocusGuiObject
local ScrollingListWithArrowsAndGradientModule = require(Modules.AvatarExperience.Common.Components.ScrollingListWithArrowsAndGradient)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local CatalogCategories = AvatarExperienceCommonModule.Enums.CatalogCategories
local FindValueKeyInRefCacheFunction = AvatarExperienceCommonModule.Utils.RoactGamepadMigration.findValueKeyInRefCache
local UseTableWrappedCallbackRefFunction = AvatarExperienceCommonModule.Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXMigrateMainNavigationInputBindings = AvatarExperienceFlagsModule.FFlagAXMigrateMainNavigationInputBindings
local FFlagAXCategoryPillPositionAnimation = AvatarExperienceFlagsModule.FFlagAXCategoryPillPositionAnimation
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local MarketplaceCategoryPillWithTooltipModule = require(Modules.AvatarExperience.Common.Components.NavBar.MarketplaceCategoryPillWithTooltip)
local AnimatedPillsScrollableContentModule = require(Modules.AvatarExperience.Common.Components.NavBar.AnimatedPillsScrollableContent)
local CategoryPillCloseButton = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.CategoryPillCloseButton
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local UseTabNavigationFocusNavigationBindingsModule = require(script.Parent.useTabNavigationFocusNavigationBindings)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local FFlagAXCatalogCategoryTooltip = AvatarExperienceFlagsModule.FFlagAXCatalogCategoryTooltip
local FFlagAXMigrateCategoryTooltip = AvatarExperienceFlagsModule.FFlagAXMigrateCategoryTooltip
local FFlagAXRemoveCatalogCategoryNavKey = AvatarExperienceFlagsModule.FFlagAXRemoveCatalogCategoryNavKey
local FFlagAXCatalogSupportDisableFilters = AvatarExperienceFlagsModule.FFlagAXCatalogSupportDisableFilters
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXReduceCatalogFilterWidth = AvatarExperienceFlagsModule.FFlagAXReduceCatalogFilterWidth

return ReactModule.memo((ReactModule.forwardRef(function(Gui, Ref)
	-- upvalues: RoactGamepadModule (copy), ReactModule (copy), UseTokensFunction (copy), FFlagAXReduceCatalogFilterWidth (copy), UseFocusGuiObjectFunction (copy), FFlagAXMigrateMainNavigationInputBindings (copy), FindValueKeyInRefCacheFunction (copy), GuiService (copy), UseTabNavigationFocusNavigationBindingsModule (copy), UseTableWrappedCallbackRefFunction (copy), FFlagAXCategoryPillPositionAnimation (copy), Focusable (copy), MarketplaceCategoryPillWithTooltipModule (copy), FFlagAXCatalogCategoriesSDUI (copy), ConstantsModule (copy), FFlagAXRemoveCatalogCategoryNavKey (copy), AvatarScreen (copy), FFlagAXMigrateCategoryTooltip (copy), FFlagAXCatalogCategoryTooltip (copy), CategoryPillCloseButton (copy), CatalogUtilsModule (copy), FoundationModule (copy), MutedErrorModule (copy), FitFrameHorizontal (copy), AnimatedPillsScrollableContentModule (copy), FFlagAXCatalogSupportDisableFilters (copy), CatalogCategories (copy), ScrollingListWithArrowsAndGradientModule (copy)
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseRefCacheResult1 = RoactGamepadModule.useRefCache()
	local UseRefResult = ReactModule.useRef(nil)
	local UseTokensResult = UseTokensFunction()
	local Size1300 = if FFlagAXReduceCatalogFilterWidth then UseTokensResult.Size.Size_1300 else UseTokensResult.Size.Size_1400
	local Size600 = UseTokensResult.Size.Size_600
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseTableWrappedCallbackRefResult = if FFlagAXMigrateMainNavigationInputBindings then UseTableWrappedCallbackRefFunction((UseTabNavigationFocusNavigationBindingsModule({
		onTabBackward = ReactModule.useCallback(function(p1)
			-- upvalues: FindValueKeyInRefCacheFunction (upval), GuiService (upval), UseRefCacheResult (copy), UseFocusGuiObjectResult (copy)
			p1.cancelled = true
			local ValueKeyInRefCache: number = FindValueKeyInRefCacheFunction(GuiService.SelectedCoreObject, UseRefCacheResult)
			
			if ValueKeyInRefCache and ValueKeyInRefCache > 1 and UseFocusGuiObjectResult then
				UseFocusGuiObjectResult(UseRefCacheResult[ValueKeyInRefCache - 1].current)
			end
		end, { UseFocusGuiObjectResult }),
		onTabForward = ReactModule.useCallback(function(p1)
			-- upvalues: FindValueKeyInRefCacheFunction (upval), GuiService (upval), UseRefCacheResult (copy), UseFocusGuiObjectResult (copy)
			p1.cancelled = true
			local ValueKeyInRefCache: number = FindValueKeyInRefCacheFunction(GuiService.SelectedCoreObject, UseRefCacheResult)
			
			if ValueKeyInRefCache and ValueKeyInRefCache < #UseRefCacheResult and UseFocusGuiObjectResult then
				UseFocusGuiObjectResult(UseRefCacheResult[ValueKeyInRefCache + 1].current)
			end
		end, { UseFocusGuiObjectResult }),
		onNavigateBack = ReactModule.useCallback(function(p1)
			-- upvalues: UseFocusGuiObjectResult (copy), Gui (copy)
			p1.cancelled = true
			
			if UseFocusGuiObjectResult and Gui.NextSelectionUp and Gui.NextSelectionUp.current then
				UseFocusGuiObjectResult(Gui.NextSelectionUp.current)
			end
		end, { UseFocusGuiObjectResult, Gui.NextSelectionUp })
	}, UseRefResult))) else UseRefResult
	
	if FFlagAXCategoryPillPositionAnimation then
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult (copy)
			local Current = UseRefResult.current
			
			if Current then
				Current.CanvasPosition = Vector2.new(0, Current.CanvasPosition.Y)
			end
		end, { Gui.selectedCategoryId })
	else
		local UseResult = ReactModule.useCallback(function(p1: number, p2: number)
			-- upvalues: UseRefResult (copy)
			local Current = UseRefResult.current
			local X = (p1 or 0) - 50
			
			if Current then
				local X1 = Current.AbsoluteWindowSize.X
				
				if not X1 or X1 == 0 then return end
				if (p1 <= 0 or p1 >= X1) and (p1 + p2 <= 0 or p1 + p2 >= X1) then
					Current.CanvasPosition = Vector2.new(X, Current.CanvasPosition.Y)
				end
			end
		end, {})
		local UseResult1 = ReactModule.useCallback(function(): boolean
			-- upvalues: Gui (copy), UseRefCacheResult1 (copy), UseResult (copy)
			local Current = if Gui.selectedCategoryId then UseRefCacheResult1[Gui.selectedCategoryId].current else nil
			
			if Current == nil then
				return false
			else
				UseResult(Current.AbsolutePosition.X, Current.AbsoluteSize.X)
				
				return true
			end
		end, { Gui.selectedCategoryId })
		ReactModule.useEffect(function()
			-- upvalues: UseResult1 (copy), UseRefResult (copy)
			UseResult1()
			
			if UseRefResult.current then
				UseRefResult.current:GetPropertyChangedSignal("AbsoluteWindowSize"):Once(function()
					-- upvalues: UseResult1 (upval)
					UseResult1()
				end)
			end
		end, {})
		ReactModule.useEffect(function()
			-- upvalues: UseResult1 (copy)
			UseResult1()
		end, { UseResult1 })
	end
	local UseResult2 = ReactModule.useCallback(function(p1, LayoutOrder, PillIndex)
		-- upvalues: Gui (copy), ReactModule (upval), Focusable (upval), MarketplaceCategoryPillWithTooltipModule (upval), FFlagAXCatalogCategoriesSDUI (upval), ConstantsModule (upval), UseRefResult (copy), UseRefCacheResult1 (copy), UseRefCacheResult (copy), FFlagAXRemoveCatalogCategoryNavKey (upval), AvatarScreen (upval), FFlagAXMigrateCategoryTooltip (upval), FFlagAXCatalogCategoryTooltip (upval)
		local IsSubcategory = p1.isSubcategory
		local IsIdMatch = (if IsSubcategory then Gui.selectedSubcategoryId else Gui.selectedCategoryId) == p1.Id
		local SelectCategoryIdFunction = Gui.selectCategoryId
		local SelectSubcategoryIdFunction = Gui.selectSubcategoryId
		
		return ReactModule.createElement(Focusable[MarketplaceCategoryPillWithTooltipModule], {
			id = p1.Id,
			title = p1.Title,
			localizedTitle = if FFlagAXCatalogCategoriesSDUI then p1.LocalizedTitle else nil,
			isChecked = IsIdMatch,
			onActivated = function()
				-- upvalues: p1 (copy), IsIdMatch (copy), SelectSubcategoryIdFunction (copy), Gui (upval), SelectCategoryIdFunction (copy), ConstantsModule (upval), UseRefResult (upval)
				if not p1.isSubcategory then
					if IsIdMatch then
						SelectCategoryIdFunction(ConstantsModule.DefaultCatalogCategoryId)
					else
						SelectCategoryIdFunction(p1.Id)
					end
					if UseRefResult.current then
						UseRefResult.current.CanvasPosition = Vector2.new(0, UseRefResult.current.CanvasPosition.Y)
					end
					return
				elseif IsIdMatch then
					SelectSubcategoryIdFunction(Gui.selectedCategoryId, nil)
					
					return
				else
					SelectSubcategoryIdFunction(Gui.selectedCategoryId, p1.Id)
				end
			end,
			layoutOrder = LayoutOrder,
			pillIndex = PillIndex,
			isSubcategory = IsSubcategory,
			categoryButtonRefs = UseRefCacheResult1,
			navButtonRefs = UseRefCacheResult,
			categories = Gui.categories,
			navigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else p1.NavigationKey,
			navBarHeight = Gui.navHeight,
			avatarScreenOfOrigin = AvatarScreen.Catalog,
			categoryTooltipKey = if FFlagAXMigrateCategoryTooltip or FFlagAXCatalogCategoryTooltip then p1.TooltipKey else nil,
			categoryTooltipLocalizationKey = if FFlagAXMigrateCategoryTooltip then p1.TooltipLocalizationKey else nil,
			categoryLocalizedTooltipBody = if FFlagAXCatalogCategoriesSDUI then p1.TooltipBody else nil
		})
	end, {
		Gui.selectedCategoryId,
		Gui.selectedSubcategoryId,
		Gui.selectCategoryId,
		Gui.selectSubcategoryId
	})
	local UseResult3 = ReactModule.useCallback(function(LayoutOrder, PillIndex)
		-- upvalues: Gui (copy), ReactModule (upval), Focusable (upval), CategoryPillCloseButton (upval), ConstantsModule (upval), UseRefCacheResult1 (copy), UseRefCacheResult (copy)
		local SelectCategoryIdFunction = Gui.selectCategoryId
		
		return ReactModule.createElement(Focusable[CategoryPillCloseButton], {
			layoutOrder = LayoutOrder,
			pillIndex = PillIndex,
			onActivated = function()
				-- upvalues: SelectCategoryIdFunction (copy), ConstantsModule (upval)
				SelectCategoryIdFunction(ConstantsModule.DefaultCatalogCategoryId)
			end,
			categoryButtonRefs = UseRefCacheResult1,
			navButtonRefs = UseRefCacheResult
		})
	end, { Gui.selectCategoryId })
	local UseResult4 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseRefResult (copy)
		local X = Frame.AbsoluteSize.X or 0
		
		if UseRefResult.current then
			UseRefResult.current.CanvasSize = UDim2.new(0, X, 1, 0)
		end
	end, {})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: Gui (copy), CatalogUtilsModule (upval), ReactModule (upval), FoundationModule (upval), UseTokensResult (copy), UseRefCacheResult1 (copy), UseResult3 (copy), MutedErrorModule (upval), UseResult2 (copy), Size1300 (copy), Size600 (copy), Focusable (upval), FitFrameHorizontal (upval), UseResult4 (copy)
		local Categories = Gui.categories
		local t = {}
		local ExtractCategoryByIdResult = CatalogUtilsModule.extractCategoryById(Gui.selectedCategoryId, Categories)
		
		if ExtractCategoryByIdResult then
			local Count = 1
			local LayoutOrder = 1
			t.LeftPadding = ReactModule.createElement(FoundationModule.View, {
				tag = "auto-xy",
				BackgroundTransparency = 1,
				Size = UDim2.new(0, UseTokensResult.Padding.Small, 1, 0),
				LayoutOrder = LayoutOrder,
				ref = UseRefCacheResult1.LeftPadding
			})
			local NewLayoutOrder = LayoutOrder + 1
			
			if ExtractCategoryByIdResult.Subcategories then
				t.CloseButton = UseResult3(NewLayoutOrder, Count)
				local NewCount = Count + 1
				local NewNewLayoutOrder = NewLayoutOrder + 1
				
				if ExtractCategoryByIdResult.Id == nil then
					MutedErrorModule("Selected category does not have an ID" .. ExtractCategoryByIdResult.Name)
				else
					t[ExtractCategoryByIdResult.Id] = UseResult2(ExtractCategoryByIdResult, NewNewLayoutOrder, NewCount)
				end
				local NewNewCount = NewCount + 1
				NewLayoutOrder = NewNewLayoutOrder + 1
				
				for _, subcategory in ExtractCategoryByIdResult.Subcategories do
					if subcategory.Id == nil then
						MutedErrorModule("Selected subcategory does not have an ID" .. subcategory.Name)
					else
						t[subcategory.Id] = UseResult2(subcategory, NewLayoutOrder, NewNewCount)
					end
					NewNewCount += 1
					NewLayoutOrder += 1
				end
			else
				for _, category in Categories do
					if category.Id == nil then
						MutedErrorModule("Selected category does not have an ID" .. category.Name)
					else
						t[category.Id] = UseResult2(category, NewLayoutOrder, Count)
					end
					Count += 1
					NewLayoutOrder += 1
				end
			end
			t.RightPadding = ReactModule.createElement(FoundationModule.View, {
				tag = "auto-xy",
				BackgroundTransparency = 1,
				Size = UDim2.new(0, Size1300 + Size600, 1, 0),
				LayoutOrder = NewLayoutOrder,
				ref = UseRefCacheResult1.RightPadding
			})
		else
			MutedErrorModule("Selected category does not exist in categories list" .. Gui.selectedCategoryId)
		end
		return {
			NavFrame = ReactModule.createElement(Focusable[FitFrameHorizontal], {
				height = UDim.new(1, 0),
				FillDirection = Enum.FillDirection.Horizontal,
				BackgroundTransparency = 1,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				[ReactModule.Change.AbsoluteSize] = UseResult4,
				contentPadding = UDim.new(0, 6)
			}, t)
		}
	end, {
		Gui.subcategorySelected,
		UseResult4,
		Gui.categories,
		UseResult2,
		UseResult3
	})
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: ReactModule (upval), FoundationModule (upval), UseTokensResult (copy), UseRefCacheResult1 (copy), AnimatedPillsScrollableContentModule (upval), Gui (copy), UseRefCacheResult (copy), UseRefResult (copy), Size1300 (copy), Size600 (copy), Focusable (upval), FitFrameHorizontal (upval), UseResult4 (copy)
		return {
			NavFrame = ReactModule.createElement(Focusable[FitFrameHorizontal], {
				height = UDim.new(1, 0),
				FillDirection = Enum.FillDirection.Horizontal,
				BackgroundTransparency = 1,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				[ReactModule.Change.AbsoluteSize] = UseResult4,
				contentPadding = UDim.new(0, 6)
			}, {
				LeftPadding = ReactModule.createElement(FoundationModule.View, {
					tag = "auto-xy",
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(0, UseTokensResult.Padding.Small, 1, 0),
					ref = UseRefCacheResult1.LeftPadding
				}),
				MainContents = ReactModule.createElement(AnimatedPillsScrollableContentModule, {
					layoutOrder = 2,
					navHeight = Gui.navHeight,
					categories = Gui.categories,
					selectedCategoryId = Gui.selectedCategoryId,
					selectCategoryId = Gui.selectCategoryId,
					selectedSubcategoryId = Gui.selectedSubcategoryId,
					selectSubcategoryId = Gui.selectSubcategoryId,
					shouldShowSubcategories = Gui.shouldShowSubcategories or not not Gui.shouldShowSubcategories,
					navButtonRefs = UseRefCacheResult,
					scrollingFrameRef = UseRefResult,
					categoryButtonRefs = UseRefCacheResult1
				}),
				RightPadding = ReactModule.createElement(FoundationModule.View, {
					tag = "auto-xy",
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(0, Size1300 + Size600, 1, 0),
					ref = UseRefCacheResult1.RightPadding
				})
			})
		}
	end, {
		UseResult4, Gui.navHeight, Gui.categories, Gui.selectedCategoryId,
		Gui.selectCategoryId, Gui.selectedSubcategoryId, Gui.selectSubcategoryId,
		Gui.shouldShowSubcategories
	})
	local Surface0 = if FFlagAXCategoryPillPositionAnimation then UseTokensResult.Color.Surface.Surface_0 else UseTokensResult.Color.Surface.Surface_0.Color3
	
	return ReactModule.createElement(Focusable.Frame, {
		ClipsDescendants = true,
		BorderSizePixel = 0,
		BackgroundColor3 = if FFlagAXCategoryPillPositionAnimation then Surface0.Color3 else Surface0,
		BackgroundTransparency = if FFlagAXCategoryPillPositionAnimation then Surface0.Transparency else UseTokensResult.Color.Surface.Surface_0.Transparency,
		LayoutOrder = Gui.layoutOrder,
		Size = UDim2.new(1, 0, 0, Gui.navHeight),
		ZIndex = Gui.zIndex,
		ref = Ref,
		NextSelectionUp = Gui.NextSelectionUp,
		NextSelectionDown = Gui.NextSelectionDown,
		defaultChild = UseRefCacheResult[CatalogUtilsModule.findCategoryIndexById(Gui.categories, Gui.selectedCategoryId)]
	}, {
		ScrollingListWithArrowsAndGradient = ReactModule.createElement(ScrollingListWithArrowsAndGradientModule, {
			buttonPadding = 0,
			supportFilterButton = true,
			getScollingListContent = if FFlagAXCategoryPillPositionAnimation then UseResult6 else UseResult5,
			listHeight = Gui.navHeight,
			scrollingFrameRef = UseTableWrappedCallbackRefResult,
			buttonRefs = UseRefCacheResult1,
			backgroundColor = if FFlagAXCategoryPillPositionAnimation then Surface0.Color3 else Surface0,
			hideFilterButton = if FFlagAXCatalogSupportDisableFilters then Gui.hideFilterButton or false else Gui.selectedCategoryId == CatalogCategories.Avatars:rawValue(),
			filterButtonWidth = Size1300,
			filterButtonGradientWidth = Size600
		})
	})
end)))