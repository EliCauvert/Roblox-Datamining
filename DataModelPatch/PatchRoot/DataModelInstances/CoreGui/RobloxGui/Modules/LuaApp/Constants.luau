local CorePackages = game:GetService("CorePackages")
local FFlagShrinkAppNavBar = require(CorePackages.Workspace.Packages.SharedFlags).FFlagShrinkAppNavBar
local Constants = require(CorePackages.Workspace.Packages.AppSystemBar).Constants
local ConstantsModule = {
	Color = {
		ALPHA_SHADOW_PRIMARY = 0.3,
		ALPHA_SHADOW_HOVER = 0.75,
		GRAY1 = Color3.fromRGB(25, 25, 25),
		GRAY2 = Color3.fromRGB(117, 117, 117),
		GRAY3 = Color3.fromRGB(184, 184, 184),
		GRAY4 = Color3.fromRGB(227, 227, 227),
		GRAY5 = Color3.fromRGB(242, 242, 242),
		GRAY6 = Color3.fromRGB(245, 245, 245),
		GRAY_SEPARATOR = Color3.fromRGB(172, 170, 161),
		GRAY_AVATAR_BACKGROUND = Color3.fromRGB(209, 209, 209),
		BLACK = Color3.fromRGB(0, 0, 0),
		WHITE = Color3.fromRGB(255, 255, 255),
		BLUE_PRIMARY = Color3.fromRGB(0, 162, 255),
		BLUE_HOVER = Color3.fromRGB(50, 181, 255),
		BLUE_PRESSED = Color3.fromRGB(0, 116, 189),
		BLUE_DISABLED = Color3.fromRGB(153, 218, 255),
		GREEN_PRIMARY = Color3.fromRGB(2, 183, 87),
		GREEN_HOVER = Color3.fromRGB(63, 198, 121),
		GREEN_PRESSED = Color3.fromRGB(17, 130, 55),
		GREEN_DISABLED = Color3.fromRGB(163, 226, 189),
		RED_PRIMARY = Color3.fromRGB(226, 35, 26),
		RED_NEGATIVE = Color3.fromRGB(216, 104, 104),
		RED_HOVER = Color3.fromRGB(226, 118, 118),
		RED_PRESSED = Color3.fromRGB(172, 30, 45),
		BROWN_WARNING = Color3.fromRGB(162, 89, 1),
		ORANGE = Color3.fromRGB(246, 136, 2),
		ORANGE_FAVORITE = Color3.fromRGB(246, 183, 2)
	},
	DisplayOrder = {
		BottomBar = 10,
		SystemBar = 2,
		TopBanner = 2,
		ContextualListMenu = 11,
		CentralOverlay = 12,
		Toast = 13,
		GamepadBottomBar = 14,
		DrawerPanel = 15,
		FlyoutSidePanel = 1,
		GameInviteModal = 10,
		AntiAddictionPrompt = 100,
		UpdateRequiredPrompt = 101,
		FullscreenTitleBar = 150,
		ProgressLoadingAssets = 20
	},
	DEFAULT_GAME_ICON = "rbxasset://textures/ui/LuaApp/icons/ic-game.png",
	UNIFIED_HOME_GAMES_FETCH_COUNT = 72,
	DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH = 320,
	DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT = 64,
	TOP_BAR_SIZE = Constants.TOP_BAR_SIZE,
	BOTTOM_BAR_SIZE = if require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableNavBarLabels() then Constants.BOTTOM_BAR_SIZE else 48,
	BOTTOM_BAR_PADDING_BOTTOM = if FFlagShrinkAppNavBar then 8 else nil,
	GAMEPAD_BOTTOM_BAR_SIZE = Constants.GAMEPAD_BOTTOM_BAR_SIZE,
	SECTION_HEADER_HEIGHT = 26,
	USER_CAROUSEL_PADDING = 15,
	USER_CAROUSEL_SIDE_COMPACT_PADDING = 24,
	USER_CAROUSEL_SIDE_WIDE_PADDING = 48,
	PLAYER_GRID_TILE_FOOTER_HEIGHT = 70,
	MORE_PAGE_ROW_HEIGHT = 50,
	MORE_PAGE_SECTION_PADDING = 20,
	MORE_PAGE_ROW_PADDING_LEFT = 20,
	MORE_PAGE_ROW_PADDING_RIGHT = 10,
	MORE_PAGE_TEXT_PADDING_WITH_ICON = 56,
	MORE_PAGE_COMPACT_PADDING_VERTICAL = 24,
	MORE_PAGE_WIDE_PADDING_VERTICAL = 40,
	MORE_PAGE_COMPACT_PADDING_HORIZONTAL = 24,
	MORE_PAGE_WIDE_PADDING_HORIZONTAL = 60,
	MORE_PAGE_CONTENT_MAX_WIDTH = 1024,
	PLAYER_SEARCH_MIN_KEYWORD_UTF8_LEN = 3,
	ROUNDED_CORNER_RADIUS = 15,
	NAV_BAR_SIZE = 56,
	PeopleList = { ADD_FRIENDS_FRAME_WIDTH = 80 },
	PlacesList = {
		ContextualMenu = {
			EntryHeight = 67,
			HorizontalOuterPadding = 15,
			HorizontalInnerPadding = 12,
			AvatarSize = 44
		}
	},
	PresenceSignal = { EventType = "PresenceChanged" },
	JoinYourFriendsTile = {
		NarrowColumnCount = 2,
		WideColumnCount = 5,
		Width = 0,
		Height = 0
	},
	AVATAR_PLACEHOLDER_IMAGE = "rbxasset://textures/ui/LuaApp/graphic/ph-avatar-portrait.png",
	INDONESIAN_CONTENT_MATURITY_URL = "https://en.help.roblox.com/hc/id/articles/8862768451604-Label-Kedewasaan-Konten",
	AssetTypeIdStringToHumanoidDescriptionProp = {
		[tostring(Enum.AssetType.TShirt.Value)] = "GraphicTShirt",
		[tostring(Enum.AssetType.Hat.Value)] = "HatAccessory",
		[tostring(Enum.AssetType.Shirt.Value)] = "Shirt",
		[tostring(Enum.AssetType.Pants.Value)] = "Pants",
		[tostring(Enum.AssetType.Head.Value)] = "Head",
		[tostring(Enum.AssetType.Face.Value)] = "Face",
		[tostring(Enum.AssetType.Torso.Value)] = "Torso",
		[tostring(Enum.AssetType.RightArm.Value)] = "RightArm",
		[tostring(Enum.AssetType.LeftArm.Value)] = "LeftArm",
		[tostring(Enum.AssetType.LeftLeg.Value)] = "LeftLeg",
		[tostring(Enum.AssetType.RightLeg.Value)] = "RightLeg",
		[tostring(Enum.AssetType.HairAccessory.Value)] = "HairAccessory",
		[tostring(Enum.AssetType.FaceAccessory.Value)] = "FaceAccessory",
		[tostring(Enum.AssetType.NeckAccessory.Value)] = "NeckAccessory",
		[tostring(Enum.AssetType.ShoulderAccessory.Value)] = "ShouldersAccessory",
		[tostring(Enum.AssetType.FrontAccessory.Value)] = "FrontAccessory",
		[tostring(Enum.AssetType.BackAccessory.Value)] = "BackAccessory",
		[tostring(Enum.AssetType.WaistAccessory.Value)] = "WaistAccessory",
		[tostring(Enum.AssetType.ClimbAnimation.Value)] = "ClimbAnimation",
		[tostring(Enum.AssetType.FallAnimation.Value)] = "FallAnimation",
		[tostring(Enum.AssetType.IdleAnimation.Value)] = "IdleAnimation",
		[tostring(Enum.AssetType.JumpAnimation.Value)] = "JumpAnimation",
		[tostring(Enum.AssetType.RunAnimation.Value)] = "RunAnimation",
		[tostring(Enum.AssetType.SwimAnimation.Value)] = "SwimAnimation",
		[tostring(Enum.AssetType.WalkAnimation.Value)] = "WalkAnimation",
		[tostring(Enum.AssetType.DynamicHead.Value)] = "Head"
	},
	AnalyticsKeyword = {
		VIEW_GAME_DETAILS_FROM_ICON = "gameIcon",
		VIEW_GAME_DETAILS_FROM_TITLE = "gameTitle",
		VIEW_GAME_DETAILS_FROM_BUTTON = "viewDetailButton"
	},
	AnalyticsContext = require(CorePackages.Workspace.Packages.DiscoveryAnalytics).Constants.Context,
	Currency = { Robux = 1 },
	HomePagePanelProps = {
		WidgetTextSize = 24,
		WidgetIconSize = 26,
		WidgetIconTextGutter = 9,
		WidgetContentText = { Size = 16 }
	},
	HomePageLogoSize = Vector2.new(60, 60),
	InputType = {
		MouseAndKeyboard = "MouseAndKeyboard",
		Touch = "Touch",
		Gamepad = "Gamepad",
		None = "None"
	},
	RobuxIcon = "LuaApp/icons/common/robux",
	SmallRobuxIcon = "LuaApp/icons/common/robux_small",
	ColorRobuxIcon = "LuaApp/icons/common/robux_color",
	Themes = { Dark = "dark", Light = "light", Classic = "classic" },
	TempRnSwitchNavigatorName = require(CorePackages.Workspace.Packages.NavigationRodux).Constants.TempRnSwitchNavigatorName,
	ImpressionsEvents = {
		AvatarItems = "avatarItemImpressions",
		AvatarItemsCatalog = "avatarItemImpressionsCatalog",
		AvatarItemsCatalogSearch = "avatarItemImpressionsCatalogSearch",
		AvatarItemsEditor = "avatarItemImpressionsEditor",
		JoinYourFriends = "joinYourFriendImpressions"
	},
	WEBVIEWS_UNAVAILABLE_TOAST = {
		toastMessage = "CommonUI.Messages.Label.ActionNotAvailableOnVRHeadsetDevice",
		isLocalized = false,
		toastType = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.ToastType).InformationMessage
	}
}
ConstantsModule.InputTypeMap = {
	[Enum.UserInputType.MouseButton1] = ConstantsModule.InputType.MouseAndKeyboard,
	[Enum.UserInputType.MouseButton2] = ConstantsModule.InputType.MouseAndKeyboard,
	[Enum.UserInputType.MouseButton3] = ConstantsModule.InputType.MouseAndKeyboard,
	[Enum.UserInputType.MouseWheel] = ConstantsModule.InputType.MouseAndKeyboard,
	[Enum.UserInputType.MouseMovement] = ConstantsModule.InputType.MouseAndKeyboard,
	[Enum.UserInputType.Keyboard] = ConstantsModule.InputType.MouseAndKeyboard,
	[Enum.UserInputType.TextInput] = ConstantsModule.InputType.MouseAndKeyboard,
	[Enum.UserInputType.Gamepad1] = ConstantsModule.InputType.Gamepad,
	[Enum.UserInputType.Gamepad2] = ConstantsModule.InputType.Gamepad,
	[Enum.UserInputType.Gamepad3] = ConstantsModule.InputType.Gamepad,
	[Enum.UserInputType.Gamepad4] = ConstantsModule.InputType.Gamepad,
	[Enum.UserInputType.Gamepad5] = ConstantsModule.InputType.Gamepad,
	[Enum.UserInputType.Gamepad6] = ConstantsModule.InputType.Gamepad,
	[Enum.UserInputType.Gamepad7] = ConstantsModule.InputType.Gamepad,
	[Enum.UserInputType.Gamepad8] = ConstantsModule.InputType.Gamepad,
	[Enum.UserInputType.Touch] = ConstantsModule.InputType.Touch,
	[Enum.UserInputType.None] = ConstantsModule.InputType.None
}
ConstantsModule.ReportDialogEntryPoints = {
	Profile = "Profile",
	Chat = "Chat",
	ExperienceDetails = "ExperienceDetails"
}
ConstantsModule.ReportScreen = {
	Contexts = {
		Experience = "experience",
		Profile = "profile",
		Item = "item"
	},
	AbuseVectors = { Place = "place", User = "user" },
	Platforms = { Console = "console", VR = "vr" }
}
ConstantsModule.Auth = {
	DefaultUnauthenticatedAppTheme = "dark",
	DefaultUnauthenticatedRobuxBalance = "0",
	DefaultUnauthenticatedRobuxBalanceLocalized = "--",
	DefaultUnauthenticatedRobloxLocaleId = "",
	DefaultUnauthenticatedCsatCompletedSurveyIds = "{}",
	AccountSwitcherSwitchedStatus = "switched",
	AccountSwitcherLoginEmptyBlobRequiredError = "loginEmptyBlobRequiredError",
	AccountSwitcherParentLoginEmptyBlobRequiredError = "parentLoginEmptyBlobRequiredError",
	AccountSwitcherSignupEmptyBlobRequiredError = "signupEmptyBlobRequiredError",
	AccountSwitcherParentSignupEmptyBlobRequiredError = "parentSignupEmptyBlobRequiredError",
	AccountSwitcherSwitchError = "switchError",
	AccountSwitcherUnavailableError = "unavailableError"
}

return ConstantsModule