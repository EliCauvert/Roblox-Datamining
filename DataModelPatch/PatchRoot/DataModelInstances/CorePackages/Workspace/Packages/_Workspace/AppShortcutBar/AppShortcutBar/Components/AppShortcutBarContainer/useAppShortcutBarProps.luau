local UserInputService = game:GetService("UserInputService")
local AppShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local Parent = AppShortcutBar.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local _ = require(AppShortcutBar.Components.AppShortcutBar)
local LocalizationRoactContext = require(Parent.Localization).LocalizationRoactContext
local UiMode = require(Parent.RobloxAppEnums).UiMode
local ResponsiveModule = require(Parent.Responsive)
local UseHeldProgressByEventFunction = require(AppShortcutBar.Hooks.AppShortcutBarContext).useHeldProgressByEvent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLastInputMethodFunction = require(Parent.FocusNavigationUtils).useLastInputMethod
local UseUiModeInfoFunction = require(Parent.RobloxAppHooks).useUiModeInfo
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseIsStickyShortcutBarEnabledFunction = require(AppShortcutBar.Hooks).useIsStickyShortcutBarEnabled
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local DisplayModule = require(Parent.Display)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation = SharedFlagsModule.FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation
local FFlagAXMigrateAvatarEditorPageInputBindings = SharedFlagsModule.FFlagAXMigrateAvatarEditorPageInputBindings
local FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad = SharedFlagsModule.FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad
local FFlagAXMigrateEmoteMenuFromRoactGamepad = SharedFlagsModule.FFlagAXMigrateEmoteMenuFromRoactGamepad
local FFlagAXMigrateSceneGamepadHandlerInputBindings = SharedFlagsModule.FFlagAXMigrateSceneGamepadHandlerInputBindings
local FFlagAXMigratePurchasePromptInteractiveToFocusNavigation = SharedFlagsModule.FFlagAXMigratePurchasePromptInteractiveToFocusNavigation
local FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation = SharedFlagsModule.FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation
local FFlagAXMigrateFormPeekViewToFocusNavigation = SharedFlagsModule.FFlagAXMigrateFormPeekViewToFocusNavigation
local FFlagAXMigrateAdjustAccessoryViewToFocusNavigation = SharedFlagsModule.FFlagAXMigrateAdjustAccessoryViewToFocusNavigation
local FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation = SharedFlagsModule.FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation
local FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation = SharedFlagsModule.FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation
local FFlagAXMigrateCatalogSearchToFocusNavigation = SharedFlagsModule.FFlagAXMigrateCatalogSearchToFocusNavigation
local FFlagAXMigrateCatalogPageInputBindings = SharedFlagsModule.FFlagAXMigrateCatalogPageInputBindings
local FFlagAXMigrateLookDetailsPeekViewToFocusNavigation = SharedFlagsModule.FFlagAXMigrateLookDetailsPeekViewToFocusNavigation
local FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation = SharedFlagsModule.FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation
local FFlagLuaAppEnableStickyShortcutBar = SharedFlagsModule.FFlagLuaAppEnableStickyShortcutBar
local FFlagLuaAppResponsiveEnginePreferredInput = SharedFlagsModule.FFlagLuaAppResponsiveEnginePreferredInput
local FFlagEnableLeftNavOnConsole = SharedFlagsModule.FFlagEnableLeftNavOnConsole
local FFlagConnectionsToFriendsRename = SharedFlagsModule.FFlagConnectionsToFriendsRename
local FFlagGuacStickyShortcutBarEnabled = SharedFlagsModule.FFlagGuacStickyShortcutBarEnabled
local FFlagSocialCarouselPressXToViewProfile = SharedFlagsModule.FFlagSocialCarouselPressXToViewProfile
local config = {
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
local List = {
	FocusNavigationEventNameEnum.HoldToAcceptFriendRequest,
	FocusNavigationEventNameEnum.HoldToAddFriend,
	FocusNavigationEventNameEnum.HoldToJoinEvent,
	FocusNavigationEventNameEnum.HoldToUnfollowEvent,
	FocusNavigationEventNameEnum.HoldToNotifyMe,
	FocusNavigationEventNameEnum.HoldToPlay,
	FocusNavigationEventNameEnum.HoldToJoinFriend,
	FocusNavigationEventNameEnum.Play, FocusNavigationEventNameEnum.Search,
	FocusNavigationEventNameEnum.SeeAll,
	FocusNavigationEventNameEnum.DisplayStatsAndInfo,
	FocusNavigationEventNameEnum.AcceptFriendRequest,
	FocusNavigationEventNameEnum.AddFriend,
	FocusNavigationEventNameEnum.IgnoreFriendRequest,
	FocusNavigationEventNameEnum.ViewProfile,
	FocusNavigationEventNameEnum.OpenQuickMenu,
	FocusNavigationEventNameEnum.NavigateBack,
	FocusNavigationEventNameEnum.ScrollUp, FocusNavigationEventNameEnum.ScrollDown
}
table.insert(List, FocusNavigationEventNameEnum.Confirm)
table.insert(List, FocusNavigationEventNameEnum.SelectItem)
table.insert(List, FocusNavigationEventNameEnum.OpenItemDetailsPage)

if FFlagAXMigrateCatalogPageInputBindings then
	table.insert(List, FocusNavigationEventNameEnum.ToggleTryOnManager)
end
local config1 = {
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
local config2 = {
	[Enum.KeyCode.ButtonB] = true,
	[Enum.KeyCode.ButtonL1] = true,
	[Enum.KeyCode.ButtonR1] = true
}
local config3 = {
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
local Config = if FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled then {
	[Enum.KeyCode.ButtonA] = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonA)
} else nil
local config4 = {
	[Enum.KeyCode.ButtonY] = {
		[FocusNavigationEventNameEnum.Search] = config3[Enum.KeyCode.ButtonY],
		[FocusNavigationEventNameEnum.DisplayStatsAndInfo] = config3[Enum.KeyCode.ButtonY],
		[FocusNavigationEventNameEnum.OpenLayeredClothingSortResetPrompt] = config3[Enum.KeyCode.ButtonY],
		[FocusNavigationEventNameEnum.OpenLayeredMakeupSortResetPrompt] = config3[Enum.KeyCode.ButtonY],
		[FocusNavigationEventNameEnum.SortAndFiltersReset] = if FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation then config3[Enum.KeyCode.ButtonY] else nil,
		[FocusNavigationEventNameEnum.WearAfterPurchase] = if FFlagAXMigratePurchasePromptInteractiveToFocusNavigation then config3[Enum.KeyCode.ButtonY] else nil,
		[FocusNavigationEventNameEnum.FormPeekViewReset] = if FFlagAXMigrateFormPeekViewToFocusNavigation then config3[Enum.KeyCode.ButtonY] else nil,
		[FocusNavigationEventNameEnum.AdjustAccessoryViewReset] = if FFlagAXMigrateAdjustAccessoryViewToFocusNavigation then config3[Enum.KeyCode.ButtonY] else nil,
		[FocusNavigationEventNameEnum.ManageOutfitsRename] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then config3[Enum.KeyCode.ButtonY] else nil,
		[FocusNavigationEventNameEnum.OpenItemDetailsPeekView] = if FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation then config3[Enum.KeyCode.ButtonY] else nil,
		[FocusNavigationEventNameEnum.CloseItemDetailsPeekView] = if FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation then config3[Enum.KeyCode.ButtonY] else nil,
		[FocusNavigationEventNameEnum.ToggleTryOn] = if FFlagAXMigrateCatalogSearchToFocusNavigation then config3[Enum.KeyCode.ButtonY] else nil,
		[FocusNavigationEventNameEnum.ToggleTryOnManager] = if FFlagAXMigrateLookDetailsPeekViewToFocusNavigation or FFlagAXMigrateCatalogPageInputBindings then config3[Enum.KeyCode.ButtonY] else nil,
		[FocusNavigationEventNameEnum.RemoveClothingTile] = config3[Enum.KeyCode.ButtonY]
	},
	[Enum.KeyCode.ButtonX] = {
		[FocusNavigationEventNameEnum.Play] = config3[Enum.KeyCode.ButtonX],
		[FocusNavigationEventNameEnum.SeeAll] = config3[Enum.KeyCode.ButtonX],
		[FocusNavigationEventNameEnum.AcceptFriendRequest] = config3[Enum.KeyCode.ButtonX],
		[FocusNavigationEventNameEnum.AddFriend] = config3[Enum.KeyCode.ButtonX],
		[FocusNavigationEventNameEnum.OpenBuyCatalogItemPrompt] = if FFlagAXMigrateAvatarEditorPageInputBindings or FFlagAXMigrateCatalogSearchToFocusNavigation then config3[Enum.KeyCode.ButtonX] else nil,
		[FocusNavigationEventNameEnum.OpenItemDetailsPage] = if FFlagAXMigrateEmoteMenuFromRoactGamepad then config3[Enum.KeyCode.ButtonX] else nil,
		[FocusNavigationEventNameEnum.SortAndFiltersApply] = if FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation then config3[Enum.KeyCode.ButtonX] else nil,
		[FocusNavigationEventNameEnum.SaveAsCharacter] = if FFlagAXMigratePurchasePromptInteractiveToFocusNavigation then config3[Enum.KeyCode.ButtonX] else nil,
		[FocusNavigationEventNameEnum.FormPeekViewApply] = if FFlagAXMigrateFormPeekViewToFocusNavigation then config3[Enum.KeyCode.ButtonX] else nil,
		[FocusNavigationEventNameEnum.ManageOutfitsDelete] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then config3[Enum.KeyCode.ButtonX] else nil,
		[FocusNavigationEventNameEnum.OpenItemDetailsPrompt] = if FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation then config3[Enum.KeyCode.ButtonX] else nil,
		[FocusNavigationEventNameEnum.UpdateOutfit] = config3[Enum.KeyCode.ButtonX],
		[FocusNavigationEventNameEnum.IgnoreFriendRequest] = config3[Enum.KeyCode.ButtonX],
		[FocusNavigationEventNameEnum.ViewProfile] = if FFlagSocialCarouselPressXToViewProfile then config3[Enum.KeyCode.ButtonX] else nil
	},
	[Enum.KeyCode.ButtonA] = {
		[FocusNavigationEventNameEnum.HoldToAcceptFriendRequest] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToAddFriend] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToJoinEvent] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToUnfollowEvent] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToNotifyMe] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToPlay] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToJoinFriend] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.SelectItem] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.SlotEmote] = if FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation then config3[Enum.KeyCode.ButtonA] else nil,
		[FocusNavigationEventNameEnum.UnslotEmote] = if FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation then config3[Enum.KeyCode.ButtonA] else nil,
		[FocusNavigationEventNameEnum.EquipSlotsSelectSlot] = if FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then config3[Enum.KeyCode.ButtonA] else nil,
		[FocusNavigationEventNameEnum.Confirm] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.SelectOutfit] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then config3[Enum.KeyCode.ButtonA] else nil,
		[FocusNavigationEventNameEnum.UnselectOutfit] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then config3[Enum.KeyCode.ButtonA] else nil,
		[FocusNavigationEventNameEnum.SelectClothingTile] = config3[Enum.KeyCode.ButtonA]
	},
	[Enum.KeyCode.ButtonB] = {
		[FocusNavigationEventNameEnum.CancelAndReset] = config3[Enum.KeyCode.ButtonB]
	},
	[Enum.KeyCode.ButtonR3] = {
		[FocusNavigationEventNameEnum.ExitAvatarFullView] = if FFlagAXMigrateSceneGamepadHandlerInputBindings then config3[Enum.KeyCode.ButtonR3] else nil,
		[FocusNavigationEventNameEnum.Fullscreen] = config3[Enum.KeyCode.ButtonR3],
		[FocusNavigationEventNameEnum.ExitFullscreen] = config3[Enum.KeyCode.ButtonR3]
	},
	[Enum.KeyCode.ButtonL3] = {
		[FocusNavigationEventNameEnum.OpenCatalogContextMenu] = if FFlagAXMigrateAvatarEditorPageInputBindings or FFlagAXMigrateCatalogPageInputBindings or FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation or FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation then config3[Enum.KeyCode.ButtonL3] else nil,
		[FocusNavigationEventNameEnum.OpenItemDetailsPage] = config3[Enum.KeyCode.ButtonL3],
		[FocusNavigationEventNameEnum.ManageOutfitsToggleMultiSelect] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then config3[Enum.KeyCode.ButtonL3] else nil,
		[FocusNavigationEventNameEnum.ManageOutfitsCancelMultiSelect] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then config3[Enum.KeyCode.ButtonL3] else nil,
		[FocusNavigationEventNameEnum.OpenEditorDetailsPage] = if FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation then config3[Enum.KeyCode.ButtonL3] else nil,
		[FocusNavigationEventNameEnum.Mute] = config3[Enum.KeyCode.ButtonL3],
		[FocusNavigationEventNameEnum.Unmute] = config3[Enum.KeyCode.ButtonL3]
	},
	[Enum.KeyCode.ButtonStart] = {
		[FocusNavigationEventNameEnum.OpenQuickMenu] = config3[Enum.KeyCode.ButtonStart]
	},
	[Enum.KeyCode.Thumbstick1] = {
		[FocusNavigationEventNameEnum.PanAvatar] = if FFlagAXMigrateSceneGamepadHandlerInputBindings then config3[Enum.KeyCode.Thumbstick1] else nil,
		[FocusNavigationEventNameEnum.MoveClothingTile] = config3[Enum.KeyCode.Thumbstick1]
	},
	[Enum.KeyCode.Thumbstick2] = {
		[FocusNavigationEventNameEnum.RotateAndZoomAvatar] = if FFlagAXMigrateSceneGamepadHandlerInputBindings then config3[Enum.KeyCode.Thumbstick2] else nil
	}
}
local Config1 = if FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled then {
	[Enum.KeyCode.ButtonA] = {
		[FocusNavigationEventNameEnum.HoldToAcceptFriendRequest] = Config[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToAddFriend] = Config[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToJoinEvent] = Config[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToUnfollowEvent] = Config[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToNotifyMe] = Config[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToPlay] = Config[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToJoinFriend] = Config[Enum.KeyCode.ButtonA]
	}
} else nil
local config5 = {
	[FocusNavigationEventNameEnum.Fullscreen] = "Feature.ExperienceDetails.Action.FullScreen",
	[FocusNavigationEventNameEnum.ExitFullscreen] = "Feature.ExperienceDetails.Action.ExitFullScreen",
	[FocusNavigationEventNameEnum.Mute] = "Feature.ExperienceDetails.Action.Mute",
	[FocusNavigationEventNameEnum.Unmute] = "Feature.ExperienceDetails.Action.Unmute",
	[FocusNavigationEventNameEnum.Search] = "CommonUI.Features.Label.ControllerBar.Search",
	[FocusNavigationEventNameEnum.SeeAll] = "Feature.Home.ActionSeeAll",
	[FocusNavigationEventNameEnum.Play] = "Common.VisitGame.Label.Play",
	[FocusNavigationEventNameEnum.DisplayStatsAndInfo] = "Feature.GameDetails.Label.LearnMore",
	[FocusNavigationEventNameEnum.HoldToPlay] = "CommonUI.Features.Label.ControllerBar.ToPlaySuffix",
	[FocusNavigationEventNameEnum.HoldToJoinFriend] = "Feature.Profile.Action.JoinGame",
	[FocusNavigationEventNameEnum.IgnoreFriendRequest] = if FFlagConnectionsToFriendsRename then "Feature.AddFriends.Action.IgnoreFriendRequest" else "Feature.AddFriends.Action.IgnoreConnectionRequest",
	[FocusNavigationEventNameEnum.AcceptFriendRequest] = if FFlagConnectionsToFriendsRename then "CommonUI.Features.Label.AcceptFriend" else "CommonUI.Features.Label.AcceptConnection",
	[FocusNavigationEventNameEnum.AddFriend] = if FFlagConnectionsToFriendsRename then "CommonUI.Features.Label.AddFriend" else "CommonUI.Features.Label.AddConnection",
	[FocusNavigationEventNameEnum.HoldToAddFriend] = if FFlagConnectionsToFriendsRename then "CommonUI.Features.Label.AddFriend" else "CommonUI.Features.Label.AddConnection",
	[FocusNavigationEventNameEnum.HoldToAcceptFriendRequest] = if FFlagConnectionsToFriendsRename then "CommonUI.Features.Label.AcceptFriend" else "CommonUI.Features.Label.AcceptConnection",
	[FocusNavigationEventNameEnum.HoldToJoinEvent] = "Feature.VirtualEvents.JoinEvent",
	[FocusNavigationEventNameEnum.HoldToUnfollowEvent] = "Feature.VirtualEvents.UnfollowEvent",
	[FocusNavigationEventNameEnum.HoldToNotifyMe] = "Feature.VirtualEvents.NotifyMe",
	[FocusNavigationEventNameEnum.OpenQuickMenu] = "Feature.Catalog.Heading.QuickMenu",
	[FocusNavigationEventNameEnum.ScrollUp] = "Feature.Accessibility.Action.ScrollUp",
	[FocusNavigationEventNameEnum.ScrollDown] = "Feature.Accessibility.Action.ScrollDown",
	[FocusNavigationEventNameEnum.NavigateBack] = "CommonUI.Controls.Action.Back",
	[FocusNavigationEventNameEnum.OpenBuyCatalogItemPrompt] = if FFlagAXMigrateAvatarEditorPageInputBindings or FFlagAXMigrateCatalogSearchToFocusNavigation then "Feature.Catalog.Action.Buy" else nil,
	[FocusNavigationEventNameEnum.OpenCatalogContextMenu] = if FFlagAXMigrateAvatarEditorPageInputBindings or FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation or FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation then "Feature.Catalog.Action.ItemOptions" else nil,
	[FocusNavigationEventNameEnum.OpenItemDetailsPage] = "Feature.Catalog.Action.OpenDetails",
	[FocusNavigationEventNameEnum.SelectItem] = "Feature.Avatar.Action.Select",
	[FocusNavigationEventNameEnum.EquipSlotsSelectSlot] = if FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then "Feature.Avatar.Action.SelectSlot" else nil,
	[FocusNavigationEventNameEnum.SlotEmote] = if FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation then "Feature.Avatar.Action.SlotEmote" else nil,
	[FocusNavigationEventNameEnum.UnslotEmote] = if FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation then "Feature.Avatar.Action.UnslotEmote" else nil,
	[FocusNavigationEventNameEnum.OpenEditorDetailsPage] = if FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation then "Feature.Catalog.Action.OpenDetails" else nil,
	[FocusNavigationEventNameEnum.PanAvatar] = if FFlagAXMigrateSceneGamepadHandlerInputBindings then "Feature.Avatar.Action.Pan" else nil,
	[FocusNavigationEventNameEnum.RotateAndZoomAvatar] = if FFlagAXMigrateSceneGamepadHandlerInputBindings then "Feature.Avatar.Action.Rotate" else nil,
	[FocusNavigationEventNameEnum.ExitAvatarFullView] = if FFlagAXMigrateSceneGamepadHandlerInputBindings then "Feature.Avatar.Action.DefaultView" else nil,
	[FocusNavigationEventNameEnum.OpenLayeredClothingSortResetPrompt] = "CommonUI.Messages.Action.Reset",
	[FocusNavigationEventNameEnum.OpenLayeredMakeupSortResetPrompt] = "CommonUI.Messages.Action.Reset",
	[FocusNavigationEventNameEnum.SortAndFiltersApply] = if FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation then "CommonUI.Messages.Action.Apply" else nil,
	[FocusNavigationEventNameEnum.SortAndFiltersReset] = if FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation then "CommonUI.Messages.Action.Reset" else nil,
	[FocusNavigationEventNameEnum.SaveAsCharacter] = if FFlagAXMigratePurchasePromptInteractiveToFocusNavigation then "Feature.Avatar.Heading.SaveCostume" else nil,
	[FocusNavigationEventNameEnum.WearAfterPurchase] = if FFlagAXMigratePurchasePromptInteractiveToFocusNavigation then "Feature.Avatar.Heading.WearConfirmation" else nil,
	[FocusNavigationEventNameEnum.Confirm] = "CommonUI.Controls.Action.Confirm",
	[FocusNavigationEventNameEnum.FormPeekViewApply] = if FFlagAXMigrateFormPeekViewToFocusNavigation then "CommonUI.Messages.Action.Apply" else nil,
	[FocusNavigationEventNameEnum.FormPeekViewReset] = if FFlagAXMigrateFormPeekViewToFocusNavigation then "CommonUI.Messages.Action.Reset" else nil,
	[FocusNavigationEventNameEnum.AdjustAccessoryViewReset] = if FFlagAXMigrateAdjustAccessoryViewToFocusNavigation then "CommonUI.Messages.Action.Reset" else nil,
	[FocusNavigationEventNameEnum.ManageOutfitsToggleMultiSelect] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.SelectMultipleItems" else nil,
	[FocusNavigationEventNameEnum.ManageOutfitsCancelMultiSelect] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.CancelSelection" else nil,
	[FocusNavigationEventNameEnum.ManageOutfitsDelete] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.Delete" else nil,
	[FocusNavigationEventNameEnum.ManageOutfitsRename] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.Rename" else nil,
	[FocusNavigationEventNameEnum.SelectOutfit] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.Select" else nil,
	[FocusNavigationEventNameEnum.UnselectOutfit] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.Unselect" else nil,
	[FocusNavigationEventNameEnum.OpenItemDetailsPeekView] = if FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation then "Feature.Catalog.Action.OpenDetails" else nil,
	[FocusNavigationEventNameEnum.CloseItemDetailsPeekView] = if FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation then "Feature.Catalog.Action.CloseDetails" else nil,
	[FocusNavigationEventNameEnum.OpenItemDetailsPrompt] = if FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation then "Feature.Catalog.Action.Buy" else nil,
	[FocusNavigationEventNameEnum.ToggleTryOn] = if FFlagAXMigrateCatalogSearchToFocusNavigation then "Feature.Catalog.Label.TryOns" else nil,
	[FocusNavigationEventNameEnum.UpdateOutfit] = "Feature.Avatar.Action.Update",
	[FocusNavigationEventNameEnum.ToggleTryOnManager] = if FFlagAXMigrateLookDetailsPeekViewToFocusNavigation or FFlagAXMigrateCatalogPageInputBindings then "Feature.Catalog.Label.TryOns" else nil,
	[FocusNavigationEventNameEnum.SelectClothingTile] = "Feature.Avatar.Action.Select",
	[FocusNavigationEventNameEnum.MoveClothingTile] = "Feature.Avatar.Title.Move",
	[FocusNavigationEventNameEnum.RemoveClothingTile] = "Feature.Catalog.Action.Remove",
	[FocusNavigationEventNameEnum.CancelAndReset] = "Feature.Catalog.Action.Cancel",
	[FocusNavigationEventNameEnum.ViewProfile] = if FFlagSocialCarouselPressXToViewProfile then "Feature.Profile.Action.ViewProfile" else nil
}
local config6 = {
	[FocusNavigationEventNameEnum.HoldToPlay] = "Common.VisitGame.Label.Play",
	[FocusNavigationEventNameEnum.HoldToJoinFriend] = "Feature.Profile.Action.JoinGame"
}
local config7 = {
	[FocusNavigationEventNameEnum.HoldToPlay] = "CommonUI.Features.Label.ControllerBar.HoldPrefix"
}
local config8 = {
	[FocusNavigationEventNameEnum.HoldToAcceptFriendRequest] = true,
	[FocusNavigationEventNameEnum.HoldToAddFriend] = true,
	[FocusNavigationEventNameEnum.HoldToJoinEvent] = true,
	[FocusNavigationEventNameEnum.HoldToUnfollowEvent] = true,
	[FocusNavigationEventNameEnum.HoldToNotifyMe] = true,
	[FocusNavigationEventNameEnum.HoldToPlay] = true,
	[FocusNavigationEventNameEnum.HoldToJoinFriend] = true
}

local function getLegacyInputBindings(p1, p2, p3)
	-- upvalues: config (copy), config3 (copy)
	if not p2.axes then
		return if p2.key then { { icon = config3[p1], text = p3:Format(p2.key) } } else {}
	end
	local Vertical = p2.axes.vertical
	local Horizontal = p2.axes.horizontal
	local Entry = config[p1]
	local List = {}
	
	if Vertical then
		table.insert(List, { icon = Entry.vertical, text = p3:Format(Vertical.key) })
	end
	if Horizontal then
		table.insert(List, {
			icon = Entry.horizontal,
			text = p3:Format(Horizontal.key)
		})
	end
	return List
end

local function selectRoactGamepadBindings(p1)
	return if p1.GamepadBottomBar then p1.GamepadBottomBar.boundInputs else nil
end

local function getGamepadItems(UseActiveEventMapResult, p1, UseContextResult, p2, p3)
	-- upvalues: list (copy), config1 (copy), config2 (copy), getLegacyInputBindings (copy), config4 (copy), FFlagLuaAppEnableStickyShortcutBar (copy), FFlagGuacStickyShortcutBarEnabled (copy), Config1 (copy), config6 (copy), config5 (copy), config7 (copy), config8 (copy), FocusNavigationEventNameEnum (copy), config3 (copy)
	local List = {}
	
	for _, value in list do
		if config1[value] and (not p2 or not config2[value]) then
			if p2 then
				if not config2[value] then
					local v1 = p2[value]
					
					if v1 then
						for _, value1 in getLegacyInputBindings(value, v1, UseContextResult) do
							table.insert(List, value1)
						end
					end
				else
					continue
				end
			end
			local UseActiveEventMapResultEntry = UseActiveEventMapResult[value]
			
			if UseActiveEventMapResultEntry then
				local Entry = config4[value]
				local Entry1 = if (FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled) and p3 then Config1[value] else nil
				local Entry2 = if (FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled) and (p3 and Entry) then Entry[UseActiveEventMapResultEntry] else nil
				local Entry3 = if (FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled) and (p3 and Entry1) then Entry1[UseActiveEventMapResultEntry] else nil
				local Entry3_1 = if (FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled) and p3 then Entry3 or Entry2 elseif Entry then Entry[UseActiveEventMapResultEntry] else nil
				local Entry4 = if (FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled) and p3 then config6[UseActiveEventMapResultEntry] else nil
				local Entry41 = config5[UseActiveEventMapResultEntry]
				local Entry5 = if (FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled) and p3 then Entry4 or Entry41 else config5[UseActiveEventMapResultEntry]
				local FormatResult = if Entry5 then UseContextResult:Format(Entry5) else nil
				local Entry6 = config7[UseActiveEventMapResultEntry]
				local FormatResult1 = if Entry6 then UseContextResult:Format(Entry6) else nil
				local Progress = p1[UseActiveEventMapResultEntry]
				local Entry7 = config8[UseActiveEventMapResultEntry]
				
				if Entry3_1 and FormatResult then
					table.insert(List, {
						icon = Entry3_1,
						text = FormatResult,
						actionText = if (FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled) and p3 then nil else FormatResult1,
						progress = Progress,
						hasProgress = Entry7,
						inputKeyCode = if (FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled) and p3 then value else nil,
						eventName = if (FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled) and p3 then UseActiveEventMapResultEntry else nil
					})
				end
			end
		end
	end
	if (FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled) and p3 then
		local UseActiveEventMapResultEntry = UseActiveEventMapResult[Enum.KeyCode.ButtonB]
		
		if UseActiveEventMapResultEntry == FocusNavigationEventNameEnum.NavigateBack then
			table.insert(List, {
				icon = config3[Enum.KeyCode.ButtonB],
				text = UseContextResult:Format(config5[UseActiveEventMapResultEntry]),
				inputKeyCode = Enum.KeyCode.ButtonB,
				eventName = UseActiveEventMapResultEntry
			})
		end
	end
	return List
end

local function getKeyboardItems(UseActiveEventMapResult, p4, UseContextResult, p5)
	-- upvalues: config1 (copy), List (copy), config5 (copy), config7 (copy), config8 (copy), FFlagLuaAppEnableStickyShortcutBar (copy), FFlagGuacStickyShortcutBarEnabled (copy)
	local List1 = {}
	local t = {}
	
	for i, value in UseActiveEventMapResult do
		if not config1[i] then
			if typeof(t[value]) == "table" then
				table.insert(t[value], i)
			else
				t[value] = { i }
			end
		end
	end
	for _, value1 in List do
		local Entry = t[value1]
		
		if Entry then
			local Entry1 = config5[value1]
			local FormatResult = if Entry1 then UseContextResult:Format(Entry1) else nil
			local Entry2 = config7[value1]
			local FormatResult1 = if Entry2 then UseContextResult:Format(Entry2) else nil
			local Progress = p4[value1]
			local Entry3 = config8[value1]
			
			if FormatResult then
				table.insert(List1, {
					icon = Entry,
					text = FormatResult,
					actionText = if (FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled) and p5 then nil else FormatResult1,
					progress = Progress,
					hasProgress = Entry3,
					inputKeyCode = if (FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled) and p5 then Entry[1] else nil,
					eventName = if (FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled) and p5 then value1 else nil
				})
			end
		end
	end
	return List1
end

local function useShortcutBarFrameProps()
	-- upvalues: UseUiModeInfoFunction (copy), UseDesignTokensFunction (copy), UiMode (copy), FFlagEnableLeftNavOnConsole (copy), UseSignalStateFunction (copy), DisplayModule (copy)
	local UseUiModeInfoResult = UseUiModeInfoFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	if (if UseUiModeInfoResult then UseUiModeInfoResult.uiMode else nil) == UiMode.TenFoot and not FFlagEnableLeftNavOnConsole then
		return {}
	else
		local UseSignalStateResult = if FFlagEnableLeftNavOnConsole then UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding) else nil
		
		return {
			Position = UDim2.new(0.5, 0, 1, if UseDesignTokensResult then -UseDesignTokensResult.Size.Size_200 + (if FFlagEnableLeftNavOnConsole then UseSignalStateResult.bottom else 0) else 0),
			AnchorPoint = Vector2.new(0.5, 1)
		}
	end
end

local function useShortcutBarItems()
	-- upvalues: ReactFocusNavigationModule (copy), ReactModule (copy), LocalizationRoactContext (copy), UseHeldProgressByEventFunction (copy), UseLastInputMethodFunction (copy), FFlagLuaAppResponsiveEnginePreferredInput (copy), ResponsiveModule (copy), UseSelectorFunction (copy), selectRoactGamepadBindings (copy), FFlagGuacStickyShortcutBarEnabled (copy), UseAppPolicyFunction (copy), FFlagLuaAppEnableStickyShortcutBar (copy), UseIsStickyShortcutBarEnabledFunction (copy), getGamepadItems (copy), getKeyboardItems (copy)
	local UseActiveEventMapResult = ReactFocusNavigationModule.useActiveEventMap()
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	local UseHeldProgressByEventResult = UseHeldProgressByEventFunction()
	local UseLastInputMethodResult = UseLastInputMethodFunction()
	local UsePreferredInputResult = if FFlagLuaAppResponsiveEnginePreferredInput then ResponsiveModule.usePreferredInput() else nil
	local UseSelectorResult = UseSelectorFunction(selectRoactGamepadBindings)
	local UseAppPolicyResult = if FFlagGuacStickyShortcutBarEnabled then UseAppPolicyFunction(function(p6)
		return p6.getStickyShortcutBarEnabled()
	end) elseif FFlagLuaAppEnableStickyShortcutBar then UseIsStickyShortcutBarEnabledFunction() else nil
	
	return if if FFlagLuaAppResponsiveEnginePreferredInput then UsePreferredInputResult == ResponsiveModule.Input.Directional else UseLastInputMethodResult == "Gamepad" then getGamepadItems(UseActiveEventMapResult, UseHeldProgressByEventResult, UseContextResult, UseSelectorResult, if FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled then UseAppPolicyResult else nil) else getKeyboardItems(UseActiveEventMapResult, UseHeldProgressByEventResult, UseContextResult, if FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled then UseAppPolicyResult else nil)
end

function useAppShortcutBarProps()
	-- upvalues: useShortcutBarFrameProps (copy), useShortcutBarItems (copy), CryoModule (copy)
	return CryoModule.Dictionary.union(useShortcutBarFrameProps(), { items = useShortcutBarItems() })
end

return useAppShortcutBarProps