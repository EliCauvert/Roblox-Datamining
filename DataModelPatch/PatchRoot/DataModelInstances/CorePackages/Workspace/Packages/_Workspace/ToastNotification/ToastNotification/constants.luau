return {
	DefaultContentPadding = 8,
	DefaultTextContentPadding = 4,
	DefaultButtonHeight = 36,
	DisplayNotificationDelay = 1,
	DefaultNotificationDisplayTime = 4,
	DefaultNotificationDisplayTimeOnUnpause = 2,
	MenuButtonPressHoldTime = 1,
	MenuButtonPressResetTime = 0.5,
	InAppToastWidth = 400,
	InExperienceToastWidth = 300,
	FullWidthDeviceThreshold = 500,
	CompactCardThreashold = 900,
	DeliveryChannel = "Toast",
	SIGNAL_HOLD_INTENT_SECONDS = 0.25,
	SIGNAL_HOLD_COMPLETE_SECONDS = 0.75,
	Padding = { CompactCardPadding = 12, DefaultCardPadding = 12 },
	CardTopMargin = { App = 68, Experience = 12 },
	FRRToastPosition = {
		NotificationFrameTopScale = 0.5,
		NotificationFrameHeightScale = 0.42,
		NotificationRightInset = 4
	},
	DefaultCardCornerRadius = UDim.new(0, 8),
	DefaultCardCloseButtonCornerRadius = UDim.new(0, 4),
	CardTransparency = { Default = 0, Compact = 0.1 },
	CardSizeDefault = { thumbnail = 40, closeButton = 22, closeIcon = 16 },
	CardSizeCompact = { thumbnail = 40, closeButton = 22, closeIcon = 16 },
	Destinations = { App = "InApp", Experience = "InExperience" },
	ToastStructuralIdentifier = {
		Level1 = "level1",
		ToastNotification = "toastNotification"
	}
}