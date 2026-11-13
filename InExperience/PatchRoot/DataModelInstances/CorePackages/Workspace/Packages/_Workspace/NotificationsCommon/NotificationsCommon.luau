local _ = require(script.type)

return {
	dependencies = require(script.dependencies),
	["jest.config"] = script["jest.config"],
	ReducerDependencies = require(script.utils.ReducerDependencies),
	LocalizationHelper = require(script.utils.StringLocalizationHelper),
	DeeplinkConfirmationModal = require(script.components.DeeplinkConfirmationModal),
	JoinExperience = require(script.JoinExperience),
	DeeplinkTapListeners = require(script.DeeplinkTapListeners),
	useDeeplinkTapListener = require(script.useDeeplinkTapListener),
	Debounce = require(script.utils.debounce),
	Throttle = require(script.utils.throttle),
	DeviceInfo = require(script.utils.deviceInfo),
	NotificationCardProvider = require(script.context.NotificationCardProvider),
	NotificationCard = require(script.components.NotificationCard),
	NotificationHelper = require(script.utils.NotificationHelper),
	type = require(script.type),
	constants = require(script.constants),
	FFlagNotificationThumbnailUseProfileFrameThumbnail = require(script.Flags.FFlagNotificationThumbnailUseProfileFrameThumbnail),
	FFlagNotificationDeeplinkTapListenersEnabled = require(script.Flags.FFlagNotificationDeeplinkTapListenersEnabled),
	ixpHelper = require(script.utils.ixpHelper),
	sendEventDeferred = require(script.analytics.sendEventDeferred),
	GetGameInvitesStatusStore = require(script.Stores.GetGameInvitesStatusStore)
}