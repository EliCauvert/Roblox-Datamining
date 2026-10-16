local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local Parent = AvatarExperienceControlBar.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local SelectColorAdjustmentButtonColor = AvatarExperienceCommonModule.State.Selectors.selectColorAdjustmentButtonColor
local SelectHasDynamicHead = AvatarExperienceCommonModule.State.Selectors.selectHasDynamicHead
local SlotBasedEditorAnalytics = require(Parent.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local MenuItemEnumModule = require(AvatarExperienceControlBar.Enums.MenuItemEnum)
local _ = require(AvatarExperienceControlBar.ControlBarTypes)
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXMigrateBuilderIcons = AvatarExperienceFlagsModule.FFlagAXMigrateBuilderIcons
local FFlagAXHideHeadAdjustmentForDefaultHead = AvatarExperienceFlagsModule.FFlagAXHideHeadAdjustmentForDefaultHead

return function(p1) --[[ Line: 37 | Named "useAdvancedCustomizationControlBarProps" ]]
	-- upvalues: UseTokensFunction (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseSelectorFunction (copy), SelectColorAdjustmentButtonColor (copy), ReactModule (copy), AvatarScreen (copy), SlotBasedEditorAnalytics (copy), MenuItemEnumModule (copy), FFlagAXHideHeadAdjustmentForDefaultHead (copy), SelectHasDynamicHead (copy), FFlagAXMigrateBuilderIcons (copy), IconName (copy), IconVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseSelectorResult = UseSelectorFunction(SelectColorAdjustmentButtonColor)
	local Size600 = UseTokensResult.Size.Size_600
	local Name = p1.avatarRoute and (p1.avatarRoute.opaque and p1.avatarRoute.opaque.name)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 48 ]]
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), UseAvatarRouteResult (copy), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.AccessoryAdjustment)
		
		if UseAvatarRouteResult and UseAvatarRouteResult.opaque then
			SlotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(MenuItemEnumModule.AvatarRefinement.AdjustAccessory, UseAvatarRouteResult.opaque.name)
		end
	end, { UseNavigationResult, UseAvatarRouteResult })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 58 ]]
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), UseAvatarRouteResult (copy), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.BodyShape)
		
		if UseAvatarRouteResult and UseAvatarRouteResult.opaque then
			SlotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(MenuItemEnumModule.AvatarRefinement.BodyScale, UseAvatarRouteResult.opaque.name)
		end
	end, { UseNavigationResult, UseAvatarRouteResult })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 68 ]]
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), UseAvatarRouteResult (copy), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.HeadRefinement)
		
		if UseAvatarRouteResult and UseAvatarRouteResult.opaque then
			SlotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(MenuItemEnumModule.AvatarRefinement.CustomizeHead, UseAvatarRouteResult.opaque.name)
		end
	end, { UseNavigationResult, UseAvatarRouteResult })
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 78 ]]
		-- upvalues: UseAvatarRouteResult (copy), AvatarScreen (upval), UseNavigationResult (copy), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		if UseAvatarRouteResult and UseAvatarRouteResult.current and UseAvatarRouteResult.current.name == AvatarScreen.LayeredMakeupSort then
			UseNavigationResult.pop()
		end
		UseNavigationResult.navigate(AvatarScreen.LayeredClothingSort)
		
		if UseAvatarRouteResult and UseAvatarRouteResult.opaque then
			SlotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(MenuItemEnumModule.AvatarRefinement.ClothingLayers, UseAvatarRouteResult.opaque.name)
		end
	end, { UseNavigationResult, UseAvatarRouteResult })
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 93 ]]
		-- upvalues: UseAvatarRouteResult (copy), AvatarScreen (upval), UseNavigationResult (copy), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		if UseAvatarRouteResult and UseAvatarRouteResult.current and UseAvatarRouteResult.current.name == AvatarScreen.LayeredClothingSort then
			UseNavigationResult.pop()
		end
		UseNavigationResult.navigate(AvatarScreen.LayeredMakeupSort)
		
		if UseAvatarRouteResult and UseAvatarRouteResult.opaque then
			SlotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(MenuItemEnumModule.AvatarRefinement.MakeupLayers, UseAvatarRouteResult.opaque.name)
		end
	end, { UseNavigationResult, UseAvatarRouteResult })
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 108 ]]
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), UseAvatarRouteResult (copy), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.ColorAdjustment)
		
		if UseAvatarRouteResult and UseAvatarRouteResult.opaque then
			SlotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(MenuItemEnumModule.AvatarRefinement.ColorAdjustment, UseAvatarRouteResult.opaque.name)
		end
	end, { UseNavigationResult, UseAvatarRouteResult })
	local UseSelectorResult1 = if FFlagAXHideHeadAdjustmentForDefaultHead then UseSelectorFunction(SelectHasDynamicHead) else nil
	
	return {
		config = ReactModule.useMemo(function() --[[ Line: 121 ]]
			-- upvalues: MenuItemEnumModule (upval), FFlagAXMigrateBuilderIcons (upval), IconName (upval), IconVariant (upval), UseResult (copy), Name (copy), AvatarScreen (upval), Size600 (copy), UseResult1 (copy), UseResult2 (copy), FFlagAXHideHeadAdjustmentForDefaultHead (upval), UseSelectorResult1 (copy), UseResult3 (copy), UseResult4 (copy), UseSelectorResult (copy), UseResult5 (copy)
			return {
				{
					type = "icon",
					id = MenuItemEnumModule.AvatarRefinement.AdjustAccessory,
					icon = if FFlagAXMigrateBuilderIcons then IconName.HatFedora else "icons/menu/clothing/hats_off",
					activeIcon = if FFlagAXMigrateBuilderIcons then IconName.HatFedora else "icons/menu/clothing/hats_on",
					activeIconVariant = if FFlagAXMigrateBuilderIcons then IconVariant.Filled else nil,
					onActivated = UseResult,
					isActive = Name == AvatarScreen.AccessoryAdjustment,
					iconSize = Size600
				},
				{
					type = "icon",
					id = MenuItemEnumModule.AvatarRefinement.BodyScale,
					icon = if FFlagAXMigrateBuilderIcons then IconName.PersonStandingDualArrowsVertical else "icons/menu/clothing/build_off",
					activeIcon = if FFlagAXMigrateBuilderIcons then IconName.PersonStandingDualArrowsVertical else "icons/menu/clothing/build_on",
					activeIconVariant = if FFlagAXMigrateBuilderIcons then IconVariant.Filled else nil,
					onActivated = UseResult1,
					isActive = Name == AvatarScreen.BodyShape,
					iconSize = Size600
				},
				{
					type = "icon",
					id = MenuItemEnumModule.AvatarRefinement.CustomizeHead,
					icon = if FFlagAXMigrateBuilderIcons then IconName.HeadBlank else "icons/menu/clothing/classicHead_off",
					activeIcon = if FFlagAXMigrateBuilderIcons then IconName.HeadBlank else "icons/menu/clothing/classicHead_on",
					activeIconVariant = if FFlagAXMigrateBuilderIcons then IconVariant.Filled else nil,
					onActivated = UseResult2,
					isActive = Name == AvatarScreen.HeadRefinement,
					iconSize = Size600,
					visible = if FFlagAXHideHeadAdjustmentForDefaultHead then UseSelectorResult1 else nil
				},
				{
					type = "icon",
					id = MenuItemEnumModule.AvatarRefinement.ClothingLayers,
					icon = if FFlagAXMigrateBuilderIcons then IconName.ClothesHanger else "icons/menu/clothing/clothing_off",
					activeIcon = if FFlagAXMigrateBuilderIcons then IconName.ClothesHanger else "icons/menu/clothing/clothing_on",
					activeIconVariant = if FFlagAXMigrateBuilderIcons then IconVariant.Filled else nil,
					onActivated = UseResult3,
					isActive = Name == AvatarScreen.LayeredClothingSort,
					iconSize = Size600
				},
				{
					type = "icon",
					id = MenuItemEnumModule.AvatarRefinement.MakeupLayers,
					icon = if FFlagAXMigrateBuilderIcons then IconName.LipsLipstickMakeupBrush else "icons/menu/clothing/eyelash_on",
					activeIcon = if FFlagAXMigrateBuilderIcons then IconName.LipsLipstickMakeupBrush else "icons/menu/clothing/eyelash_off",
					activeIconVariant = if FFlagAXMigrateBuilderIcons then IconVariant.Filled else nil,
					onActivated = UseResult4,
					isActive = Name == AvatarScreen.LayeredMakeupSort,
					iconSize = Size600
				},
				if UseSelectorResult then {
					type = "color",
					Selectable = true,
					id = MenuItemEnumModule.AvatarRefinement.ColorAdjustment,
					colorSize = Size600,
					colors = { UseSelectorResult },
					onActivated = UseResult5,
					isActive = Name == AvatarScreen.ColorAdjustment
				} else nil
			}
		end, {
			Name, UseResult, UseResult1, UseResult2, UseResult3, UseResult4, UseResult5,
			UseSelectorResult,
			if FFlagAXHideHeadAdjustmentForDefaultHead then UseSelectorResult1 else nil
		})
	}
end