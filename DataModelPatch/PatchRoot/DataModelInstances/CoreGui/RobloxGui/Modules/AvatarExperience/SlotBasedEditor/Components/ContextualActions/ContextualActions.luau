local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceControlBarModule = require(CorePackages.Workspace.Packages.AvatarExperienceControlBar)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local CatalogCategories = AvatarExperienceCommonModule.Enums.CatalogCategories
local CatalogSubcategories = AvatarExperienceCommonModule.Enums.CatalogSubcategories
local ContextualActionButton = AvatarExperienceCommonModule.Components.ContextualActionButton
local ColorGradientCircle = AvatarExperienceCommonModule.Components.ColorGradientCircle
local SlotBasedEditorAnalytics = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics
local SelectOutfitTryOnMostRecentAssetIdModule = require(Modules.AvatarExperience.Common.Selectors.SelectOutfitTryOnMostRecentAssetId)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local IconOnlyMenu = AvatarExperienceControlBarModule.IconOnlyMenu
local MenuItemEnum = AvatarExperienceControlBarModule.Enums.MenuItemEnum
local IconName = FoundationModule.Enums.IconName
local AXTooltip = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).AXTooltipComponents.AXTooltip
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseMakeupLayeringTooltipFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Hooks.useMakeupLayeringTooltip
local FFlagAXShowHeadAdjustmentInRightControlBar = AvatarExperienceFlagsModule.FFlagAXShowHeadAdjustmentInRightControlBar
local FFlagAXMigrateBuilderIcons = AvatarExperienceFlagsModule.FFlagAXMigrateBuilderIcons
local FFlagDynamicHeadsMigration = AvatarExperienceFlagsModule.FFlagDynamicHeadsMigration
local FFlagAXMakeupEquipping = AvatarExperienceFlagsModule.FFlagAXMakeupEquipping
local FFlagHeadRefinementFacialAnimationToggle = AvatarExperienceFlagsModule.FFlagHeadRefinementFacialAnimationToggle
local FFlagAXMakeupLayeringTooltipFTUX = AvatarExperienceFlagsModule.FFlagAXMakeupLayeringTooltipFTUX
local AXFixContextualButtonVisibilityLogic = game:DefineFastFlag("AXFixContextualButtonVisibilityLogic", false)
local AXFixDynamicHeadsContextualButtonVisibilityLogic = game:DefineFastFlag("AXFixDynamicHeadsContextualButtonVisibilityLogic", false)
local SelectColorAdjustmentButtonColor = AvatarExperienceCommonModule.State.Selectors.selectColorAdjustmentButtonColor
local SelectShowColorQuickButton = if AvatarExperienceFlagsModule.FFlagAXColorAdjustmentButtonShouldAccountForTryOns then AvatarExperienceCommonModule.State.Selectors.selectShowColorQuickButton else require(Modules.AvatarExperience.Common.Selectors.selectShowColorQuickButton)
local SelectCurrentAvatarEditorCategoryFunction = AvatarExperienceCommonModule.State.Selectors.selectCurrentAvatarEditorCategory
local SelectHasMakeupTryOn = AvatarExperienceCommonModule.State.Selectors.selectHasMakeupTryOn
local SelectTotalLayeredMakeupAssets = AvatarExperienceCommonModule.State.Selectors.selectTotalLayeredMakeupAssets
local SelectIsInMakeupCategoryWithMultipleItemsModule = require(Modules.AvatarExperience.Common.Selectors.selectIsInMakeupCategoryWithMultipleItems)
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local AvatarEditorSubcategories = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.AvatarEditorSubcategories
local SetSelectedAccessoryModule = require(Modules.AvatarExperience.AccessoryAdjustment.Actions.SetSelectedAccessory)
local SetEntryPageModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetEntryPage)
local GetFFlagAXFixAccessoryAdjustmentAnalyticsEntryPageModule = require(Modules.AvatarExperience.Flags.GetFFlagAXFixAccessoryAdjustmentAnalyticsEntryPage)
local AXEnableAccessoryAdjustmentDuringTryOnIXP = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP
local UseAccessoryAdjustmentQuickButtonDuringTryOnModule = require(Modules.AvatarExperience.Common.Hooks.useAccessoryAdjustmentQuickButtonDuringTryOn)
local MINMAKEUPITEMSFORLAYERINGBUTTON = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Constants.MIN_MAKEUP_ITEMS_FOR_LAYERING_BUTTON

local function selectDeviceOrientation(p1)
	return p1.DeviceOrientation
end

local function selectIsInHeadsSubcategory(p1): boolean
	-- upvalues: SelectCurrentAvatarEditorCategoryFunction (copy), GetAvatarEditorCategoriesModule (copy), AvatarEditorSubcategories (copy)
	local AvatarEditorCategoriesModuleEntry = GetAvatarEditorCategoriesModule()[SelectCurrentAvatarEditorCategoryFunction(p1)]
	
	if not AvatarEditorCategoriesModuleEntry or not AvatarEditorCategoriesModuleEntry.Subcategories then
		return false
	end
	local Subcategory = p1.AvatarExperience.AvatarEditor.Categories.subcategory
	
	if Subcategory then
		local Subcategory1 = AvatarEditorCategoriesModuleEntry.Subcategories[Subcategory]
		
		return Subcategory1 ~= nil and Subcategory1.Id == AvatarEditorSubcategories.Heads
	else
		return false
	end
end

local function selectEquippedDynamicHeadAndTryOnBundle(p1)
	-- upvalues: ConstantsModule (copy), SelectOutfitTryOnMostRecentAssetIdModule (copy), FFlagDynamicHeadsMigration (copy), FFlagHeadRefinementFacialAnimationToggle (copy)
	local NextEntry = nil
	local EquippedDynamicHeadInfo = nil
	local EquippedAssets = p1.AvatarExperience and (p1.AvatarExperience.AvatarEditor and (p1.AvatarExperience.AvatarEditor.Character and p1.AvatarExperience.AvatarEditor.Character.EquippedAssets))
	
	if EquippedAssets and EquippedAssets[ConstantsModule.AssetTypeIdStrings.DynamicHead] then
		NextEntry = next(EquippedAssets[ConstantsModule.AssetTypeIdStrings.DynamicHead])
	end
	local AssetInfos = p1.AvatarExperience and (p1.AvatarExperience.Common and p1.AvatarExperience.Common.AssetInfos)
	
	if NextEntry and AssetInfos then
		EquippedDynamicHeadInfo = AssetInfos[NextEntry]
	end
	local SelectOutfitTryOnMostRecentAssetIdModuleResult, _ = SelectOutfitTryOnMostRecentAssetIdModule(p1, ConstantsModule.AssetTypeIdStrings.DynamicHead)
	local AssetInfo = if SelectOutfitTryOnMostRecentAssetIdModuleResult and AssetInfos then AssetInfos[SelectOutfitTryOnMostRecentAssetIdModuleResult] else nil
	local SupportsHeadShapes = false
	
	if FFlagDynamicHeadsMigration then
		local TryOnItems = p1.AvatarExperience.AvatarScene.OutfitTryOn and p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
		local ItemId = nil
		local v1 = nil
		
		if TryOnItems and SelectOutfitTryOnMostRecentAssetIdModuleResult then
			for _, tryOnItem in TryOnItems do
				if tryOnItem.itemType == ConstantsModule.ItemType.Bundle and tryOnItem.bundleInfo then
					if tryOnItem.bundleInfo[SelectOutfitTryOnMostRecentAssetIdModuleResult] then
						ItemId = tryOnItem.itemId
						v1 = tryOnItem
						break
					end
				elseif tryOnItem.itemType == ConstantsModule.ItemType.Asset and tryOnItem.itemId == SelectOutfitTryOnMostRecentAssetIdModuleResult then
					ItemId = tryOnItem.itemId
					v1 = tryOnItem
					break
				end
			end
		end
		local BundleInfos = p1.AvatarExperience and (p1.AvatarExperience.Common and p1.AvatarExperience.Common.BundleInfos)
		local BundleInfo = if ItemId and BundleInfos then BundleInfos[ItemId] else nil
		local Flag: boolean? = nil
		
		if v1 and v1.itemSubType == ConstantsModule.BundleTypeIdStrings.DynamicHead and v1.bundleInfo then
			for i, _ in v1.bundleInfo do
				local AssetInfo1 = if AssetInfos then AssetInfos[i] else nil
				
				if AssetInfo1 and AssetInfo1.supportsHeadShapes == true then
					Flag = true
					break
				end
			end
		end
		if AssetInfo and AssetInfo.supportsHeadShapes ~= nil then
			SupportsHeadShapes = AssetInfo.supportsHeadShapes
		elseif BundleInfo and BundleInfo.supportsHeadShapes ~= nil then
			SupportsHeadShapes = BundleInfo.supportsHeadShapes
		elseif Flag == nil then
			if SelectOutfitTryOnMostRecentAssetIdModuleResult == nil and EquippedDynamicHeadInfo and EquippedDynamicHeadInfo.supportsHeadShapes ~= nil then
				SupportsHeadShapes = EquippedDynamicHeadInfo.supportsHeadShapes
			end
		else
			SupportsHeadShapes = Flag
		end
	elseif AssetInfo then
		SupportsHeadShapes = AssetInfo.supportsHeadShapes ~= nil and AssetInfo.supportsHeadShapes
	elseif EquippedDynamicHeadInfo then
		SupportsHeadShapes = EquippedDynamicHeadInfo.supportsHeadShapes ~= nil and EquippedDynamicHeadInfo.supportsHeadShapes
	end
	return {
		equippedDynamicHeadId = NextEntry,
		equippedDynamicHeadInfo = EquippedDynamicHeadInfo,
		tryOnAssetId = SelectOutfitTryOnMostRecentAssetIdModuleResult,
		tryOnDynamicHeadAssetInfo = AssetInfo,
		supportsHeadShapes = SupportsHeadShapes,
		hasDynamicHead = if FFlagHeadRefinementFacialAnimationToggle then NextEntry ~= nil or SelectOutfitTryOnMostRecentAssetIdModuleResult ~= nil else nil
	}
end

return ReactModule.memo(ReactModule.forwardRef(function(Frame)
	-- upvalues: UseTokensFunction (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseDispatchFunction (copy), AXFixContextualButtonVisibilityLogic (copy), GetCatalogCategoriesStoreModule (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), SelectColorAdjustmentButtonColor (copy), SelectShowColorQuickButton (copy), AXEnableAccessoryAdjustmentDuringTryOnIXP (copy), UseAccessoryAdjustmentQuickButtonDuringTryOnModule (copy), FFlagAXShowHeadAdjustmentInRightControlBar (copy), selectEquippedDynamicHeadAndTryOnBundle (copy), selectIsInHeadsSubcategory (copy), FFlagAXMakeupEquipping (copy), SelectHasMakeupTryOn (copy), SelectTotalLayeredMakeupAssets (copy), SelectIsInMakeupCategoryWithMultipleItemsModule (copy), AXFixDynamicHeadsContextualButtonVisibilityLogic (copy), AvatarScreen (copy), MINMAKEUPITEMSFORLAYERINGBUTTON (copy), CatalogCategories (copy), FFlagAXMakeupLayeringTooltipFTUX (copy), UseLocalizationFunction (copy), UseMakeupLayeringTooltipFunction (copy), selectDeviceOrientation (copy), ResponsiveModule (copy), ReactModule (copy), SlotBasedEditorAnalytics (copy), MenuItemEnum (copy), FFlagHeadRefinementFacialAnimationToggle (copy), CatalogSubcategories (copy), FoundationModule (copy), ContextualActionButton (copy), ColorGradientCircle (copy), IconOnlyMenu (copy), FFlagAXMigrateBuilderIcons (copy), IconName (copy), AXTooltip (copy), GetFFlagAXFixAccessoryAdjustmentAnalyticsEntryPageModule (copy), SetEntryPageModule (copy), SetSelectedAccessoryModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseDispatchResult = UseDispatchFunction()
	local v2 = nil
	local v3 = nil
	
	if AXFixContextualButtonVisibilityLogic then
		local CatalogSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
		v2 = UseSignalStateFunction(CatalogSelectionStore.selectedCategoryId)
		v3 = UseSignalStateFunction(CatalogSelectionStore.selectedSubcategoryId)
	end
	local UseSelectorResult = UseSelectorFunction(SelectColorAdjustmentButtonColor)
	local UseSelectorResult1 = UseSelectorFunction(SelectShowColorQuickButton)
	local ShouldEnableAccessoryAdjustmentDuringTryOn = nil
	local AdjustableLastTryOnItemId = nil
	local AccessoryAdjustmentQuickButtonFtux = nil
	
	if AXEnableAccessoryAdjustmentDuringTryOnIXP.isEnabled() then
		local UseAccessoryAdjustmentQuickButtonDuringTryOnModuleResult = UseAccessoryAdjustmentQuickButtonDuringTryOnModule()
		ShouldEnableAccessoryAdjustmentDuringTryOn = UseAccessoryAdjustmentQuickButtonDuringTryOnModuleResult.shouldEnableAccessoryAdjustmentDuringTryOn
		AdjustableLastTryOnItemId = UseAccessoryAdjustmentQuickButtonDuringTryOnModuleResult.adjustableLastTryOnItemId
		AccessoryAdjustmentQuickButtonFtux = UseAccessoryAdjustmentQuickButtonDuringTryOnModuleResult.accessoryAdjustmentQuickButtonFtux
	end
	local UseSelectorResult2 = if FFlagAXShowHeadAdjustmentInRightControlBar then UseSelectorFunction(selectEquippedDynamicHeadAndTryOnBundle) else nil
	local UseSelectorResult3 = if FFlagAXShowHeadAdjustmentInRightControlBar then UseSelectorFunction(selectIsInHeadsSubcategory) else nil
	local UseSelectorResult4 = if FFlagAXMakeupEquipping then UseSelectorFunction(SelectHasMakeupTryOn) else false
	local UseSelectorResult5 = if FFlagAXMakeupEquipping then UseSelectorFunction(SelectTotalLayeredMakeupAssets) else nil
	local UseSelectorResult6 = if FFlagAXMakeupEquipping then UseSelectorFunction(SelectIsInMakeupCategoryWithMultipleItemsModule) else false
	local IsNameMatch: boolean = if FFlagAXMakeupEquipping or AXFixDynamicHeadsContextualButtonVisibilityLogic then UseAvatarRouteResult.opaque.name == AvatarScreen.AvatarEditor else false
	local IsMINMAKEUPITEMSFORLAYERINGBUTTONBelow = if FFlagAXMakeupEquipping then UseSelectorResult4 and MINMAKEUPITEMSFORLAYERINGBUTTON <= UseSelectorResult5 else nil
	local IsMINMAKEUPITEMSFORLAYERINGBUTTONBelow1 = nil
	
	if AXFixContextualButtonVisibilityLogic then
		local IsRawValueResultMatch = v2 == CatalogCategories.Makeup:rawValue()
		IsMINMAKEUPITEMSFORLAYERINGBUTTONBelow1 = if FFlagAXMakeupEquipping then IsRawValueResultMatch and IsMINMAKEUPITEMSFORLAYERINGBUTTONBelow or IsNameMatch and UseSelectorResult6 else false
	else
		IsMINMAKEUPITEMSFORLAYERINGBUTTONBelow1 = if FFlagAXMakeupEquipping then IsMINMAKEUPITEMSFORLAYERINGBUTTONBelow or IsNameMatch and UseSelectorResult6 else false
	end
	local UseLocalizationResult = if FFlagAXMakeupLayeringTooltipFTUX then UseLocalizationFunction({
		makeupLayeringTooltipText = "Feature.Avatar.Text.MakeupLayeringTooltip"
	}) else nil
	local UseMakeupLayeringTooltipResult = if FFlagAXMakeupLayeringTooltipFTUX then UseMakeupLayeringTooltipFunction(IsMINMAKEUPITEMSFORLAYERINGBUTTONBelow1) else nil
	local Left: string? = nil
	
	if FFlagAXMakeupLayeringTooltipFTUX then
		local IsUseSelectorResultMatch = UseSelectorFunction(selectDeviceOrientation) == ResponsiveModule.Keys.Portrait
		Left = if IsUseSelectorResultMatch then "Left" else "Right"
	end
	local UseResult = if FFlagAXMakeupEquipping then ReactModule.useCallback(function()
		-- upvalues: FFlagAXMakeupLayeringTooltipFTUX (upval), UseMakeupLayeringTooltipResult (copy), UseNavigationResult (copy), AvatarScreen (upval), UseAvatarRouteResult (copy), SlotBasedEditorAnalytics (upval), MenuItemEnum (upval)
		if FFlagAXMakeupLayeringTooltipFTUX then
			UseMakeupLayeringTooltipResult.dismissTooltip()
		end
		UseNavigationResult.navigate(AvatarScreen.LayeredMakeupSort)
		
		if UseAvatarRouteResult and UseAvatarRouteResult.opaque then
			SlotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(MenuItemEnum.AvatarRefinement.MakeupLayers, UseAvatarRouteResult.opaque.name)
		end
	end, {
		UseNavigationResult,
		UseAvatarRouteResult,
		if FFlagAXMakeupLayeringTooltipFTUX then UseMakeupLayeringTooltipResult else nil
	}) else nil
	local UseResult1 = if FFlagAXShowHeadAdjustmentInRightControlBar then ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), UseAvatarRouteResult (copy), SlotBasedEditorAnalytics (upval), MenuItemEnum (upval)
		UseNavigationResult.navigate(AvatarScreen.HeadRefinement)
		
		if UseAvatarRouteResult and UseAvatarRouteResult.opaque then
			SlotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(MenuItemEnum.AvatarRefinement.CustomizeHead, UseAvatarRouteResult.opaque.name)
		end
	end, { UseNavigationResult, UseAvatarRouteResult }) else nil
	local v4 = nil
	
	if FFlagAXShowHeadAdjustmentInRightControlBar then
		local HasDynamicHead = if FFlagHeadRefinementFacialAnimationToggle then UseSelectorResult2 and UseSelectorResult2.hasDynamicHead else UseSelectorResult2 and UseSelectorResult2.supportsHeadShapes or false
		local HasDynamicHead1 = UseSelectorResult3 and HasDynamicHead
		local HasTryOnAssetId: boolean = UseSelectorResult2 and UseSelectorResult2.tryOnAssetId ~= nil
		
		if AXFixDynamicHeadsContextualButtonVisibilityLogic then
			v4 = HasDynamicHead1 and IsNameMatch
		elseif AXFixContextualButtonVisibilityLogic then
			local IsRawValueResultMatch = v3 == CatalogSubcategories.Heads:rawValue()
			v4 = HasDynamicHead1 or HasTryOnAssetId and IsRawValueResultMatch
		else
			v4 = HasDynamicHead1 or HasTryOnAssetId
		end
	end
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col gap-small auto-xy",
		LayoutOrder = Frame.LayoutOrder
	}, {
		SkinColorButton = if UseSelectorResult1 and UseSelectorResult then ReactModule.createElement(ContextualActionButton, {
			LayoutOrder = 1,
			Selectable = true,
			size = UDim.new(0, UseTokensResult.Size.Size_1100),
			onActivated = function()
				-- upvalues: UseNavigationResult (copy), AvatarScreen (upval)
				UseNavigationResult.navigate(AvatarScreen.ColorAdjustment)
			end
		}, ReactModule.createElement(ColorGradientCircle, {
			Colors = { UseSelectorResult },
			Size = UDim2.fromOffset(UseTokensResult.Size.Size_500, UseTokensResult.Size.Size_500),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		})) else nil,
		HeadAdjustmentButton = if FFlagAXShowHeadAdjustmentInRightControlBar and v4 then ReactModule.createElement(IconOnlyMenu, {
			LayoutOrder = 3,
			items = {
				{
					type = "icon",
					id = MenuItemEnum.AvatarRefinement.CustomizeHead,
					icon = if FFlagAXMigrateBuilderIcons then IconName.HeadBlank else "icons/menu/clothing/classicHead_off",
					iconSize = UseTokensResult.Size.Size_600,
					onActivated = UseResult1
				}
			}
		}) else nil,
		MakeupLayering = if FFlagAXMakeupEquipping and IsMINMAKEUPITEMSFORLAYERINGBUTTONBelow1 then ReactModule.createElement(FoundationModule.View, { tag = "auto-xy", LayoutOrder = 2 }, {
			MakeupLayeringButton = ReactModule.createElement(IconOnlyMenu, {
				items = {
					{
						type = "icon",
						id = MenuItemEnum.AvatarRefinement.MakeupLayers,
						icon = if FFlagAXMigrateBuilderIcons then IconName.LipsLipstickMakeupBrush else "icons/menu/clothing/eyelash_off",
						iconSize = UseTokensResult.Size.Size_600,
						onActivated = UseResult
					}
				}
			}),
			MakeupLayeringTooltip = if FFlagAXMakeupLayeringTooltipFTUX then ReactModule.createElement(AXTooltip, {
				isOpen = UseMakeupLayeringTooltipResult.showTooltip,
				popoverSide = Left,
				tooltipText = UseLocalizationResult.makeupLayeringTooltipText,
				onTooltipActivated = UseMakeupLayeringTooltipResult.dismissTooltip
			}) else nil
		}) else nil,
		AccessoryAdjustmentButton = if ShouldEnableAccessoryAdjustmentDuringTryOn and UseAvatarRouteResult.opaque.name == AvatarScreen.Catalog and AdjustableLastTryOnItemId then ReactModule.createElement(ContextualActionButton, {
			LayoutOrder = 4,
			Selectable = true,
			GroupTransparencyOverwrite = 0,
			size = UDim.new(0, UseTokensResult.Size.Size_1100),
			onActivated = function()
				-- upvalues: AccessoryAdjustmentQuickButtonFtux (ref), GetFFlagAXFixAccessoryAdjustmentAnalyticsEntryPageModule (upval), UseDispatchResult (copy), SetEntryPageModule (upval), UseAvatarRouteResult (copy), UseNavigationResult (copy), AvatarScreen (upval), SetSelectedAccessoryModule (upval), AdjustableLastTryOnItemId (ref)
				if AccessoryAdjustmentQuickButtonFtux and AccessoryAdjustmentQuickButtonFtux.shouldShowFirstTimeGlow() then
					AccessoryAdjustmentQuickButtonFtux.completeFirstTimeGlow()
				end
				if GetFFlagAXFixAccessoryAdjustmentAnalyticsEntryPageModule() then
					UseDispatchResult(SetEntryPageModule(UseAvatarRouteResult.opaque.name))
				end
				UseNavigationResult.navigate(AvatarScreen.AdjustAccessoryView, { fromRoute = UseAvatarRouteResult.opaque.name })
				UseDispatchResult(SetSelectedAccessoryModule(AdjustableLastTryOnItemId))
			end,
			enableFocusAnimation = AccessoryAdjustmentQuickButtonFtux and AccessoryAdjustmentQuickButtonFtux.shouldShowFirstTimeGlow()
		}, {
			Icon = ReactModule.createElement(FoundationModule.View, {
				Visible = true,
				tag = "radius-circle position-center-center anchor-center-center clip",
				Size = UDim2.fromScale(1, 1)
			}, {
				IconImage = ReactModule.createElement(FoundationModule.Image, {
					Image = "icons/menu/transform",
					tag = "position-center-center anchor-center-center radius-circle content-emphasis",
					Size = UDim2.fromOffset(UseTokensResult.Size.Size_800, UseTokensResult.Size.Size_800),
					imageStyle = {
						Color3 = UseTokensResult.Color.Content.Emphasis.Color3,
						Transparency = UseTokensResult.Color.Content.Emphasis.Transparency
					}
				})
			})
		}) else nil
	})
end))