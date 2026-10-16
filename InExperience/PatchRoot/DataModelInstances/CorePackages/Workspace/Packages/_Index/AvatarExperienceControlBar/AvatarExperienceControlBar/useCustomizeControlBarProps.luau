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
local fFlagMeProfileEntryTooltipEnabled = avatarExperienceFlagsModule.FFlagMeProfileEntryTooltipEnabled
local useMeProfileEntryTooltipModule = require(avatarExperienceControlBar.Hooks.useMeProfileEntryTooltip)
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
	-- upvalues: useSemanticTokensModule (ref), useNavigation (ref), fFlagAXUseProfileIconEntryPoint (ref), fFlagAXPPEReturnToEntrySurface (ref), useAvatarRoute (ref), avatarScreen (ref), useSelector (ref), selectColorAdjustmentButtonColor (ref), responsiveModule (ref), selectUserId (ref), fFlagMeProfileEntryTooltipEnabled (ref), useMeProfileEntryTooltipModule (ref), fFlagAXRootSlotBasedEditorFlag (ref), t (ref), useLocalization (ref), fFlagAXAvatarSharingEntryPoint (ref), fFlagAXPhotoboothFunctionality (ref), reactModule (ref), slotBasedEditorAnalytics (ref), menuItemEnumModule (ref), fFlagEditProfileImageV2Enabled (ref), fFlagAXFavoritesManagerNavEntry (ref), fFlagAXHideHeadAdjustmentForDefaultHead (ref), selectHasDynamicHead (ref), fFlagAXResetAvatarButton (ref), useUndoRedoBarViewModelModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), avatarHeadShot (ref), fFlagControlBarUseProfileFrameThumbnail (ref), fFlagAXMigrateBuilderIcons (ref), iconName (ref)
	local var1 = useSemanticTokensModule()
	local var2 = useNavigation()
	local var3 = if fFlagAXUseProfileIconEntryPoint or fFlagAXPPEReturnToEntrySurface then useAvatarRoute() else nil
	local var4 = fFlagAXUseProfileIconEntryPoint and (var3 ~= nil and var3.opaque.name == avatarScreen.Profile)
	local var5 = useSelector(selectColorAdjustmentButtonColor)
	local var6 = responsiveModule.useOrientation() == responsiveModule.Keys.Portrait
	local var7 = useSelector(selectUserId)
	local var8 = nil
	
	if fFlagMeProfileEntryTooltipEnabled then
		var8 = useMeProfileEntryTooltipModule(fFlagAXRootSlotBasedEditorFlag and (var3 ~= nil and (var3.isVisible and (not var3.isOverlayVisible and (var3.current.key == var2.state.key and t[var3.current.name] == true)))), if var3 then var3.current.key else nil)
	end
	local var9 = useLocalization({
		adjustAccessory = "Feature.Avatar.Label.Title.AccessoryAdjustment",
		bodyShape = "Feature.Avatar.Label.Title.BodyShape",
		clothingLayering = "Feature.Avatar.Label.Title.ClothingLayering",
		makeupLayering = "Feature.Avatar.Label.Title.MakeupLayering",
		headAdjustment = "Feature.Avatar.Label.Title.HeadAdjustment",
		inventory = "Feature.Avatar.Label.Title.Inventory",
		emotes = "Feature.Avatar.Label.Title.Emotes",
		profilePhoto = "Feature.Avatar.Label.Title.ProfilePhoto",
		skinColor = "Feature.Avatar.ColorAdjustmentPage.Title",
		profileTooltip = if fFlagMeProfileEntryTooltipEnabled then "Feature.Avatar.profile.tooltip" else nil,
		shareAvatar = if fFlagAXAvatarSharingEntryPoint then "Feature.Avatar.Action.ShareAvatar" else nil,
		myPublishedAvatars = if fFlagAXAvatarSharingEntryPoint then "Feature.Avatar.Action.MyPublishedAvatars" else nil,
		photobooth = if fFlagAXPhotoboothFunctionality then "Feature.Avatar.Label.Photobooth" else nil
	})
	local var10 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.AvatarSwitcher)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.Main.AvatarSwitcher)
	end, { var2 })
	local var11 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.AccessoryAdjustment)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.AdjustAccessory)
	end, { var2 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.BodyShape)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.BodyScale)
	end, { var2 })
	local var13 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.HeadRefinement)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.CustomizeHead)
	end, { var2 })
	local var14 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.LayeredClothingSort)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.ClothingLayers)
	end, { var2 })
	local var15 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.LayeredMakeupSort)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.MakeupLayers)
	end, { var2 })
	local var16 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.ColorAdjustment)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.ColorAdjustment)
	end, { var2 })
	local var17 = nil
	local var18 = nil
	
	if fFlagAXAvatarSharingEntryPoint then
		var17 = reactModule.useCallback(function()
			-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
			var2.navigate(avatarScreen.LookComposerPage, {
				prevNavPage = if var2.state and var2.state.key then var2.state.key else nil
			})
			slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.SharedCommunityAvatars.ShareAvatar)
		end, { var2 })
		var18 = reactModule.useCallback(function()
			-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
			var2.navigate(avatarScreen.MySharedAvatars)
			slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.SharedCommunityAvatars.MyPublishedAvatars)
		end, { var2 })
	end
	local var19 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		if p1.onInventoryActivated then
			p1.onInventoryActivated()
		end
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.More.Inventory)
	end, { p1.onInventoryActivated })
	local var20 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.EditEmotes)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.More.Emotes)
	end, { var2 })
	local useCallback = reactModule.useCallback
	useCallback = useCallback(function()
		-- upvalues: var2 (ref), fFlagEditProfileImageV2Enabled (copy), var3 (write), fFlagAXUseProfileIconEntryPoint (copy), t (copy), avatarScreen (copy), fFlagMeProfileEntryTooltipEnabled (copy), var8 (write), fFlagAXPPEReturnToEntrySurface (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		local var21 = if var2.state and var2.state.key then var2.state.key else nil
		
		if fFlagEditProfileImageV2Enabled then
			local var22 = if var3 then var3.opaque.name else var21
			
			if fFlagAXUseProfileIconEntryPoint and t[var22] then
				var2.navigate(avatarScreen.Profile, {
					entryOrigin = {
						screenName = var22,
						screenParams = if var3 then var3.opaque.params else nil
					}
				})
				
				if fFlagMeProfileEntryTooltipEnabled and var8 then
					var8.dismiss()
				end
			elseif fFlagAXPPEReturnToEntrySurface then
				var2.navigate(avatarScreen.EditProfileImage, {
					entryOrigin = if var3 then {
						screenName = var3.opaque.name,
						screenParams = var3.opaque.params
					} else nil
				})
			else
				var2.navigate(avatarScreen.EditProfileImage, { prevNavPage = var21 })
			end
		else
			local var23 = if var3 then var3.opaque.name else var21
			local var24 = if fFlagAXUseProfileIconEntryPoint and t[var23] then avatarScreen.Profile else avatarScreen.ProfilePictureEditorEmotes
			var2.navigate(var24, if var24 == avatarScreen.Profile then {
				entryOrigin = {
					screenName = var23,
					screenParams = if var3 then var3.opaque.params else nil
				}
			} elseif fFlagAXPPEReturnToEntrySurface then {
				entryOrigin = if var3 then {
					screenName = var3.opaque.name,
					screenParams = var3.opaque.params
				} else nil
			} else { prevNavPage = var21 })
			
			if fFlagMeProfileEntryTooltipEnabled and var8 and var24 == avatarScreen.Profile then
				var8.dismiss()
			end
		end
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.More.ProfilePhoto)
	end, {
		var2,
		if fFlagAXUseProfileIconEntryPoint or fFlagAXPPEReturnToEntrySurface then var3 else nil,
		if fFlagMeProfileEntryTooltipEnabled and var8 then var8.dismiss else nil
	})
	local var21 = if fFlagAXPhotoboothFunctionality then reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.Photobooth)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.Photobooth.Photobooth)
	end, { var2 }) else nil
	local var22 = if fFlagAXFavoritesManagerNavEntry then reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.FavoritesSaved)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.Main.Favorites)
	end, { var2 }) else nil
	local var23 = if fFlagAXHideHeadAdjustmentForDefaultHead then useSelector(selectHasDynamicHead) else nil
	local var24 = if fFlagAXResetAvatarButton then useUndoRedoBarViewModelModule() else nil
	
	return {
		config = reactModule.useMemo(function()
			-- upvalues: menuItemEnumModule (copy), p1 (ref), getRbxthumbWithTypeSizeAndOptions (copy), var7 (ref), avatarHeadShot (copy), fFlagControlBarUseProfileFrameThumbnail (copy), fFlagAXRootSlotBasedEditorFlag (copy), useCallback (ref), var10 (ref), fFlagAXUseProfileIconEntryPoint (copy), var4 (ref), fFlagMeProfileEntryTooltipEnabled (copy), var8 (write), var9 (ref), fFlagAXMigrateBuilderIcons (copy), iconName (copy), slotBasedEditorAnalytics (copy), var1 (ref), var11 (ref), var12 (ref), var13 (ref), fFlagAXHideHeadAdjustmentForDefaultHead (copy), var23 (ref), var14 (ref), var15 (ref), var5 (ref), var16 (ref), fFlagAXAvatarSharingEntryPoint (copy), var17 (write), var18 (write), var19 (ref), var6 (ref), var20 (ref), fFlagAXPhotoboothFunctionality (copy), var21 (write), fFlagAXFavoritesManagerNavEntry (copy), var22 (write), fFlagAXResetAvatarButton (copy), var24 (ref)
			local var25
			local t = {}
			local t_1 = {
				type = "image",
				id = menuItemEnumModule.Main.AvatarSwitcher,
				thumbnailUrl = if p1.thumbnailUrl then p1.thumbnailUrl else getRbxthumbWithTypeSizeAndOptions(var7, avatarHeadShot, 150, true, true, fFlagControlBarUseProfileFrameThumbnail),
				onActivated = if fFlagAXRootSlotBasedEditorFlag then useCallback else var10,
				visible = if fFlagAXUseProfileIconEntryPoint then not var4 else nil,
				hideIndicator = if fFlagAXRootSlotBasedEditorFlag then true else nil,
				toolTipConfig = if fFlagMeProfileEntryTooltipEnabled and var8 then {
					compact = true,
					bodyText = var9.profileTooltip,
					open = var8.showTooltip,
					onShown = var8.onShown,
					onDismiss = var8.dismiss
				} else nil
			}
			
			if p1.focusAnimation then
				var25 = p1.focusAnimation.enabled
				
				if var25 then
					var25 = p1.focusAnimation.menuItemId == menuItemEnumModule.Main.AvatarSwitcher
					var25 = nil
				end
			else
				var25 = nil
			end
			t_1.enableFocusAnimation = var25
			-- Unknown statement at pc 1: <SetList>
			
			if fFlagAXFavoritesManagerNavEntry then
				table.insert(t, {
					type = "icon",
					isActive = false,
					id = menuItemEnumModule.Main.Favorites,
					icon = iconName.Star,
					onActivated = var22
				})
			end
			if fFlagAXResetAvatarButton and p1.showUndoRedo then
				table.insert(t, {
					type = "divider",
					id = menuItemEnumModule.UndoRedoDivider
				})
				
				for i, v in var24.items do
					table.insert(t, v)
				end
			end
			return t
		end, {
			var7, var10, var11, var12, var13, var14, var19, var20, useCallback, var16,
			var5, var6, p1.thumbnailUrl, p1.focusAnimation,
			if fFlagAXResetAvatarButton then p1.showUndoRedo else nil,
			if fFlagAXResetAvatarButton then var24 else nil,
			if fFlagAXHideHeadAdjustmentForDefaultHead then var23 else nil,
			if fFlagAXUseProfileIconEntryPoint then var4 else nil,
			if fFlagMeProfileEntryTooltipEnabled and var8 then var8.showTooltip else nil,
			if fFlagMeProfileEntryTooltipEnabled and var3 then var3.opaque.name else nil,
			if fFlagMeProfileEntryTooltipEnabled then var9.profileTooltip else nil
		})
	}
end