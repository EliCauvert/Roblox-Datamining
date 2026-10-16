local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local Parent = AvatarExperienceControlBar.Parent
local ReactModule = require(Parent.React)
local UserLibModule = require(Parent.UserLib)
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local SelectColorAdjustmentButtonColor = AvatarExperienceCommonModule.State.Selectors.selectColorAdjustmentButtonColor
local SelectHasDynamicHead = AvatarExperienceCommonModule.State.Selectors.selectHasDynamicHead
local SlotBasedEditorAnalytics = require(Parent.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseSemanticTokensModule = require(AvatarExperienceControlBar.Hooks.useSemanticTokens)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseUndoRedoBarViewModelModule = require(script.Parent.UndoRedoBar.useUndoRedoBarViewModel)
local IconName = require(Parent.Foundation).Enums.IconName
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local MenuItemEnumModule = require(AvatarExperienceControlBar.Enums.MenuItemEnum)
local _ = require(AvatarExperienceControlBar.ControlBarTypes)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXAvatarSharingEntryPoint = AvatarExperienceFlagsModule.FFlagAXAvatarSharingEntryPoint
local FFlagAXMigrateBuilderIcons = AvatarExperienceFlagsModule.FFlagAXMigrateBuilderIcons
local FFlagAXResetAvatarButton = require(Parent.AvatarExperienceFlags).FFlagAXResetAvatarButton
local FFlagAXHideHeadAdjustmentForDefaultHead = require(Parent.AvatarExperienceFlags).FFlagAXHideHeadAdjustmentForDefaultHead
local FFlagAXFavoritesManagerNavEntry = require(Parent.AvatarExperienceFlags).FFlagAXFavoritesManagerNavEntry
local FFlagAXUseProfileIconEntryPoint = AvatarExperienceFlagsModule.FFlagAXUseProfileIconEntryPoint
local FFlagMeProfileEntryTooltipEnabled = AvatarExperienceFlagsModule.FFlagMeProfileEntryTooltipEnabled
local UseMeProfileEntryTooltipModule = require(AvatarExperienceControlBar.Hooks.useMeProfileEntryTooltip)
local FFlagControlBarUseProfileFrameThumbnail = AvatarExperienceFlagsModule.FFlagControlBarUseProfileFrameThumbnail
local FFlagAXPPEReturnToEntrySurface = require(Parent.SharedFlags).FFlagAXPPEReturnToEntrySurface
local FFlagEditProfileImageV2Enabled = require(Parent.SharedFlags).FFlagEditProfileImageV2Enabled
local AvatarHeadShot = UserLibModule.Utils.Constants.RbxthumbTypes.AvatarHeadShot
local config = {
	[AvatarScreen.Catalog] = true,
	[AvatarScreen.AvatarEditor] = true,
	[AvatarScreen.MySharedAvatars] = true,
	[AvatarScreen.CatalogSearch] = true,
	[AvatarScreen.CatalogSearchLanding] = true,
	[AvatarScreen.SearchLandingFocusedWidgetPage] = true
}

local function selectUserId(p1) --[[ Line: 62 ]]
	return p1.LocalUserId
end

return function(p1) --[[ Line: 79 | Named "useCustomizeControlBarProps" ]]
	-- upvalues: UseSemanticTokensModule (copy), UseNavigationFunction (copy), FFlagAXUseProfileIconEntryPoint (copy), FFlagAXPPEReturnToEntrySurface (copy), UseAvatarRouteFunction (copy), AvatarScreen (copy), UseSelectorFunction (copy), SelectColorAdjustmentButtonColor (copy), selectUserId (copy), FFlagMeProfileEntryTooltipEnabled (copy), UseMeProfileEntryTooltipModule (copy), config (copy), UseLocalizationFunction (copy), FFlagAXAvatarSharingEntryPoint (copy), ReactModule (copy), SlotBasedEditorAnalytics (copy), MenuItemEnumModule (copy), FFlagEditProfileImageV2Enabled (copy), FFlagAXFavoritesManagerNavEntry (copy), FFlagAXHideHeadAdjustmentForDefaultHead (copy), SelectHasDynamicHead (copy), FFlagAXResetAvatarButton (copy), UseUndoRedoBarViewModelModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), AvatarHeadShot (copy), FFlagControlBarUseProfileFrameThumbnail (copy), FFlagAXMigrateBuilderIcons (copy), IconName (copy)
	local UseSemanticTokensModuleResult = UseSemanticTokensModule()
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = if FFlagAXUseProfileIconEntryPoint or FFlagAXPPEReturnToEntrySurface then UseAvatarRouteFunction() else nil
	local IsNameMatch: boolean = FFlagAXUseProfileIconEntryPoint and (UseAvatarRouteResult ~= nil and UseAvatarRouteResult.opaque.name == AvatarScreen.Profile)
	local UseSelectorResult = UseSelectorFunction(SelectColorAdjustmentButtonColor)
	local UseSelectorResult1 = UseSelectorFunction(selectUserId)
	local UseMeProfileEntryTooltipModuleResult = if FFlagMeProfileEntryTooltipEnabled then UseMeProfileEntryTooltipModule(UseAvatarRouteResult ~= nil and (UseAvatarRouteResult.isVisible and (not UseAvatarRouteResult.isOverlayVisible and (UseAvatarRouteResult.current.key == UseNavigationResult.state.key and config[UseAvatarRouteResult.current.name] == true))), if UseAvatarRouteResult then UseAvatarRouteResult.current.key else nil) else nil
	local UseLocalizationResult = UseLocalizationFunction({
		adjustAccessory = "Feature.Avatar.Label.Title.AccessoryAdjustment",
		bodyShape = "Feature.Avatar.Label.Title.BodyShape",
		clothingLayering = "Feature.Avatar.Label.Title.ClothingLayering",
		makeupLayering = "Feature.Avatar.Label.Title.MakeupLayering",
		headAdjustment = "Feature.Avatar.Label.Title.HeadAdjustment",
		profilePhoto = "Feature.Avatar.Label.Title.ProfilePhoto",
		skinColor = "Feature.Avatar.ColorAdjustmentPage.Title",
		profileTooltip = if FFlagMeProfileEntryTooltipEnabled then "Feature.Avatar.profile.tooltip" else nil,
		shareAvatar = if FFlagAXAvatarSharingEntryPoint then "Feature.Avatar.Action.ShareAvatar" else nil,
		myPublishedAvatars = if FFlagAXAvatarSharingEntryPoint then "Feature.Avatar.Action.MyPublishedAvatars" else nil
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 116 ]]
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.AccessoryAdjustment)
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.AvatarRefinement.AdjustAccessory)
	end, { UseNavigationResult })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 121 ]]
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.BodyShape)
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.AvatarRefinement.BodyScale)
	end, { UseNavigationResult })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 126 ]]
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.HeadRefinement)
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.AvatarRefinement.CustomizeHead)
	end, { UseNavigationResult })
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 131 ]]
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.LayeredClothingSort)
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.AvatarRefinement.ClothingLayers)
	end, { UseNavigationResult })
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 136 ]]
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.LayeredMakeupSort)
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.AvatarRefinement.MakeupLayers)
	end, { UseNavigationResult })
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 141 ]]
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.ColorAdjustment)
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.AvatarRefinement.ColorAdjustment)
	end, { UseNavigationResult })
	local UseResult6 = nil
	local UseResult7 = nil
	
	if FFlagAXAvatarSharingEntryPoint then
		UseResult6 = ReactModule.useCallback(function() --[[ Line: 148 ]]
			-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
			UseNavigationResult.navigate(AvatarScreen.LookComposerPage, {
				prevNavPage = if UseNavigationResult.state and UseNavigationResult.state.key then UseNavigationResult.state.key else nil
			})
			SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.SharedCommunityAvatars.ShareAvatar)
		end, { UseNavigationResult })
		UseResult7 = ReactModule.useCallback(function() --[[ Line: 156 ]]
			-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
			UseNavigationResult.navigate(AvatarScreen.MySharedAvatars)
			SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.SharedCommunityAvatars.MyPublishedAvatars)
		end, { UseNavigationResult })
	end
	local UseResult8 = ReactModule.useCallback(function() --[[ Line: 162 ]]
		-- upvalues: UseNavigationResult (copy), FFlagEditProfileImageV2Enabled (upval), UseAvatarRouteResult (ref), FFlagAXUseProfileIconEntryPoint (upval), config (upval), AvatarScreen (upval), FFlagMeProfileEntryTooltipEnabled (upval), UseMeProfileEntryTooltipModuleResult (ref), FFlagAXPPEReturnToEntrySurface (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		local Key = if UseNavigationResult.state and UseNavigationResult.state.key then UseNavigationResult.state.key else nil
		
		if FFlagEditProfileImageV2Enabled then
			local Name = if UseAvatarRouteResult then UseAvatarRouteResult.opaque.name else Key
			
			if FFlagAXUseProfileIconEntryPoint and config[Name] then
				UseNavigationResult.navigate(AvatarScreen.Profile, {
					entryOrigin = {
						screenName = Name,
						screenParams = if UseAvatarRouteResult then UseAvatarRouteResult.opaque.params else nil
					}
				})
				
				if FFlagMeProfileEntryTooltipEnabled and UseMeProfileEntryTooltipModuleResult then
					UseMeProfileEntryTooltipModuleResult.dismiss()
				end
			elseif FFlagAXPPEReturnToEntrySurface then
				UseNavigationResult.navigate(AvatarScreen.EditProfileImage, {
					entryOrigin = if UseAvatarRouteResult then {
						screenName = UseAvatarRouteResult.opaque.name,
						screenParams = UseAvatarRouteResult.opaque.params
					} else nil
				})
			else
				UseNavigationResult.navigate(AvatarScreen.EditProfileImage, { prevNavPage = Key })
			end
		else
			local Name1 = if UseAvatarRouteResult then UseAvatarRouteResult.opaque.name else Key
			local Profile = if FFlagAXUseProfileIconEntryPoint and config[Name1] then AvatarScreen.Profile else AvatarScreen.ProfilePictureEditorEmotes
			UseNavigationResult.navigate(Profile, if Profile == AvatarScreen.Profile then {
				entryOrigin = {
					screenName = Name1,
					screenParams = if UseAvatarRouteResult then UseAvatarRouteResult.opaque.params else nil
				}
			} elseif FFlagAXPPEReturnToEntrySurface then {
				entryOrigin = if UseAvatarRouteResult then {
					screenName = UseAvatarRouteResult.opaque.name,
					screenParams = UseAvatarRouteResult.opaque.params
				} else nil
			} else { prevNavPage = Key })
			
			if FFlagMeProfileEntryTooltipEnabled and UseMeProfileEntryTooltipModuleResult and Profile == AvatarScreen.Profile then
				UseMeProfileEntryTooltipModuleResult.dismiss()
			end
		end
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.More.ProfilePhoto)
	end, {
		UseNavigationResult,
		if FFlagAXUseProfileIconEntryPoint or FFlagAXPPEReturnToEntrySurface then UseAvatarRouteResult else nil,
		if FFlagMeProfileEntryTooltipEnabled and UseMeProfileEntryTooltipModuleResult then UseMeProfileEntryTooltipModuleResult.dismiss else nil
	})
	local UseResult9 = if FFlagAXFavoritesManagerNavEntry then ReactModule.useCallback(function() --[[ Line: 231 ]]
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.FavoritesSaved)
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.Main.Favorites)
	end, { UseNavigationResult }) else nil
	local UseSelectorResult2 = if FFlagAXHideHeadAdjustmentForDefaultHead then UseSelectorFunction(SelectHasDynamicHead) else nil
	local UseUndoRedoBarViewModelModuleResult = if FFlagAXResetAvatarButton then UseUndoRedoBarViewModelModule() else nil
	
	return {
		config = ReactModule.useMemo(function() --[[ Line: 247 ]]
			-- upvalues: MenuItemEnumModule (upval), p1 (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), UseSelectorResult1 (copy), AvatarHeadShot (upval), FFlagControlBarUseProfileFrameThumbnail (upval), UseResult8 (copy), FFlagAXUseProfileIconEntryPoint (upval), IsNameMatch (copy), FFlagMeProfileEntryTooltipEnabled (upval), UseMeProfileEntryTooltipModuleResult (ref), UseLocalizationResult (copy), FFlagAXMigrateBuilderIcons (upval), IconName (upval), SlotBasedEditorAnalytics (upval), UseSemanticTokensModuleResult (copy), UseResult (copy), UseResult1 (copy), UseResult2 (copy), FFlagAXHideHeadAdjustmentForDefaultHead (upval), UseSelectorResult2 (copy), UseResult3 (copy), UseResult4 (copy), UseSelectorResult (copy), UseResult5 (copy), FFlagAXAvatarSharingEntryPoint (upval), UseResult6 (ref), UseResult7 (ref), FFlagAXFavoritesManagerNavEntry (upval), UseResult9 (ref), FFlagAXResetAvatarButton (upval), UseUndoRedoBarViewModelModuleResult (copy)
			local List = {
				{
					type = "image",
					hideIndicator = true,
					id = MenuItemEnumModule.Main.AvatarSwitcher,
					thumbnailUrl = if p1.thumbnailUrl then p1.thumbnailUrl else GetRbxthumbWithTypeSizeAndOptionsFunction(UseSelectorResult1, AvatarHeadShot, 150, true, true, FFlagControlBarUseProfileFrameThumbnail),
					onActivated = UseResult8,
					visible = if FFlagAXUseProfileIconEntryPoint then not IsNameMatch else nil,
					toolTipConfig = if FFlagMeProfileEntryTooltipEnabled and UseMeProfileEntryTooltipModuleResult then {
						compact = true,
						bodyText = UseLocalizationResult.profileTooltip,
						open = UseMeProfileEntryTooltipModuleResult.showTooltip,
						onShown = UseMeProfileEntryTooltipModuleResult.onShown,
						onDismiss = UseMeProfileEntryTooltipModuleResult.dismiss
					} else nil,
					enableFocusAnimation = if p1.focusAnimation then p1.focusAnimation.enabled and p1.focusAnimation.menuItemId == MenuItemEnumModule.Main.AvatarSwitcher else nil
				},
				{
					type = "icon",
					id = MenuItemEnumModule.Main.AvatarRefinement,
					icon = if FFlagAXMigrateBuilderIcons then IconName.PersonStandingGear else "icons/menu/customize",
					onActivated = function() --[[ Line: 283 ]]
						-- upvalues: SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
						SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.Main.AvatarRefinement)
					end,
					children = {
						{
							type = "icon",
							id = MenuItemEnumModule.AvatarRefinement.AdjustAccessory,
							text = UseLocalizationResult.adjustAccessory,
							icon = if FFlagAXMigrateBuilderIcons then IconName.HatFedora else "icons/menu/clothing/hats_off",
							iconSize = UseSemanticTokensModuleResult.defaultLegacyIconSize,
							onActivated = UseResult
						},
						{
							type = "icon",
							id = MenuItemEnumModule.AvatarRefinement.BodyScale,
							text = UseLocalizationResult.bodyShape,
							icon = if FFlagAXMigrateBuilderIcons then IconName.PersonStandingDualArrowsVertical else "icons/menu/clothing/build_off",
							iconSize = UseSemanticTokensModuleResult.defaultLegacyIconSize,
							onActivated = UseResult1
						},
						{
							type = "icon",
							id = MenuItemEnumModule.AvatarRefinement.CustomizeHead,
							text = UseLocalizationResult.headAdjustment,
							icon = if FFlagAXMigrateBuilderIcons then IconName.HeadBlank else "icons/menu/clothing/classicHead_off",
							iconSize = UseSemanticTokensModuleResult.defaultLegacyIconSize,
							onActivated = UseResult2,
							visible = if FFlagAXHideHeadAdjustmentForDefaultHead then UseSelectorResult2 else nil
						},
						{
							type = "icon",
							id = MenuItemEnumModule.AvatarRefinement.ClothingLayers,
							text = UseLocalizationResult.clothingLayering,
							icon = if FFlagAXMigrateBuilderIcons then IconName.ClothesHanger else "icons/menu/clothing/clothing_off",
							iconSize = UseSemanticTokensModuleResult.defaultLegacyIconSize,
							onActivated = UseResult3
						},
						{
							type = "icon",
							id = MenuItemEnumModule.AvatarRefinement.MakeupLayers,
							text = UseLocalizationResult.makeupLayering,
							icon = if FFlagAXMigrateBuilderIcons then IconName.LipsLipstickMakeupBrush else "icons/menu/clothing/eyelash_off",
							iconSize = UseSemanticTokensModuleResult.defaultLegacyIconSize,
							onActivated = UseResult4
						},
						if UseSelectorResult then {
							type = "color",
							id = MenuItemEnumModule.AvatarRefinement.ColorAdjustment,
							text = UseLocalizationResult.skinColor,
							colors = { UseSelectorResult },
							colorSize = UseSemanticTokensModuleResult.defaultLegacyIconSize,
							onActivated = UseResult5
						} else nil
					}
				},
				if FFlagAXAvatarSharingEntryPoint then {
					type = "icon",
					id = MenuItemEnumModule.Main.SharedCommunityAvatars,
					icon = if FFlagAXMigrateBuilderIcons then IconName.CirclePlus else "icons/actions/edit/add",
					onActivated = function() --[[ Line: 355 ]]
						-- upvalues: SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
						SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.Main.SharedCommunityAvatars)
					end,
					children = {
						{
							type = "icon",
							id = MenuItemEnumModule.SharedCommunityAvatars.ShareAvatar,
							text = UseLocalizationResult.shareAvatar,
							icon = if FFlagAXMigrateBuilderIcons then IconName.PlusLarge else "icons/common/plus_heavy",
							iconSize = UseSemanticTokensModuleResult.defaultLegacyIconSize,
							onActivated = UseResult6
						},
						{
							type = "icon",
							id = MenuItemEnumModule.SharedCommunityAvatars.MyPublishedAvatars,
							text = UseLocalizationResult.myPublishedAvatars,
							icon = if FFlagAXMigrateBuilderIcons then IconName.Person else "icons/actions/friend_sort/my_profile",
							iconSize = UseSemanticTokensModuleResult.defaultLegacyIconSize,
							onActivated = UseResult7
						}
					}
				} else nil
			}
			
			if FFlagAXFavoritesManagerNavEntry then
				table.insert(List, {
					type = "icon",
					isActive = false,
					id = MenuItemEnumModule.Main.Favorites,
					icon = IconName.Star,
					onActivated = UseResult9
				})
			end
			if FFlagAXResetAvatarButton and p1.showUndoRedo then
				table.insert(List, {
					type = "divider",
					id = MenuItemEnumModule.UndoRedoDivider
				})
				
				for _, item in UseUndoRedoBarViewModelModuleResult.items do
					table.insert(List, item)
				end
			end
			return List
		end, {
			UseSelectorResult1, UseResult, UseResult1, UseResult2, UseResult3, UseResult8,
			UseResult5, UseSelectorResult, p1.thumbnailUrl, p1.focusAnimation,
			if FFlagAXResetAvatarButton then p1.showUndoRedo else nil,
			if FFlagAXResetAvatarButton then UseUndoRedoBarViewModelModuleResult else nil,
			if FFlagAXHideHeadAdjustmentForDefaultHead then UseSelectorResult2 else nil,
			if FFlagAXUseProfileIconEntryPoint then IsNameMatch else nil,
			if FFlagMeProfileEntryTooltipEnabled and UseMeProfileEntryTooltipModuleResult then UseMeProfileEntryTooltipModuleResult.showTooltip else nil,
			if FFlagMeProfileEntryTooltipEnabled and UseAvatarRouteResult then UseAvatarRouteResult.opaque.name else nil,
			if FFlagMeProfileEntryTooltipEnabled then UseLocalizationResult.profileTooltip else nil
		})
	}
end