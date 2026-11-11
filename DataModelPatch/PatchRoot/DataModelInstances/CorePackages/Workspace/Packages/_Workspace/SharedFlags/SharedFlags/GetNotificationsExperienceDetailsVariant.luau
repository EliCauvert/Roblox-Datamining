game:DefineFastString("ExperienceDetailsLayer", "PlayerApp.GameDetailsPage")
game:DefineFastString("NotificationsOptInImprovementsFieldName", "enable_edp_notifications_opt_in")

return {
	getNotificationsVariantFieldName = game:GetFastString("NotificationsOptInImprovementsFieldName")
}