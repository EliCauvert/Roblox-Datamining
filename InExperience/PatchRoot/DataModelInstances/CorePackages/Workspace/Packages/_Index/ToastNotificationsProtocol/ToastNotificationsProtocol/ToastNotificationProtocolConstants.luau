local messageBusService = game:GetService("MessageBusService")

return {
	PROTOCOL_NAME = "ToastNotifications",
	MESSAGE_INIT_TOAST_NOTIF = messageBusService:GetMessageId("ToastNotifications", "initializeToastNotifications"),
	MESSAGE_GET_TOAST_NOTIF = messageBusService:GetMessageId("ToastNotifications", "getToastNotification"),
	MESSAGE_UPDATE_TOAST_NOTIF = messageBusService:GetMessageId("ToastNotifications", "updateToastNotificationState"),
	MESSAGE_DISMISS_TOAST_NOTIF = messageBusService:GetMessageId("ToastNotifications", "dismissToastNotification"),
	MESSAGE_DISPLAY_TOAST_NOTIF = messageBusService:GetMessageId("ToastNotifications", "displayToastNotification")
}