return {
	MAX_PARTICIPANT_COUNT = 5,
	MIN_PARTICIPANT_COUNT = 1,
	NAV_BAR_WITH_FACEPILE_SIZE = 56,
	Color = {
		GRAY3 = Color3.fromRGB(184, 184, 184),
		WHITE = Color3.fromRGB(255, 255, 255),
		BLUE_PRIMARY = Color3.fromRGB(0, 162, 255)
	},
	Font = { FONT_SIZE_14 = 17 },
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
	PerformanceMeasurement = {
		LUA_CHAT_SEND_MESSAGE = "LuaChatSendMessage",
		LUA_CHAT_RECEIVE_MESSAGE = "LuaChatReceiveMessage"
	},
	GameCard = {
		THUMBNAIL_WIDTH = 256,
		THUMBNAIL_HEIGHT = 144,
		FOOTER_HEIGHT = 64
	},
	AssetCard = { WIDTH = 256 },
	NavProps = { WIDE_MODE = "wideMode", TOP_BAR_HEIGHT = "topBarHeight" },
	OptInVariant = {
		OsaContextCard = "OsaContextCard",
		ChatOptInInfoCard = "ChatOptInInfoCard"
	},
	ModalAction = {
		Accept = "record_has_accepted",
		Decline = "record_dont_show_again"
	},
	ModalSequence = { ConversationListOverlay = "conversation_list_overlay" },
	GetPresenceIndicatorSizeKey = function(p1, p2)
		local _ = nil
		
		return if p2 == 6 then p1.PresenceIndicatorSize.Size6x6 elseif p2 == 8 then p1.PresenceIndicatorSize.Size8x8 elseif p2 == 10 then p1.PresenceIndicatorSize.Size10x10 elseif p2 == 12 then p1.PresenceIndicatorSize.Size12x12 elseif p2 == 14 then p1.PresenceIndicatorSize.Size14x14 else p1.PresenceIndicatorSize.DEFAULT
	end,
	GetIconButtonWidth = function(_, p1)
		return if p1 then 44 else 34
	end
}