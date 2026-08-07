local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local userLibModule = require(parent.UserLib)
local navigationModule = require(parent.Navigation)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local responsiveModule = require(parent.Responsive)
local localizationModule = require(parent.Localization)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local foundationModule = require(parent.Foundation)
local selectColorAdjustmentButtonColor = avatarExperienceCommonModule.State.Selectors.selectColorAdjustmentButtonColor
local selectHasDynamicHead = avatarExperienceCommonModule.State.Selectors.selectHasDynamicHead
local slotBasedEditorAnalytics = avatarExperienceAnalyticsModule.Surfaces.SlotBasedEditorAnalytics
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useNavigation = navigationModule.useNavigation
local useAvatarRoute = avatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local useSemanticTokensModule = require(avatarExperienceControlBar.Hooks.useSemanticTokens)
local useLocalization = localizationModule.Hooks.useLocalization
local useUndoRedoBarViewModelModule = require(script.Parent.UndoRedoBar.useUndoRedoBarViewModel)
local iconName = foundationModule.Enums.IconName
local avatarScreen = avatarExperienceNavigationModule.Enums.AvatarScreen
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local constants = userLibModule.Utils.Constants
local menuItemEnumModule = require(avatarExperienceControlBar.Enums.MenuItemEnum)
local _ = require(avatarExperienceControlBar.ControlBarTypes)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXAvatarSharingEntryPoint = avatarExperienceFlagsModule.FFlagAXAvatarSharingEntryPoint
local fFlagAXPhotoboothFunctionality = avatarExperienceFlagsModule.FFlagAXPhotoboothFunctionality
local fFlagAXMigrateBuilderIcons = avatarExperienceFlagsModule.FFlagAXMigrateBuilderIcons
local fFlagAXRootSlotBasedEditorFlag = require(parent.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local fFlagAXResetAvatarButton = require(parent.AvatarExperienceFlags).FFlagAXResetAvatarButton
local fFlagAXHideHeadAdjustmentForDefaultHead = require(parent.AvatarExperienceFlags).FFlagAXHideHeadAdjustmentForDefaultHead
local fFlagAXFavoritesManagerNavEntry = require(parent.AvatarExperienceFlags).FFlagAXFavoritesManagerNavEntry
local fFlagAXPPEReturnToEntrySurface = require(parent.SharedFlags).FFlagAXPPEReturnToEntrySurface
local avatarHeadShot = constants.RbxthumbTypes.AvatarHeadShot

local function selectUserId(p0) --[[ line: 49 ]]
	return p0.LocalUserId
end

return function(p1) --[[ line: 63 | named "useCustomizeControlBarProps" ]]
	-- upvalues: useSemanticTokensModule (ref), useNavigation (ref), fFlagAXPPEReturnToEntrySurface (ref), useAvatarRoute (ref), useSelector (ref), selectColorAdjustmentButtonColor (ref), responsiveModule (ref), selectUserId (ref), useLocalization (ref), fFlagAXAvatarSharingEntryPoint (ref), fFlagAXPhotoboothFunctionality (ref), reactModule (ref), avatarScreen (ref), slotBasedEditorAnalytics (ref), menuItemEnumModule (ref), fFlagAXFavoritesManagerNavEntry (ref), fFlagAXHideHeadAdjustmentForDefaultHead (ref), selectHasDynamicHead (ref), fFlagAXResetAvatarButton (ref), useUndoRedoBarViewModelModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), avatarHeadShot (ref), fFlagAXRootSlotBasedEditorFlag (ref), fFlagAXMigrateBuilderIcons (ref), iconName (ref)
	local var15 = useSemanticTokensModule()
	local var16 = useNavigation()
	local var17 = if fFlagAXPPEReturnToEntrySurface then useAvatarRoute() else nil
	local var18 = useSelector(selectColorAdjustmentButtonColor)
	local var19 = responsiveModule.useOrientation() == responsiveModule.Keys.Portrait
	local var20 = useSelector(selectUserId)
	local var21 = useLocalization({
		adjustAccessory = "Feature.Avatar.Label.Title.AccessoryAdjustment",
		bodyShape = "Feature.Avatar.Label.Title.BodyShape",
		clothingLayering = "Feature.Avatar.Label.Title.ClothingLayering",
		makeupLayering = "Feature.Avatar.Label.Title.MakeupLayering",
		headAdjustment = "Feature.Avatar.Label.Title.HeadAdjustment",
		inventory = "Feature.Avatar.Label.Title.Inventory",
		emotes = "Feature.Avatar.Label.Title.Emotes",
		profilePhoto = "Feature.Avatar.Label.Title.ProfilePhoto",
		skinColor = "Feature.Avatar.ColorAdjustmentPage.Title",
		shareAvatar = if fFlagAXAvatarSharingEntryPoint then "Feature.Avatar.Action.ShareAvatar" else nil,
		myPublishedAvatars = if fFlagAXAvatarSharingEntryPoint then "Feature.Avatar.Action.MyPublishedAvatars" else nil,
		photobooth = if fFlagAXPhotoboothFunctionality then "Feature.Avatar.Label.Photobooth" else nil
	})
	local var22 = reactModule.useCallback(function() --[[ line: 90 ]]
		-- upvalues: var16 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var16.navigate(avatarScreen.AvatarSwitcher)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.Main.AvatarSwitcher)
	end, { var16 })
	local var23 = reactModule.useCallback(function() --[[ line: 96 ]]
		-- upvalues: var16 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var16.navigate(avatarScreen.AccessoryAdjustment)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.AdjustAccessory)
	end, { var16 })
	local var24 = reactModule.useCallback(function() --[[ line: 101 ]]
		-- upvalues: var16 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var16.navigate(avatarScreen.BodyShape)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.BodyScale)
	end, { var16 })
	local var25 = reactModule.useCallback(function() --[[ line: 106 ]]
		-- upvalues: var16 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var16.navigate(avatarScreen.HeadRefinement)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.CustomizeHead)
	end, { var16 })
	local var26 = reactModule.useCallback(function() --[[ line: 111 ]]
		-- upvalues: var16 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var16.navigate(avatarScreen.LayeredClothingSort)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.ClothingLayers)
	end, { var16 })
	local var27 = reactModule.useCallback(function() --[[ line: 116 ]]
		-- upvalues: var16 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var16.navigate(avatarScreen.LayeredMakeupSort)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.MakeupLayers)
	end, { var16 })
	local var28 = reactModule.useCallback(function() --[[ line: 121 ]]
		-- upvalues: var16 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var16.navigate(avatarScreen.ColorAdjustment)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.ColorAdjustment)
	end, { var16 })
	local var29 = nil
	local var30 = nil
	
	if fFlagAXAvatarSharingEntryPoint then
		var29 = reactModule.useCallback(function() --[[ line: 128 ]]
			-- upvalues: var16 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
			var16.navigate(avatarScreen.LookComposerPage, {
				prevNavPage = if var16.state and var16.state.key then var16.state.key else nil
			})
			slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.SharedCommunityAvatars.ShareAvatar)
		end, { var16 })
		var30 = reactModule.useCallback(function() --[[ line: 136 ]]
			-- upvalues: var16 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
			var16.navigate(avatarScreen.MySharedAvatars)
			slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.SharedCommunityAvatars.MyPublishedAvatars)
		end, { var16 })
	end
	local var31 = reactModule.useCallback(function() --[[ line: 142 ]]
		-- upvalues: p1 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		if p1.onInventoryActivated then
			p1.onInventoryActivated()
		end
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.More.Inventory)
	end, { p1.onInventoryActivated })
	local var32 = reactModule.useCallback(function() --[[ line: 149 ]]
		-- upvalues: var16 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var16.navigate(avatarScreen.EditEmotes)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.More.Emotes)
	end, { var16 })
	local var33 = reactModule.useCallback(function() --[[ line: 154 ]]
		-- upvalues: var16 (ref), avatarScreen (copy), fFlagAXPPEReturnToEntrySurface (copy), var17 (write), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var16.navigate(avatarScreen.ProfilePictureEditorEmotes, if fFlagAXPPEReturnToEntrySurface then {
			entryOrigin = if var17 then {
				screenName = var17.opaque.name,
				screenParams = var17.opaque.params
			} else nil
		} else {
			prevNavPage = if var16.state and var16.state.key then var16.state.key else nil
		})
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.More.ProfilePhoto)
	end, {
		var16,
		if fFlagAXPPEReturnToEntrySurface then var17 else nil
	})
	local var34 = if fFlagAXPhotoboothFunctionality then reactModule.useCallback(function() --[[ line: 176 ]]
		-- upvalues: var16 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var16.navigate(avatarScreen.Photobooth)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.Photobooth.Photobooth)
	end, { var16 }) else nil
	local var35 = if fFlagAXFavoritesManagerNavEntry then reactModule.useCallback(function() --[[ line: 184 ]]
		-- upvalues: var16 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var16.navigate(avatarScreen.FavoritesSaved)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.Main.Favorites)
	end, { var16 }) else nil
	local var36 = if fFlagAXHideHeadAdjustmentForDefaultHead then useSelector(selectHasDynamicHead) else nil
	local var37 = if fFlagAXResetAvatarButton then useUndoRedoBarViewModelModule() else nil
	
	return {
		config = reactModule.useMemo(function() --[[ line: 200 ]]
			-- upvalues: menuItemEnumModule (copy), p1 (ref), getRbxthumbWithTypeSizeAndOptions (copy), var20 (ref), avatarHeadShot (copy), fFlagAXRootSlotBasedEditorFlag (copy), var33 (ref), var22 (ref), fFlagAXMigrateBuilderIcons (copy), iconName (copy), slotBasedEditorAnalytics (copy), var21 (ref), var15 (ref), var23 (ref), var24 (ref), var25 (ref), fFlagAXHideHeadAdjustmentForDefaultHead (copy), var36 (ref), var26 (ref), var27 (ref), var18 (ref), var28 (ref), fFlagAXAvatarSharingEntryPoint (copy), var29 (write), var30 (write), var31 (ref), var19 (ref), var32 (ref), fFlagAXPhotoboothFunctionality (copy), var34 (write), fFlagAXFavoritesManagerNavEntry (copy), var35 (write), fFlagAXResetAvatarButton (copy), var37 (ref)
			local var40
			local t = {}
			local t_1 = {
				type = "image",
				id = menuItemEnumModule.Main.AvatarSwitcher,
				thumbnailUrl = if p1.thumbnailUrl then p1.thumbnailUrl else getRbxthumbWithTypeSizeAndOptions(var20, avatarHeadShot, 150, true, true),
				onActivated = if fFlagAXRootSlotBasedEditorFlag then var33 else var22,
				hideIndicator = if fFlagAXRootSlotBasedEditorFlag then true else nil
			}
			
			if p1.focusAnimation then
				var40 = p1.focusAnimation.enabled
				
				if var40 then
					var40 = p1.focusAnimation.menuItemId == menuItemEnumModule.Main.AvatarSwitcher
					var40 = nil
				end
			else
				var40 = nil
			end
			t_1.enableFocusAnimation = var40
			-- Unknown statement at pc 1: <SetList>
			
			if fFlagAXFavoritesManagerNavEntry then
				table.insert(t, {
					type = "icon",
					isActive = false,
					id = menuItemEnumModule.Main.Favorites,
					icon = iconName.Star,
					onActivated = var35
				})
			end
			if fFlagAXResetAvatarButton and p1.showUndoRedo then
				table.insert(t, {
					type = "divider",
					id = menuItemEnumModule.UndoRedoDivider
				})
				
				for i, v in var37.items do
					table.insert(t, v)
				end
			end
			return t
		end, {
			var20, var22, var23, var24, var25, var26, var31, var32, var33, var28, var18,
			var19, p1.thumbnailUrl, p1.focusAnimation,
			if fFlagAXResetAvatarButton then p1.showUndoRedo else nil,
			if fFlagAXResetAvatarButton then var37 else nil,
			if fFlagAXHideHeadAdjustmentForDefaultHead then var36 else nil
		})
	}
end