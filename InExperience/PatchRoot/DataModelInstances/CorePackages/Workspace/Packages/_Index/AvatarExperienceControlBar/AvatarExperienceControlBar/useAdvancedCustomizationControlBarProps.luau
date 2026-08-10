local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local navigationModule = require(parent.Navigation)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local selectColorAdjustmentButtonColor = avatarExperienceCommonModule.State.Selectors.selectColorAdjustmentButtonColor
local selectHasDynamicHead = avatarExperienceCommonModule.State.Selectors.selectHasDynamicHead
local slotBasedEditorAnalytics = avatarExperienceAnalyticsModule.Surfaces.SlotBasedEditorAnalytics
local useTokens = foundationModule.Hooks.useTokens
local useNavigation = navigationModule.useNavigation
local useAvatarRoute = avatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local avatarScreen = avatarExperienceNavigationModule.Enums.AvatarScreen
local menuItemEnumModule = require(avatarExperienceControlBar.Enums.MenuItemEnum)
local _ = require(avatarExperienceControlBar.ControlBarTypes)
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXMigrateBuilderIcons = avatarExperienceFlagsModule.FFlagAXMigrateBuilderIcons
local fFlagAXHideHeadAdjustmentForDefaultHead = avatarExperienceFlagsModule.FFlagAXHideHeadAdjustmentForDefaultHead

return function(p0) --[[ line: 37 | named "useAdvancedCustomizationControlBarProps" ]]
	-- upvalues: useTokens (ref), useNavigation (ref), useAvatarRoute (ref), useSelector (ref), selectColorAdjustmentButtonColor (ref), reactModule (ref), avatarScreen (ref), slotBasedEditorAnalytics (ref), menuItemEnumModule (ref), fFlagAXHideHeadAdjustmentForDefaultHead (ref), selectHasDynamicHead (ref), fFlagAXMigrateBuilderIcons (ref), iconName (ref), iconVariant (ref)
	local var9 = useTokens()
	local var10 = useNavigation()
	local var11 = useAvatarRoute()
	local var12 = useSelector(selectColorAdjustmentButtonColor)
	local size600 = var9.Size.Size_600
	local name = p0.avatarRoute and (p0.avatarRoute.opaque and p0.avatarRoute.opaque.name)
	local var14 = reactModule.useCallback(function() --[[ line: 48 ]]
		-- upvalues: var10 (ref), avatarScreen (copy), var11 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var10.navigate(avatarScreen.AccessoryAdjustment)
		
		if var11 and var11.opaque then
			slotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(menuItemEnumModule.AvatarRefinement.AdjustAccessory, var11.opaque.name)
		end
	end, { var10, var11 })
	local var15 = reactModule.useCallback(function() --[[ line: 58 ]]
		-- upvalues: var10 (ref), avatarScreen (copy), var11 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var10.navigate(avatarScreen.BodyShape)
		
		if var11 and var11.opaque then
			slotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(menuItemEnumModule.AvatarRefinement.BodyScale, var11.opaque.name)
		end
	end, { var10, var11 })
	local var16 = reactModule.useCallback(function() --[[ line: 68 ]]
		-- upvalues: var10 (ref), avatarScreen (copy), var11 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var10.navigate(avatarScreen.HeadRefinement)
		
		if var11 and var11.opaque then
			slotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(menuItemEnumModule.AvatarRefinement.CustomizeHead, var11.opaque.name)
		end
	end, { var10, var11 })
	local var17 = reactModule.useCallback(function() --[[ line: 78 ]]
		-- upvalues: var11 (ref), avatarScreen (copy), var10 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		if var11 and var11.current and var11.current.name == avatarScreen.LayeredMakeupSort then
			var10.pop()
		end
		var10.navigate(avatarScreen.LayeredClothingSort)
		
		if var11 and var11.opaque then
			slotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(menuItemEnumModule.AvatarRefinement.ClothingLayers, var11.opaque.name)
		end
	end, { var10, var11 })
	local var18 = reactModule.useCallback(function() --[[ line: 93 ]]
		-- upvalues: var11 (ref), avatarScreen (copy), var10 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		if var11 and var11.current and var11.current.name == avatarScreen.LayeredClothingSort then
			var10.pop()
		end
		var10.navigate(avatarScreen.LayeredMakeupSort)
		
		if var11 and var11.opaque then
			slotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(menuItemEnumModule.AvatarRefinement.MakeupLayers, var11.opaque.name)
		end
	end, { var10, var11 })
	local var19 = reactModule.useCallback(function() --[[ line: 108 ]]
		-- upvalues: var10 (ref), avatarScreen (copy), var11 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var10.navigate(avatarScreen.ColorAdjustment)
		
		if var11 and var11.opaque then
			slotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(menuItemEnumModule.AvatarRefinement.ColorAdjustment, var11.opaque.name)
		end
	end, { var10, var11 })
	local var20 = if fFlagAXHideHeadAdjustmentForDefaultHead then useSelector(selectHasDynamicHead) else nil
	
	return {
		config = reactModule.useMemo(function() --[[ line: 121 ]]
			-- upvalues: menuItemEnumModule (copy), fFlagAXMigrateBuilderIcons (copy), iconName (copy), iconVariant (copy), var14 (ref), name (ref), avatarScreen (copy), size600 (ref), var15 (ref), var16 (ref), fFlagAXHideHeadAdjustmentForDefaultHead (copy), var20 (ref), var17 (ref), var18 (ref), var12 (ref), var19 (ref)
			return {
				{
					type = "icon",
					id = menuItemEnumModule.AvatarRefinement.AdjustAccessory,
					icon = if fFlagAXMigrateBuilderIcons then iconName.HatFedora else "icons/menu/clothing/hats_off",
					activeIcon = if fFlagAXMigrateBuilderIcons then iconName.HatFedora else "icons/menu/clothing/hats_on",
					activeIconVariant = if fFlagAXMigrateBuilderIcons then iconVariant.Filled else nil,
					onActivated = var14,
					isActive = name == avatarScreen.AccessoryAdjustment,
					iconSize = size600
				},
				{
					type = "icon",
					id = menuItemEnumModule.AvatarRefinement.BodyScale,
					icon = if fFlagAXMigrateBuilderIcons then iconName.PersonStandingDualArrowsVertical else "icons/menu/clothing/build_off",
					activeIcon = if fFlagAXMigrateBuilderIcons then iconName.PersonStandingDualArrowsVertical else "icons/menu/clothing/build_on",
					activeIconVariant = if fFlagAXMigrateBuilderIcons then iconVariant.Filled else nil,
					onActivated = var15,
					isActive = name == avatarScreen.BodyShape,
					iconSize = size600
				},
				{
					type = "icon",
					id = menuItemEnumModule.AvatarRefinement.CustomizeHead,
					icon = if fFlagAXMigrateBuilderIcons then iconName.HeadBlank else "icons/menu/clothing/classicHead_off",
					activeIcon = if fFlagAXMigrateBuilderIcons then iconName.HeadBlank else "icons/menu/clothing/classicHead_on",
					activeIconVariant = if fFlagAXMigrateBuilderIcons then iconVariant.Filled else nil,
					onActivated = var16,
					isActive = name == avatarScreen.HeadRefinement,
					iconSize = size600,
					visible = if fFlagAXHideHeadAdjustmentForDefaultHead then var20 else nil
				},
				{
					type = "icon",
					id = menuItemEnumModule.AvatarRefinement.ClothingLayers,
					icon = if fFlagAXMigrateBuilderIcons then iconName.ClothesHanger else "icons/menu/clothing/clothing_off",
					activeIcon = if fFlagAXMigrateBuilderIcons then iconName.ClothesHanger else "icons/menu/clothing/clothing_on",
					activeIconVariant = if fFlagAXMigrateBuilderIcons then iconVariant.Filled else nil,
					onActivated = var17,
					isActive = name == avatarScreen.LayeredClothingSort,
					iconSize = size600
				},
				{
					type = "icon",
					id = menuItemEnumModule.AvatarRefinement.MakeupLayers,
					icon = if fFlagAXMigrateBuilderIcons then iconName.LipsLipstickMakeupBrush else "icons/menu/clothing/eyelash_on",
					activeIcon = if fFlagAXMigrateBuilderIcons then iconName.LipsLipstickMakeupBrush else "icons/menu/clothing/eyelash_off",
					activeIconVariant = if fFlagAXMigrateBuilderIcons then iconVariant.Filled else nil,
					onActivated = var18,
					isActive = name == avatarScreen.LayeredMakeupSort,
					iconSize = size600
				},
				if var12 then {
					type = "color",
					Selectable = true,
					id = menuItemEnumModule.AvatarRefinement.ColorAdjustment,
					colorSize = size600,
					colors = { var12 },
					onActivated = var19,
					isActive = name == avatarScreen.ColorAdjustment
				} else nil
			}
		end, {
			name, var14, var15, var16, var17, var18, var19, var12,
			if fFlagAXHideHeadAdjustmentForDefaultHead then var20 else nil
		})
	}
end