local corePackagesService = game:GetService("CorePackages")
local tModule = require(corePackagesService.Packages.t)
local messageBus = require(corePackagesService.Workspace.Packages.MessageBus).MessageBus
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableGameLeftMessage = sharedFlagsModule.FFlagEnableGameLeftMessage
local fFlagRenameRespawnConfirmationPage = sharedFlagsModule.FFlagRenameRespawnConfirmationPage
local t = {
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
	InputType = t,
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
		[Enum.UserInputType.MouseButton1] = t.MouseAndKeyboard,
		[Enum.UserInputType.MouseButton2] = t.MouseAndKeyboard,
		[Enum.UserInputType.MouseButton3] = t.MouseAndKeyboard,
		[Enum.UserInputType.MouseWheel] = t.MouseAndKeyboard,
		[Enum.UserInputType.MouseMovement] = t.MouseAndKeyboard,
		[Enum.UserInputType.Keyboard] = t.MouseAndKeyboard,
		[Enum.UserInputType.Gamepad1] = t.Gamepad,
		[Enum.UserInputType.Gamepad2] = t.Gamepad,
		[Enum.UserInputType.Gamepad3] = t.Gamepad,
		[Enum.UserInputType.Gamepad4] = t.Gamepad,
		[Enum.UserInputType.Gamepad5] = t.Gamepad,
		[Enum.UserInputType.Gamepad6] = t.Gamepad,
		[Enum.UserInputType.Gamepad7] = t.Gamepad,
		[Enum.UserInputType.Gamepad8] = t.Gamepad,
		[Enum.UserInputType.Touch] = t.Touch
	},
	FramerateCaps = if game:DefineFastFlag("MoreFramerateOptions", false) then {
		60, 120, 144, 160, 165, 180, 200, 240
	} else { 60, 120, 144, 240 },
	OnAppRatingPromptEventDescriptor = if fFlagEnableGameLeftMessage then {
		mid = messageBus.getMessageId("AppRatingPrompt", "leftGame"),
		validateParams = tModule.strictInterface({ gameTime = tModule.number })
	} else nil,
	OnSurveyEventDescriptor = {
		mid = messageBus.getMessageId("Game", "openSurvey"),
		validateParams = tModule.strictInterface({
			eventType = tModule.string,
			userId = tModule.optional(tModule.string),
			customProps = tModule.optional(tModule.table)
		})
	},
	SurveyEventType = "leaveButtonClick",
	ChromeSeenCountKey = "ChromeSeenCount",
	RespawnLocalizedKey = "CoreScripts.InGameMenu.QuickActions.Respawn",
	LeaveGameLocalizedKey = "CoreScripts.InGameMenu.LeaveGame",
	ResumeLocalizedKey = "CoreScripts.InGameMenu.Prompt.ResumeGame",
	ResetCharacterLocalizedKey = if fFlagRenameRespawnConfirmationPage then nil else "CoreScripts.InGameMenu.Action.ResetCharacter",
	ConfirmLeaveGameLocalizedKey = "CoreScripts.InGameMenu.Prompt.ConfirmLeaveGame",
	ConfirmResetCharacterLocalizedKey = if fFlagRenameRespawnConfirmationPage then "CoreScripts.InGameMenu.Prompt.ConfirmRespawnCharacter" else "CoreScripts.InGameMenu.Prompt.ConfirmResetCharacter",
	DontLeaveGameLocalizedKey = "CoreScripts.InGameMenu.Action.DontLeaveGame",
	DontResetCharacterLocalizedKey = if fFlagRenameRespawnConfirmationPage then "CoreScripts.InGameMenu.Action.DontRespawnCharacter" else "CoreScripts.InGameMenu.Action.DontResetCharacter",
	ConnectionLocalizedKey = "CommonUI.Features.Label.Connection",
	FriendLocalizedKey = "Feature.Friends.Label.Friend",
	AddConnectionLocalizedKey = "CommonUI.Features.Label.AddConnection",
	AddFriendLocalizedKey = "Feature.Profile.Label.AddFriend",
	InviteConnectionsLocalizedKey = "CommonUI.Features.Label.InviteConnections",
	InviteFriendsLocalizedKey = "Feature.SettingsHub.Heading.InviteFriends",
	MovementModeDynamicThumbstickKey = "Feature.SettingsHub.Default.DynamicThumbstick"
}