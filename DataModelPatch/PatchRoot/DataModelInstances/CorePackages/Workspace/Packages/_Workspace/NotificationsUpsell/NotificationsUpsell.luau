return {
	["jest.config"] = script["jest.config"],
	setupNotificationsUpsell = require(script.setupNotificationsUpsell),
	setupPushNotificationsUpsell = require(script.setupPushNotificationsUpsell),
	NotificationsUpsellConstants = require(script.NotificationsUpsellConstants),
	ModalEventConstants = require(script.Analytics.ModalEventConstants),
	PushUpsellEventConfig = require(script.Analytics.RobloxTelemetryConfigs.PushUpsellEventName)
}