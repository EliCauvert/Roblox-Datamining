local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local FitFrameHorizontal = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameHorizontal
local UseInputTypeFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useInputType
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseFocusGuiObjectFunction = require(CorePackages.Packages.ReactFocusNavigation).useFocusGuiObject
local ScrollingListWithArrowsAndGradientModule = require(Modules.AvatarExperience.Common.Components.ScrollingListWithArrowsAndGradient)
local ConstantsModule = require(Modules.LuaApp.Constants)
local NavHighlightModule = require(Modules.AvatarExperience.Common.Components.NavBar.NavHighlight)
local DEPRECATEDCategoryButtonModule = require(Modules.AvatarExperience.Common.Components.NavBar.DEPRECATED_CategoryButton)
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule2 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local FindValueKeyInRefCacheFunction = AvatarExperienceCommonModule.Utils.RoactGamepadMigration.findValueKeyInRefCache
local UseTableWrappedCallbackRefFunction = AvatarExperienceCommonModule.Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXMigrateMainNavigationInputBindings = AvatarExperienceFlagsModule.FFlagAXMigrateMainNavigationInputBindings
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local UseTabNavigationFocusNavigationBindingsModule = require(script.Parent.useTabNavigationFocusNavigationBindings)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXEnableEditorCategoryDeepLink = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXEnableEditorCategoryDeepLink
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3gAvatarExperience then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local FFlagAXCategoryUnifiedLogging = AvatarExperienceFlagsModule.FFlagAXCategoryUnifiedLogging
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local SendUnifiedEventLogForInstanceFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventLogForInstance
local AvatarScreenProperties = AvatarExperienceNavigationModule.AvatarRoute.AvatarScreenProperties
local FFlagAXRemoveCatalogCategoryNavKey = AvatarExperienceFlagsModule.FFlagAXRemoveCatalogCategoryNavKey
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXCatalogCategoryTooltip = AvatarExperienceFlagsModule.FFlagAXCatalogCategoryTooltip
local FFlagAXMigrateCategoryTooltip = AvatarExperienceFlagsModule.FFlagAXMigrateCategoryTooltip
local FFlagAXMoveCatalogFilterToL1Navigation = AvatarExperienceFlagsModule.FFlagAXMoveCatalogFilterToL1Navigation
local FFlagAXReduceCatalogFilterWidth = AvatarExperienceFlagsModule.FFlagAXReduceCatalogFilterWidth

return ReactModule.memo((ReactModule.forwardRef(function(Gui, Ref)
	-- upvalues: ReactModule (copy), RoactGamepadModule (copy), UseTokensFunction (copy), UseInputTypeFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), FFlagSignalsNavP3gAvatarExperience (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), AvatarScreenProperties (copy), FFlagAXCategoryUnifiedLogging (copy), UseSelectorFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), UseFocusGuiObjectFunction (copy), FFlagAXMigrateMainNavigationInputBindings (copy), FindValueKeyInRefCacheFunction (copy), GuiService (copy), UseTabNavigationFocusNavigationBindingsModule (copy), UseTableWrappedCallbackRefFunction (copy), GetUseSelectorDeepEqualsFunction (copy), FFlagAXEnableEditorCategoryDeepLink (copy), GetAvatarEditorCategoriesModule (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), UtilsModule (copy), ConstantsModule2 (copy), ConstantsModule1 (copy), Focusable (copy), DEPRECATEDCategoryButtonModule (copy), FFlagAXCatalogCategoriesSDUI (copy), SendUnifiedEventLogForInstanceFunction (copy), UnifiedEventLogEnums (copy), FFlagAXRemoveCatalogCategoryNavKey (copy), AvatarScreen (copy), FFlagAXMigrateCategoryTooltip (copy), FFlagAXCatalogCategoryTooltip (copy), FFlagAXMoveCatalogFilterToL1Navigation (copy), FFlagAXReduceCatalogFilterWidth (copy), ConstantsModule (copy), FoundationModule (copy), FitFrameHorizontal (copy), NavHighlightModule (copy), CatalogUtilsModule (copy), ScrollingListWithArrowsAndGradientModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseRefCacheResult1 = RoactGamepadModule.useRefCache()
	local UseRefResult = ReactModule.useRef(nil)
	local UseTokensResult = UseTokensFunction()
	local UseInputTypeResult = UseInputTypeFunction()
	local UseFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.useFocusController()
	local UnifiedLoggingSurface = nil
	
	if FFlagSignalsNavP3gAvatarExperience then
		local UseSignalStateResult = UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentRoute)
		local AvatarScreenProperty = UseSignalStateResult and AvatarScreenProperties[UseSignalStateResult.routeName]
		UnifiedLoggingSurface = if FFlagAXCategoryUnifiedLogging and AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil
	else
		UnifiedLoggingSurface = UseSelectorFunction(function(p1)
			-- upvalues: FFlagAXCategoryUnifiedLogging (upval), FFlagUseNavigationSelectors (upval), Selectors (upval), AvatarScreenProperties (upval)
			if FFlagAXCategoryUnifiedLogging then
				local SelectCurrentRoactNavigationRouteResult = if FFlagUseNavigationSelectors then Selectors.selectCurrentRoactNavigationRoute(p1) else p1.Navigation and p1.Navigation.currentRoute
				local AvatarScreenProperty = SelectCurrentRoactNavigationRouteResult and AvatarScreenProperties[SelectCurrentRoactNavigationRouteResult.routeName]
				
				return if AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil
			else
				return nil
			end
		end)
	end
	local UseFocusGuiObjectResult = if FFlagAXMigrateAXToGlobalAutofocus then UseFocusGuiObjectFunction() else nil
	local UseTableWrappedCallbackRefResult = if FFlagAXMigrateMainNavigationInputBindings then UseTableWrappedCallbackRefFunction((UseTabNavigationFocusNavigationBindingsModule({
		onTabBackward = ReactModule.useCallback(function(p1)
			-- upvalues: FindValueKeyInRefCacheFunction (upval), GuiService (upval), UseRefCacheResult (copy), FFlagAXMigrateAXToGlobalAutofocus (upval), UseFocusGuiObjectResult (copy), UseFocusControllerResult (copy)
			p1.cancelled = true
			local ValueKeyInRefCache: number = FindValueKeyInRefCacheFunction(GuiService.SelectedCoreObject, UseRefCacheResult)
			
			if ValueKeyInRefCache and ValueKeyInRefCache > 1 then
				if not FFlagAXMigrateAXToGlobalAutofocus then
					UseFocusControllerResult.moveFocusLeft()
				elseif UseFocusGuiObjectResult then
					UseFocusGuiObjectResult(UseRefCacheResult[ValueKeyInRefCache - 1].current)
					
					return
				end
			end
		end, {
			if FFlagAXMigrateAXToGlobalAutofocus then UseFocusGuiObjectResult else UseFocusControllerResult
		}),
		onTabForward = ReactModule.useCallback(function(p1)
			-- upvalues: FindValueKeyInRefCacheFunction (upval), GuiService (upval), UseRefCacheResult (copy), FFlagAXMigrateAXToGlobalAutofocus (upval), UseFocusGuiObjectResult (copy), UseFocusControllerResult (copy)
			p1.cancelled = true
			local ValueKeyInRefCache: number = FindValueKeyInRefCacheFunction(GuiService.SelectedCoreObject, UseRefCacheResult)
			
			if ValueKeyInRefCache and ValueKeyInRefCache < #UseRefCacheResult then
				if not FFlagAXMigrateAXToGlobalAutofocus then
					UseFocusControllerResult.moveFocusRight()
				elseif UseFocusGuiObjectResult then
					UseFocusGuiObjectResult(UseRefCacheResult[ValueKeyInRefCache + 1].current)
					
					return
				end
			end
		end, {
			if FFlagAXMigrateAXToGlobalAutofocus then UseFocusGuiObjectResult else UseFocusControllerResult
		}),
		onNavigateBack = ReactModule.useCallback(function(p1)
			-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (upval), UseFocusGuiObjectResult (copy), Gui (copy), UseFocusControllerResult (copy)
			p1.cancelled = true
			
			if not FFlagAXMigrateAXToGlobalAutofocus then
				UseFocusControllerResult.moveFocusUp()
			elseif UseFocusGuiObjectResult and Gui.NextSelectionUp and Gui.NextSelectionUp.current then
				UseFocusGuiObjectResult(Gui.NextSelectionUp.current)
				
				return
			end
		end, {
			if FFlagAXMigrateAXToGlobalAutofocus then UseFocusGuiObjectResult else UseFocusControllerResult,
			if FFlagAXMigrateAXToGlobalAutofocus then Gui.NextSelectionUp else nil
		})
	}, UseRefResult))) else UseRefResult
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.AvatarExperience.AvatarEditor.NewItemNotifications
	end, GetUseSelectorDeepEqualsFunction())
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
		-- upvalues: Gui (copy), UseRefCacheResult1 (copy), UseResult (copy), UseStateResult2 (copy)
		local Current = if Gui.shouldUseCategoryId then if Gui.selectedCategoryId then UseRefCacheResult1[Gui.selectedCategoryId].current else nil elseif Gui.selectedCategoryIndex then UseRefCacheResult1[Gui.selectedCategoryIndex].current else nil
		
		if Current == nil then
			return false
		else
			UseResult(Current.AbsolutePosition.X, Current.AbsoluteSize.X)
			UseStateResult2(Current)
			
			return true
		end
	end, { Gui.selectedCategoryIndex, Gui.selectedCategoryId })
	
	if not FFlagAXEnableEditorCategoryDeepLink then
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
	end
	ReactModule.useEffect(function()
		-- upvalues: UseResult1 (copy)
		UseResult1()
	end, { UseResult1 })
	local UseResult2 = ReactModule.useCallback(function(p1)
		-- upvalues: Gui (copy), GetAvatarEditorCategoriesModule (upval), GetFFlagAXEnableSlotBasedEditorModule (upval), UtilsModule (upval), UseSelectorResult (copy), ConstantsModule2 (upval), ConstantsModule1 (upval)
		if Gui.categories ~= GetAvatarEditorCategoriesModule() then
			return false
		end
		local Category = Gui.categories[p1]
		
		if GetFFlagAXEnableSlotBasedEditorModule() then
			return UtilsModule.shouldNotifyCategory(Category, UseSelectorResult)
		end
		if Category.Name == ConstantsModule2.CharacterKey or Category.Name == "Body" then
			return UseSelectorResult[ConstantsModule1.NewOutfitNotificationKey]
		end
		if Category.Name == ConstantsModule2.HeadAndBody and UseSelectorResult[ConstantsModule1.NewDHOutfitNotificationKey] then
			return true
		end
		local Subcategories = Category.Subcategories
		
		if Subcategories then
			for _, subcategory in Subcategories do
				local AssetTypeIdStrings = subcategory.AssetTypeIdStrings
				
				if AssetTypeIdStrings and UtilsModule.shouldNotifyAssetTypes(AssetTypeIdStrings, UseSelectorResult) then
					return true
				end
			end
		else
			local AssetTypeIdStrings = Category.AssetTypeIdStrings
			
			if AssetTypeIdStrings and UtilsModule.shouldNotifyAssetTypes(AssetTypeIdStrings, UseSelectorResult) then
				return true
			end
		end
		return false
	end, { Gui.categories, UseSelectorResult })
	local UseResult3 = ReactModule.useCallback(function(CategoryIndex: number, p2)
		-- upvalues: Gui (copy), ReactModule (upval), Focusable (upval), DEPRECATEDCategoryButtonModule (upval), FFlagAXCatalogCategoriesSDUI (upval), UseResult2 (copy), UseRefCacheResult1 (copy), FFlagAXCategoryUnifiedLogging (upval), UseRefCacheResult (copy), SendUnifiedEventLogForInstanceFunction (upval), UnifiedEventLogEnums (upval), UnifiedLoggingSurface (ref), FFlagAXMigrateAXToGlobalAutofocus (upval), FFlagAXMigrateMainNavigationInputBindings (upval), UseFocusControllerResult (copy), RoactGamepadModule (upval), FFlagAXRemoveCatalogCategoryNavKey (upval), AvatarScreen (upval), FFlagAXMigrateCategoryTooltip (upval), FFlagAXCatalogCategoryTooltip (upval)
		return ReactModule.createElement(Focusable[DEPRECATEDCategoryButtonModule], {
			categoryIndex = CategoryIndex,
			categoryId = p2.Id,
			categoryTitle = p2.Title,
			localizedCategoryTitle = if FFlagAXCatalogCategoriesSDUI then p2.LocalizedTitle else nil,
			layoutOrder = CategoryIndex,
			isSelected = if Gui.shouldUseCategoryId then Gui.selectedCategoryId == p2.Id else Gui.selectedCategoryIndex == CategoryIndex,
			hasNewItemNotification = UseResult2(CategoryIndex),
			frameRef = UseRefCacheResult1[if Gui.shouldUseCategoryId then p2.Id else CategoryIndex],
			onActivate = function()
				-- upvalues: FFlagAXCategoryUnifiedLogging (upval), UseRefCacheResult (upval), CategoryIndex (copy), SendUnifiedEventLogForInstanceFunction (upval), UnifiedEventLogEnums (upval), p2 (copy), UnifiedLoggingSurface (upval), Gui (upval)
				if FFlagAXCategoryUnifiedLogging then
					local UseRefCacheResultEntry = UseRefCacheResult[CategoryIndex]
					
					if UseRefCacheResultEntry and UseRefCacheResultEntry.current then
						SendUnifiedEventLogForInstanceFunction(UseRefCacheResultEntry.current, {
							action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
							elementName = "SELECT_CATEGORY_" .. string.upper(p2.Name),
							surface = UnifiedLoggingSurface
						})
					end
				end
				if Gui.shouldUseCategoryId and Gui.selectCategoryId then
					Gui.selectCategoryId(p2.Id)
					
					return
				else
					Gui.selectCategory(CategoryIndex)
				end
			end,
			ref = UseRefCacheResult[CategoryIndex],
			NextSelectionLeft = if CategoryIndex > 1 then UseRefCacheResult[CategoryIndex - 1] else nil,
			NextSelectionRight = if CategoryIndex < #Gui.categories then UseRefCacheResult[CategoryIndex + 1] else nil,
			inputBindings = if FFlagAXMigrateAXToGlobalAutofocus or FFlagAXMigrateMainNavigationInputBindings then nil elseif UseFocusControllerResult == nil then nil else {
				ShiftLeft = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonL1, function()
					-- upvalues: CategoryIndex (copy), UseFocusControllerResult (upval)
					if CategoryIndex > 1 then
						UseFocusControllerResult.moveFocusLeft()
					end
				end),
				ShiftRight = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonR1, function()
					-- upvalues: CategoryIndex (copy), Gui (upval), UseFocusControllerResult (upval)
					if CategoryIndex < #Gui.categories then
						UseFocusControllerResult.moveFocusRight()
					end
				end)
			},
			navigationKey = if FFlagAXRemoveCatalogCategoryNavKey then nil else p2.NavigationKey,
			navBarHeight = Gui.navHeight,
			avatarScreenOfOrigin = AvatarScreen.Catalog,
			categoryTooltipKey = if FFlagAXMigrateCategoryTooltip or FFlagAXCatalogCategoryTooltip then p2.TooltipKey else nil,
			categoryTooltipLocalizationKey = if FFlagAXMigrateCategoryTooltip then p2.TooltipLocalizationKey else nil,
			categoryLocalizedTooltipBody = if FFlagAXCatalogCategoriesSDUI then p2.TooltipBody else nil
		})
	end, {
		Gui.selectedCategoryIndex, Gui.selectedCategoryId, UseResult2,
		Gui.selectCategory, Gui.selectCategoryId, Gui.shouldUseCategoryId,
		Gui.categories,
		if FFlagAXMigrateAXToGlobalAutofocus then nil else UseFocusControllerResult
	})
	local UseResult4 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current.CanvasSize = UDim2.new(0, Frame.AbsoluteSize.X, 1, 0)
		end
	end, {})
	local Size1300 = nil
	local Size600 = nil
	
	if FFlagAXMoveCatalogFilterToL1Navigation then
		Size1300 = if FFlagAXReduceCatalogFilterWidth then UseTokensResult.Size.Size_1300 else UseTokensResult.Size.Size_1400
		Size600 = UseTokensResult.Size.Size_600
	end
	return ReactModule.createElement(Focusable.Frame, {
		ClipsDescendants = true,
		BorderSizePixel = 0,
		BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = UseTokensResult.Color.Surface.Surface_0.Transparency,
		LayoutOrder = Gui.layoutOrder,
		Size = UDim2.new(1, 0, 0, Gui.navHeight),
		ZIndex = Gui.zIndex,
		ref = Ref,
		NextSelectionUp = Gui.NextSelectionUp,
		NextSelectionDown = Gui.NextSelectionDown,
		defaultChild = UseRefCacheResult[if Gui.shouldUseCategoryId then CatalogUtilsModule.findCategoryIndexById(Gui.categories, Gui.selectedCategoryId) else Gui.selectedCategoryIndex]
	}, {
		ScrollingListWithArrowsAndGradient = ReactModule.createElement(ScrollingListWithArrowsAndGradientModule, {
			buttonPadding = 0,
			getScollingListContent = ReactModule.useCallback(function()
				-- upvalues: UseInputTypeResult (copy), ConstantsModule (upval), Gui (copy), UseResult3 (copy), FFlagAXMoveCatalogFilterToL1Navigation (upval), ReactModule (upval), FoundationModule (upval), Size1300 (ref), Size600 (ref), UseRefCacheResult1 (copy), Focusable (upval), FitFrameHorizontal (upval), UseResult4 (copy), FFlagAXMigrateAXToGlobalAutofocus (upval), FFlagAXMigrateMainNavigationInputBindings (upval), RoactGamepadModule (upval), UseFocusControllerResult (copy), NavHighlightModule (upval), UseRefResult (copy), UseStateResult (copy)
				local Inverted = not (UseInputTypeResult == ConstantsModule.InputType.Gamepad) or Gui.subcategorySelected
				local t = {}
				
				for i, category in Gui.categories do
					t[category.Name] = UseResult3(i, category)
				end
				if FFlagAXMoveCatalogFilterToL1Navigation and Gui.supportFilterButton and Gui.showFilterButton then
					t.RightPadding = ReactModule.createElement(FoundationModule.View, {
						tag = "auto-xy",
						BackgroundTransparency = 1,
						Size = UDim2.new(0, Size1300 + Size600, 1, 0),
						LayoutOrder = #Gui.categories + 1,
						ref = UseRefCacheResult1.RightPadding
					})
				end
				return {
					NavFrame = ReactModule.createElement(Focusable[FitFrameHorizontal], {
						height = UDim.new(1, 0),
						FillDirection = Enum.FillDirection.Horizontal,
						BackgroundTransparency = 1,
						[ReactModule.Change.AbsoluteSize] = UseResult4,
						inputBindings = if FFlagAXMigrateAXToGlobalAutofocus or FFlagAXMigrateMainNavigationInputBindings then nil else {
							ToTopBar = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
								-- upvalues: UseFocusControllerResult (upval)
								UseFocusControllerResult.moveFocusUp()
							end)
						}
					}, t),
					Highlight = Inverted and ReactModule.createElement(NavHighlightModule, {
						scrollingFrameRef = UseRefResult,
						useArrowHighlight = Gui.subcategorySelected,
						selectedCategoryButtonInstance = UseStateResult
					})
				}
			end, {
				UseInputTypeResult, Gui.subcategorySelected, UseResult3, UseResult4,
				if FFlagAXMigrateAXToGlobalAutofocus then nil else UseFocusControllerResult,
				UseStateResult, Gui.categories, Gui.supportFilterButton, Gui.showFilterButton,
				FFlagAXMoveCatalogFilterToL1Navigation
			}),
			listHeight = Gui.navHeight,
			scrollingFrameRef = UseTableWrappedCallbackRefResult,
			buttonRefs = UseRefCacheResult1,
			onSizeChanged = if FFlagAXEnableEditorCategoryDeepLink then UseResult1 else nil,
			backgroundColor = if FFlagAXMoveCatalogFilterToL1Navigation then UseTokensResult.Color.Surface.Surface_0.Color3 else nil,
			supportFilterButton = if FFlagAXMoveCatalogFilterToL1Navigation then Gui.supportFilterButton else nil,
			hideFilterButton = if FFlagAXMoveCatalogFilterToL1Navigation then not Gui.showFilterButton else nil,
			filterButtonWidth = if FFlagAXMoveCatalogFilterToL1Navigation then Size1300 else nil,
			filterButtonGradientWidth = if FFlagAXMoveCatalogFilterToL1Navigation then Size600 else nil
		})
	})
end)))