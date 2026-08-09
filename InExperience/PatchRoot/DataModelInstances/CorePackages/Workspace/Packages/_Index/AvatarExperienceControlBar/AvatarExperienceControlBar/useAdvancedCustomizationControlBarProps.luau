local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local navigationModule = require(parent.Navigation)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local IXPUtilsModule = require(parent.IXPUtils)
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
local AXEnableAccessoryAdjustmentDuringTryOnIXP = require(parent.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXMigrateBuilderIcons = avatarExperienceFlagsModule.FFlagAXMigrateBuilderIcons
local fFlagAXCustomizeMakeupSupport = avatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local fFlagAXHideHeadAdjustmentForDefaultHead = avatarExperienceFlagsModule.FFlagAXHideHeadAdjustmentForDefaultHead

return function(p0) --[[ line: 42 | named "useAdvancedCustomizationControlBarProps" ]]
	-- upvalues: useTokens (ref), useNavigation (ref), useAvatarRoute (ref), useSelector (ref), selectColorAdjustmentButtonColor (ref), reactModule (ref), avatarScreen (ref), slotBasedEditorAnalytics (ref), menuItemEnumModule (ref), fFlagAXCustomizeMakeupSupport (ref), fFlagAXHideHeadAdjustmentForDefaultHead (ref), selectHasDynamicHead (ref), AXEnableAccessoryAdjustmentDuringTryOnIXP (ref), IXPUtilsModule (ref), fFlagAXMigrateBuilderIcons (ref), iconName (ref), iconVariant (ref)
	local var10 = useTokens()
	local var11 = useNavigation()
	local var12 = useAvatarRoute()
	local var13 = useSelector(selectColorAdjustmentButtonColor)
	local size600 = var10.Size.Size_600
	local name = p0.avatarRoute and (p0.avatarRoute.opaque and p0.avatarRoute.opaque.name)
	local var15 = reactModule.useCallback(function() --[[ line: 53 ]]
		-- upvalues: var11 (ref), avatarScreen (copy), var12 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var11.navigate(avatarScreen.AccessoryAdjustment)
		
		if var12 and var12.opaque then
			slotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(menuItemEnumModule.AvatarRefinement.AdjustAccessory, var12.opaque.name)
		end
	end, { var11, var12 })
	local var16 = reactModule.useCallback(function() --[[ line: 63 ]]
		-- upvalues: var11 (ref), avatarScreen (copy), var12 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var11.navigate(avatarScreen.BodyShape)
		
		if var12 and var12.opaque then
			slotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(menuItemEnumModule.AvatarRefinement.BodyScale, var12.opaque.name)
		end
	end, { var11, var12 })
	local var17 = reactModule.useCallback(function() --[[ line: 73 ]]
		-- upvalues: var11 (ref), avatarScreen (copy), var12 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var11.navigate(avatarScreen.HeadRefinement)
		
		if var12 and var12.opaque then
			slotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(menuItemEnumModule.AvatarRefinement.CustomizeHead, var12.opaque.name)
		end
	end, { var11, var12 })
	local var18 = reactModule.useCallback(function() --[[ line: 83 ]]
		-- upvalues: fFlagAXCustomizeMakeupSupport (copy), var12 (ref), avatarScreen (copy), var11 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		if fFlagAXCustomizeMakeupSupport and var12 and (var12.current and var12.current.name == avatarScreen.LayeredMakeupSort) then
			var11.pop()
		end
		var11.navigate(avatarScreen.LayeredClothingSort)
		
		if var12 and var12.opaque then
			slotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(menuItemEnumModule.AvatarRefinement.ClothingLayers, var12.opaque.name)
		end
	end, { var11, var12 })
	local var19 = if fFlagAXCustomizeMakeupSupport then reactModule.useCallback(function() --[[ line: 104 ]]
		-- upvalues: var12 (ref), avatarScreen (copy), var11 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		if var12 and var12.current and var12.current.name == avatarScreen.LayeredClothingSort then
			var11.pop()
		end
		var11.navigate(avatarScreen.LayeredMakeupSort)
		
		if var12 and var12.opaque then
			slotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(menuItemEnumModule.AvatarRefinement.MakeupLayers, var12.opaque.name)
		end
	end, { var11, var12 }) else nil
	local var20 = reactModule.useCallback(function() --[[ line: 120 ]]
		-- upvalues: var11 (ref), avatarScreen (copy), var12 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var11.navigate(avatarScreen.ColorAdjustment)
		
		if var12 and var12.opaque then
			slotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClickFromSurface(menuItemEnumModule.AvatarRefinement.ColorAdjustment, var12.opaque.name)
		end
	end, { var11, var12 })
	local var21 = if fFlagAXHideHeadAdjustmentForDefaultHead then useSelector(selectHasDynamicHead) else nil
	local var22 = if AXEnableAccessoryAdjustmentDuringTryOnIXP.isEnabled() then IXPUtilsModule.readTestVariable(AXEnableAccessoryAdjustmentDuringTryOnIXP.EnabledForUser) else nil
	
	return {
		config = reactModule.useMemo(function() --[[ line: 137 ]]
			-- upvalues: menuItemEnumModule (copy), var22 (ref), fFlagAXMigrateBuilderIcons (copy), iconName (copy), iconVariant (copy), var15 (ref), name (ref), avatarScreen (copy), size600 (ref), var16 (ref), var17 (ref), fFlagAXHideHeadAdjustmentForDefaultHead (copy), var21 (ref), var18 (ref), fFlagAXCustomizeMakeupSupport (copy), var19 (ref), var13 (ref), var20 (ref)
			return {
				{
					type = "icon",
					id = menuItemEnumModule.AvatarRefinement.AdjustAccessory,
					icon = if var22 then "icons/menu/transform-small" elseif fFlagAXMigrateBuilderIcons then iconName.HatFedora else "icons/menu/clothing/hats_off",
					activeIcon = if var22 then "icons/menu/transform-small" elseif fFlagAXMigrateBuilderIcons then iconName.HatFedora else "icons/menu/clothing/hats_on",
					activeIconVariant = if fFlagAXMigrateBuilderIcons then iconVariant.Filled else nil,
					onActivated = var15,
					isActive = name == avatarScreen.AccessoryAdjustment,
					iconSize = size600
				},
				{
					type = "icon",
					id = menuItemEnumModule.AvatarRefinement.BodyScale,
					icon = if fFlagAXMigrateBuilderIcons then iconName.PersonStandingDualArrowsVertical else "icons/menu/clothing/build_off",
					activeIcon = if fFlagAXMigrateBuilderIcons then iconName.PersonStandingDualArrowsVertical else "icons/menu/clothing/build_on",
					activeIconVariant = if fFlagAXMigrateBuilderIcons then iconVariant.Filled else nil,
					onActivated = var16,
					isActive = name == avatarScreen.BodyShape,
					iconSize = size600
				},
				{
					type = "icon",
					id = menuItemEnumModule.AvatarRefinement.CustomizeHead,
					icon = if fFlagAXMigrateBuilderIcons then iconName.HeadBlank else "icons/menu/clothing/classicHead_off",
					activeIcon = if fFlagAXMigrateBuilderIcons then iconName.HeadBlank else "icons/menu/clothing/classicHead_on",
					activeIconVariant = if fFlagAXMigrateBuilderIcons then iconVariant.Filled else nil,
					onActivated = var17,
					isActive = name == avatarScreen.HeadRefinement,
					iconSize = size600,
					visible = if fFlagAXHideHeadAdjustmentForDefaultHead then var21 else nil
				},
				{
					type = "icon",
					id = menuItemEnumModule.AvatarRefinement.ClothingLayers,
					icon = if fFlagAXMigrateBuilderIcons then iconName.ClothesHanger else "icons/menu/clothing/clothing_off",
					activeIcon = if fFlagAXMigrateBuilderIcons then iconName.ClothesHanger else "icons/menu/clothing/clothing_on",
					activeIconVariant = if fFlagAXMigrateBuilderIcons then iconVariant.Filled else nil,
					onActivated = var18,
					isActive = name == avatarScreen.LayeredClothingSort,
					iconSize = size600
				},
				if fFlagAXCustomizeMakeupSupport then {
					type = "icon",
					id = menuItemEnumModule.AvatarRefinement.MakeupLayers,
					icon = if fFlagAXMigrateBuilderIcons then iconName.LipsLipstickMakeupBrush else "icons/menu/clothing/eyelash_on",
					activeIcon = if fFlagAXMigrateBuilderIcons then iconName.LipsLipstickMakeupBrush else "icons/menu/clothing/eyelash_off",
					activeIconVariant = if fFlagAXMigrateBuilderIcons then iconVariant.Filled else nil,
					onActivated = var19,
					isActive = name == avatarScreen.LayeredMakeupSort,
					iconSize = size600
				} else nil,
				if var13 then {
					type = "color",
					Selectable = true,
					id = menuItemEnumModule.AvatarRefinement.ColorAdjustment,
					colorSize = size600,
					colors = { var13 },
					onActivated = var20,
					isActive = name == avatarScreen.ColorAdjustment
				} else nil
			}
		end, {
			name, var15, var16, var17, var18,
			if fFlagAXCustomizeMakeupSupport then var19 else nil, var20, var13,
			if fFlagAXHideHeadAdjustmentForDefaultHead then var21 else nil
		})
	}
end