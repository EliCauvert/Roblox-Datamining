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
local fFlagAXUseProfileIconEntryPoint = avatarExperienceFlagsModule.FFlagAXUseProfileIconEntryPoint
local fFlagAXPPEReturnToEntrySurface = require(parent.SharedFlags).FFlagAXPPEReturnToEntrySurface
local fFlagEditProfileImageV2Enabled2 = require(parent.SharedFlags).FFlagEditProfileImageV2Enabled2
local avatarHeadShot = constants.RbxthumbTypes.AvatarHeadShot
local t = {
	[avatarScreen.Catalog] = true,
	[avatarScreen.AvatarEditor] = true,
	[avatarScreen.MySharedAvatars] = true,
	[avatarScreen.CatalogSearch] = true,
	[avatarScreen.CatalogSearchLanding] = true,
	[avatarScreen.SearchLandingFocusedWidgetPage] = true
}

local function selectUserId(p0) --[[ line: 62 ]]
	return p0.LocalUserId
end

return function(p1) --[[ line: 81 | named "useCustomizeControlBarProps" ]]
	-- upvalues: useSemanticTokensModule (ref), useNavigation (ref), fFlagAXUseProfileIconEntryPoint (ref), fFlagAXPPEReturnToEntrySurface (ref), useAvatarRoute (ref), avatarScreen (ref), useSelector (ref), selectColorAdjustmentButtonColor (ref), responsiveModule (ref), selectUserId (ref), useLocalization (ref), fFlagAXAvatarSharingEntryPoint (ref), fFlagAXPhotoboothFunctionality (ref), reactModule (ref), slotBasedEditorAnalytics (ref), menuItemEnumModule (ref), fFlagEditProfileImageV2Enabled2 (ref), t (ref), fFlagAXFavoritesManagerNavEntry (ref), fFlagAXHideHeadAdjustmentForDefaultHead (ref), selectHasDynamicHead (ref), fFlagAXResetAvatarButton (ref), useUndoRedoBarViewModelModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), avatarHeadShot (ref), fFlagAXRootSlotBasedEditorFlag (ref), fFlagAXMigrateBuilderIcons (ref), iconName (ref)
	local var16 = useSemanticTokensModule()
	local var17 = useNavigation()
	local var18 = if fFlagAXUseProfileIconEntryPoint or fFlagAXPPEReturnToEntrySurface then useAvatarRoute() else nil
	local var19 = fFlagAXUseProfileIconEntryPoint and (var18 ~= nil and var18.opaque.name == avatarScreen.Profile)
	local var20 = useSelector(selectColorAdjustmentButtonColor)
	local var21 = responsiveModule.useOrientation() == responsiveModule.Keys.Portrait
	local var22 = useSelector(selectUserId)
	local var23 = useLocalization({
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
	local var24 = reactModule.useCallback(function() --[[ line: 111 ]]
		-- upvalues: var17 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var17.navigate(avatarScreen.AvatarSwitcher)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.Main.AvatarSwitcher)
	end, { var17 })
	local var25 = reactModule.useCallback(function() --[[ line: 117 ]]
		-- upvalues: var17 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var17.navigate(avatarScreen.AccessoryAdjustment)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.AdjustAccessory)
	end, { var17 })
	local var26 = reactModule.useCallback(function() --[[ line: 122 ]]
		-- upvalues: var17 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var17.navigate(avatarScreen.BodyShape)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.BodyScale)
	end, { var17 })
	local var27 = reactModule.useCallback(function() --[[ line: 127 ]]
		-- upvalues: var17 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var17.navigate(avatarScreen.HeadRefinement)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.CustomizeHead)
	end, { var17 })
	local var28 = reactModule.useCallback(function() --[[ line: 132 ]]
		-- upvalues: var17 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var17.navigate(avatarScreen.LayeredClothingSort)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.ClothingLayers)
	end, { var17 })
	local var29 = reactModule.useCallback(function() --[[ line: 137 ]]
		-- upvalues: var17 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var17.navigate(avatarScreen.LayeredMakeupSort)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.MakeupLayers)
	end, { var17 })
	local var30 = reactModule.useCallback(function() --[[ line: 142 ]]
		-- upvalues: var17 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var17.navigate(avatarScreen.ColorAdjustment)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.ColorAdjustment)
	end, { var17 })
	local var31 = nil
	local var32 = nil
	
	if fFlagAXAvatarSharingEntryPoint then
		var31 = reactModule.useCallback(function() --[[ line: 149 ]]
			-- upvalues: var17 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
			var17.navigate(avatarScreen.LookComposerPage, {
				prevNavPage = if var17.state and var17.state.key then var17.state.key else nil
			})
			slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.SharedCommunityAvatars.ShareAvatar)
		end, { var17 })
		var32 = reactModule.useCallback(function() --[[ line: 157 ]]
			-- upvalues: var17 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
			var17.navigate(avatarScreen.MySharedAvatars)
			slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.SharedCommunityAvatars.MyPublishedAvatars)
		end, { var17 })
	end
	local var33 = reactModule.useCallback(function() --[[ line: 163 ]]
		-- upvalues: p1 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		if p1.onInventoryActivated then
			p1.onInventoryActivated()
		end
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.More.Inventory)
	end, { p1.onInventoryActivated })
	local var34 = reactModule.useCallback(function() --[[ line: 170 ]]
		-- upvalues: var17 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var17.navigate(avatarScreen.EditEmotes)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.More.Emotes)
	end, { var17 })
	local useCallback = reactModule.useCallback
	useCallback = useCallback(function() --[[ line: 175 ]]
		-- upvalues: var17 (ref), fFlagEditProfileImageV2Enabled2 (copy), avatarScreen (copy), var18 (write), fFlagAXUseProfileIconEntryPoint (copy), t (copy), fFlagAXPPEReturnToEntrySurface (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		local var39 = if var17.state and var17.state.key then var17.state.key else nil
		
		if fFlagEditProfileImageV2Enabled2 then
			var17.navigate(avatarScreen.EditProfileImage, { prevNavPage = var39 })
		else
			local var40 = if var18 then var18.opaque.name else var39
			local var41 = if fFlagAXUseProfileIconEntryPoint and t[var40] then avatarScreen.Profile else avatarScreen.ProfilePictureEditorEmotes
			var17.navigate(var41, if var41 == avatarScreen.Profile then {
				entryOrigin = {
					screenName = var40,
					screenParams = if var18 then var18.opaque.params else nil
				}
			} elseif fFlagAXPPEReturnToEntrySurface then {
				entryOrigin = if var18 then {
					screenName = var18.opaque.name,
					screenParams = var18.opaque.params
				} else nil
			} else { prevNavPage = var39 })
		end
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.More.ProfilePhoto)
	end, {
		var17,
		if fFlagAXUseProfileIconEntryPoint or fFlagAXPPEReturnToEntrySurface then var18 else nil
	})
	local var35 = if fFlagAXPhotoboothFunctionality then reactModule.useCallback(function() --[[ line: 218 ]]
		-- upvalues: var17 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var17.navigate(avatarScreen.Photobooth)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.Photobooth.Photobooth)
	end, { var17 }) else nil
	local var36 = if fFlagAXFavoritesManagerNavEntry then reactModule.useCallback(function() --[[ line: 226 ]]
		-- upvalues: var17 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var17.navigate(avatarScreen.FavoritesSaved)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.Main.Favorites)
	end, { var17 }) else nil
	local var37 = if fFlagAXHideHeadAdjustmentForDefaultHead then useSelector(selectHasDynamicHead) else nil
	local var38 = if fFlagAXResetAvatarButton then useUndoRedoBarViewModelModule() else nil
	
	return {
		config = reactModule.useMemo(function() --[[ line: 242 ]]
			-- upvalues: menuItemEnumModule (copy), p1 (ref), getRbxthumbWithTypeSizeAndOptions (copy), var22 (ref), avatarHeadShot (copy), fFlagAXRootSlotBasedEditorFlag (copy), useCallback (ref), var24 (ref), fFlagAXUseProfileIconEntryPoint (copy), var19 (ref), fFlagAXMigrateBuilderIcons (copy), iconName (copy), slotBasedEditorAnalytics (copy), var23 (ref), var16 (ref), var25 (ref), var26 (ref), var27 (ref), fFlagAXHideHeadAdjustmentForDefaultHead (copy), var37 (ref), var28 (ref), var29 (ref), var20 (ref), var30 (ref), fFlagAXAvatarSharingEntryPoint (copy), var31 (write), var32 (write), var33 (ref), var21 (ref), var34 (ref), fFlagAXPhotoboothFunctionality (copy), var35 (write), fFlagAXFavoritesManagerNavEntry (copy), var36 (write), fFlagAXResetAvatarButton (copy), var38 (ref)
			local var44
			local t = {}
			local t_1 = {
				type = "image",
				id = menuItemEnumModule.Main.AvatarSwitcher,
				thumbnailUrl = if p1.thumbnailUrl then p1.thumbnailUrl else getRbxthumbWithTypeSizeAndOptions(var22, avatarHeadShot, 150, true, true),
				onActivated = if fFlagAXRootSlotBasedEditorFlag then useCallback else var24,
				visible = if fFlagAXUseProfileIconEntryPoint then not var19 else nil,
				hideIndicator = if fFlagAXRootSlotBasedEditorFlag then true else nil
			}
			
			if p1.focusAnimation then
				var44 = p1.focusAnimation.enabled
				
				if var44 then
					var44 = p1.focusAnimation.menuItemId == menuItemEnumModule.Main.AvatarSwitcher
					var44 = nil
				end
			else
				var44 = nil
			end
			t_1.enableFocusAnimation = var44
			-- Unknown statement at pc 1: <SetList>
			
			if fFlagAXFavoritesManagerNavEntry then
				table.insert(t, {
					type = "icon",
					isActive = false,
					id = menuItemEnumModule.Main.Favorites,
					icon = iconName.Star,
					onActivated = var36
				})
			end
			if fFlagAXResetAvatarButton and p1.showUndoRedo then
				table.insert(t, {
					type = "divider",
					id = menuItemEnumModule.UndoRedoDivider
				})
				
				for i, v in var38.items do
					table.insert(t, v)
				end
			end
			return t
		end, {
			var22, var24, var25, var26, var27, var28, var33, var34, useCallback, var30,
			var20, var21, p1.thumbnailUrl, p1.focusAnimation,
			if fFlagAXResetAvatarButton then p1.showUndoRedo else nil,
			if fFlagAXResetAvatarButton then var38 else nil,
			if fFlagAXHideHeadAdjustmentForDefaultHead then var37 else nil,
			if fFlagAXUseProfileIconEntryPoint then var19 else nil
		})
	}
end