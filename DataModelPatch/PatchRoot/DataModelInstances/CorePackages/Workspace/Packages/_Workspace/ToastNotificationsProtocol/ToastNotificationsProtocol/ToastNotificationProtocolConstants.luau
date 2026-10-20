local MessageBusService = game:GetService("MessageBusService")

return {
	PROTOCOL_NAME = "ToastNotifications",
	MESSAGE_INIT_TOAST_NOTIF = MessageBusService:GetMessageId("ToastNotifications", "initializeToastNotifications"),
	MESSAGE_GET_TOAST_NOTIF = MessageBusService:GetMessageId("ToastNotifications", "getToastNotification"),
	MESSAGE_UPDATE_TOAST_NOTIF = MessageBusService:GetMessageId("ToastNotifications", "updateToastNotificationState"),
	MESSAGE_DISMISS_TOAST_NOTIF = MessageBusService:GetMessageId("ToastNotifications", "dismissToastNotification"),
	MESSAGE_DISPLAY_TOAST_NOTIF = MessageBusService:GetMessageId("ToastNotifications", "displayToastNotification")
}