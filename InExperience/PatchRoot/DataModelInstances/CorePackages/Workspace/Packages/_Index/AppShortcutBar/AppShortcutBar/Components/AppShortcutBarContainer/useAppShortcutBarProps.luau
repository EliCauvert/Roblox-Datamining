local UserInputService = game:GetService("UserInputService")
local AppShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local Parent = AppShortcutBar.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local _ = require(AppShortcutBar.Components.AppShortcutBar)
local LocalizationRoactContext = require(Parent.Localization).LocalizationRoactContext
local ResponsiveModule = require(Parent.Responsive)
local UseHeldProgressByEventFunction = require(AppShortcutBar.Hooks.AppShortcutBarContext).useHeldProgressByEvent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLastInputMethodFunction = require(Parent.FocusNavigationUtils).useLastInputMethod
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseIsTvRemoteDeviceFunction = require(Parent.RoactUtils).Hooks.useIsTvRemoteDevice
local UseExternalEventFunction = require(Parent.RoactUtils).Hooks.useExternalEvent
local DisplayModule = require(Parent.Display)
local NoShortcutBarWithTvRemote = game:DefineFastFlag("NoShortcutBarWithTvRemote", false)
local ShortcutBarPlatformGamepadIcons = game:DefineFastFlag("ShortcutBarPlatformGamepadIcons", false)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad = SharedFlagsModule.FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad
local FFlagAXMigrateEmoteMenuFromRoactGamepad = SharedFlagsModule.FFlagAXMigrateEmoteMenuFromRoactGamepad
local FFlagAXMigrateAdjustAccessoryViewToFocusNavigation = SharedFlagsModule.FFlagAXMigrateAdjustAccessoryViewToFocusNavigation
local FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation = SharedFlagsModule.FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation
local FFlagAXMigrateCatalogPageInputBindings = SharedFlagsModule.FFlagAXMigrateCatalogPageInputBindings
local FFlagAXMigrateLookDetailsPeekViewToFocusNavigation = SharedFlagsModule.FFlagAXMigrateLookDetailsPeekViewToFocusNavigation
local FFlagLuaAppResponsiveEnginePreferredInput = SharedFlagsModule.FFlagLuaAppResponsiveEnginePreferredInput
local FFlagLuaAppMediaGalleryGamepadSupport = SharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
local FFlagEnableStickyShortcutBarOnAllPlatforms = SharedFlagsModule.FFlagEnableStickyShortcutBarOnAllPlatforms
local FFlagEnableSplitPane = SharedFlagsModule.FFlagEnableSplitPane
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
	FocusNavigationEventNameEnum.HoldToAcceptTrustedFriendRequest,
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
	FocusNavigationEventNameEnum.IgnoreTrustedFriendRequest,
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
if FFlagEnableSplitPane then
	table.insert(List, FocusNavigationEventNameEnum.CollapseAvatar)
	table.insert(List, FocusNavigationEventNameEnum.ExpandAvatar)
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
local config4 = {
	[Enum.KeyCode.ButtonA] = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonA)
}
local config5 = {
	[Enum.KeyCode.ButtonY] = {
		[FocusNavigationEventNameEnum.Search] = config3[Enum.KeyCode.ButtonY],
		[FocusNavigationEventNameEnum.DisplayStatsAndInfo] = config3[Enum.KeyCode.ButtonY],
		[FocusNavigationEventNameEnum.OpenLayeredClothingSortResetPrompt] = config3[Enum.KeyCode.ButtonY],
		[FocusNavigationEventNameEnum.OpenLayeredMakeupSortResetPrompt] = config3[Enum.KeyCode.ButtonY],
		[FocusNavigationEventNameEnum.SortAndFiltersReset] = config3[Enum.KeyCode.ButtonY],
		[FocusNavigationEventNameEnum.WearAfterPurchase] = config3[Enum.KeyCode.ButtonY],
		[FocusNavigationEventNameEnum.FormPeekViewReset] = config3[Enum.KeyCode.ButtonY],
		[FocusNavigationEventNameEnum.AdjustAccessoryViewReset] = if FFlagAXMigrateAdjustAccessoryViewToFocusNavigation then config3[Enum.KeyCode.ButtonY] else nil,
		[FocusNavigationEventNameEnum.ManageOutfitsRename] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then config3[Enum.KeyCode.ButtonY] else nil,
		[FocusNavigationEventNameEnum.OpenItemDetailsPeekView] = config3[Enum.KeyCode.ButtonY],
		[FocusNavigationEventNameEnum.CloseItemDetailsPeekView] = config3[Enum.KeyCode.ButtonY],
		[FocusNavigationEventNameEnum.ToggleTryOn] = config3[Enum.KeyCode.ButtonY],
		[FocusNavigationEventNameEnum.ToggleTryOnManager] = if FFlagAXMigrateLookDetailsPeekViewToFocusNavigation or FFlagAXMigrateCatalogPageInputBindings then config3[Enum.KeyCode.ButtonY] else nil,
		[FocusNavigationEventNameEnum.RemoveClothingTile] = config3[Enum.KeyCode.ButtonY]
	},
	[Enum.KeyCode.ButtonX] = {
		[FocusNavigationEventNameEnum.Play] = config3[Enum.KeyCode.ButtonX],
		[FocusNavigationEventNameEnum.SeeAll] = config3[Enum.KeyCode.ButtonX],
		[FocusNavigationEventNameEnum.AcceptFriendRequest] = config3[Enum.KeyCode.ButtonX],
		[FocusNavigationEventNameEnum.AddFriend] = config3[Enum.KeyCode.ButtonX],
		[FocusNavigationEventNameEnum.OpenBuyCatalogItemPrompt] = config3[Enum.KeyCode.ButtonX],
		[FocusNavigationEventNameEnum.OpenItemDetailsPage] = if FFlagAXMigrateEmoteMenuFromRoactGamepad then config3[Enum.KeyCode.ButtonX] else nil,
		[FocusNavigationEventNameEnum.SortAndFiltersApply] = config3[Enum.KeyCode.ButtonX],
		[FocusNavigationEventNameEnum.SaveAsCharacter] = config3[Enum.KeyCode.ButtonX],
		[FocusNavigationEventNameEnum.FormPeekViewApply] = config3[Enum.KeyCode.ButtonX],
		[FocusNavigationEventNameEnum.ManageOutfitsDelete] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then config3[Enum.KeyCode.ButtonX] else nil,
		[FocusNavigationEventNameEnum.OpenItemDetailsPrompt] = config3[Enum.KeyCode.ButtonX],
		[FocusNavigationEventNameEnum.UpdateOutfit] = config3[Enum.KeyCode.ButtonX],
		[FocusNavigationEventNameEnum.IgnoreTrustedFriendRequest] = config3[Enum.KeyCode.ButtonX],
		[FocusNavigationEventNameEnum.IgnoreFriendRequest] = config3[Enum.KeyCode.ButtonX],
		[FocusNavigationEventNameEnum.ViewProfile] = config3[Enum.KeyCode.ButtonX]
	},
	[Enum.KeyCode.ButtonA] = {
		[FocusNavigationEventNameEnum.PlayVideo] = if FFlagLuaAppMediaGalleryGamepadSupport then config3[Enum.KeyCode.ButtonA] else nil,
		[FocusNavigationEventNameEnum.PauseVideo] = if FFlagLuaAppMediaGalleryGamepadSupport then config3[Enum.KeyCode.ButtonA] else nil,
		[FocusNavigationEventNameEnum.HoldToAcceptTrustedFriendRequest] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToAcceptFriendRequest] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToAddFriend] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToJoinEvent] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToUnfollowEvent] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToNotifyMe] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToPlay] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToJoinFriend] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.SelectItem] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.SlotEmote] = config3[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.UnslotEmote] = config3[Enum.KeyCode.ButtonA],
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
		[FocusNavigationEventNameEnum.ExitAvatarFullView] = config3[Enum.KeyCode.ButtonR3],
		[FocusNavigationEventNameEnum.Fullscreen] = config3[Enum.KeyCode.ButtonR3],
		[FocusNavigationEventNameEnum.ExitFullscreen] = config3[Enum.KeyCode.ButtonR3],
		[FocusNavigationEventNameEnum.CollapseAvatar] = if FFlagEnableSplitPane then config3[Enum.KeyCode.ButtonR3] else nil,
		[FocusNavigationEventNameEnum.ExpandAvatar] = if FFlagEnableSplitPane then config3[Enum.KeyCode.ButtonR3] else nil
	},
	[Enum.KeyCode.ButtonL3] = {
		[FocusNavigationEventNameEnum.OpenCatalogContextMenu] = config3[Enum.KeyCode.ButtonL3],
		[FocusNavigationEventNameEnum.OpenItemDetailsPage] = config3[Enum.KeyCode.ButtonL3],
		[FocusNavigationEventNameEnum.ManageOutfitsToggleMultiSelect] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then config3[Enum.KeyCode.ButtonL3] else nil,
		[FocusNavigationEventNameEnum.ManageOutfitsCancelMultiSelect] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then config3[Enum.KeyCode.ButtonL3] else nil,
		[FocusNavigationEventNameEnum.OpenEditorDetailsPage] = config3[Enum.KeyCode.ButtonL3],
		[FocusNavigationEventNameEnum.Mute] = config3[Enum.KeyCode.ButtonL3],
		[FocusNavigationEventNameEnum.Unmute] = config3[Enum.KeyCode.ButtonL3]
	},
	[Enum.KeyCode.ButtonStart] = {
		[FocusNavigationEventNameEnum.OpenQuickMenu] = config3[Enum.KeyCode.ButtonStart]
	},
	[Enum.KeyCode.Thumbstick1] = {
		[FocusNavigationEventNameEnum.PanAvatar] = config3[Enum.KeyCode.Thumbstick1],
		[FocusNavigationEventNameEnum.MoveClothingTile] = config3[Enum.KeyCode.Thumbstick1]
	},
	[Enum.KeyCode.Thumbstick2] = {
		[FocusNavigationEventNameEnum.RotateAndZoomAvatar] = config3[Enum.KeyCode.Thumbstick2]
	}
}
local config6 = {
	[Enum.KeyCode.ButtonA] = {
		[FocusNavigationEventNameEnum.HoldToAcceptTrustedFriendRequest] = config4[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToAcceptFriendRequest] = config4[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToAddFriend] = config4[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToJoinEvent] = config4[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToUnfollowEvent] = config4[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToNotifyMe] = config4[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToPlay] = config4[Enum.KeyCode.ButtonA],
		[FocusNavigationEventNameEnum.HoldToJoinFriend] = config4[Enum.KeyCode.ButtonA]
	}
}
local config7 = {
	[FocusNavigationEventNameEnum.Fullscreen] = "Feature.ExperienceDetails.Action.FullScreen",
	[FocusNavigationEventNameEnum.ExitFullscreen] = "Feature.ExperienceDetails.Action.ExitFullScreen",
	[FocusNavigationEventNameEnum.Mute] = "Feature.ExperienceDetails.Action.Mute",
	[FocusNavigationEventNameEnum.Unmute] = "Feature.ExperienceDetails.Action.Unmute",
	[FocusNavigationEventNameEnum.PlayVideo] = if FFlagLuaAppMediaGalleryGamepadSupport then "Feature.GameDetails.Action.PlayVideo" else nil,
	[FocusNavigationEventNameEnum.PauseVideo] = if FFlagLuaAppMediaGalleryGamepadSupport then "Feature.GameDetails.Action.PauseVideo" else nil,
	[FocusNavigationEventNameEnum.Search] = "CommonUI.Features.Label.ControllerBar.Search",
	[FocusNavigationEventNameEnum.SeeAll] = "Feature.Home.ActionSeeAll",
	[FocusNavigationEventNameEnum.Play] = "Common.VisitGame.Label.Play",
	[FocusNavigationEventNameEnum.DisplayStatsAndInfo] = "Feature.GameDetails.Label.LearnMore",
	[FocusNavigationEventNameEnum.HoldToPlay] = "CommonUI.Features.Label.ControllerBar.ToPlaySuffix",
	[FocusNavigationEventNameEnum.HoldToJoinFriend] = "Feature.Profile.Action.JoinGame",
	[FocusNavigationEventNameEnum.IgnoreTrustedFriendRequest] = "Feature.AddFriends.Action.IgnoreTrustedFriendRequest",
	[FocusNavigationEventNameEnum.IgnoreFriendRequest] = "Feature.AddFriends.Action.IgnoreFriendRequest",
	[FocusNavigationEventNameEnum.AcceptFriendRequest] = "CommonUI.Features.Label.AcceptFriend",
	[FocusNavigationEventNameEnum.AddFriend] = "CommonUI.Features.Label.AddFriend",
	[FocusNavigationEventNameEnum.HoldToAddFriend] = "CommonUI.Features.Label.AddFriend",
	[FocusNavigationEventNameEnum.HoldToAcceptFriendRequest] = "CommonUI.Features.Label.AcceptFriend",
	[FocusNavigationEventNameEnum.HoldToAcceptTrustedFriendRequest] = "Feature.Friends.TrustedFriend.AcceptTrustedRequest",
	[FocusNavigationEventNameEnum.HoldToJoinEvent] = "Feature.VirtualEvents.JoinEvent",
	[FocusNavigationEventNameEnum.HoldToUnfollowEvent] = "Feature.VirtualEvents.UnfollowEvent",
	[FocusNavigationEventNameEnum.HoldToNotifyMe] = "Feature.VirtualEvents.NotifyMe",
	[FocusNavigationEventNameEnum.OpenQuickMenu] = "Feature.Catalog.Heading.QuickMenu",
	[FocusNavigationEventNameEnum.ScrollUp] = "Feature.Accessibility.Action.ScrollUp",
	[FocusNavigationEventNameEnum.ScrollDown] = "Feature.Accessibility.Action.ScrollDown",
	[FocusNavigationEventNameEnum.NavigateBack] = "CommonUI.Controls.Action.Back",
	[FocusNavigationEventNameEnum.OpenBuyCatalogItemPrompt] = "Feature.Catalog.Action.Buy",
	[FocusNavigationEventNameEnum.OpenCatalogContextMenu] = "Feature.Catalog.Action.ItemOptions",
	[FocusNavigationEventNameEnum.OpenItemDetailsPage] = "Feature.Catalog.Action.OpenDetails",
	[FocusNavigationEventNameEnum.SelectItem] = "Feature.Avatar.Action.Select",
	[FocusNavigationEventNameEnum.EquipSlotsSelectSlot] = if FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then "Feature.Avatar.Action.SelectSlot" else nil,
	[FocusNavigationEventNameEnum.SlotEmote] = "Feature.Avatar.Action.SlotEmote",
	[FocusNavigationEventNameEnum.UnslotEmote] = "Feature.Avatar.Action.UnslotEmote",
	[FocusNavigationEventNameEnum.OpenEditorDetailsPage] = "Feature.Catalog.Action.OpenDetails",
	[FocusNavigationEventNameEnum.PanAvatar] = "Feature.Avatar.Action.Pan",
	[FocusNavigationEventNameEnum.RotateAndZoomAvatar] = "Feature.Avatar.Action.Rotate",
	[FocusNavigationEventNameEnum.ExitAvatarFullView] = "Feature.Avatar.Action.DefaultView",
	[FocusNavigationEventNameEnum.OpenLayeredClothingSortResetPrompt] = "CommonUI.Messages.Action.Reset",
	[FocusNavigationEventNameEnum.OpenLayeredMakeupSortResetPrompt] = "CommonUI.Messages.Action.Reset",
	[FocusNavigationEventNameEnum.SortAndFiltersApply] = "CommonUI.Messages.Action.Apply",
	[FocusNavigationEventNameEnum.SortAndFiltersReset] = "CommonUI.Messages.Action.Reset",
	[FocusNavigationEventNameEnum.SaveAsCharacter] = "Feature.Avatar.Heading.SaveCostume",
	[FocusNavigationEventNameEnum.WearAfterPurchase] = "Feature.Avatar.Heading.WearConfirmation",
	[FocusNavigationEventNameEnum.Confirm] = "CommonUI.Controls.Action.Confirm",
	[FocusNavigationEventNameEnum.FormPeekViewApply] = "CommonUI.Messages.Action.Apply",
	[FocusNavigationEventNameEnum.FormPeekViewReset] = "CommonUI.Messages.Action.Reset",
	[FocusNavigationEventNameEnum.AdjustAccessoryViewReset] = if FFlagAXMigrateAdjustAccessoryViewToFocusNavigation then "CommonUI.Messages.Action.Reset" else nil,
	[FocusNavigationEventNameEnum.ManageOutfitsToggleMultiSelect] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.SelectMultipleItems" else nil,
	[FocusNavigationEventNameEnum.ManageOutfitsCancelMultiSelect] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.CancelSelection" else nil,
	[FocusNavigationEventNameEnum.ManageOutfitsDelete] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.Delete" else nil,
	[FocusNavigationEventNameEnum.ManageOutfitsRename] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.Rename" else nil,
	[FocusNavigationEventNameEnum.SelectOutfit] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.Select" else nil,
	[FocusNavigationEventNameEnum.UnselectOutfit] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then "Feature.Avatar.Action.Unselect" else nil,
	[FocusNavigationEventNameEnum.OpenItemDetailsPeekView] = "Feature.Catalog.Action.OpenDetails",
	[FocusNavigationEventNameEnum.CloseItemDetailsPeekView] = "Feature.Catalog.Action.CloseDetails",
	[FocusNavigationEventNameEnum.OpenItemDetailsPrompt] = "Feature.Catalog.Action.Buy",
	[FocusNavigationEventNameEnum.ToggleTryOn] = "Feature.Catalog.Label.TryOns",
	[FocusNavigationEventNameEnum.UpdateOutfit] = "Feature.Avatar.Action.Update",
	[FocusNavigationEventNameEnum.ToggleTryOnManager] = if FFlagAXMigrateLookDetailsPeekViewToFocusNavigation or FFlagAXMigrateCatalogPageInputBindings then "Feature.Catalog.Label.TryOns" else nil,
	[FocusNavigationEventNameEnum.SelectClothingTile] = "Feature.Avatar.Action.Select",
	[FocusNavigationEventNameEnum.MoveClothingTile] = "Feature.Avatar.Title.Move",
	[FocusNavigationEventNameEnum.RemoveClothingTile] = "Feature.Catalog.Action.Remove",
	[FocusNavigationEventNameEnum.CancelAndReset] = "Feature.Catalog.Action.Cancel",
	[FocusNavigationEventNameEnum.ViewProfile] = "Feature.Profile.Action.ViewProfile",
	[FocusNavigationEventNameEnum.CollapseAvatar] = if FFlagEnableSplitPane then "Feature.SplitPane.Label.CollapseAvatar" else nil,
	[FocusNavigationEventNameEnum.ExpandAvatar] = if FFlagEnableSplitPane then "Feature.SplitPane.Label.ExpandAvatar" else nil
}
local config8 = {
	[FocusNavigationEventNameEnum.HoldToPlay] = "Common.VisitGame.Label.Play",
	[FocusNavigationEventNameEnum.HoldToJoinFriend] = "Feature.Profile.Action.JoinGame"
}
local config9 = {
	[FocusNavigationEventNameEnum.HoldToPlay] = "CommonUI.Features.Label.ControllerBar.HoldPrefix"
}
local config10 = {
	[FocusNavigationEventNameEnum.HoldToAcceptTrustedFriendRequest] = true,
	[FocusNavigationEventNameEnum.HoldToAcceptFriendRequest] = true,
	[FocusNavigationEventNameEnum.HoldToAddFriend] = true,
	[FocusNavigationEventNameEnum.HoldToJoinEvent] = true,
	[FocusNavigationEventNameEnum.HoldToUnfollowEvent] = true,
	[FocusNavigationEventNameEnum.HoldToNotifyMe] = true,
	[FocusNavigationEventNameEnum.HoldToPlay] = true,
	[FocusNavigationEventNameEnum.HoldToJoinFriend] = true
}

local function getLegacyInputBindings(p1, p2, p3, p4) --[[ Line: 406 ]]
	-- upvalues: config (copy), config3 (copy), ShortcutBarPlatformGamepadIcons (copy)
	if p2.axes then
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
	else
		if not p2.key then
			return {}
		end
		local Entry = config3[p1]
		
		if ShortcutBarPlatformGamepadIcons and p4 then
			Entry = p4[p1] or Entry
		end
		return { { icon = Entry, text = p3:Format(p2.key) } }
	end
end

local function selectRoactGamepadBindings(p1) --[[ Line: 448 ]]
	return if p1.GamepadBottomBar then p1.GamepadBottomBar.boundInputs else nil
end

local function getPlatformGamepadImages() --[[ Line: 452 ]]
	-- upvalues: config3 (copy), UserInputService (copy)
	local ImageForKeyCodes = {}
	
	for KeyCode in config3 do
		local IsThumbstickMatch: boolean = KeyCode == Enum.KeyCode.Thumbstick1 or KeyCode == Enum.KeyCode.Thumbstick2
		local ImageForKeyCode = nil
		
		if not IsThumbstickMatch then
			ImageForKeyCode = UserInputService:GetImageForKeyCode(KeyCode)
			IsThumbstickMatch = ImageForKeyCode == ""
		end
		if not IsThumbstickMatch then
			ImageForKeyCodes[KeyCode] = ImageForKeyCode
		end
	end
	return ImageForKeyCodes
end

local function usePlatformGamepadImages() --[[ Line: 468 ]]
	-- upvalues: ReactModule (copy), getPlatformGamepadImages (copy), UseExternalEventFunction (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(getPlatformGamepadImages)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 471 ]]
		-- upvalues: UseStateResult2 (copy), getPlatformGamepadImages (upval)
		UseStateResult2((getPlatformGamepadImages()))
	end, {})
	UseExternalEventFunction(UserInputService.GamepadConnected, UseResult)
	UseExternalEventFunction(UserInputService.GamepadDisconnected, UseResult)
	
	return UseStateResult
end

local function getGamepadItems(UseActiveEventMapResult, p1, UseContextResult, p2, p3, p4) --[[ Line: 481 ]]
	-- upvalues: list (copy), config1 (copy), config2 (copy), getLegacyInputBindings (copy), config5 (copy), config6 (copy), ShortcutBarPlatformGamepadIcons (copy), config8 (copy), config7 (copy), config9 (copy), config10 (copy), FocusNavigationEventNameEnum (copy), config3 (copy)
	local List = {}
	
	for _, value in list do
		if config1[value] and (not p2 or not config2[value]) then
			if p2 then
				if not config2[value] then
					local v1 = p2[value]
					
					if v1 then
						for _, value1 in getLegacyInputBindings(value, v1, UseContextResult, p4) do
							table.insert(List, value1)
						end
					end
				else
					continue
				end
			end
			local UseActiveEventMapResultEntry = UseActiveEventMapResult[value]
			
			if UseActiveEventMapResultEntry then
				local Entry = config5[value]
				local Entry1 = if p3 then config6[value] else nil
				local Entry2 = if p3 and Entry then Entry[UseActiveEventMapResultEntry] else nil
				local Entry3 = if p3 and Entry1 then Entry1[UseActiveEventMapResultEntry] else nil
				local Entry3_1 = if p3 then Entry3 or Entry2 elseif Entry then Entry[UseActiveEventMapResultEntry] else nil
				
				if ShortcutBarPlatformGamepadIcons and p4 and Entry3_1 then
					Entry3_1 = p4[value] or Entry3_1
				end
				local Entry4 = if p3 then config8[UseActiveEventMapResultEntry] else nil
				local Entry41 = config7[UseActiveEventMapResultEntry]
				local Entry5 = if p3 then Entry4 or Entry41 else config7[UseActiveEventMapResultEntry]
				local FormatResult = if Entry5 then UseContextResult:Format(Entry5) else nil
				local Entry6 = config9[UseActiveEventMapResultEntry]
				local FormatResult1 = if Entry6 then UseContextResult:Format(Entry6) else nil
				local Progress = p1[UseActiveEventMapResultEntry]
				local Entry7 = config10[UseActiveEventMapResultEntry]
				
				if Entry3_1 and FormatResult then
					table.insert(List, {
						icon = Entry3_1,
						text = FormatResult,
						actionText = if p3 then nil else FormatResult1,
						progress = Progress,
						hasProgress = Entry7,
						inputKeyCode = if p3 then value else nil,
						eventName = if p3 then UseActiveEventMapResultEntry else nil
					})
				end
			end
		end
	end
	if p3 then
		local UseActiveEventMapResultEntry = UseActiveEventMapResult[Enum.KeyCode.ButtonB]
		
		if UseActiveEventMapResultEntry == FocusNavigationEventNameEnum.NavigateBack then
			local Entry = config3[Enum.KeyCode.ButtonB]
			
			if ShortcutBarPlatformGamepadIcons and p4 then
				Entry = p4[Enum.KeyCode.ButtonB] or Entry
			end
			table.insert(List, {
				icon = Entry,
				text = UseContextResult:Format(config7[UseActiveEventMapResultEntry]),
				inputKeyCode = Enum.KeyCode.ButtonB,
				eventName = UseActiveEventMapResultEntry
			})
		end
	end
	return List
end

local function getKeyboardItems(UseActiveEventMapResult, p5, UseContextResult, p6) --[[ Line: 572 ]]
	-- upvalues: config1 (copy), List (copy), config7 (copy), config9 (copy), config10 (copy)
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
			local Entry1 = config7[value1]
			local FormatResult = if Entry1 then UseContextResult:Format(Entry1) else nil
			local Entry2 = config9[value1]
			local FormatResult1 = if Entry2 then UseContextResult:Format(Entry2) else nil
			local Progress = p5[value1]
			local Entry3 = config10[value1]
			
			if FormatResult then
				table.insert(List1, {
					icon = Entry,
					text = FormatResult,
					actionText = if p6 then nil else FormatResult1,
					progress = Progress,
					hasProgress = Entry3,
					inputKeyCode = if p6 then Entry[1] else nil,
					eventName = if p6 then value1 else nil
				})
			end
		end
	end
	return List1
end

local function useShortcutBarFrameProps() --[[ Line: 617 ]]
	-- upvalues: UseDesignTokensFunction (copy), UseSignalStateFunction (copy), DisplayModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseSignalStateResult = UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding)
	
	return {
		Position = UDim2.new(0.5, 0, 1, if UseDesignTokensResult then -UseDesignTokensResult.Size.Size_200 + UseSignalStateResult.bottom else 0),
		AnchorPoint = Vector2.new(0.5, 1)
	}
end

local function useShortcutBarItems() --[[ Line: 633 ]]
	-- upvalues: ReactFocusNavigationModule (copy), ReactModule (copy), LocalizationRoactContext (copy), UseHeldProgressByEventFunction (copy), UseLastInputMethodFunction (copy), FFlagLuaAppResponsiveEnginePreferredInput (copy), ResponsiveModule (copy), NoShortcutBarWithTvRemote (copy), UseIsTvRemoteDeviceFunction (copy), ShortcutBarPlatformGamepadIcons (copy), usePlatformGamepadImages (copy), UseSelectorFunction (copy), selectRoactGamepadBindings (copy), UseAppPolicyFunction (copy), FFlagEnableStickyShortcutBarOnAllPlatforms (copy), getGamepadItems (copy), getKeyboardItems (copy)
	local UseActiveEventMapResult = ReactFocusNavigationModule.useActiveEventMap()
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	local UseHeldProgressByEventResult = UseHeldProgressByEventFunction()
	local UseLastInputMethodResult = UseLastInputMethodFunction()
	local UsePreferredInputResult = if FFlagLuaAppResponsiveEnginePreferredInput then ResponsiveModule.usePreferredInput() else nil
	local UseIsTvRemoteDeviceResult = if NoShortcutBarWithTvRemote then UseIsTvRemoteDeviceFunction() else nil
	local UsePlatformGamepadImagesResult = if ShortcutBarPlatformGamepadIcons then usePlatformGamepadImages() else nil
	local UseSelectorResult = UseSelectorFunction(selectRoactGamepadBindings)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p7) --[[ Line: 645 ]]
		return p7.getStickyShortcutBarEnabled()
	end) or FFlagEnableStickyShortcutBarOnAllPlatforms
	local IsUsePreferredInputResultMatch: boolean = if FFlagLuaAppResponsiveEnginePreferredInput then UsePreferredInputResult == ResponsiveModule.Input.Directional else UseLastInputMethodResult == "Gamepad"
	
	return if IsUsePreferredInputResultMatch then if UseIsTvRemoteDeviceResult then {} else getGamepadItems(UseActiveEventMapResult, UseHeldProgressByEventResult, UseContextResult, UseSelectorResult, UseAppPolicyResult, UsePlatformGamepadImagesResult) else getKeyboardItems(UseActiveEventMapResult, UseHeldProgressByEventResult, UseContextResult, UseAppPolicyResult)
end

function useAppShortcutBarProps() --[[ Line: 673 ]]
	-- upvalues: useShortcutBarFrameProps (copy), useShortcutBarItems (copy), CryoModule (copy)
	return CryoModule.Dictionary.union(useShortcutBarFrameProps(), { items = useShortcutBarItems() })
end

return useAppShortcutBarProps