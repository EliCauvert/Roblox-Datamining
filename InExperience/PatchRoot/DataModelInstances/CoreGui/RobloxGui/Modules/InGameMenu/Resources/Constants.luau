local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local MessageBus = require(CorePackages.Workspace.Packages.MessageBus).MessageBus
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableGameLeftMessage = SharedFlagsModule.FFlagEnableGameLeftMessage
local FFlagRenameRespawnConfirmationPage = SharedFlagsModule.FFlagRenameRespawnConfirmationPage
local InputType = {
	MouseAndKeyboard = "MouseAndKeyboard",
	Touch = "Touch",
	Gamepad = "Gamepad"
}

return {
	InviteStatus = {
		Success = "Success",
		Moderated = "Moderated",
		Failed = "Failed",
		Pending = "Pending"
	},
	InputType = InputType,
	FallbackLocaleId = "UNKNOWN_FALLBACK",
	defaultPageKey = "InitalPage",
	advancedSettingsPageKey = "AdvancedGameSettings",
	vrComfortSettingsPageKey = "VRGameSettings",
	LeaveToAppPromptPageKey = "LeaveToAppPrompt",
	LeaveGamePromptPageKey = "LeaveGamePrompt",
	MainPagePageKey = "MainPage",
	InitalPageKey = "InitalPage",
	ReportDialogKey = "ReportDialog",
	PeoplePageKey = "peoplepage",
	PeoplePageScrollBuffer = 5,
	AnalyticsTargetName = "client",
	AnalyticsInGameMenuName = "ingame_menu",
	AnalyticsRespawnCharacterName = "respawn_character",
	AnalyticsSettingsChangeName = "change_ingame_settings",
	AnalyticsExplicitSettingsChangeName = "change_explicit_ingame_settings",
	AnalyticsSettingsSafetyBubbleModeChangeName = "change_ingame_settings_safety_bubble_mode",
	AnalyticsSettingsVRComfortSettingChangeName = "change_ingame_settings_vr_comfort_setting",
	AnalyticsFullscreenModeName = "FullscreenMode",
	AnalyticsMenuActionName = "ingame_menu_action",
	AnalyticsMenuOpenName = "menu_open",
	AnalyticsMenuOpenTypes = {
		Keyboard = "KeyboardShortcut",
		TopbarButton = "TopbarButton",
		ReportAbuseTriggered = "ReportAbuse",
		PlayersTriggered = "Players",
		SettingsTriggered = "Settings",
		EducationalMenuTriggered = "EducationalMenu",
		GamepadLeaveGame = "GamepadLeaveGame",
		GamepadResetCharacter = "GamepadResetCharacter",
		ScreenshotUnhide = "ScreenshotUnhide"
	},
	AnalyticsMenuCloseName = "menu_close",
	AnalyticsMenuLeaveName = "menu_leave",
	AnalyticsLeaveGameName = "leave_game",
	AnalyticsLeaveToHomeName = "leave_to_home",
	AnalyticsLeaveToHomeSource = "home",
	AnalyticsLeaveGameSource = "leave",
	AnalyticsMenuButtonSource = "menu_button",
	AnalyticsMenuHotkeySource = "gamepad_or_hotkey",
	AnalyticsMenuResetCharacterName = "menu_reset_character",
	AnalyticsResumeGameName = "resume",
	AnalyticsResumeShieldSource = "shield",
	AnalyticsResumeButtonSource = "button",
	AnalyticsResumeGamepadSource = "gamepad",
	AnalyticsResumeXButtonSource = "x_button",
	AnalyticsConfirmedName = "confirmed",
	AnalyticsCancelledName = "cancelled",
	AnalyticsReportLeft = "ingame_menu_report_left",
	AnalyticsReportSubmittedName = "ingame_menu_report_submitted",
	AnalyticsRequestFriendName = "RequestFriendship",
	AnalyticsRequestFriendContext = "PlayersMenu",
	AnalyticsExamineAvatarName = "examine_avatar",
	PlayerScriptStatusStrings = {
		Default = "PlayerScript Status: Default",
		Custom = "PlayerScript Status: Custom",
		PossiblyCustom = "PlayerScript Status: Possibly Custom",
		CustomOld = "PlayerScript Status: Custom Old"
	},
	ControllerBarHeight = 72,
	DisplayOrder = {
		RootMenu = 1,
		BlurredModalPortal = 2,
		FullscreenTitleBar = 7,
		ConfirmationDialog = 8,
		EducationalPopup = 9,
		HeadsetDisconnectedDialog = 100,
		ControllerBar = 9
	},
	ShieldOpenAnimationTweenTime = 0.5,
	ShieldCloseAnimationTweenTime = 0.4,
	ShieldOpenFadeTime2 = 0.25,
	ShieldCloseFadeTime2 = 0.15,
	ShieldExtraFadeTime = 0.05,
	Zone = { PortalSize = 1, ContentOffset = 2 },
	InputTypeMap = {
		[Enum.UserInputType.MouseButton1] = InputType.MouseAndKeyboard,
		[Enum.UserInputType.MouseButton2] = InputType.MouseAndKeyboard,
		[Enum.UserInputType.MouseButton3] = InputType.MouseAndKeyboard,
		[Enum.UserInputType.MouseWheel] = InputType.MouseAndKeyboard,
		[Enum.UserInputType.MouseMovement] = InputType.MouseAndKeyboard,
		[Enum.UserInputType.Keyboard] = InputType.MouseAndKeyboard,
		[Enum.UserInputType.Gamepad1] = InputType.Gamepad,
		[Enum.UserInputType.Gamepad2] = InputType.Gamepad,
		[Enum.UserInputType.Gamepad3] = InputType.Gamepad,
		[Enum.UserInputType.Gamepad4] = InputType.Gamepad,
		[Enum.UserInputType.Gamepad5] = InputType.Gamepad,
		[Enum.UserInputType.Gamepad6] = InputType.Gamepad,
		[Enum.UserInputType.Gamepad7] = InputType.Gamepad,
		[Enum.UserInputType.Gamepad8] = InputType.Gamepad,
		[Enum.UserInputType.Touch] = InputType.Touch
	},
	FramerateCaps = if game:DefineFastFlag("MoreFramerateOptions", false) then {
		60, 120, 144, 160, 165, 180, 200, 240
	} else { 60, 120, 144, 240 },
	FramerateCapsIOS = { 60, 120 },
	OnAppRatingPromptEventDescriptor = if FFlagEnableGameLeftMessage then {
		mid = MessageBus.getMessageId("AppRatingPrompt", "leftGame"),
		validateParams = TModule.strictInterface({ gameTime = TModule.number })
	} else nil,
	OnSurveyEventDescriptor = {
		mid = MessageBus.getMessageId("Game", "openSurvey"),
		validateParams = TModule.strictInterface({
			eventType = TModule.string,
			userId = TModule.optional(TModule.string),
			customProps = TModule.optional(TModule.table)
		})
	},
	SurveyEventType = "leaveButtonClick",
	ChromeSeenCountKey = "ChromeSeenCount",
	RespawnLocalizedKey = "CoreScripts.InGameMenu.QuickActions.Respawn",
	LeaveGameLocalizedKey = "CoreScripts.InGameMenu.LeaveGame",
	ResumeLocalizedKey = "CoreScripts.InGameMenu.Prompt.ResumeGame",
	ResetCharacterLocalizedKey = if FFlagRenameRespawnConfirmationPage then nil else "CoreScripts.InGameMenu.Action.ResetCharacter",
	ConfirmLeaveGameLocalizedKey = "CoreScripts.InGameMenu.Prompt.ConfirmLeaveGame",
	ConfirmResetCharacterLocalizedKey = if FFlagRenameRespawnConfirmationPage then "CoreScripts.InGameMenu.Prompt.ConfirmRespawnCharacter" else "CoreScripts.InGameMenu.Prompt.ConfirmResetCharacter",
	DontLeaveGameLocalizedKey = "CoreScripts.InGameMenu.Action.DontLeaveGame",
	DontResetCharacterLocalizedKey = if FFlagRenameRespawnConfirmationPage then "CoreScripts.InGameMenu.Action.DontRespawnCharacter" else "CoreScripts.InGameMenu.Action.DontResetCharacter",
	ConnectionLocalizedKey = "CommonUI.Features.Label.Connection",
	FriendLocalizedKey = "Feature.Friends.Label.Friend",
	AddConnectionLocalizedKey = "CommonUI.Features.Label.AddConnection",
	AddFriendLocalizedKey = "Feature.Profile.Label.AddFriend",
	InviteConnectionsLocalizedKey = "CommonUI.Features.Label.InviteConnections",
	InviteFriendsLocalizedKey = "Feature.SettingsHub.Heading.InviteFriends",
	MovementModeDynamicThumbstickKey = "Feature.SettingsHub.Default.DynamicThumbstick"
}