local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local userLibModule = require(parent.UserLib)
local navigationModule = require(parent.Navigation)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
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
local fFlagAXMigrateBuilderIcons = avatarExperienceFlagsModule.FFlagAXMigrateBuilderIcons
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
	-- upvalues: useSemanticTokensModule (ref), useNavigation (ref), fFlagAXUseProfileIconEntryPoint (ref), fFlagAXPPEReturnToEntrySurface (ref), useAvatarRoute (ref), avatarScreen (ref), useSelector (ref), selectColorAdjustmentButtonColor (ref), selectUserId (ref), fFlagMeProfileEntryTooltipEnabled (ref), useMeProfileEntryTooltipModule (ref), t (ref), useLocalization (ref), fFlagAXAvatarSharingEntryPoint (ref), reactModule (ref), slotBasedEditorAnalytics (ref), menuItemEnumModule (ref), fFlagEditProfileImageV2Enabled (ref), fFlagAXFavoritesManagerNavEntry (ref), fFlagAXHideHeadAdjustmentForDefaultHead (ref), selectHasDynamicHead (ref), fFlagAXResetAvatarButton (ref), useUndoRedoBarViewModelModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), avatarHeadShot (ref), fFlagControlBarUseProfileFrameThumbnail (ref), fFlagAXMigrateBuilderIcons (ref), iconName (ref)
	local var1 = useSemanticTokensModule()
	local var2 = useNavigation()
	local var3 = if fFlagAXUseProfileIconEntryPoint or fFlagAXPPEReturnToEntrySurface then useAvatarRoute() else nil
	local var4 = fFlagAXUseProfileIconEntryPoint and (var3 ~= nil and var3.opaque.name == avatarScreen.Profile)
	local var5 = useSelector(selectColorAdjustmentButtonColor)
	local var6 = useSelector(selectUserId)
	local var7 = nil
	
	if fFlagMeProfileEntryTooltipEnabled then
		var7 = useMeProfileEntryTooltipModule(var3 ~= nil and (var3.isVisible and (not var3.isOverlayVisible and (var3.current.key == var2.state.key and t[var3.current.name] == true))), if var3 then var3.current.key else nil)
	end
	local var8 = useLocalization({
		adjustAccessory = "Feature.Avatar.Label.Title.AccessoryAdjustment",
		bodyShape = "Feature.Avatar.Label.Title.BodyShape",
		clothingLayering = "Feature.Avatar.Label.Title.ClothingLayering",
		makeupLayering = "Feature.Avatar.Label.Title.MakeupLayering",
		headAdjustment = "Feature.Avatar.Label.Title.HeadAdjustment",
		profilePhoto = "Feature.Avatar.Label.Title.ProfilePhoto",
		skinColor = "Feature.Avatar.ColorAdjustmentPage.Title",
		profileTooltip = if fFlagMeProfileEntryTooltipEnabled then "Feature.Avatar.profile.tooltip" else nil,
		shareAvatar = if fFlagAXAvatarSharingEntryPoint then "Feature.Avatar.Action.ShareAvatar" else nil,
		myPublishedAvatars = if fFlagAXAvatarSharingEntryPoint then "Feature.Avatar.Action.MyPublishedAvatars" else nil
	})
	local var9 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.AccessoryAdjustment)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.AdjustAccessory)
	end, { var2 })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.BodyShape)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.BodyScale)
	end, { var2 })
	local var11 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.HeadRefinement)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.CustomizeHead)
	end, { var2 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.LayeredClothingSort)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.ClothingLayers)
	end, { var2 })
	local var13 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.LayeredMakeupSort)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.MakeupLayers)
	end, { var2 })
	local var14 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.ColorAdjustment)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.AvatarRefinement.ColorAdjustment)
	end, { var2 })
	local var15 = nil
	local var16 = nil
	
	if fFlagAXAvatarSharingEntryPoint then
		var15 = reactModule.useCallback(function()
			-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
			var2.navigate(avatarScreen.LookComposerPage, {
				prevNavPage = if var2.state and var2.state.key then var2.state.key else nil
			})
			slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.SharedCommunityAvatars.ShareAvatar)
		end, { var2 })
		var16 = reactModule.useCallback(function()
			-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
			var2.navigate(avatarScreen.MySharedAvatars)
			slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.SharedCommunityAvatars.MyPublishedAvatars)
		end, { var2 })
	end
	local useCallback = reactModule.useCallback
	useCallback = useCallback(function()
		-- upvalues: var2 (ref), fFlagEditProfileImageV2Enabled (copy), var3 (write), fFlagAXUseProfileIconEntryPoint (copy), t (copy), avatarScreen (copy), fFlagMeProfileEntryTooltipEnabled (copy), var7 (write), fFlagAXPPEReturnToEntrySurface (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		local var17 = if var2.state and var2.state.key then var2.state.key else nil
		
		if fFlagEditProfileImageV2Enabled then
			local var18 = if var3 then var3.opaque.name else var17
			
			if fFlagAXUseProfileIconEntryPoint and t[var18] then
				var2.navigate(avatarScreen.Profile, {
					entryOrigin = {
						screenName = var18,
						screenParams = if var3 then var3.opaque.params else nil
					}
				})
				
				if fFlagMeProfileEntryTooltipEnabled and var7 then
					var7.dismiss()
				end
			elseif fFlagAXPPEReturnToEntrySurface then
				var2.navigate(avatarScreen.EditProfileImage, {
					entryOrigin = if var3 then {
						screenName = var3.opaque.name,
						screenParams = var3.opaque.params
					} else nil
				})
			else
				var2.navigate(avatarScreen.EditProfileImage, { prevNavPage = var17 })
			end
		else
			local var19 = if var3 then var3.opaque.name else var17
			local var20 = if fFlagAXUseProfileIconEntryPoint and t[var19] then avatarScreen.Profile else avatarScreen.ProfilePictureEditorEmotes
			var2.navigate(var20, if var20 == avatarScreen.Profile then {
				entryOrigin = {
					screenName = var19,
					screenParams = if var3 then var3.opaque.params else nil
				}
			} elseif fFlagAXPPEReturnToEntrySurface then {
				entryOrigin = if var3 then {
					screenName = var3.opaque.name,
					screenParams = var3.opaque.params
				} else nil
			} else { prevNavPage = var17 })
			
			if fFlagMeProfileEntryTooltipEnabled and var7 and var20 == avatarScreen.Profile then
				var7.dismiss()
			end
		end
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.More.ProfilePhoto)
	end, {
		var2,
		if fFlagAXUseProfileIconEntryPoint or fFlagAXPPEReturnToEntrySurface then var3 else nil,
		if fFlagMeProfileEntryTooltipEnabled and var7 then var7.dismiss else nil
	})
	local var17 = if fFlagAXFavoritesManagerNavEntry then reactModule.useCallback(function()
		-- upvalues: var2 (ref), avatarScreen (copy), slotBasedEditorAnalytics (copy), menuItemEnumModule (copy)
		var2.navigate(avatarScreen.FavoritesSaved)
		slotBasedEditorAnalytics.trackControlBarClick(menuItemEnumModule.Main.Favorites)
	end, { var2 }) else nil
	local var18 = if fFlagAXHideHeadAdjustmentForDefaultHead then useSelector(selectHasDynamicHead) else nil
	local var19 = if fFlagAXResetAvatarButton then useUndoRedoBarViewModelModule() else nil
	
	return {
		config = reactModule.useMemo(function()
			-- upvalues: menuItemEnumModule (copy), p1 (ref), getRbxthumbWithTypeSizeAndOptions (copy), var6 (ref), avatarHeadShot (copy), fFlagControlBarUseProfileFrameThumbnail (copy), useCallback (ref), fFlagAXUseProfileIconEntryPoint (copy), var4 (ref), fFlagMeProfileEntryTooltipEnabled (copy), var7 (write), var8 (ref), fFlagAXMigrateBuilderIcons (copy), iconName (copy), slotBasedEditorAnalytics (copy), var1 (ref), var9 (ref), var10 (ref), var11 (ref), fFlagAXHideHeadAdjustmentForDefaultHead (copy), var18 (ref), var12 (ref), var13 (ref), var5 (ref), var14 (ref), fFlagAXAvatarSharingEntryPoint (copy), var15 (write), var16 (write), fFlagAXFavoritesManagerNavEntry (copy), var17 (write), fFlagAXResetAvatarButton (copy), var19 (ref)
			local var20
			local t = {}
			local t_1 = {
				type = "image",
				hideIndicator = true,
				id = menuItemEnumModule.Main.AvatarSwitcher,
				thumbnailUrl = if p1.thumbnailUrl then p1.thumbnailUrl else getRbxthumbWithTypeSizeAndOptions(var6, avatarHeadShot, 150, true, true, fFlagControlBarUseProfileFrameThumbnail),
				onActivated = useCallback,
				visible = if fFlagAXUseProfileIconEntryPoint then not var4 else nil,
				toolTipConfig = if fFlagMeProfileEntryTooltipEnabled and var7 then {
					compact = true,
					bodyText = var8.profileTooltip,
					open = var7.showTooltip,
					onShown = var7.onShown,
					onDismiss = var7.dismiss
				} else nil
			}
			
			if p1.focusAnimation then
				var20 = p1.focusAnimation.enabled
				
				if var20 then
					var20 = p1.focusAnimation.menuItemId == menuItemEnumModule.Main.AvatarSwitcher
					var20 = nil
				end
			else
				var20 = nil
			end
			t_1.enableFocusAnimation = var20
			-- Unknown statement at pc 1: <SetList>
			
			if fFlagAXFavoritesManagerNavEntry then
				table.insert(t, {
					type = "icon",
					isActive = false,
					id = menuItemEnumModule.Main.Favorites,
					icon = iconName.Star,
					onActivated = var17
				})
			end
			if fFlagAXResetAvatarButton and p1.showUndoRedo then
				table.insert(t, {
					type = "divider",
					id = menuItemEnumModule.UndoRedoDivider
				})
				
				for i, v in var19.items do
					table.insert(t, v)
				end
			end
			return t
		end, {
			var6, var9, var10, var11, var12, useCallback, var14, var5, p1.thumbnailUrl,
			p1.focusAnimation, if fFlagAXResetAvatarButton then p1.showUndoRedo else nil,
			if fFlagAXResetAvatarButton then var19 else nil,
			if fFlagAXHideHeadAdjustmentForDefaultHead then var18 else nil,
			if fFlagAXUseProfileIconEntryPoint then var4 else nil,
			if fFlagMeProfileEntryTooltipEnabled and var7 then var7.showTooltip else nil,
			if fFlagMeProfileEntryTooltipEnabled and var3 then var3.opaque.name else nil,
			if fFlagMeProfileEntryTooltipEnabled then var8.profileTooltip else nil
		})
	}
end