local formFactor = require(script:FindFirstAncestor("AppChat").Parent.FormFactor).Enums.FormFactor
local t = {
	MAX_PARTICIPANT_COUNT = 5,
	MIN_PARTICIPANT_COUNT = 1,
	NAV_BAR_WITH_FACEPILE_SIZE = 56,
	NEW_NAV_BAR_SIZE = 56,
	RobuxIcon = "rbxasset://textures/ui/common/robux.png",
	SmallRobuxIcon = "rbxasset://textures/ui/common/robux_small.png",
	ColorRobuxIcon = "rbxasset://textures/ui/common/robux_color.png",
	Color = {
		ALPHA_SHADOW_PRIMARY = 0.5,
		ALPHA_PENDING_CHAT = 0.5,
		ALPHA_SECONDARY = 0.9,
		ALPHA_SHADOW_HOVER = 0.75,
		GRAY1 = Color3.fromRGB(25, 25, 25),
		GRAY2 = Color3.fromRGB(117, 117, 117),
		GRAY3 = Color3.fromRGB(184, 184, 184),
		GRAY4 = Color3.fromRGB(227, 227, 227),
		GRAY5 = Color3.fromRGB(242, 242, 242),
		GRAY6 = Color3.fromRGB(245, 245, 245),
		GRAY_PRIMARY = Color3.fromRGB(189, 190, 190),
		WHITE = Color3.fromRGB(255, 255, 255),
		BLACK = Color3.fromRGB(0, 0, 0),
		BLUE_PRIMARY = Color3.fromRGB(0, 162, 255),
		BLUE_HOVER = Color3.fromRGB(50, 181, 255),
		BLUE_PRESSED = Color3.fromRGB(0, 116, 190),
		BLUE_DISABLED = Color3.fromRGB(153, 218, 255),
		GREEN_PRIMARY = Color3.fromRGB(2, 183, 87),
		GREEN_HOVER = Color3.fromRGB(63, 198, 121),
		GREEN_PRESSED = Color3.fromRGB(17, 130, 55),
		GREEN_DISABLED = Color3.fromRGB(163, 226, 189),
		RED_PRIMARY = Color3.fromRGB(226, 35, 26),
		RED_NEGATIVE = Color3.fromRGB(216, 104, 104),
		RED_HOVER = Color3.fromRGB(226, 118, 118),
		RED_PRESSED = Color3.fromRGB(172, 30, 45),
		ORANGE_WARNING = Color3.fromRGB(246, 136, 2),
		ORANGE_FAVORITE = Color3.fromRGB(246, 183, 2),
		BROWN_TIX = Color3.fromRGB(204, 158, 113),
		CONVERSATION_BACKGROUND = Color3.fromRGB(224, 224, 224)
	},
	Font = {
		FONT_SIZE_12 = 15,
		FONT_SIZE_14 = 17,
		FONT_SIZE_16 = 20,
		FONT_SIZE_18 = 23,
		FONT_SIZE_20 = 23,
		FONT_SIZE_18_POS_OFFSET = -8,
		TITLE = Enum.Font.GothamMedium,
		STANDARD = Enum.Font.Gotham,
		BOLD = Enum.Font.GothamBold
	},
	Tween = {
		DEFAULT_TWEEN_TIME = 0.25,
		MESSAGE_TWEEN_TIME = 0.2,
		DEFAULT_TWEEN_STYLE = Enum.EasingStyle.Quad,
		DEFAULT_TWEEN_EASING_DIRECTION = Enum.EasingDirection.Out
	},
	Dialog = { TWEEN_TIME = 0.4 },
	PresenceType = {
		NONE = "NONE",
		ONLINE = "ONLINE",
		IN_GAME = "IN_GAME",
		IN_STUDIO = "IN_STUDIO"
	},
	PresenceIndicatorSize = {
		Size6x6 = "Size6x6",
		Size8x8 = "Size8x8",
		Size10x10 = "Size10x10",
		Size12x12 = "Size12x12",
		Size14x14 = "Size14x14",
		DEFAULT = "DEFAULT"
	},
	ServerState = {
		NONE = "NONE",
		CREATING = "CREATING",
		CREATED = "CREATED"
	},
	ConversationLoadingState = { NONE = "NONE", LOADING = "LOADING", DONE = "DONE" },
	PresenceIndicatorImagesBySize = {
		Size6x6 = {
			NONE = nil,
			ONLINE = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-online-6x6.png",
			IN_GAME = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-ingame-6x6.png",
			IN_STUDIO = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-instudio-6x6.png"
		},
		Size8x8 = {
			NONE = nil,
			ONLINE = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-online-8x8.png",
			IN_GAME = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-ingame-8x8.png",
			IN_STUDIO = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-instudio-8x8.png"
		},
		Size10x10 = {
			NONE = nil,
			ONLINE = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-online-10x10.png",
			IN_GAME = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-ingame-10x10.png",
			IN_STUDIO = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-instudio-10x10.png"
		},
		Size12x12 = {
			NONE = nil,
			ONLINE = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-online-12x12.png",
			IN_GAME = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-ingame-12x12.png",
			IN_STUDIO = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-instudio-12x12.png"
		},
		Size14x14 = {
			NONE = nil,
			ONLINE = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-online-14x14.png",
			IN_GAME = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-ingame-14x14.png",
			IN_STUDIO = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-instudio-14x14.png"
		},
		DEFAULT = {
			NONE = nil,
			ONLINE = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-online.png",
			IN_GAME = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-ingame.png",
			IN_STUDIO = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-instudio.png"
		}
	},
	Text = {
		POST_TYPING_STATUS_INTERVAL = 3,
		INPUT_PLACEHOLDER = Color3.fromRGB(189, 189, 189),
		INPUT = Color3.fromRGB(25, 25, 25)
	},
	PageSize = {
		GET_MESSAGES = 30,
		GET_NEW_MESSAGES = 4,
		GET_CONVERSATIONS = 30
	},
	ModalDialog = {
		CLEARANCE_CORNER_ROUNDING = 5,
		CLEARANCE_DIALOG_SIDE = 48,
		CLEARANCE_DIALOG_BOTTOM = 36,
		BUTTON_HEIGHT = 42
	},
	SharedGamesConfig = {
		SortNames = { "Popular", "MyRecent", "MyFavorite", "FriendActivity" },
		SortsAttribute = {
			Popular = {
				TILE_LOCALIZATION_KEY = "Feature.Chat.ShareGameToChat.Popular",
				ERROR_TIP_LOCALIZATION_KEY = "Feature.Chat.ShareGameToChat.NoPopularGames"
			},
			MyRecent = {
				TILE_LOCALIZATION_KEY = "Feature.Chat.ShareGameToChat.Recent",
				ERROR_TIP_LOCALIZATION_KEY = "Feature.Chat.ShareGameToChat.NoRecentGames"
			},
			MyFavorite = {
				TILE_LOCALIZATION_KEY = "Feature.Chat.ShareGameToChat.Favorites",
				ERROR_TIP_LOCALIZATION_KEY = "Feature.Chat.ShareGameToChat.NoFavoriteGames"
			},
			FriendActivity = {
				TILE_LOCALIZATION_KEY = "Feature.Chat.ShareGameToChat.FriendActivity",
				ERROR_TIP_LOCALIZATION_KEY = "Feature.Chat.ShareGameToChat.NoFriendActivity"
			}
		},
		Thumbnail = { SHOWN_SIZE = 60, FETCHED_SIZE = 150 }
	},
	GameShareView = {
		WIDE_HORIZONTAL_DIVIDER_HEIGHT = 15,
		WIDE_VIEW_WIDTH = 540
	},
	PerformanceMeasurement = {
		LUA_CHAT_SEND_MESSAGE = "LuaChatSendMessage",
		LUA_CHAT_RECEIVE_MESSAGE = "LuaChatReceiveMessage"
	},
	ToastIDs = {
		TOO_MANY_PEOPLE = "TOO_MANY_PEOPLE",
		GROUP_NAME_MODERATED = "GROUP_NAME_MODERATED",
		MESSAGE_WAS_MODERATED = "MESSAGE_WAS_MODERATED",
		REMOVED_FROM_CONVERSATION = "REMOVED_FROM_CONVERSATION",
		PIN_GAME_FAILED = "PIN_GAME_FAILED",
		PIN_PINNED_GAME = "PIN_PINNED_GAME",
		UNPIN_GAME_FAILED = "UNPIN_GAME_FAILED",
		GAME_NOT_SHAREABLE = "GAME_NOT_SHAREABLE",
		NETWORK_ERROR = "NETWORK_ERROR"
	},
	FormFactor = {
		COMPACT = { ASSET_CARD_HORIZONTAL_MARGIN = 108 },
		WIDE = { ASSET_CARD_HORIZONTAL_MARGIN = 224 }
	},
	GameCard = {
		THUMBNAIL_WIDTH = 256,
		THUMBNAIL_HEIGHT = 144,
		FOOTER_HEIGHT = 64
	},
	Decorators = { ICEBREAKER = { "icebreaker" } },
	NavProps = {
		WIDE_MODE = "wideMode",
		TOP_BAR_HEIGHT = "topBarHeight",
		SET_SCREEN_TOP_BAR = "setScreenTopBar"
	},
	OptInVariant = {
		OsaContextCard = "OsaContextCard",
		ChatOptInInfoCard = "ChatOptInInfoCard"
	},
	ModalAction = {
		Accept = "record_has_accepted",
		Decline = "record_dont_show_again"
	},
	ModalSequence = { ConversationListOverlay = "conversation_list_overlay" }
}

function t.GetFormFactorSpecific(_, p0) --[[ line: 246 ]]
	-- upvalues: formFactor (ref), t (ref)
	return if p0 == formFactor.WIDE then t.FormFactor.WIDE else t.FormFactor.COMPACT
end

function t.GetPresenceIndicatorSizeKey(p1, p2) --[[ line: 254 ]]
	local _ = nil
	
	return if p2 == 6 then p1.PresenceIndicatorSize.Size6x6 elseif p2 == 8 then p1.PresenceIndicatorSize.Size8x8 elseif p2 == 10 then p1.PresenceIndicatorSize.Size10x10 elseif p2 == 12 then p1.PresenceIndicatorSize.Size12x12 elseif p2 == 14 then p1.PresenceIndicatorSize.Size14x14 else p1.PresenceIndicatorSize.DEFAULT
end

function t.GetIconButtonWidth(_, p3) --[[ line: 272 ]]
	return if p3 then 44 else 34
end

return t