return {
	dependencies = require(script.dependencies),
	["jest.config"] = script["jest.config"],
	renderToastNotificationContainer = require(script.renderToastNotification),
	ToastNotificationWrapper = require(script.ToastNotificationWrapper),
	AppToastNotificationContainer = require(script.AppToastNotificationContainer),
	ToastNotificationSnoozeManager = require(script.ToastNotificationSnoozeManager),
	ToastNotificationTypeModule = require(script.type),
	LifecycleEvents = require(script.utils.LifecycleEvents),
	Signals = require(script.Signals),
	ToastNotificationConstants = require(script.constants),
	NotificationGroups = require(script.NotificationGroups)
}