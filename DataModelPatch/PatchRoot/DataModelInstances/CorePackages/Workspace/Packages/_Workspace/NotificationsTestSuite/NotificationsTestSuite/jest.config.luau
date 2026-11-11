local Parent = script.Parent.Parent

return {
	projects = {
		require(Parent.GameInvite)["jest.config"],
		require(Parent.NotificationsCommon)["jest.config"],
		require(Parent.ToastNotification)["jest.config"],
		require(Parent.StreamNotifications)["jest.config"],
		require(Parent.NotificationModalsManager)["jest.config"],
		require(Parent.NotificationsUpsell)["jest.config"]
	}
}