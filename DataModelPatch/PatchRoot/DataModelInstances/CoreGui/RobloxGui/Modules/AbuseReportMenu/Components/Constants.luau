local _ = require(script:FindFirstAncestor("AbuseReportMenu").Components.Types)
local ConstantsModule = {
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
ConstantsModule.AbuseMethodToVectorMapping = {
	[ConstantsModule.AbuseMethods.TextChat] = "chat",
	[ConstantsModule.AbuseMethods.VoiceChat] = "voice",
	[ConstantsModule.AbuseMethods.Other] = "other",
	[ConstantsModule.AbuseMethods.Avatar] = "avatar"
}
ConstantsModule.AnalyticsAbuseMethods = {
	Chat = "Chat",
	Voice = "Voice",
	Other = "Other",
	Game = "Game"
}
ConstantsModule.AbuseMethodToAnalyticsMapping = {
	[ConstantsModule.AbuseMethods.TextChat] = ConstantsModule.AnalyticsAbuseMethods.Chat,
	[ConstantsModule.AbuseMethods.VoiceChat] = ConstantsModule.AnalyticsAbuseMethods.Voice,
	[ConstantsModule.AbuseMethods.Other] = ConstantsModule.AnalyticsAbuseMethods.Other,
	[ConstantsModule.AbuseMethods.Avatar] = ConstantsModule.AnalyticsAbuseMethods.Other
}
ConstantsModule.AbuseMethodSublabel = {
	TextChat = "This person typed a mean word in text chat",
	VoiceChat = "This person was screaming on top of their lungs",
	Other = "This person is following me, wearing a bad shirt, etc.",
	Avatar = "This person's avatar is wearing offensive clothing"
}
ConstantsModule.PlayerMenuActions = {
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
ConstantsModule.ReportAnythingActions = {
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
ConstantsModule.AnalyticsActions = {
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
ConstantsModule.ReportSuccessToast = {
	ReportAnythingGeneric = "We’ve received your report and will take action soon if needed. Your feedback helps keep our community safe.",
	ChatGeneric = "Thanks for your report! Our moderators will review the chat logs and evaluate what happened.",
	Cheating = "Thanks for your report! We've recorded your report for evaluation.",
	BadUserName = "Thanks for your report! Our moderators will evaluate the username.",
	Place = "Thanks for your report! Our moderators will review the place and make a determination."
}
ConstantsModule.localizationKeys = {
	ReportType = "Feature.ReportAbuse.Label.ReportType",
	Person = "Feature.ReportAbuse.Label.Person",
	Experience = "Feature.ReportAbuse.Label.Experience",
	SelectInScene = "Feature.ReportAbuse.Action.SelectInScene",
	BuildAReport = "Feature.ReportAbuse.Action.BuildAReport",
	[ConstantsModule.AbuseMethods.TextChat] = "Feature.ReportAbuse.Label.TextChat",
	[ConstantsModule.AbuseMethods.VoiceChat] = "Feature.SettingsHub.MethodOfAbuse.VoiceChat.Title",
	[ConstantsModule.AbuseMethods.Other] = "Feature.SettingsHub.MethodOfAbuse.Other.Title",
	[ConstantsModule.AbuseMethods.Avatar] = "Feature.ReportAbuse.Label.Avatar",
	[ConstantsModule.InappropriateContentAbuseReason] = "Feature.ReportAbuse.Label.Content",
	[ConstantsModule.PlayerAbuseTypes.Swearing] = "Feature.ReportAbuse.Problem.Swearing",
	[ConstantsModule.PlayerAbuseTypes.Username] = "Feature.ReportAbuse.ProblemSurface.Username",
	[ConstantsModule.PlayerAbuseTypes.Bullying] = "Feature.ReportAbuse.Problem.Bullying",
	[ConstantsModule.PlayerAbuseTypes.Scamming] = "Feature.ReportAbuse.Problem.Scamming",
	[ConstantsModule.PlayerAbuseTypes.Dating] = "Feature.ReportAbuse.Problem.Dating",
	[ConstantsModule.PlayerAbuseTypes.Cheating] = "Feature.ReportAbuse.Problem.Cheating",
	[ConstantsModule.PlayerAbuseTypes.Personal] = "Feature.ReportAbuse.Problem.Personal",
	[ConstantsModule.PlayerAbuseTypes.Links] = "Feature.ReportAbuse.Problem.Links",
	[ConstantsModule.PlayerVoiceAbuseTypes.Swearing] = "Feature.ReportAbuse.Problem.Swearing",
	[ConstantsModule.PlayerVoiceAbuseTypes.Username] = "Feature.ReportAbuse.ProblemSurface.Username",
	[ConstantsModule.PlayerVoiceAbuseTypes.Bullying] = "Feature.ReportAbuse.Problem.Bullying",
	[ConstantsModule.PlayerVoiceAbuseTypes.Scamming] = "Feature.ReportAbuse.Problem.Scamming",
	[ConstantsModule.PlayerVoiceAbuseTypes.Dating] = "Feature.ReportAbuse.Problem.Dating",
	[ConstantsModule.PlayerVoiceAbuseTypes.Cheating] = "Feature.ReportAbuse.Problem.Cheating",
	[ConstantsModule.PlayerVoiceAbuseTypes.Personal] = "Feature.ReportAbuse.Problem.Personal",
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
ConstantsModule.InitialIdentificationResults = {
	identifiedAvatars = {},
	identifiedAds = {},
	avatarIDStats = { totalPlayers = 0, checkedPlayers = 0, duration = 0 },
	adIDStats = { totalPlayers = 0, checkedPlayers = 0, duration = 0 }
}
ConstantsModule.ReportAnythingInitialState = {
	screenshotId = "",
	screenshotContentId = "",
	attachCompleted = false,
	identificationResults = ConstantsModule.InitialIdentificationResults,
	annotationPoints = {}
}
ConstantsModule.AnalyticsInitialState = {
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
ConstantsModule.AnalyticsPersonInitialSelections = {
	typeofabuseSelection = nil,
	reasonSelection = nil,
	commentAdded = false,
	experiencePersonSelection = string.lower(ConstantsModule.ReportTypes.Person)
}
ConstantsModule.AnalyticsExpeirenceInitialSelections = {
	commentAdded = false,
	typeofabuseSelection = ConstantsModule.AnalyticsAbuseMethods.Game,
	reasonSelection = ConstantsModule.InappropriateContentAbuseReason,
	experiencePersonSelection = string.lower(ConstantsModule.ReportTypes.Experience)
}
ConstantsModule.AbuseVector = { Voice = "voice" }
ConstantsModule.MenuItemHeight = 42
ConstantsModule.MenuItemHeightTight = 36
ConstantsModule.FreeCommentsMenuItemHeight = 60
ConstantsModule.FieldLabelSize = 18
ConstantsModule.LeftContainerWidth = 240
ConstantsModule.RightContainerWidth = 300
ConstantsModule.MenuItemDynamicWidthOffset = 100
ConstantsModule.FieldLabelSizeSmall = 16
ConstantsModule.LeftContainerWidthSmall = 100
ConstantsModule.RightContainerWidthSmall = 180
ConstantsModule.SmallLayoutThreshold = 540
ConstantsModule.ReportMenuFontStyle = "Header1"
ConstantsModule.ReportMenuButtonSize = 36
ConstantsModule.ReportMenuButtonSizeConsole = 48
ConstantsModule.InitPersonUIState = {
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
	reportType = ConstantsModule.ReportTypes.Person,
	playerObjects = {},
	orderedMessages = {}
}
ConstantsModule.InitExperienceUIState = {
	comment = "",
	menuContainerWidth = 0,
	reportType = ConstantsModule.ReportTypes.Experience,
	abuseReason = ConstantsModule.InappropriateContentAbuseReason
}
ConstantsModule.ChatLineReportingVariant = { IGM_CLRv1 = "IGM_CLRv1" }

return ConstantsModule