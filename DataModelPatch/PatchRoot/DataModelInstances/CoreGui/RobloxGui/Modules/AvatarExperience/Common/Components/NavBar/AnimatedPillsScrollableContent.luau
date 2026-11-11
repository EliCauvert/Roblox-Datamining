local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local MarketplaceCategoryPillWithTooltipModule = require(Modules.AvatarExperience.Common.Components.NavBar.MarketplaceCategoryPillWithTooltip)
local CategoryPillCloseButton = AvatarExperienceCommonModule.Components.CategoryPillCloseButton
local AnimatedCategoryPill = AvatarExperienceCommonModule.Components.AnimatedCategoryPill
local AnimatedSubcategoryPill = AvatarExperienceCommonModule.Components.AnimatedSubcategoryPill
local UseSubcategoryPillAnimationFunction = AvatarExperienceCommonModule.Hooks.useSubcategoryPillAnimation
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXRemoveCatalogCategoryNavKey = AvatarExperienceFlagsModule.FFlagAXRemoveCatalogCategoryNavKey
local FFlagAXCatalogCategoryTooltip = AvatarExperienceFlagsModule.FFlagAXCatalogCategoryTooltip
local FFlagAXMigrateCategoryTooltip = AvatarExperienceFlagsModule.FFlagAXMigrateCategoryTooltip
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI

return function(p1)
	-- upvalues: ReactModule (copy), CatalogUtilsModule (copy), UseTokensFunction (copy), UseSubcategoryPillAnimationFunction (copy), ConstantsModule (copy), Focusable (copy), CategoryPillCloseButton (copy), MarketplaceCategoryPillWithTooltipModule (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXRemoveCatalogCategoryNavKey (copy), AvatarScreen (copy), FFlagAXMigrateCategoryTooltip (copy), FFlagAXCatalogCategoryTooltip (copy), FoundationModule (copy), MutedErrorModule (copy), AnimatedCategoryPill (copy), AnimatedSubcategoryPill (copy)
	local ShouldShowSubcategories = p1.shouldShowSubcategories
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CatalogUtilsModule (upval), p1 (copy)
		return CatalogUtilsModule.extractCategoryById(p1.selectedCategoryId, p1.categories)
	end, { p1.selectedCategoryId, p1.categories })
	local UseTokensResult = UseTokensFunction()
	local Surface0 = UseTokensResult.Color.Surface.Surface_0
	local NavButtonRefs = p1.navButtonRefs
	local CategoryButtonRefs = p1.categoryButtonRefs
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef({})
	local UseRefResult2 = ReactModule.useRef(0)
	local UseSubcategoryPillAnimationResult = UseSubcategoryPillAnimationFunction(UseMemoResult)
	local SubcategoriesState = UseSubcategoryPillAnimationResult.subcategoriesState
	local IsFadingOut = UseSubcategoryPillAnimationResult.isFadingOut
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), ConstantsModule (upval)
		p1.selectCategoryId(ConstantsModule.DefaultCatalogCategoryId)
	end, { p1.selectCategoryId })
	local UseResult1 = ReactModule.useCallback(function(p2, PillIndex, IsSelectable)
		-- upvalues: p1 (copy), ReactModule (upval), Focusable (upval), MarketplaceCategoryPillWithTooltipModule (upval), FFlagAXCatalogCategoriesSDUI (upval), ConstantsModule (upval), CategoryButtonRefs (copy), NavButtonRefs (copy), FFlagAXRemoveCatalogCategoryNavKey (upval), AvatarScreen (upval), FFlagAXMigrateCategoryTooltip (upval), FFlagAXCatalogCategoryTooltip (upval)
		local IsSubcategory = p2.isSubcategory
		local IsIdMatch = (if IsSubcategory then p1.selectedSubcategoryId else p1.selectedCategoryId) == p2.Id
		local SelectCategoryIdFunction = p1.selectCategoryId
		local SelectSubcategoryIdFunction = p1.selectSubcategoryId
		
		return ReactModule.createElement(Focusable[MarketplaceCategoryPillWithTooltipModule], {
			id = p2.Id,
			title = p2.Title,
			localizedTitle = if FFlagAXCatalogCategoriesSDUI then p2.LocalizedTitle else nil,
			isChecked = IsIdMatch,
			onActivated = function()
				-- upvalues: p2 (copy), IsIdMatch (copy), SelectSubcategoryIdFunction (copy), p1 (upval), SelectCategoryIdFunction (copy), ConstantsModule (upval)
				if p2.isSubcategory then
					if IsIdMatch then
						SelectSubcategoryIdFunction(p1.selectedCategoryId, nil)
						
						return
					else
						SelectSubcategoryIdFunction(p1.selectedCategoryId, p2.Id)
						
						return
					end
				elseif IsIdMatch then
					SelectCategoryIdFunction(ConstantsModule.DefaultCatalogCategoryId)
					
					return
				else
					SelectCategoryIdFunction(p2.Id)
				end
			end,
			pillIndex = PillIndex,
			isSubcategory = IsSubcategory,
			categoryButtonRefs = CategoryButtonRefs,
			navButtonRefs = NavButtonRefs,
			categories = p1.categories,
			isSelectable = IsSelectable,
			navigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else p2.NavigationKey,
			navBarHeight = p1.navHeight,
			avatarScreenOfOrigin = AvatarScreen.Catalog,
			categoryTooltipKey = if FFlagAXMigrateCategoryTooltip or FFlagAXCatalogCategoryTooltip then p2.TooltipKey else nil,
			categoryTooltipLocalizationKey = if FFlagAXMigrateCategoryTooltip then p2.TooltipLocalizationKey else nil,
			categoryLocalizedTooltipBody = if FFlagAXCatalogCategoriesSDUI then p2.TooltipBody else nil
		})
	end, {
		p1.selectedCategoryId,
		p1.selectedSubcategoryId,
		p1.selectCategoryId,
		p1.selectSubcategoryId,
		p1.navHeight
	})
	local XSmall = UseTokensResult.Padding.XSmall
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy",
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 1, 0),
		AutomaticSize = Enum.AutomaticSize.XY,
		LayoutOrder = p1.layoutOrder
	}, {
		CloseButtonFrame = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy radius-circle align-x-center align-y-center",
			ZIndex = 3,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0),
			backgroundStyle = Surface0,
			ref = UseRefResult,
			Visible = ShouldShowSubcategories
		}, {
			CloseButton = ReactModule.useCallback(function()
				-- upvalues: ReactModule (upval), Focusable (upval), CategoryPillCloseButton (upval), UseResult (copy), CategoryButtonRefs (copy), NavButtonRefs (copy)
				return ReactModule.createElement(Focusable[CategoryPillCloseButton], {
					pillIndex = 1,
					onActivated = UseResult,
					categoryButtonRefs = CategoryButtonRefs,
					navButtonRefs = NavButtonRefs
				})
			end, { UseResult })()
		}),
		CategoriesFrame = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy",
			BackgroundTransparency = 1,
			ZIndex = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.new(0, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.X
		}, ((function()
			-- upvalues: p1 (copy), MutedErrorModule (upval), UseRefResult (copy), XSmall (copy), ReactModule (upval), AnimatedCategoryPill (upval), UseResult1 (copy), UseRefResult1 (copy), UseRefResult2 (copy)
			local PillIndex = 2
			local Elements = {}
			local v1 = 0
			
			for _, category in p1.categories do
				if category.Id == nil then
					MutedErrorModule("AnimatedPillsScrollableContent: Selected category does not have an ID" .. category.Name)
				else
					local X = if UseRefResult.current and UseRefResult.current.AbsoluteSize then UseRefResult.current.AbsoluteSize.X else 0
					local ShouldShowSubcategories = p1.selectedCategoryId == category.Id and p1.shouldShowSubcategories
					local NewX = if ShouldShowSubcategories then X + XSmall else v1
					Elements[category.Id] = ReactModule.createElement(AnimatedCategoryPill, {
						catInfo = category,
						pillIndex = PillIndex,
						isSelected = p1.selectedCategoryId == category.Id,
						shouldShowSubcategories = p1.shouldShowSubcategories,
						closeButtonWidth = X,
						targetX = NewX,
						renderCategoryPill = UseResult1,
						onRef = function(p2)
							-- upvalues: UseRefResult1 (upval), category (copy)
							if p2 then
								UseRefResult1.current[category.Id] = p2
							end
						end
					})
					local X1 = if UseRefResult1.current[category.Id] and UseRefResult1.current[category.Id].AbsoluteSize then UseRefResult1.current[category.Id].AbsoluteSize.X else 0
					v1 = v1 + XSmall + X1
					
					if ShouldShowSubcategories then
						UseRefResult2.current = NewX + XSmall + X1
					end
					PillIndex += 1
				end
			end
			return Elements
		end)())),
		SubcategoriesFrame = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy",
			BackgroundTransparency = 1,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, UseRefResult2.current, 0.5, 0),
			Size = UDim2.new(0, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.X,
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, XSmall),
				SortOrder = Enum.SortOrder.LayoutOrder
			}
		}, ((function()
			-- upvalues: SubcategoriesState (copy), MutedErrorModule (upval), ReactModule (upval), AnimatedSubcategoryPill (upval), UseResult1 (copy), IsFadingOut (copy)
			local Elements = {}
			local PillIndex = 3
			
			for _, Subcategory in SubcategoriesState do
				if Subcategory.Id == nil then
					MutedErrorModule("AnimatedPillsScrollableContent: Selected subcategory does not have an ID" .. Subcategory.Name)
				else
					Elements[Subcategory.Id] = ReactModule.createElement(AnimatedSubcategoryPill, {
						subcategory = Subcategory,
						pillIndex = PillIndex,
						renderCategoryPill = UseResult1,
						isFadingOut = IsFadingOut,
						isSelectable = not IsFadingOut
					})
					PillIndex += 1
				end
			end
			return Elements
		end)()))
	})
end