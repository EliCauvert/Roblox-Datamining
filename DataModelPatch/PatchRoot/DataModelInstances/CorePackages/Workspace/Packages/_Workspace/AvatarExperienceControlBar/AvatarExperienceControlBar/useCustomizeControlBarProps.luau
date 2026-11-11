local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local Parent = AvatarExperienceControlBar.Parent
local ReactModule = require(Parent.React)
local UserLibModule = require(Parent.UserLib)
local ResponsiveModule = require(Parent.Responsive)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local IXPUtilsModule = require(Parent.IXPUtils)
local SelectColorAdjustmentButtonColor = AvatarExperienceCommonModule.State.Selectors.selectColorAdjustmentButtonColor
local SelectHasDynamicHead = AvatarExperienceCommonModule.State.Selectors.selectHasDynamicHead
local SlotBasedEditorAnalytics = require(Parent.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseSemanticTokensModule = require(AvatarExperienceControlBar.Hooks.useSemanticTokens)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseUndoRedoBarViewModelModule = require(script.Parent.UndoRedoBar.useUndoRedoBarViewModel)
local IconName = require(Parent.Foundation).Enums.IconName
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local MenuItemEnumModule = require(AvatarExperienceControlBar.Enums.MenuItemEnum)
local _ = require(AvatarExperienceControlBar.ControlBarTypes)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXAvatarSharingEntryPoint = AvatarExperienceFlagsModule.FFlagAXAvatarSharingEntryPoint
local FFlagAXPhotoboothFunctionality = AvatarExperienceFlagsModule.FFlagAXPhotoboothFunctionality
local FFlagAXMigrateBuilderIcons = AvatarExperienceFlagsModule.FFlagAXMigrateBuilderIcons
local AXEnableAccessoryAdjustmentDuringTryOnIXP = require(Parent.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP
local FFlagAXRootSlotBasedEditorFlag = require(Parent.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local FFlagAXResetAvatarButton = require(Parent.AvatarExperienceFlags).FFlagAXResetAvatarButton
local FFlagAXCustomizeMakeupSupport = require(Parent.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport
local FFlagAXHideHeadAdjustmentForDefaultHead = require(Parent.AvatarExperienceFlags).FFlagAXHideHeadAdjustmentForDefaultHead
local FFlagAXFavoritesManagerNavEntry = require(Parent.AvatarExperienceFlags).FFlagAXFavoritesManagerNavEntry
local AvatarHeadShot = UserLibModule.Utils.Constants.RbxthumbTypes.AvatarHeadShot

local function selectUserId(p1)
	return p1.LocalUserId
end

return function(p1)
	-- upvalues: UseSemanticTokensModule (copy), UseNavigationFunction (copy), UseSelectorFunction (copy), SelectColorAdjustmentButtonColor (copy), ResponsiveModule (copy), selectUserId (copy), UseLocalizationFunction (copy), FFlagAXCustomizeMakeupSupport (copy), FFlagAXAvatarSharingEntryPoint (copy), FFlagAXPhotoboothFunctionality (copy), ReactModule (copy), AvatarScreen (copy), SlotBasedEditorAnalytics (copy), MenuItemEnumModule (copy), FFlagAXFavoritesManagerNavEntry (copy), AXEnableAccessoryAdjustmentDuringTryOnIXP (copy), IXPUtilsModule (copy), FFlagAXHideHeadAdjustmentForDefaultHead (copy), SelectHasDynamicHead (copy), FFlagAXResetAvatarButton (copy), UseUndoRedoBarViewModelModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), AvatarHeadShot (copy), FFlagAXRootSlotBasedEditorFlag (copy), FFlagAXMigrateBuilderIcons (copy), IconName (copy)
	local UseSemanticTokensModuleResult = UseSemanticTokensModule()
	local UseNavigationResult = UseNavigationFunction()
	local UseSelectorResult = UseSelectorFunction(SelectColorAdjustmentButtonColor)
	local IsUseOrientationResultMatch = ResponsiveModule.useOrientation() == ResponsiveModule.Keys.Portrait
	local UseSelectorResult1 = UseSelectorFunction(selectUserId)
	local UseLocalizationResult = UseLocalizationFunction({
		adjustAccessory = "Feature.Avatar.Label.Title.AccessoryAdjustment",
		bodyShape = "Feature.Avatar.Label.Title.BodyShape",
		clothingLayering = "Feature.Avatar.Label.Title.ClothingLayering",
		headAdjustment = "Feature.Avatar.Label.Title.HeadAdjustment",
		inventory = "Feature.Avatar.Label.Title.Inventory",
		emotes = "Feature.Avatar.Label.Title.Emotes",
		profilePhoto = "Feature.Avatar.Label.Title.ProfilePhoto",
		skinColor = "Feature.Avatar.ColorAdjustmentPage.Title",
		makeupLayering = if FFlagAXCustomizeMakeupSupport then "Feature.Avatar.Label.Title.MakeupLayering" else nil,
		shareAvatar = if FFlagAXAvatarSharingEntryPoint then "Feature.Avatar.Action.ShareAvatar" else nil,
		myPublishedAvatars = if FFlagAXAvatarSharingEntryPoint then "Feature.Avatar.Action.MyPublishedAvatars" else nil,
		photobooth = if FFlagAXPhotoboothFunctionality then "Feature.Avatar.Label.Photobooth" else nil
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.AvatarSwitcher)
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.Main.AvatarSwitcher)
	end, { UseNavigationResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.AccessoryAdjustment)
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.AvatarRefinement.AdjustAccessory)
	end, { UseNavigationResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.BodyShape)
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.AvatarRefinement.BodyScale)
	end, { UseNavigationResult })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.HeadRefinement)
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.AvatarRefinement.CustomizeHead)
	end, { UseNavigationResult })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.LayeredClothingSort)
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.AvatarRefinement.ClothingLayers)
	end, { UseNavigationResult })
	local UseResult5 = if FFlagAXCustomizeMakeupSupport then ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.LayeredMakeupSort)
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.AvatarRefinement.MakeupLayers)
	end, { UseNavigationResult }) else nil
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.ColorAdjustment)
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.AvatarRefinement.ColorAdjustment)
	end, { UseNavigationResult })
	local UseResult7 = nil
	local UseResult8 = nil
	
	if FFlagAXAvatarSharingEntryPoint then
		UseResult7 = ReactModule.useCallback(function()
			-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
			UseNavigationResult.navigate(AvatarScreen.LookComposerPage, {
				prevNavPage = if UseNavigationResult.state and UseNavigationResult.state.key then UseNavigationResult.state.key else nil
			})
			SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.SharedCommunityAvatars.ShareAvatar)
		end, { UseNavigationResult })
		UseResult8 = ReactModule.useCallback(function()
			-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
			UseNavigationResult.navigate(AvatarScreen.MySharedAvatars)
			SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.SharedCommunityAvatars.MyPublishedAvatars)
		end, { UseNavigationResult })
	end
	local UseResult9 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		if p1.onInventoryActivated then
			p1.onInventoryActivated()
		end
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.More.Inventory)
	end, { p1.onInventoryActivated })
	local UseResult10 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.EditEmotes)
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.More.Emotes)
	end, { UseNavigationResult })
	local UseResult11 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.ProfilePictureEditorEmotes, {
			prevNavPage = if UseNavigationResult.state and UseNavigationResult.state.key then UseNavigationResult.state.key else nil
		})
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.More.ProfilePhoto)
	end, { UseNavigationResult })
	local UseResult12 = if FFlagAXPhotoboothFunctionality then ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.Photobooth)
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.Photobooth.Photobooth)
	end, { UseNavigationResult }) else nil
	local UseResult13 = if FFlagAXFavoritesManagerNavEntry then ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
		UseNavigationResult.navigate(AvatarScreen.FavoritesSaved)
		SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.Main.Favorites)
	end, { UseNavigationResult }) else nil
	local TestVariable = if AXEnableAccessoryAdjustmentDuringTryOnIXP.isEnabled() then IXPUtilsModule.readTestVariable(AXEnableAccessoryAdjustmentDuringTryOnIXP.EnabledForUser) else nil
	local UseSelectorResult2 = if FFlagAXHideHeadAdjustmentForDefaultHead then UseSelectorFunction(SelectHasDynamicHead) else nil
	local UseUndoRedoBarViewModelModuleResult = if FFlagAXResetAvatarButton then UseUndoRedoBarViewModelModule() else nil
	
	return {
		config = ReactModule.useMemo(function()
			-- upvalues: MenuItemEnumModule (upval), p1 (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), UseSelectorResult1 (copy), AvatarHeadShot (upval), FFlagAXRootSlotBasedEditorFlag (upval), UseResult11 (copy), UseResult (copy), FFlagAXMigrateBuilderIcons (upval), IconName (upval), SlotBasedEditorAnalytics (upval), UseLocalizationResult (copy), TestVariable (copy), UseSemanticTokensModuleResult (copy), UseResult1 (copy), UseResult2 (copy), UseResult3 (copy), FFlagAXHideHeadAdjustmentForDefaultHead (upval), UseSelectorResult2 (copy), UseResult4 (copy), FFlagAXCustomizeMakeupSupport (upval), UseResult5 (copy), UseSelectorResult (copy), UseResult6 (copy), FFlagAXAvatarSharingEntryPoint (upval), UseResult7 (ref), UseResult8 (ref), UseResult9 (copy), IsUseOrientationResultMatch (copy), UseResult10 (copy), FFlagAXPhotoboothFunctionality (upval), UseResult12 (ref), FFlagAXFavoritesManagerNavEntry (upval), UseResult13 (ref), FFlagAXResetAvatarButton (upval), UseUndoRedoBarViewModelModuleResult (copy)
			local List = {
				{
					type = "image",
					id = MenuItemEnumModule.Main.AvatarSwitcher,
					thumbnailUrl = if p1.thumbnailUrl then p1.thumbnailUrl else GetRbxthumbWithTypeSizeAndOptionsFunction(UseSelectorResult1, AvatarHeadShot, 150, true, true),
					onActivated = if FFlagAXRootSlotBasedEditorFlag then UseResult11 else UseResult,
					hideIndicator = if FFlagAXRootSlotBasedEditorFlag then true else nil,
					enableFocusAnimation = if p1.focusAnimation then p1.focusAnimation.enabled and p1.focusAnimation.menuItemId == MenuItemEnumModule.Main.AvatarSwitcher else nil
				},
				{
					type = "icon",
					id = MenuItemEnumModule.Main.AvatarRefinement,
					icon = if FFlagAXMigrateBuilderIcons then IconName.PersonStandingGear else "icons/menu/customize",
					onActivated = function()
						-- upvalues: SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
						SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.Main.AvatarRefinement)
					end,
					children = {
						{
							type = "icon",
							id = MenuItemEnumModule.AvatarRefinement.AdjustAccessory,
							text = UseLocalizationResult.adjustAccessory,
							icon = if TestVariable then "icons/menu/transform-small" elseif FFlagAXMigrateBuilderIcons then IconName.HatFedora else "icons/menu/clothing/hats_off",
							iconSize = UseSemanticTokensModuleResult.defaultLegacyIconSize,
							onActivated = UseResult1
						},
						{
							type = "icon",
							id = MenuItemEnumModule.AvatarRefinement.BodyScale,
							text = UseLocalizationResult.bodyShape,
							icon = if FFlagAXMigrateBuilderIcons then IconName.PersonStandingDualArrowsVertical else "icons/menu/clothing/build_off",
							iconSize = UseSemanticTokensModuleResult.defaultLegacyIconSize,
							onActivated = UseResult2
						},
						{
							type = "icon",
							id = MenuItemEnumModule.AvatarRefinement.CustomizeHead,
							text = UseLocalizationResult.headAdjustment,
							icon = if FFlagAXMigrateBuilderIcons then IconName.HeadBlank else "icons/menu/clothing/classicHead_off",
							iconSize = UseSemanticTokensModuleResult.defaultLegacyIconSize,
							onActivated = UseResult3,
							visible = if FFlagAXHideHeadAdjustmentForDefaultHead then UseSelectorResult2 else nil
						},
						{
							type = "icon",
							id = MenuItemEnumModule.AvatarRefinement.ClothingLayers,
							text = UseLocalizationResult.clothingLayering,
							icon = if FFlagAXMigrateBuilderIcons then IconName.ClothesHanger else "icons/menu/clothing/clothing_off",
							iconSize = UseSemanticTokensModuleResult.defaultLegacyIconSize,
							onActivated = UseResult4
						},
						if FFlagAXCustomizeMakeupSupport then {
							type = "icon",
							id = MenuItemEnumModule.AvatarRefinement.MakeupLayers,
							text = UseLocalizationResult.makeupLayering,
							icon = if FFlagAXMigrateBuilderIcons then IconName.LipsLipstickMakeupBrush else "icons/menu/clothing/eyelash_off",
							iconSize = UseSemanticTokensModuleResult.defaultLegacyIconSize,
							onActivated = UseResult5
						} else nil,
						if UseSelectorResult then {
							type = "color",
							id = MenuItemEnumModule.AvatarRefinement.ColorAdjustment,
							text = UseLocalizationResult.skinColor,
							colors = { UseSelectorResult },
							colorSize = UseSemanticTokensModuleResult.defaultLegacyIconSize,
							onActivated = UseResult6
						} else nil
					}
				},
				if FFlagAXAvatarSharingEntryPoint then {
					type = "icon",
					id = MenuItemEnumModule.Main.SharedCommunityAvatars,
					icon = if FFlagAXMigrateBuilderIcons then IconName.CirclePlus else "icons/actions/edit/add",
					onActivated = function()
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
							onActivated = UseResult7
						},
						{
							type = "icon",
							id = MenuItemEnumModule.SharedCommunityAvatars.MyPublishedAvatars,
							text = UseLocalizationResult.myPublishedAvatars,
							icon = if FFlagAXMigrateBuilderIcons then IconName.Person else "icons/actions/friend_sort/my_profile",
							iconSize = UseSemanticTokensModuleResult.defaultLegacyIconSize,
							onActivated = UseResult8
						}
					}
				} else nil,
				if FFlagAXRootSlotBasedEditorFlag then nil else {
					type = "icon",
					id = MenuItemEnumModule.Main.More,
					icon = if FFlagAXMigrateBuilderIcons then IconName.ThreeBarsHorizontal else "icons/common/hamburgermenu",
					onActivated = function()
						-- upvalues: SlotBasedEditorAnalytics (upval), MenuItemEnumModule (upval)
						SlotBasedEditorAnalytics.trackControlBarClick(MenuItemEnumModule.Main.More)
					end,
					visible = not FFlagAXRootSlotBasedEditorFlag,
					children = {
						{
							type = "icon",
							id = MenuItemEnumModule.More.Inventory,
							text = UseLocalizationResult.inventory,
							icon = if FFlagAXMigrateBuilderIcons then IconName.Backpack else "icons/menu/inventoryOff",
							onActivated = UseResult9,
							visible = IsUseOrientationResultMatch
						},
						if FFlagAXRootSlotBasedEditorFlag then nil else {
							type = "icon",
							icon = "icons/controls/emoteOff",
							id = MenuItemEnumModule.More.Emotes,
							text = UseLocalizationResult.emotes,
							onActivated = UseResult10
						},
						if FFlagAXPhotoboothFunctionality then {
							type = "icon",
							icon = "icons/controls/screenshot",
							id = MenuItemEnumModule.Photobooth.Photobooth,
							text = if UseLocalizationResult.photobooth then UseLocalizationResult.photobooth else "Photobooth",
							onActivated = UseResult12
						} else nil
					}
				}
			}
			
			if FFlagAXFavoritesManagerNavEntry then
				table.insert(List, {
					type = "icon",
					isActive = false,
					id = MenuItemEnumModule.Main.Favorites,
					icon = IconName.Star,
					onActivated = UseResult13
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
			UseSelectorResult1, UseResult, UseResult1, UseResult2, UseResult3, UseResult4,
			UseResult9, UseResult10, UseResult11, UseResult6, UseSelectorResult,
			IsUseOrientationResultMatch, p1.thumbnailUrl, p1.focusAnimation,
			if FFlagAXResetAvatarButton then p1.showUndoRedo else nil,
			if FFlagAXResetAvatarButton then UseUndoRedoBarViewModelModuleResult else nil,
			if FFlagAXHideHeadAdjustmentForDefaultHead then UseSelectorResult2 else nil
		})
	}
end