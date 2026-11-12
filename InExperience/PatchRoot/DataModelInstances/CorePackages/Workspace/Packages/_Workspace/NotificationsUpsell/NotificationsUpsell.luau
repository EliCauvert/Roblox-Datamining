return {
	["jest.config"] = script["jest.config"],
	setupNotificationsUpsell = require(script.setupNotificationsUpsell),
	setupPushNotificationsUpsell = require(script.setupPushNotificationsUpsell),
	NotificationsUpsellConstants = require(script.NotificationsUpsellConstants),
	ModalEventConstants = require(script.Analytics.ModalEventConstants),
	PushUpsellEventConfig = require(script.Analytics.RobloxTelemetryConfigs.PushUpsellEventName),
	requestPushNotificationPermission = require(script.requestPushNotificationPermission),
	NativePushNotificationPermissionPrompt = require(script.NativePushNotificationPermissionPrompt),
	ChatPushUpsellLegacyPrompt = if require(script.Parent.SharedFlags).FFlagChatPushUpsellPromptsEnabled then require(script.ChatPushUpsellLegacyPrompt) else nil,
	PushPermissionClientAttributes = require(script.PushPermissionClientAttributes.buildPushPermissionClientAttributes),
	usePushPermissionClientAttributes = require(script.PushPermissionClientAttributes.usePushPermissionClientAttributes)
}