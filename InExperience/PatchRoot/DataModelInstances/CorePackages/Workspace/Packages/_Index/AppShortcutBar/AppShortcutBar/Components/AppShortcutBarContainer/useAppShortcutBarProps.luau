local userInputService = game:GetService("UserInputService")
local appShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local parent = appShortcutBar.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local _ = require(appShortcutBar.Components.AppShortcutBar)
local localizationRoactContext = require(parent.Localization).LocalizationRoactContext
local uiMode = require(parent.RobloxAppEnums).UiMode
local responsiveModule = require(parent.Responsive)
local useHeldProgressByEvent = require(appShortcutBar.Hooks.AppShortcutBarContext).useHeldProgressByEvent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLastInputMethod = require(parent.FocusNavigationUtils).useLastInputMethod
local useUiModeInfo = require(parent.RobloxAppHooks).useUiModeInfo
local useDesignTokens = require(parent.Style).useDesignTokens
local useIsStickyShortcutBarEnabled = require(appShortcutBar.Hooks).useIsStickyShortcutBarEnabled
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useSignalState = require(parent.SignalsReact).useSignalState
local displayModule = require(parent.Display)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagRenameDeprecatedUIBloxTokens = sharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local fFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation = sharedFlagsModule.FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation
local fFlagAXMigrateAvatarEditorPageInputBindings = sharedFlagsModule.FFlagAXMigrateAvatarEditorPageInputBindings
local fFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad = sharedFlagsModule.FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad
local fFlagAXMigrateEmoteMenuFromRoactGamepad = sharedFlagsModule.FFlagAXMigrateEmoteMenuFromRoactGamepad
local fFlagAXMigrateSceneGamepadHandlerInputBindings = sharedFlagsModule.FFlagAXMigrateSceneGamepadHandlerInputBindings
local fFlagAXMigratePurchasePromptInteractiveToFocusNavigation = sharedFlagsModule.FFlagAXMigratePurchasePromptInteractiveToFocusNavigation
local fFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation = sharedFlagsModule.FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation
local fFlagAXMigrateFormPeekViewToFocusNavigation = sharedFlagsModule.FFlagAXMigrateFormPeekViewToFocusNavigation
local fFlagAXMigrateAdjustAccessoryViewToFocusNavigation = sharedFlagsModule.FFlagAXMigrateAdjustAccessoryViewToFocusNavigation
local fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation = sharedFlagsModule.FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation
local fFlagAXMigrateItemDetailsInputBindingsToFocusNavigation = sharedFlagsModule.FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation
local fFlagAXMigrateCatalogSearchToFocusNavigation = sharedFlagsModule.FFlagAXMigrateCatalogSearchToFocusNavigation
local fFlagAXMigrateCatalogPageInputBindings = sharedFlagsModule.FFlagAXMigrateCatalogPageInputBindings
local fFlagAXMigrateLookDetailsPeekViewToFocusNavigation = sharedFlagsModule.FFlagAXMigrateLookDetailsPeekViewToFocusNavigation
local fFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation = sharedFlagsModule.FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation
local fFlagLuaAppEnableStickyShortcutBar = sharedFlagsModule.FFlagLuaAppEnableStickyShortcutBar
local fFlagLuaAppResponsiveEnginePreferredInput = sharedFlagsModule.FFlagLuaAppResponsiveEnginePreferredInput
local fFlagEnableLeftNavOnConsole = sharedFlagsModule.FFlagEnableLeftNavOnConsole
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagGuacStickyShortcutBarEnabled = sharedFlagsModule.FFlagGuacStickyShortcutBarEnabled
local fFlagSocialCarouselPressXToViewProfile = sharedFlagsModule.FFlagSocialCarouselPressXToViewProfile
local t = {
	[Enum.KeyCode.Thumbstick1] = {
		vertical = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Vertical.png",
		horizontal = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Horizontal.png"
	},
	[Enum.KeyCode.Thumbstick2] = {
		vertical = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Vertical.png",
		horizontal = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Horizontal.png"
	}
}
local list = {
	Enum.KeyCode.ButtonA, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY,
	Enum.KeyCode.ButtonL3, Enum.KeyCode.ButtonR3, Enum.KeyCode.Thumbstick1,
	Enum.KeyCode.Thumbstick2, Enum.KeyCode.ButtonStart, Enum.KeyCode.Slash,
	Enum.KeyCode.Escape, Enum.KeyCode.LeftBracket, Enum.KeyCode.PageUp,
	Enum.KeyCode.RightBracket, Enum.KeyCode.PageDown
}
local list_1 = {
	focusNavigationEventNameEnum.HoldToAcceptFriendRequest,
	focusNavigationEventNameEnum.HoldToAddFriend,
	focusNavigationEventNameEnum.HoldToJoinEvent,
	focusNavigationEventNameEnum.HoldToUnfollowEvent,
	focusNavigationEventNameEnum.HoldToNotifyMe,
	focusNavigationEventNameEnum.HoldToPlay,
	focusNavigationEventNameEnum.HoldToJoinFriend,
	focusNavigationEventNameEnum.Play, focusNavigationEventNameEnum.Search,
	focusNavigationEventNameEnum.SeeAll,
	focusNavigationEventNameEnum.DisplayStatsAndInfo,
	focusNavigationEventNameEnum.AcceptFriendRequest,
	focusNavigationEventNameEnum.AddFriend,
	focusNavigationEventNameEnum.IgnoreFriendRequest,
	focusNavigationEventNameEnum.ViewProfile,
	focusNavigationEventNameEnum.OpenQuickMenu,
	focusNavigationEventNameEnum.NavigateBack,
	focusNavigationEventNameEnum.ScrollUp, focusNavigationEventNameEnum.ScrollDown
}
table.insert(list_1, focusNavigationEventNameEnum.Confirm)
table.insert(list_1, focusNavigationEventNameEnum.SelectItem)
table.insert(list_1, focusNavigationEventNameEnum.OpenItemDetailsPage)

if fFlagAXMigrateCatalogPageInputBindings then
	table.insert(list_1, focusNavigationEventNameEnum.ToggleTryOnManager)
end
local t_1 = {
	[Enum.KeyCode.ButtonA] = true,
	[Enum.KeyCode.ButtonB] = true,
	[Enum.KeyCode.ButtonX] = true,
	[Enum.KeyCode.ButtonY] = true,
	[Enum.KeyCode.ButtonL1] = true,
	[Enum.KeyCode.ButtonL2] = true,
	[Enum.KeyCode.ButtonL3] = true,
	[Enum.KeyCode.ButtonR1] = true,
	[Enum.KeyCode.ButtonR2] = true,
	[Enum.KeyCode.ButtonR3] = true,
	[Enum.KeyCode.ButtonSelect] = true,
	[Enum.KeyCode.ButtonStart] = true,
	[Enum.KeyCode.DPadDown] = true,
	[Enum.KeyCode.DPadLeft] = true,
	[Enum.KeyCode.DPadRight] = true,
	[Enum.KeyCode.DPadUp] = true,
	[Enum.KeyCode.Thumbstick1] = true,
	[Enum.KeyCode.Thumbstick2] = true
}
local t_2 = {
	[Enum.KeyCode.ButtonB] = true,
	[Enum.KeyCode.ButtonL1] = true,
	[Enum.KeyCode.ButtonR1] = true
}
local t_3 = {
	[Enum.KeyCode.ButtonA] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png",
	[Enum.KeyCode.ButtonB] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png",
	[Enum.KeyCode.ButtonY] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonY.png",
	[Enum.KeyCode.ButtonX] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png",
	[Enum.KeyCode.ButtonL3] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonL3.png",
	[Enum.KeyCode.ButtonR3] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonR3.png",
	[Enum.KeyCode.Thumbstick1] = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Directional.png",
	[Enum.KeyCode.Thumbstick2] = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Directional.png",
	[Enum.KeyCode.ButtonStart] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonStart.png"
}
local var14 = if fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled then {
	[Enum.KeyCode.ButtonA] = userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonA)
} else nil
local t_4 = {
	[Enum.KeyCode.ButtonY] = {
		[focusNavigationEventNameEnum.Search] = t_3[Enum.KeyCode.ButtonY],
		[focusNavigationEventNameEnum.DisplayStatsAndInfo] = t_3[Enum.KeyCode.ButtonY],
		[focusNavigationEventNameEnum.OpenLayeredClothingSortResetPrompt] = t_3[Enum.KeyCode.ButtonY],
		[focusNavigationEventNameEnum.OpenLayeredMakeupSortResetPrompt] = t_3[Enum.KeyCode.ButtonY],
		[focusNavigationEventNameEnum.SortAndFiltersReset] = if fFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation then t_3[Enum.KeyCode.ButtonY] else nil,
		[focusNavigationEventNameEnum.WearAfterPurchase] = if fFlagAXMigratePurchasePromptInteractiveToFocusNavigation then t_3[Enum.KeyCode.ButtonY] else nil,
		[focusNavigationEventNameEnum.FormPeekViewReset] = if fFlagAXMigrateFormPeekViewToFocusNavigation then t_3[Enum.KeyCode.ButtonY] else nil,
		[focusNavigationEventNameEnum.AdjustAccessoryViewReset] = if fFlagAXMigrateAdjustAccessoryViewToFocusNavigation then t_3[Enum.KeyCode.ButtonY] else nil,
		[focusNavigationEventNameEnum.ManageOutfitsRename] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then t_3[Enum.KeyCode.ButtonY] else nil,
		[focusNavigationEventNameEnum.OpenItemDetailsPeekView] = if fFlagAXMigrateItemDetailsInputBindingsToFocusNavigation then t_3[Enum.KeyCode.ButtonY] else nil,
		[focusNavigationEventNameEnum.CloseItemDetailsPeekView] = if fFlagAXMigrateItemDetailsInputBindingsToFocusNavigation then t_3[Enum.KeyCode.ButtonY] else nil,
		[focusNavigationEventNameEnum.ToggleTryOn] = if fFlagAXMigrateCatalogSearchToFocusNavigation then t_3[Enum.KeyCode.ButtonY] else nil,
		[focusNavigationEventNameEnum.ToggleTryOnManager] = if fFlagAXMigrateLookDetailsPeekViewToFocusNavigation or fFlagAXMigrateCatalogPageInputBindings then t_3[Enum.KeyCode.ButtonY] else nil,
		[focusNavigationEventNameEnum.RemoveClothingTile] = t_3[Enum.KeyCode.ButtonY]
	},
	[Enum.KeyCode.ButtonX] = {
		[focusNavigationEventNameEnum.Play] = t_3[Enum.KeyCode.ButtonX],
		[focusNavigationEventNameEnum.SeeAll] = t_3[Enum.KeyCode.ButtonX],
		[focusNavigationEventNameEnum.AcceptFriendRequest] = t_3[Enum.KeyCode.ButtonX],
		[focusNavigationEventNameEnum.AddFriend] = t_3[Enum.KeyCode.ButtonX],
		[focusNavigationEventNameEnum.OpenBuyCatalogItemPrompt] = if fFlagAXMigrateAvatarEditorPageInputBindings or fFlagAXMigrateCatalogSearchToFocusNavigation then t_3[Enum.KeyCode.ButtonX] else nil,
		[focusNavigationEventNameEnum.OpenItemDetailsPage] = if fFlagAXMigrateEmoteMenuFromRoactGamepad then t_3[Enum.KeyCode.ButtonX] else nil,
		[focusNavigationEventNameEnum.SortAndFiltersApply] = if fFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation then t_3[Enum.KeyCode.ButtonX] else nil,
		[focusNavigationEventNameEnum.SaveAsCharacter] = if fFlagAXMigratePurchasePromptInteractiveToFocusNavigation then t_3[Enum.KeyCode.ButtonX] else nil,
		[focusNavigationEventNameEnum.FormPeekViewApply] = if fFlagAXMigrateFormPeekViewToFocusNavigation then t_3[Enum.KeyCode.ButtonX] else nil,
		[focusNavigationEventNameEnum.ManageOutfitsDelete] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then t_3[Enum.KeyCode.ButtonX] else nil,
		[focusNavigationEventNameEnum.OpenItemDetailsPrompt] = if fFlagAXMigrateItemDetailsInputBindingsToFocusNavigation then t_3[Enum.KeyCode.ButtonX] else nil,
		[focusNavigationEventNameEnum.UpdateOutfit] = t_3[Enum.KeyCode.ButtonX],
		[focusNavigationEventNameEnum.IgnoreFriendRequest] = t_3[Enum.KeyCode.ButtonX],
		[focusNavigationEventNameEnum.ViewProfile] = if fFlagSocialCarouselPressXToViewProfile then t_3[Enum.KeyCode.ButtonX] else nil
	},
	[Enum.KeyCode.ButtonA] = {
		[focusNavigationEventNameEnum.HoldToAcceptFriendRequest] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToAddFriend] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToJoinEvent] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToUnfollowEvent] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToNotifyMe] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToPlay] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToJoinFriend] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.SelectItem] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.SlotEmote] = if fFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation then t_3[Enum.KeyCode.ButtonA] else nil,
		[focusNavigationEventNameEnum.UnslotEmote] = if fFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation then t_3[Enum.KeyCode.ButtonA] else nil,
		[focusNavigationEventNameEnum.EquipSlotsSelectSlot] = if fFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then t_3[Enum.KeyCode.ButtonA] else nil,
		[focusNavigationEventNameEnum.Confirm] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.SelectOutfit] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then t_3[Enum.KeyCode.ButtonA] else nil,
		[focusNavigationEventNameEnum.UnselectOutfit] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then t_3[Enum.KeyCode.ButtonA] else nil,
		[focusNavigationEventNameEnum.SelectClothingTile] = t_3[Enum.KeyCode.ButtonA]
	},
	[Enum.KeyCode.ButtonB] = {
		[focusNavigationEventNameEnum.CancelAndReset] = t_3[Enum.KeyCode.ButtonB]
	},
	[Enum.KeyCode.ButtonR3] = {
		[focusNavigationEventNameEnum.ExitAvatarFullView] = if fFlagAXMigrateSceneGamepadHandlerInputBindings then t_3[Enum.KeyCode.ButtonR3] else nil,
		[focusNavigationEventNameEnum.Fullscreen] = t_3[Enum.KeyCode.ButtonR3],
		[focusNavigationEventNameEnum.ExitFullscreen] = t_3[Enum.KeyCode.ButtonR3]
	},
	[Enum.KeyCode.ButtonL3] = {
		[focusNavigationEventNameEnum.OpenCatalogContextMenu] = if fFlagAXMigrateAvatarEditorPageInputBindings or fFlagAXMigrateCatalogPageInputBindings or (fFlagAXMigrateItemDetailsInputBindingsToFocusNavigation or fFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation) then t_3[Enum.KeyCode.ButtonL3] else nil,
		[focusNavigationEventNameEnum.OpenItemDetailsPage] = t_3[Enum.KeyCode.ButtonL3],
		[focusNavigationEventNameEnum.ManageOutfitsToggleMultiSelect] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then t_3[Enum.KeyCode.ButtonL3] else nil,
		[focusNavigationEventNameEnum.ManageOutfitsCancelMultiSelect] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then t_3[Enum.KeyCode.ButtonL3] else nil,
		[focusNavigationEventNameEnum.OpenEditorDetailsPage] = if fFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation then t_3[Enum.KeyCode.ButtonL3] else nil,
		[focusNavigationEventNameEnum.Mute] = t_3[Enum.KeyCode.ButtonL3],
		[focusNavigationEventNameEnum.Unmute] = t_3[Enum.KeyCode.ButtonL3]
	},
	[Enum.KeyCode.ButtonStart] = {
		[focusNavigationEventNameEnum.OpenQuickMenu] = t_3[Enum.KeyCode.ButtonStart]
	},
	[Enum.KeyCode.Thumbstick1] = {
		[focusNavigationEventNameEnum.PanAvatar] = if fFlagAXMigrateSceneGamepadHandlerInputBindings then t_3[Enum.KeyCode.Thumbstick1] else nil,
		[focusNavigationEventNameEnum.MoveClothingTile] = t_3[Enum.KeyCode.Thumbstick1]
	},
	[Enum.KeyCode.Thumbstick2] = {
		[focusNavigationEventNameEnum.RotateAndZoomAvatar] = if fFlagAXMigrateSceneGamepadHandlerInputBindings then t_3[Enum.KeyCode.Thumbstick2] else nil
	}
}
local var16 = if fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled then {
	[Enum.KeyCode.ButtonA] = {
		[focusNavigationEventNameEnum.HoldToAcceptFriendRequest] = var14[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToAddFriend] = var14[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToJoinEvent] = var14[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToUnfollowEvent] = var14[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToNotifyMe] = var14[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToPlay] = var14[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToJoinFriend] = var14[Enum.KeyCode.ButtonA]
	}
} else nil
local t_5 = {
	[focusNavigationEventNameEnum.Fullscreen] = "Feature.ExperienceDetails.Action.FullScreen",
	[focusNavigationEventNameEnum.ExitFullscreen] = "Feature.ExperienceDetails.Action.ExitFullScreen",
	[focusNavigationEventNameEnum.Mute] = "Feature.ExperienceDetails.Action.Mute",
	[focusNavigationEventNameEnum.Unmute] = "Feature.ExperienceDetails.Action.Unmute",
	[focusNavigationEventNameEnum.Search] = "CommonUI.Features.Label.ControllerBar.Search",
	[focusNavigationEventNameEnum.SeeAll] = "Feature.Home.ActionSeeAll",
	[focusNavigationEventNameEnum.Play] = "Common.VisitGame.Label.Play",
	[focusNavigationEventNameEnum.DisplayStatsAndInfo] = "Feature.GameDetails.Label.LearnMore",
	[focusNavigationEventNameEnum.HoldToPlay] = "CommonUI.Features.Label.ControllerBar.ToPlaySuffix",
	[focusNavigationEventNameEnum.HoldToJoinFriend] = "Feature.Profile.Action.JoinGame",
	[focusNavigationEventNameEnum.IgnoreFriendRequest] = if fFlagConnectionsToFriendsRename then "Feature.AddFriends.Action.IgnoreFriendRequest" else "Feature.AddFriends.Action.IgnoreConnectionRequest",
	[focusNavigationEventNameEnum.AcceptFriendRequest] = if fFlagConnectionsToFriendsRename then "CommonUI.Features.Label.AcceptFriend" else "CommonUI.Features.Label.AcceptConnection",
	[focusNavigationEventNameEnum.AddFriend] = if fFlagConnectionsToFriendsRename then "CommonUI.Features.Label.AddFriend" else "CommonUI.Features.Label.AddConnection",
	[focusNavigationEventNameEnum.HoldToAddFriend] = if fFlagConnectionsToFriendsRename then "CommonUI.Features.Label.AddFriend" else "CommonUI.Features.Label.AddConnection",
	[focusNavigationEventNameEnum.HoldToAcceptFriendRequest] = if fFlagConnectionsToFriendsRename then "CommonUI.Features.Label.AcceptFriend" else "CommonUI.Features.Label.AcceptConnection",
	[focusNavigationEventNameEnum.HoldToJoinEvent] = "Feature.VirtualEvents.JoinEvent",
	[focusNavigationEventNameEnum.HoldToUnfollowEvent] = "Feature.VirtualEvents.UnfollowEvent",
	[focusNavigationEventNameEnum.HoldToNotifyMe] = "Feature.VirtualEvents.NotifyMe",
	[focusNavigationEventNameEnum.OpenQuickMenu] = "Feature.Catalog.Heading.QuickMenu",
	[focusNavigationEventNameEnum.ScrollUp] = "Feature.Accessibility.Action.ScrollUp",
	[focusNavigationEventNameEnum.ScrollDown] = "Feature.Accessibility.Action.ScrollDown",
	[focusNavigationEventNameEnum.NavigateBack] = "CommonUI.Controls.Action.Back",
	[focusNavigationEventNameEnum.OpenBuyCatalogItemPrompt] = if fFlagAXMigrateAvatarEditorPageInputBindings or fFlagAXMigrateCatalogSearchToFocusNavigation then "Feature.Catalog.Action.Buy" else nil,
	[focusNavigationEventNameEnum.OpenCatalogContextMenu] = if fFlagAXMigrateAvatarEditorPageInputBindings or fFlagAXMigrateItemDetailsInputBindingsToFocusNavigation or fFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation then "Feature.Catalog.Action.ItemOptions" else nil,
	[focusNavigationEventNameEnum.OpenItemDetailsPage] = "Feature.Catalog.Action.OpenDetails",
	[focusNavigationEventNameEnum.SelectItem] = "Feature.Avatar.Action.Select",
	[focusNavigationEventNameEnum.EquipSlotsSelectSlot] = if fFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then "Feature.Avatar.Action.SelectSlot" else nil,
	[focusNavigationEventNameEnum.SlotEmote] = if fFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation then "Feature.Avatar.Action.SlotEmote" else nil,
	[focusNavigationEventNameEnum.UnslotEmote] = if fFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation then "Feature.Avatar.Action.UnslotEmote" else nil,
	[focusNavigationEventNameEnum.OpenEditorDetailsPage] = if fFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation then "Feature.Catalog.Action.OpenDetails" else nil,
	[focusNavigationEventNameEnum.PanAvatar] = if fFlagAXMigrateSceneGamepadHandlerInputBindings then "Feature.Avatar.Action.Pan" else nil,
	[focusNavigationEventNameEnum.RotateAndZoomAvatar] = if fFlagAXMigrateSceneGamepadHandlerInputBindings then "Feature.Avatar.Action.Rotate" else nil,
	[focusNavigationEventNameEnum.ExitAvatarFullView] = if fFlagAXMigrateSceneGamepadHandlerInputBindings then "Feature.Avatar.Action.DefaultView" else nil,
	[focusNavigationEventNameEnum.OpenLayeredClothingSortResetPrompt] = "CommonUI.Messages.Action.Reset",
	[focusNavigationEventNameEnum.OpenLayeredMakeupSortResetPrompt] = "CommonUI.Messages.Action.Reset",
	[focusNavigationEventNameEnum.SortAndFiltersApply] = if fFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation then "CommonUI.Messages.Action.Apply" else nil,
	[focusNavigationEventNameEnum.SortAndFiltersReset] = if fFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation then "CommonUI.Messages.Action.Reset" else nil,
	[focusNavigationEventNameEnum.SaveAsCharacter] = if fFlagAXMigratePurchasePromptInteractiveToFocusNavigation then "Feature.Avatar.Heading.SaveCostume" else nil,
	[focusNavigationEventNameEnum.WearAfterPurchase] = if fFlagAXMigratePurchasePromptInteractiveToFocusNavigation then "Feature.Avatar.Heading.WearConfirmation" else nil,
	[focusNavigationEventNameEnum.Confirm] = "CommonUI.Controls.Action.Confirm",
	[focusNavigationEventNameEnum.FormPeekViewApply] = if fFlagAXMigrateFormPeekViewToFocusNavigation then "CommonUI.Messages.Action.Apply" else nil,
	[focusNavigationEventNameEnum.FormPeekViewReset] = if fFlagAXMigrateFormPeekViewToFocusNavigation then "CommonUI.Messages.Action.Reset" else nil,
	[focusNavigationEventNameEnum.AdjustAccessoryViewReset] = if fFlagAXMigrateAdjustAccessoryViewToFocusNavigation then "CommonUI.Messages.Action.Reset" else nil,
	[focusNavigationEventNameEnum.ManageOutfitsToggleMultiSelect] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.SelectMultipleItems" else nil,
	[focusNavigationEventNameEnum.ManageOutfitsCancelMultiSelect] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.CancelSelection" else nil,
	[focusNavigationEventNameEnum.ManageOutfitsDelete] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.Delete" else nil,
	[focusNavigationEventNameEnum.ManageOutfitsRename] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.Rename" else nil,
	[focusNavigationEventNameEnum.SelectOutfit] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.Select" else nil,
	[focusNavigationEventNameEnum.UnselectOutfit] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.Unselect" else nil,
	[focusNavigationEventNameEnum.OpenItemDetailsPeekView] = if fFlagAXMigrateItemDetailsInputBindingsToFocusNavigation then "Feature.Catalog.Action.OpenDetails" else nil,
	[focusNavigationEventNameEnum.CloseItemDetailsPeekView] = if fFlagAXMigrateItemDetailsInputBindingsToFocusNavigation then "Feature.Catalog.Action.CloseDetails" else nil,
	[focusNavigationEventNameEnum.OpenItemDetailsPrompt] = if fFlagAXMigrateItemDetailsInputBindingsToFocusNavigation then "Feature.Catalog.Action.Buy" else nil,
	[focusNavigationEventNameEnum.ToggleTryOn] = if fFlagAXMigrateCatalogSearchToFocusNavigation then "Feature.Catalog.Label.TryOns" else nil,
	[focusNavigationEventNameEnum.UpdateOutfit] = "Feature.Avatar.Action.Update",
	[focusNavigationEventNameEnum.ToggleTryOnManager] = if fFlagAXMigrateLookDetailsPeekViewToFocusNavigation or fFlagAXMigrateCatalogPageInputBindings then "Feature.Catalog.Label.TryOns" else nil,
	[focusNavigationEventNameEnum.SelectClothingTile] = "Feature.Avatar.Action.Select",
	[focusNavigationEventNameEnum.MoveClothingTile] = "Feature.Avatar.Title.Move",
	[focusNavigationEventNameEnum.RemoveClothingTile] = "Feature.Catalog.Action.Remove",
	[focusNavigationEventNameEnum.CancelAndReset] = "Feature.Catalog.Action.Cancel",
	[focusNavigationEventNameEnum.ViewProfile] = if fFlagSocialCarouselPressXToViewProfile then "Feature.Profile.Action.ViewProfile" else nil
}
local t_6 = {
	[focusNavigationEventNameEnum.HoldToPlay] = "Common.VisitGame.Label.Play",
	[focusNavigationEventNameEnum.HoldToJoinFriend] = "Feature.Profile.Action.JoinGame"
}
local t_7 = {
	[focusNavigationEventNameEnum.HoldToPlay] = "CommonUI.Features.Label.ControllerBar.HoldPrefix"
}
local t_8 = {
	[focusNavigationEventNameEnum.HoldToAcceptFriendRequest] = true,
	[focusNavigationEventNameEnum.HoldToAddFriend] = true,
	[focusNavigationEventNameEnum.HoldToJoinEvent] = true,
	[focusNavigationEventNameEnum.HoldToUnfollowEvent] = true,
	[focusNavigationEventNameEnum.HoldToNotifyMe] = true,
	[focusNavigationEventNameEnum.HoldToPlay] = true,
	[focusNavigationEventNameEnum.HoldToJoinFriend] = true
}

local function getLegacyInputBindings(p0, p1, p2) --[[ line: 481 ]]
	-- upvalues: t (ref), t_3 (ref)
	if p1.axes then
		local vertical = p1.axes.vertical
		local horizontal = p1.axes.horizontal
		local var27 = t[p0]
		local t_1 = {}
		
		if vertical then
			table.insert(t_1, { icon = var27.vertical, text = p2:Format(vertical.key) })
		end
		if horizontal then
			table.insert(t_1, {
				icon = var27.horizontal,
				text = p2:Format(horizontal.key)
			})
		end
		return t_1
	else
		return if p1.key then { { icon = t_3[p0], text = p2:Format(p1.key) } } else {}
	end
end

local function selectRoactGamepadBindings(p3) --[[ line: 514 ]]
	return if p3.GamepadBottomBar then p3.GamepadBottomBar.boundInputs else nil
end

local function getGamepadItems(p4, p5, p6, p7, p8) --[[ line: 518 ]]
	-- upvalues: list (ref), t_1 (ref), t_2 (ref), getLegacyInputBindings (ref), t_4 (ref), fFlagLuaAppEnableStickyShortcutBar (ref), fFlagGuacStickyShortcutBarEnabled (ref), var16 (ref), t_6 (ref), t_5 (ref), t_7 (ref), t_8 (ref), focusNavigationEventNameEnum (ref), t_3 (ref)
	local t = {}
	
	for i, v in list do
		if t_1[v] and (not p7 or not t_2[v]) then
			local var30, v_1
			if not p7 then
				var30 = p4[v]
				
				if var30 then
					local var31 = t_4[v]
					local var32 = if (fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled) and p8 then var16[v] else nil
					local i_1 = if (fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled) and p8 then (if (fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled) and (p8 and var32) then var32[var30] else nil) or (if (fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled) and (p8 and var31) then var31[var30] else nil) elseif var31 then var31[var30] else nil
					v_1 = if (fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled) and p8 then t_6[var30] else nil
					local var33 = if (fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled) and p8 then v_1 or t_5[var30] else t_5[var30]
					local var34 = if var33 then p6:Format(var33) else nil
					local var35 = t_7[var30]
					local var36 = if var35 then p6:Format(var35) else nil
					local var37 = p5[var30]
					local var38 = t_8[var30]
					
					if i_1 and var34 then
						table.insert(t, {
							icon = i_1,
							text = var34,
							actionText = if (fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled) and p8 then nil else var36,
							progress = var37,
							hasProgress = var38,
							inputKeyCode = if (fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled) and p8 then v else nil,
							eventName = if (fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled) and p8 then var30 else nil
						})
					end
				end
			elseif not t_2[v] then
				var30 = p7[v]
				
				if var30 then
					for i_1, v_1 in getLegacyInputBindings(v, var30, p6) do
						table.insert(t, v_1)
					end
				end
			end
		end
	end
	if (fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled) and p8 then
		local buttonB = p4[Enum.KeyCode.ButtonB]
		
		if buttonB == focusNavigationEventNameEnum.NavigateBack then
			table.insert(t, {
				icon = t_3[Enum.KeyCode.ButtonB],
				text = p6:Format(t_5[buttonB]),
				inputKeyCode = Enum.KeyCode.ButtonB,
				eventName = buttonB
			})
		end
	end
	return t
end

local function getKeyboardItems(p9, p10, p11, p12) --[[ line: 622 ]]
	-- upvalues: t_1 (ref), list_1 (ref), t_5 (ref), t_7 (ref), t_8 (ref), fFlagLuaAppEnableStickyShortcutBar (ref), fFlagGuacStickyShortcutBarEnabled (ref)
	local t = {}
	local t_2 = {}
	
	for i, v in p9 do
		if not t_1[i] then
			if typeof(t_2[v]) == "table" then
				table.insert(t_2[v], i)
			else
				t_2[v] = { i }
			end
		end
	end
	for i_1, v_1 in list_1 do
		local var41 = t_2[v_1]
		
		if var41 then
			local var42 = t_5[v_1]
			local var43 = if var42 then p11:Format(var42) else nil
			local var44 = t_7[v_1]
			local var45 = if var44 then p11:Format(var44) else nil
			local var46 = p10[v_1]
			local var47 = t_8[v_1]
			
			if var43 then
				table.insert(t, {
					icon = var41,
					text = var43,
					actionText = if (fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled) and p12 then nil else var45,
					progress = var46,
					hasProgress = var47,
					inputKeyCode = if (fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled) and p12 then var41[1] else nil,
					eventName = if (fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled) and p12 then v_1 else nil
				})
			end
		end
	end
	return t
end

local function useShortcutBarFrameProps() --[[ line: 676 ]]
	-- upvalues: useUiModeInfo (ref), useDesignTokens (ref), uiMode (ref), fFlagEnableLeftNavOnConsole (ref), useSignalState (ref), displayModule (ref), fFlagRenameDeprecatedUIBloxTokens (ref)
	local var48 = useUiModeInfo()
	local var49 = useDesignTokens()
	
	return if (if var48 then var48.uiMode else nil) == uiMode.TenFoot and not fFlagEnableLeftNavOnConsole then {} else {
		Position = UDim2.new(0.5, 0, 1, if var49 then -(if fFlagRenameDeprecatedUIBloxTokens then var49.Size.Size_200 else var49.Global.Space_100) + (if fFlagEnableLeftNavOnConsole then (if fFlagEnableLeftNavOnConsole then useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding) else nil).bottom else 0) else 0),
		AnchorPoint = Vector2.new(0.5, 1)
	}
end

local function useShortcutBarItems() --[[ line: 710 ]]
	-- upvalues: reactFocusNavigationModule (ref), reactModule (ref), localizationRoactContext (ref), useHeldProgressByEvent (ref), useLastInputMethod (ref), fFlagLuaAppResponsiveEnginePreferredInput (ref), responsiveModule (ref), useSelector (ref), selectRoactGamepadBindings (ref), fFlagGuacStickyShortcutBarEnabled (ref), useAppPolicy (ref), fFlagLuaAppEnableStickyShortcutBar (ref), useIsStickyShortcutBarEnabled (ref), getGamepadItems (ref), getKeyboardItems (ref)
	local isGamepad
	local var50 = reactFocusNavigationModule.useActiveEventMap()
	local var51 = reactModule.useContext(localizationRoactContext)
	local var52 = useHeldProgressByEvent()
	local var53 = useLastInputMethod()
	local var54 = if fFlagLuaAppResponsiveEnginePreferredInput then responsiveModule.usePreferredInput() else nil
	local _ = {}
	local var55 = useSelector(selectRoactGamepadBindings)
	local var56 = if fFlagGuacStickyShortcutBarEnabled then useAppPolicy(function(p13) --[[ line: 722 ]]
		return p13.getStickyShortcutBarEnabled()
	end) elseif fFlagLuaAppEnableStickyShortcutBar then useIsStickyShortcutBarEnabled() else nil
	
	if fFlagLuaAppResponsiveEnginePreferredInput then
		isGamepad = var54 == responsiveModule.Input.Directional
		isGamepad = nil
	else
		isGamepad = var53 == "Gamepad"
	end
	return if isGamepad then getGamepadItems(var50, var52, var51, var55, if fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled then var56 else nil) else getKeyboardItems(var50, var52, var51, if fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled then var56 else nil)
end

function useAppShortcutBarProps() --[[ line: 757 ]]
	-- upvalues: useShortcutBarFrameProps (ref), useShortcutBarItems (ref), cryoModule (ref)
	return cryoModule.Dictionary.union(useShortcutBarFrameProps(), { items = useShortcutBarItems() })
end

return useAppShortcutBarProps