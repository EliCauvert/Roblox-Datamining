return {
	TopBannerSize = 48,
	IconButtonSize = 48,
	IconButtonPositionXOffset = -48,
	IconButtonPositionYOffset = -8,
	FrameSizeXScale = 0.5,
	FrameSizeXOffset = 100,
	FramePositionXOffset = -16,
	FramePositionYOffset = -8,
	FramePositionXOffsetLeft = -24,
	ContextualMenuBorderRadius = 8,
	SelectableChatLineHeight = 48,
	SelectableChatLinePadding = 16,
	SelectableIconWidth = 48,
	SelectableLineScrollbarOffset = 48,
	VerbatimHeight = 90,
	ViewportSize = 10000,
	SelectionModalScreenSizeOffset = 100,
	SelectionModalRadioGroupOffset = 24,
	SelectionModalPositionOffset = 4,
	SelectionModalCanvasPositionTopPadding = 9223372036854775808,
	SuccessfulMuteKey = "CoreScripts.TextChat.Mute.Success",
	ErrorSelfMuteKey = "CoreScripts.TextChat.Mute.Error.CannotMuteSelf",
	ErrorDoesNotExistKey = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist",
	ToastIconImageSuccess = "icons/status/success_large",
	ToastIconImageError = "icons/status/error_large",
	ReportSteps = { SELECT = 1, SUBMIT = 2, COMPLETE = 3 },
	VerbatimStrokeTransparency = 0.8,
	ChannelTypes = {
		General = "RBXGeneral",
		Whisper = "RBXWhisper",
		System = "RBXSystem"
	},
	ChatLineLocalizationKeys = {
		ChatSelectionModalTitle = "Feature.ReportAbuse.Label.SelectChatLine",
		ChatSelectionModalButton = "Feature.ReportAbuse.Action.ContinueReport",
		ChatEyebrowSentPrivately = "Feature.ReportAbuse.Label.SentPrivately",
		ChatEyebrowSentInAnotherChat = "Feature.ReportAbuse.Label.SentInAnotherChat",
		ChatToastDescriptionSuccess = "Feature.ReportAbuse.Message.UserTextMuted",
		ChatToastDescriptionErrorSelf = "Feature.ReportAbuse.Message.UserTextMutedErrorSelf",
		InfoTextKey = "Feature.ReportAbuse.Message.ChatLineReportingInfoText"
	},
	GenericAbuseReportingLocalizationKeys = {
		formTitle = "Feature.ReportAbuse.Label.FinishChatReport",
		completeTitle = "Feature.ReportAbuse.Label.ReportSubmitted",
		completeDescription = "Feature.ReportAbuse.Message.ThankYouReport",
		completeClose = "Feature.ReportAbuse.Action.ReturnToExperience"
	},
	SubmitDialogLocalizationKeys = { formTitle = "Feature.ReportAbuse.Label.FinishChatReport" },
	CompleteDialogLocalizationKeys = {
		completeTitle = "Feature.ReportAbuse.Label.ReportSubmitted",
		completeDescription = "Feature.ReportAbuse.Message.ThankYouReport",
		completeClose = "Feature.ReportAbuse.Action.ReturnToExperience"
	},
	ChatLineReportCategories = {
		{
			localizationKey = "Feature.ReportAbuse.Problem.Bullying",
			value = "Bullying",
			descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Bullying"
		},
		{
			localizationKey = "Feature.ReportAbuse.Problem.Cheating",
			value = "Cheating",
			descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Cheating"
		},
		{
			localizationKey = "Feature.ReportAbuse.Problem.Dating",
			value = "Dating",
			descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Dating"
		},
		{
			localizationKey = "Feature.ReportAbuse.Problem.Hate",
			value = "Hate",
			descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Hate"
		},
		{
			localizationKey = "Feature.ReportAbuse.Problem.Links",
			value = "Links",
			descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Links"
		},
		{
			localizationKey = "Feature.ReportAbuse.Problem.Personal",
			value = "Personal",
			descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Personal"
		},
		{
			localizationKey = "Feature.ReportAbuse.Problem.Scamming",
			value = "Scamming",
			descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Scamming"
		},
		{
			localizationKey = "Feature.ReportAbuse.Problem.Spamming",
			value = "Spamming",
			descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Spamming"
		},
		{
			localizationKey = "Feature.ReportAbuse.Problem.Swearing",
			value = "Swearing",
			descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Swearing"
		},
		{
			localizationKey = "Feature.ReportAbuse.Problem.Violence",
			value = "Violence",
			descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Violence"
		}
	},
	AnalyticsActions = {
		SetPlaceId = "SetPlaceId",
		AccumulateForTimeSpent = "AccumulateForTimeSpent",
		SetReasonSelection = "SetReasonSelection",
		SetCommentAdded = "SetCommentAdded",
		SetChatLineSelected = "SetChatLineSelected",
		SetChatHistoryInformation = "SetChatHistoryInformation",
		SetViewportInformation = "SetViewportInformation"
	},
	AnalyticsInitialState = {
		interaction_type = 0,
		context = "ReportViaChatLine",
		event_type = "ReportViaChatLine",
		place_id = 0,
		accumulated_time_ms = 0,
		reason_selection = "",
		comment_added = false,
		chat_line_selected = false,
		selected_chat_line_index = 0,
		selectable_chat_history_size = 0,
		total_chat_history_size = 0,
		num_non_general_channel_chats = 0,
		mute_button_clicked = false,
		viewport_size_x = 0,
		viewport_size_y = 0,
		is_portrait_mode = false
	}
}