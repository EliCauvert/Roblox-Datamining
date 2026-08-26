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

return function(p1)
	-- upvalues: useTokens (ref), useNavigation (ref), useAvatarRoute (ref), useSelector (ref), selectColorAdjustmentButtonColor (ref), reactModule (ref), avatarScreen (ref), slotBasedEditorAnalytics (ref), menuItemEnumModule (ref), fFlagAXHideHeadAdjustmentForDefaultHead (ref), selectHasDynamicHead (ref), fFlagAXMigrateBuilderIcons (ref), iconName (ref), iconVariant (ref)
	local var1 = useTokens()
	local var2 = useNavigation()
	local var3 = useAvatarRoute()
	local var4 = useSelector(selectColorAdjustmentButtonColor)
	local size600 = var1.Size.Size_600
	local name = p1.avatarRoute and (p1.avatarRoute.opaque and p1.avatarRoute.opaque.name)
	local var5 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), var3 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.AccessoryAdjustment)
		
		if var3 and var3.opaque then
			slotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(menuItemEnumModule.AvatarRefinement.AdjustAccessory, var3.opaque.name)
		end
	end, { var2, var3 })
	local var6 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), var3 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.BodyShape)
		
		if var3 and var3.opaque then
			slotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(menuItemEnumModule.AvatarRefinement.BodyScale, var3.opaque.name)
		end
	end, { var2, var3 })
	local var7 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), var3 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.HeadRefinement)
		
		if var3 and var3.opaque then
			slotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(menuItemEnumModule.AvatarRefinement.CustomizeHead, var3.opaque.name)
		end
	end, { var2, var3 })
	local var8 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), avatarScreen (copy), var2 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		if var3 and var3.current and var3.current.name == avatarScreen.LayeredMakeupSort then
			var2.pop()
		end
		var2.navigate(avatarScreen.LayeredClothingSort)
		
		if var3 and var3.opaque then
			slotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(menuItemEnumModule.AvatarRefinement.ClothingLayers, var3.opaque.name)
		end
	end, { var2, var3 })
	local var9 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), avatarScreen (copy), var2 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		if var3 and var3.current and var3.current.name == avatarScreen.LayeredClothingSort then
			var2.pop()
		end
		var2.navigate(avatarScreen.LayeredMakeupSort)
		
		if var3 and var3.opaque then
			slotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(menuItemEnumModule.AvatarRefinement.MakeupLayers, var3.opaque.name)
		end
	end, { var2, var3 })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), var3 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.ColorAdjustment)
		
		if var3 and var3.opaque then
			slotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(menuItemEnumModule.AvatarRefinement.ColorAdjustment, var3.opaque.name)
		end
	end, { var2, var3 })
	local var11 = if fFlagAXHideHeadAdjustmentForDefaultHead then useSelector(selectHasDynamicHead) else nil
	
	return {
		config = reactModule.useMemo(function()
			-- upvalues: menuItemEnumModule (copy), fFlagAXMigrateBuilderIcons (copy), iconName (copy), iconVariant (copy), var5 (ref), name (ref), avatarScreen (copy), size600 (ref), var6 (ref), var7 (ref), fFlagAXHideHeadAdjustmentForDefaultHead (copy), var11 (ref), var8 (ref), var9 (ref), var4 (ref), var10 (ref)
			return {
				{
					type = "icon",
					id = menuItemEnumModule.AvatarRefinement.AdjustAccessory,
					icon = if fFlagAXMigrateBuilderIcons then iconName.HatFedora else "icons/menu/clothing/hats_off",
					activeIcon = if fFlagAXMigrateBuilderIcons then iconName.HatFedora else "icons/menu/clothing/hats_on",
					activeIconVariant = if fFlagAXMigrateBuilderIcons then iconVariant.Filled else nil,
					onActivated = var5,
					isActive = name == avatarScreen.AccessoryAdjustment,
					iconSize = size600
				},
				{
					type = "icon",
					id = menuItemEnumModule.AvatarRefinement.BodyScale,
					icon = if fFlagAXMigrateBuilderIcons then iconName.PersonStandingDualArrowsVertical else "icons/menu/clothing/build_off",
					activeIcon = if fFlagAXMigrateBuilderIcons then iconName.PersonStandingDualArrowsVertical else "icons/menu/clothing/build_on",
					activeIconVariant = if fFlagAXMigrateBuilderIcons then iconVariant.Filled else nil,
					onActivated = var6,
					isActive = name == avatarScreen.BodyShape,
					iconSize = size600
				},
				{
					type = "icon",
					id = menuItemEnumModule.AvatarRefinement.CustomizeHead,
					icon = if fFlagAXMigrateBuilderIcons then iconName.HeadBlank else "icons/menu/clothing/classicHead_off",
					activeIcon = if fFlagAXMigrateBuilderIcons then iconName.HeadBlank else "icons/menu/clothing/classicHead_on",
					activeIconVariant = if fFlagAXMigrateBuilderIcons then iconVariant.Filled else nil,
					onActivated = var7,
					isActive = name == avatarScreen.HeadRefinement,
					iconSize = size600,
					visible = if fFlagAXHideHeadAdjustmentForDefaultHead then var11 else nil
				},
				{
					type = "icon",
					id = menuItemEnumModule.AvatarRefinement.ClothingLayers,
					icon = if fFlagAXMigrateBuilderIcons then iconName.ClothesHanger else "icons/menu/clothing/clothing_off",
					activeIcon = if fFlagAXMigrateBuilderIcons then iconName.ClothesHanger else "icons/menu/clothing/clothing_on",
					activeIconVariant = if fFlagAXMigrateBuilderIcons then iconVariant.Filled else nil,
					onActivated = var8,
					isActive = name == avatarScreen.LayeredClothingSort,
					iconSize = size600
				},
				{
					type = "icon",
					id = menuItemEnumModule.AvatarRefinement.MakeupLayers,
					icon = if fFlagAXMigrateBuilderIcons then iconName.LipsLipstickMakeupBrush else "icons/menu/clothing/eyelash_on",
					activeIcon = if fFlagAXMigrateBuilderIcons then iconName.LipsLipstickMakeupBrush else "icons/menu/clothing/eyelash_off",
					activeIconVariant = if fFlagAXMigrateBuilderIcons then iconVariant.Filled else nil,
					onActivated = var9,
					isActive = name == avatarScreen.LayeredMakeupSort,
					iconSize = size600
				},
				if var4 then {
					type = "color",
					Selectable = true,
					id = menuItemEnumModule.AvatarRefinement.ColorAdjustment,
					colorSize = size600,
					colors = { var4 },
					onActivated = var10,
					isActive = name == avatarScreen.ColorAdjustment
				} else nil
			}
		end, {
			name, var5, var6, var7, var8, var9, var10, var4,
			if fFlagAXHideHeadAdjustmentForDefaultHead then var11 else nil
		})
	}
end