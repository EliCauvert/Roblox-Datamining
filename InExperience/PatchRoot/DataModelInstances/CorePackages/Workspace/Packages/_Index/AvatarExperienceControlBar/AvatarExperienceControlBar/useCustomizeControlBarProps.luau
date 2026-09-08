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
local fFlagControlBarUseProfileFrameThumbnail = avatarExperienceFlagsModule.FFlagControlBarUseProfileFrameThumbnail
local fFlagAXPPEReturnToEntrySurface = require(parent.SharedFlags).FFlagAXPPEReturnToEntrySurface
local fFlagEditProfileImageV2Enabled = require(parent.SharedFlags).FFlagEditProfileImageV2Enabled
local avatarHeadShot = constants.RbxthumbTypes.AvatarHeadShot
local t = {
	[avatarScreen.Catalog] = true,
	[avatarScreen.AvatarEditor] = true,
	[avatarScreen.MySharedAvatars] = true,
	[avatarScreen.CatalogSearch] = true,
	[avatarScreen.CatalogSearchLanding] = true,
	[avatarScreen.SearchLandingFocusedWidgetPage] = true
}

local function selectUserId(p1)
	return p1.LocalUserId
end

return function(p1)
	-- upvalues: useSemanticTokensModule (ref), useNavigation (ref), fFlagAXUseProfileIconEntryPoint (ref), fFlagAXPPEReturnToEntrySurface (ref), useAvatarRoute (ref), avatarScreen (ref), useSelector (ref), selectColorAdjustmentButtonColor (ref), responsiveModule (ref), selectUserId (ref), useLocalization (ref), fFlagAXAvatarSharingEntryPoint (ref), fFlagAXPhotoboothFunctionality (ref), reactModule (ref), slotBasedEditorAnalytics (ref), menuItemEnumModule (ref), fFlagEditProfileImageV2Enabled (ref), t (ref), fFlagAXFavoritesManagerNavEntry (ref), fFlagAXHideHeadAdjustmentForDefaultHead (ref), selectHasDynamicHead (ref), fFlagAXResetAvatarButton (ref), useUndoRedoBarViewModelModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), avatarHeadShot (ref), fFlagControlBarUseProfileFrameThumbnail (ref), fFlagAXRootSlotBasedEditorFlag (ref), fFlagAXMigrateBuilderIcons (ref), iconName (ref)
	local var1 = useSemanticTokensModule()
	local var2 = useNavigation()
	local var3 = if fFlagAXUseProfileIconEntryPoint or fFlagAXPPEReturnToEntrySurface then useAvatarRoute() else nil
	local var4 = fFlagAXUseProfileIconEntryPoint and (var3 ~= nil and var3.opaque.name == avatarScreen.Profile)
	local var5 = useSelector(selectColorAdjustmentButtonColor)
	local var6 = responsiveModule.useOrientation() == responsiveModule.Keys.Portrait
	local var7 = useSelector(selectUserId)
	local var8 = useLocalization({
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
	local var9 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.AvatarSwitcher)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.Main.AvatarSwitcher)
	end, { var2 })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.AccessoryAdjustment)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.AdjustAccessory)
	end, { var2 })
	local var11 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.BodyShape)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.BodyScale)
	end, { var2 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.HeadRefinement)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.CustomizeHead)
	end, { var2 })
	local var13 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.LayeredClothingSort)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.ClothingLayers)
	end, { var2 })
	local var14 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.LayeredMakeupSort)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.MakeupLayers)
	end, { var2 })
	local var15 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.ColorAdjustment)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.ColorAdjustment)
	end, { var2 })
	local var16 = nil
	local var17 = nil
	
	if fFlagAXAvatarSharingEntryPoint then
		var16 = reactModule.useCallback(function()
			-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
			var2.navigate(avatarScreen.LookComposerPage, {
				prevNavPage = if var2.state and var2.state.key then var2.state.key else nil
			})
			slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.SharedCommunityAvatars.ShareAvatar)
		end, { var2 })
		var17 = reactModule.useCallback(function()
			-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
			var2.navigate(avatarScreen.MySharedAvatars)
			slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.SharedCommunityAvatars.MyPublishedAvatars)
		end, { var2 })
	end
	local var18 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		if p1.onInventoryActivated then
			p1.onInventoryActivated()
		end
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.More.Inventory)
	end, { p1.onInventoryActivated })
	local var19 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.EditEmotes)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.More.Emotes)
	end, { var2 })
	local useCallback = reactModule.useCallback
	useCallback = useCallback(function()
		-- upvalues: var2 (ref), fFlagEditProfileImageV2Enabled (copy), var3 (write), fFlagAXUseProfileIconEntryPoint (copy), t (copy), avatarScreen (copy), fFlagAXPPEReturnToEntrySurface (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		local var20 = if var2.state and var2.state.key then var2.state.key else nil
		
		if fFlagEditProfileImageV2Enabled then
			local var21 = if var3 then var3.opaque.name else var20
			
			if fFlagAXUseProfileIconEntryPoint and t[var21] then
				var2.navigate(avatarScreen.Profile, {
					entryOrigin = {
						screenName = var21,
						screenParams = if var3 then var3.opaque.params else nil
					}
				})
			elseif fFlagAXPPEReturnToEntrySurface then
				var2.navigate(avatarScreen.EditProfileImage, {
					entryOrigin = if var3 then {
						screenName = var3.opaque.name,
						screenParams = var3.opaque.params
					} else nil
				})
			else
				var2.navigate(avatarScreen.EditProfileImage, { prevNavPage = var20 })
			end
		else
			local var22 = if var3 then var3.opaque.name else var20
			local var23 = if fFlagAXUseProfileIconEntryPoint and t[var22] then avatarScreen.Profile else avatarScreen.ProfilePictureEditorEmotes
			var2.navigate(var23, if var23 == avatarScreen.Profile then {
				entryOrigin = {
					screenName = var22,
					screenParams = if var3 then var3.opaque.params else nil
				}
			} elseif fFlagAXPPEReturnToEntrySurface then {
				entryOrigin = if var3 then {
					screenName = var3.opaque.name,
					screenParams = var3.opaque.params
				} else nil
			} else { prevNavPage = var20 })
		end
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.More.ProfilePhoto)
	end, {
		var2,
		if fFlagAXUseProfileIconEntryPoint or fFlagAXPPEReturnToEntrySurface then var3 else nil
	})
	local var20 = if fFlagAXPhotoboothFunctionality then reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.Photobooth)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.Photobooth.Photobooth)
	end, { var2 }) else nil
	local var21 = if fFlagAXFavoritesManagerNavEntry then reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.FavoritesSaved)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.Main.Favorites)
	end, { var2 }) else nil
	local var22 = if fFlagAXHideHeadAdjustmentForDefaultHead then useSelector(selectHasDynamicHead) else nil
	local var23 = if fFlagAXResetAvatarButton then useUndoRedoBarViewModelModule() else nil
	
	return {
		config = reactModule.useMemo(function()
			-- upvalues: menuItemEnumModule (copy), p1 (ref), getRbxthumbWithTypeSizeAndOptions (copy), var7 (ref), avatarHeadShot (copy), fFlagControlBarUseProfileFrameThumbnail (copy), fFlagAXRootSlotBasedEditorFlag (copy), useCallback (ref), var9 (ref), fFlagAXUseProfileIconEntryPoint (copy), var4 (ref), fFlagAXMigrateBuilderIcons (copy), iconName (copy), slotBasedEditorAnalytics (copy), var8 (ref), var1 (ref), var10 (ref), var11 (ref), var12 (ref), fFlagAXHideHeadAdjustmentForDefaultHead (copy), var22 (ref), var13 (ref), var14 (ref), var5 (ref), var15 (ref), fFlagAXAvatarSharingEntryPoint (copy), var16 (write), var17 (write), var18 (ref), var6 (ref), var19 (ref), fFlagAXPhotoboothFunctionality (copy), var20 (write), fFlagAXFavoritesManagerNavEntry (copy), var21 (write), fFlagAXResetAvatarButton (copy), var23 (ref)
			local var24
			local t = {}
			local t_1 = {
				type = "image",
				id = menuItemEnumModule.Main.AvatarSwitcher,
				thumbnailUrl = if p1.thumbnailUrl then p1.thumbnailUrl else getRbxthumbWithTypeSizeAndOptions(var7, avatarHeadShot, 150, true, true, fFlagControlBarUseProfileFrameThumbnail),
				onActivated = if fFlagAXRootSlotBasedEditorFlag then useCallback else var9,
				visible = if fFlagAXUseProfileIconEntryPoint then not var4 else nil,
				hideIndicator = if fFlagAXRootSlotBasedEditorFlag then true else nil
			}
			
			if p1.focusAnimation then
				var24 = p1.focusAnimation.enabled
				
				if var24 then
					var24 = p1.focusAnimation.menuItemId == menuItemEnumModule.Main.AvatarSwitcher
					var24 = nil
				end
			else
				var24 = nil
			end
			t_1.enableFocusAnimation = var24
			-- Unknown statement at pc 1: <SetList>
			
			if fFlagAXFavoritesManagerNavEntry then
				table.insert(t, {
					type = "icon",
					isActive = false,
					id = menuItemEnumModule.Main.Favorites,
					icon = iconName.Star,
					onActivated = var21
				})
			end
			if fFlagAXResetAvatarButton and p1.showUndoRedo then
				table.insert(t, {
					type = "divider",
					id = menuItemEnumModule.UndoRedoDivider
				})
				
				for i, v in var23.items do
					table.insert(t, v)
				end
			end
			return t
		end, {
			var7, var9, var10, var11, var12, var13, var18, var19, useCallback, var15,
			var5, var6, p1.thumbnailUrl, p1.focusAnimation,
			if fFlagAXResetAvatarButton then p1.showUndoRedo else nil,
			if fFlagAXResetAvatarButton then var23 else nil,
			if fFlagAXHideHeadAdjustmentForDefaultHead then var22 else nil,
			if fFlagAXUseProfileIconEntryPoint then var4 else nil
		})
	}
end