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
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useSignalState = require(parent.SignalsReact).useSignalState
local useIsTvRemoteDevice = require(parent.RoactUtils).Hooks.useIsTvRemoteDevice
local displayModule = require(parent.Display)
local noShortcutBarWithTvRemote = game:DefineFastFlag("NoShortcutBarWithTvRemote", false)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad = sharedFlagsModule.FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad
local fFlagAXMigrateEmoteMenuFromRoactGamepad = sharedFlagsModule.FFlagAXMigrateEmoteMenuFromRoactGamepad
local fFlagAXMigratePurchasePromptInteractiveToFocusNavigation = sharedFlagsModule.FFlagAXMigratePurchasePromptInteractiveToFocusNavigation
local fFlagAXMigrateAdjustAccessoryViewToFocusNavigation = sharedFlagsModule.FFlagAXMigrateAdjustAccessoryViewToFocusNavigation
local fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation = sharedFlagsModule.FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation
local fFlagAXMigrateCatalogPageInputBindings = sharedFlagsModule.FFlagAXMigrateCatalogPageInputBindings
local fFlagAXMigrateLookDetailsPeekViewToFocusNavigation = sharedFlagsModule.FFlagAXMigrateLookDetailsPeekViewToFocusNavigation
local fFlagLuaAppResponsiveEnginePreferredInput = sharedFlagsModule.FFlagLuaAppResponsiveEnginePreferredInput
local fFlagEnableLeftNavOnConsole = sharedFlagsModule.FFlagEnableLeftNavOnConsole
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagSocialCarouselPressXToViewProfile = sharedFlagsModule.FFlagSocialCarouselPressXToViewProfile
local fFlagLuaAppMediaGalleryGamepadSupport = sharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
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
	focusNavigationEventNameEnum.HoldToAcceptTrustedFriendRequest,
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
	focusNavigationEventNameEnum.IgnoreTrustedFriendRequest,
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
local t_4 = {
	[Enum.KeyCode.ButtonA] = userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonA)
}
local t_5 = {
	[Enum.KeyCode.ButtonY] = {
		[focusNavigationEventNameEnum.Search] = t_3[Enum.KeyCode.ButtonY],
		[focusNavigationEventNameEnum.DisplayStatsAndInfo] = t_3[Enum.KeyCode.ButtonY],
		[focusNavigationEventNameEnum.OpenLayeredClothingSortResetPrompt] = t_3[Enum.KeyCode.ButtonY],
		[focusNavigationEventNameEnum.OpenLayeredMakeupSortResetPrompt] = t_3[Enum.KeyCode.ButtonY],
		[focusNavigationEventNameEnum.SortAndFiltersReset] = t_3[Enum.KeyCode.ButtonY],
		[focusNavigationEventNameEnum.WearAfterPurchase] = if fFlagAXMigratePurchasePromptInteractiveToFocusNavigation then t_3[Enum.KeyCode.ButtonY] else nil,
		[focusNavigationEventNameEnum.FormPeekViewReset] = t_3[Enum.KeyCode.ButtonY],
		[focusNavigationEventNameEnum.AdjustAccessoryViewReset] = if fFlagAXMigrateAdjustAccessoryViewToFocusNavigation then t_3[Enum.KeyCode.ButtonY] else nil,
		[focusNavigationEventNameEnum.ManageOutfitsRename] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then t_3[Enum.KeyCode.ButtonY] else nil,
		[focusNavigationEventNameEnum.OpenItemDetailsPeekView] = t_3[Enum.KeyCode.ButtonY],
		[focusNavigationEventNameEnum.CloseItemDetailsPeekView] = t_3[Enum.KeyCode.ButtonY],
		[focusNavigationEventNameEnum.ToggleTryOn] = t_3[Enum.KeyCode.ButtonY],
		[focusNavigationEventNameEnum.ToggleTryOnManager] = if fFlagAXMigrateLookDetailsPeekViewToFocusNavigation or fFlagAXMigrateCatalogPageInputBindings then t_3[Enum.KeyCode.ButtonY] else nil,
		[focusNavigationEventNameEnum.RemoveClothingTile] = t_3[Enum.KeyCode.ButtonY]
	},
	[Enum.KeyCode.ButtonX] = {
		[focusNavigationEventNameEnum.Play] = t_3[Enum.KeyCode.ButtonX],
		[focusNavigationEventNameEnum.SeeAll] = t_3[Enum.KeyCode.ButtonX],
		[focusNavigationEventNameEnum.AcceptFriendRequest] = t_3[Enum.KeyCode.ButtonX],
		[focusNavigationEventNameEnum.AddFriend] = t_3[Enum.KeyCode.ButtonX],
		[focusNavigationEventNameEnum.OpenBuyCatalogItemPrompt] = t_3[Enum.KeyCode.ButtonX],
		[focusNavigationEventNameEnum.OpenItemDetailsPage] = if fFlagAXMigrateEmoteMenuFromRoactGamepad then t_3[Enum.KeyCode.ButtonX] else nil,
		[focusNavigationEventNameEnum.SortAndFiltersApply] = t_3[Enum.KeyCode.ButtonX],
		[focusNavigationEventNameEnum.SaveAsCharacter] = if fFlagAXMigratePurchasePromptInteractiveToFocusNavigation then t_3[Enum.KeyCode.ButtonX] else nil,
		[focusNavigationEventNameEnum.FormPeekViewApply] = t_3[Enum.KeyCode.ButtonX],
		[focusNavigationEventNameEnum.ManageOutfitsDelete] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then t_3[Enum.KeyCode.ButtonX] else nil,
		[focusNavigationEventNameEnum.OpenItemDetailsPrompt] = t_3[Enum.KeyCode.ButtonX],
		[focusNavigationEventNameEnum.UpdateOutfit] = t_3[Enum.KeyCode.ButtonX],
		[focusNavigationEventNameEnum.IgnoreTrustedFriendRequest] = t_3[Enum.KeyCode.ButtonX],
		[focusNavigationEventNameEnum.IgnoreFriendRequest] = t_3[Enum.KeyCode.ButtonX],
		[focusNavigationEventNameEnum.ViewProfile] = if fFlagSocialCarouselPressXToViewProfile then t_3[Enum.KeyCode.ButtonX] else nil
	},
	[Enum.KeyCode.ButtonA] = {
		[focusNavigationEventNameEnum.PlayVideo] = if fFlagLuaAppMediaGalleryGamepadSupport then t_3[Enum.KeyCode.ButtonA] else nil,
		[focusNavigationEventNameEnum.PauseVideo] = if fFlagLuaAppMediaGalleryGamepadSupport then t_3[Enum.KeyCode.ButtonA] else nil,
		[focusNavigationEventNameEnum.HoldToAcceptTrustedFriendRequest] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToAcceptFriendRequest] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToAddFriend] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToJoinEvent] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToUnfollowEvent] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToNotifyMe] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToPlay] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToJoinFriend] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.SelectItem] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.SlotEmote] = t_3[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.UnslotEmote] = t_3[Enum.KeyCode.ButtonA],
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
		[focusNavigationEventNameEnum.ExitAvatarFullView] = t_3[Enum.KeyCode.ButtonR3],
		[focusNavigationEventNameEnum.Fullscreen] = t_3[Enum.KeyCode.ButtonR3],
		[focusNavigationEventNameEnum.ExitFullscreen] = t_3[Enum.KeyCode.ButtonR3]
	},
	[Enum.KeyCode.ButtonL3] = {
		[focusNavigationEventNameEnum.OpenCatalogContextMenu] = t_3[Enum.KeyCode.ButtonL3],
		[focusNavigationEventNameEnum.OpenItemDetailsPage] = t_3[Enum.KeyCode.ButtonL3],
		[focusNavigationEventNameEnum.ManageOutfitsToggleMultiSelect] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then t_3[Enum.KeyCode.ButtonL3] else nil,
		[focusNavigationEventNameEnum.ManageOutfitsCancelMultiSelect] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then t_3[Enum.KeyCode.ButtonL3] else nil,
		[focusNavigationEventNameEnum.OpenEditorDetailsPage] = t_3[Enum.KeyCode.ButtonL3],
		[focusNavigationEventNameEnum.Mute] = t_3[Enum.KeyCode.ButtonL3],
		[focusNavigationEventNameEnum.Unmute] = t_3[Enum.KeyCode.ButtonL3]
	},
	[Enum.KeyCode.ButtonStart] = {
		[focusNavigationEventNameEnum.OpenQuickMenu] = t_3[Enum.KeyCode.ButtonStart]
	},
	[Enum.KeyCode.Thumbstick1] = {
		[focusNavigationEventNameEnum.PanAvatar] = t_3[Enum.KeyCode.Thumbstick1],
		[focusNavigationEventNameEnum.MoveClothingTile] = t_3[Enum.KeyCode.Thumbstick1]
	},
	[Enum.KeyCode.Thumbstick2] = {
		[focusNavigationEventNameEnum.RotateAndZoomAvatar] = t_3[Enum.KeyCode.Thumbstick2]
	}
}
local t_6 = {
	[Enum.KeyCode.ButtonA] = {
		[focusNavigationEventNameEnum.HoldToAcceptTrustedFriendRequest] = t_4[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToAcceptFriendRequest] = t_4[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToAddFriend] = t_4[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToJoinEvent] = t_4[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToUnfollowEvent] = t_4[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToNotifyMe] = t_4[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToPlay] = t_4[Enum.KeyCode.ButtonA],
		[focusNavigationEventNameEnum.HoldToJoinFriend] = t_4[Enum.KeyCode.ButtonA]
	}
}
local t_7 = {
	[focusNavigationEventNameEnum.Fullscreen] = "Feature.ExperienceDetails.Action.FullScreen",
	[focusNavigationEventNameEnum.ExitFullscreen] = "Feature.ExperienceDetails.Action.ExitFullScreen",
	[focusNavigationEventNameEnum.Mute] = "Feature.ExperienceDetails.Action.Mute",
	[focusNavigationEventNameEnum.Unmute] = "Feature.ExperienceDetails.Action.Unmute",
	[focusNavigationEventNameEnum.PlayVideo] = if fFlagLuaAppMediaGalleryGamepadSupport then "Feature.GameDetails.Action.PlayVideo" else nil,
	[focusNavigationEventNameEnum.PauseVideo] = if fFlagLuaAppMediaGalleryGamepadSupport then "Feature.GameDetails.Action.PauseVideo" else nil,
	[focusNavigationEventNameEnum.Search] = "CommonUI.Features.Label.ControllerBar.Search",
	[focusNavigationEventNameEnum.SeeAll] = "Feature.Home.ActionSeeAll",
	[focusNavigationEventNameEnum.Play] = "Common.VisitGame.Label.Play",
	[focusNavigationEventNameEnum.DisplayStatsAndInfo] = "Feature.GameDetails.Label.LearnMore",
	[focusNavigationEventNameEnum.HoldToPlay] = "CommonUI.Features.Label.ControllerBar.ToPlaySuffix",
	[focusNavigationEventNameEnum.HoldToJoinFriend] = "Feature.Profile.Action.JoinGame",
	[focusNavigationEventNameEnum.IgnoreTrustedFriendRequest] = "Feature.AddFriends.Action.IgnoreTrustedFriendRequest",
	[focusNavigationEventNameEnum.IgnoreFriendRequest] = if fFlagConnectionsToFriendsRename then "Feature.AddFriends.Action.IgnoreFriendRequest" else "Feature.AddFriends.Action.IgnoreConnectionRequest",
	[focusNavigationEventNameEnum.AcceptFriendRequest] = if fFlagConnectionsToFriendsRename then "CommonUI.Features.Label.AcceptFriend" else "CommonUI.Features.Label.AcceptConnection",
	[focusNavigationEventNameEnum.AddFriend] = if fFlagConnectionsToFriendsRename then "CommonUI.Features.Label.AddFriend" else "CommonUI.Features.Label.AddConnection",
	[focusNavigationEventNameEnum.HoldToAddFriend] = if fFlagConnectionsToFriendsRename then "CommonUI.Features.Label.AddFriend" else "CommonUI.Features.Label.AddConnection",
	[focusNavigationEventNameEnum.HoldToAcceptFriendRequest] = if fFlagConnectionsToFriendsRename then "CommonUI.Features.Label.AcceptFriend" else "CommonUI.Features.Label.AcceptConnection",
	[focusNavigationEventNameEnum.HoldToAcceptTrustedFriendRequest] = "Feature.Friends.TrustedFriend.AcceptTrustedRequest",
	[focusNavigationEventNameEnum.HoldToJoinEvent] = "Feature.VirtualEvents.JoinEvent",
	[focusNavigationEventNameEnum.HoldToUnfollowEvent] = "Feature.VirtualEvents.UnfollowEvent",
	[focusNavigationEventNameEnum.HoldToNotifyMe] = "Feature.VirtualEvents.NotifyMe",
	[focusNavigationEventNameEnum.OpenQuickMenu] = "Feature.Catalog.Heading.QuickMenu",
	[focusNavigationEventNameEnum.ScrollUp] = "Feature.Accessibility.Action.ScrollUp",
	[focusNavigationEventNameEnum.ScrollDown] = "Feature.Accessibility.Action.ScrollDown",
	[focusNavigationEventNameEnum.NavigateBack] = "CommonUI.Controls.Action.Back",
	[focusNavigationEventNameEnum.OpenBuyCatalogItemPrompt] = "Feature.Catalog.Action.Buy",
	[focusNavigationEventNameEnum.OpenCatalogContextMenu] = "Feature.Catalog.Action.ItemOptions",
	[focusNavigationEventNameEnum.OpenItemDetailsPage] = "Feature.Catalog.Action.OpenDetails",
	[focusNavigationEventNameEnum.SelectItem] = "Feature.Avatar.Action.Select",
	[focusNavigationEventNameEnum.EquipSlotsSelectSlot] = if fFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then "Feature.Avatar.Action.SelectSlot" else nil,
	[focusNavigationEventNameEnum.SlotEmote] = "Feature.Avatar.Action.SlotEmote",
	[focusNavigationEventNameEnum.UnslotEmote] = "Feature.Avatar.Action.UnslotEmote",
	[focusNavigationEventNameEnum.OpenEditorDetailsPage] = "Feature.Catalog.Action.OpenDetails",
	[focusNavigationEventNameEnum.PanAvatar] = "Feature.Avatar.Action.Pan",
	[focusNavigationEventNameEnum.RotateAndZoomAvatar] = "Feature.Avatar.Action.Rotate",
	[focusNavigationEventNameEnum.ExitAvatarFullView] = "Feature.Avatar.Action.DefaultView",
	[focusNavigationEventNameEnum.OpenLayeredClothingSortResetPrompt] = "CommonUI.Messages.Action.Reset",
	[focusNavigationEventNameEnum.OpenLayeredMakeupSortResetPrompt] = "CommonUI.Messages.Action.Reset",
	[focusNavigationEventNameEnum.SortAndFiltersApply] = "CommonUI.Messages.Action.Apply",
	[focusNavigationEventNameEnum.SortAndFiltersReset] = "CommonUI.Messages.Action.Reset",
	[focusNavigationEventNameEnum.SaveAsCharacter] = if fFlagAXMigratePurchasePromptInteractiveToFocusNavigation then "Feature.Avatar.Heading.SaveCostume" else nil,
	[focusNavigationEventNameEnum.WearAfterPurchase] = if fFlagAXMigratePurchasePromptInteractiveToFocusNavigation then "Feature.Avatar.Heading.WearConfirmation" else nil,
	[focusNavigationEventNameEnum.Confirm] = "CommonUI.Controls.Action.Confirm",
	[focusNavigationEventNameEnum.FormPeekViewApply] = "CommonUI.Messages.Action.Apply",
	[focusNavigationEventNameEnum.FormPeekViewReset] = "CommonUI.Messages.Action.Reset",
	[focusNavigationEventNameEnum.AdjustAccessoryViewReset] = if fFlagAXMigrateAdjustAccessoryViewToFocusNavigation then "CommonUI.Messages.Action.Reset" else nil,
	[focusNavigationEventNameEnum.ManageOutfitsToggleMultiSelect] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.SelectMultipleItems" else nil,
	[focusNavigationEventNameEnum.ManageOutfitsCancelMultiSelect] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.CancelSelection" else nil,
	[focusNavigationEventNameEnum.ManageOutfitsDelete] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.Delete" else nil,
	[focusNavigationEventNameEnum.ManageOutfitsRename] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.Rename" else nil,
	[focusNavigationEventNameEnum.SelectOutfit] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.Select" else nil,
	[focusNavigationEventNameEnum.UnselectOutfit] = if fFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.Unselect" else nil,
	[focusNavigationEventNameEnum.OpenItemDetailsPeekView] = "Feature.Catalog.Action.OpenDetails",
	[focusNavigationEventNameEnum.CloseItemDetailsPeekView] = "Feature.Catalog.Action.CloseDetails",
	[focusNavigationEventNameEnum.OpenItemDetailsPrompt] = "Feature.Catalog.Action.Buy",
	[focusNavigationEventNameEnum.ToggleTryOn] = "Feature.Catalog.Label.TryOns",
	[focusNavigationEventNameEnum.UpdateOutfit] = "Feature.Avatar.Action.Update",
	[focusNavigationEventNameEnum.ToggleTryOnManager] = if fFlagAXMigrateLookDetailsPeekViewToFocusNavigation or fFlagAXMigrateCatalogPageInputBindings then "Feature.Catalog.Label.TryOns" else nil,
	[focusNavigationEventNameEnum.SelectClothingTile] = "Feature.Avatar.Action.Select",
	[focusNavigationEventNameEnum.MoveClothingTile] = "Feature.Avatar.Title.Move",
	[focusNavigationEventNameEnum.RemoveClothingTile] = "Feature.Catalog.Action.Remove",
	[focusNavigationEventNameEnum.CancelAndReset] = "Feature.Catalog.Action.Cancel",
	[focusNavigationEventNameEnum.ViewProfile] = if fFlagSocialCarouselPressXToViewProfile then "Feature.Profile.Action.ViewProfile" else nil
}
local t_8 = {
	[focusNavigationEventNameEnum.HoldToPlay] = "Common.VisitGame.Label.Play",
	[focusNavigationEventNameEnum.HoldToJoinFriend] = "Feature.Profile.Action.JoinGame"
}
local t_9 = {
	[focusNavigationEventNameEnum.HoldToPlay] = "CommonUI.Features.Label.ControllerBar.HoldPrefix"
}
local t_10 = {
	[focusNavigationEventNameEnum.HoldToAcceptTrustedFriendRequest] = true,
	[focusNavigationEventNameEnum.HoldToAcceptFriendRequest] = true,
	[focusNavigationEventNameEnum.HoldToAddFriend] = true,
	[focusNavigationEventNameEnum.HoldToJoinEvent] = true,
	[focusNavigationEventNameEnum.HoldToUnfollowEvent] = true,
	[focusNavigationEventNameEnum.HoldToNotifyMe] = true,
	[focusNavigationEventNameEnum.HoldToPlay] = true,
	[focusNavigationEventNameEnum.HoldToJoinFriend] = true
}

local function getLegacyInputBindings(p1, p2, p3)
	-- upvalues: t (ref), t_3 (ref)
	if p2.axes then
		local vertical = p2.axes.vertical
		local horizontal = p2.axes.horizontal
		local var1 = t[p1]
		local t_1 = {}
		
		if vertical then
			table.insert(t_1, { icon = var1.vertical, text = p3:Format(vertical.key) })
		end
		if horizontal then
			table.insert(t_1, {
				icon = var1.horizontal,
				text = p3:Format(horizontal.key)
			})
		end
		return t_1
	else
		return if p2.key then { { icon = t_3[p1], text = p3:Format(p2.key) } } else {}
	end
end

local function selectRoactGamepadBindings(p1)
	return if p1.GamepadBottomBar then p1.GamepadBottomBar.boundInputs else nil
end

local function getGamepadItems(p1, p2, p3, p4, p5)
	-- upvalues: list (ref), t_1 (ref), t_2 (ref), getLegacyInputBindings (ref), t_5 (ref), t_6 (ref), t_8 (ref), t_7 (ref), t_9 (ref), t_10 (ref), focusNavigationEventNameEnum (ref), t_3 (ref)
	local t = {}
	
	for i, v in list do
		if t_1[v] and (not p4 or not t_2[v]) then
			if not p4 then
				local var1 = p1[v]
				
				if var1 then
					local var2 = t_5[v]
					local var3 = if p5 then t_6[v] else nil
					local i_1 = if p5 then (if p5 and var3 then var3[var1] else nil) or (if p5 and var2 then var2[var1] else nil) elseif var2 then var2[var1] else nil
					local var4 = if p5 then (if p5 then t_8[var1] else nil) or t_7[var1] else t_7[var1]
					local var5 = if var4 then p3:Format(var4) else nil
					local var6 = t_9[var1]
					local var7 = if var6 then p3:Format(var6) else nil
					local var8 = p2[var1]
					local var9 = t_10[var1]
					
					if i_1 and var5 then
						table.insert(t, {
							icon = i_1,
							text = var5,
							actionText = if p5 then nil else var7,
							progress = var8,
							hasProgress = var9,
							inputKeyCode = if p5 then v else nil,
							eventName = if p5 then var1 else nil
						})
					end
				end
			elseif not t_2[v] then
				local var10 = p4[v]
				
				if var10 then
					for i_1, v_1 in getLegacyInputBindings(v, var10, p3) do
						table.insert(t, v_1)
					end
				end
			end
		end
	end
	if p5 then
		local buttonB = p1[Enum.KeyCode.ButtonB]
		
		if buttonB == focusNavigationEventNameEnum.NavigateBack then
			table.insert(t, {
				icon = t_3[Enum.KeyCode.ButtonB],
				text = p3:Format(t_7[buttonB]),
				inputKeyCode = Enum.KeyCode.ButtonB,
				eventName = buttonB
			})
		end
	end
	return t
end

local function getKeyboardItems(p6, p7, p8, p9)
	-- upvalues: t_1 (ref), list_1 (ref), t_7 (ref), t_9 (ref), t_10 (ref)
	local t = {}
	local t_2 = {}
	
	for i, v in p6 do
		if not t_1[i] then
			if typeof(t_2[v]) == "table" then
				table.insert(t_2[v], i)
			else
				t_2[v] = { i }
			end
		end
	end
	for i_1, v_1 in list_1 do
		local var11 = t_2[v_1]
		
		if var11 then
			local var12 = t_7[v_1]
			local var13 = if var12 then p8:Format(var12) else nil
			local var14 = t_9[v_1]
			local var15 = if var14 then p8:Format(var14) else nil
			local var16 = p7[v_1]
			local var17 = t_10[v_1]
			
			if var13 then
				table.insert(t, {
					icon = var11,
					text = var13,
					actionText = if p9 then nil else var15,
					progress = var16,
					hasProgress = var17,
					inputKeyCode = if p9 then var11[1] else nil,
					eventName = if p9 then v_1 else nil
				})
			end
		end
	end
	return t
end

local function useShortcutBarFrameProps()
	-- upvalues: useUiModeInfo (ref), useDesignTokens (ref), uiMode (ref), fFlagEnableLeftNavOnConsole (ref), useSignalState (ref), displayModule (ref)
	local var18 = useUiModeInfo()
	local var19 = useDesignTokens()
	
	return if (if var18 then var18.uiMode else nil) == uiMode.TenFoot and not fFlagEnableLeftNavOnConsole then {} else {
		Position = UDim2.new(0.5, 0, 1, if var19 then -var19.Size.Size_200 + (if fFlagEnableLeftNavOnConsole then (if fFlagEnableLeftNavOnConsole then useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding) else nil).bottom else 0) else 0),
		AnchorPoint = Vector2.new(0.5, 1)
	}
end

local function useShortcutBarItems()
	-- upvalues: reactFocusNavigationModule (ref), reactModule (ref), localizationRoactContext (ref), useHeldProgressByEvent (ref), useLastInputMethod (ref), fFlagLuaAppResponsiveEnginePreferredInput (ref), responsiveModule (ref), noShortcutBarWithTvRemote (ref), useIsTvRemoteDevice (ref), useSelector (ref), selectRoactGamepadBindings (ref), useAppPolicy (ref), getGamepadItems (ref), getKeyboardItems (ref)
	local isGamepad
	local var18 = reactFocusNavigationModule.useActiveEventMap()
	local var19 = reactModule.useContext(localizationRoactContext)
	local var20 = useHeldProgressByEvent()
	local var21 = useLastInputMethod()
	local var22 = if fFlagLuaAppResponsiveEnginePreferredInput then responsiveModule.usePreferredInput() else nil
	local var23 = if noShortcutBarWithTvRemote then useIsTvRemoteDevice() else nil
	local _ = {}
	local var24 = useSelector(selectRoactGamepadBindings)
	local var25 = useAppPolicy(function(p10)
		return p10.getStickyShortcutBarEnabled()
	end)
	
	if fFlagLuaAppResponsiveEnginePreferredInput then
		isGamepad = var22 == responsiveModule.Input.Directional
		isGamepad = nil
	else
		isGamepad = var21 == "Gamepad"
	end
	return if isGamepad then if var23 then {} else getGamepadItems(var18, var20, var19, var24, var25) else getKeyboardItems(var18, var20, var19, var25)
end

function useAppShortcutBarProps()
	-- upvalues: useShortcutBarFrameProps (ref), useShortcutBarItems (ref), cryoModule (ref)
	return cryoModule.Dictionary.union(useShortcutBarFrameProps(), { items = useShortcutBarItems() })
end

return useAppShortcutBarProps