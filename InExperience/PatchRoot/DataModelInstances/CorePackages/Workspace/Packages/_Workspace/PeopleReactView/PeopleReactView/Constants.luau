local parent = script:FindFirstAncestor("PeopleReactView").Parent
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename

return {
	PEOPLEPAGE = {
		PAGE_ID = "peoplepage",
		SOURCE = "PeoplePageInIGM",
		TAB_HEADER = {
			NAME = "PeopleTab",
			TEXT = "CoreScripts.InGameMenu.PageTitle.Players",
			ICON = "icons/menu/friends"
		},
		PEOPLE_LIST = { HEADER = "Feature.SettingsHub.PageTitle.InThisServer" },
		PEOPLE_CARDS = {
			MAX_CARD_COLUMNS = 5,
			MIN_CARD_COLUMNS = 2,
			MINIMUM_CARD_WIDTH = 136
		},
		PERSON_ROW = {
			PLATFORM_LOGO_IMAGE = "rbxasset://textures/ui/Shell/Icons/PlatformLogo@3x.png"
		},
		CORE_BUTTONS = {
			LOCALIZED_STRINGS = {
				INVITE_FRIENDS = "CoreScripts.InGameMenu.PageTitle.InviteFriends",
				MUTE_ALL = "Feature.SettingsHub.Action.MuteAll",
				UNMUTE_ALL = "Feature.SettingsHub.Action.UnmuteAll",
				SWITCH_SERVER = "CoreScripts.InGameMenu.PeoplePage.SwitchServer",
				MUTE_SELF = "CoreScripts.InGameMenu.QuickActions.MuteSelf",
				UNMUTE_SELF = "CoreScripts.InGameMenu.QuickActions.UnmuteSelf",
				INVITE_CONNECTIONS = if fFlagConnectionsToFriendsRename then nil else "CommonUI.Features.Label.InviteConnections"
			},
			ICON = {
				MICROPHONE = "microphone",
				MICROPHONE_MUTED = "microphone-slash",
				HEADPHONE_NEW = "headphones",
				HEADPHONE_MUTED_NEW = "headphones-slash",
				HEADPHONE_LEGACY = "icons/controls/headphone",
				HEADPHONE_MUTED_LEGACY = "icons/controls/headphoneDeafen",
				INVITE_FRIENDS_LEGACY = "icons/actions/friends/friendInvite",
				INVITE_FRIENDS_NEW = "person-arrow-from-bottom-right",
				SWITCH_SERVER = "two-location-pins-connecting-arrow"
			}
		},
		PERSON_BUTTONS = {
			LOCALIZED_STRINGS = {
				BLOCK = "Feature.SettingsHub.Action.Block",
				UNBLOCK = "Feature.SettingsHub.Action.Unblock",
				FRIEND = "CoreScripts.InGameMenu.GameSettings.Friend",
				ADD_FRIEND = "CoreScripts.InGameMenu.Actions.AddFriend",
				REQUEST_SENT = "CoreScripts.InGameMenu.GameSettings.RequestSent",
				MUTE = "Feature.SettingsHub.Label.Mute",
				UNMUTE = "Feature.SettingsHub.Label.Unmute",
				REPORT = "CoreScripts.InGameMenu.QuickActions.Report",
				CONNECTION = if fFlagConnectionsToFriendsRename then nil else "CommonUI.Features.Label.Connection",
				ADD_CONNECTION = if fFlagConnectionsToFriendsRename then nil else "CommonUI.Features.Label.AddConnection"
			},
			ICON = {
				ADD_FRIEND_NEW = "person-plus",
				ADD_FRIEND_LEGACY = "icons/actions/friends/friendAdd",
				BLOCK_NEW = "circle-slash",
				BLOCK_LEGACY = "icons/actions/block",
				FRIEND_LEGACY = "icons/menu/friends",
				FRIEND_NEW = "two-people",
				REPORT_PLAYER_LEGACY = "icons/actions/feedback",
				REPORT_PLAYER_NEW = "speech-bubble-exclamation",
				INSPECT_LEGACY = "icons/actions/zoomIn",
				INSPECT_NEW = "magnifying-glass-plus",
				REPORT_PLAYER_FLAG = require(parent.Foundation).Enums.IconName.Flag
			}
		},
		CARD_TOOLTIP = {
			LOCALIZED_STRINGS = {
				BUY_WHAT_THEYRE_WEARING = "Feature.SettingsHub.Prompt.BuyWhatTheyreWearing",
				SELECT_AVATAR_TO_CHECKOUT_ITEMS = "Feature.SettingsHub.Description.SelectAvatarToCheckoutItems",
				SELECT_USERNAME_TO_VIEW_PROFILE = "Feature.SettingsHub.Description.SelectUsernameToViewProfile",
				OK = "Feature.SettingsHub.Action.Ok"
			},
			UNIVERSES_EXPOSED_TO_CARD_TOOLTIP = if require(parent.PeopleService).getService("Flags").GetFFlagFixPeoplePageCardTooltip() then game:DefineFastString("UniversesExposedToPeopleCardsTooltipKey", "UniversesExposedToCardTooltipKey2") else "UniversesExposedToCardTooltipKey2"
		},
		SWITCH_SERVER_CONFIRMATION = {
			TITLE = "CoreScripts.InGameMenu.SwitchServer.ConfirmHeader",
			BODY = "CoreScripts.InGameMenu.SwitchServer.ConfirmBody",
			CONFIRM = "CoreScripts.InGameMenu.Actions.Continue",
			CANCEL = "CoreScripts.InGameMenu.Cancel"
		},
		BUTTON_ACTIVATED_TABLE_KEYS = { SWITCH_SERVER = "switchServer" }
	}
}