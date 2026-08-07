local _ = require(script:FindFirstAncestor("AbuseReportMenu").Components.Types)
local t = {
	AbuseReportMenuRootName = "AbuseReportMenuNewRoot",
	AbuseReportMenuPlaceholderFrame = "AbuseReportMenuPlaceholderFrame",
	ModalBaseSelectorDialogRootName = "ModalBaseSelectorDialog",
	ReportModes = { Classic = "Classic", SelectInScene = "SelectInScene" },
	ReportTypes = { Person = "Person", Experience = "Experience" },
	PlayerAbuseTypes = {
		Swearing = "Swearing",
		Username = "Inappropriate Username",
		Bullying = "Bullying",
		Scamming = "Scamming",
		Dating = "Dating",
		Cheating = "Cheating/Exploiting",
		Personal = "Personal Question",
		Links = "Offsite Links"
	},
	PlayerVoiceAbuseTypes = {
		Swearing = "Swearing",
		Username = "Inappropriate Username",
		Bullying = "Bullying",
		Scamming = "Scamming",
		Dating = "Dating",
		Cheating = "Cheating/Exploiting",
		Personal = "Personal Question"
	},
	InappropriateContentAbuseReason = "Inappropriate Content",
	AbuseMethods = {
		TextChat = "Text Chat",
		VoiceChat = "Voice Chat",
		Other = "Other",
		Avatar = "Avatar"
	}
}
t.AbuseMethodToVectorMapping = {
	[t.AbuseMethods.TextChat] = "chat",
	[t.AbuseMethods.VoiceChat] = "voice",
	[t.AbuseMethods.Other] = "other",
	[t.AbuseMethods.Avatar] = "avatar"
}
t.AnalyticsAbuseMethods = {
	Chat = "Chat",
	Voice = "Voice",
	Other = "Other",
	Game = "Game"
}
t.AbuseMethodToAnalyticsMapping = {
	[t.AbuseMethods.TextChat] = t.AnalyticsAbuseMethods.Chat,
	[t.AbuseMethods.VoiceChat] = t.AnalyticsAbuseMethods.Voice,
	[t.AbuseMethods.Other] = t.AnalyticsAbuseMethods.Other,
	[t.AbuseMethods.Avatar] = t.AnalyticsAbuseMethods.Other
}
t.AbuseMethodSublabel = {
	TextChat = "This person typed a mean word in text chat",
	VoiceChat = "This person was screaming on top of their lungs",
	Other = "This person is following me, wearing a bad shirt, etc.",
	Avatar = "This person's avatar is wearing offensive clothing"
}
t.PlayerMenuActions = {
	UpdateAbuseReason = "UpdateAbuseReason",
	UpdateComment = "UpdateComment",
	UpdateMethodOfAbuse = "UpdateMethodOfAbuse",
	UpdateAbuser = "UpdateAbuser",
	UpdatedSelectedChatAndOrderedMessages = "UpdatedSelectedChatAndOrderedMessages",
	UpdatePlayerNameMap = "UpdatePlayerNameMap",
	SetVoiceEnabled = "SetVoiceEnabled",
	ClearState = "ClearState",
	SetShowModalSelector = "SetShowModalSelector",
	SetMenuOpenTimestamp = "SetMenuOpenTimestamp",
	SetPreselectedPlayer = "SetPreselectedPlayer"
}
t.ReportAnythingActions = {
	ClearAll = "ClearAll",
	ClearAnnotationFlowProperties = "ClearAnnotationFlowProperties",
	SetScreenshotId = "SetScreenshotId",
	SetScreenshotContentId = "SetScreenshotContentId",
	SetAnnotationPoints = "SetAnnotationPoints",
	SetIdentificationResults = "SetIdentificationResults",
	CompleteAttachment = "CompleteAttachment",
	SetAnnotationAreaDimensions = "SetAnnotationAreaDimensions",
	SetAnnotationCircleRadius = "SetAnnotationCircleRadius",
	SetAnnotationOptionSeen = "SetAnnotationOptionSeen"
}
t.AnalyticsActions = {
	Reset = "Reset",
	SetMenuOpenedTimestamp = "SetMenuOpenedTimestamp",
	IncrementExperiencePersonChanged = "IncrementExperiencePersonChanged",
	IncrementTypeofabuseChanged = "IncrementTypeofabuseChanged",
	IncrementPersonChanged = "IncrementPersonChanged",
	IncrementReasonChanged = "IncrementReasonChanged",
	IncrementCaptureScene = "IncrementCaptureScene",
	IncrementChatLineChanged = "IncrementChatLineChanged",
	SetMemoryRequirementMet = "SetMemoryRequirementMet",
	SetViewportInformation = "SetViewportInformation",
	SetSubmissionCompleted = "SetSubmissionCompleted",
	SetTypeOfAbuseSelection = "SetTypeOfAbuseSelection",
	SetPreselectedAbuseSelection = "SetPreselectedAbuseSelection",
	SetReasonSelection = "SetReasonSelection",
	SetCommentAdded = "SetCommentAdded",
	SwitchToExperienceInitialSelections = "SwitchToExperienceInitialSelections",
	SwitchToPersonInitialSelections = "SwitchToPersonInitialSelections"
}
t.ReportSuccessToast = {
	ReportAnythingGeneric = "We\226\128\153ve received your report and will take action soon if needed. Your feedback helps keep our community safe.",
	ChatGeneric = "Thanks for your report! Our moderators will review the chat logs and evaluate what happened.",
	Cheating = "Thanks for your report! We've recorded your report for evaluation.",
	BadUserName = "Thanks for your report! Our moderators will evaluate the username.",
	Place = "Thanks for your report! Our moderators will review the place and make a determination."
}
t.localizationKeys = {
	ReportType = "Feature.ReportAbuse.Label.ReportType",
	Person = "Feature.ReportAbuse.Label.Person",
	Experience = "Feature.ReportAbuse.Label.Experience",
	SelectInScene = "Feature.ReportAbuse.Action.SelectInScene",
	BuildAReport = "Feature.ReportAbuse.Action.BuildAReport",
	[t.AbuseMethods.TextChat] = "Feature.ReportAbuse.Label.TextChat",
	[t.AbuseMethods.VoiceChat] = "Feature.SettingsHub.MethodOfAbuse.VoiceChat.Title",
	[t.AbuseMethods.Other] = "Feature.SettingsHub.MethodOfAbuse.Other.Title",
	[t.AbuseMethods.Avatar] = "Feature.ReportAbuse.Label.Avatar",
	[t.InappropriateContentAbuseReason] = "Feature.ReportAbuse.Label.Content",
	[t.PlayerAbuseTypes.Swearing] = "Feature.ReportAbuse.Problem.Swearing",
	[t.PlayerAbuseTypes.Username] = "Feature.ReportAbuse.ProblemSurface.Username",
	[t.PlayerAbuseTypes.Bullying] = "Feature.ReportAbuse.Problem.Bullying",
	[t.PlayerAbuseTypes.Scamming] = "Feature.ReportAbuse.Problem.Scamming",
	[t.PlayerAbuseTypes.Dating] = "Feature.ReportAbuse.Problem.Dating",
	[t.PlayerAbuseTypes.Cheating] = "Feature.ReportAbuse.Problem.Cheating",
	[t.PlayerAbuseTypes.Personal] = "Feature.ReportAbuse.Problem.Personal",
	[t.PlayerAbuseTypes.Links] = "Feature.ReportAbuse.Problem.Links",
	[t.PlayerVoiceAbuseTypes.Swearing] = "Feature.ReportAbuse.Problem.Swearing",
	[t.PlayerVoiceAbuseTypes.Username] = "Feature.ReportAbuse.ProblemSurface.Username",
	[t.PlayerVoiceAbuseTypes.Bullying] = "Feature.ReportAbuse.Problem.Bullying",
	[t.PlayerVoiceAbuseTypes.Scamming] = "Feature.ReportAbuse.Problem.Scamming",
	[t.PlayerVoiceAbuseTypes.Dating] = "Feature.ReportAbuse.Problem.Dating",
	[t.PlayerVoiceAbuseTypes.Cheating] = "Feature.ReportAbuse.Problem.Cheating",
	[t.PlayerVoiceAbuseTypes.Personal] = "Feature.ReportAbuse.Problem.Personal",
	ReasonForAbuse = "Feature.SettingsHub.Label.ReasonForAbuse",
	AttachScreenshot = "Feature.SettingsHub.Label.AttachScreenshot",
	SceneCaptured = "Feature.SettingsHub.Label.SceneCaptured",
	CaptureScene = "Feature.SettingsHub.Action.CaptureScene",
	MethodOfAbuse = "Feature.SettingsHub.Label.MethodOfAbuse",
	WhichChat = "Feature.SettingsHub.Label.WhichChatOptional",
	WhichPerson = "Feature.SettingsHub.Label.WhichPlayer",
	ChooseOne = "Feature.SettingsHub.Label.ChooseOne",
	ReportCommentPlaceholder = "Feature.SettingsHub.Label.ReportComment",
	SubmitButton = "Feature.ReportAbuse.Action.Submit",
	FooterInformation1 = "Feature.ReportAbuse.Message.OSACopy1",
	FooterInformation2 = "Feature.ReportAbuse.Message.ReportInformationCopy"
}
t.InitialIdentificationResults = {
	identifiedAvatars = {},
	identifiedAds = {},
	avatarIDStats = { totalPlayers = 0, checkedPlayers = 0, duration = 0 },
	adIDStats = { totalPlayers = 0, checkedPlayers = 0, duration = 0 }
}
t.ReportAnythingInitialState = {
	screenshotId = "",
	screenshotContentId = "",
	attachCompleted = false,
	identificationResults = t.InitialIdentificationResults,
	annotationPoints = {}
}
t.AnalyticsInitialState = {
	menuEverShown = false,
	menuOpenedUnixTimestampMilliseconds = 0,
	experiencePersonChangeCount = 0,
	typeofabuseChangeCount = 0,
	personChangeCount = 0,
	reasonChangeCount = 0,
	captureSceneCount = 0,
	chatLineChangeCount = 0,
	viewportSizeX = -1,
	viewportSizeY = -1,
	isPortraitMode = false,
	isSubmissionCompleted = false,
	typeofabuseSelection = nil,
	reasonSelection = nil,
	commentAdded = false,
	experiencePersonSelection = nil,
	memoryRequirementMet = -1
}
t.AnalyticsPersonInitialSelections = {
	typeofabuseSelection = nil,
	reasonSelection = nil,
	commentAdded = false,
	experiencePersonSelection = string.lower(t.ReportTypes.Person)
}
t.AnalyticsExpeirenceInitialSelections = {
	commentAdded = false,
	typeofabuseSelection = t.AnalyticsAbuseMethods.Game,
	reasonSelection = t.InappropriateContentAbuseReason,
	experiencePersonSelection = string.lower(t.ReportTypes.Experience)
}
t.AbuseVector = { Voice = "voice" }
t.MenuItemHeight = 42
t.MenuItemHeightTight = 36
t.FreeCommentsMenuItemHeight = 60
t.FieldLabelSize = 18
t.LeftContainerWidth = 240
t.RightContainerWidth = 300
t.MenuItemDynamicWidthOffset = 100
t.FieldLabelSizeSmall = 16
t.LeftContainerWidthSmall = 100
t.RightContainerWidthSmall = 180
t.SmallLayoutThreshold = 540
t.ReportMenuFontStyle = "Header1"
t.ReportMenuButtonSize = 36
t.ReportMenuButtonSizeConsole = 48
t.InitPersonUIState = {
	comment = "",
	menuContainerWidth = 0,
	allegedAbuserId = nil,
	allegedAbuser = nil,
	abuseReason = nil,
	methodOfAbuse = nil,
	isVoiceEnabled = nil,
	menuOpenedUnixTimestampMilliseconds = nil,
	modalSelectorCellData = nil,
	isModalSelectorShown = nil,
	preselectedPlayer = nil,
	selectedMessage = nil,
	reportType = t.ReportTypes.Person,
	playerObjects = {},
	orderedMessages = {}
}
t.InitExperienceUIState = {
	comment = "",
	menuContainerWidth = 0,
	reportType = t.ReportTypes.Experience,
	abuseReason = t.InappropriateContentAbuseReason
}
t.ChatLineReportingVariant = { IGM_CLRv1 = "IGM_CLRv1" }

return t